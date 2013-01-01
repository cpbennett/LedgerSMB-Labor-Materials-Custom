package BWCL::SelectTable_B;

our $VERSION = 4.5.50;

use warnings;
use strict;

require Exporter;
our @ISA       = qw(Exporter);
our @EXPORT_OK = qw(PrepareHead SelectTable);

#######################################################################
##        Sub PrepareHead

sub PrepareHead {
    my ($arg_ref) = @_;
    my $r         = $arg_ref->{r};
    my $dbh       = $arg_ref->{dbh};
    my @tables    = ();
    my @array;
    my $sth;
 
       #       this section creates javascript variable cat"x"
        my @both_columns;
        my $field_table_aref = $arg_ref->{field_table_aref};
        my $l = 0;
        my $primary_and_secondary;
        my @primary_secondary_split;
        my $old_primary = '';
        my $primary;
        my $secondary;
        my $statement;
        my $rv1;

        # Next step subtracts one to remove single alone field on form
    for my $k (0 .. ($#$field_table_aref - 3) ) {
        $statement
            = "SELECT DISTINCT ($field_table_aref->[$l][0], $field_table_aref->[$l+1][0]) FROM $field_table_aref->[$l][1] WHERE $field_table_aref->[$l][0] IS NOT NULL;";
        $sth = $dbh->prepare($statement);
        $rv1 = $sth->execute();
        
    CASE:
        while ( @both_columns = $sth->fetchrow_array() ) {
            $primary_and_secondary = $both_columns[0];
            $primary_and_secondary =~ s/\(//g;
            $primary_and_secondary =~ s/\)//g;
            $primary_and_secondary =~ s/"//g;
            @primary_secondary_split = split /,/, $primary_and_secondary;
            $primary     = $primary_secondary_split[0];
            $secondary  = $primary_secondary_split[1] || '';
            if ( !defined $primary ) {
                next CASE;
            }

            if ( $primary eq $old_primary ) {

                if ( $secondary ne '' ) {
                    $array[$k] .= qq{, '$secondary'};
                }
                next CASE;
            }
            elsif ( $old_primary ne '' ) {
                $array[$k] .= qq{],
};
                $array[$k] .= qq{'$primary':['All', '$secondary'};
            }
            else {
                $array[$k] .= qq{'$primary':['All', '$secondary'};
            }
            $old_primary = $primary;
        }
        $array[$k] .= "]
        }
}";
        $array[$k] =~ s/, ''//g;
        $array[$k] = qq|var cat$k={'$field_table_aref->[$l][0]_selected':
        {$array[$k]|;

 $array[$k] .= qq|
 function dropdownlist_category_selected$k(listname,listindex)
{
  var catsel$k=document.someForm.elements['$field_table_aref->[$l+1][0]_selected'+listname];
  catsel$k.options.length=1;
  if (listindex in cat$k| . qq|[listname])
    for (var i=0,l=cat$k| . qq|[listname][listindex].length;i<l;i++)
      catsel$k.options[i+1]=new Option(cat$k| .qq|[listname][listindex][i],cat$k| .qq|[listname][listindex][i]);
return true;

      }
      |;

$l = $l + 2;
$old_primary = '';
}

#######################################################################
##        Print Page Head

    $r->print(
        qq#<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="$arg_ref->{lang}" lang="$arg_ref->{lang}">
<head>
<title>$arg_ref->{title}</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-language" content="$arg_ref->{lang}" />
<meta name="robots" content="noindex,nofollow" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta name="description" content=$arg_ref->{description}" />
<meta name="author" content="Chris Bennett" />
<link rel="shortcut icon" href="/favicon.ico" />
<link href="/db.css" type="text/css" rel="stylesheet" media="screen" />
<link rel="stylesheet" type="text/css" href="/print.css" media="print" />
<link rel="stylesheet" type="text/css" href="/handheldimg.css" media="handheld" />
<script type="text/javascript" src="/javascript/external.js"></script>
#
);
        $field_table_aref = $arg_ref->{field_table_aref};
        for my $k (0 .. ($#$field_table_aref - 3) ) {

        $r->print(
            qq#<script type="text/javascript">
$array[$k]
 </script>
    #
);
}
$r->print(
            qq#<script type="text/javascript">
            #
            );

my $tablecol;   
$sth = $dbh->table_info( '', 'public', undef, 'TABLE' );
    for my $rel ( @{ $sth->fetchall_arrayref( {} ) } ) {
        push( @tables, "\'$rel->{TABLE_NAME}\'" );
    }
    $sth->finish();
        $tablecol = qq|var tablecol={
  'table_selected':{|;
    my %temp = ();
    @tables = grep ++$temp{$_} < 2, @tables;
    foreach my $chosen (@tables) {
    $tablecol .= qq|
    $chosen:[|;
        my $statement
            = "SELECT DISTINCT column_name FROM information_schema.columns WHERE table_name = $chosen;";
        my $sth = $dbh->prepare($statement);
        my $rv  = $sth->execute()
            or die "can't execute the query: $sth->errstr";
        my $tbl = $sth->fetchall_arrayref or die "$sth->errstr\n";
        for my $i ( 0 .. $#{$tbl} ) {
            $tablecol .= qq|'$tbl->[$i][0]',|;
            }
            $tablecol =~ s/,$//g;
        $tablecol .= qq|],|;
        }
        $tablecol =~ s/,$//g;
    $tablecol .= qq|
    }
}|;

$r->print( qq#
$tablecol

function dropdownlist_table_selected(listname,listindex)
{
  var subfield=document.someForm.elements['field_selected'+listname];
  subfield.options.length=1;
  if (listindex in tablecol[listname])
    for (var i=0,l=tablecol[listname][listindex].length;i<l;i++)
      subfield.options[i+1]=new Option(tablecol[listname][listindex][i],tablecol[listname][listindex][i]);

  var subfield2=document.someForm.elements['field_selected2'+listname];
  subfield2.options.length=1;
  if (listindex in tablecol[listname])
    for (var i=0,l=tablecol[listname][listindex].length;i<l;i++)
      subfield2.options[i+1]=new Option(tablecol[listname][listindex][i],tablecol[listname][listindex][i]);

  return true;
}



function checkscript() {
    for (i=0;i<document.someForm.command.length;i++) {
        if (document.someForm.command[i].checked) {
            return true;
        }
}

#
);
    if ( $arg_ref->{lang} eq "es" ) {
        $r->print(
            qq{
alert("Por favor, selecciona un comando");
}
                 );
    }
    else {
        $r->print(
            qq{
alert("Please Select a Command");
}
                 );
    }
    $r->print(
        qq#
return false;
}
</script>
#
             );

    $r->print(
        qq#
</head>
<body>
$arg_ref->{'Top of Page Links'}{'top_of_page_links'}
#
             );


}
#######################################################################
##        Sub SelectTable

sub SelectTable {
    my ($arg_ref)        = @_;
    my $r                = $arg_ref->{r};
    my $dbh              = $arg_ref->{dbh};
    my $field_table_aref = $arg_ref->{field_table_aref};
    my $lang             = $arg_ref->{lang};
    my $select_label;
    my $ucfirst;
    my $tbl       = "";
    my $statement = "";

    if ( $lang eq "es" ) {
        $r->print(
            qq{<div>
    <h2>Favor de seleccionar un comando y tabla para usar</h2>
    <form id="someForm" name="someForm" action="$arg_ref->{'Program'}{'program_path_name'}" method="post">
    <div>
    <table summary="" border="2" rules="all">
    <tbody>
    <tr>
    <td><label for="table_selected">Tabla</label></td>
    <td><select id="table_selected" name="table_selected" onchange="dropdownlist_table_selected(this.name,this.options[this.selectedIndex].value);">
    }
                 );
    }
    else {
        $r->print(
            qq{<div>
    <h2>Please select a command and a table to use</h2>
    <form id="someForm" name="someForm" action="$arg_ref->{'Program'}{'program_path_name'}" method="post">
    <div>
    <table summary="" border="2" rules="all">
    <tbody>
    <tr>
    <td><label for="table_selected">Table</label></td>
    <td><select id="table_selected" name="table_selected" onchange="dropdownlist_table_selected(this.name,this.options[this.selectedIndex].value);">
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
    </tr>
    <tr>
    }
             );
    #######################################################################
    #    loop for pre-chosen fields/tables
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
            $r->print(qq{</tr>
                <tr>});
        }
            if ( $i == 0 ) {
            $r->print(qq{<td><label for="$field_table_aref->[$i][0]_selected">$select_label</label></td>
        <td><select id="$field_table_aref->[$i][0]_selected" name="$field_table_aref->[$i][0]_selected" onchange="dropdownlist_category_selected0(this.name,this.options[this.selectedIndex].value);"}
            );
        }
            elsif ( $i == 2 ) {
                 $r->print(qq{<td><label for="$field_table_aref->[$i][0]_selected">$select_label</label></td>
        <td><select id="$field_table_aref->[$i][0]_selected" name="$field_table_aref->[$i][0]_selected" onchange="dropdownlist_category_selected1(this.name,this.options[this.selectedIndex].value);"}
            );
        }
        else {
             $r->print(
                  qq{<td><label for="$field_table_aref->[$i][0]_selected$field_table_aref->[$i-1][0]_selected">$select_label</label></td>
        <td><select id="$field_table_aref->[$i][0]_selected$field_table_aref->[$i-1][0]_selected" name="$field_table_aref->[$i][0]_selected$field_table_aref->[$i-1][0]_selected"}
            );
        }

 $r->print(qq{><option value="All">All</option>
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
            qq{<td>
            <label for="itemstoinsert">Numero de unidades en grupo para insertar</label>
            </td>
            <td>
            <select id="itemstoinsert" name="itemstoinsert">
            <option selected="selected" value="1">1</option>
            }
                 );
    }
    else {
        $r->print(
            qq{<td>
            <label for="itemstoinsert">Items to Insert in Group</label>
            </td>
            <td>
            <select id="itemstoinsert" name="itemstoinsert">
            <option selected="selected" value="1">1</option>
            }
                 );
    }
    for my $i ( 2 .. 36 ) {
        $r->print(
            qq{<option value="$i">$i</option>
        }
                 );
    }
    if ( $lang eq "es" ) {
        $r->print(
            qq{</select></td>    
    </tr>
    <tr>
    <td><label for="field_selectedtable_selected">Columna</label></td>
    <td><select id="field_selectedtable_selected" name="field_selectedtable_selected"></select>
    </td>
    <td><label for="field_value_selected">RegEx para valor de columna</label></td>
    <td><input type="text" id="field_value_selected" name="field_value_selected" value="" />
    <label for="field_value_selected_null">NULL</label>
    <input type="checkbox" value="NULL" id="field_value_selected_null" name="field_value_selected_null" />
    <label for="field_value_selected_not">NOT</label>
    <input type="checkbox" value="NOT" id="field_value_selected_not" name="field_value_selected_not" />
    </td>
    </tr>
    <tr>
    <td><label for="field_selected2table_selected">Segunda columna</label></td>
    <td><select id="field_selected2table_selected" name="field_selected2table_selected"></select>
    </td>
    <td><label for="field_value_selected2">RegEx para valor de segunda columna</label></td>
    <td><input type="text" id="field_value_selected2" name="field_value_selected2" value="" />
    <label for="field_value_selected2_null">NULL</label>
    <input type="checkbox" value="NULL" id="field_value_selected2_null" name="field_value_selected2_null" />
    <label for="field_value_selected2_not">NOT</label>
    <input type="checkbox" value="NOT" id="field_value_selected2_not" name="field_value_selected2_not" /></td>
    </tr>
    </tbody>
    </table>
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
    }
                 );
        if ( @{ $arg_ref->{Commands}{commands} } ~~ /DeleteDuplicates/ ) {
            $r->print(
                qq{<input type="radio" value="DeleteDuplicates" id="DeleteDuplicates" name="command" />
    <label class="bigred" for="DeleteDuplicates">Borrar Duplicados(Selecciona una tabla, con limitaciones como clase y/o nombre de vendor con products tabla)</label>
    <br />
    <br />
    }
                     );
        }
        if ( @{ $arg_ref->{Commands}{commands} } ~~ /DeleteRecord/ ) {
            $r->print(
                qq{<input type="radio" value="DeleteRecordForm" id="DeleteRecordForm" name="command" />
    <label class="bigpurple" for="DeleteRecordForm">Borrar un Registro (Selecciona una tabla con un numero de ID)</label>
    <br />
    <br />
    }
                     );
        }

        $r->print(
            qq{
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
    <td><label for="field_selectedtable_selected">Field</label></td>
    <td><select id="field_selectedtable_selected" name="field_selectedtable_selected"></select>
    </td>
    <td>
    <label for="field_value_selected">Field Value RegEx</label>
    </td>
    <td>
    <input type="text" id="field_value_selected" name="field_value_selected" value="" /><br />
    <label for="field_value_selected_not">NOT</label>
    <input type="checkbox" value="NOT" id="field_value_selected_not" name="field_value_selected_not" />
    <label for="field_value_selected_null">NULL</label>
    <input type="checkbox" value="NULL" id="field_value_selected_null" name="field_value_selected_null" />
    </td>
    </tr>
    <tr>
    <td><label for="field_selected2table_selected">Second Field</label></td>
    <td><select id="field_selected2table_selected" name="field_selected2table_selected"></select>
    </td>
    <td>
    <label for="field_value_selected2">Second Field Value RegEx</label>
    </td>
    <td>
    <input type="text" id="field_value_selected2" name="field_value_selected2" value="" /><br />
    <label for="field_value_selected2_not">NOT</label>
    <input type="checkbox" value="NOT" id="field_value_selected2_not" name="field_value_selected2_not" />
    <label for="field_value_selected2_null">NULL</label>
    <input type="checkbox" value="NULL" id="field_value_selected2_null" name="field_value_selected2_null" />
    </td>
    </tr>
    </tbody>
    </table>
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
        }
                 );
        if ( @{ $arg_ref->{Commands}{commands} } ~~ /DeleteDuplicates/ )
        {
            $r->print(
                qq{<input type="radio" value="DeleteDuplicates" id="DeleteDuplicates" name="command" />
    <label class="bigred" for="DeleteDuplicates">Delete Duplicates (Select a table, use a limit such as class and/or vendor with products table)</label>
    <br />
    <br />
}
                     );
        }
        if ( @{ $arg_ref->{Commands}{commands} } ~~ /DeleteRecord/ )
        {
            $r->print(
                qq{<input type="radio" value="DeleteRecordForm" id="DeleteRecordForm" name="command" />
    <label class="bigpurple" for="DeleteRecordForm">Delete a Record (Select a Table with an ID)</label>
    <br />
    <br />
    }
                     );
        }

        $r->print(
            qq{
    <input type="radio" value="ShowTables" id="ShowTables" name="command" />
    <label class="biggreen" for="ShowTables">Show Tables</label>
    <br />
    <br />
    <div>
    <input type="submit" value="Submit" name="submitForm" onclick="return checkscript()" />
    <input type="reset" value="Reset" name="reset1" />
    </div>
    </div>
    </form>
    </div>
    </body>
    </html>
    }
                 );
    }
}

=pod

=head1 NAME

BWCL::SelectTable_B

=head1 VERSION

This documentation refers to BWCL::SelectTable_B version 4.5.50.

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
