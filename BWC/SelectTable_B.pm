package BWC::SelectTable_B;

our $VERSION = 2.3.00;
use warnings;
use strict;

require Exporter;
our @ISA       = qw(Exporter);
our @EXPORT_OK = qw(SelectTable);

#######################################################################
##		Sub SelectTable

sub SelectTable {
	my $r                = shift;
	my $dbh              = shift;
	my $program          = shift;
	my $field_table_aref = shift;
	my $select_label;
	my $ucfirst;
	my $tbl       = "";
	my $statement = "";
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
		$select_label =~ s/&/&amp;/g;     #Changed for HTML::Entities --Chris
		$select_label =~ s/ /&nbsp;/g;    #To make non-breaking spaces in labels
		$select_label =~ s/"/&quot;/g
		  ; # Pisses me off I can't find a way to deal with BOTH ' and " in XHTML forms
		$statement =
"SELECT DISTINCT $field_table_aref->[$i][0] FROM $field_table_aref->[$i][1] WHERE $field_table_aref->[$i][0] IS NOT NULL AND $field_table_aref->[$i][0] <> '' ORDER BY $field_table_aref->[$i][0];";
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

	$r->print(
		qq{
	<td><label for="itemstoinsert">Items to Insert in Group</label></td><td><select id="itemstoinsert" name="itemstoinsert">
	<option selected="selected" value="1">1</option>
	}
	);
	for my $i ( 2 .. 36 ) {
		$r->print(
			qq{
		<option value="$i">$i</option>
		}
		);
	}
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

=pod

=head1 NAME

BWC::SelectTable_B

=head1 VERSION

This documentation refers to BWC::SelectTable_B version 2.2.10.

=head1 SYNOPSIS

Select a table to work with and commands to use.

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

1;
