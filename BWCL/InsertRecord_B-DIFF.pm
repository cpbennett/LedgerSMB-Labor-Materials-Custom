package BWCL::InsertRecord_B;

our $VERSION = 4.2.00;

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
