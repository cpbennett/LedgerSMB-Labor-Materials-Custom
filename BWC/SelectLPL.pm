package BWC::SelectLPL;

our $VERSION = 0.0.02;
use warnings;
use strict;

require Exporter;
our @ISA       = qw(Exporter);
our @EXPORT_OK = qw(SelectLPLs);

#######################################################################
##		Sub SelectLPLs

sub SelectLPLs {
	# version 0.2
	my $r       = shift;
	my $dbh     = shift;
	my $program = shift;
	my $sth;
	my @labor_project_lists = ();
	my @currencies          = ();
	my @vetor               = ();
	my $build;
	$r->print(
		qq{<div>
	<h2>Please select both an item and an item section to see</h2>
	<form id="someForm" name="someForm" action="$program" method="post">
	<div>
	<table summary="" border="2" rules="all">
	<tbody>
	<tr>
	<td><label for="labor_project_list_selected">Labor Project List Item</label></td>
	<td><select id="labor_project_list_selected" name="labor_project_list_selected">
	}
	);
	$sth = $dbh->prepare(
"SELECT labor_project_list_name FROM labor_project_list ORDER BY labor_project_list_name;"
	);
	$sth->execute;
	while ( @vetor = $sth->fetchrow ) {
		push( @labor_project_lists, @vetor );
	}
	$sth->finish();
	for my $build (@labor_project_lists) {
		$build =~ s/"/''/g
		  ; # This substitution is done for form which allows javascript to function
		$r->print(
			qq{<option value="$build">$build</option>
	}
		);
	}
	$r->print(
		qq{</select></td>
	</tr>
	<tr>
	<td><label for="labor_project_selected">Labor Project Section to See</label></td>
	<td><script type="text/javascript">
	//<![CDATA[
	document.writeln("<select id='labor_project_selected' name='labor_project_selected'></select>");
	//]]>
	</script>
	<noscript><input type="text" id="labor_project_selected" name="labor_project_selected" value="All" /></noscript>
	</td>
	</tr>
	<tr>
	<td><label for="currency_selected">Currency - Used for Duplicate Records Only</label></td>
	<td><select id="currency_selected" name="currency_selected">
	}
	);
	$sth =
	  $dbh->prepare("SELECT currency FROM currenciesg ORDER BY currency DESC;");
	$sth->execute;
	while ( @vetor = $sth->fetchrow ) {
		push( @currencies, @vetor );
	}
	$sth->finish();
	for my $currency (@currencies) {
		$r->print(
			qq{<option value="$currency">$currency</option>
	}
		);
	}
	$r->print(
		qq{</select></td>
	</tr>

	</tbody></table>
	<br />
	<label for="command">View Records</label>
	<input type="radio" value="ViewLPLRecords" checked="checked" id="ViewLPLRecords" name="command" />
	<br />
	<br />
	<label for="command">Duplicate Records</label>
	<input type="radio" value="DuplicateFullLPLRecordsForm" id="DuplicateFullLPLRecordsForm" name="command" />
	<br />
	<br />

	<div>
	<input type="submit" value="Submit" name="submitForm" />
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

BWC::SelectLPL - Select which tree to examine or duplicate.

=head1 VERSION

This documentation refers to BWC::SelectLPL version 0.0.02.

=head1 SYNOPSIS


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
