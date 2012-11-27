#!/usr/bin/perl

our $VERSION = 3.1.00;
use warnings;
use strict;

use Apache::Request();
use DBI();

#subs Modules
use BWCL::ShowAdmin qw(ShowTables ShowColumns error_message);
use BWCL::InsertRecord_B qw(InsertRecordGroup InsertRecordGroupForm);
use BWCL::SelectTable_B qw(PrepareHead SelectTable);
use BWCL::RecordUpdates_B qw(UpdateRecordForm UpdateRecord DeleteDuplicates);
use BWCL::ViewRecords_B qw(ViewRecords);
use Config::Std;

#######################################################################
##		Connect to Database

my $filename = 'Products.cfg';
my $config_hash_ref;
read_config($filename => $config_hash_ref);

my $r = Apache->request;
my $q = Apache::Request->new(
    $r,
    POST_MAX        => 100000,
    DISABLE_UPLOADS => 1
);

my $dbh
    = DBI->connect( "DBI:Pg:dbname=$config_hash_ref->{'Database'}{'database'};host=$config_hash_ref->{'Database'}{'hostname'};port=$config_hash_ref->{'Database'}{'port'}",
    $config_hash_ref->{'Database'}{'username'}, $config_hash_ref->{'Database'}{'password'}, { 'RaiseError' => 1, pg_enable_utf8 => $config_hash_ref->{'Database'}{'pg_enable_utf8'} } );
$config_hash_ref->{dbh} = $dbh;
$config_hash_ref->{r} = $r;
$config_hash_ref->{q} = $q;
my $sth;
my $statement;
my $rc;
my $tbl;

## Note: Nonpersistent Database connection in a Persistent Environment is as Follows:
##my $dbh = DBI->connect("DBI:Pg:dbname=$database;host=$hostname;port=5432",
#$username, $password, {'RaiseError' => 1, dbi_connect_method => 'connect'});

my $commands = $config_hash_ref->{'Commands'}{'commands'};
##	This gives preset filled select lists for "preferred" fields.
##	Is an array of arrays. field,table pairs
##	Is designed to works with odd numbers due to table cells.
##	Not sure if it will work with no fields at all
my @field_select_tables = (
    [ "class"                          => "products" ],
    [ "subclass"                       => "products" ],
    [ "full_assembly_list_category"    => "full_assembly_list" ],
    [ "full_assembly_list_subcategory" => "full_assembly_list" ],
    [ "vendor_name"                    => "vendors" ],
);
#######################################################################
##		Print Header

$r->content_type("text/html");
$r->send_http_header;
my $lang 
    = $q->param("lang")
    || $r->headers_in->get('Accept-Language')
    || "en";

$lang = substr $lang, 0, 2;

$config_hash_ref->{lang} = $lang;
my $title = "Product Assembly DB";
my $description
    = "Database Access
    Vendors Products Customers Jobsites Assemblies Full Assemblies";
$config_hash_ref->{title} = $title;
$config_hash_ref->{description} = $description;
$config_hash_ref->{field_table_aref}      = \@field_select_tables;

PrepareHead( $config_hash_ref );

#######################################################################
##		Get CGI Params

my $command = $q->param("command")
    || goto ERROR_END;
unless ($command~~@$commands) {
    error_message($r, $lang, "un comando valido", "a valid command");
    goto ERROR_END;
}
my $table_selected = $q->param("table_selected")
    || goto ERROR_END;
$config_hash_ref->{table_selected} = $table_selected;
my $class_selected        = $q->param("class_selected")        || 'All';
my $subclass_selected     = $q->param("subclass_selected")     || 'All';
my $vendor_name_selected  = $q->param("vendor_name_selected")  || 'All';
my $id_selected           = $q->param("id_selected")           || '';
my $field_selected        = $q->param("field_selected")        || '';
my $field_value_selected  = $q->param("field_value_selected")  || '';
my $field_selected2       = $q->param("field_selected2")       || '';
my $field_value_selected2 = $q->param("field_value_selected2") || '';
$config_hash_ref->{itemstoinsert} = $q->param("itemstoinsert") || '';
my $full_assembly_list_category_selected
    = $q->param("full_assembly_list_category_selected") || 'All';
my $full_assembly_list_subcategory_selected
    = $q->param("full_assembly_list_subcategory_selected") || 'All';

#######################################################################
##		Table Verification
$table_selected = $dbh->quote($table_selected);
$statement
    = "SELECT DISTINCT table_name FROM information_schema.tables WHERE
    table_name = $table_selected AND table_schema = 'public' AND
    table_type='BASE TABLE';";
