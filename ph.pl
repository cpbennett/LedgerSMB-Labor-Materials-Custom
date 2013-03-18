#!/usr/bin/perl

our $VERSION = 0.0.01;

# BETA TEST
use warnings;
use strict;

use Apache::Request();
use DBI();

#subs Modules
use BWCL::ShowAdmin qw(ShowTables ShowAllTables ShowColumns error_message);
use BWCL::InsertRecord_B qw(InsertRecordGroup InsertRecordGroupForm);
use BWCL::SelectTable_B qw(PrepareHead SelectTable);
use BWCL::RecordUpdates_B qw(UpdateRecordForm UpdateRecord DeleteDuplicates);
use BWCL::ViewRecords_B qw(ViewRecords ShowDuplicates);
use BWCL::DeleteRecord_B qw(DeleteRecord DeleteRecordForm);
use Config::Std;

#######################################################################
##        Connect to Database

my $filename = 'photos.cfg';
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

$config_hash_ref->{table} = $q->param("table_selected") || goto ERROR_END;
$config_hash_ref->{photo_id} = $q->param("photo_id_selected") || 'All';
$config_hash_ref->{photo_name} = $q->param("photo_name_selected")
  || 'All';
$config_hash_ref->{photo_file} = $q->param("photo_file_selected") || 'All';
$config_hash_ref->{id}          = $q->param("id_selected")          || '';
$config_hash_ref->{field} = $q->param("field_selectedtable_selected") || '';
$config_hash_ref->{field_value}      = $q->param("field_value_selected") || '';
$config_hash_ref->{field_value_null} = $q->param("field_value_selected_null");
$config_hash_ref->{field_value_not}  = $q->param("field_value_selected_not");
$config_hash_ref->{field2} = $q->param("field_selected2table_selected") || '';
$config_hash_ref->{field_value2} = $q->param("field_value_selected2") || '';
$config_hash_ref->{field_value2_null} = $q->param("field_value_selected2_null");
$config_hash_ref->{field_value2_not}  = $q->param("field_value_selected2_not");
$config_hash_ref->{itemstoinsert}     = $q->param("itemstoinsert") || '';
$config_hash_ref->{gallery_name} =
  $q->param("gallery_name_selectedphoto_id_selected") || 'All';
$config_hash_ref->{photo_name_es} = $q->param(
"photo_name_es_selectedphoto_name_selected"
) || 'All';

