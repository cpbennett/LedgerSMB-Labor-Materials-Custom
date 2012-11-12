package BWCL::ShowAdmin;

our $VERSION = 1.4.10;
use warnings;
use strict;

require Exporter;
our @ISA       = qw(Exporter);
our @EXPORT_OK = qw(ShowTables ShowAllTables ShowColumns error_message specified_error_message);


#######################################################################
##      Sub error_message

sub error_message {
    my $r             = shift;
    my $lang          = shift;
    my $error_item_es = shift;
    my $error_item_en = shift;

    if ( $lang eq "es" ) {
        $r->print(
            qq{<div class="cent"><p class="error">ERROR!! Por favor, selecciona $error_item_es.</p></div>}
        );
    }
    else {
        $r->print(
            qq{<div class="cent"><p class="error">ERROR!! Please select $error_item_en.</p></div>}
        );
    }
    return;
}

#######################################################################
##      Sub error_message

sub specified_error_message {
    my $r                       = shift;
    my $lang                    = shift;
    my $specified_error_item_es = shift;
    my $specified_error_item_en = shift;

    if ( $lang eq "es" ) {
        $r->print(
            qq{<div class="cent"><p class="error">$specified_error_item_es</p></div>}
        );
    }
    else {
        $r->print(
            qq{<div class="cent"><p class="error">$specified_error_item_en</p></div>}
        );
    }
    return;
}

#######################################################################
##		Sub ShowTables

sub ShowTables {
    my ($arg_ref) = @_;
    my $r         = $arg_ref->{r};
    my $dbh       = $arg_ref->{dbh};
    my $st;
    my @vetor;
    my $description;
    my $field2;
    my $SQL = "SELECT
                      table_name
                 FROM information_schema.tables
                WHERE table_schema = 'public'
                  AND table_type='BASE TABLE';";
    $st = $dbh->do($SQL);
    $r->print(
        qq{<div>
	<h2 class="medium2">$st Tables:</h2>
	<div>
	<table summary="" border="2" rules="all">
	<thead>
	<tr>
	<th>Table&nbsp;Name</th><th>Table&nbsp;Description</th>
	</tr>
	</thead>
	<tbody>
	}
    );
    my $sth = $dbh->prepare($SQL);
    my $rc  = $sth->execute()
        or die "can't execute the query: $sth->errstr";

    while ( @vetor = $sth->fetchrow ) {
        $r->print(
            qq{<tr>
	}
        );
        foreach my $field (@vetor) {
            $field2 = $dbh->quote($field);
                ($description) = $dbh->selectrow_array(
                    "SELECT
                            obj_description
                            (
                                (
                                    SELECT
                                           relid
                                      FROM pg_catalog.pg_stat_user_tables
                                     WHERE relname=$field2
                                ),
                                'pg_class'
                            );"
                );
               unless (defined $description) {
                   $description = '';
               }
            $field =~ s/\n/<br \/>/g;
            $r->print(
                qq{<td align="left">$field</td><td align="left">$description</td>
	}
            );
        }
        $r->print(
            qq{</tr>
	}
        );
    }
    $r->print(
        qq{</tbody>
	</table>
	</div>
	}
    );
    $sth->finish;
    $r->print(
        qq{</div>
	<hr />
	}
    );
}

#######################################################################
##		Sub ShowAllTables

sub ShowAllTables {
    my ($arg_ref) = @_;
    my $r         = $arg_ref->{r};
    my $dbh       = $arg_ref->{dbh};
    my $SQL = "SELECT
                      table_name
                 FROM information_schema.tables
                WHERE table_schema = 'public'
                  AND table_type='BASE TABLE';";
    my $ShowTable = $dbh->do($SQL);
    if ($ShowTable) {
        $r->print(qq{<div><h1>Success</h1></div>});
    }
    else {
        $r->print(qq{<div><h1>Failure -- $DBI::errstr</h1></div>});
    }
    my @tables = $dbh->tables();
    $r->print(
        qq{<div><h2>$ShowTable Tables:</h2>
	<p>
	}
    );
    foreach my $table (@tables) {
        $r->print(
            qq{$table<br />
	}
        );
    }
    $r->print(
        qq{</p>
	</div>
	<hr />
	}
    );
}

#######################################################################
##		Sub ShowColumns

