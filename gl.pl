#!/usr/bin/perl

our $VERSION = 1.3.11;
use warnings;
use strict;

use Apache::Request();
use DBI();

#subs Modules
use BWCL::ShowAdmin qw(ShowTables ShowColumns);
use BWCL::InsertRecord_B qw(InsertRecordGroup InsertRecordGroupForm);
use BWCL::SelectTable_B qw(PrepareHead SelectTable);
use BWCL::RecordUpdates_B qw(UpdateRecordForm UpdateRecord);
use BWCL::ViewRecords_B qw(ViewRecords);

#######################################################################
##		Connect to Database

my $username = 'bencon';
my $password = 'L59mEq89Pn';
my $database = 'gl';
my $hostname = '127.0.0.1';

my $r = Apache->request;
my $q = Apache::Request->new( $r, POST_MAX => 100000, DISABLE_UPLOADS => 1 );

my $dbh = DBI->connect( "DBI:Pg:dbname=$database;host=$hostname;port=5432",
	$username, $password, { 'RaiseError' => 1, pg_enable_utf8 => 1 } );

## Note: Nonpersistent Database connection in a Persistent Environment is as Follows:
##my $dbh = DBI->connect("DBI:Pg:dbname=$database;host=$hostname;port=5432",
#$username, $password, {'RaiseError' => 1, dbi_connect_method => 'connect'});

my $program = "/perl/VP/gl.pl";

##	This gives preset filled select lists for "preferred" fields.
##	Is an array of arrays. field,table pairs
##	Is designed to works with odd numbers due to table cells.
##	Not sure if it will work with no fields at all
my @field_select_tables = (
	[ "labor_project_list_category",    "labor_project_list" ],
	[ "labor_project_name",             "labor_project" ],
	[ "labor_project_list_subcategory", "labor_project_list" ]
);
#######################################################################
##		Print Header

$r->content_type("text/html");
$r->send_http_header;
my $lang;
if (defined ($q->param("lang"))) {
	$lang = $q->param("lang");
}
elsif (defined $r->headers_in->get('Accept-Language')) {
	$lang = $r->headers_in->get('Accept-Language');
}
else {
	$lang = "en";
}

$lang =~ /^(\w+[-]*\w*[^,])/;
$lang = $1;

my $title = "Labor DB";
my $description = "Database Access-General Labor/Labor Categories/Labor Projects";

PrepareHead ($r, $dbh, $program, $title, $description, $lang);


#######################################################################
##		Get CGI Params

my $table_selected;
my $labor_category_category_selected;
my $labor_category_subcategory_selected;
my $labor_project_name_selected;
my $id_selected;
my $field_selected;
my $field_value_selected;
my $field_selected2;
my $field_value_selected2;

$labor_category_category_selected =
  $q->param("labor_category_category_selected") || 'All';
$labor_category_subcategory_selected =
  $q->param("labor_category_subcategory_selected") || 'All';
$labor_project_name_selected = $q->param("labor_project_name_selected")
  || 'All';
$table_selected        = $q->param("table_selected")        || '';
$id_selected           = $q->param("id_selected")           || '';
$field_selected        = $q->param("field_selected")        || '';
$field_value_selected  = $q->param("field_value_selected")  || '';
$field_selected2       = $q->param("field_selected2")       || '';
$field_value_selected2 = $q->param("field_value_selected2") || '';
my $command = $q->param("command");
unless (defined $command) {
	goto ERROR_END;
}

#DBI->trace(2, "/var/www/htdocs/users/bennettconstruction.us/logg/dbi_vprod.log");

