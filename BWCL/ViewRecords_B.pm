package BWCL::ViewRecords_B;

our $VERSION = 1.3.00;
use warnings;
use strict;

require Exporter;
our @ISA       = qw(Exporter);
our @EXPORT_OK = qw(ViewRecords ViewUpdatedRecord);

use HTML::Entities();
use Encode;
use BWCL::BWCLFields qw (Selecter);

#######################################################################
##		Sub ViewRecords

sub ViewRecords {
    my $r   = shift;
    my $dbh = shift;
    my $q   = shift;
    my $table;
    my $table2;
    my $field;
    my $field2;
    my $field_value;
    my $field_value_null;
    my $field_value2;
    my $field_value2_null;
    my $num_of_rows;
    my $class;
    my $subclass;
    my $vendor_name;
    my $sth;
    my @where_statement = ();
    my $where_statement;
    my $where1_statement;
    my $where2_statement;
    my $class_where_statement;
    my $vendor_name_where_statement;
    my $subclass_where_statement;
    my $labor_project_list_category_where_statement;
    my $labor_project_list_subcategory_where_statement;
    my $labor_project_list_name_where_statement;
    my $labor_project_name_where_statement;
    my $labor_project_list_category;
    my $labor_project_list_subcategory;
    my $labor_project_name;
    my $full_assembly_name;
    my $full_assembly_name_where_statement;
    my $full_assembly_list_name;
    $full_assembly_list_name
        = $q->param("full_assembly_list_name_selected");

    if ( defined $full_assembly_list_name ) {
        $full_assembly_list_name
            = HTML::Entities::decode($full_assembly_list_name);
        $full_assembly_list_name
            = encode( "utf8", $full_assembly_list_name );
    }

    my $full_assembly_list_category;
    $full_assembly_list_category
        = $q->param("full_assembly_list_category_selected");
    if (   ( defined $full_assembly_list_category )
        && ( $full_assembly_list_category ne '' ) )
    {
        $full_assembly_list_category
            = HTML::Entities::decode($full_assembly_list_category);
        $full_assembly_list_category
            = encode( "utf8", $full_assembly_list_category );
    }
    my $full_assembly_list_category_where_statement;

    my $full_assembly_list_subcategory;
    $full_assembly_list_subcategory
        = $q->param("full_assembly_list_subcategory_selected");
    if (   ( defined $full_assembly_list_subcategory )
        && ( $full_assembly_list_subcategory ne '' ) )
    {
        $full_assembly_list_subcategory
            = HTML::Entities::decode($full_assembly_list_subcategory);
        $full_assembly_list_subcategory
            = encode( "utf8", $full_assembly_list_subcategory );
    }
    my $full_assembly_list_subcategory_where_statement;

    $table             = $q->param("table_selected");
    $field             = $q->param("field_selected");
    $field_value       = $q->param("field_value_selected");
    $field_value_null  = $q->param("field_value_selected_null");
    $field2            = $q->param("field_selected2");
    $field_value2      = $q->param("field_value_selected2");
    $field_value2_null = $q->param("field_value_selected2_null");
    $class             = $q->param("class_selected");
    $subclass          = $q->param("subclass_selected");
    $vendor_name       = $q->param("vendor_name_selected");
    $labor_project_list_category
        = $q->param("labor_project_list_category_selected");
    $labor_project_list_subcategory
        = $q->param("labor_project_list_subcategory_selected");
    $labor_project_name = $q->param("labor_project_name_selected");

    if ( defined $labor_project_name ) {
        $labor_project_name
            = HTML::Entities::decode($labor_project_name);
        $labor_project_name = encode( "utf8", $labor_project_name );
    }
    $full_assembly_name = $q->param("full_assembly_name_selected");
    if ( defined $full_assembly_name ) {
        $full_assembly_name
            = HTML::Entities::decode($full_assembly_name);
        $full_assembly_name = encode( "utf8", $full_assembly_name );
    }

    $table2 = $dbh->quote($table);

    if (($table)
        && (   ($field)
            || ($field2)
            || ($class)
            || ($subclass)
            || ($vendor_name)
            || ($labor_project_list_category)
            || ($labor_project_list_subcategory)
            || ($labor_project_name) )
        )
    {
        if ($field2) {
            my $vstatement
                = "SELECT column_name FROM information_schema.columns WHERE table_name = $table2;";
            my $vsth = $dbh->prepare($vstatement);
            my $vrv  = $vsth->execute()
                or die "can't execute the query: $vsth->errstr";
            my $vtbl_aref = $vsth->fetchall_arrayref
                or die "$vsth->errstr\n";
            my $ok = 0;
            for my $vi ( 0 .. $#{$vtbl_aref} ) {
                if ( $field2 eq "$vtbl_aref->[$vi][0]" ) {
                    $ok = 1;
                }
            }
            unless ($ok) {
                $r->print(
                    qq{<div><p class="error">ERROR!! Please select a set of valid second field and table combination.<br />}
                );
                for my $vi ( 0 .. $#{$vtbl_aref} ) {
                    $r->print(qq{$vtbl_aref->[$vi][0]<br />});
                }
                $r->print(qq{</p></div>});
                return (0);
            }
            $field_value2 = $dbh->quote($field_value2);
            if ($field_value2_null) {
                $where2_statement = "$field2 IS NULL";
            }
            else {
                $where2_statement
                    = "(($field2)::text SIMILAR TO ($field_value2)::text)";
            }
        }
        if ($field) {
            my $vstatement2
                = "SELECT column_name FROM information_schema.columns WHERE table_name = $table2;";
            my $vsth2 = $dbh->prepare($vstatement2);
            my $vrv2  = $vsth2->execute()
                or die "can't execute the query: $vsth2->errstr";
            my $vtbl2_aref = $vsth2->fetchall_arrayref
                or die "$vsth2->errstr\n";
            my $ok2 = 0;
            for my $vi ( 0 .. $#{$vtbl2_aref} ) {
                if ( $field eq "$vtbl2_aref->[$vi][0]" ) {
                    $ok2 = 1;
                }
            }
            unless ($ok2) {
                $r->print(
                    qq{<div><p class="error">ERROR!! Please select a set of valid field and table combination.<br />}
                );
                for my $vi ( 0 .. $#{$vtbl2_aref} ) {
                    $r->print(qq{$vtbl2_aref->[$vi][0]<br />});
                }
                $r->print(qq{</p></div>});
                return (0);
            }
            $field_value = $dbh->quote($field_value);
            if ($field_value_null) {
                $where1_statement = "$field IS NULL";
            }
            else {
                $where1_statement
                    = "(($field)::text SIMILAR TO ($field_value)::text)";
            }
        }

        ######################################################################
        ##		Verify Whether to keep class subclass vendor_name

        if ( $table eq 'products' ) {
            if ( ( defined $class ) && ( $class ne 'All' ) ) {
                $class                 = $dbh->quote($class);
                $class_where_statement = "class = $class";
            }
            if ( ( defined $subclass ) && ( $subclass ne 'All' ) ) {
                $subclass                 = $dbh->quote($subclass);
                $subclass_where_statement = "subclass = $subclass";
            }
            if ( ( defined $vendor_name ) && ( $vendor_name ne 'All' ) )
            {
                $vendor_name = $dbh->quote($vendor_name);
                $vendor_name_where_statement
                    = "vendor_name = $vendor_name";
            }
        }
        elsif (( $table eq 'vendors' )
            || ( $table eq 'vendor_contacts' ) )
        {
            if ( ( defined $vendor_name ) && ( $vendor_name ne 'All' ) )
            {
                $vendor_name = $dbh->quote($vendor_name);
                $vendor_name_where_statement
                    = "vendor_name = $vendor_name";
            }
        }
        if (   ( $table eq 'full_assembly' )
            || ( $table eq 'full_assembly_list' ) )
        {
            if (   ( defined $full_assembly_name )
                && ( $full_assembly_name ne 'All' ) )
            {
                $full_assembly_name = $dbh->quote($full_assembly_name);
                if ( $table eq 'full_assembly' ) {
                    $full_assembly_name_where_statement
                        = "full_assembly_name = $full_assembly_name";
                }
                else {
                    $full_assembly_name_where_statement
                        = "full_assembly_list_name = $full_assembly_name";
                }
            }
        }

        if ( $table eq 'full_assembly_list' ) {
            if (   ( defined $full_assembly_list_category )
                && ( $full_assembly_list_category ne 'All' ) )
            {
                $full_assembly_list_category
                    = $dbh->quote($full_assembly_list_category);
                $full_assembly_list_category_where_statement
                    = "full_assembly_list_category = $full_assembly_list_category";
            }
            if (   ( defined $full_assembly_list_subcategory )
                && ( $full_assembly_list_subcategory ne 'All' ) )
            {
                $full_assembly_list_subcategory
                    = $dbh->quote($full_assembly_list_subcategory);
                $full_assembly_list_subcategory_where_statement
                    = "full_assembly_list_subcategory = $full_assembly_list_subcategory";
            }
        }

        if ( $table eq 'labor_project_list' ) {
            if (   ( defined $labor_project_list_category )
                && ( $labor_project_list_category ne 'All' ) )
            {
                $labor_project_list_category
                    = $dbh->quote($labor_project_list_category);
                $labor_project_list_category_where_statement
                    = "labor_project_list_category = $labor_project_list_category";
            }
            if (   ( defined $labor_project_list_subcategory )
                && ( $labor_project_list_subcategory ne 'All' ) )
            {
                $labor_project_list_subcategory
                    = $dbh->quote($labor_project_list_subcategory);
                $labor_project_list_subcategory_where_statement
                    = "labor_project_list_subcategory = $labor_project_list_subcategory";
            }
            if (   ( defined $labor_project_name )
                && ( $labor_project_name ne 'All' ) )
            {
                $labor_project_name = $dbh->quote($labor_project_name);
                $labor_project_list_name_where_statement
                    = "labor_project_list_name = $labor_project_name";
            }
        }
        if ( $table eq 'labor_project' ) {
            if (   ( defined $labor_project_name )
                && ( $labor_project_name ne 'All' ) )
            {
                $labor_project_name = $dbh->quote($labor_project_name);
                $labor_project_name_where_statement
                    = "labor_project_name = $labor_project_name";
            }
        }

        $where_statement = "";
        @where_statement = (
            $where1_statement,
            $where2_statement,
            $vendor_name_where_statement,
            $class_where_statement,
            $subclass_where_statement,
            $labor_project_list_category_where_statement,
            $labor_project_list_subcategory_where_statement,
            $labor_project_name_where_statement,
            $labor_project_list_name_where_statement,
            $full_assembly_name_where_statement,
            $full_assembly_list_category_where_statement,
            $full_assembly_list_subcategory_where_statement
        );
        my $first = 1;
        foreach my $wstatement (@where_statement) {
            if ( defined $wstatement ) {
                if ($first) {
                    $where_statement = "WHERE $wstatement";
                    $first           = 0;
                }
                else {
                    $where_statement
                        = "$where_statement AND $wstatement";
                }
            }
        }
        $r->print(
            qq{
	<div><h2>Viewing Records from $table table<br />
	$where_statement<br />
	</h2></div>
	}
        );

      #			my ($statement, $fetch_all_href) = SelectDisplayOrder($table);
        my ( $statement, $fetch_all_href )
            = Selecter( "ViewTable", $table );
        $sth = $dbh->prepare(
            "SELECT $statement FROM $table $where_statement;");
        $sth->execute();
        my $view_array_ref
            = $sth->fetchall_arrayref( { %{$fetch_all_href} } );
        $sth->finish;
        view_table( $r, $statement, $view_array_ref, $table, $dbh );
    }
}

