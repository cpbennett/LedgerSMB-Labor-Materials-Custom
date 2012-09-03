#!/usr/bin/perl

our $VERSION = 1.3.01;
use warnings;
use strict;

use Apache::Request();
use DBI();

#subs Modules
use BWC::ShowAdmin qw(ShowTables ShowColumns);
use BWC::InsertRecord_B qw(InsertRecordGroup InsertRecordGroupForm);
use BWC::SelectTable_B qw(SelectTable);
use BWC::RecordUpdates_B qw(UpdateRecordForm UpdateRecord);
use BWC::ViewRecords_B qw(ViewRecords);

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
##my $dbh = DBI->connect("DBI:Pg:dbname=$database;host=$hostname;port=5432", $username, $password, {'RaiseError' => 1, dbi_connect_method => 'connect'});

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

#######################################################################
#	Prepare Javascript in Head

my $table_string  = "";
my $case_string   = "";
my $option_string = "";
my @columns       = ();
my @tables        = ();
my $sth           = $dbh->table_info( '', 'public', undef, 'TABLE' );
for my $rel ( @{ $sth->fetchall_arrayref( {} ) } ) {
	push( @tables, "\'$rel->{TABLE_NAME}\'" );
}
$sth->finish();
$option_string .= qq{field_selected[field_selected.length] = new Option("", "");
field_selected2[field_selected2.length] = new Option("", "");
};

$table_string = join( ',', @tables );
foreach my $chosen (@tables) {
	$case_string .= qq{
		case $chosen :
		field_selected.length = 0;
		field_selected2.length = 0;
		field_selected[field_selected.length] = new Option("", "");
		field_selected2[field_selected2.length] = new Option("", "");

};
	my $statement =
"SELECT column_name FROM information_schema.columns WHERE table_name = $chosen;";
	my $sth = $dbh->prepare($statement);
	my $rv  = $sth->execute() or die "can't execute the query: $sth->errstr";
	my $tbl = $sth->fetchall_arrayref or die "$sth->errstr\n";
	for my $i ( 0 .. $#{$tbl} ) {
		$case_string .= qq{
field_selected[field_selected.length] = new Option("$tbl->[$i][0]", "$tbl->[$i][0]");
field_selected2[field_selected2.length] = new Option("$tbl->[$i][0]", "$tbl->[$i][0]");
};
		if ( $chosen eq $tables[0] ) {
			$option_string .= qq{
field_selected[field_selected.length] = new Option("$tbl->[$i][0]", "$tbl->[$i][0]");
field_selected2[field_selected2.length] = new Option("$tbl->[$i][0]", "$tbl->[$i][0]");
};
		}
	}
	$case_string .= qq{break;
};
}

#######################################################################
##		Print Page Head

