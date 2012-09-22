#!/usr/bin/perl

our $VERSION = 1.2.00;
use warnings;
use strict;

use Apache::Request();
use DBI();

use BWCL::SelectFAL qw(SelectFALs);
use BWCL::ViewFALRecords
  qw(ViewFALRecords ViewFullFALRecords DuplicateFullFALRecordsForm DuplicateFullFALRecords);

#######################################################################
##		Connect to Database

my $username = 'bencon';
my $password = 'L59mEq89Pn';
my $database = 'vp';
my $hostname = '127.0.0.1';

my $r = Apache->request;
my $q = Apache::Request->new( $r, POST_MAX => 100000, DISABLE_UPLOADS => 1 );

my $dbh = DBI->connect( "DBI:Pg:dbname=$database;host=$hostname;port=5432",
	$username, $password, { 'RaiseError' => 1, pg_enable_utf8 => 1 } );
## Note: Nonpersistent Database connection in a Persistent Environment is as Follows:
##my $dbh = DBI->connect("DBI:Pg:dbname=$database;host=$hostname;port=5432", $username, $password, {'RaiseError' => 1, dbi_connect_method => 'connect'});

my $program = "/perl/VP/tr.pl";

#######################################################################
##		Print Header

$r->content_type("text/html");
$r->send_http_header;

#######################################################################
#	Prepare Javascript in Head

my $full_assembly_list_string = "";
my $case_string               = "";
my $option_string             = "";
my @columns                   = ();
my @full_assembly_lists       = ();
my @vetor                     = ();
my $chosenh;
my $chosenh_pretty;
my $chosen2;
my $option;
my $counter = 0;
my $tbl;
my $tbl2;
my $sth;
my $statement;
my $rv;

$sth = $dbh->prepare(
"SELECT full_assembly_list_name FROM full_assembly_list ORDER BY full_assembly_list_name;"
);
$sth->execute;
while ( @vetor = $sth->fetchrow ) {
	push( @full_assembly_lists, @vetor );
}
$sth->finish();
$option_string .=
  qq{assembly_selected[assembly_selected.length] = new Option("All", "All");
};

$full_assembly_list_string = join( ',', @full_assembly_lists );
foreach my $chosen (@full_assembly_lists) {
	$chosenh        = $chosen;
	$chosenh_pretty = $chosen;
	$chosenh_pretty =~ s/"/''/g
	  ; # This substitution is done for form which allows javascript to function
	$case_string .= qq{
		case "$chosenh_pretty" :
		assembly_selected.length = 0;
		assembly_selected[assembly_selected.length] = new Option("All", "All");

};
	$chosen2 = $dbh->quote($chosen);
	$statement =
"SELECT full_assembly_assembly_id FROM full_assembly WHERE full_assembly_name = $chosen2 ORDER BY full_assembly_assembly_id;";
	$sth = $dbh->prepare($statement);
	$rv  = $sth->execute() or die "can't execute the query: $sth->errstr";
	$tbl = $sth->fetchall_arrayref or die "$sth->errstr\n";

	for my $i ( 0 .. $#{$tbl} ) {
		$statement = "SELECT assembly_name FROM assemblies WHERE assembly_id = $tbl->[$i][0] ORDER BY assembly_name;";
		my $option_aref = $dbh->selectcol_arrayref($statement) || die $dbh->errstr;

		$option = $$option_aref[0];
		$option =~ s/"/''/g
		  ; # This substitution is done for form which allows javascript to function
		$case_string .= qq{
assembly_selected[assembly_selected.length] = new Option("$option", "$tbl->[$i][0]");
};
		if ( $chosen eq $full_assembly_lists[0] ) {
			$option_string .= qq{
assembly_selected[assembly_selected.length] = new Option("$option", "$tbl->[$i][0]n");
};
		}
	}
	$case_string .= qq{break;
};
}

#######################################################################
##		Print Page Head

