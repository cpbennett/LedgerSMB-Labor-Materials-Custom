#!/usr/bin/perl

our $VERSION = 1.1.00;
use warnings;
use strict;

use Apache::Request();
use DBI();
use Config::Std;
use BWC::SelectLPL qw(SelectLPLs);
use BWC::ViewLPLRecords
    qw(ViewLPLRecords DuplicateFullLPLRecordsForm DuplicateFullLPLRecords);
use BWCL::ShowAdmin qw(error_message);

#######################################################################
##		Connect to Database

my $filename = 'LaborViewerDuplicator.cfg';
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
## Note: Nonpersistent Database connection in a Persistent Environment is as Follows:
##my $dbh = DBI->connect("DBI:Pg:dbname=$database;host=$hostname;port=5432", $username, $password, {'RaiseError' => 1, dbi_connect_method => 'connect'});

my $program = $config_hash_ref->{'Program'}{'program_path_name'};

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

#######################################################################
#	Prepare Javascript in Head

my $labor_project_list_string = "";
my $case_string               = "";
my $option_string             = "";
my @columns                   = ();
my @labor_project_lists       = ();
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
    "SELECT
            labor_project_list_name
       FROM labor_project_list
   ORDER BY labor_project_list_name;"
);
$sth->execute;
while ( @vetor = $sth->fetchrow ) {
    push( @labor_project_lists, @vetor );
}
$sth->finish();
$option_string
    .= qq{labor_project_selected[labor_project_selected.length] = new Option("All", "All");
};

$labor_project_list_string = join( ',', @labor_project_lists );
foreach my $chosen (@labor_project_lists) {
    $chosenh        = $chosen;
    $chosenh_pretty = $chosen;
    $chosenh_pretty =~ s/"/''/g
        ; # This substitution is done for form which allows javascript to function
    $case_string .= qq{
		case "$chosenh_pretty" :
		labor_project_selected.length = 0;
		labor_project_selected[labor_project_selected.length] = new Option("All", "All");

};
    $chosen2   = $dbh->quote($chosen);
    $statement = "SELECT
                         labor_project_id
                    FROM labor_project
                   WHERE labor_project_name = $chosen2
                ORDER BY labor_project_id;";
    $sth = $dbh->prepare($statement);
    $rv  = $sth->execute()
        or die "can't execute the query: $sth->errstr";
    $tbl = $sth->fetchall_arrayref or die "$sth->errstr\n";

    for my $i ( 0 .. $#{$tbl} ) {
        $statement = "SELECT
                             labor_project_section
                        FROM labor_project
                       WHERE labor_project_id = $tbl->[$i][0]
                    ORDER BY labor_project_section;";
        my $option_aref = $dbh->selectcol_arrayref($statement)
            || die $dbh->errstr;

        $option = $$option_aref[0];
        unless ( defined $option ) { next; }
        $option =~ s/"/''/g
            ; # This substitution is done for form which allows javascript to function
        $case_string .= qq{
labor_project_selected[labor_project_selected.length] = new Option("$option", "$tbl->[$i][0]");
};
        if ( $chosen eq $labor_project_lists[0] ) {
            $option_string .= qq{
labor_project_selected[labor_project_selected.length] = new Option("$option", "$tbl->[$i][0]");
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
<title>Labor Project Viewer and Duplicator</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-language" content="en-US" />
<meta name="robots" content="noindex,nofollow" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta name="description" content="Labor Project and Duplicator" />
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
	var opts = document.getElementById("someForm").labor_project_list_selected.options;
	var labor_project_selected = document.getElementById("someForm").labor_project_selected.options;
	$option_string
	document.getElementById("someForm").labor_project_list_selected.onchange = checkSelect;
	
}

function checkSelect(evnt) {
	var opts = document.getElementById("someForm").labor_project_list_selected.options;
	var labor_project_selected = document.getElementById("someForm").labor_project_selected.options;

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
    qq#
</head>
<body>
$config_hash_ref->{'Top of Page Links'}{'top_of_page_links'}
#
);

my $commands = $config_hash_ref->{'Commands'}{'commands'};

#######################################################################
##		Get CGI Params

my $labor_project_list_selected = '';
my $labor_project_selected      = '';
my $labor_project_name          = '';

$labor_project_list_selected = $q->param("labor_project_list_selected")
    || '';
$labor_project_selected = $q->param("labor_project_selected") || '';
my $command = $q->param("command")
    || goto ERROR_END;
unless ($command~~@$commands) {
    error_message($r, $lang, "un comando valido", "a valid command");
    goto ERROR_END;
}

#######################################################################
##		Select a Sub
$dbh->{AutoCommit} = 0;

if ( $command eq "ViewLPLRecords" ) {
    ViewLPLRecords( $config_hash_ref );
}
elsif ( $command eq "ViewFullLPLRecords" ) {
    ViewFullLPLRecords( $config_hash_ref );
}
elsif ( $command eq "DuplicateFullLPLRecordsForm" ) {
    DuplicateFullLPLRecordsForm( $config_hash_ref );
}
elsif ( $command eq "DuplicateFullLPLRecords" ) {
    DuplicateFullLPLRecords( $config_hash_ref );
}
else {
    $r->print(
        qq{<div class="cent"><p class="error">Please make a selection.</p></div>}
    );
}

$dbh->commit();
$dbh->{AutoCommit} = 1;
#######################################################################
##		Call Select Full Assembly List
ERROR_END:

SelectLPLs( $config_hash_ref );

$dbh->disconnect;

=pod

=head1 NAME

labbz.pl - View and reproduce similar labor project list trees to bottom.

=head1 VERSION

<<<<<<< HEAD
This documentation refers to lab.pl version 1.1.00.
=======
This documentation refers to labbz.pl version 1.0.00.
>>>>>>> 046a64e928f11a0dee2d07ade9d70a85832d2c2c

=head1 SYNOPSIS

Form asks which labor project list tree to view or work with for similar
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