sub ShowColumns {
    my ($arg_ref) = @_;
    my $r         = $arg_ref->{r};
    my $dbh       = $arg_ref->{dbh};
    my $q         = $arg_ref->{q};
    my $description;
    my $col_name;
    my $col_name2;
    my $relid;
    my $showcolumnstable  = $arg_ref->{table_selected};
    my $showcolumnstable2 = $dbh->quote($showcolumnstable);

    if ($showcolumnstable) {
        my $statement = "SELECT
                                column_name,
                                data_type,
                                column_default,
                                is_nullable,
                                character_maximum_length,
                                numeric_precision,
                                datetime_precision
                           FROM information_schema.columns
                          WHERE table_name = $showcolumnstable2;";
        my $sth = $dbh->prepare($statement);
        my $rv  = $sth->execute()
            or die "can't execute the query: $sth->errstr";
        $r->print(
            qq{<h1>Table = $showcolumnstable</h1>
			<h2>$rv Columns:</h2>
	<div>
	<table summary="" border="2" rules="all">
	<thead>
	<tr>
	<th>column name</th><th>data type</th><th>column default</th><th>is nullable</th><th>character maximum length</th><th>numeric precision</th><th>datetime precision</th><th>Column Description</th><th>Check Constraint</th>
	</tr>
	</thead>
	<tbody>
    }
        );
        my $tbl = $sth->fetchall_arrayref or die "$sth->errstr\n";
        my ( $i, $j );
        my $check_constraint;

        for $i ( 0 .. $#{$tbl} ) {
            $r->print(
                qq{<tr>
	<td><strong>$tbl->[$i][0]</strong></td>
	}
                )
                ; #prints only column name, next step prints attributes(set for $ (0 .. etc to include column name
            $col_name  = "$tbl->[$i][0]";
            $col_name2 = $dbh->quote($col_name);
            ($check_constraint) = $dbh->selectrow_array(
                "SELECT
                        check_clause
                   FROM information_schema.check_constraints
                  WHERE constraint_name=$col_name2;"
            ) || '';
            for $j (
                1 .. $#{ $tbl->[$i] } )
                {
                    if ( defined $tbl->[$i][$j] ) {
                        $r->print(
                            qq{<td><strong>$tbl->[$i][$j]</strong></td>
                        }
                        );
                    }
                    else {
                        $r->print(
                            qq{<td></td>
                        }
                        );
                    }
                }
                ($relid) = $dbh->selectrow_array(
                    "SELECT
                            relid
                       FROM pg_catalog.pg_statio_user_tables
                      WHERE relname = $showcolumnstable2;"
                );
                my ($objsubid) = $dbh->selectrow_array(
                             "SELECT
                                     ordinal_position
                                FROM information_schema.columns
                               WHERE table_name = $showcolumnstable2
                                 AND column_name = $col_name2
                        ;"
                );
                ($description) = $dbh->selectrow_array(
                    "SELECT
                            col_description($relid, $objsubid);"
                );
                unless ( defined $description ) {
                    $description = '';
                }
                unless ( defined $check_constraint ) {
                    $check_constraint = '';
                }
                $r->print(
                    qq{<td>$description</td><td>$check_constraint</td>
	</tr>
	}
                );
                } $r->print(
                qq{</tbody>
	</table>
	</div>
	}
                );
            my $rc = $sth->finish;
            $r->print(
                qq{<div>
	<br />
	<h2>Indexes:</h2>
	<table summary="" border="2" rules="all">
	<thead>
	<tr>
	<th>Index</th><th>Index Definition</th>
	</tr>
	</thead>
	<tbody>
	}
            );
            $statement = "
               SELECT
                      indexname,
                      indexdef
                 FROM pg_catalog.pg_indexes
                WHERE tablename = $showcolumnstable2;";
            $sth = $dbh->prepare($statement);
            $rv  = $sth->execute()
                or die "can't execute the query: $sth->errstr";
            $tbl = $sth->fetchall_arrayref or die "$sth->errstr\n";

            for $i ( 0 .. $#{$tbl} ) {
                $r->print(
                    qq{<tr><td><strong>$tbl->[$i][0]</strong></td>
	}
                );
                for $j ( 1 .. $#{ $tbl->[$i] } ) {
                    $r->print(
                        qq{<td><strong>$tbl->[$i][$j]</strong></td>
	}
                    );
                }
            }
            $r->print(
                qq{</tr>
    </tbody>
	</table>
	</div>
	}
            );
            $rc = $sth->finish;
            $r->print(
                qq{<div>
	<br />
	<h2>Foreign Key Constraints:</h2>
	<table summary="" border="2" rules="all">
	<thead>
	<tr>
	<th>Foreign Key</th><th>Foreign Key Definition</th>
	</tr>
	</thead>
	<tbody>
	}
            );

#	$statement = "SELECT constraint_name, column_name, table_name FROM information_schema.constraint_column_usage WHERE constraint_name LIKE \'\%_fkey\';";
            $statement = "
               SELECT
                      conname,
                      pg_catalog.pg_get_constraintdef(r.oid, true) AS condef
                 FROM pg_catalog.pg_constraint r
                WHERE r.conrelid = $relid
                  AND
                      r.contype = 'f'
             ORDER BY 1;";
            $sth = $dbh->prepare($statement);
            $rv  = $sth->execute()
                or die "can't execute the query: $sth->errstr";
            $tbl = $sth->fetchall_arrayref or die "$sth->errstr\n";
            for $i ( 0 .. $#{$tbl} ) {
                $r->print(
                    qq{<tr>
	<td><strong>$tbl->[$i][0]</strong></td>
	}
                );
                $r->print(
                    qq{<td><strong>$tbl->[$i][1]</strong></td>
            	}
                );
                $r->print(
                    qq{</tr>
            	}
                );
            }
            $r->print(
                qq{</tbody>
            </table>
            <br /><br />
            </div>
            }
            );
            $rc = $sth->finish;
            $r->print(
                qq{<div>
	<br />
	<h2>Triggers:</h2>
	<table summary="" border="2" rules="all">
	<thead>
	<tr>
	<th>Trigger</th>
	</tr>
	</thead>
	<tbody>
	}
            );
            $statement = "
               SELECT
                      t.tgname,
                      pg_catalog.pg_get_triggerdef(t.oid, true),
                      t.tgenabled
                 FROM pg_catalog.pg_trigger t
                WHERE t.tgrelid = $relid
              AND NOT t.tgisinternal
             ORDER BY 1;";
            $sth = $dbh->prepare($statement);
            $rv  = $sth->execute()
                or die "can't execute the query: $sth->errstr";
            $tbl = $sth->fetchall_arrayref or die "$sth->errstr\n";

            for $i ( 0 .. $#{$tbl} ) {
                $r->print(
                    qq{<tr>
			<td><strong>$tbl->[$i][1]</strong></td>
			</tr>
	}
                );
            }
            $r->print(
                qq{</tbody>
	</table>
	<br /><br />
	</div>
	<hr />
	}
            );

    }
}

=pod

=head1 NAME

BWCL::ShowAdmin

=head1 VERSION

This documentation refers to BWCL::ShowAdmin version 1.4.10.

=head1 SYNOPSIS

Subroutines to show tables and column information.

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