#######################################################################
##		Sub ViewUpdatedRecord

sub ViewUpdatedRecord {
    my $r                      = shift;
    my $dbh                    = shift;
    my $viewUpdatedRecordtable = shift;
    my $field_selected         = shift;
    my $field_value_selected   = shift;
    my $column_list;
    my @columns;
    my $viewUpdatedRecordtable2 = $dbh->quote($viewUpdatedRecordtable);

    if (   ($viewUpdatedRecordtable)
        && ($field_selected)
        && ($field_value_selected) )
    {
        $r->print(
            qq{
	<div><h2>Viewing New or Updated Records from $viewUpdatedRecordtable Table<br />
	Field = $field_selected<br />
	Value = $field_value_selected</h2>
	<table summary="" border="2" rules="all">
	<thead>
	    <tr>
	}
        );
        my $statement
            = "SELECT column_name FROM information_schema.columns WHERE table_name = $viewUpdatedRecordtable2 ORDER BY ordinal_position DESC;";
        my $sth = $dbh->prepare($statement) || die $dbh->errstr;
        my $rc  = $sth->execute             || die $dbh->errstr;
        my $tbl = $sth->fetchall_arrayref or die "$sth->errstr\n";
        my ( $i, $j );
        for $i ( 0 .. $#{$tbl} ) {
            push( @columns, $tbl->[$i][0] );
            $r->print(qq{<th align="left">$tbl->[$i][0]</th>});
        }
        $r->print(
            qq{
	    </tr>
	</thead>
	}
        );
        $column_list = join( ', ', @columns );
        $r->print(qq{<tbody>});
        my @vetor;
        $sth
            = $dbh->prepare(
            "SELECT $column_list FROM $viewUpdatedRecordtable WHERE $field_selected = $field_value_selected;"
            );
        $sth->execute;
        while ( @vetor = $sth->fetchrow ) {
            $r->print(qq{<tr>});
            foreach my $field (@vetor) {
                if ( defined $field ) {
                    $field = HTML::Entities::encode($field);
                    $field =~ s/\n/<br \/>/g;
                }
                else {
                    $field = '';
                }
                $r->print(qq{<td align="left">$field</td>});
            }
            $r->print(qq{</tr>});
        }
        $r->print(qq{</tbody></table></div>});
        $sth->finish;
    }
}

