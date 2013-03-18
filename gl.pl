#!/usr/bin/perl

our $VERSION = 3.2.00;

# BETA TEST
use warnings;
use strict;

use Apache::Request();
use DBI();

#subs Modules
use BWC::ShowAdmin qw(ShowTables ShowAllTables ShowColumns error_message);
use BWC::InsertRecord_B qw(InsertRecordGroup InsertRecordGroupForm);
use BWC::SelectTable_B qw(PrepareHead SelectTable);
use BWC::RecordUpdates_B qw(UpdateRecordForm UpdateRecord);
use BWC::ViewRecords_B qw(ViewRecords);
use BWC::DeleteRecord_B qw(DeleteRecord DeleteRecordForm);
use Config::Std;

#######################################################################
##        Connect to Database

my $filename = 'Labor.cfg';
my $config_hash_ref;
read_config( $filename => $config_hash_ref );

my $r = Apache->request;
my $q = Apache::Request->new(
    $r,
    POST_MAX        => 100000,
    DISABLE_UPLOADS => 1
);

my $dbh = DBI->connect(
    "DBI:Pg:dbname=$config_hash_ref->{'Database'}{'database'};
    host=$config_hash_ref->{'Database'}{'hostname'};
    port=$config_hash_ref->{'Database'}{'port'}",
    $config_hash_ref->{'Database'}{'username'},
    $config_hash_ref->{'Database'}{'password'},
    {
        'RaiseError'   => 1,
        pg_enable_utf8 => $config_hash_ref->{'Database'}{'pg_enable_utf8'}
    }
);
$config_hash_ref->{dbh} = $dbh;
$config_hash_ref->{r}   = $r;
$config_hash_ref->{q}   = $q;
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

my $fields_of_tables_select = $config_hash_ref->{'FieldsAndTables'}{'Pair'};
my @field_select_tables     = ();
my $ij                      = 0;
while ( $ij <= $#$fields_of_tables_select ) {
    push @field_select_tables,
      (
        [
            "$$fields_of_tables_select[$ij]" =>
              "$$fields_of_tables_select[$ij+1]"
        ]
      );
    $ij = $ij + 2;
}

#######################################################################
##        Print Header

$r->content_type("text/html");
$r->send_http_header;
my $lang =
     $q->param("lang")
  || $r->headers_in->get('Accept-Language')
  || "en";

$lang = substr $lang, 0, 2;

$config_hash_ref->{lang}             = $lang;
$config_hash_ref->{field_table_aref} = \@field_select_tables;

PrepareHead($config_hash_ref);

#######################################################################
##        Get CGI Params

my $command = $q->param("command")
  || goto ERROR_END;
unless ( $command ~~ @$commands ) {
    error_message( $r, $lang, "un comando valido", "a valid command" );
    goto ERROR_END;
}
my $table = $q->param("table_selected")
  || goto ERROR_END;
$config_hash_ref->{table} = $table;
$config_hash_ref->{labor_project_list_category} =
  $q->param("labor_project_list_category_selected") || 'All';
$config_hash_ref->{labor_project_list_subcategory} = $q->param(
"labor_project_list_subcategory_selectedlabor_project_list_category_selected"
) || 'All';
$config_hash_ref->{labor_project_class} =
  $q->param("labor_project_class_selected")
  || 'All';
$config_hash_ref->{labor_project_subclass} =
  $q->param("labor_project_subclass_selectedlabor_project_class_selected")
  || 'All';
$config_hash_ref->{labor_project_section} =
  $q->param("labor_project_section_selected")
  || 'All';
$config_hash_ref->{id} = $q->param("id_selected") || '';
$config_hash_ref->{field} = $q->param("field_selectedtable_selected") || '';
$config_hash_ref->{field_value}      = $q->param("field_value_selected") || '';
$config_hash_ref->{field_value_not}  = $q->param("field_value_selected_not");
$config_hash_ref->{field_value_null} = $q->param("field_value_selected_null");
$config_hash_ref->{field2} = $q->param("field_selected2table_selected") || '';
$config_hash_ref->{field_value2}     = $q->param("field_value_selected2") || '';
$config_hash_ref->{field_value2_not} = $q->param("field_value_selected2_not");
$config_hash_ref->{field_value2_null} = $q->param("field_value_selected2_null");
$config_hash_ref->{itemstoinsert} = $q->param("itemstoinsert") || '';

#######################################################################
##        Table Verification
$table     = $dbh->quote($table);
$statement = "SELECT DISTINCT table_name FROM information_schema.tables WHERE
    table_name = $table AND table_schema = 'public' AND
    table_type='BASE TABLE';";
$sth = $dbh->prepare($statement) || die $dbh->errstr;
$rc  = $sth->execute             || die $dbh->errstr;
$tbl = $sth->fetchrow_arrayref;
$sth->finish();

