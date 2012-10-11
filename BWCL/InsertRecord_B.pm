package BWCL::InsertRecord_B;

our $VERSION = 4.2.10;

use warnings;
use strict;

use Encode;
use HTML::Entities();

use BWCL::ViewRecords_B qw(ViewUpdatedRecord);
use BWCL::BWCLFields qw (Selecter);

require Exporter;
our @ISA       = qw(Exporter);
our @EXPORT_OK = qw(InsertRecordGroup InsertRecordGroupForm);

#######################################################################
#	$itemtoi starts at 3, to avoid problems with fields like field2
#	Not sure if this is needed
#	All of this ucfirst stuff, can it be joined together into a sub??

#######################################################################
##		Sub InsertRecordGroupForm

sub InsertRecordGroupForm {
	my $r       = shift;
	my $dbh     = shift;
	my $q       = shift;
	my $program = shift;
	my $table;
	my $itemstoinsert;
	my $ucfirst;
	my $i;
	my @field_names  = ();
	my @all_fill     = ();
	my @notes_fields = ();
	my $field_names;
	my $notes_fields;
	$itemstoinsert = $q->param("itemstoinsert");
	$table         = $q->param("table_selected");

	( $field_names, $notes_fields ) = Selecter( "InsertRecordForm", $table );
	@field_names  = @$field_names;
	@notes_fields = @$notes_fields;

	push( @all_fill, @field_names );
	push( @all_fill, @notes_fields );

	$r->print(
		qq{<h2 class="tiheadbig">Insert New Record Group into $table</h2>
	<form id="insertform" name="insertform" action="$program" method="post">}
	);
	if ( $table eq "full_assembly_list" ) {
		$r->print(
qq{<h3 class="cent">NOTE&nbsp;WELL:&nbsp;You&nbsp;must&nbsp;have&nbsp;appropriate&nbsp;full_assembly&nbsp;entries&nbsp;first!</h3>
}
		);
	}
	for my $itemtoi ( 3 .. ( $itemstoinsert + 2 ) ) {
		$r->print(
			qq{<div>
	<table class="cent" summary="" rules="groups" cellspacing="0" cellpadding="2">
	<tbody>
	}
		);

########################################################################
		#	Main Section Starts

		for $i ( 0 .. $#field_names ) {
			$ucfirst = $field_names[$i];
			$ucfirst =~ s/_(\w)/ \u$1/g;
			$ucfirst =~ s/ Id/ ID/;
			$ucfirst =~ s/ Url/ URL/;
			$ucfirst =~ s/cust /customer /;
			$ucfirst =~ s/ven /vendor /;
			$ucfirst =~ s/Fname/First Name/;
			$ucfirst =~ s/Lname/Last Name/;
			$ucfirst = ucfirst($ucfirst);
			$ucfirst =~ s/Sku/SKU/;
			$r->print(qq{<tr>});

			unless ( $table eq "method_to_charge"
				|| $table eq "labor_skill"
				|| $table eq "labor_service" )
			{
				if ( $itemtoi == 3 ) {
					$r->print(
qq{<td align="left"><label for="$field_names[$i]">All?</label></td><td align="left"><input type="checkbox" value="all" id="$field_names[$i]" name="$field_names[$i]" /></td>}
					);
				}
				else {
					$r->print(qq{<td align="left"></td><td align="left"></td>});
				}
				$r->print(
qq{<td align="left"><strong>$ucfirst</strong></td><td align="left" style="width:80%;"><input type="text" id="$field_names[$i]$itemtoi" name="$field_names[$i]$itemtoi" value="" style="width:99%;" /></td>
	</tr>
	}
				);
			}
		}
		if ( $table eq "method_to_charge"
			|| $table eq "labor_skill"
			|| $table eq "labor_service" )
		{
			$ucfirst = $field_names[0];
			$ucfirst =~ s/_(\w)/ \u$1/g;
			$ucfirst =~ s/ Id/ ID/;
			$ucfirst =~ s/ Url/ URL/;
			$ucfirst = ucfirst($ucfirst);
			$r->print(qq{<tr>});
			if ( $itemtoi == 3 ) {
				$r->print(
qq{<td align="left"><label for="$field_names[0]">All?</label></td><td align="left"><input type="checkbox" value="All" id="$field_names[0]" name="$field_names[0]" /></td>}
				);
			}
			else {
				$r->print(qq{<td align="left"></td><td align="left"></td>});
			}

			$r->print(
qq{<td align="left"><strong>$ucfirst</strong></td><td align="left" style="width:80%;"><input type="text" id="$field_names[0]$itemtoi" name="$field_names[0]$itemtoi" value="" style="width:99%;" /></td>
	</tr>
	}
			);

		}

		unless ( $table eq "method_to_charge"
			|| $table eq "labor_skill"
			|| $table eq "labor_service" )
		{
			if ( $table eq "vendor_contacts" ) {
				if ( $itemtoi == 3 ) {
					push( @all_fill, "ven_contact_country" );
				}
				print_option_list( $r, $dbh, "country", "countries", $itemtoi,
					"Vendor Contact Country",
					"ven_contact_country" );
			}
			if ( $table eq "vendors" ) {
				if ( $itemtoi == 3 ) {
					push( @all_fill, "vendor_country", "vendor_currency" );
				}
				print_option_list( $r, $dbh, "country", "countries", $itemtoi,
					"Vendor Country",
					"vendor_country" );
				print_option_list( $r, $dbh, "currency", "currencies", $itemtoi,
					"Vendor Currency",
					"vendor_currency" );
			}
			if (   $table eq "products"
				|| $table eq "vendor_contacts" )
			{
				if ( $itemtoi == 3 ) { push( @all_fill, "vendor_name" ); }
				print_option_list( $r, $dbh, "vendor_name", "vendors", $itemtoi,
					"Vendor Name", "vendor_name" );
			}
			elsif ( $table eq "labor_project" ) {
				if ( $itemtoi == 3 ) {
					push( @all_fill,
						"method_to_charge",
						"labor_project_currency",
						"labor_project_is_subcontracted" );
				}
				print_option_list( $r, $dbh, "method_to_charge",
					"method_to_charge", $itemtoi, "Method to Charge",
					"method_to_charge" );
				print_option_list( $r, $dbh, "currency", "currenciesg",
					$itemtoi, "Labor Project Currency",
					"labor_project_currency" );
				my @values = ( "N",  "Y" );
				my @names  = ( "No", "Yes" );
				specify_insert_options(
					$r,
					"labor_project_is_subcontracted",
					"Labor Project is Subcontracted?",
					$itemtoi, \@values, \@names
				);
			}
			elsif ( $table eq "labor_project_list" ) {
				if ( $itemtoi == 3 ) {
					push( @all_fill,
						"labor_project_list_name",
						"labor_project_list_currency" );
				}
				print_option_list( $r, $dbh, "labor_project_name",
					"labor_project", $itemtoi, "Labor Project List Name",
					"labor_project_list_name",
			   		"WHERE labor_project_name NOT IN (SELECT labor_project_list_name FROM labor_project_list)" );
				print_option_list( $r, $dbh, "currency", "currenciesg",
					$itemtoi, "Labor Project List Currency",
					"labor_project_list_currency" );
			}
			elsif ( $table eq "labor_category" ) {
				if ( $itemtoi == 3 ) {
					push( @all_fill,
						"labor_category_skill", "labor_category_service" );
				}
				print_option_list( $r, $dbh, "labor_skill", "labor_skill",
					$itemtoi, "Labor Skill", "labor_category_skill" );
				print_option_list( $r, $dbh, "labor_service", "labor_service",
					$itemtoi, "Labor Service",
					"labor_category_service" );
			}
			elsif ( $table eq "assemblies" ) {
				if ( $itemtoi == 3 ) { push( @all_fill, "assembly_currency" ); }
				print_option_list( $r, $dbh, "currency", "currencies", $itemtoi,
					"Assembly Currency",
					"assembly_currency" );
			}
			elsif ( $table eq "expenses" ) {
				if ( $itemtoi == 3 ) { push( @all_fill, "expense_currency" ); }
				print_option_list( $r, $dbh, "currency", "currenciesg", $itemtoi,
					"Expense Currency",
					"expense_currency" );
				if ( $itemtoi == 3 ) { push( @all_fill, "time_unit" ); }
				print_option_list( $r, $dbh, "time_unit", "time_units", $itemtoi,
					"Time Unit",
					"time_unit" );
			}
			elsif ( $table eq "expenses_total" ) {
				if ( $itemtoi == 3 ) { push( @all_fill, "expenses_total_currency" ); }
				print_option_list( $r, $dbh, "currency", "currenciesg", $itemtoi,
					"Expenses Total Currency",
					"expenses_total_currency" );
			}

			elsif ( $table eq "general_labor" ) {
				if ( $itemtoi == 3 ) {
					push( @all_fill,
						"method_to_charge",
						"general_labor_is_subcontracted",
						"general_labor_is_project",
						"labor_category_id",
						"labor_project_name" );
				}
				print_option_list( $r, $dbh, "method_to_charge",
					"method_to_charge", $itemtoi, "Method to Charge",
					"method_to_charge" );
				print_option_list( $r, $dbh, "currency", "currenciesg",
					$itemtoi, "General Labor Currency",
					"general_labor_currency" );
				my @values = ( "N",  "Y" );
				my @names  = ( "No", "Yes" );
				specify_insert_options(
					$r,
					"general_labor_is_subcontracted",
					"General Labor Is Subcontracted?",
					$itemtoi, \@values, \@names
				);
				@values = ( "N",  "Y" );
				@names  = ( "No", "Yes" );
				print_option_list(
					$r,
					$dbh,
"labor_category_id, labor_category_category, labor_category_subcategory",
					"labor_category",
					$itemtoi,
					"Labor Category",
					"labor_category_id"
				);
			}

			if ( $table eq "assemblies_parts" ) {
				if ( $itemtoi == 3 ) {
					push( @all_fill,
						"assembly_part_assembly_id", "assembly_part_currency" );
				}
				if ( $itemtoi == 3 ) {
					$r->print(
qq{<tr><td align="left"><label for="assembly_part_assembly_id">All?</label></td>
						<td align="left"><input type="checkbox" value="all" id="assembly_part_assembly_id" name="assembly_part_assembly_id" /></td>
						}
					);
				}
				else {
					$r->print(
						qq{<tr><td align="left"></td>
						<td align="left"></td>
						}
					);
				}
				$r->print(
					qq{
	<td align="left"><label for="assembly_part_assembly_id"><strong>Assembly Part Assembly ID</strong></label></td>
	<td align="left"><select id="assembly_part_assembly_id$itemtoi" name="assembly_part_assembly_id$itemtoi" style="width:99%;">
	}
				);
				my $tbl;
				my $statement =
"SELECT assembly_id, assembly_name FROM assemblies ORDER BY assembly_name;";
				my $sth = $dbh->prepare($statement) || die $dbh->errstr;
				my $rc  = $sth->execute             || die $dbh->errstr;
				my $tbl9;
				while ( $tbl = $sth->fetchrow_arrayref ) {
					$$tbl[0] = HTML::Entities::encode( $$tbl[0] );
					$$tbl[1] = HTML::Entities::encode( $$tbl[1] );
					$tbl9 =
qq{<option value="$$tbl[0]">$$tbl[1]  --$$tbl[0]--</option>
				};
					$r->print(qq{$tbl9});
				}
				$r->print(
					qq{
	</select>
	</td>
	</tr>
	}
				);

				print_option_list( $r, $dbh, "currency", "currencies", $itemtoi,
					"Assembly Part Currency",
					"assembly_part_currency" );
			}
			elsif ( $table eq "customers" ) {
				my @values = ( "R",           "C" );
				my @names  = ( "Residential", "Commercial" );
				if ( $itemtoi == 3 ) {
					push( @all_fill,
						"residential_or_commercial", "cust_bill_country" );
				}
				specify_insert_options( $r, "residential_or_commercial",
					"Residential or Commercial?",
					$itemtoi, \@values, \@names );
				print_option_list( $r, $dbh, "country", "countries", $itemtoi,
					"Customer Bill Country",
					"cust_bill_country" );

			}
			elsif ( $table eq "jobsites" ) {
				my @values = ( "R",           "C" );
				my @names  = ( "Residential", "Commercial" );
				if ( $itemtoi == 3 ) {
					push( @all_fill,
						"residential_or_commercial", "cust_id",
						"jobsite_country" );
				}
				specify_insert_options( $r, "residential_or_commercial",
					"Residential or Commercial?",
					$itemtoi, \@values, \@names );
				print_option_list(
					$r,
					$dbh,
"cust_id, cust_bill_business_name, residential_or_commercial, cust_bill_fname, cust_bill_lname",
					"customers",
					$itemtoi,
					"Customer",
					"cust_id"
				);
				print_option_list( $r, $dbh, "country", "countries", $itemtoi,
					"Jobsite Country",
					"jobsite_country" );
			}
			elsif ( $table eq "products" ) {
				$r->print(qq{<tr>});
				if ( $itemtoi == 3 ) {
					if ( $itemtoi == 3 ) {
						push( @all_fill, "up_date", "product_currency" );
					}
					$r->print(
qq{<td align="left"><label for="up_date">All?</label></td><td align="left"><input type="checkbox" value="All" id="up_date" name="up_date" /></td>}
					);
				}
				else {
					$r->print(qq{<td align="left"></td><td align="left"></td>});
				}
				$r->print(
qq{<td align="left"><strong>Update</strong></td><td align="left" style="width:80%;"><input type="text" id="up_date$itemtoi" name="up_date$itemtoi" value="NOW" style="width:99%;" /></td>
		</tr>
		}
				);
				my $tbl;
				my $statement =
"SELECT column_default FROM information_schema.columns WHERE table_name = 'products' AND column_name = 'check_days';";
				my $sth = $dbh->prepare($statement) || die $dbh->errstr;
				my $rc  = $sth->execute             || die $dbh->errstr;
				my $def = '';
				while ( $tbl = $sth->fetchrow_arrayref ) {
					$def = $$tbl[0];
					$def =~ m/'([\d:]*)'::text/;
					$def = $1;
					$r->print(qq{<tr>});
					if ( $itemtoi == 3 ) {
						if ( $itemtoi == 3 ) {
							push( @all_fill, "check_days" );
						}
						$r->print(
qq{<td align="left"><label for="check_days">All?</label></td><td align="left"><input type="checkbox" value="All" id="check_days" name="check_days" /></td>}
						);
					}
					else {
						$r->print(
							qq{<td align="left"></td><td align="left"></td>});
					}

					$r->print(
						qq{
		<td align="left"><strong>Check Days</strong></td><td align="left" style="width:80%;"><input type="text" id="check_days$itemtoi" name="check_days$itemtoi" value="$def" style="width:99%;" /></td>
		</tr>
		}
					);
				}
				if ( $itemtoi == 3 ) {
					push( @all_fill, "product_currency" );
					print_option_list( $r, $dbh, "currency", "currencies",
						$itemtoi, "Product Currency",
						"product_currency" );
				}
				else {
					print_option_list( $r, $dbh, "currency", "currencies",
						$itemtoi, "Product Currency",
						"product_currency" );
				}
			}
			elsif ( $table eq "full_assembly_list" ) {
				if ( $itemtoi == 3 ) {
					push( @all_fill,
						"full_assembly_list_name",
						"full_assembly_list_currency" );
				}
				print_option_list( $r, $dbh, "full_assembly_name",
					"full_assembly", $itemtoi, "Full Assembly List Name",
					"full_assembly_list_name",
			   		"WHERE full_assembly_name NOT IN (SELECT full_assembly_list_name FROM full_assembly_list)"
				);
				print_option_list( $r, $dbh, "currency", "currencies", $itemtoi,
					"Full Assembly List Currency",
					"full_assembly_list_currency" );
			}
			elsif ( $table eq "full_assembly" ) {
				if ( $itemtoi == 3 ) {
					push( @all_fill,
						"full_assembly_assembly_id", "full_assembly_currency" );
				}
				if ( $itemtoi == 3 ) {
					$r->print(
qq{<tr><td align="left"><label for="full_assembly_assembly_id">All?</label></td>
						<td align="left"><input type="checkbox" value="all" id="full_assembly_assembly_id" name="full_assembly_assembly_id" /></td>
						}
					);
				}
				else {
					$r->print(
						qq{<tr><td align="left"></td>
						<td align="left"></td>
						}
					);
				}
				$r->print(
					qq{
	<td align="left"><label for="full_assembly_assembly_id"><strong>Full Assembly Assembly ID</strong></label></td>
	<td align="left"><select id="full_assembly_assembly_id$itemtoi" name="full_assembly_assembly_id$itemtoi" style="width:99%;">
	}
				);
				my $tbl;
				my $statement =
"SELECT assembly_id, assembly_name FROM assemblies ORDER BY assembly_name;";
				my $sth = $dbh->prepare($statement) || die $dbh->errstr;
				my $rc  = $sth->execute             || die $dbh->errstr;
				my $tbl9;
				while ( $tbl = $sth->fetchrow_arrayref ) {
					$$tbl[0] = HTML::Entities::encode( $$tbl[0] );
					$$tbl[1] = HTML::Entities::encode( $$tbl[1] );
					$tbl9 =
qq{<option value="$$tbl[0]">$$tbl[1]  --$$tbl[0]--</option>
				};
					$r->print(qq{$tbl9});
				}
				$r->print(
					qq{
	</select>
	</td>
	</tr>
	}
				);

				print_option_list( $r, $dbh, "currency", "currencies", $itemtoi,
					"Full Assembly Currency",
					"full_assembly_currency" );
			}
			elsif ( $table eq "contractors" ) {
				print_option_list( $r, $dbh, "country", "countries", $itemtoi,
					"Contractor Country",
					"contractor_country" );
				print_option_list( $r, $dbh, "currency", "currenciesg",
					$itemtoi, "Contractor Currency",
					"contractor_currency" );
			}

			foreach my $note_field (@notes_fields) {
				$ucfirst = $note_field;
				$ucfirst =~ s/_(\w)/ \u$1/g;
				$ucfirst =~ s/ Id/ ID/;
				$ucfirst =~ s/ Url/ URL/;
				$ucfirst =~ s/cust /customer /;
				$ucfirst =~ s/ven /vendor /;
				$ucfirst =~ s/Fname/First Name/;
				$ucfirst =~ s/Lname/Last Name/;
				$ucfirst =~ s/Sku/SKU/;
				$ucfirst = ucfirst($ucfirst);

				if ( $itemtoi == 3 ) {
					$r->print(
qq{<td align="left"><label for="$note_field">All?</label></td><td align="left"><input type="checkbox" value="all" id="$note_field" name="$note_field" /></td>}
					);
				}
				else {
					$r->print(qq{<td align="left"></td><td align="left"></td>});
				}
				$r->print(
					qq{
		<td align="left"><strong>$ucfirst</strong></td><td align="left" style="width:80%;"><textarea cols="99" rows="6" id="$note_field$itemtoi" name="$note_field$itemtoi" style="width:99%;"></textarea></td>
		</tr>}
				);
			}
		}
		$r->print(
			qq{</tbody></table>
	</div>}
		);
	}

	$r->print(
		qq{
<input type="hidden" name="itemstoinsert" value="$itemstoinsert" />
<input type="hidden" name="table_selected" value="$table" />
<input type="hidden" value="InsertRecordGroup" name="command" />
<div>
<br />
<br />
<br />
<input type="submit" value="Continue" name="submitForm" />
<input type="reset" value="Reset" name="reset1" />
<br />
<br />
<br />
</div></div></form>
<hr /><hr />
}
	);

	all_fill_jscript( $r, \@all_fill, $itemstoinsert );
	return 1;
}

