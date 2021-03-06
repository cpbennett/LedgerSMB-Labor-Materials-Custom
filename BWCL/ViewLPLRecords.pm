package BWCL::ViewLPLRecords;

our $VERSION = 1.1.11;

=pod

=head1 NAME

BWCL::ViewLPLRecords

=head1 VERSION

This documentation refers to BWCL::ViewLPLRecords version 1.1.11.

=cut

use warnings;
use strict;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK =
  qw(ViewLPLRecords DuplicateFullLPLRecordsForm DuplicateFullLPLRecords);

use BWCL::InsertRecord_B qw(InsertRecordGroup);

#######################################################################
#    sub DuplicateFullLPLRecordsForm
#
#_l_p2_l_c_    _l_p2_l_c_
#_l_p2_c_   _l_p2_c_
sub DuplicateFullLPLRecordsForm {

    # version = 0.4
    my ($arg_ref)                   = @_;
    my $r                           = $arg_ref->{r};
    my $dbh                         = $arg_ref->{dbh};
    my $q                           = $arg_ref->{q};
    my $program                     = $arg_ref->{Program}{program_path_name};
    my $labor_project_list_selected = $arg_ref->{labor_project_list};
    $labor_project_list_selected=~ s/ In\./"/g;
    my $labor_project_list_selected2 =
      $dbh->quote($labor_project_list_selected);
    my $labor_project_selected = $arg_ref->{labor_project};
    $labor_project_selected =~ s/ In\./"/g;
    my $currency_selected      = $arg_ref->{currency};
    my $currency_selected2     = $dbh->quote($currency_selected);
    my $statement;
    my $sth;
    my $labor_project_name_aref;
    my $labor_project_name;
    #######################################################################
#    The following exist to deal with both javascript refusing to accept pleasant
#    symbols such as - ^ Etc. within id's etc.
#    But perl runs variables into underscores.
#    This deals with both idiocies
    my $fund   = "_labor_project_count_";
    my $flund  = "_labor_project_list_count_";
    my $fund2  = "_l_p2_c_";
    my $flund2 = "_l_p2_l_c_";
    my $empty;
    my @all_labor_projects = ();
    my @vetor              = ();
    my $l_p_c              = 1;    # labor_project_count
    my $l_p_l_c            = 1;    # labor_project_list_count

# This substitution reverses substitution
# done in form which allows javascript to function
    # $labor_project_selected      =~ s/''/"/g;
    # $labor_project_list_selected =~ s/''/"/g;



    $labor_project_list_selected =
      HTML::Entities::encode($labor_project_list_selected);
    my $labor_project_hash_ref;
    my @labor_project_hash_assemblys = (
        'labor_project_name',             'labor_project_section',
        'labor_project_class',            'labor_project_subclass',
        'labor_project_is_subcontracted', 'labor_project_days',
        'labor_project_received_in',      'labor_project_pay_out_rate',
        'method_to_charge',               'units_charged',
        'labor_project_currency',         'labor_project_notes',
        'labor_project_unit_notes',

    );
    my $labor_project_list_hash_ref;
    my @labor_project_list_hash_assemblys = (
        'labor_project_list_name',        'labor_project_list_category',
        'labor_project_list_subcategory', 'labor_project_list_currency',
        'labor_project_list_notes'
    );

    if ( $labor_project_selected eq 'All' ) {
        my $sth = $dbh->prepare(
            "SELECT
                    labor_project_id
               FROM labor_project
              WHERE labor_project_labor_project_list_id
                 IN
                    (
                        SELECT
                               labor_project_list_id
                          FROM labor_project_list
                         WHERE labor_project_list_name=$labor_project_list_selected2
                    )
           ORDER BY labor_project_name;"
        );
        $sth->execute;
        while ( @vetor = $sth->fetchrow ) {
            push( @all_labor_projects, @vetor );
        }
        $sth->finish();

    }
    else {
        push( @all_labor_projects, $labor_project_selected );
    }

####################################################################################
##        Fill Inputs Of Assemblies and Assemblies Parts With Existing Records
####################################################################################

    #######################################################################
    #    Normal Assembly Section
    #    Fills With Existing Assembly for Each Existing Assembly
    #    In Order of Assemblies Fetched
    #    All Assemblies Parts for Each Assembly Added in Loop
    #######################################################################

    $r->print(
        qq{
<div>
<h1 class="titlehead">$labor_project_list_selected</h1>
<br /><br />
<form name="duplicates" class="duplicates" id="duplicates" action="$program" method="post">
<div>
    }
    );

#######################################################################
    #    Normal Labor Project Section
#######################################################################
    if ( $labor_project_selected eq 'All' ) {
        my $sth = $dbh->prepare(
            "SELECT
                    labor_project_id
               FROM labor_project
              WHERE labor_project_labor_project_list_id
                 IN
                    (
                        SELECT
                               labor_project_list_id
                          FROM labor_project_list
                         WHERE labor_project_list_name=$labor_project_list_selected2
                    )
           ORDER BY labor_project_name;"
        );
        $sth->execute;
        while ( @vetor = $sth->fetchrow ) {
            push( @all_labor_projects, @vetor );
        }
        $sth->finish();

    }
    else {
        push( @all_labor_projects, $labor_project_selected );
    }

    $sth = $dbh->prepare(
        "SELECT
                labor_project_name,
                labor_project_section,
                labor_project_class,
                labor_project_subclass,
                labor_project_is_subcontracted,
                labor_project_days,
                labor_project_received_in,
                labor_project_pay_out_rate,
                method_to_charge,
                labor_project_unit_price,
                units_charged,
                labor_project_total_paid_out,
                labor_project_total,
                labor_project_currency,
                labor_project_notes,
                labor_project_unit_notes,
                labor_project_labor_project_list_id,
                labor_project_id
           FROM labor_project
          WHERE labor_project_name=$labor_project_list_selected2;"
    );
    $sth->execute();

    while ( $labor_project_hash_ref = $sth->fetchrow_hashref ) {
        $r->print(
            qq{<div class="f_a_c_$l_p_c" id="f_a_c_$l_p_c">
<p>labor_project_count_$l_p_c</p>
<table summary="" border="1" rules="all" class="full_assembly">
<caption class="FALcaption">Labor Projects For:<br />
<input class="fals" type="text" name="fals$fund2$l_p_c" id="fals$fund2$l_p_c" style="width:100%;font-weight:bold;text-align:center;font-size:1.0em;" value="$labor_project_list_selected" readonly="readonly" /></caption>
<tbody>}
        );

        foreach my $assemblyh (@labor_project_hash_assemblys) {
            if ( $$labor_project_hash_ref{$assemblyh} ) {
                $$labor_project_hash_ref{$assemblyh} = HTML::Entities::encode(
                    $$labor_project_hash_ref{$assemblyh} );
                #$$labor_project_hash_ref{$assemblyh} =~ s/"/''/g;
                $$labor_project_hash_ref{$assemblyh} =~ s/"/ In./g;
            }
            else {
                $$labor_project_hash_ref{$assemblyh} = '';
            }
        }
        $statement = "SELECT
                             labor_project_name
                        FROM labor_project
                       WHERE labor_project_id = $$labor_project_hash_ref{'labor_project_id'};";
        $labor_project_name_aref = $dbh->selectcol_arrayref($statement)
          || die $dbh->errstr;

        $labor_project_name = $$labor_project_name_aref[0];
        $labor_project_name = HTML::Entities::encode($labor_project_name);
        #$labor_project_name =~ s/"/''/g;
        $labor_project_name =~ s/"/ In./g;
        $r->print(
            qq{<tr>
<td align="left">Do Not Insert This Labor Project</td><td align="left" class="full_assembly">&nbsp;&nbsp;
<input class="full_assembly" type="checkbox" name="labor_project_DoNotInsert$fund2$l_p_c" id="labor_project_DoNotInsert$fund2$l_p_c" value="labor_project_DoNotInsert$fund2$l_p_c" />
</td>
</tr>
}
        );

        for my $fieldRR (@labor_project_hash_assemblys) {
            unless ( $fieldRR =~ /notes/
                || $fieldRR =~ /labor_project_name/ )
            {
                $r->print(
                    qq|<tr>
<td align="left">$fieldRR</td><td align="left" class="full_assembly">
<input class="full_assembly" type="text" name="labor_project_$fieldRR$fund2$l_p_c" id="labor_project_$fieldRR$fund2$l_p_c" value="$labor_project_hash_ref->{$fieldRR}" />
</td>
</tr>|
                );
            }
            elsif ( $fieldRR =~ /labor_project_name/ ) {
                $r->print(
                    qq|<tr>
<td align="left">$fieldRR</td><td align="left" class="full_assembly">
<input class="full_assembly" type="text" readonly="readonly" name="labor_project_$fieldRR$fund2$l_p_c" id="labor_project_$fieldRR$fund2$l_p_c" value="$labor_project_hash_ref->{$fieldRR}" />
</td>
</tr>|
                );
            }
            else {
                $r->print(
                    qq|<tr>
<td align="left">$fieldRR</td><td align="left" class="full_assembly">
<textarea cols="99" rows="6" class="full_assembly" type="text" name="labor_project_$fieldRR$fund2$l_p_c" id="labor_project_$fieldRR$fund2$l_p_c">$labor_project_hash_ref->{$fieldRR}</textarea>
</td>
</tr>|
                );

            }
        }
        $r->print(
            qq{</tbody></table>
        <br />
        <br />
        </div>
        }
        );
        $l_p_c++;
    }
#######################################################################
    #    END Of Normal Labor Project Section
#######################################################################

#######################################################################
    #    Labor Project Empty Section
#######################################################################

    $empty = $l_p_c;
    $r->print(
        qq{
<p><label for="labor_project_DoNotInsert$fund$empty">Do Not Insert</label>&nbsp;&nbsp;
<input class="full_assembly" type="checkbox" checked="checked" name="labor_project_DoNotInsert$fund$empty" id="labor_project_DoNotInsert$fund$empty" value="labor_project_DoNotInsert$fund$empty" />&nbsp;&nbsp;f_a_c_$empty
</p>
<div style="display:none" name="labor_project_hidden$empty" id="labor_project_hidden$empty">
<table summary="" border="1" rules="all" class="full_assembly">
<caption class="FALcaption">Labor Projects For:<br />
<input class="fals" type="text" name="fals$fund2$empty" id="fals$fund2$empty" style="width:100%;font-weight:bold;text-align:center;font-size:1.0em;" /></caption>
<tbody>}
    );

    for my $fieldRR (@labor_project_hash_assemblys) {
        unless ( $fieldRR =~ /notes/ ) {
            $r->print(
                qq{<tr>
<td align="left">$fieldRR</td><td align="left" class="full_assembly">
<input class="full_assembly" type="text" name="labor_project_$fieldRR$fund$empty" id="labor_project_$fieldRR$fund$empty" value="" />
</td>
</tr>}
            );
        }
        else {
            $r->print(
                qq{<tr>
<td align="left">$fieldRR</td><td align="left" class="full_assembly">
<textarea cols="99" rows="6" class="full_assembly" type="text" name="labor_project_$fieldRR$fund$empty" id="labor_project_$fieldRR$fund$empty"></textarea>
</td>
</tr>}
            );

        }
    }

    $r->print(
        qq{</tbody></table>
<br />
<br />
</div>
}
    );
    #######################################################################
    #    Script To Reveal Hidden Labor Project Table

    $r->print(
        qq~
    <script type="text/javascript">
//<![CDATA[
if (window.addEventListener) {
    window.addEventListener("load",setupFCheckAll,false);
} else if (window.attachEvent) {
    window.attachEvent("onload",setupFCheckAll);
} else {
    window.onload=setupFCheckAll;
}

function setupFCheckAll(evnt) {
    document.getElementById("labor_project_DoNotInsert$fund$empty").onchange = FChecksEmpty;
}

function FChecksEmpty (evnt) {
    if (document.duplicates.labor_project_DoNotInsert$fund$empty.checked) {
        document.getElementById("labor_project_hidden$empty").style.display = ('none');
    } else {
        document.getElementById("labor_project_hidden$empty").style.display = ('inline');
    }

}

//]]>
</script>~
    );

#######################################################################
    #    END Of Labor Project Empty Section
#######################################################################

    $sth->finish;
    $r->print(qq{</div>});

    $sth = $dbh->prepare(
        "SELECT
                labor_project_list_name,
                labor_project_list_category,
                labor_project_list_subcategory,
                labor_project_list_notes,
                labor_project_list_currency
           FROM labor_project_list
          WHERE labor_project_list_name = $labor_project_list_selected2;"
    );
    $sth->execute();
    while ( $labor_project_list_hash_ref = $sth->fetchrow_hashref ) {
        $r->print(
            qq{<div class="f_a_l_c_$l_p_l_c" id="f_a_l_c_$l_p_l_c">
<p>labor_project_list_count_$l_p_l_c</p>
<table summary="" border="1" rules="all">
<caption class="FALcaption">Final Complete Labor Project:<br />
<input class="fals" type="text" name="fals$flund2" style="width:100%;font-weight:bold;text-align:center;font-size:1.0em;" value="$labor_project_list_selected" readonly="readonly" /></caption>
<tbody>}
        );
        foreach my $assemblyh (@labor_project_list_hash_assemblys) {
            if ( $$labor_project_list_hash_ref{$assemblyh} ) {
                $$labor_project_list_hash_ref{$assemblyh} =
                  HTML::Entities::encode(
                    $$labor_project_list_hash_ref{$assemblyh} );
                #$$labor_project_list_hash_ref{$assemblyh} =~ s/"/''/g;
                $$labor_project_list_hash_ref{$assemblyh} =~ s/"/ In./g;
            }
            else {
                $$labor_project_list_hash_ref{$assemblyh} = '';
            }
        }
        $r->print(
            qq{<tr>
<td align="left">Do Not Insert This Labor Project List</td><td align="left" class="full_assembly_list">&nbsp;&nbsp;
<input type="checkbox" name="labor_project_list_DoNotInsert$flund2$l_p_l_c" id="labor_project_list_DoNotInsert$flund2$l_p_l_c" class="full_assembly_list" value="labor_project_list_DoNotInsert$flund2$l_p_l_c" />
</td>
</tr>}
        );

        for my $fieldRR (@labor_project_list_hash_assemblys) {
            unless ( $fieldRR =~ /notes/
                || $fieldRR =~ /labor_project_list_name/ )
            {
                $r->print(
                    qq|<tr>
<td align="left">$fieldRR</td><td align="left" class="full_assembly_list">
<input class="full_assembly_list" type="text" name="labor_project_list_$fieldRR$flund2$l_p_l_c" id="labor_project_list_$fieldRR$flund2$l_p_l_c" value="$labor_project_list_hash_ref->{$fieldRR}" />
</td>
</tr>|
                );
            }
            elsif ( $fieldRR =~ /labor_project_list_name/ ) {
                $r->print(
                    qq|<tr>
<td align="left">$fieldRR</td><td align="left" class="full_assembly_list">
<input class="full_assembly_list" type="text" name="labor_project_list_$fieldRR$flund2$l_p_l_c" id="labor_project_list_$fieldRR$flund2$l_p_l_c" value="$labor_project_list_hash_ref->{$fieldRR}" onblur="LabProjListCopyDo();" />
</td>
</tr>|
                );
            }
            else {
                $r->print(
                    qq|<tr>
<td align="left">$fieldRR</td><td align="left" class="full_assembly_list">
<textarea cols="99" rows="6" class="full_assembly_list" type="text" name="labor_project_list_$fieldRR$flund2$l_p_l_c" id="labor_project_list_$fieldRR$flund2$l_p_l_c">$labor_project_list_hash_ref->{$fieldRR}</textarea>
</td>
</tr>|
                );

            }
        }

        $r->print(
            qq{</tbody></table>
<br />
<br />
</div>
    }
        );
    }

# This javascript duplicates labor_project_name into labor_project_list_name forms for that new labor_project and labor_project_list
    $r->print(
        qq|<script type="text/javascript">
        //<![CDATA[
        function LabProjListCopyDo (evnt) {
        document.duplicates.fals_l_p2_l_c_.value=document.duplicates.labor_project_list_labor_project_list_name_l_p2_l_c_1.value;
        |
    );
    for ( my $i = 1 ; $i <= $l_p_c ; $i++ ) {
        $r->print(
            qq|
            document.duplicates.labor_project_labor_project_name_l_p2_c_|
              . qq|$i.value=document.duplicates.labor_project_list_labor_project_list_name_l_p2_l_c_1.value;
            document.duplicates.fals_l_p2_c_$i.value=document.duplicates.labor_project_list_labor_project_list_name_l_p2_l_c_1.value;
            |
        );
    }
    $r->print(
        qq|}
    //]]>
    </script>
    |
    );

    $sth->finish;
    $r->print(qq{</div>});
    $r->print(
        qq{<div>
<input type="hidden" value="DuplicateFullLPLRecords" name="command" id="command" />
<input type="submit" value="Continue" name="submitForm" />
<input type="reset" value="Reset" name="reset1" />
</div>
</div></form>
</body></html>
    }
    );

    return 1;
}

