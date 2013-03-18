package BWCL::ViewRecords_B;

our $VERSION = 3.0.00;

# BETA TEST
use warnings;
use strict;

require Exporter;
our @ISA       = qw(Exporter);
our @EXPORT_OK = qw(ViewRecords ViewUpdatedRecord ShowDuplicates);

use HTML::Entities();
use Encode;
use BWCL::BWCLFields qw (Selecter);
use BWCL::ShowAdmin qw(error_message);

#######################################################################
##        Sub ViewRecords

sub ViewRecords {
    my ($arg_ref)        = @_;
    my $r                = $arg_ref->{r};
    my $dbh              = $arg_ref->{dbh};
    my $table            = $arg_ref->{table};
    my $table2           = $dbh->quote($table);
    my $table_id_field   = $arg_ref->{table_id_field};
    my $table_id         = $arg_ref->{table_id};
    my $where_statementx = '';
    my $order_by         = '';
    if ( defined $table_id_field ) {
        $where_statementx = "WHERE $table_id_field = $table_id";
        goto DELETE_VIEW;
    }
    my $field                       = $arg_ref->{field};
    my $field_value                 = $arg_ref->{field_value};
    my $field_value_null            = $arg_ref->{field_value_null};
    my $field_value_not             = $arg_ref->{field_value_not};
    my $field2                      = $arg_ref->{field2};
    my $field_value2                = $arg_ref->{field_value2};
    my $field_value2_null           = $arg_ref->{field_value2_null};
    my $field_value2_not            = $arg_ref->{field_value2_not};
    my $class                       = $arg_ref->{class};
    my $subclass                    = $arg_ref->{subclass};
    my $vendor_name                 = $arg_ref->{vendor_name};
    my $labor_project_list_category = $arg_ref->{labor_project_list_category};
    my $labor_project_list_subcategory =
      $arg_ref->{labor_project_list_subcategory};
    my $labor_project_class         = $arg_ref->{labor_project_class};
    my $labor_project_section       = $arg_ref->{labor_project_section};
    my $labor_project_subclass      = $arg_ref->{labor_project_subclass};
    my $full_assembly_list_category = $arg_ref->{full_assembly_list_category};
    my $full_assembly_list_subcategory =
      $arg_ref->{full_assembly_list_subcategory};
    my $photo_id      = $arg_ref->{photo_id};
    my $photo_name    = $arg_ref->{photo_name};
    my $photo_file    = $arg_ref->{photo_file};
    my $gallery_name  = $arg_ref->{gallery_name};
    my $photo_name_es = $arg_ref->{photo_name_es};
    my $num_of_rows;
    my $sth;
    my $statement;
    my $rc;
    my $tbl;
    my $field2q;
    my $fieldq;
    my $fetch_all_href;
    my $view_array_ref;
    my @where_statementx = ();

    if (   ( defined $photo_name_es )
        && ( $photo_name_es ne 'All' ) )
    {
        $photo_name_es = HTML::Entities::decode($photo_name_es);
        $photo_name_es = encode( "utf8", $photo_name_es );
        $photo_name_es = $dbh->quote($photo_name_es);
    }
    else {
        $photo_name_es = undef;
    }

    if (   ( defined $gallery_name )
        && ( $gallery_name ne 'All' ) )
    {
        $gallery_name = HTML::Entities::decode($gallery_name);
        $gallery_name = encode( "utf8", $gallery_name );
        $gallery_name = $dbh->quote($gallery_name);
    }
    else {
        $gallery_name = undef;
    }

    if (   ( defined $photo_file )
        && ( $photo_file ne 'All' ) )
    {
        $photo_file = HTML::Entities::decode($photo_file);
        $photo_file = encode( "utf8", $photo_file );
        $photo_file = $dbh->quote($photo_file);
    }
    else {
        $photo_file = undef;
    }

    if (   ( defined $photo_name )
        && ( $photo_name ne 'All' ) )
    {
        $photo_name = HTML::Entities::decode($photo_name);
        $photo_name = encode( "utf8", $photo_name );
        $photo_name = $dbh->quote($photo_name);
    }
    else {
        $photo_name = undef;
    }

    if (   ( defined $photo_id )
        && ( $photo_id ne 'All' ) )
    {
        $photo_id = HTML::Entities::decode($photo_id);
        $photo_id = encode( "utf8", $photo_id );
        $photo_id = $dbh->quote($photo_id);
    }
    else {
        $photo_id = undef;
    }

    if (   ( defined $full_assembly_list_category )
        && ( $full_assembly_list_category ne 'All' ) )
    {
        $full_assembly_list_category =
          HTML::Entities::decode($full_assembly_list_category);
        $full_assembly_list_category =
          encode( "utf8", $full_assembly_list_category );
        $full_assembly_list_category =
          $dbh->quote($full_assembly_list_category);
    }
    else {
        $full_assembly_list_category = undef;
    }

    if (   ( defined $full_assembly_list_subcategory )
        && ( $full_assembly_list_subcategory ne 'All' ) )
    {
        $full_assembly_list_subcategory =
          HTML::Entities::decode($full_assembly_list_subcategory);
        $full_assembly_list_subcategory =
          encode( "utf8", $full_assembly_list_subcategory );
        $full_assembly_list_subcategory =
          $dbh->quote($full_assembly_list_subcategory);
    }
    else {
        $full_assembly_list_subcategory = undef;
    }

    if (   ( defined $labor_project_list_category )
        && ( $labor_project_list_category ne 'All' ) )
    {
        $labor_project_list_category =
          HTML::Entities::decode($labor_project_list_category);
        $labor_project_list_category =
          encode( "utf8", $labor_project_list_category );
        $labor_project_list_category =
          $dbh->quote($labor_project_list_category);
    }
    else {
        $labor_project_list_category = undef;
    }

    if (   ( defined $labor_project_list_subcategory )
        && ( $labor_project_list_subcategory ne 'All' ) )
    {
        $labor_project_list_subcategory =
          HTML::Entities::decode($labor_project_list_subcategory);
        $labor_project_list_subcategory =
          encode( "utf8", $labor_project_list_subcategory );
        $labor_project_list_subcategory =
          $dbh->quote($labor_project_list_subcategory);
    }
    else {
        $labor_project_list_subcategory = undef;
    }

    if (   ( defined $labor_project_class )
        && ( $labor_project_class ne 'All' ) )
    {
        $labor_project_class = HTML::Entities::decode($labor_project_class);
        $labor_project_class = encode( "utf8", $labor_project_class );
        $labor_project_class = $dbh->quote($labor_project_class);
    }
    else {
        $labor_project_class = undef;
    }

    if (   ( defined $labor_project_section )
        && ( $labor_project_section ne 'All' ) )
    {
        $labor_project_section = HTML::Entities::decode($labor_project_section);
        $labor_project_section = encode( "utf8", $labor_project_section );
        $labor_project_section = $dbh->quote($labor_project_section);
    }
    else {
        $labor_project_section = undef;
    }

    if (   ( defined $labor_project_subclass )
        && ( $labor_project_subclass ne 'All' ) )
    {
        $labor_project_subclass =
          HTML::Entities::decode($labor_project_subclass);
        $labor_project_subclass = encode( "utf8", $labor_project_subclass );
        $labor_project_subclass = $dbh->quote($labor_project_subclass);
    }
    else {
        $labor_project_subclass = undef;
    }

    if (   ( defined $subclass )
        && ( $subclass ne 'All' ) )
    {
        $subclass = HTML::Entities::decode($subclass);
        $subclass = encode( "utf8", $subclass );
        $subclass = $dbh->quote($subclass);
    }
    else {
        $subclass = undef;
    }

    if (   ( defined $class )
        && ( $class ne 'All' ) )
    {
        $class = HTML::Entities::decode($class);
        $class = encode( "utf8", $class );
        $class = $dbh->quote($class);
    }
    else {
        $class = undef;
    }

    if (   ( defined $vendor_name )
        && ( $vendor_name ne 'All' ) )
    {
        $vendor_name = HTML::Entities::decode($vendor_name);
        $vendor_name = encode( "utf8", $vendor_name );
        $vendor_name = $dbh->quote($vendor_name);
    }
    else {
        $vendor_name = undef;
    }

    if ($field2) {
        $field2q   = $dbh->quote($field2);
        $statement = "SELECT DISTINCT $field2q
FROM information_schema.columns
WHERE table_name = $table2;";
        $sth = $dbh->prepare($statement) || die $dbh->errstr;
        $rc  = $sth->execute             || die $dbh->errstr;
        $tbl = $sth->fetchrow_arrayref;
        unless ( $$tbl[0] ) {
            error_message(
                $r, $arg_ref->{lang},
                "un campo segundo valido",
                "a valid second field"
            );
            return;
        }
        $field_value2 = $dbh->quote($field_value2);
        if ($field_value2_null) {
            push( @where_statementx, "$field2 IS NULL" );
        }
        elsif ($field_value2_not) {
            push( @where_statementx,
                "(($field2)::text NOT SIMILAR TO ($field_value2)::text)" );
        }
        else {
            push( @where_statementx,
                "(($field2)::text SIMILAR TO ($field_value2)::text)" );
        }
    }
    if ($field) {
        $fieldq    = $dbh->quote($field);
        $statement = "SELECT (
    SELECT DISTINCT column_name
    FROM information_schema.columns
    WHERE table_name = $table2
    AND column_name = $fieldq
    );";

#    $statement
#        = "SELECT DISTINCT $fieldq FROM information_schema.columns WHERE table_name = $table2;";
        $sth = $dbh->prepare($statement) || die $dbh->errstr;
        $rc  = $sth->execute             || die $dbh->errstr;
        $tbl = $sth->fetchrow_arrayref;
        unless ( $$tbl[0] ) {
            error_message(
                $r, $arg_ref->{lang},
                "un campo primero valido",
                "a valid first field"
            );
            return;
        }
        $field_value = $dbh->quote($field_value);
        if ($field_value_null) {
            push( @where_statementx, "$field IS NULL" );
        }
        elsif ($field_value_not) {
            push( @where_statementx,
                "(($field)::text NOT SIMILAR TO ($field_value)::text)" );
        }
        else {
            push( @where_statementx,
                "(($field)::text SIMILAR TO ($field_value)::text)" );
        }
    }

    ######################################################################
    ##        Verify Whether to keep class subclass vendor_name

    if ( $table eq 'vendor_contacts' ) {
        if ( defined $vendor_name ) {
            push( @where_statementx, "vendor_name = $vendor_name" );
        }
    }
    elsif ( $table eq 'vendors' ) {
        if ( defined $vendor_name ) {
            push( @where_statementx, "vendor_name = $vendor_name" );
        }
    }
    elsif ( $table eq 'photos' ) {
        if ( defined $photo_id ) {
            push( @where_statementx, "photo_id = $photo_id" );
        }
        if ( defined $photo_name ) {
            push( @where_statementx, "photo_name = $photo_name" );
        }
        if ( defined $photo_name_es ) {
            push( @where_statementx, "photo_name_es = $photo_name_es" );
        }
        if ( defined $photo_file ) {
            push( @where_statementx, "photo_file = $photo_file" );
        }

    }
    elsif ( $table eq 'gallery' ) {
        if ( defined $photo_id ) {
            push( @where_statementx, "photo_id = $photo_id" );
        }
        if ( defined $gallery_name ) {
            push( @where_statementx, "gallery_name = $gallery_name" );
        }
    }
    elsif ( $table eq 'products' ) {

        if ( defined $class ) {
            push( @where_statementx, "class = $class" );
        }
        if ( defined $subclass ) {
            push( @where_statementx, "subclass = $subclass" );
        }
        if ( defined $vendor_name ) {
            push( @where_statementx, "vendor_name = $vendor_name" );
        }
    }
    elsif ( $table eq 'full_assembly_list' ) {
        if ( defined $full_assembly_list_category ) {
            push( @where_statementx,
                "full_assembly_list_category = $full_assembly_list_category" );
        }
        if ( defined $full_assembly_list_subcategory ) {
            push( @where_statementx,
"full_assembly_list_subcategory = $full_assembly_list_subcategory"
            );
        }
    }
    elsif ( $table eq 'labor_project_list' ) {
        if ( defined $labor_project_list_category ) {
            push( @where_statementx,
                "labor_project_list_category = $labor_project_list_category" );
        }
        if ( defined $labor_project_list_subcategory ) {
            push( @where_statementx,
"labor_project_list_subcategory = $labor_project_list_subcategory"
            );
        }
    }
    elsif ( $table eq 'labor_project' ) {
        if ( defined $labor_project_class ) {
            push( @where_statementx,
                "labor_project_class = $labor_project_class" );
        }
        if ( defined $labor_project_subclass ) {
            push( @where_statementx,
                "labor_project_subclass = $labor_project_subclass" );
        }
        if ( defined $labor_project_section ) {
            push( @where_statementx,
                "labor_project_section = $labor_project_section" );
        }
    }

    if (@where_statementx) {
        $where_statementx = " WHERE ";
        $where_statementx .= join( ' AND ', @where_statementx );
    }

    $r->print(
        qq{<div>
        <h2>Viewing Records from $table table
        <br />
        $where_statementx
        </h2>
        </div>
        }
    );

  DELETE_VIEW:
    ( $statement, $fetch_all_href ) = Selecter( "ViewTable", $table );
    if ( exists $arg_ref->{OrderBy}{$table} ) {
        $order_by = "ORDER BY $arg_ref->{OrderBy}{$table}";
    }
    $sth = $dbh->prepare(
        "SELECT $statement FROM $table $where_statementx $order_by;");
    $sth->execute();
    $view_array_ref = $sth->fetchall_arrayref( { %{$fetch_all_href} } );
    $sth->finish;
    view_table( $r, $statement, $view_array_ref, $arg_ref->{lang} );
}

