#!/usr/bin/perl
package BWC::BWCFields;
our $VERSION = 1.1.1;
use warnings;
use strict;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(Selecter);
sub Selecter {
	my $sub = shift;
	my $table = shift;
	my $table_id_field;
	my @field_names;
	my @notes_fields;
	my @no_quote_fields;
	my @select_fields;
	my @view_only;
	my $statement;
	my @order;
	my @specialty_fields;
	my $fetch_all_href;

if ($table eq "products") {
		@specialty_fields = qw(up_date check_days);
		@select_fields = qw(vendor_name product_currency);
		@field_names = qw(
			product_description
			class
			subclass
			price
			sku
			model
			product_url
);
		@notes_fields = qw(
		product_notes
		);
		$table_id_field = "product_id";
		@no_quote_fields = qw();
} elsif ($table eq "vendors") {
		@select_fields = qw(
			vendor_currency
			vendor_country
	);
		@field_names = qw(
			vendor_name
			hours_open
			vendor_street_address
			vendor_street_address2
			vendor_city
			vendor_state
			vendor_zip
			vendor_phone
			vendor_phone2
			vendor_fax
			vendor_website
			vendor_email
			search_access
);
		@notes_fields = qw(vendor_notes);
		$table_id_field = "vendor_id";
		@no_quote_fields = qw();
} elsif ($table eq "labor_skill") {
		@select_fields = qw();
		@field_names = qw(
			labor_skill
);
		@notes_fields = qw();
		$table_id_field = "labor_skill_id";
		@no_quote_fields = qw();
} elsif ($table eq "labor_service") {
		@select_fields = qw();
		@field_names = qw(
			labor_service
);
		@notes_fields = qw();
		$table_id_field = "labor_service_id";
		@no_quote_fields = qw();
} elsif ($table eq "method_to_charge") {
		@select_fields = qw();
		@field_names = qw(
			method_to_charge
);
		@notes_fields = qw();
		$table_id_field = "method_to_charge_id";
		@no_quote_fields = qw();
} elsif ($table eq "customers") {
		@select_fields = qw(residential_or_commercial cust_bill_country);
		@field_names = qw(
			cust_bill_business_name
			cust_bill_fname
			cust_bill_lname
			cust_bill_phone_home
			cust_bill_phone_cell
			cust_bill_phone_work
			cust_bill_email
			cust_bill_fname2
			cust_bill_lname2
			cust_bill_phone_cell2
			cust_bill_phone_work2
			cust_bill_email2
			cust_bill_phone_fax
			cust_bill_street_addr
			cust_bill_street_addr2
			cust_bill_city
			cust_bill_state
			cust_bill_zip
);
		@notes_fields = qw(cust_bill_notes);
		$table_id_field = "cust_id";
		@no_quote_fields = qw();
} elsif ($table eq "jobsites") {
		@select_fields = qw(cust_id residential_or_commercial jobsite_country);
		@field_names = qw(
			jobsite_business_name
			jobsite_street_addr
			jobsite_street_addr2
			jobsite_city
			jobsite_state
			jobsite_zip
			jobsite_phone_home
			jobsite_phone_cell
			jobsite_phone_work
			jobsite_phone_fax
			jobsite_phone_cell2
			jobsite_phone_work2
			jobsite_email
			jobsite_website
);
		@notes_fields = qw(jobsite_notes);
		$table_id_field = "jobsite_id";
		@no_quote_fields = qw();
} elsif ($table eq "vendor_contacts") {
		@select_fields = qw(vendor_name ven_contact_country);
		@field_names = qw(
			ven_contact_fname
			ven_contact_lname
			ven_contact_phone
			ven_contact_cell_phone
			ven_contact_fax
			ven_contact_home_phone
			ven_contact_email
);
		@notes_fields = qw(ven_contact_notes);
		$table_id_field = "vend_contact_id";
		@no_quote_fields = qw();
} elsif ($table eq "currencies") {
		@select_fields = qw();
		@field_names = qw(
			currency
);
		@notes_fields = qw();
		$table_id_field = "currency_id";
		@no_quote_fields = qw();
} elsif ($table eq "currenciesg") {
		@select_fields = qw();
		@field_names = qw(
			currency
);
		@notes_fields = qw();
		$table_id_field = "currency_id";
		@no_quote_fields = qw();
} elsif ($table eq "countries") {
		@select_fields = qw();
		@field_names = qw(
			country
);
		@notes_fields = qw();
		$table_id_field = "country_id";
		@no_quote_fields = qw();
} elsif ($table eq "assemblies") {
		@select_fields = qw(assembly_currency);
		@field_names = qw(
			assembly_name
			assembly_description
			assembly_category
			assembly_url
);
		@notes_fields = qw(assembly_notes);
		$table_id_field = "assembly_id";
		@no_quote_fields = qw();
		@view_only = qw(assembly_subtotal);
} elsif ($table eq "assemblies_parts") {
		@select_fields = qw(assembly_part_assembly_id assembly_part_currency);
		@field_names = qw(
			assembly_part_name
			assembly_part_description
			assembly_part_class
			assembly_part_subclass
			assembly_part_quantity
			assembly_part_product_id
);
		@notes_fields = qw(assembly_part_notes);
		$table_id_field = "assembly_part_id";
		@no_quote_fields = qw();
		@view_only = qw(assembly_part_subtotal);
} elsif ($table eq "full_assembly") {
		@select_fields = qw(full_assembly_assembly_id full_assembly_currency);
		@field_names = qw(
			full_assembly_name
			full_assembly_assembly_quantity
			full_assembly_url
);
		@notes_fields = qw(full_assembly_notes);
		$table_id_field = "full_assembly_id";
		@no_quote_fields = qw();
		@view_only = qw(
			full_assembly_assembly_subtotal
			full_assembly_assembly_rowtotal
			full_assembly_full_assembly_list_id
			);
} elsif ($table eq "full_assembly_list") {
		@select_fields = qw(full_assembly_list_name full_assembly_list_currency);
		@field_names = qw(
			full_assembly_list_category
			full_assembly_list_subcategory
			
);
		@notes_fields = qw(full_assembly_list_notes);
		$table_id_field = "full_assembly_list_id";
		@no_quote_fields = qw();
		@view_only = qw(
			full_assembly_list_total
			);
} elsif ($table eq "labor_category") {
		@select_fields = qw(
			labor_category_service
			labor_category_skill
	);
		@field_names = qw(
			labor_category_category
			labor_category_subcategory
);
		@notes_fields = qw(labor_category_notes);
		$table_id_field = "labor_category_id";
		@no_quote_fields = qw();
} elsif ($table eq "labor_project") {
		@select_fields = qw(
			method_to_charge
			labor_project_is_subcontracted
			labor_project_currency
	);
		@field_names = qw(
			labor_project_name
			labor_project_section
			labor_project_class
			labor_project_subclass
			labor_project_pay_out_rate
			units_charged
			labor_project_received_in
);
		@notes_fields = qw(labor_project_unit_notes labor_project_notes);
		$table_id_field = "labor_project_id";
		@no_quote_fields = qw();
		@view_only = qw(
			labor_project_unit_price
			labor_project_total_paid_out
			labor_project_total
			labor_project_labor_project_list_id
			);
} elsif ($table eq "general_labor") {
		@select_fields = qw(
			labor_category_id
			general_labor_currency
			method_to_charge
			general_labor_is_subcontracted
			
			
	);
		@field_names = qw(
			general_labor_name
			general_labor_rate
);
		@notes_fields = qw(general_labor_notes);
		$table_id_field = "general_labor_id";
		@no_quote_fields = qw();
} elsif ($table eq "labor_project_list") {
		@select_fields = qw(
			labor_project_list_name
			labor_project_list_currency

	);
		@field_names = qw(
			labor_project_list_category
			labor_project_list_subcategory
			
);
		@notes_fields = qw(labor_project_list_notes);
		$table_id_field = "labor_project_list_id";
		@no_quote_fields = qw();
		@view_only = qw(
			labor_project_list_total
			);
} elsif ($table eq "contractors") {
		@select_fields = qw(
			contractor_country
			contractor_currency
);
		@field_names = qw(
			contractor_business_name
			contractor_contact_fname
			contractor_contact_lname
			contractor_phone
			contractor_street_address
			contractor_street_address2
			contractor_city
			contractor_state
			contractor_zip
			contractor_contact_cell_phone
			contractor_email
			contractor_phone2
			contractor_fax
			contractor_website
			contractor_home_phone
);
		@notes_fields = qw(contractor_notes);
		$table_id_field = "contractor_id";
		@no_quote_fields = qw();
	}
if ($sub eq "ViewTable") {
	push (@order, @field_names, @specialty_fields, @select_fields, @no_quote_fields, @view_only, @notes_fields, $table_id_field);
	$statement = join (', ', @order);
	$statement =~ s/,\s*,/,/g;
	$statement =~ s/, $//g;
	for my $key (@order) {
	${$fetch_all_href}{$key} = 1;
	}
	return ($statement, $fetch_all_href);
}

if ($sub eq "RecordUpdatesForm") {
	push (@order, @specialty_fields, @field_names);
	return (\@order, \$table_id_field, \@notes_fields);

}

if ($sub eq "RecordUpdates") {
	push (@order, @field_names, @select_fields, @specialty_fields, @no_quote_fields, @notes_fields);
	return (\@order, \$table_id_field);
}

if ($sub eq "InsertRecordForm") {
	my @order;
	push (@order, @field_names, @no_quote_fields);
	return (\@order, \@notes_fields);

}

if ($sub eq "InsertRecord") {
	my @order;
	push (@order, @field_names, @specialty_fields, @notes_fields, @select_fields);
	return (\@order, \@no_quote_fields, \$table_id_field);
}

}


=pod

=head1 NAME

BWC::BWCFields

=head1 VERSION

This documentation refers to BWC::BWCFields version 1.1.1.

=head1 SYNOPSIS

Breaks up columns from each table into groups, which are returned.

=head1 DESCRIPTION

The modules which call upon Selector need different columns returned,
depending on how these columns will be used.
ViewTable requires all columns to be returned.
RecordUpdatesForm needs only specialty and ordinary fields to be returned.
The RecordUpdatesForm module produces select form fields on its own.
RecordUpdates requires all fields except view only fields which are
produced by stored procedures in the database.
InsertRecordForm require ordinary fields and the "no quote" fields.
Select form fields are produced by InsertRecordForm module itself.
InsertRecord requires all fields except view only fields which are
produced by stored procedures in the database.

@order gives the final order the columns will be used.
@field_names are ordinary columns.
@specialty_fields are columns with certain special treatment.
@select_fields are columns that have values that will be pulled from a
form select field.
@no_quote_fields are columns that are never quoted by $dbh->quote().
@view_only are columns produced by stored procedures and should be seen
but never changed.
@notes_fields are columns whose output will be used in textareas
$table_id_field is the name of the tables ID column.

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
