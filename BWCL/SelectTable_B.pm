package BWCL::SelectTable_B;

our $VERSION = 4.1.00;
use warnings;
use strict;

require Exporter;
our @ISA       = qw(Exporter);
our @EXPORT_OK = qw(PrepareHead SelectTable);

#######################################################################
##		Sub PrepareHead

sub PrepareHead {
    my $r           = shift;
    my $dbh         = shift;
    my $program     = shift;
    my $title       = shift;
    my $description = shift;
    my $lang        = shift;

#######################################################################
    #	Prepare Javascript in Head

    my $table_string   = "";
    my $case_string    = "";
    my $option_string  = "";
    my $option_stringc = '';
    my $case_stringc   = '';
    my @columns        = ();
    my @tables         = ();
    my $sth = $dbh->table_info( '', 'public', undef, 'TABLE' );
    for my $rel ( @{ $sth->fetchall_arrayref( {} ) } ) {
        push( @tables, "\'$rel->{TABLE_NAME}\'" );
    }
    $sth->finish();
    $option_string
        .= qq{field_selected[field_selected.length] = new Option("", "");
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
        my $statement
            = "SELECT column_name FROM information_schema.columns WHERE table_name = $chosen;";
        my $sth = $dbh->prepare($statement);
        my $rv  = $sth->execute()
            or die "can't execute the query: $sth->errstr";
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
    unless ( $program =~ /gl/ ) {
        my $all_subclasses_aref
            = $dbh->selectcol_arrayref(
            "SELECT DISTINCT subclass FROM products ORDER BY subclass;"
            );
        for my $subclass (@$all_subclasses_aref) {
            if ( defined $subclass ) {
                $option_stringc .= qq{
					subclass_selected[subclass_selected.length] = new Option("$subclass", "$subclass");
					};
            }
        }
        my $statement
            = "SELECT distinct class from products ORDER BY class;";
        $sth = $dbh->prepare($statement);
        my $rv = $sth->execute()
            or die "can't execute the query: $sth->errstr";
        my $classes_aref = $dbh->selectcol_arrayref($statement)
            ;    # or die "$sth->errstr\n";
        $case_stringc .= qq{
		case 'All' :
					subclass_selected.length = 0;
					subclass_selected[subclass_selected.length] = new Option("All", "All");
					$option_stringc
					break;
};

        for my $i ( 0 .. ( $#{$classes_aref} - 1 ) ) {
            $$classes_aref[$i] = $dbh->quote( $$classes_aref[$i] );
            $statement
                = "SELECT DISTINCT subclass FROM products WHERE class = $$classes_aref[$i] ORDER BY subclass;";

            $case_stringc .= qq|
		case $$classes_aref[$i] :
					subclass_selected.length = 0;
					subclass_selected[subclass_selected.length] = new Option("All", "All");
				|;
            my $subclass_href
                = $dbh->selectall_hashref( $statement, 'subclass' );
            for my $keys ( sort keys %$subclass_href ) {
                for my $keys2 ( sort keys %{ $$subclass_href{$keys} } )
                {
                    if ( defined $$subclass_href{$keys}{$keys2} ) {
                        $case_stringc .= qq|
					subclass_selected[subclass_selected.length] = new Option("$$subclass_href{$keys}{$keys2}", "$$subclass_href{$keys}{$keys2}");
|;

                    }
                }

            }
            $case_stringc .= qq{break;
};
        }
    }
#######################################################################
##		Print Page Head

    $r->print(
        qq#<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="$lang" lang="$lang">
<head>
<title>$title</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-language" content="$lang" />
<meta name="robots" content="noindex,nofollow" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta name="description" content=$description" />
<meta name="author" content="Chris Bennett" />
<link rel="shortcut icon" href="/favicon.ico" />
<link href="/db.css" type="text/css" rel="stylesheet" media="screen" />
<link rel="stylesheet" type="text/css" href="/print.css" media="print" />
<link rel="stylesheet" type="text/css" href="/handheldimg.css" media="handheld" />
<script type="text/javascript" src="/javascript/external.js"></script>
<script type="text/javascript">
//<![CDATA[
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
#
    );

    if ( $lang eq "es" ) {
        $r->print(
            qq#
alert("Por favor, selecciona un comando");
#
        );
    }
    else {
        $r->print(
            qq#
alert("Please Select a Command");
#
        );
    }
    $r->print(
        qq#
return false;
}
//]]>
</script>
#
    );

    unless ( $program =~ /gl/ ) {
        $r->print(
            qq#<script type="text/javascript">
//<![CDATA[
if (window.addEventListener) {
	window.addEventListener("load",setupEventsC,false);
} else if (window.attachEvent) {
	window.attachEvent("onload",setupEventsC);
} else {
	window.onload=setupEventsC;
}

function setupEventsC(evnt) {
	var opts = document.getElementById("someForm").class_selected.options;
	var subclass_selected = document.getElementById("someForm").subclass_selected.options;
					subclass_selected[subclass_selected.length] = new Option("All", "All");
	$option_stringc
	document.getElementById("someForm").class_selected.onchange = checkSelectC;
	
}

function checkSelectC(evnt) {
	var opts = document.getElementById("someForm").class_selected.options;
	var subclass_selected = document.getElementById("someForm").subclass_selected.options;

	for ( var i = 0; i < opts.length; i++) {
		if ( opts[i].selected ) {
			switch(opts[i].value) {
				$case_stringc
			}
		}
	}

	return false;
}
</script>
#
        );
    }
    $r->print(
        qq#
</head>
<body>
<div>
<a class="bigblue" href="/index.html" rel="external">Bennett Construction</a><br />
<a class="biggreen" href="/perl/VPCP/manual.pl" rel="external">MANUAL</a><br />
<a class="bigblue" href="/perl/VPCP/pg_glpc-B.pl" rel="external">Labor Projects</a><br />
<a class="bigblue" href="/perl/VPCP/pg_wmod-B.pl" rel="external">Products Vendors Customers Assemblies</a><br />
<a class="bigblue" href="/perl/VPCP/treez.pl" rel="external">Materials Viewer and Duplicator</a><br />
<a class="bigblue" href="/perl/VPCP/labbz.pl" rel="external">Labor Viewer and Duplicator</a><br />
<a class="bigred" href="/logout">Log Off</a>
</div>
#
    );

}
#######################################################################
##		Sub SelectTable

sub SelectTable {
    my $r                = shift;
    my $dbh              = shift;
    my $program          = shift;
    my $field_table_aref = shift;
    my $lang             = shift;
    my $select_label;
    my $ucfirst;
    my $tbl       = "";
    my $statement = "";

    if ( $lang eq "es" ) {
        $r->print(
            qq{<div>
	<h2>Favor de seleccionar un comando y tabla para usar</h2>
	<form id="someForm" name="someForm" action="$program" method="post">
	<div>
	<table summary="" border="2" rules="all">
	<tbody>
	<tr>
	<td><label for="table_selected">Tabla</label></td>
	<td><select id="table_selected" name="table_selected">
	}
        );
    }
    else {
        $r->print(
            qq{<div>
	<h2>Please select a command and a table to use</h2>
	<form id="someForm" name="someForm" action="$program" method="post">
	<div>
	<table summary="" border="2" rules="all">
	<tbody>
	<tr>
	<td><label for="table_selected">Table</label></td>
	<td><select id="table_selected" name="table_selected">
	}
        );
    }
    my $sth = $dbh->table_info( '', 'public', undef, 'TABLE' );
    for my $rel ( @{ $sth->fetchall_arrayref( {} ) } ) {
        $r->print(
            qq{<option value="$rel->{TABLE_NAME}">$rel->{TABLE_NAME}</option>
	}
        );
    }
    $sth->finish();
    $r->print(
        qq{</select></td>
	<td><label for="id_selected">ID</label></td>
	<td><input type="text" id="id_selected" name="id_selected" value="" /></td>
	</tr><tr>
	}
    );
    #######################################################################
    #	loop for pre-chosen fields/tables
    for my $i ( 0 .. $#$field_table_aref ) {
        $ucfirst = $field_table_aref->[$i][0];
        $ucfirst =~ s/_(\w)/ \u$1/g;
        $ucfirst =~ s/ Id/ ID/;
        $ucfirst =~ s/ Url/ URL/;
        $select_label = ucfirst($ucfirst);
        $select_label
            =~ s/&/&amp;/g;    #Changed for HTML::Entities --Chris
        $select_label
            =~ s/ /&nbsp;/g;    #To make non-breaking spaces in labels
        $select_label =~ s/"/&quot;/g
            ; # Pisses me off I can't find a way to deal with BOTH ' and " in XHTML forms
        $statement
            = "SELECT DISTINCT $field_table_aref->[$i][0] FROM $field_table_aref->[$i][1] WHERE $field_table_aref->[$i][0] IS NOT NULL AND $field_table_aref->[$i][0] <> '' ORDER BY $field_table_aref->[$i][0];";
        my $select_array_ref = $dbh->selectcol_arrayref($statement)
            || die $dbh->errstr;

        if ( ( $i == 2 ) || ( $i == 4 ) || ( $i == 6 ) ) {
            $r->print(qq{</tr><tr>});
        }
        $r->print(
                  qq{<td><label for="$field_table_aref->[$i][0]}
                . qq{_selected">$select_label</label></td>
		<td><select id="$field_table_aref->[$i][0]}
                . qq{_selected" name="$field_table_aref->[$i][0]}
                . qq{_selected">
		<option value="All">All</option>
		}
        );

        foreach my $select (@$select_array_ref) {
            if ( defined $select ) {
                $select =~ s/"/&quot;/g
                    ; # Pisses me off I can't find a way to deal with BOTH ' and " in XHTML forms
                $r->print(
                    qq{<option value="$select">$select</option>
		}
                );
            }
        }
        $r->print(qq{</select></td>});
    }
    if ( $lang eq "es" ) {
        $r->print(
            qq{
	<td><label for="itemstoinsert">Numero de unidades en grupo para insertar</label></td><td><select id="itemstoinsert" name="itemstoinsert">
	<option selected="selected" value="1">1</option>
	}
        );
    }
    else {
        $r->print(
            qq{
	<td><label for="itemstoinsert">Items to Insert in Group</label></td><td><select id="itemstoinsert" name="itemstoinsert">
	<option selected="selected" value="1">1</option>
	}
        );
    }
    for my $i ( 2 .. 36 ) {
        $r->print(
            qq{
		<option value="$i">$i</option>
		}
        );
    }
    if ( $lang eq "es" ) {
        $r->print(
            qq{</select></td>	
	</tr>
	<tr>
	<td><label for="field_selected">Columna</label></td>
	<td><script type="text/javascript">
	//<![CDATA[
	document.writeln('<select id="field_selected" name="field_selected"></select>');
	//]]>
	</script>
	<noscript><input type="text" id="field_selected" name="field_selected" value="" /></noscript>
	</td>
	<td><label for="field_value_selected">RegEx para valor de columna</label></td>
	<td><input type="text" id="field_value_selected" name="field_value_selected" value="" />
	<label for="field_value_selected_null">NULL</label>
	<input type="checkbox" value="NULL" id="field_value_selected_null" name="field_value_selected_null" /></td>
	</tr>
	<tr>
	<td><label for="field_selected2">Segunda columna</label></td>
	<td><script type="text/javascript">
	//<![CDATA[
	document.writeln('<select id="field_selected2" name="field_selected2"></select>');
	//]]>
	</script>
	<noscript><input type="text" id="field_selected2" name="field_selected2" value="" /></noscript>
	</td>
	<td><label for="field_value_selected2">RegEx para valor de segunda columna</label></td>
	<td><input type="text" id="field_value_selected2" name="field_value_selected2" value="" />
	<label for="field_value_selected2_null">NULL</label>
	<input type="checkbox" value="NULL" id="field_value_selected2_null" name="field_value_selected2_null" /></td>
	</tr>
	</tbody></table>
	<br />
	<div>
	<input type="submit" value="Enviar" name="submitForm" onclick="return checkscript()" />
	<input type="reset" value="Borrar" name="reset1" />
	</div>
	<input type="radio" value="InsertRecordGroupForm" id="InsertRecordGroupForm" name="command" />
	<label class="bigred" for="InsertRecordGroupForm">Insertar registro(s) (Selecciona una tabla con un numero de unidades para insertar)</label>
	<br />
	<br />
	<input type="radio" value="UpdateRecordForm" id="UpdateRecordForm" name="command" />
	<label class="bigblue" for="UpdateRecordForm">Actualizar un registro (Selecciona una tabla con un numero de ID)</label>
	<br />
	<br />
	<input type="radio" value="ViewRecords" id="ViewRecords" name="command" />
	<label class="bigblack" for="ViewRecords">Ver Registros (Selecciona una tabla con las opciones arriba y/o con columnas y sus RegEx seleccionados o NULL)</label>
	<br />
	<br />
	<input type="radio" value="ShowColumns" id="ShowColumns" name="command" />
	<label class="biggreen" for="ShowColumns">Mostrar columnas (Selecciona una tabla)</label>
	<br />
	<br />
	<input type="radio" value="DeleteDuplicates" id="DeleteDuplicates" name="command" />
	<label class="bigred" for="DeleteDuplicates">Borrar Duplicados(Selecciona una tabla, con limitaciones como clase y/o nombre de vendor con products tabla)</label>
	<br />
	<br />
	<input type="radio" value="ShowTables" id="ShowTables" name="command" />
	<label class="biggreen" for="ShowTables">Mostrar Tablas</label>
	<br />
	<br />
	<div>
	<input type="submit" value="Enviar" name="submitForm" onclick="return checkscript()" />
	<input type="reset" value="Borrar" name="reset1" />
	</div>
	</div></form>
	</div>
	</body></html>
	}
        );
    }
    else {
        $r->print(
            qq{</select></td>	
	</tr>
	<tr>
	<td><label for="field_selected">Field</label></td>
	<td><script type="text/javascript">
	//<![CDATA[
	document.writeln('<select id="field_selected" name="field_selected"></select>');
	//]]>
	</script>
	<noscript><input type="text" id="field_selected" name="field_selected" value="" /></noscript>
	</td>
	<td><label for="field_value_selected">Field Value RegEx</label></td>
	<td><input type="text" id="field_value_selected" name="field_value_selected" value="" />
	<label for="field_value_selected_null">NULL</label>
	<input type="checkbox" value="NULL" id="field_value_selected_null" name="field_value_selected_null" /></td>
	</tr>
	<tr>
	<td><label for="field_selected2">Second Field</label></td>
	<td><script type="text/javascript">
	//<![CDATA[
	document.writeln('<select id="field_selected2" name="field_selected2"></select>');
	//]]>
	</script>
	<noscript><input type="text" id="field_selected2" name="field_selected2" value="" /></noscript>
	</td>
	<td><label for="field_value_selected2">Second Field Value RegEx</label></td>
	<td><input type="text" id="field_value_selected2" name="field_value_selected2" value="" />
	<label for="field_value_selected2_null">NULL</label>
	<input type="checkbox" value="NULL" id="field_value_selected2_null" name="field_value_selected2_null" /></td>
	</tr>
	</tbody></table>
	<br />
	<div>
	<input type="submit" value="Submit" name="submitForm" onclick="return checkscript()" />
	<input type="reset" value="Reset" name="reset1" />
	</div>
	<input type="radio" value="InsertRecordGroupForm" id="InsertRecordGroupForm" name="command" />
	<label class="bigred" for="InsertRecordGroupForm">Insert Record(s) Form (Select a Table and how many items to insert)</label>
	<br />
	<br />
	<input type="radio" value="UpdateRecordForm" id="UpdateRecordForm" name="command" />
	<label class="bigblue" for="UpdateRecordForm">Update Record Form (Select a Table with an ID)</label>
	<br />
	<br />
	<input type="radio" value="ViewRecords" id="ViewRecords" name="command" />
	<label class="bigblack" for="ViewRecords">View Records (Select a Table with above options and/or with Fields and their RegEx Selected or NULL)</label>
	<br />
	<br />
	<input type="radio" value="ShowColumns" id="ShowColumns" name="command" />
	<label class="biggreen" for="ShowColumns">Show Columns (Select a Table)</label>
	<br />
	<br />
	<input type="radio" value="DeleteDuplicates" id="DeleteDuplicates" name="command" />
	<label class="bigred" for="DeleteDuplicates">Delete Duplicates (Select a table, use a limit such as class and/or vendor with products table)</label>
	<br />
	<br />
	<input type="radio" value="ShowTables" id="ShowTables" name="command" />
	<label class="biggreen" for="ShowTables">Show Tables</label>
	<br />
	<br />
	<div>
	<input type="submit" value="Submit" name="submitForm" onclick="return checkscript()" />
	<input type="reset" value="Reset" name="reset1" />
	</div>
	</div></form>
	</div>
	</body></html>
	}
        );
    }
}

=pod

=head1 NAME

BWCL::SelectTable_B

=head1 VERSION

This documentation refers to BWCL::SelectTable_B version 4.1.00.

=head1 SYNOPSIS

Prepares page head, including language and javascript.
Prepares form fields and commands to use.

=head1 DESCRIPTION

Prepares page head, including language and javascript.
Prepares form fields and commands to use.
Selects fields for table selected with javascript.
Add javascript to only show relevant subclasses after
selecting a class


=head1 BUGS AND LIMITATIONS

Using back in browser to not reset field and second field correctly.

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

1;
