#!/usr/bin/perl

our $VERSION = 2.0.00;
use warnings;
use strict;

use Apache::Request();
use DBI();

#subs Modules
use BWC::ShowAdmin qw(ShowTables ShowColumns);
use BWC::InsertRecord_B qw(InsertRecordGroup InsertRecordGroupForm);
use BWC::SelectTable_B qw(PrepareHead SelectTable);
use BWC::RecordUpdates_B qw(UpdateRecordForm UpdateRecord DeleteDuplicates);
use BWC::ViewRecords_B qw(ViewRecords);

#######################################################################
##		Connect to Database

my $username = 'bencon';
my $password = 'L59mEq89Pn';
my $database = 'vp';
my $hostname = '127.0.0.1';

my $r = Apache->request;
my $q = Apache::Request->new(
    $r,
    POST_MAX        => 100000,
    DISABLE_UPLOADS => 1
);

my $dbh
    = DBI->connect( "DBI:Pg:dbname=$database;host=$hostname;port=5432",
    $username, $password, { 'RaiseError' => 1, pg_enable_utf8 => 1 } );

my $sth;
my $statement;
my $rc;
my $tbl;
## Note: Nonpersistent Database connection in a Persistent Environment is as Follows:
##my $dbh = DBI->connect("DBI:Pg:dbname=$database;host=$hostname;port=5432",
#$username, $password, {'RaiseError' => 1, dbi_connect_method => 'connect'});

my $program = "/perl/VP/pg.pl";