#######################################################################
#######################################################################
##			Private Subs				     ##
#######################################################################
#######################################################################

#######################################################################
#		Sub view_table
#

sub view_table {
    my $r               = shift;
    my $statement       = shift;
    my $table_array_ref = shift;
    my $table           = shift;
    my $dbh             = shift;
    my $num_of_rows     = scalar @$table_array_ref;
    my @address         = ( '', '', '', '', '' );
    my @name1           = ( '', '' );
    my @name2           = ( '', '' );

    #	Capitalize and remove underscores from table name
    my $ucfirst = $table;
    $ucfirst =~ s/_(\w)/ \u$1/g;
    $ucfirst =~ s/ Id/ ID/;
    $ucfirst =~ s/ Url/ URL/;
    $ucfirst = ucfirst($ucfirst);
    $r->print(
        qq{
	<div><h2>Viewing Records from $ucfirst Table<br />
	Number of Rows = $num_of_rows</h2>
	<table summary="" border="2" rules="all">
	<thead>
	    <tr>}
    );
    $table = $dbh->quote($table);

    my @columns = split( /, /, $statement );

    #	Capitalize and remove underscores from column names

    for my $column (@columns) {
        $ucfirst = $column;
        if ( $ucfirst =~ /ress2$|addr2$|city|state|zip/ ) { next; }
        if ( $ucfirst =~ /addr$|ress$/ ) {
            # Rename field to address only
            $ucfirst = 'address';
        }
        if ( $ucfirst =~ /country$/ ) {
            $ucfirst = 'country';
        }
        if ( $ucfirst =~ /_fname$/ ) {
            # Rename field to name only
            $ucfirst = 'name';
        }
        if ( $ucfirst =~ /_fname2$/ ) {
            # Rename field to name2 only
            $ucfirst = 'name2';
        }
        if ( $ucfirst =~ /_lname2$/ ) { next; }
        if ( $ucfirst =~ /_lname$/ )  { next; }
        $ucfirst =~ s/_(\w)/ \u$1/g;
        $ucfirst =~ s/ Id/ ID/;
        $ucfirst =~ s/ Url/ URL/;
        $ucfirst = ucfirst($ucfirst);
        $r->print(qq{<th align="left">$ucfirst</th>});
    }
    $r->print(
        qq{</tr>
	</thead>
	<tbody>
	}
    );
    foreach my $row (@$table_array_ref) {
        $r->print(
            qq{<tr>
			}
        );

        #	HTML Encode column tuples (for  browser) or make equal to ''
        foreach my $field (@columns) {
            if ( $row->{$field} ) {
                $row->{$field}
                    = HTML::Entities::encode( $row->{$field} );
                $row->{$field} =~ s/\n/<br \/>/g;
                if ( $field =~ /addr|_fname/ ) {
                    $row->{$field} =~ s/ /&nbsp;/g;
                    $row->{$field} =~ s/$/<br \/>/;

                }

                # Combine multiple tuples into one array
                if ( $field =~ /addr$|ress$/ ) {
                    $address[0] = $row->{$field};
                }
                if ( $field =~ /addr2$|ress2$/ ) {
                    $address[1] = $row->{$field};
                }
                if ( $field =~ /city/ ) {
                    $address[2] = $row->{$field};
                }
                if ( $field =~ /state/ ) {
                    $address[3] = $row->{$field};
                }
                if ( $field =~ /zip/ ) { $address[4] = $row->{$field}; }
                if ( $field =~ /_fname$/ ) {
                    $name1[0] = $row->{$field};
                }

                if ( $field =~ /_lname$/ ) {
                    $name1[1] = $row->{$field};
                }
                if ( $field =~ /_fname2$/ ) {
                    $name2[0] = $row->{$field};
                }
                if ( $field =~ /_lname2$/ ) {
                    $name2[1] = $row->{$field};
                }
            }
            else {
                $row->{$field} = '';
            }
        }
        foreach my $field (@columns) {

            # Pull array values out into one cell for browser table
            if ( $field =~ /_fname$/ ) {
                $r->print(
                    qq{<td align="left">$name1[0]$name1[1]</td>
					}
                );
                @name1 = ( '', '' );
                next;
            }
            if ( $field =~ /_fname2$/ ) {
                $r->print(
                    qq{<td align="left">$name2[0]$name2[1]</td>
					}
                );
                @name2 = ( '', '' );
                next;
            }
            if ( $field =~ /addr$|ress$/ ) {
                $r->print(
                    qq{<td align="left">$address[0]$address[1]$address[2] $address[3] $address[4]</td>
					}
                );
                @address = ( '', '', '', '', '' );
                next;
            }
            if ( $field =~ /url$|website$/ ) {
                $r->print(
                    qq{<td align="left"><a rel="external" href="http://$row->{$field}">$row->{$field}</a></td>
					}
                );
                next;
            }
            if ( $field =~ /access$/ ) {
                $r->print(
                    qq{<td align="left"><a rel="external" href="$row->{$field}">$row->{$field}</a></td>
				}
                );
                next;
            }
            if ( $field =~ /email$/ ) {
                $r->print(
                    qq{<td align="left"><a rel="external" href="mailto:$row->{$field}">$row->{$field}</a></td>
				}
                );
                next;
            }
            if ( $field =~ /email2$/ ) {
                $r->print(
                    qq{<td align="left"><a rel="external" href="mailto:$row->{$field}">$row->{$field}</a></td>
				}
                );
                next;
            }
            if ( $field =~ /_lname$/ )                      { next; }
            if ( $field =~ /_lname2$/ )                     { next; }
            if ( $field =~ /ress2$|addr2$|city|state|zip/ ) { next; }
            $r->print(
                qq{<td align="left">$row->{$field}</td>
			}
            );
        }
        $r->print(
            qq{</tr>
		}
        );
    }
    $r->print(
        qq{</tbody></table>
<h2>Number of Rows = $num_of_rows</h2></div>}
    );
    return 1;
}

=pod

=head1 NAME

BWCL::ViewRecords_B

=head1 VERSION

This documentation refers to BWCL::ViewRecords_B version 1.3.00.

=head1 SYNOPSIS

View records from a table. Includes specific commonly used options
for each database and searching by 2 chosen fields.

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