#######################################################################
##		Sub InsertRecordGroup

sub InsertRecordGroup {
	my $r        = shift;
	my $dbh      = shift;
	my $q        = shift;
	my $database = shift;
	my $sql_list;
	my $table;
	my $itemstoinsert;
	my $values_array_string;
	my $names_array_string;
	my $SQL;
	my $run_up;
	my $runded;
	my $table_id_field;
	my $table_id_field_aref;
	my $new_id;
	my $field_names;
	my $no_quote_fields;
	my @field_names      = ();
	my @results          = ();
	my @no_quote_fields  = ();
	my @no_quote_results = ();
	open( my $fh, '>>', "../../inserts-B_$database.sql" ) or die $!;

	$itemstoinsert = $q->param("itemstoinsert");
	$table         = $q->param("table_selected");
	my $table2 = $dbh->quote($table);

#	This method will not work as is if there are two or more primary keys in a table.
#	But it can be adapted since an array is returned.
#	($table_id_field) = $dbh->primary_key(undef, "public", $table);

	( $field_names, $no_quote_fields, $table_id_field_aref ) =
	  Selecter( "InsertRecord", $table );
	@field_names     = @$field_names;
	@no_quote_fields = @$no_quote_fields;
	$table_id_field  = $$table_id_field_aref;

	my $table_id_field2 = $dbh->quote($table_id_field);

	for my $itemtoi ( 3 .. ( $itemstoinsert + 2 ) ) {
		for my $i ( 0 .. $#field_names ) {
			$results[$i] = $q->param("$field_names[$i]$itemtoi");
			$results[$i] = HTML::Entities::decode( $results[$i] );
			if ( $table eq "products" ) {
				if ( $field_names[$i] eq "product_description" ) {
					$results[$i] =~ s/´/'/g;
					$results[$i] =~ s/&#34;/"/g;
					$results[$i] =~ s/�//g;
					$results[$i] =~ s/�/ Deg./g;
					$results[$i] =~ s/&Atilde;//g;
					$results[$i] =~ s/&#130;/,/g;
					$results[$i] =~ s/&Acirc;//g;
					$results[$i] =~ s/&reg;//g;
					$results[$i] =~ s/Â//g;
					$results[$i] =~ s/®//g;
					$results[$i] =~ s/™//g;
					$results[$i] = HTML::Entities::decode( $results[$i] );
					$results[$i] = encode( "utf8", $results[$i] );
				}
				elsif ( $field_names[$i] eq "up_date"
					&& !( defined $results[$i] ) )
				{
					$results[$i] = "NOW";
				}
			}
			if ( $field_names[$i] =~ "currency" && !( defined $results[$i] ) ) {

				#				$results[$i] = "USD";
				die("Must specify a currency! $!");
			}
			if ( defined $results[$i] ) {
				$results[$i] =~ s#\r\n#\n#g;    # For notes
			}
			$results[$i] = $dbh->quote( $results[$i] );
		}

		$names_array_string  = join( ',', @field_names );
		$values_array_string = join( ',', @results );

		for ( my $i = 0 ; $i <= $#no_quote_fields ; $i++ ) {
			$no_quote_results[$i] = $q->param("$no_quote_fields[$i]$itemtoi");
			$no_quote_results[$i] =
			  HTML::Entities::decode( $no_quote_results[$i] );
			$names_array_string  .= ",$no_quote_fields[$i]";
			$values_array_string .= ",$no_quote_results[$i]";
		}
		$r->print(qq{<p>$names_array_string<br />$values_array_string</p>});
		$SQL =
"INSERT INTO $table ($names_array_string) VALUES ($values_array_string);";
		$sql_list .= "$SQL\n";
		$r->print(
			qq{
			$SQL
			}
		);
		print $fh $sql_list;
		my $ir = $dbh->do($SQL);
		if ($ir) {
			$r->print(qq{<div><h1>Success</h1></div>});
		}
		else {
			$r->print(qq{<div><h1>Failure -- $DBI::errstr</h1></div>});
		}
		$new_id = $dbh->last_insert_id( undef, "public", $table, undef );
		ViewUpdatedRecord( $r, $dbh, $table, $table_id_field, $new_id );
		$names_array_string  = undef;
		$values_array_string = undef;

	}
	close $fh;

	return $new_id;
}

