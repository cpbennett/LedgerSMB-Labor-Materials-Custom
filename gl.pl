#!/usr/bin/perl

our $VERSION = 3.0.00;
use warnings;
use strict;

use Apache::Request();
use DBI();

#subs Modules
use BWCL::ShowAdmin qw(ShowTables ShowColumns error_message);
use BWCL::InsertRecord_B qw(InsertRecordGroup InsertRecordGroupForm);
use BWCL::SelectTable_B qw(PrepareHead SelectTable);
use BWCL::RecordUpdates_B qw(UpdateRecordForm UpdateRecord);
use BWCL::ViewRecords_B qw(ViewRecords);
use Config::Std;

#######################################################################
##		Connect to Database

my $filename = 'Labor.cfg';
my $config_hash_ref;
read_config($filename => $config_hash_ref);

my $username       = $config_hash_ref->{'Database Login Values'}{'username'};
my $password       = $config_hash_ref->{'Database Login Values'}{'password'};
my $database       = $config_hash_ref->{'Database Login Values'}{'database'};
my $hostname       = $config_hash_ref->{'Database Login Values'}{'hostname'};
my $port           = $config_hash_ref->{'Database Login Values'}{'port'};
my $pg_enable_utf8 = $config_hash_ref->{'Database Login Values'}{'pg_enable_utf8'};
my $r = Apache->request;
my $q = Apache::Request->new(
    $r,
    POST_MAX        => 100000,
    DISABLE_UPLOADS => 1
);

my $dbh
    = DBI->connect( "DBI:Pg:dbname=$database;host=$hostname;port=$port",
    $username, $password, { 'RaiseError' => 1, pg_enable_utf8 => $pg_enable_utf8 } );

my $sth;
my $statement;
my $rc;
my $tbl;
my %args;
## Note: Nonpersistent Database connection in a Persistent Environment is as Follows:
##my $dbh = DBI->connect("DBI:Pg:dbname=$database;host=$hostname;port=5432",
#$username, $password, {'RaiseError' => 1, dbi_connect_method => 'connect'});

my $program = $config_hash_ref->{'Program Path and Name'}{'program_path_name'};
my $use_delete_duplicates = $config_hash_ref->{'Misc Information'}{'use_delete_duplicates'};
my @available_commands
    = qw(ViewRecords
         InsertRecordGroupForm
         UpdateRecordForm
         InsertRecordGroup
         UpdateRecord
         ShowColumns
         ShowTables
        );
