package BWCL::DeleteRecord_B;

our $VERSION = 0.0.03;

=pod

=head1 NAME

BWCL::DeleteRecord_B

=head1 VERSION

This documentation refers to BWCL::DeleteRecord_B version 0.0.03.

=cut

use warnings;
use strict;

require Exporter;
our @ISA       = qw(Exporter);
our @EXPORT_OK = qw(DeleteRecord DeleteRecordForm);

use HTML::Entities();
use Encode;

use BWCL::ViewRecords_B qw(ViewRecords);
use BWCL::BWCLFields qw(Selecter);
use BWCL::ShowAdmin qw(error_message specified_error_message);

#######################################################################
##        Sub DeleteRecordForm

sub DeleteRecordForm {
    my ($arg_ref) = @_;
    my $r         = $arg_ref->{r};
    my $q         = $arg_ref->{q};
    my $database  = $arg_ref->{database};
    my $dbh       = $arg_ref->{dbh};
    my $lang      = $arg_ref->{lang};
    my $table     = $arg_ref->{table};
    my $tbl;
    my $id = $arg_ref->{id};
    $arg_ref->{table_id} = $id;
    my $table_id_field;
    my @field_names = ();
    my $field_names;
    my $notes_fields;
    my $ucfirst;
    my $i;
    my @results      = ();
    my @results_n    = ();
    my @notes_fields = ();
    my $sth;
    my $statement3;

    ( undef, $table_id_field, undef ) = Selecter("RecordUpdatesForm", $table);
    $table_id_field = $$table_id_field;
    $arg_ref->{table_id_field} = $table_id_field;
    my $statement =
      "SELECT $table_id_field FROM $table WHERE $table_id_field = $id;";
    unless ( @results = $dbh->selectrow_array($statement) ) {
        error_message(
            $r, $arg_ref->{lang},
            "un numero de ID existente para esta tabla $table",
            "an existing ID number for this table $table"
        );
        return;
    }

    ViewRecords($arg_ref);
    $r->print(
        qq{
    <form action="$arg_ref->{Program}{program_path_name}" method="post"><div>
    }
    );
    if ( $arg_ref->{lang} eq "es" ) {
        $r->print(
            qq{<p class="cent">Registro para borrar de $table<br />
           $table_id_field = $id<br />
           <label class="cent" for="delete_me">Borrar?</label>

            }
        );
    }
    else {
        $r->print(
            qq{<p class="cent">Record to Delete from $table<br />
            $table_id_field = $id<br />
            <label class="cent" for="delete_me">Delete?</label>

            }
        );
    }

    $r->print(
qq{<input class="cent" type="checkbox" id="delete_me" name="delete_me" />
</p>
<input type="hidden" name="id_selected" value="$id" />
<input type="hidden" name="table_selected" value="$table" />
<input type="hidden" value="DeleteRecord" name="command" />
<div>
<br />
<br />
<br />}
    );
    if ( $arg_ref->{lang} eq "es" ) {
        $r->print(
            qq{
            <input type="submit" value="Continuar" name="submitForm" />
<input type="reset" value="Borrar" name="reset1" />            }
        );
    }
    else {
        $r->print(
            qq{
            <input type="submit" value="Continue" name="submitForm" />
<input type="reset" value="Reset" name="reset1" />
          }
        );
    }
    $r->print(
        qq{
<br />
<br />
<br />
</div></div></form>
<hr /><hr />
}
    );
}

#######################################################################
##        Sub DeleteRecord

#XXX
#  Note:  If I delete all full_assemblies below the full_assembly_list,
#  that goes to a total of $0
#  If I then add a full_assembly with the proper name, money returns,
#  but full_assembly_full_assembly_list_id does not reappear in full_assembly.
#  5C3566 purple for DeleteRecord

sub DeleteRecord {
    my ($arg_ref) = @_;
    my $r         = $arg_ref->{r};
    my $q         = $arg_ref->{q};
    my $dbh       = $arg_ref->{dbh};
    my $table     = $arg_ref->{table};
    if ( $table eq 'assemblies' ) {
        specified_error_message(
            $r,
            $arg_ref->{lang},
"Para borrar este registro,<br />
primero se necesita borrar todos los registros incluidos bajo este registro<br />
en la tabla full_assembly (si existen)<br />
y luego todos los registros correspondientes en la tabla assemblies_parts",
"To delete this record,<br />
it is neccesary to delete all of the records in full_assembly (if they exist)<br />
and then delete all of the corresponding records in assemblies_parts that this record refers to."
        );
        $r->print(qw{<div><h2>Full&nbsp; Assembly</h2></div>});
        $arg_ref->{table_id_field} = "full_assembly_assembly_id";
        $arg_ref->{table_id}       = $q->param("id_selected");
        $arg_ref->{table}          = "full_assembly";
        ViewRecords($arg_ref);

        $r->print(qw{<div><h2>Assemblies&nbsp; Parts</h2></div>});
        $arg_ref->{table_id_field} = "assembly_part_assembly_id";
        $arg_ref->{table_id}       = $q->param("id_selected");
        $arg_ref->{table}          = "assemblies_parts";
        ViewRecords($arg_ref);
        return;
    }
    elsif ( $table eq 'full_assembly' ) {
        specified_error_message(
            $r,
            $arg_ref->{lang},
"Si este registro es el ultimo registro correspondiente a la tabla full_assembly_list,<br />
el registro en la tabla full_assembly_list debe estar borrado tambien",
"If this record is the last record corresponding to the full_assembly_list record,<br />
that record should also be deleted."
        );
        $arg_ref->{field} = "full_assembly_list_name";
        my $full_assembly_name;
        my $full_assembly_id = $q->param("id_selected");
        ($full_assembly_name) = $dbh->selectrow_array(
"SELECT full_assembly_name FROM full_assembly WHERE full_assembly_id = $full_assembly_id;"
        );
        $arg_ref->{field_value} = $full_assembly_name;
        $arg_ref->{table}       = "full_assembly_list";
        ViewRecords($arg_ref);
    }

    my $delete_me = $q->param("delete_me");
    if ( !defined $delete_me ) {
        error_message(
            $r, $arg_ref->{lang},
            "Ningún registro borrado de la tabla $table",
            "No record deleted from the table $table"
        );
        return;

    }
    my $id = $q->param("id_selected");
    my $SQL;
    my $table_id_field;

#    open( my $fh, '>>', "../../deletes-B_$arg_ref->{Database}{database}.sql" ) or die $!;

    ( undef, $table_id_field ) = Selecter( "RecordUpdates", $table );
    $table_id_field = $$table_id_field;

    $SQL = "DELETE FROM $table WHERE $table_id_field = $id;";
    $r->print(qq{$SQL});
    my $ur = $dbh->do($SQL);
    if ($ur) {
        $r->print(qq{<div><h1>Success</h1></div>});
    }
    else {
        $r->print(qq{<div><h1>Failure -- $DBI::errstr</h1></div>});
    }

    #    print $fh $SQL;
    #    close $fh;

}

=pod

=head1 SYNOPSIS

Deletes existing records.

=head1 DESCRIPTION

DeleteRecordForm Shows a form to select a record to delete
DeleteRecord Deletes a record or gives a warning message

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