$sth = $dbh->prepare($statement) || die $dbh->errstr;
$rc  = $sth->execute             || die $dbh->errstr;
$tbl = $sth->fetchrow_arrayref;
$sth->finish();
unless ( $$tbl[0] ) {
    error_message($r, $lang, "una tabla valida", "a valid table");
    goto ERROR_END;
}
#######################################################################
##		Class Verification
unless ( $class_selected eq "All" ) {
    my $class_selected2 = $dbh->quote($class_selected);
    $statement = "SELECT $class_selected2 FROM products;";
    $sth       = $dbh->prepare($statement) || die $dbh->errstr;
    $rc        = $sth->execute             || die $dbh->errstr;
    $tbl       = $sth->fetchrow_arrayref;
    $sth->finish();
    unless ( $$tbl[0] ) {
        error_message($r, $lang, "una clase valida", "a valid class");
        goto ERROR_END;
    }
}
#######################################################################
##		Subclass Verification
unless ( $subclass_selected eq "All" ) {
    my $subclass_selected2 = $dbh->quote($subclass_selected);
    $statement = "SELECT $subclass_selected2 FROM products;";
    $sth       = $dbh->prepare($statement) || die $dbh->errstr;
    $rc        = $sth->execute             || die $dbh->errstr;
    $tbl       = $sth->fetchrow_arrayref;
    $sth->finish();
    unless ( $$tbl[0] ) {
        error_message($r, $lang, "una subclase valida",
            "a valid subclass");
        goto ERROR_END;
    }
}
#######################################################################
##		Vendor Name Verification
unless ( $vendor_name_selected eq "All" ) {
    my $vendor_name_selected2 = $dbh->quote($vendor_name_selected);
    $statement = "SELECT $vendor_name_selected2 FROM vendors;";
    $sth       = $dbh->prepare($statement) || die $dbh->errstr;
    $rc        = $sth->execute             || die $dbh->errstr;
    $tbl       = $sth->fetchrow_arrayref;
    $sth->finish();
    unless ( $$tbl[0] ) {
        error_message($r, $lang, "un vendor valido", "a valid vendor");
        goto ERROR_END;
    }
}
#######################################################################
##		Full Assembly List Category Verification
unless ( $full_assembly_list_category_selected eq "All" ) {
    my $full_assembly_list_category_selected2
        = $dbh->quote($full_assembly_list_category_selected);
    $statement = "SELECT $full_assembly_list_category_selected2
               FROM full_assembly_list;";
    $sth       = $dbh->prepare($statement) || die $dbh->errstr;
    $rc        = $sth->execute             || die $dbh->errstr;
    $tbl       = $sth->fetchrow_arrayref;
    $sth->finish();
    unless ( $$tbl[0] ) {
        error_message($r, $lang,
            "una categoria de full assembly list valida",
            "a valid full assembly list category");
        goto ERROR_END;
    }
}
#######################################################################
##		Full Assembly List Subcategory Verification
unless ( $full_assembly_list_subcategory_selected eq "All" ) {
    my $full_assembly_list_subcategory_selected2
        = $dbh->quote($full_assembly_list_subcategory_selected);
    $statement = "SELECT $full_assembly_list_subcategory_selected2
               FROM full_assembly_list;";
    $sth       = $dbh->prepare($statement) || die $dbh->errstr;
    $rc        = $sth->execute             || die $dbh->errstr;
    $tbl       = $sth->fetchrow_arrayref;
    $sth->finish();
    unless ( $$tbl[0] ) {
        error_message($r, $lang,
            "una subcategoria de full assembly list valida",
            "a valid full assembly list subcategory");
        goto ERROR_END;
    }
}

#######################################################################
##		ID Selected Verification
if ( $command eq "UpdateRecordForm" && $id_selected !~ /^\d+$/ ) {
    error_message($r, $lang, "un numero de ID valido",
        "a valid ID number");
    goto ERROR_END;
}
#######################################################################
##		Items to Insert Verification
if ( $command eq "InsertRecordForm" && $config_hash_ref->{itemstoinsert} !~ /^\d+$/ ) {
    error_message($r, $lang, "un numero de unidades para insertar",
        "a number of items to insert");
    goto ERROR_END;
}
#######################################################################
##		Field Selected Verification
    if ($field_selected) {
       $field_selected
        = $dbh->quote($field_selected);
        $statement = "SELECT (SELECT DISTINCT column_name FROM information_schema.columns WHERE table_name = $table_selected AND column_name = $field_selected);";
    $sth = $dbh->prepare($statement) || die $dbh->errstr;
    $rc  = $sth->execute             || die $dbh->errstr;
    $tbl = $sth->fetchrow_arrayref;
    $sth->finish();
    unless ( $$tbl[0] ) {
        error_message($r, $lang, "un campo primero valido", "a valid first field");
        goto ERROR_END;
    }
}
#######################################################################
##		Field Selected2 Verification
if ($field_selected2) {
       $field_selected2
        = $dbh->quote($field_selected2);
        $statement = "SELECT (SELECT DISTINCT column_name FROM information_schema.columns WHERE table_name = $table_selected AND column_name = $field_selected2);";
    $sth = $dbh->prepare($statement) || die $dbh->errstr;
    $rc  = $sth->execute             || die $dbh->errstr;
    $tbl = $sth->fetchrow_arrayref;
    $sth->finish();
    unless ( $$tbl[0] ) {
        error_message($r, $lang, "un segunda columna valida", "a valid second column");
        goto ERROR_END;
    }
}
#######################################################################
##		Select a Sub


if ( $command eq "DeleteDuplicates" && $table_selected ne "products" ) {
    error_message($r, $lang, "la tabla products solamente",
        "only the products table");
    goto ERROR_END;
}

    $dbh->{AutoCommit} = 0;
    my $sub = \&{"$command"};
    &$sub( $config_hash_ref );
    $dbh->commit();
    $dbh->{AutoCommit} = 1;

#######################################################################
##		Call SelectTable
ERROR_END:
SelectTable( $config_hash_ref );
$dbh->disconnect;


=pod

=head1 NAME

pg_wmod-B.pl

=head1 VERSION

This documentation refers to pg.pl version 3.1.00.

=head1 SYNOPSIS

Hands off commands to appropriate modules.

=head1 DESCRIPTION

Hands off commands to appropriate modules of vendor, customer, jobsite,
product and assembly database. Performs some error corrections.
Basic Spanish error messages are included.
These can easily be changed to support another language.

=head1 BUGS AND LIMITATIONS

Please report problems to Chris Bennett (chris@bennettconstruction.us)

Patches are welcome.

=head1 AUTHOR

Chris Bennett  (chris@bennettconstruction.us)

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2012 Chris Bennett (chris@bennettconstruction.us).

Permission to use, copy, modify, and distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

=cut