##	This gives preset filled select lists for "preferred" fields.
##	Is an array of arrays. field,table pairs
##	Is designed to works with odd numbers due to table cells.
##	Not sure if it will work with no fields at all
my @field_select_tables = (
    [ "labor_project_list_category"    => "labor_project_list" ],
    [ "labor_project_list_subcategory" => "labor_project_list" ],
    [ "labor_project_class"            => "labor_project" ],
    [ "labor_project_subclass"         => "labor_project" ],
    [ "labor_project_section "         => "labor_project" ],
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

my $title = "Labor DB";
my $description
    = "Database Access-General Labor/Labor Categories/Labor Projects";

$args{program}               = $program;
$args{lang}                  = $lang;
$args{title}                 = $title;
$args{description}           = $description;
$args{r}                     = $r;
$args{dbh}                   = $dbh;
$args{q}                     = $q;
$args{use_delete_duplicates} = $use_delete_duplicates;
$args{field_table_aref}      = \@field_select_tables;
$args{database}              = $database;
$args{config_hash_ref}       = $config_hash_ref;

#PrepareHead( $r, $dbh, $program, $title, $description, $lang );
PrepareHead( \%args );

#######################################################################
##		Get CGI Params

my $command = $q->param("command")
    || goto ERROR_END;
unless ($command~~@available_commands) {
    error_message($r, $lang, "un comando valido", "a valid command");
    goto ERROR_END;
}
my $table_selected = $q->param("table_selected")
    || goto ERROR_END;
$args{table_selected} = $table_selected;

my $labor_project_list_category_selected
    = $q->param("labor_project_list_category_selected")        || 'All';
my $labor_project_list_subcategory_selected
    = $q->param("labor_project_list_subcategory_selected")     || 'All';
my $labor_project_class_selected
    = $q->param("labor_project_class_selected")                || 'All';
my $labor_project_subclass_selected
    = $q->param("labor_project_subclass_selected")             || 'All';
my $labor_project_section_selected
    = $q->param("labor_project_section_selected")              || 'All';
my $id_selected           = $q->param("id_selected")           || '';
my $field_selected        = $q->param("field_selected")        || '';
my $field_value_selected  = $q->param("field_value_selected")  || '';
my $field_selected2       = $q->param("field_selected2")       || '';
my $field_value_selected2 = $q->param("field_value_selected2") || '';
my $itemstoinsert         = $q->param("itemstoinsert")         || '';

#######################################################################
##		Table Verification
$table_selected = $dbh->quote($table_selected);
$statement
    = "SELECT DISTINCT table_name FROM information_schema.tables WHERE table_name = $table_selected AND table_schema = 'public' and table_type='BASE TABLE';";
$sth = $dbh->prepare($statement) || die $dbh->errstr;
$rc  = $sth->execute             || die $dbh->errstr;
$tbl = $sth->fetchrow_arrayref;
$sth->finish();
unless ( $$tbl[0] ) {
    error_message($r, $lang, "una tabla valida", "a valid table");
    goto ERROR_END;
}
#######################################################################
##		Labor Category Verification
unless ( $labor_project_list_category_selected eq "All" ) {
    my $labor_project_list_category_selected2
        = $dbh->quote($labor_project_list_category_selected);
    $statement
        = "SELECT $labor_project_list_category_selected2 FROM labor_project_list;";
    $sth = $dbh->prepare($statement) || die $dbh->errstr;
    $rc  = $sth->execute             || die $dbh->errstr;
    $tbl = $sth->fetchrow_arrayref;
    $sth->finish();
    unless ( $$tbl[0] ) {
        error_message($r, $lang, "una labor project list category valida",
            "a valid labor project list category");
        goto ERROR_END;
    }
}
#######################################################################
##		Labor Subcategory Verification
unless ( $labor_project_list_subcategory_selected eq "All" ) {
    my $labor_project_list_subcategory_selected2
        = $dbh->quote($labor_project_list_subcategory_selected);
    $statement
        = "SELECT $labor_project_list_subcategory_selected2 FROM labor_project_list;";
    $sth = $dbh->prepare($statement) || die $dbh->errstr;
    $rc  = $sth->execute             || die $dbh->errstr;
    $tbl = $sth->fetchrow_arrayref;
    $sth->finish();
    unless ( $$tbl[0] ) {
        error_message($r, $lang, "una labor project list subcategory valida",
            "a valid labor project list subcategory");
        goto ERROR_END;
    }
}
#######################################################################
##		Labor Project Class Verification
unless ( $labor_project_class_selected eq "All" ) {
    my $labor_project_class_selected2
        = $dbh->quote($labor_project_class_selected);
    $statement
        = "SELECT $labor_project_class_selected2 FROM labor_project;";
    $sth = $dbh->prepare($statement) || die $dbh->errstr;
    $rc  = $sth->execute             || die $dbh->errstr;
    $tbl = $sth->fetchrow_arrayref;
    $sth->finish();
    unless ( $$tbl[0] ) {
        error_message($r, $lang, "un clase de labor project valido", "a valid labor project class");
        goto ERROR_END;
    }
}
#######################################################################
##		Labor Project Subclass Verification
unless ( $labor_project_subclass_selected eq "All" ) {
    my $labor_project_subclass_selected2
        = $dbh->quote($labor_project_subclass_selected);
    $statement
        = "SELECT $labor_project_subclass_selected2 FROM labor_project;";
    $sth = $dbh->prepare($statement) || die $dbh->errstr;
    $rc  = $sth->execute             || die $dbh->errstr;
    $tbl = $sth->fetchrow_arrayref;
    $sth->finish();
    unless ( $$tbl[0] ) {
        error_message($r, $lang, "un subclase de labor project valido", "a valid labor project subclass");
        goto ERROR_END;
    }
}
#######################################################################
##		Labor Project Section Verification
unless ( $labor_project_section_selected eq "All" ) {
    my $labor_project_section_selected2
        = $dbh->quote($labor_project_section_selected);
    $statement
        = "SELECT $labor_project_section_selected2 FROM labor_project;";
    $sth = $dbh->prepare($statement) || die $dbh->errstr;
    $rc  = $sth->execute             || die $dbh->errstr;
    $tbl = $sth->fetchrow_arrayref;
    $sth->finish();
    unless ( $$tbl[0] ) {
        error_message($r, $lang, "una sección de labor project valido", "a valid labor project section");
        goto ERROR_END;
    }
}
#######################################################################
##		ID Selected Verification
if ( $command eq "UpdateRecordForm" && $id_selected !~ /^\d+$/ ) {
    error_message($r, $lang, "un numero de ID valido", "a valid ID number");
    goto ERROR_END;
}
#######################################################################
##		Items to Insert Verification
if ( $command eq "InsertRecordForm" && $itemstoinsert !~ /^\d+$/ ) {
    error_message($r, $lang, "un numero de unidades para insertar", "a number of items to insert");
    goto ERROR_END;
}
#######################################################################
##		Field Selected Verification
    if ($field_selected) {
       $field_selected = $dbh->quote($field_selected);
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
       $field_selected2 = $dbh->quote($field_selected2);
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
    $dbh->{AutoCommit} = 0;
    my $sub = \&{"$command"};
    &$sub( \%args );
    $dbh->commit();
    $dbh->{AutoCommit} = 1;

#######################################################################
##		Call SelectTable
ERROR_END:
#SelectTable( $r, $dbh, $program, \@field_select_tables, $lang, $use_delete_duplicates );

SelectTable( \%args );
$dbh->disconnect;


=pod

=head1 NAME

gl.pl

=head1 VERSION

This documentation refers to gl.pl version 3.0.00.

=head1 SYNOPSIS

Hands off commands to appropriate modules

=head1 DESCRIPTION

Hands off commands to appropriate modules of labor database.
Performs some error corrections.
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