################################################################
#	sub print_option_list

#	Used to produce an XHTML select option list, using database results
#	Uses column(s) $column_string and table $table, results ordered by first column listed in column string
#	Separately, uses a specified label $select_label and a select id/name $select_column

sub print_option_list {
	# version 0.3
	my $r             = shift;
	my $dbh           = shift;
	my $column_string = shift;    # Columns to SELECT FROM $table
	my $table         = shift;
	my $itemtoi       = shift;
	my $select_label  = shift;    # Label for XHTML select field
	my $select_column = shift;    # id and name for XHTML select field
	my $where_clause  = shift || '';    # Extra conditions needed
	my @columns =
	  split( /,/, $column_string );    # Used for ORDER BY $columns[0] below
	my @tbl = ();
	my $field_to_encode;
	my $option_row;
	$select_label =~ s/_(\w)/ \u$1/g;
	$select_label =~ s/ Id/ ID/;
	$select_label =~ s/ Url/ URL/;
	$select_label =~ s/cust /customer /;
	$select_label =~ s/ven /vendor /;
	$select_label =~ s/Fname/First Name/;
	$select_label =~ s/Lname/Last Name/;
	$select_label = ucfirst($select_label);
	$select_label =~ s/Sku/SKU/;

	$r->print(qq{<tr>});
	if ( $itemtoi == 3 ) {
		$r->print(
qq{<td align="left"><label for="$select_column">All?</label></td><td align="left"><input type="checkbox" value="All" id="$select_column" name="$select_column" /></td>
			}
		);
	}
	else {
		$r->print(
			qq{<td align="left"></td>
			<td align="left"></td>
			}
		);
	}
	$r->print(
		qq{<td align="left"><strong>$select_label</strong>
	</td><td align="left" style="width:80%;">
	<select id="$select_column$itemtoi" name="$select_column$itemtoi" style="width:99%;">
<option selected="selected" value="" style="width:99%;"></option>
}
	);
	my $statement =
	  "SELECT DISTINCT $column_string FROM $table $where_clause ORDER BY $columns[0];";
	my $sth = $dbh->prepare($statement) || die("$dbh->errstr");
	my $rc  = $sth->execute             || die("$dbh->errstr");
	while ( @tbl = $sth->fetchrow_array ) {
		$field_to_encode = $tbl[0];
		$field_to_encode = HTML::Entities::encode($field_to_encode);
		$option_row      = qq{<option value="$field_to_encode">};
		for my $i ( 0 .. $#tbl ) {
			unless ( defined $tbl[$i] ) { $tbl[$i] = ''; }
			if ( $tbl[$i] eq "R" || $tbl[$i] eq "P" || $tbl[$i] eq "C" ) {
				$option_row .= qq{($tbl[$i])};
			}
			else {
				$option_row .= qq{$tbl[$i] };
			}
		}
		$option_row .= qq{</option>
};
		$r->print($option_row);
	}
	$r->print(
		qq{
</select>
</td>
</tr>
}
	);
}