$r->print(
	qq#<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US">
<head>
<title>Labor DB</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-language" content="en-US" />
<meta name="robots" content="noindex,nofollow" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta name="description" content="Database Access-General Labor/Labor Categories/Labor Projects" />
<meta name="author" content="Chris Bennett" />
<link rel="shortcut icon" href="/favicon.ico" />
<link href="/db.css" type="text/css" rel="stylesheet" media="screen" />
<link rel="stylesheet" type="text/css" href="/print.css" media="print" />
<link rel="stylesheet" type="text/css" href="/handheldimg.css" media="handheld" />
<script type="text/javascript" src="/javascript/external.js"></script>
<script type="text/javascript">
//<![CDATA[
function checkscript() {
	for (i=0;i<document.forms[0].radios.length;i++) {
		if (document.forms[0].radios[i].checked) {
			user_input = document.forms[0].radios[i].value;
		}
	}
	if (user_input) {
		return true;
	}
	for (i=0;i<document.forms[1].radios.length;i++) {
		if (document.forms[1].radios[i].checked) {
			user_input2 = document.forms[1].radios[i].value;
		}
	}
	if (user_input2) {
		return true;
	}

return false;
}

if (window.addEventListener) {
	window.addEventListener("load",setupEvents,false);
} else if (window.attachEvent) {
	window.attachEvent("onload",setupEvents);
} else {
	window.onload=setupEvents;
}

function setupEvents(evnt) {
	var opts = document.getElementById("someForm").table_selected.options;
	var field_selected = document.getElementById("someForm").field_selected.options;
	var field_selected2 = document.getElementById("someForm").field_selected2.options;
	$option_string
	document.getElementById("someForm").table_selected.onchange = checkSelect;
	
}

function checkSelect(evnt) {
	var opts = document.getElementById("someForm").table_selected.options;
	var field_selected = document.getElementById("someForm").field_selected.options;
	var field_selected2 = document.getElementById("someForm").field_selected2.options;

	for ( var i = 0; i < opts.length; i++) {
		if ( opts[i].selected ) {
			switch(opts[i].value) {
				$case_string
			}
		}
	}

	return false;
}
function checkscript() {
	for (i=0;i<document.someForm.command.length;i++) {
		if (document.someForm.command[i].checked) {
			return true;
		}
}
alert("Please Select a Command");
return false;
}

//]]>
</script>
</head>
<body>
<div>
<a class="bigblue" href="/index.html" rel="external">BENNETT CONSTRUCTION</a><br />
<a class="biggreen" href="/perl/VP/manual.pl?lang=en" rel="external">VIEW USAGE MANUAL</a><br />
<a class="biggreen" href="/perl/VP/manual.pl?lang=es" rel="external">VER MANUAL DE USAR</a><br />
<a class="bigblue" href="/perl/VP/tr.pl" rel="external">Materials Viewer and Duplicator</a><br />
<a class="bigblue" href="/perl/VP/lab.pl" rel="external">Labor Viewer and Duplicator</a><br />
<a class="bigblue" href="/perl/VP/pg.pl" rel="external">Products Vendors Customers Assemblies</a><br />
<a class="bigred" href="/logout">Log Off</a>
</div>
#
);

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
my $command = $q->param("command") || '';

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
	$r->print(
qq{<div class="cent"><p class="error">Please select a valid table.</p></div>}
	);
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
		$r->print(
qq{<div class="cent"><p class="error">ERROR!! Please select a valid Labor Category.</p></div>}
		);
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
		$r->print(
qq{<div class="cent"><p class="error">ERROR!! Please select a valid Labor Subcategory.</p></div>}
		);
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
		$r->print(
qq{<div class="cent"><p class="error">ERROR!! Please select a valid Labor Project Name.</p></div>}
		);
		goto ERROR_END;
	}
}
#######################################################################
##		ID Selected Verification
unless ( $id_selected =~ /^\d*$/ ) {
	$r->print(
qq{<div class="cent"><p class="error">ERROR!! Please select a valid ID Number.</p></div>}
	);
	goto ERROR_END;
}

#######################################################################
##		Field Selected Verification
unless ( $field_selected =~ /^\w*$/ ) {
	$r->print(
qq{<div class="cent"><p class="error">ERROR!! Please select a valid Field Name.</p></div>}
	);
	goto ERROR_END;
}
unless ( $field_selected2 =~ /^\w*$/ ) {
	$r->print(
qq{<div class="cent"><p class="error">ERROR!! Please select a valid Second Field Name.</p></div>}
	);
	goto ERROR_END;
}

#if (($table_selected eq "labor_category") && ($labor_category_category_selected eq 'All') && ($labor_category_subcategory_selected eq 'All') && ($labor_project_name_selected eq 'All') && (($command eq "ViewRecords") || ($command eq "UpdateField"))) {
#	$r->print(qq{<div class="cent"><p class="error">ERROR!! Please select a smaller query.</p></div>});
#	SelectTable ($r, $dbh, "/perl/VP/gl.pl", "labor_category", "labor_category_category", "labor_category_subcategory", "labor_project_name", "labor_project");
#	goto ERROR_END;
#}

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

$dbh->commit();
$dbh->{AutoCommit} = 1;
#######################################################################
##		Call SelectTable2
ERROR_END:
SelectTable( $r, $dbh, $program, \@field_select_tables );
$dbh->disconnect;

=pod

=head1 NAME

gl.pl

=head1 VERSION

This documentation refers to gl.pl version 1.3.01.

=head1 SYNOPSIS

Hands off commands to appropriate modules of labor database.

=head1 DESCRIPTION


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