#######################################################################
##        Sub ViewUpdatedRecord

sub ViewUpdatedRecord {
    my $r                      = shift;
    my $dbh                    = shift;
    my $viewUpdatedRecordtable = shift;
    my $field                  = shift;
    my $field_value            = shift;
    my $column_list;
    my @columns;
    my $statement;
    my $sth;
    my $rc;
    my $tbl;
    my @vetor;
    my $viewUpdatedRecordtable2 = $dbh->quote($viewUpdatedRecordtable);

    if (   ($viewUpdatedRecordtable)
        && ($field)
        && ($field_value) )
    {
        $r->print(
            qq{<div>
        <h2>Viewing New or Updated Records from $viewUpdatedRecordtable Table
        <br />
        Field = $field
        <br />
        Value = $field_value
        </h2>
        <table summary="" border="2" rules="all">
        <thead>
        <tr>
            }
        );
        $statement = "SELECT column_name
FROM information_schema.columns
WHERE table_name = $viewUpdatedRecordtable2
ORDER BY ordinal_position DESC;";
        $sth = $dbh->prepare($statement) || die $dbh->errstr;
        $rc  = $sth->execute             || die $dbh->errstr;
        $tbl = $sth->fetchall_arrayref or die "$sth->errstr\n";
        for my $i ( 0 .. $#{$tbl} ) {
            push( @columns, $tbl->[$i][0] );
            $r->print(
                qq{<th align="left">$tbl->[$i][0]</th>
                      }
            );
        }
        $r->print(
            qq{</tr>
            </thead>
            }
        );
        $column_list = join( ', ', @columns );
        $r->print(
            qq{<tbody>
            }
        );
        $sth = $dbh->prepare(
            "SELECT $column_list
FROM $viewUpdatedRecordtable
WHERE $field = $field_value;"
        );
        $sth->execute;

        while ( @vetor = $sth->fetchrow ) {
            $r->print(
                qq{<tr>
                      }
            );
            foreach my $field (@vetor) {
                if ( defined $field ) {
                    $field = HTML::Entities::encode($field);
                    $field =~ s/\n/<br \/>/g;
                }
                else {
                    $field = '';
                }
                $r->print(
                    qq{<td align="left">$field</td>
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
    }
}

#######################################################################
#######################################################################
##            Private Subs                     ##
#######################################################################
#######################################################################

#######################################################################
#        Sub view_table
#

sub view_table {
    my $r               = shift;
    my $statement       = shift;
    my $table_array_ref = shift;
    my $lang            = shift;
    my @columns;
    my $ucfirst;
    my $num_of_rows = scalar @$table_array_ref;
    my @address     = ( '', '', '', '', '' );
    my @name1       = ( '', '' );
    my @name2       = ( '', '' );

    if ( $lang eq "es" ) {
        $r->print(
            qq{<div>
        <h2>Numero de filas = $num_of_rows</h2>
        <table summary="" border="2" rules="all">
        <thead>
        <tr>
        }
        );
    }
    else {
        $r->print(
            qq{<div>
        <h2>Number of Rows = $num_of_rows</h2>
        <table summary="" border="2" rules="all">
        <thead>
        <tr>
        }
        );
    }

    @columns = split( /, /, $statement );

    #    Capitalize and remove underscores from column names

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
        $r->print(
            qq{<th align="left">$ucfirst</th>
            }
        );
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

        #    HTML Encode column tuples (for  browser) or make equal to ''
        foreach my $field (@columns) {
            if ( $row->{$field} ) {
                $row->{$field} = HTML::Entities::encode( $row->{$field} );
                $row->{$field} =~ s/\n/<br \/>/g;
                if ( $field =~ /addr|_fname/ ) {
                    $row->{$field} =~ s/ /&nbsp;/g;
                    $row->{$field} =~ s/$/<br \/>/;
                }

                # Combine multiple tuples into one array
                if ( $field =~ /addr$|ress$/ ) {
                    $address[0] = $row->{$field};
                }
                elsif ( $field =~ /addr2$|ress2$/ ) {
                    $address[1] = $row->{$field};
                }
                elsif ( $field =~ /city/ ) {
                    $address[2] = $row->{$field};
                }
                elsif ( $field =~ /state/ ) {
                    $address[3] = $row->{$field};
                }
                elsif ( $field =~ /zip/ ) { $address[4] = $row->{$field}; }
                elsif ( $field =~ /_fname$/ ) {
                    $name1[0] = $row->{$field};
                }

                elsif ( $field =~ /_lname$/ ) {
                    $name1[1] = $row->{$field};
                }
                elsif ( $field =~ /_fname2$/ ) {
                    $name2[0] = $row->{$field};
                }
                elsif ( $field =~ /_lname2$/ ) {
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
            elsif ( $field =~ /_fname2$/ ) {
                $r->print(
                    qq{<td align="left">$name2[0]$name2[1]</td>
                    }
                );
                @name2 = ( '', '' );
                next;
            }
            elsif ( $field =~ /addr$|ress$/ ) {
                $r->print(
qq{<td align="left">$address[0]$address[1]$address[2] $address[3] $address[4]</td>
                    }
                );
                @address = ( '', '', '', '', '' );
                next;
            }
            elsif ( $field =~ /url$|website$/ ) {
                $r->print(
                    qq{<td align="left">
                    <a rel="external" href="http://$row->{$field}">$row->{$field}</a>
                    </td>
                    }
                );
                next;
            }
            elsif ( $field =~ /access$/ ) {
                $r->print(
                    qq{<td align="left">
                    <a rel="external" href="$row->{$field}">$row->{$field}</a>
                    </td>
                    }
                );
                next;
            }
            elsif ( $field =~ /email$/ ) {
                $r->print(
                    qq{<td align="left">
                    <a rel="external" href="mailto:$row->{$field}">$row->{$field}</a>
                    </td>
                    }
                );
                next;
            }
            elsif ( $field =~ /email2$/ ) {
                $r->print(
                    qq{<td align="left">
                    <a rel="external" href="mailto:$row->{$field}">$row->{$field}</a>
                    </td>
                    }
                );
                next;
            }
            elsif ( $field =~ /_lname$/ )                      { next; }
            elsif ( $field =~ /_lname2$/ )                     { next; }
            elsif ( $field =~ /ress2$|addr2$|city|state|zip/ ) { next; }
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
        qq{</tbody>
        </table>
        </div>
        }
    );
    return 1;
}

##      Sub
#

sub ShowDuplicates {
    my ($arg_ref) = @_;
    my $table     = $arg_ref->{table};
    my $r         = $arg_ref->{r};
    my $q         = $arg_ref->{q};
    my $dbh       = $arg_ref->{dbh};
    my $lang      = $arg_ref->{lang};
    my $statement;
    my $sth;
    my $rv;
    my @vetor;

    if ( $table ne "gallery" && $table ne "products" ) {
        error_message(
            $r, $lang,
            "la tabla gallery o products.",
            "the gallery or products table."
        );
        return;
    }
    my $table2 = $dbh->quote($table);
    if ( $arg_ref->{lang} eq "es" ) {
        $r->print(
            qq{<div>
             <h2>Registros duplicados de order_shown de $table</h2>
             <br />
            }
        );
    }
    else {
        $r->print(
            qq{<div>
             <h2>Duplicate order_shown records from $table</h2>
             <br />
            }
        );
    }

    if ( $table eq "gallery" ) {
        $statement = "SELECT
                          gallery_id,
                          gallery_name,
                          order_shown,
                          photo_id
                      FROM gallery
                    WHERE (gallery_name, order_shown)
                       IN
                            (
                                SELECT
                                       gallery_name,
                                       order_shown
                                  FROM gallery
                              GROUP BY gallery_name, order_shown
                                HAVING COUNT(*) > 1
                            )
                ORDER BY gallery_name, order_shown
                     ASC;";
        $sth = $dbh->prepare($statement);
        $rv = $sth->execute or die "cannot execute the query: $sth->errstr\n";
        $r->print(
            qq{<div>
<table summary="" border="2" rules="all">
<thead>
<tr>
<th align="left"><strong>Gallery ID</strong></th>
<th align="left"><strong>Gallery Name</strong></th>
<th align="left"><strong>Order Shown</strong></th>
<th align="left"><strong>Photo ID</strong></th>
</tr>
</thead>
<tbody>
            }
        );
    }
    elsif ( $table eq "products" ) {
        $statement = "
                   SELECT
                          product_id,
                          vendor_name,
                          class,
                          subclass,
                          product_url,
                          product_description,
                          up_date,
                          sku,
                          model,
                          price
                     FROM products
                    WHERE (sku, model, product_description)
                       IN
                            (
                                SELECT
                                       sku,
                                       model,
                                       product_description
                                  FROM products
                              GROUP BY sku, model, product_description
                                HAVING COUNT(*) > 1
                            )
                 ORDER BY vendor_name, sku, model, up_date, product_description
                      ASC;";
        $sth = $dbh->prepare($statement);
        $rv = $sth->execute or die "cannot execute the query: $sth->errstr\n";
        $r->print(
            qq{<div>
<table summary="" border="2" rules="all">
<thead>
<tr>
<th align="left"><strong>Product ID</strong></th>
<th align="left"><strong></strong>Vendor Name</th>
<th align="left"><strong></strong>Class</th>
<th align="left"><strong></strong>Subclass</th>
<th align="left"><strong></strong>Product URL</th>
<th align="left"><strong></strong>Product Description</th>
<th align="left"><strong></strong>Up Date</th>
<th align="left"><strong></strong>Sku</th>
<th align="left"><strong></strong>Model</th>
<th align="left"><strong></strong>Price</th>
</tr>
</thead>
<tbody>
            }
        );
    }

    while ( @vetor = $sth->fetchrow ) {
        $r->print(qq{<tr>});
        for my $i ( 0 .. $#vetor ) {
            if ( !defined $vetor[$i] ) {
                $vetor[$i] = '';
            }
            $r->print(qq{<td align="left">$vetor[$i]</td>});
        }
    }
    $r->print(
        qq{</tbody>
    </table>
    </div>

        }
    );
    return;
}

=pod

=head1 NAME

BWCL::ViewRecords_B

=head1 VERSION

This documentation refers to BWCL::ViewRecords_B version 3.0.00.

=head1 SYNOPSIS

View records from a table.

=head1 DESCRIPTION

ViewRecords Shows records form a table.
Includes specific commonly used options for each database and searching by 2 chosen fields.
ViewUpdatedRecord Shows a record that has been chosen by another function, such as a record update.
ShowDuplicates Shows record in the gallery table that have the same oreder_shown value in a gallery.
Shows records in the products table that share same sku, model and product_description are repeated
with the same vendor.

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