################################################################
#	sub specify_insert_options

#	Used to produce an XHTML select option list, using shifted values only
#	Uses $column_string for a label and a select id/name
#	Submitted form values from $values_aref
#	Displayed comes from $names_aref

sub specify_insert_options {
	my $r             = shift;
	my $column_string = shift;
	my $select_label  = shift;
	my $itemtoi       = shift;
	my $values_aref   = shift;
	my $names_aref    = shift;

	$r->print(qq{<tr>});
	if ( $itemtoi == 3 ) {
		$r->print(
			qq{
<td align="left"><label for="$column_string">All?</label></td><td align="left"><input type="checkbox" value="All" id="$column_string" name="$column_string" /></td>
}
		);
	}
	else {
		$r->print(
			qq{<td align="left"></td><td align="left"></td>
			}
		);
	}
	$r->print(
		qq{<td align="left"><strong>$select_label</strong></td>
	<td align="left" style="width:80%;"><select id="$column_string$itemtoi" name="$column_string$itemtoi" style="width:99%;">
<option selected="selected" value="" style="width:99%;"></option>
}
	);
	for my $i ( 0 .. ( scalar(@$values_aref) - 1 ) ) {
		$r->print(
qq{<option value="$$values_aref[$i]" style="width:99%;">$$names_aref[$i]</option>
}
		);
	}
	$r->print(
		qq{</select>
</td>
</tr>
}
	);
}

