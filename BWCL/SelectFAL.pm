package BWCL::SelectFAL;

our $VERSION = 1.4.00;
use warnings;
use strict;

require Exporter;
our @ISA       = qw(Exporter);
our @EXPORT_OK = qw(SelectFALs);

#######################################################################
##		Sub SelectFALs

sub SelectFALs {
    my ($arg_ref) = @_;
    my $r         = $arg_ref->{r};
    my $dbh       = $arg_ref->{dbh};
    my $program   = $arg_ref->{program};
    my $sth;
    my @full_assembly_lists = ();
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
	<td><label for="full_assembly_list_selected">Full Assembly List Item</label></td>
	<td><select id="full_assembly_list_selected" name="full_assembly_list_selected">
	}
    );
    $sth
        = $dbh->prepare(
        "SELECT full_assembly_list_name FROM full_assembly_list ORDER BY full_assembly_list_name;"
        );
    $sth->execute;

    while ( @vetor = $sth->fetchrow ) {
        push( @full_assembly_lists, @vetor );
    }
    $sth->finish();
    for my $build (@full_assembly_lists) {
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
	<td><label for="assembly_selected">Full Assembly Section to See</label></td>
	<td><script type="text/javascript">
	//<![CDATA[
	document.writeln("<select id='assembly_selected' name='assembly_selected'></select>");
	//]]>
	</script>
	<noscript><input type="text" id="assembly_selected" name="assembly_selected" value="All" /></noscript>
	</td>
	</tr>
	<tr>
	<td><label for="currency_selected">Currency - Used for Duplicate Records Only</label></td>
	<td><select id="currency_selected" name="currency_selected">
	}
    );
    $sth = $dbh->prepare(
        "SELECT currency FROM currencies ORDER BY currency DESC;");
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
	<input type="radio" value="ViewFALRecords" checked="checked" id="ViewFALRecords" name="command" />
	<br />
	<br />
	<label for="command">View Full Records</label>
	<input type="radio" value="ViewFullFALRecords" id="ViewFullFALRecords" name="command" />
	<br />
	<br />
	<label for="command">Duplicate Records</label>
	<input type="radio" value="DuplicateFullFALRecordsForm" id="DuplicateFullFALRecordsForm" name="command" />
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

BWCL::SelectFAL - Select which tree to examine or duplicate.

=head1 VERSION

This documentation refers to BWCL::SelectFAL version 1.4.00.

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