##	This gives preset filled select lists for "preferred" fields.
##	Is an array of arrays. field,table pairs
##	Is designed to works with odd numbers due to table cells.
##	Not sure if it will work with no fields at all
my @field_select_tables = (
    [ "class",                       "products" ],
    [ "subclass",                    "products" ],
    [ "vendor_name",                 "vendors" ],
    [ "full_assembly_name",          "full_assembly" ],
    [ "full_assembly_list_category", "full_assembly_list" ],
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

my $title = "Product Assembly DB";
my $description
    = "Database Access-Vendors/Products/Customers/Jobsites/Purchases/Assemblies/Full Assemblies";

PrepareHead( $r, $dbh, $program, $title, $description, $lang );

#######################################################################
##		Get CGI Params

my $class_selected       = $q->param("class_selected")         || 'All';
my $subclass_selected    = $q->param("subclass_selected")      || 'All';
my $vendor_name_selected = $q->param("vendor_name_selected")   || 'All';
my $table_selected = $q->param("table_selected")               || goto ERROR_END;
my $id_selected    = $q->param("id_selected")                  || '';
my $field_selected = $q->param("field_selected")               || '';
my $field_value_selected  = $q->param("field_value_selected")  || '';
my $field_selected2       = $q->param("field_selected2")       || '';
my $field_value_selected2 = $q->param("field_value_selected2") || '';
my $command               = $q->param("command")               || '';

#######################################################################
##		Table Verification
my $table_selected2 = $dbh->quote($table_selected);
$statement
    = "SELECT DISTINCT table_name FROM information_schema.tables WHERE table_name = $table_selected2 AND table_schema = 'public' and table_type='BASE TABLE';";
$sth = $dbh->prepare($statement) || die $dbh->errstr;
$rc  = $sth->execute             || die $dbh->errstr;
$tbl = $sth->fetchrow_arrayref;
unless ( $$tbl[0] ) {

    if ( $lang eq "es" ) {
        $r->print(
            qq{<div class="cent"><p class="error">ERROR!! Por favor, selecciona una Tabla valida.</p></div>}
        );
    }
    else {
        $r->print(
            qq{<div class="cent"><p class="error">ERROR!! Please select a valid table.</p></div>}
        );
    }
    goto ERROR_END;
}
$sth->finish();
#######################################################################
##		Class Verification
unless ( $class_selected eq "All" ) {
    my $class_selected2 = $dbh->quote($class_selected);
    $statement = "SELECT $class_selected2 FROM products;";
    $sth       = $dbh->prepare($statement) || die $dbh->errstr;
    $rc        = $sth->execute || die $dbh->errstr;
    $tbl       = $sth->fetchrow_arrayref;
    unless ( $$tbl[1] ) {
        if ( $lang eq "es" ) {
            $r->print(
                qq{<div class="cent"><p class="error">ERROR!! Por favor, selecciona una Clase valida.</p></div>}
            );
        }
        else {
            $r->print(
                qq{<div class="cent"><p class="error">ERROR!! Please select a valid Class.</p></div>}
            );
        }
        goto ERROR_END;
    }
}
#######################################################################
##		Subclass Verification
unless ( $subclass_selected eq "All" ) {
    my $subclass_selected2 = $dbh->quote($subclass_selected);
    $statement = "SELECT $subclass_selected2 FROM products;";
    $sth       = $dbh->prepare($statement) || die $dbh->errstr;
    $rc        = $sth->execute || die $dbh->errstr;
    $tbl       = $sth->fetchrow_arrayref;
    unless ( $$tbl[1] ) {
        if ( $lang eq "es" ) {
            $r->print(
                qq{<div class="cent"><p class="error">ERROR!! Por favor, selecciona una Subclase valida.</p></div>}
            );
        }
        else {
            $r->print(
                qq{<div class="cent"><p class="error">ERROR!! Please select a valid Class.</p></div>}
            );
        }
        goto ERROR_END;
    }

}
#######################################################################
##		Vendor Name Verification
unless ( $vendor_name_selected eq "All" ) {
    my $vendor_name_selected2 = $dbh->quote($vendor_name_selected);
    $statement = "SELECT $vendor_name_selected2 FROM vendors;";
    $sth       = $dbh->prepare($statement) || die $dbh->errstr;
    $rc        = $sth->execute || die $dbh->errstr;
    $tbl       = $sth->fetchrow_arrayref;
    unless ( $$tbl[1] ) {
        if ( $lang eq "es" ) {
            $r->print(
                qq{<div class="cent"><p class="error">ERROR!! Por favor, selecciona un Proveedor valido.</p></div>}
            );
        }
        else {
            $r->print(
                qq{<div class="cent"><p class="error">ERROR!! Please select a valid Vendor.</p></div>}
            );
        }
        goto ERROR_END;
    }
}
#######################################################################
##		ID Selected Verification
unless ( $id_selected =~ /^\d*$/ ) {
    if ( $lang eq "es" ) {
        $r->print(
            qq{<div class="cent"><p class="error">ERROR!! Por favor, selecciona un Numero de ID valido.</p></div>}
        );
    }
    else {
        $r->print(
            qq{<div class="cent"><p class="error">ERROR!! Please select a valid ID Number.</p></div>}
        );
    }
    goto ERROR_END;
}
#######################################################################
##		Field Selected Verification
unless ( $field_selected =~ /^\w*$/ ) {
    if ( $lang eq "es" ) {
        $r->print(
            qq{<div class="cent"><p class="error">ERROR!! Por favor, selecciona una primera columna valida.</p></div>}
        );
    }
    else {
        $r->print(
            qq{<div class="cent"><p class="error">ERROR!! Please select a valid Field Name.</p></div>}
        );
    }
    goto ERROR_END;
}
unless ( $field_selected2 =~ /^\w*$/ ) {
    if ( $lang eq "es" ) {
        $r->print(
            qq{<div class="cent"><p class="error">ERROR!! Por favor, selecciona una segunda columna valida.</p></div>}
        );
    }
    else {
        $r->print(
            qq{<div class="cent"><p class="error">ERROR!! Please select a valid second Field Name.</p></div>}
        );
    }
    goto ERROR_END;
}

#######################################################################
##		Select a Sub
$dbh->{AutoCommit} = 0;

if ( $command eq "DeleteDuplicates" && $table_selected ne "products" ) {
    if ( $lang eq "es" ) {
        $r->print(
            qq{<div class="cent"><p class="error">ERROR!! Delete Duplicates funciona solamente con la tabla products.</p></div>}
        );
    }
    else {
        $r->print(
            qq{<div class="cent"><p class="error">ERROR!!  only functions with products table.</p></div>}
        );
    }
    goto ERROR_END;
}

if (   $command eq "ViewRecords"
    || "InsertRecordGroupForm"
    || "UpdateRecordForm"
    || "InsertRecordGroup"
    || "UpdateRecord"
    || "ShowColumns"
    || "ShowTables"
    || "DeleteDuplicates" )
{
    my $sub = \&{"$command"};
    &$sub( $r, $dbh, $q, $database, $program );
}
else {
    if ( $lang eq "es" ) {
        $r->print(
            qq{<div class="cent"><p class="error">ERROR!! Por favor, selecciona un comando valida.</p></div>}
        );
    }
    else {
        $r->print(
            qq{<div class="cent"><p class="error">ERROR!! Please select a valid Command.</p></div>}
        );
    }
    goto ERROR_END;
}

$dbh->commit();
$dbh->{AutoCommit} = 1;

#######################################################################
##		Call SelectTable
ERROR_END:
SelectTable( $r, $dbh, $program, \@field_select_tables, $lang );

$dbh->disconnect;

=pod

=head1 NAME

pg.pl

=head1 VERSION

This documentation refers to pg.pl version 2.0.00.

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