#######################################################################
##        Table Verification
my $table = $dbh->quote( $config_hash_ref->{table} );
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
##        Class Verification
#if ( $table eq "products" && $config_hash_ref->{class} ne "All" ) {
#    my $class = $dbh->quote( $config_hash_ref->{class} );
#    $statement =
#      "SELECT class FROM $config_hash_ref->{table} where class = $class;";
#    $sth = $dbh->prepare($statement) || die $dbh->errstr;
#    $rc  = $sth->execute             || die $dbh->errstr;
#    $tbl = $sth->fetchrow_arrayref;
#    $sth->finish();
#    unless ( $$tbl[0] ) {
#        error_message( $r, $lang, "una clase valida", "a valid class" );
#        goto ERROR_END;
#    }
#}
#######################################################################
##        Subclass Verification
#if ( $table eq "products" && $config_hash_ref->{subclass} ne "All" ) {
#    my $subclass = $dbh->quote( $config_hash_ref->{subclass} );
#    $statement =
#"SELECT subclass FROM $config_hash_ref->{table} WHERE subclass = $subclass;";
#    $sth = $dbh->prepare($statement) || die $dbh->errstr;
#    $rc  = $sth->execute             || die $dbh->errstr;
#    $tbl = $sth->fetchrow_arrayref;
#    $sth->finish();
#    unless ( $$tbl[0] ) {
#        error_message( $r, $lang, "una subclase valida", "a valid subclass" );
#        goto ERROR_END;
#    }
#}
########################################################################
###        Vendor Name Verification
#if (
#    (
#           $table eq "products"
#        || $table eq "vendors"
#        || $table eq "vendor_contacts"
#    )
#    && $config_hash_ref->{vendor_name} ne "All"
#  )
#{
#    my $vendor_name = $dbh->quote( $config_hash_ref->{vendor_name} );
#    $statement =
#"SELECT vendor_name FROM $config_hash_ref->{table} WHERE vendor_name = $vendor_name;";
#    $sth = $dbh->prepare($statement) || die $dbh->errstr;
#    $rc  = $sth->execute             || die $dbh->errstr;
#    $tbl = $sth->fetchrow_arrayref;
#    $sth->finish();
#    unless ( $$tbl[0] ) {
#        error_message( $r, $lang, "un vendor valido", "a valid vendor" );
#        goto ERROR_END;
#    }
#}
########################################################################
###        Full Assembly List Category Verification
#if (   $table eq "full_assembly_list"
#    && $config_hash_ref->{full_assembly_list_category} ne "All" )
#{
#    my $full_assembly_list_category =
#      $dbh->quote( $config_hash_ref->{full_assembly_list_category} );
#    $statement = "SELECT 
#               FROM $config_hash_ref->{table} WHERE full_assembly_list_category = $full_assembly_list_category;";
#    $sth = $dbh->prepare($statement) || die $dbh->errstr;
#    $rc  = $sth->execute             || die $dbh->errstr;
#    $tbl = $sth->fetchrow_arrayref;
#    $sth->finish();
#    unless ( $$tbl[0] ) {
#        error_message(
#            $r, $lang,
#            "una categoria de full assembly list valida",
#            "a valid full assembly list category"
#        );
#        goto ERROR_END;
#    }
#}
########################################################################
###        Full Assembly List Subcategory Verification
#if (   $table eq "full_assembly_list"
#    && $config_hash_ref->{full_assembly_list_subcategory} ne "All" )
#{
#    my $full_assembly_list_subcategory =
#      $dbh->quote( $config_hash_ref->{full_assembly_list_subcategory} );
#    $statement =
#"SELECT full_assembly_list_subcategory FROM $config_hash_ref->{table} WHERE full_assembly_list_subcategory = $full_assembly_list_subcategory
#               ;";
#    $sth = $dbh->prepare($statement) || die $dbh->errstr;
#    $rc  = $sth->execute             || die $dbh->errstr;
#    $tbl = $sth->fetchrow_arrayref;
#    $sth->finish();
#    unless ( $$tbl[0] ) {
#        error_message(
#            $r, $lang,
#            "una subcategoria de full assembly list valida",
#            "a valid full assembly list subcategory"
#        );
#        goto ERROR_END;
#    }
#}
#######################################################################
##        ID Selected Verification
if ( ( $command eq "UpdateRecordForm" || $command eq "DeleteRecordForm" )
    && $config_hash_ref->{id} !~ /^\d+$/ )
{
    error_message( $r, $lang, "un numero de ID valido", "a valid ID number" );
    goto ERROR_END;
}    #######################################################################
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

#if ( $command eq "DeleteDuplicates" && $config_hash_ref->{table} ne "products" )
#{
#    error_message(
#        $r, $lang,
#        "la tabla products solamente",
#        "only the products table"
#    );
#    goto ERROR_END;
#}

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

ph.pl

=head1 VERSION

This documentation refers to ph.pl version 0.0.01.

=head1 SYNOPSIS

Hands off commands to appropriate modules.

=head1 DESCRIPTION

Hands off commands to appropriate modules of database.
Performs some error corrections.
Basic Spanish error messages are included.
These can easily be changed to support another language.

=head1 BUGS AND LIMITATIONS

Please report problems to Chris Bennett (chris@bennettconstruction.us)

Patches are welcome.

=head1 AUTHOR

Chris Bennett  (chris@bennettconstruction.us)

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2013 Chris Bennett (chris@bennettconstruction.us).

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