#######################################################################
##		Table Verification
my $table_ok;
my $SQL =
"SELECT table_name FROM information_schema.tables WHERE table_schema = 'public' and table_type='BASE TABLE';";
my $table_ary_ref = $dbh->selectcol_arrayref($SQL);
foreach my $table_listed (@$table_ary_ref) {
	if ( $table_listed eq $table_selected ) {
		$table_ok = 1;
		last;
	}
}
unless ($table_ok) {
	if ($lang =~ /^es/) {
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
#######################################################################
##		Labor Category Verification
unless ( $labor_category_category_selected eq "All" ) {
	my $labor_category_category_ok;
	my $cv_statement =
"SELECT DISTINCT labor_category_category FROM labor_category WHERE labor_category_category IS NOT NULL;";
	my $labor_category_category_ary_ref =
	  $dbh->selectcol_arrayref($cv_statement);
	foreach
	  my $labor_category_category_listed (@$labor_category_category_ary_ref)
	{
		if ( $labor_category_category_listed eq
			$labor_category_category_selected )
		{
			$labor_category_category_ok = 1;
			last;
		}
	}
	unless ($labor_category_category_ok) {
		if ($lang =~ /^es/) {
			$r->print(
qq{<div class="cent"><p class="error">ERROR!! Por favor, selecciona una Labor Category valida.</p></div>}
			);
		}
		else {
			$r->print(
qq{<div class="cent"><p class="error">ERROR!! Please select a valid Labor Category.</p></div>}
			);
		}
		goto ERROR_END;
	}
}

#######################################################################
##		Labor Subcategory Verification
unless ( $labor_category_subcategory_selected eq "All" ) {
	my $labor_category_subcategory_ok;
	my $scv_statement =
"SELECT DISTINCT labor_category_subcategory FROM labor_category WHERE labor_category_subcategory IS NOT NULL;";
	my $labor_category_subcategory_ary_ref =
	  $dbh->selectcol_arrayref($scv_statement);
	foreach my $labor_category_subcategory_listed (
		@$labor_category_subcategory_ary_ref)
	{
		if ( $labor_category_subcategory_listed eq
			$labor_category_subcategory_selected )
		{
			$labor_category_subcategory_ok = 1;
			last;
		}
	}
	unless ($labor_category_subcategory_ok) {
		if ($lang =~ /^es/) {
			$r->print(
qq{<div class="cent"><p class="error">ERROR!! Por favor, selecciona una Labor Subcategory valida.</p></div>}
			);
		}
		else {
			$r->print(
qq{<div class="cent"><p class="error">ERROR!! Please select a valid Labor Subcategory.</p></div>}
			);
		}
		goto ERROR_END;
	}
}
#######################################################################
##		Labor Project Name Verification
unless ( $labor_project_name_selected eq "All" ) {
	my $labor_project_name_ok;
	my $vnv_statement =
	  "SELECT DISTINCT labor_project_name FROM labor_project;";
	my $labor_project_name_ary_ref = $dbh->selectcol_arrayref($vnv_statement);
	foreach my $labor_project_name_listed (@$labor_project_name_ary_ref) {
		if ( $labor_project_name_listed eq $labor_project_name_selected ) {
			$labor_project_name_ok = 1;
			last;
		}
	}
	unless ($labor_project_name_ok) {
		if ($lang =~ /^es/) {
			$r->print(
qq{<div class="cent"><p class="error">ERROR!! Por favor, selecciona un nombre de Labor Project valido.</p></div>}
			);
		}
		else {
			$r->print(
qq{<div class="cent"><p class="error">ERROR!! Please select a valid Labor Project Name.</p></div>}
			);
		}
		goto ERROR_END;
	}
}
#######################################################################
##		ID Selected Verification
unless ( $id_selected =~ /^\d*$/ ) {
	if ($lang =~ /^es/) {
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
	if ($lang =~ /^es/) {
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
	if ($lang =~ /^es/) {
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

if ( $command eq "ViewRecords" ) {
	unless ( ViewRecords( $r, $dbh, $q ) ) {
		goto ERROR_END;
	}
}
elsif ( $command eq "ShowColumns" ) {
	ShowColumns( $r, $dbh, $q );
}
elsif ( $command eq "ShowTables" ) {
	ShowTables( $r, $dbh );
}
elsif ( $command eq "InsertRecordGroupForm" ) {
	InsertRecordGroupForm( $r, $dbh, $q, $program );
}
elsif ( $command eq "InsertRecordGroup" ) {
	InsertRecordGroup( $r, $dbh, $q, $database );
}
elsif ( $command eq "UpdateRecordForm" ) {
	unless ( UpdateRecordForm( $r, $dbh, $q, $program ) ) {
		goto ERROR_END;
	}
}
elsif ( $command eq "UpdateRecord" ) {
	unless ( UpdateRecord( $r, $dbh, $q, $database ) ) {
		goto ERROR_END;
	}
}
else {
	if ($lang =~ /^es/) {
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
SelectTable( $r, $dbh, $program, \@field_select_tables );

$dbh->disconnect;

=pod

=head1 NAME

gl.pl

=head1 VERSION

This documentation refers to gl.pl version 1.3.11.

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