#######################################################################
#    sub DuplicateFullLPLRecords
#

sub DuplicateFullLPLRecords {

    # version = 0.5
    my ($arg_ref) = @_;
    my $r         = $arg_ref->{r};
    my $dbh       = $arg_ref->{dbh};
    my $q         = $arg_ref->{q};
    my $database  = $arg_ref->{database};
    my $sth;
    my @labor_project_fields = ();
    my @labor_project_values = ();
    my $labor_project_list_fields;
    my $labor_project_list_values;
    my $quoted;
    my $new_labor_project_id;
    my $new_labor_project_list_id;
    my $SQL;
    my $num_rows;
    my %args = map { $_ => $q->param($_) } $q->param;

    $r->print(
        qq|<br />xxxxxxxxxxxxx LABOR PROJECTS xxxxxxxxxxxxxxxxxxx<br />| );
    foreach my $key ( keys %args ) {
        if ( $key =~ /labor_project_(.*)_l_p2_c_(\d+)$/ ) {
            unless ( $1 eq "units_charged" ) {
                $quoted = $dbh->quote( $args{$key} );
            }
            else {
                $quoted = $args{$key};
            }
            $labor_project_fields[$2] .= "$1, ";
            $labor_project_values[$2] .= "$quoted, ";
        }
    }
    for my $i ( 1 .. $#labor_project_fields ) {
        unless ( $labor_project_values[$i] =~ /DoNotInsert/ ) {
            $labor_project_fields[$i] =~ s/, $/ /g;
            $labor_project_values[$i] =~ s/, $/ /g;
            $SQL =
qq{INSERT INTO labor_project ($labor_project_fields[$i])
VALUES ($labor_project_values[$i])
RETURNING labor_project_id;};
            $r->print(qq{$SQL<br />});
#            $SQL =~ s/, \) / \) /g;

            #            $SQL =~ s/\(labor_project_/\(/g;
#            $r->print(qq{<br /><br />$SQL substituted<br />});
            $sth      = $dbh->prepare($SQL);
            $num_rows = $sth->execute();
            if ($num_rows) {
                $new_labor_project_id = $sth->fetch()->[0];
                $r->print(
                    qq{<div><h1>Success - $new_labor_project_id</h1></div>} );
            }
            else {
                $r->print(qq{<div><h1>Failure -- $DBI::errstr</h1></div>});
            }
        }
        else {
            $r->print(qq{<div><h1>Not Inserted</h1></div>});
        }
    }
    $r->print(
        qq|<br />xxxxxxxxxxxxxx LABOR PROJECT LIST xxxxxxxxxxxxxxxxxx<br />| );
    foreach my $key ( keys %args ) {
        if ( $key =~ /labor_project_list_(.*)_l_p2_l_c_(\d+)$/ ) {
            $labor_project_list_fields .= "$1, ";
            $quoted = $dbh->quote( $args{$key} );
            $labor_project_list_values .= "$quoted, ";

        }
    }
    $labor_project_list_values =~ s/, $//;
    $labor_project_list_fields =~ s/, $//;
    unless ( $labor_project_list_values =~ /DoNotInsert/ ) {
        $SQL = qq{INSERT INTO labor_project_list ($labor_project_list_fields)
            VALUES ($labor_project_list_values)
            RETURNING labor_project_list_id;};
        $r->print(qq{$SQL<br />});
        $sth      = $dbh->prepare($SQL);
        $num_rows = $sth->execute();
        if ($num_rows) {
            $new_labor_project_list_id = $sth->fetch()->[0];
            $r->print(
                qq{<div><h1>Success - $new_labor_project_list_id</h1></div>} );
        }
        else {
            $r->print(qq{<div><h1>Failure -- $DBI::errstr</h1></div>});
        }
    }
    else {
        $r->print(qq{<div><h1>Not Inserted</h1></div>});
    }

    $r->print(qq|<br />xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx<br />|);
    $r->print(
        qq{</body></html>
    }
    );

    return 1;
}

