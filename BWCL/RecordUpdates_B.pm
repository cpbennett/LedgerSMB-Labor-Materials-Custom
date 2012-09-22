package BWCL::RecordUpdates_B;

our $VERSION = 4.3.00;

use warnings;
use strict;

require Exporter;
our @ISA       = qw(Exporter);
our @EXPORT_OK = qw(UpdateRecord UpdateRecordForm DeleteDuplicates);

use HTML::Entities();
use Encode;

use BWCL::ViewRecords_B qw(ViewUpdatedRecord);
use BWCL::BWCLFields qw (Selecter);

#######################################################################
##		Sub UpdateRecordForm

sub UpdateRecordForm {
	my $r       = shift;
	my $dbh     = shift;
	my $q       = shift;
	my $program = shift;
	my $table;
	my $id_selected;
	my $tbl;
	$table       = $q->param("table_selected") || '';
	$id_selected = $q->param("id_selected")    || '';
	my $table_id_field;
	my @field_names = ();
	my $field_names;
	my $notes_fields;
	my $ucfirst;
	my $i;
	my @results      = ();
	my @results_n    = ();
	my @notes_fields = ();

	( $field_names, $table_id_field, $notes_fields ) =
	  Selecter( "RecordUpdatesForm", $table );
	@field_names    = @$field_names;
	$table_id_field = $$table_id_field;
	@notes_fields   = @$notes_fields;

	my $statement = join( ', ', @field_names );
	my $statement3 =
	  "SELECT $statement FROM $table WHERE $table_id_field = $id_selected;";
	unless ( @results = $dbh->selectrow_array($statement3) ) {
		die "can't execute the query: $dbh->errstr";
	}
	for ( $i = 0 ; $i <= $#results ; $i++ ) {
		unless ( defined $results[$i] ) { $results[$i] = ''; }
		$results[$i] = HTML::Entities::encode( $results[$i] );
	}
	$r->print(qq{<h2>Columns from Table = $table</h2>});
	$r->print(qq{<form action="$program" method="post"><div>});

	$r->print(
qq{<table class="cent" summary="Form to update records" rules="groups" cellspacing="0" cellpadding="2">
	<caption class="tiheadbig">Record to Update from $table<br />
	WHERE $table_id_field = $id_selected<br /><br />
	</caption>
	<tbody>
	}
	);

	#######################################################################

	for ( $i = 0 ; $i <= ($#field_names) ; $i++ )
	{    # change to regex for notes fields
		$ucfirst = $field_names[$i];
		$ucfirst =~ s/_(\w)/ \u$1/g;
		$ucfirst =~ s/ Id/ ID/;
		$ucfirst =~ s/ Url/ URL/;
		$ucfirst =~ s/cust /customer /;
		$ucfirst =~ s/ven /vendor /;
		$ucfirst =~ s/Fname/First Name/;
		$ucfirst =~ s/Lname/Last Name/;
		$ucfirst = ucfirst($ucfirst);
		$results[$i] =~ s/"/ In./g
		  ; # Pisses me off I can't find a way to deal with BOTH ' and " in XHTML forms
		$r->print(
			qq{<tr>
	<td align="left"><strong>$ucfirst</strong></td><td align="left" style="width:80%;"><input type="text" id="$field_names[$i]" name="$field_names[$i]" value="$results[$i]" style="width:99%;" /></td>
	</tr>
	}
		);
	}

	if ( $table eq "labor_project" ) {
		print_update_option_list(
			$r,                       $dbh,
			"labor_project_currency", "labor_project_id",
			"labor_project",          $id_selected,
			"currency",               "Currency",
			"labor_project_currency", "currenciesg"
		);
		print_update_option_list(
			$r,                 $dbh,
			"method_to_charge", "labor_project_id",
			"labor_project",    $id_selected,
			"method_to_charge", "General Labor Method to Charge",
			"method_to_charge", "method_to_charge"
		);
		my @values = ( "N",  "Y" );
		my @names  = ( "No", "Yes" );
		specify_options(
			$r,                                $dbh,
			"labor_project_is_subcontracted",  "labor_project_id",
			"labor_project",                   $id_selected,
			"Labor Project is Subcontracted?", \@values,
			\@names
		);
	}
	elsif ( $table eq "labor_project_list" ) {
		print_update_option_list(
			$r,                        $dbh,
			"labor_project_list_name", "labor_project_list_id",
			"labor_project_list",      $id_selected,
			"labor_project_name",      "Labor Project List Name",
			"labor_project_list_name", "labor_project"
		);
		print_update_option_list(
			$r,                            $dbh,
			"labor_project_list_currency", "labor_project_list_id",
			"labor_project_list",          $id_selected,
			"currency",                    "Currency",
			"labor_project_list_currency", "currenciesg"
		);
	}
	elsif ( $table eq "labor_category" ) {
		print_update_option_list(
			$r,                     $dbh,
			"labor_category_skill", "labor_category_id",
			"labor_category",       $id_selected,
			"labor_category_skill", "Labor Category Skill",
			"labor_category_skill", "labor_category"
		);
		print_update_option_list(
			$r,                       $dbh,
			"labor_category_service", "labor_category_id",
			"labor_category",         $id_selected,
			"labor_category_service", "Labor Category Service",
			"labor_category_service", "labor_category"
		);
	}
	elsif ( $table eq "general_labor" ) {
		print_update_option_list(
			$r,                       $dbh,
			"general_labor_currency", "general_labor_id",
			"general_labor",          $id_selected,
			"currency",               "Currency",
			"general_labor_currency", "currenciesg"
		);
		print_update_option_list(
			$r,                 $dbh,
			"method_to_charge", "general_labor_id",
			"general_labor",    $id_selected,
			"method_to_charge", "General Labor Method to Charge",
			"method_to_charge", "method_to_charge"
		);
		my @values = ( "N",  "Y" );
		my @names  = ( "No", "Yes" );
		specify_options(
			$r,                                $dbh,
			"general_labor_is_subcontracted",  "general_labor_id",
			"general_labor",                   $id_selected,
			"General Labor is Subcontracted?", \@values,
			\@names
		);
		my $labor_category_id;
		my $labor_category_category;
		my $labor_category_subcategory;
		my $state =
"SELECT labor_category_id FROM general_labor WHERE general_labor_id = $id_selected;";

		unless ( $labor_category_id = $dbh->selectrow_array($state) ) {
			die "can't execute the query: $dbh->errstr";
		}
		$state =
"SELECT labor_category_category, labor_category_subcategory FROM labor_category WHERE labor_category_id = $labor_category_id;";
		unless ( ( $labor_category_category, $labor_category_subcategory ) =
			$dbh->selectrow_array($state) )
		{
			die "can't execute the query: $dbh->errstr";
		}
		$r->print(
			qq{<tr>
	<td align="left"><strong>Labor Category</strong></td><td align="left" style="width:80%;">
	<select id="labor_category_id" name="labor_category_id" style="width:99%;">
	<option selected="selected" value="$labor_category_id" style="width:99%;">$labor_category_category - $labor_category_subcategory</option>
	}
		);
		my $tblc;
		my $statementc =
"SELECT labor_category_id, labor_category_category, labor_category_subcategory FROM labor_category ORDER BY labor_category_id;";
		my $sthc = $dbh->prepare($statementc) || die $dbh->errstr;
		my $rcc  = $sthc->execute             || die $dbh->errstr;
		my $tbl9c;
		while ( $tblc = $sthc->fetchrow_arrayref ) {
			$$tblc[0] = HTML::Entities::encode( $$tblc[0] );
			$tbl9c = qq{<option value="$$tblc[0]">$$tblc[1] - $$tblc[2]</option>
	};
			$r->print(qq{$tbl9c});
		}
		$r->print(
			qq{
</select>
</td>
</tr>
}
		);
	}
	elsif ( $table eq "full_assembly" ) {
		my $full_assembly_assembly_id;
		my $assembly_name;
		my $statement =
"SELECT full_assembly_assembly_id FROM full_assembly WHERE full_assembly_id = $id_selected;";
		unless ( ($full_assembly_assembly_id) =
			$dbh->selectrow_array($statement) )
		{
			die "can't execute the query: $dbh->errstr";
		}
		$statement =
"SELECT assembly_name FROM assemblies WHERE assembly_id = $full_assembly_assembly_id;";
		unless ( ($assembly_name) = $dbh->selectrow_array($statement) ) {
			die "can't execute the query: $dbh->errstr";
		}

		$r->print(
			qq{<tr>
<td align="left"><strong>Full Assembly Assembly ID</strong></td><td align="left" style="width:80%;">
<select id="full_assembly_assembly_id" name="full_assembly_assembly_id" style="width:99%;">
<option selected="selected" value="$full_assembly_assembly_id" style="width:99%;">$full_assembly_assembly_id - $assembly_name</option>
}
		);

		$statement = "SELECT assembly_id, assembly_name FROM assemblies;";
		my $sth = $dbh->prepare($statement) || die $dbh->errstr;
		my $rc  = $sth->execute             || die $dbh->errstr;
		my $tbl9;
		while ( $tbl = $sth->fetchrow_arrayref ) {
			$$tbl[0] = HTML::Entities::encode( $$tbl[0] );
			$$tbl[1] = HTML::Entities::encode( $$tbl[1] );
			$tbl9 = qq{<option value="$$tbl[0]">$$tbl[1]  --$$tbl[0]--</option>
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

#			print_update_option_list($r, $dbh, "full_assembly_assembly_name", "full_assembly_id", "full_assembly", $id_selected, "assembly_name", "Full Assembly Assembly Name", "full_assembly_assembly_name", "assemblies");
		print_update_option_list(
			$r,                       $dbh,
			"full_assembly_currency", "full_assembly_id",
			"full_assembly",          $id_selected,
			"currency",               "Currency",
			"full_assembly_currency", "currencies"
		);
	}
	elsif ( $table eq "full_assembly_list" ) {
		print_update_option_list(
			$r,                        $dbh,
			"full_assembly_list_name", "full_assembly_list_id",
			"full_assembly_list",      $id_selected,
			"full_assembly_name",      "Full Assembly List Name",
			"full_assembly_list_name", "full_assembly"
		);

		print_update_option_list(
			$r,                            $dbh,
			"full_assembly_list_currency", "full_assembly_list_id",
			"full_assembly_list",          $id_selected,
			"currency",                    "Currency",
			"full_assembly_list_currency", "currencies"
		);
	}
	elsif ( $table eq "assemblies" ) {
		print_update_option_list(
			$r,                  $dbh,
			"assembly_currency", "assembly_id",
			"assemblies",        $id_selected,
			"currency",          "Assembly Currency",
			"assembly_currency", "currencies"
		);
	}
	elsif ( $table eq "assemblies_parts" ) {
		print_update_option_list(
			$r,                       $dbh,
			"assembly_part_currency", "assembly_part_id",
			"assemblies_parts",       $id_selected,
			"currency",               "Assembly Part Currency",
			"assembly_part_currency", "currencies"
		);
		my $assembly_name;
		my $assembly_part_assembly_id;
		my $statement =
"SELECT assembly_part_assembly_id FROM assemblies_parts WHERE assembly_part_id = $id_selected;";
		unless ( ($assembly_part_assembly_id) =
			$dbh->selectrow_array($statement) )
		{
			die "can't execute the query: $dbh->errstr";
		}
		$statement =
"SELECT assembly_name FROM assemblies WHERE assembly_id = $assembly_part_assembly_id;";
		unless ( ($assembly_name) = $dbh->selectrow_array($statement) ) {
			die "can't execute the query: $dbh->errstr";
		}

		$r->print(
			qq{<tr>
	<td align="left"><strong>Assembly Part Assembly Name</strong></td><td align="left" style="width:80%;">
	<select id="assembly_part_assembly_id" name="assembly_part_assembly_id" style="width:99%;">
	<option selected="selected" value="$assembly_part_assembly_id" style="width:99%;">$assembly_part_assembly_id - $assembly_name</option>
	}
		);
		$statement =
"SELECT assembly_id, assembly_name FROM assemblies ORDER BY assembly_name;";
		my $sth = $dbh->prepare($statement) || die $dbh->errstr;
		my $rc  = $sth->execute             || die $dbh->errstr;
		my $tbl9;
		while ( $tbl = $sth->fetchrow_arrayref ) {
			$$tbl[0] = HTML::Entities::encode( $$tbl[0] );
			$$tbl[1] = HTML::Entities::encode( $$tbl[1] );
			$tbl9 = qq{<option value="$$tbl[0]">$$tbl[1]  --$$tbl[0]--</option>
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
	}
	elsif ( $table eq "customers" ) {
		my @values = ( "R",           "C" );
		my @names  = ( "Residential", "Commercial" );
		specify_options(
			$r,                           $dbh,
			"residential_or_commercial",  "cust_id",
			"customers",                  $id_selected,
			"Residential or Commercial?", \@values,
			\@names
		);
		print_update_option_list(
			$r,                $dbh,
			"cust_bill_country", "cust_id",
			"customers",        $id_selected,
			"country",         "Customer Bill Country",
			"cust_bill_country", "countries"
		);
	}
	elsif ( $table eq "jobsites" ) {
		my @values = ( "R",           "C" );
		my @names  = ( "Residential", "Commercial" );
		specify_options(
			$r,                           $dbh,
			"residential_or_commercial",  "jobsite_id",
			"jobsites",                   $id_selected,
			"Residential or Commercial?", \@values,
			\@names
		);
		my $jobsite_cust_id_selected;
		my $cust_id;
		my $cust_bill_business_name;
		my $cust_bill_fname;
		my $cust_bill_lname;
		my $residential_or_commercial;
		my $id_state =
		  "SELECT cust_id FROM jobsites WHERE jobsite_id = $id_selected;";

		unless ( $jobsite_cust_id_selected = $dbh->selectrow_array($id_state) )
		{
			die "can't execute the query: $dbh->errstr";
		}
		my $state =
"SELECT cust_id, cust_bill_business_name, residential_or_commercial, cust_bill_fname, cust_bill_lname FROM customers WHERE cust_id = $jobsite_cust_id_selected;";
		unless (
			(
				$cust_id,                   $cust_bill_business_name,
				$residential_or_commercial, $cust_bill_fname,
				$cust_bill_lname
			)
			= $dbh->selectrow_array($state)
		  )
		{
			die "can't execute the query: $dbh->errstr";
		}

		$r->print(
			qq{<tr>
	<td align="left"><strong>Customer</strong></td><td align="left" style="width:80%;">
	<select id="cust_id" name="cust_id" style="width:99%;">
	<option selected="selected" value="$cust_id" style="width:99%;">$cust_bill_business_name ($residential_or_commercial) - $cust_bill_fname $cust_bill_lname</option>
	}
		);
		my $tblc;
		my $statementc =
"SELECT cust_id, cust_bill_business_name, residential_or_commercial, cust_bill_fname, cust_bill_lname FROM customers ORDER BY cust_id;";
		my $sthc = $dbh->prepare($statementc) || die $dbh->errstr;
		my $rcc  = $sthc->execute             || die $dbh->errstr;
		my $tbl9c;
		while ( $tblc = $sthc->fetchrow_arrayref ) {
			unless ( defined $$tblc[0] ) { $$tblc[0] = ''; }
			unless ( defined $$tblc[1] ) { $$tblc[1] = ''; }
			unless ( defined $$tblc[2] ) { $$tblc[2] = ''; }
			unless ( defined $$tblc[3] ) { $$tblc[3] = ''; }
			unless ( defined $$tblc[4] ) { $$tblc[4] = ''; }
			$$tblc[0] = HTML::Entities::encode( $$tblc[0] );
			$tbl9c =
qq{<option value="$$tblc[0]">$$tblc[1] ($$tblc[2]) - $$tblc[3] $$tblc[4]</option>
				};
			$r->print(qq{$tbl9c});
		}
		$r->print(
			qq{
	</select>
	</td>
	</tr>
	}
		);
		print_update_option_list(
			$r,                $dbh,
			"jobsite_country", "jobsite_id",
			"jobsites",        $id_selected,
			"country",         "Jobsite Country",
			"jobsite_country", "countries"
		);
	}
	elsif ( $table eq "products" ) {
		print_update_option_list(
			$r,            $dbh,         "vendor_name ", "product_id",
			"products",    $id_selected, "vendor_name",  "Vendor Name",
			"vendor_name", "vendors"
		);
		print_update_option_list(
			$r,                 $dbh,
			"product_currency", "product_id",
			"products",         $id_selected,
			"currency",         "Currency",
			"product_currency", "currencies"
		);
	}
	elsif ( $table eq "vendors" ) {
		print_update_option_list(
			$r,               $dbh,
			"vendor_country", "vendor_id",
			"vendors",        $id_selected,
			"country",        "Vendor Country",
			"vendor_country", "countries"
		);
		print_update_option_list(
			$r,                $dbh,
			"vendor_currency", "vendor_id",
			"vendors",         $id_selected,
			"currency",        "Vendor Currency",
			"vendor_currency", "currencies"
		);
	}
	elsif ( $table eq "vendor_contacts" ) {
		print_update_option_list(
			$r,                $dbh,
			"vendor_name ",    "vend_contact_id",
			"vendor_contacts", $id_selected,
			"vendor_name",     "Vendor Name",
			"vendor_name",     "vendors"
		);
		print_update_option_list(
			$r,                    $dbh,
			"ven_contact_country", "vend_contact_id",
			"vendor_contacts",     $id_selected,
			"country",             "Vendor Contact Country",
			"ven_contact_country", "countries"
		);

	}
	elsif ( $table eq "contractors" ) {
		print_update_option_list(
			$r,                   $dbh,
			"contractor_country", "contractor_id",
			"contractors",        $id_selected,
			"country",            "Contractor Country",
			"contractor_country", "countries"
		);
		print_update_option_list(
			$r,                    $dbh,
			"contractor_currency", "contractor_id",
			"contractors",         $id_selected,
			"currency",            "Contractor Currency",
			"contractor_currency", "currenciesg"
		);
	}
	if (scalar @notes_fields) {	#Check to see if any fields in @notes_fields, else skip
		$statement = join( ', ', @notes_fields );
		$statement3 =
		  "SELECT $statement FROM $table WHERE $table_id_field = $id_selected;";
		unless ( @results_n = $dbh->selectrow_array($statement3) ) {
			die "can't execute the query: $dbh->errstr";
		}
		for ( $i = 0 ; $i <= $#results_n ; $i++ ) {
			$ucfirst = $notes_fields[$i];
			$ucfirst =~ s/_(\w)/ \u$1/g;
			$ucfirst = ucfirst($ucfirst);
			unless ( defined $results_n[$i] ) { $results_n[$i] = ''; }
			$results_n[$i] =~ s/"/ In./g
			  ; # Pisses me off I can't find a way to deal with BOTH ' and " in XHTML forms
			$results_n[$i] = HTML::Entities::encode( $results_n[$i] );
			$r->print(
				qq{<tr>
		<td align="left"><strong>$ucfirst</strong></td><td align="left" style="width:80%;"><textarea cols="99" rows="6" id="$notes_fields[$i]" name="$notes_fields[$i]" style="width:99%;">$results_n[$i]</textarea></td>
		</tr>}
			);
		}
	}
	$r->print(
		qq{</tbody></table>
<input type="hidden" name="id_selected" value="$id_selected" />
<input type="hidden" name="table_selected" value="$table" />
<input type="hidden" value="UpdateRecord" name="command" />
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
	return 1;
}

#######################################################################
##		Sub UpdateRecord

sub UpdateRecord {
	my $r        = shift;
	my $dbh      = shift;
	my $q        = shift;
	my $database = shift;
	my $table;
	my $values_array_string;
	my $names_array_string;
	my $id_selected;
	my $SQL;
	my $table_id_field;

	#	my $field_names_aref;
	my $field_names;
	my @field_names = ();
	my @results     = ();

	open( my $fh, '>>', "../../updates-B_$database.sql" ) or die $!;

	$table       = $q->param("table_selected");
	$id_selected = $q->param("id_selected");

#	my $table2 = $dbh->quote($table);
#	This method will not work as is if there are two or more primary keys in a table.
#	But it can be adapted since an array is returned.
#	($table_id_field) = $dbh->primary_key(undef, "public", $table);
#	my $table_id_field2 = $dbh->quote($table_id_field);
#	$field_names_aref = $dbh->selectcol_arrayref("SELECT column_name FROM information_schema.columns WHERE table_name = $table2 AND column_name <> $table_id_field2 AND column_name !~ 'total' AND column_name <> 'assembly_part_assembly_name' AND column_name <> 'assembly_part_description';");
#	@field_names = @$field_names_aref;

	( $field_names, $table_id_field ) = Selecter( "RecordUpdates", $table );
	@field_names    = @$field_names;
	$table_id_field = $$table_id_field;
	my $table_id_field2 = $dbh->quote($table_id_field);

	for ( my $i = 0 ; $i <= $#field_names ; $i++ ) {
		$results[$i] = $q->param("$field_names[$i]");
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
			elsif ( $field_names[$i] eq "up_date" && ( $results[$i] eq '' ) ) {
				$results[$i] = "NOW";
			}
		}
		if ( defined $results[$i] ) {
			$results[$i] =~ s#\r\n#\n#g;    # For notes
		}
	}
	for ( my $i = 0 ; $i <= $#results ; $i++ ) {
		$results[$i] = HTML::Entities::decode( $results[$i] );
		$results[$i] = $dbh->quote( $results[$i] );
	}
	$names_array_string  = join( ',', @field_names );
	$values_array_string = join( ',', @results );
	$r->print(qq{<p>$names_array_string<br />$values_array_string</p>});
	$SQL =
"UPDATE $table SET ($names_array_string) = ($values_array_string) WHERE $table_id_field = $id_selected;";
	my $ur = $dbh->do($SQL);
	if ($ur) {
		$r->print(qq{<div><h1>Success</h1></div>});
	}
	else {
		$r->print(qq{<div><h1>Failure -- $DBI::errstr</h1></div>});
	}

	print $fh $SQL;
	close $fh;

	ViewUpdatedRecord( $r, $dbh, $table, $table_id_field, $id_selected );
	return 1;
}

#######################################################################
##		Sub DeleteDuplicates

sub DeleteDuplicates {
	my $r       = shift;
	my $dbh     = shift;
	my $q       = shift;
	my $table   = shift;
	my $program = shift;
	my $table2;
	$table2 = $dbh->quote($table);
	my $vendor_name_selected;
	$vendor_name_selected = $q->param("vendor_name_selected");
	my $class_selected;
	$class_selected = $q->param("class_selected");
	my @d_id = ();
	@d_id = $q->param("d_id");

	###################################################################
	##		Vendor Name Selection Verification
	if ( ( $vendor_name_selected eq "" ) || ( $vendor_name_selected eq "All" ) )
	{
		$r->print(
qq{<div class="cent"><p class="error">ERROR!! Please select a single Vendor Name.</p></div>}
		);
		return (0);
	}
	if ( ($table) && (@d_id) ) {
		my $price;
		my $SQL;
		my $DeleteDuplicates;
		my $delete_list = join( ",", @d_id );
		$r->print(qq{<div><h2>Deleted Records from Table = $table</h2><br />});
		$SQL = "DELETE FROM $table WHERE product_id IN ($delete_list);";
		$DeleteDuplicates = $dbh->do($SQL);
		if ($DeleteDuplicates) {
			$r->print(
qq{<div><h1>Success!<br />Deleted $DeleteDuplicates Records</h1></div>}
			);
		}
		else {
			$r->print(qq{<div><h1>Failure -- $DBI::errstr</h1></div>});
		}
	}
	elsif ( ($table) && ($vendor_name_selected) && ($class_selected) ) {
		my $vendor_name_selected2 = $dbh->quote($vendor_name_selected);
		my $statement;
		if ( $class_selected ne 'All' ) {
			my $class_selected2 = $dbh->quote($class_selected);
			$statement =
"SELECT product_id, class, subclass, product_url, product_description, up_date, sku, model, price FROM $table WHERE (class = $class_selected2 AND vendor_name = $vendor_name_selected2 AND (sku, model, product_description) IN (SELECT sku, model, product_description FROM $table GROUP BY sku, model, product_description HAVING COUNT(*) > 1)) ORDER BY sku, model, up_date, product_description ASC;";
		}
		else {
			my $vendor_name_selected2 = $dbh->quote($vendor_name_selected);
			$statement =
"SELECT product_id, class, subclass, product_url, product_description, up_date, sku, model, price FROM $table WHERE (vendor_name = $vendor_name_selected2 AND (sku, model, product_description) IN (SELECT sku, model, product_description FROM $table GROUP BY sku, model, product_description HAVING COUNT(*) > 1)) ORDER BY sku, model, up_date, product_description ASC;";
		}
		my $sth = $dbh->prepare($statement);
		my $rv = $sth->execute or die "can't execute the query: $sth->errstr\n";
		my @vetor;
		$r->print(
qq{<h2>Columns from Table=$table:<br />From Vendor:$vendor_name_selected</h2>}
		);
		$r->print(
			qq{
	<form id="vendor_products" action="$program" method="post"><div>
	<table summary="" border="2" rules="all">
	<thead>
	    <tr>
	    <th align="left"><strong>Product ID</strong></th>
	    <th align="left"><strong>Class</strong></th>
	    <th align="left"><strong>SubClass</strong></th>
	    <th align="left"><strong>Product URL</strong></th>
	    <th align="left"><strong>Product Description</strong></th>
	    <th align="left"><strong>Date</strong></th>
	    <th align="left"><strong>SKU</strong></th>
	    <th align="left"><strong>Model</strong></th>
	    <th align="left"><strong>Price</strong></th>
	    <th align="left"><strong>Delete?</strong></th>
	     </tr>
	</thead>
	<tbody>
	}
		);
		my $ii = $rv;
		while ( @vetor = $sth->fetchrow ) {
			$ii--;
			if ( $ii == 0 ) {
				$sth->finish;
				last;
			}
			$r->print(qq{<tr>});
			for my $field ( 0 .. $#vetor ) {
				if ($field) {
					$field = HTML::Entities::encode($field);
				}
				if ( $field != $#vetor ) {
					if ( $vetor[$field] ) {
						$vetor[$field] =
						  HTML::Entities::encode( $vetor[$field] );
						$r->print(qq{<td align="left">$vetor[$field]</td>});
					}
					else {
						$r->print(qq{<td align="left"></td>});
					}
				}
				elsif ( $field == ($#vetor) ) {
					if ( $vetor[$field] ) {
						$r->print(
							qq{<td align="left">$vetor[$field]</td>
						<td align="center"><input type="checkbox" value="$vetor[0]" name="d_id" /></td></tr>}
						);
					}
					else {
						$r->print(
							qq{<td align="left"></td>
						<td align="center"><input type="checkbox" value="$vetor[0]" name="d_id" /></td></tr>}
						);
					}
				}
			}
		}
		$r->print(
			qq{
	</tbody></table>
	<br />
	<br />
	<input type="hidden" name="table_selected" value="$table" />
	<input type="hidden" value="DeleteDuplicates" name="command" />
	<input type="hidden" value="$vendor_name_selected" name="vendor_name_selected">
	<input id="submitForm" type="submit" value="Continue" name="submitForm" />
	<input id="resetForm" type="reset" value="Reset" name="reset1" />
	</div></form>
	<hr /><hr />
	}
		);
	}
	return 1;
}

################################################################
#	sub print_update_option_list

#	SELECT column(s) $column_string FROM $table WHERE $table_id_column = $id_selected
#	This produces existing values to fill select list selected value
#	$select_label gives the field name in the table
#	$select_column gives select field id/name
#
#	NOTE WELL!
#	$table and $table_2 are NOT the same table
#	$table is the table being updated
#	$table_2 is the table that the optional values were originally chosen from
#
#	For additional options to be changed to:
#	SELECT DISTINCT column(s) $column_string_2 FROM $table2
#
#	Multi-Column option displayed needs to be converted to id value elsewhere!
#		elsif ($table eq "labor_project_list") {
#			print_update_option_list($r,$dbh,
#			Column from table 1, table being updated : "labor_project_list_name",
#			ID column for table being updated : "labor_project_list_id",
#			Table name of table being updated : "labor_project_list",
#			ID of particular item being updated : $id_selected,
#
#			Field that original values were chosen from in table2 : "labor_project_name",
#			This is select label for update form : "Labor Project List Name",
#			This is the id/name part of update form : "labor_project_list_name",
#			This is name of original table list of values were chosen from : "labor_project"
#
#			This order chosen is really confusing. I should update it to something more obvious.
#			Maybe later, Dude

sub print_update_option_list {
	my $r               = shift;
	my $dbh             = shift;
	my $column_string   = shift;
	my $table_id_column = shift;
	my $table           = shift;
	my $id_selected     = shift;
	my $column_string_2 = shift;
	my $select_label    = shift;
	my $select_column   = shift;
	my $table_2         = shift;
	my @columns         = split( /,/, $column_string );
	my @columns_2       = split( /,/, $column_string_2 );
	my @tbl             = ();
	my $field_to_encode;
	my $option_row;
	my @results = ();
	my $state =
"SELECT $column_string FROM $table WHERE $table_id_column = $id_selected;";

	unless ( @results = $dbh->selectrow_array($state) ) {
		die "can't execute the query: $dbh->errstr";
	}
	foreach my $j ( 0 .. $#results ) {
		unless ( defined $results[$j] ) { $results[$j] = ''; }
	}
	$r->print(
		qq{<tr>
<td align="left"><strong>$select_label</strong></td><td align="left" style="width:80%;">
<select id="$select_column" name="$select_column" style="width:99%;">}
	);
	$field_to_encode = $results[0];
	$field_to_encode = HTML::Entities::encode($field_to_encode);
	$r->print(
qq{<option selected="selected" value="$field_to_encode" style="width:99%;">
		}
	);
	foreach my $i ( 0 .. $#results ) {
		unless ( defined $results[$i] ) { $results[$i] = ''; }
		if ( $results[$i] eq "R" || $results[$i] eq "P" || $results[$i] eq "C" )
		{
			$option_row .= qq{($results[$i]) };
		}
		else {
			$option_row .= qq{$results[$i] };
		}
	}
	$option_row .= qq{</option>
};
	$r->print($option_row);

	################################################################
	#	This section adds other options to be changed to

	$field_to_encode = "";
	$option_row      = "";
	my $statement =
	  "SELECT DISTINCT $column_string_2 FROM $table_2 ORDER BY $columns_2[0];";
	my $sth = $dbh->prepare($statement) || die("$dbh->errstr");
	my $rc  = $sth->execute             || die("$dbh->errstr");
	while ( @tbl = $sth->fetchrow_array ) {
		$field_to_encode = $tbl[0];
		$field_to_encode = HTML::Entities::encode($field_to_encode);
		$option_row      = qq{<option value="$field_to_encode">
		};
		for my $i ( 0 .. $#tbl ) {
			unless ( defined $tbl[$i] ) { $tbl[$i] = ''; }
			if ( $tbl[$i] eq "R" || $tbl[$i] eq "P" || $tbl[$i] eq "C" ) {
				$option_row .= qq{($tbl[$i]) };
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
#	sub specify_options

#	SELECT column(s) $column_string FROM $table WHERE $table_id_column = $id_selected
#	This produces existing values to fill select list selected value
#	$select_label gives the field name in the table
#	$select_column gives select field id/name
#	$values_aref gives the new option values
#	$names_aref gives the new option displayed values

#	This could be avoided, but it allows character fields with fixed choices to get "pretty" displayed values

sub specify_options {
	my $r               = shift;
	my $dbh             = shift;
	my $column_string   = shift;
	my $table_id_column = shift;
	my $table           = shift;
	my $id_selected     = shift;
	my $select_label    = shift;
	my $values_aref     = shift;
	my $names_aref      = shift;
	my $results;
	my $results_pretty;
	my $state =
"SELECT $column_string FROM $table WHERE $table_id_column = $id_selected;";

	unless ( $results = $dbh->selectrow_array($state) ) {
		die "can't execute the query: $dbh->errstr";
	}
	unless ( defined $results ) { $results = ''; }
	for my $i ( 0 .. ( scalar(@$values_aref) - 1 ) ) {
		if ( $results eq $$values_aref[$i] ) {
			$results_pretty = $$names_aref[$i];
		}
	}
	$r->print(
		qq{<tr>
<td align="left"><strong>$select_label</strong></td><td align="left" style="width:80%;">
<select id="$column_string" name="$column_string" style="width:99%;">
<option selected="selected" value="$results" style="width:99%;">$results_pretty</option>
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

=pod

=head1 NAME

BWCL::RecordUpdates_B


=head1 VERSION

This documentation refers to BWCL::RecordUpdates_B version 4.3.00.

=head1 SYNOPSIS

Updates existing records. Removes many duplicate records from products.

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