################################################################
#	sub all_fill_jscript

#	Produces javascript needed so that All? checkbox duplicates existing field values down full group of same insert field

sub all_fill_jscript {
	my $r             = shift;
	my $all_fill_aref = shift;
	my $itemstoi      = shift;
	my @all_fill      = @$all_fill_aref;

	$r->print(
		qq|<script type="text/javascript">
	//<![CDATA[
if (window.addEventListener) {
	window.addEventListener("load",setupCheckAll,false);
} else if (window.attachEvent) {
	window.attachEvent("onload",setupCheckAll);
} else {
	window.onload=setupCheckAll;
}

function setupCheckAll(evnt) {
	var Checks = document.insertform.up_date;
|
	);
	for my $t ( 0 .. $#all_fill ) {
		$r->print(
			qq|
	document.getElementById("insertform").$all_fill[$t].onchange = ChecksCopy;
|
		);
	}
	$r->print(
		qq|
}
function ChecksCopy (evnt) {
|
	);
	for my $t ( 0 .. $#all_fill ) {
		$r->print(
			qq|
	if (document.insertform.$all_fill[$t].checked) {
|
		);
		for my $u ( 4 .. ( $itemstoi + 2 ) ) {
			$r->print(
qq|document.insertform.$all_fill[$t]$u.value=document.insertform.$all_fill[$t]3.value;
|
			);
		}

		$r->print(
			qq|
}

|
		);
	}
	$r->print(
		qq|
}
//]]>
</script>
|
	);

}

=pod

=head1 NAME

BWCL::InsertRecord_B

=head1 VERSION

This documentation refers to BWCL::InsertRecord_B version 4.2.10.

=head1 SYNOPSIS

Inserts a chosen number of new fields.

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