unless ( $$tbl[0] ) {
    error_message( $r, $lang, "una tabla valida", "a valid table" );
    goto ERROR_END;
}
#######################################################################
##        Labor Category Verification
unless ( $config_hash_ref->{labor_project_list_category} eq "All" ) {
    my $labor_project_list_category =
      $dbh->quote( $config_hash_ref->{labor_project_list_category} );
    $statement =
"SELECT labor_project_list_category FROM labor_project_list WHERE labor_project_list_category = $labor_project_list_category;";
    $sth = $dbh->prepare($statement) || die $dbh->errstr;
    $rc  = $sth->execute             || die $dbh->errstr;
    $tbl = $sth->fetchrow_arrayref;
    $sth->finish();
    unless ( $$tbl[0] ) {
        error_message(
            $r, $lang,
            "una labor project list category valida",
            "a valid labor project list category"
        );
        goto ERROR_END;
    }
}
#######################################################################
##        Labor Subcategory Verification
unless ( $config_hash_ref->{labor_project_list_subcategory} eq "All" ) {
    my $labor_project_list_subcategory =
      $dbh->quote( $config_hash_ref->{labor_project_list_subcategory} );
    $statement =
"SELECT labor_project_list_subcategory FROM labor_project_list WHERE labor_project_list_subcategory = $labor_project_list_subcategory;";
    $sth = $dbh->prepare($statement) || die $dbh->errstr;
    $rc  = $sth->execute             || die $dbh->errstr;
    $tbl = $sth->fetchrow_arrayref;
    $sth->finish();
    unless ( $$tbl[0] ) {
        error_message(
            $r, $lang,
            "una labor project list subcategory valida",
            "a valid labor project list subcategory"
        );
        goto ERROR_END;
    }
}
#######################################################################
##        Labor Project Class Verification
unless ( $config_hash_ref->{labor_project_class} eq "All" ) {
    my $labor_project_class =
      $dbh->quote( $config_hash_ref->{labor_project_class} );
    $statement =
"SELECT labor_project_class FROM labor_project WHERE labor_project_class = $labor_project_class;";
    $sth = $dbh->prepare($statement) || die $dbh->errstr;
    $rc  = $sth->execute             || die $dbh->errstr;
    $tbl = $sth->fetchrow_arrayref;
    $sth->finish();
    unless ( $$tbl[0] ) {
        error_message(
            $r, $lang,
            "un clase de labor project valido",
            "a valid labor project class"
        );
        goto ERROR_END;
    }
}
#######################################################################
##        Labor Project Subclass Verification
unless ( $config_hash_ref->{labor_project_subclass} eq "All" ) {
    my $labor_project_subclass =
      $dbh->quote( $config_hash_ref->{labor_project_subclass} );
    $statement =
"SELECT labor_project_subclass FROM labor_project WHERE labor_project_subclass = $labor_project_subclass;";
    $sth = $dbh->prepare($statement) || die $dbh->errstr;
    $rc  = $sth->execute             || die $dbh->errstr;
    $tbl = $sth->fetchrow_arrayref;
    $sth->finish();
    unless ( $$tbl[0] ) {
        error_message(
            $r, $lang,
            "un subclase de labor project valido",
            "a valid labor project subclass"
        );
        goto ERROR_END;
    }
}
#######################################################################
##        Labor Project Section Verification
unless ( $config_hash_ref->{labor_project_section} eq "All" ) {
    my $labor_project_section =
      $dbh->quote( $config_hash_ref->{labor_project_section} );
    $statement =
"SELECT labor_project_section FROM labor_project WHERE labor_project_section = $labor_project_section;";
    $sth = $dbh->prepare($statement) || die $dbh->errstr;
    $rc  = $sth->execute             || die $dbh->errstr;
    $tbl = $sth->fetchrow_arrayref;
    $sth->finish();
    unless ( $$tbl[0] ) {
        error_message(
            $r, $lang,
            "una sección de labor project valido",
            "a valid labor project section"
        );
        goto ERROR_END;
    }
}
#######################################################################
##        ID Selected Verification
if ( ( $command eq "UpdateRecordForm" || $command eq "DeleteRecordForm" )
    && $config_hash_ref->{id} !~ /^\d+$/ )
{
    error_message( $r, $lang, "un numero de ID valido", "a valid ID number" );
    goto ERROR_END;
}
#######################################################################
##        Items to Insert Verification
if (   $command eq "InsertRecordGroupForm"
    && $config_hash_ref->{itemstoinsert} !~ /^\d+$/ )
{
    error_message(
        $r, $lang,
        "un numero de unidades para insertar",
        "a number of items to insert"
    );
    goto ERROR_END;
}
#######################################################################
##        Field Selected Verification
if ( $config_hash_ref->{field} ) {
    my $field = $dbh->quote( $config_hash_ref->{field} );
    $statement =
"SELECT (SELECT DISTINCT column_name FROM information_schema.columns WHERE table_name = $table AND column_name = $field);";
    $sth = $dbh->prepare($statement) || die $dbh->errstr;
    $rc  = $sth->execute             || die $dbh->errstr;
    $tbl = $sth->fetchrow_arrayref;
    $sth->finish();
    unless ( $$tbl[0] ) {
        error_message(
            $r, $lang,
            "un campo primero valido",
            "a valid first field"
        );
        goto ERROR_END;
    }
}
#######################################################################
##        Field Selected2 Verification
if ( $config_hash_ref->{field2} ) {
    my $field2 = $dbh->quote( $config_hash_ref->{field2} );
    $statement =
"SELECT (SELECT DISTINCT column_name FROM information_schema.columns WHERE table_name = $table AND column_name = $field2);";
    $sth = $dbh->prepare($statement) || die $dbh->errstr;
    $rc  = $sth->execute             || die $dbh->errstr;
    $tbl = $sth->fetchrow_arrayref;
    $sth->finish();
    unless ( $$tbl[0] ) {
        error_message(
            $r, $lang,
            "un segunda columna valida",
            "a valid second column"
        );
        goto ERROR_END;
    }
}
#######################################################################
##        Select a Sub
$dbh->{AutoCommit} = 0;
my $sub = \&{"$command"};
&$sub($config_hash_ref);
$dbh->commit();
$dbh->{AutoCommit} = 1;

#######################################################################
##        Call SelectTable
ERROR_END:

SelectTable($config_hash_ref);
$dbh->disconnect;

=pod

=head1 NAME

gl.pl

=head1 VERSION

This documentation refers to gl.pl version 3.2.00.
BETA TEST

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