#######################################################################
##        Sub ViewLPLRecords

sub ViewLPLRecords {

    # version 1.0
    my ($arg_ref)                   = @_;
    my $r                           = $arg_ref->{r};
    my $dbh                         = $arg_ref->{dbh};
    my $q                           = $arg_ref->{q};
    my $labor_project_list_selected = $arg_ref->{labor_project_list};
    $labor_project_list_selected =~ s/ In\./"/g;
    my $labor_project_selected      = $arg_ref->{labor_project};
    $labor_project_selected =~ s/ In\./"/g;
    my $labor_project_list_selected2 =
      $dbh->quote($labor_project_list_selected);
    my $labor_project_name;
    my $labor_project_name_aref;
    my $assem_part_hash_ref;
    my $labor_project_list_hash_ref;
    my @labor_project_list_hash_assemblys;
    my $statement;
    my $sth;
    my @all_labor_projects = ();
    my @vetor              = ();
    my $ucfirst            = '';

# This substitution reverses substitution done in form which allows javascript to function
    # $labor_project_selected      =~ s/''/"/g;
    # $labor_project_list_selected =~ s/''/"/g;



    if ( $labor_project_selected eq 'All' ) {
        my $sth = $dbh->prepare(
            "SELECT
                    labor_project_id
               FROM labor_project
              WHERE labor_project_labor_project_list_id
                 IN
                       (
                           SELECT
                                  labor_project_list_id
                             FROM labor_project_list
                            WHERE labor_project_list_name=$labor_project_list_selected2
                       )
           ORDER BY labor_project_name;"
        );
        $sth->execute;
        while ( @vetor = $sth->fetchrow ) {
            push( @all_labor_projects, @vetor );
        }
        $sth->finish();

    }
    else {
        push( @all_labor_projects, $labor_project_selected );
    }
    ######################################################################
    ##        View Records
    $r->print(
        qq{
    <div><h2 class="titlehead">$labor_project_list_selected</h2>
    <br /><br />
    }
    );

    for my $labor_project_selected (@all_labor_projects) {
        $statement = "SELECT
                             labor_project_name
                        FROM labor_project
                       WHERE labor_project_id = $labor_project_selected
                    ORDER BY labor_project_name;";
        $labor_project_name_aref = $dbh->selectcol_arrayref($statement)
          || die $dbh->errstr;

        $labor_project_name = $$labor_project_name_aref[0];

        my @hash_assemblys = qw(
          labor_project_name
          labor_project_section
          labor_project_class
          labor_project_subclass
          labor_project_is_subcontracted
          labor_project_days
          labor_project_overhead_expenses
          labor_project_received_in
          labor_project_pay_out_rate
          method_to_charge
          labor_project_unit_price
          units_charged
          labor_project_total_paid_out
          labor_project_total
          labor_project_currency
          labor_project_notes
          labor_project_unit_notes
          labor_project_labor_project_list_id
          labor_project_id
        );
        $statement = join( ', ', @hash_assemblys );
        $sth = $dbh->prepare(
            "SELECT
                    $statement
               FROM labor_project
              WHERE labor_project_id = $labor_project_selected;"
        );
        $sth->execute();
        $r->print(
            qq{
    <table summary="" border="2" rules="all" class="full_assembly">
    <caption class="black"><strong class="black">$labor_project_name</strong></caption>
    <thead>
        <tr>}
        );

        for my $hash_assembly (@hash_assemblys) {
            $ucfirst = $hash_assembly;
            $ucfirst =~ s/,//g;
            $ucfirst =~ s/_(\w)/ \u$1/g;
            $ucfirst =~ s/ Id/ ID/;
            $ucfirst =~ s/ Url/ URL/;
            $ucfirst = ucfirst($ucfirst);
            $r->print(
                qq{
    <th align="left">$ucfirst</th>
    }
            );
        }
        $r->print(
            qq{
    </tr>
    </thead>
    <tbody>}
        );

        while ( $assem_part_hash_ref = $sth->fetchrow_hashref ) {
            $r->print(qq{<tr>});
            foreach my $assemblyh (@hash_assemblys) {
                if ( $$assem_part_hash_ref{$assemblyh} ) {
                    $$assem_part_hash_ref{$assemblyh} =
                      $$assem_part_hash_ref{$assemblyh};
                    $$assem_part_hash_ref{$assemblyh} =~ s/\n/<br \/>/g
                      ; # This substitution allows newlines to be converted to HTML code
                }
                else {
                    $$assem_part_hash_ref{$assemblyh} = '';
                }
            }
            for my $hash_assembly (@hash_assemblys) {

                $r->print(
                    qq|
    <td align="left" class="full_assembly">$assem_part_hash_ref->{ $hash_assembly }</td>
    |
                );
            }
            $r->print(qq{</tr>});
        }
        $r->print(
            qq{</tbody></table>
        <br /><br />
        }
        );
        $sth->finish;
    }

    @labor_project_list_hash_assemblys = qw(
      labor_project_list_id
      labor_project_list_name
      labor_project_list_category
      labor_project_list_subcategory
      labor_project_list_total
      labor_project_list_currency
      labor_project_list_notes
    );
    $statement = join( ', ', @labor_project_list_hash_assemblys );
    $sth = $dbh->prepare(
        "SELECT
        $statement
    FROM labor_project_list
    WHERE labor_project_list_name = $labor_project_list_selected2;"
    );
    $sth->execute();
    $r->print(
        qq{
    <table summary="" border="2" rules="all" class="full_assembly_list">
    <caption class="FALcaption">
    <strong class="">Description of Final Complete Labor Project</strong>
    </caption>
    <thead>
        <tr>
        }
    );

    for
      my $labor_project_list_hash_assembly (@labor_project_list_hash_assemblys)
    {
        $ucfirst = $labor_project_list_hash_assembly;
        $ucfirst =~ s/,//g;
        $ucfirst =~ s/_(\w)/ \u$1/g;
        $ucfirst =~ s/ Id/ ID/;
        $ucfirst =~ s/ Url/ URL/;
        $ucfirst = ucfirst($ucfirst);
        $r->print(
            qq{
            <th align="left">$ucfirst</th>
            }
        );
    }
    $r->print(
        qq{
        </tr>
        </thead>
        <tbody>}
    );

    while ( $labor_project_list_hash_ref = $sth->fetchrow_hashref ) {
        $r->print(qq{<tr>});
        foreach my $assemblyh (@labor_project_list_hash_assemblys) {
            if ( $$labor_project_list_hash_ref{$assemblyh} ) {
                $$labor_project_list_hash_ref{$assemblyh} =
                  $$labor_project_list_hash_ref{$assemblyh};
                $$labor_project_list_hash_ref{$assemblyh} =~ s/\n/<br \/>/g
                  ; # This substitution allows newlines to be converted to HTML code
            }
            else {
                $$labor_project_list_hash_ref{$assemblyh} = '';
            }
        }
        for my $labor_project_list_hash_assembly (
            @labor_project_list_hash_assemblys)
        {
            $r->print(
qq|<td align="left" class="full_assembly_list">$labor_project_list_hash_ref->{$labor_project_list_hash_assembly}</td>|
            );
        }
        $r->print(qq{</tr>});
    }
    $r->print(
        qq{</tbody></table>
    }
    );
    $r->print(
        qq{</td>
    </tr>
    </tbody></table>
    <br />
    <hr />
    <br />
    }
    );
    $sth->finish;
    return 1;
}
1;