$r->print(
	qq{<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US">
<head>
<title>Materials Viewer and Duplicator</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-language" content="en-US" />
<meta name="robots" content="noindex,nofollow" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta name="description" content="Materials Viewer and Duplicator" />
<meta name="author" content="Chris Bennett" />
<link rel="shortcut icon" href="/favicon.ico" />
<link href="/db.css" type="text/css" rel="stylesheet" media="screen" />
<link rel="stylesheet" type="text/css" href="/print.css" media="print" />
<link rel="stylesheet" type="text/css" href="/handheldimg.css" media="handheld" />
<script type="text/javascript" src="/javascript/external.js"></script>
<script type="text/javascript">
	//<![CDATA[
}
);
$r->print(
	qq/
if (window.addEventListener) {
	window.addEventListener("load",setupEvents,false);
} else if (window.attachEvent) {
	window.attachEvent("onload",setupEvents);
} else {
	window.onload=setupEvents;
}

function setupEvents(evnt) {
	var opts = document.getElementById("someForm").full_assembly_list_selected.options;
	var assembly_selected = document.getElementById("someForm").assembly_selected.options;
	$option_string
	document.getElementById("someForm").full_assembly_list_selected.onchange = checkSelect;
	
}

function checkSelect(evnt) {
	var opts = document.getElementById("someForm").full_assembly_list_selected.options;
	var assembly_selected = document.getElementById("someForm").assembly_selected.options;

	for ( var i = 0; i < opts.length; i++) {
		if ( opts[i].selected ) {
			switch(opts[i].value) {
				$case_string
			}
		}
	}

	return false;
}
/
);
$r->print(
	qq{
//]]>
</script>}
);
$r->print(
	qq{
</head>
<body>
<div>
<a class="bigblue" href="/index.html" rel="external">Bennett Construction Home Page</a><br />
<a class="biggreen" href="/perl/VP/manual.pl?lang=en" rel="external">VIEW USAGE MANUAL</a><br />
<a class="biggreen" href="/perl/VP/manual.pl?lang=es" rel="external">VER MANUAL DE USAR</a><br />
<a class="bigblue" href="/perl/VP/gl.pl" rel="external">Labor and Projects</a><br />
<a class="bigblue" href="/perl/VP/pg.pl" rel="external">Products Vendors Customers Assemblies</a><br />
<a class="bigblue" href="/perl/VP/lab.pl" rel="external">Labor Viewer and Duplicator</a><br />
<a class="bigred" href="/logout">Log Off</a>
</div>
}
);

#######################################################################
##		Get CGI Params

my $full_assembly_list_selected = '';
my $assembly_selected           = '';
my $assembly_name               = '';

$full_assembly_list_selected = $q->param("full_assembly_list_selected") || '';
$assembly_selected           = $q->param("assembly_selected")           || '';
my $command = $q->param("command") || '';

#######################################################################
##		Select a Sub
$dbh->{AutoCommit} = 0;

if ( $command eq "ViewFALRecords" ) {
	ViewFALRecords( $r, $dbh, $q );
}
elsif ( $command eq "ViewFullFALRecords" ) {
	ViewFullFALRecords( $r, $dbh, $q );
}
elsif ( $command eq "DuplicateFullFALRecordsForm" ) {
	DuplicateFullFALRecordsForm( $r, $dbh, $q, $program );
}
elsif ( $command eq "DuplicateFullFALRecords" ) {
	DuplicateFullFALRecords( $r, $dbh, $q, $database );
}
else {
	$r->print(qq{<div class="cent"><p class="error">New Search?</p></div>});
}

$dbh->commit();
$dbh->{AutoCommit} = 1;
#######################################################################
##		Call Select Full Assembly List

SelectFALs( $r, $dbh, $program );

$dbh->disconnect;

=pod

=head1 NAME

tr.pl - View and reproduce similar full assembly list trees to bottom.

=head1 VERSION

This documentation refers to tr.pl version 1.1.00.

=head1 SYNOPSIS

Form asks which full assembly list tree to view or work with for similar
duplicates

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

