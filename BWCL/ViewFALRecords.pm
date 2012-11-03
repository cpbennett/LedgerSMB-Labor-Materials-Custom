package BWCL::ViewFALRecords;

our $VERSION = 1.2.00;
use warnings;
use strict;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK =
  qw(ViewFALRecords ViewFullFALRecords DuplicateFullFALRecordsForm DuplicateFullFALRecords);

use BWCL::InsertRecord_B qw(InsertRecordGroup);

#######################################################################
##		Sub ViewFALRecords

sub ViewFALRecords {

	# version 1.2
	my $r   = shift;
	my $dbh = shift;
	my $q   = shift;
	my $full_assembly_list_selected;
	my $full_assembly_list_selected2;
	my $assembly_selected;
	my $assembly_name;
	my $assembly_name_aref;
	my $assem_part_hash_ref;
	my $statement;
	my $sth;
	my @all_assemblies = ();
	my @vetor          = ();
	$full_assembly_list_selected = $q->param("full_assembly_list_selected");
	$full_assembly_list_selected =~ s/''/"/g
	  ; # This substitution reverses substitution done in form which allows javascript to function
	$assembly_selected = $q->param("assembly_selected");
	$assembly_selected =~ s/''/"/g
	  ; # This substitution reverses substitution done in form which allows javascript to function
	$full_assembly_list_selected2 = $dbh->quote($full_assembly_list_selected);

	if ( $assembly_selected eq 'All' ) {
		my $sth = $dbh->prepare(
            "SELECT
                    assembly_id
               FROM assemblies
              WHERE assembly_id
                 IN (
                        SELECT full_assembly_assembly_id
                          FROM full_assembly
                         WHERE full_assembly_name=$full_assembly_list_selected2
                    )
           ORDER BY assembly_name;"
		);
		$sth->execute;
		while ( @vetor = $sth->fetchrow ) {
			push( @all_assemblies, @vetor );
		}
		$sth->finish();

	}
	else {
		push( @all_assemblies, $assembly_selected );
	}
	######################################################################
	##		View Records
	$r->print(
		qq{
	<div><h2 class="titlehead">$full_assembly_list_selected</h2>
	<br /><br />
	}
	);

	for my $assembly_selected (@all_assemblies) {
		$statement =
            "SELECT
                    assembly_name
               FROM assemblies
              WHERE assembly_id = $assembly_selected
           ORDER BY assembly_name;";
		$assembly_name_aref = $dbh->selectcol_arrayref($statement)
		  || die $dbh->errstr;

		$assembly_name = $$assembly_name_aref[0];

		my @hash_assemblys = (
			'assembly_part_assembly_id', 'assembly_part_description',
			'assembly_part_name',        'assembly_part_class',
			'assembly_part_subclass',    'assembly_part_product_id',
			'assembly_part_quantity'
		);
		$sth = $dbh->prepare(
                "SELECT
                        assembly_part_assembly_id,
                        assembly_part_description,
                        assembly_part_name,
                        assembly_part_class,
                        assembly_part_subclass,
                        assembly_part_product_id,
                        assembly_part_quantity
                   FROM assemblies_parts
                  WHERE assembly_part_assembly_id = $assembly_selected;"
		);
		$sth->execute();
		$r->print(
			qq{
	<table summary="" border="2" rules="all">
	<caption class="black"><strong class="black">$assembly_name</strong></caption>
	<thead>
	    <tr>
	    <th align="left">Assembly ID</th>
	    <th align="left">Description</th>
	    <th align="left">Name</th>
	    <th align="left">Class</th>
	    <th align="left">Subclass</th>
	    <th align="left">Product ID</th>
	    <th align="left">Quantity</th>
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
			$r->print(
qq{<td align="left">$assem_part_hash_ref->{assembly_part_assembly_id}</td>}
			);
			$r->print(
qq{<td align="left">$assem_part_hash_ref->{assembly_part_description}</td>}
			);
			$r->print(
qq{<td align="left">$assem_part_hash_ref->{assembly_part_name}</td>}
			);
			$r->print(
qq{<td align="left">$assem_part_hash_ref->{assembly_part_class}</td>}
			);
			$r->print(
qq{<td align="left">$assem_part_hash_ref->{assembly_part_subclass}</td>}
			);
			$r->print(
qq{<td align="left">$assem_part_hash_ref->{assembly_part_product_id}</td>}
			);
			$r->print(
qq{<td align="left">$assem_part_hash_ref->{assembly_part_quantity}</td>}
			);
			$r->print(qq{</tr>});
		}
		$r->print(
			qq{</tbody></table>
		<br /><br />
		}
		);
		$sth->finish;
	}

	return 1;
}

#######################################################################
##		Sub ViewFullFALRecords

sub ViewFullFALRecords {

	# version 1.2
	my $r   = shift;
	my $dbh = shift;
	my $q   = shift;
	my $full_assembly_list;
	my $full_assembly_list2;
	my @assem_hash_assemblys;
	my $assembly;
	my $assembly2;
	my $assembly_name;
	my $assembly_name_aref;
	my $assem_hash_ref;
	my $assem_part_hash_ref;
	my $full_assembly_hash_ref;
	my $full_assembly_list_hash_ref;
	my @full_assembly_list_hash_assemblys;
	my @full_assembly_hash_assemblys;
	my @hash_assemblys;
	my $statement;
	my $sth;
	my @all_assemblies = ();
	my @vetor          = ();
	$full_assembly_list = $q->param("full_assembly_list_selected");
	$full_assembly_list =~ s/''/"/g
	  ; # This substitution reverses substitution done in form which allows javascript to function
	$assembly = $q->param("assembly_selected");
	$assembly =~ s/''/"/g
	  ; # This substitution reverses substitution done in form which allows javascript to function
	$full_assembly_list2 = $dbh->quote($full_assembly_list);

	if ( $assembly eq 'All' ) {
		$sth = $dbh->prepare(
            "SELECT
                    assembly_id
               FROM assemblies
              WHERE assembly_id
                 IN
                    (
                        SELECT full_assembly_assembly_id
                          FROM full_assembly
                         WHERE full_assembly_name=$full_assembly_list2
                    )
           ORDER BY assembly_name;"
		);
		$sth->execute;
		while ( @vetor = $sth->fetchrow ) {
			push( @all_assemblies, @vetor );
		}
		$sth->finish();
	}
	else {
		push( @all_assemblies, $assembly );
	}
	######################################################################
	##		View Records

	$r->print(
		qq{
	<div><h2 class="FALh2">$full_assembly_list</h2>
	<br /><br />
	}
	);

	for my $assembly (@all_assemblies) {
		$statement =
"SELECT assembly_name FROM assemblies WHERE assembly_id = $assembly ORDER BY assembly_name;";
		$assembly_name_aref = $dbh->selectcol_arrayref($statement)
		  || die $dbh->errstr;

		$assembly_name = $$assembly_name_aref[0];

		@assem_hash_assemblys = (
			'assembly_id',          'assembly_name',
			'assembly_description', 'assembly_category',
			'assembly_subtotal',    'assembly_currency',
			'assembly_url',         'assembly_notes'
		);
		$sth = $dbh->prepare(
                "SELECT
						assembly_id,
						assembly_name,
						assembly_description,
						assembly_category,
						assembly_subtotal,
						assembly_currency,
						assembly_url,
						assembly_notes
                   FROM assemblies
                  WHERE assembly_id = $assembly;"
		);
		$sth->execute();

		$r->print(
qq{<table summary="" border="2" rules="all" class="assemblies_block">
			<caption class="FALcaption"><strong class="">$assembly_name</strong></caption>
			<tbody><tr>
			<td class="assemblies_block">
			}
		);
		$r->print(
			qq{
		<table summary="" border="2" rules="all">
		<caption class="FALcaption"><strong class="">Assembly</strong></caption>
		<thead>
		    <tr>
		    <th align="left">Assembly ID</th>
		    <th align="left">Assembly Name</th>
		    <th align="left">Assembly Description</th>
		    <th align="left">Assembly Category</th>
		    <th align="left">Assembly Subtotal</th>
		    <th align="left">Assembly Currency</th>
		    <th align="left">Assembly URL</th>
		    <th align="left">Assembly Notes</th>
		    </tr>
		</thead>
		<tbody>}
		);
		while ( $assem_hash_ref = $sth->fetchrow_hashref ) {
			$r->print(qq{<tr>});
			foreach my $assemblyh (@assem_hash_assemblys) {
				if ( $$assem_hash_ref{$assemblyh} ) {
					$$assem_hash_ref{$assemblyh} = $$assem_hash_ref{$assemblyh};
					$$assem_hash_ref{$assemblyh} =~ s/\n/<br \/>/g
					  ; # This substitution allows newlines to be converted to HTML code
				}
				else {
					$$assem_hash_ref{$assemblyh} = '';
				}
			}
			$r->print(
qq{<td align="left" class="assemblies_b">$assem_hash_ref->{assembly_id}</td>}
			);
			$r->print(
qq{<td align="left" class="assemblies_b">$assem_hash_ref->{assembly_name}</td>}
			);
			$r->print(
qq{<td align="left" class="assemblies_b">$assem_hash_ref->{assembly_description}</td>}
			);
			$r->print(
qq{<td align="left" class="assemblies_b">$assem_hash_ref->{assembly_category}</td>}
			);
			$r->print(
qq{<td align="left" class="assemblies_b">$assem_hash_ref->{assembly_subtotal}</td>}
			);
			$r->print(
qq{<td align="left" class="assemblies_b">$assem_hash_ref->{assembly_currency}</td>}
			);
			$r->print(
qq{<td align="left" class="assemblies_b">$assem_hash_ref->{assembly_url}</td>}
			);
			$r->print(
qq{<td align="left" class="assemblies_b">$assem_hash_ref->{assembly_notes}</td>}
			);
			$r->print(qq{</tr>});
		}
		$r->print(
			qq{</tbody></table>
				<br /><br />
		}
		);
		$sth->finish;

		@hash_assemblys = (
			'assembly_part_assembly_id', 'assembly_part_description',
			'assembly_part_name',        'assembly_part_class',
			'assembly_part_subclass',    'assembly_part_product_id',
			'assembly_part_quantity',    'assembly_part_subtotal',
			'assembly_part_currency'
		);

		$sth = $dbh->prepare(
                "SELECT
						assembly_part_assembly_id,
						assembly_part_description,
						assembly_part_name,
						assembly_part_class,
						assembly_part_subclass,
						assembly_part_product_id,
						assembly_part_quantity,
						assembly_part_subtotal,
						assembly_part_currency
                   FROM assemblies_parts
                  WHERE assembly_part_assembly_id = $assembly;"
		);
		$sth->execute();
		$r->print(
			qq{
		<table summary="" border="2" rules="all">
		<caption class="FALcaption"><strong class="">Assembly Parts</strong></caption>
		<thead>
		    <tr>
		    <th align="left">Assembly ID</th>
		    <th align="left">Description</th>
		    <th align="left">Name</th>
		    <th align="left">Class</th>
		    <th align="left">Subclass</th>
		    <th align="left">Product ID</th>
		    <th align="left">Quantity</th>
		    <th align="left">Subtotal</th>
		    <th align="left">Assembly Part Currency</th>
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
			$r->print(
qq{<td align="left" class="assemblies_bl">$assem_part_hash_ref->{assembly_part_assembly_id}</td>}
			);
			$r->print(
qq{<td align="left" class="assemblies_bl">$assem_part_hash_ref->{assembly_part_description}</td>}
			);
			$r->print(
qq{<td align="left" class="assemblies_bl">$assem_part_hash_ref->{assembly_part_name}</td>}
			);
			$r->print(
qq{<td align="left" class="assemblies_bl">$assem_part_hash_ref->{assembly_part_class}</td>}
			);
			$r->print(
qq{<td align="left" class="assemblies_bl">$assem_part_hash_ref->{assembly_part_subclass}</td>}
			);
			$r->print(
qq{<td align="left" class="assemblies_bl">$assem_part_hash_ref->{assembly_part_product_id}</td>}
			);
			$r->print(
qq{<td align="left" class="assemblies_bl">$assem_part_hash_ref->{assembly_part_quantity}</td>}
			);
			$r->print(
qq{<td align="left" class="assemblies_bl">$assem_part_hash_ref->{assembly_part_subtotal}</td>}
			);
			$r->print(
qq{<td align="left" class="assemblies_bl">$assem_part_hash_ref->{assembly_part_currency}</td>}
			);
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
		<br />
}
		);
		$sth->finish;
	}

	@full_assembly_hash_assemblys = (
		'full_assembly_id',
		'full_assembly_name',
		'full_assembly_assembly_quantity',
		'full_assembly_assembly_subtotal',
		'full_assembly_assembly_rowtotal',
		'full_assembly_currency',
		'full_assembly_assembly_id',
		'full_assembly_full_assembly_list_id',
		'full_assembly_url',
		'full_assembly_notes'
	);
	$sth = $dbh->prepare(
            "SELECT
                    full_assembly_id,
					full_assembly_name,
					full_assembly_assembly_quantity,
					full_assembly_assembly_subtotal,
					full_assembly_assembly_rowtotal,
					full_assembly_currency,
					full_assembly_assembly_id,
					full_assembly_full_assembly_list_id,
					full_assembly_url,
					full_assembly_notes
               FROM full_assembly
              WHERE full_assembly_name=$full_assembly_list2;"
	);
	$sth->execute();
	$r->print(
		qq{			<hr />
	<br />
	<table summary="" border="2" rules="all" class="full_assembly">
	<caption class="FALcaption"><strong class="">Assemblies within Full Assembly</strong></caption>
	<thead>
	    <tr>
	    <th align="left">Full Assembly ID</th>
	    <th align="left">Full Assembly Name</th>
	    <th align="left">Full Assembly Assembly Quantity</th>
	    <th align="left">Full Assembly Assembly Subtotal</th>
	    <th align="left">Full Assembly Assembly Rowtotal</th>
	    <th align="left">Full Assembly Currency</th>
	    <th align="left">Full Assembly Assembly ID</th>
	    <th align="left">Full Assembly Full Assembly List ID</th>
	    <th align="left">Full Assembly URl</th>
	    <th align="left">Full Assembly Notes</th>
	    </tr>
	</thead>
	<tbody>}
	);
	while ( $full_assembly_hash_ref = $sth->fetchrow_hashref ) {
		$r->print(qq{<tr>});
		foreach my $assemblyh (@full_assembly_hash_assemblys) {
			if ( $$full_assembly_hash_ref{$assemblyh} ) {
				$$full_assembly_hash_ref{$assemblyh} =
				  $$full_assembly_hash_ref{$assemblyh};
				$$full_assembly_hash_ref{$assemblyh} =~ s/\n/<br \/>/g
				  ; # This substitution allows newlines to be converted to HTML code
			}
			else {
				$$full_assembly_hash_ref{$assemblyh} = '';
			}
		}
		$r->print(
qq{<td align="left" class="full_assembly">$full_assembly_hash_ref->{full_assembly_id}</td>}
		);
		$r->print(
qq{<td align="left" class="full_assembly">$full_assembly_hash_ref->{full_assembly_name}</td>}
		);
		$r->print(
qq{<td align="left" class="full_assembly">$full_assembly_hash_ref->{full_assembly_assembly_quantity}</td>}
		);
		$r->print(
qq{<td align="left" class="full_assembly">$full_assembly_hash_ref->{full_assembly_assembly_subtotal}</td>}
		);
		$r->print(
qq{<td align="left" class="full_assembly">$full_assembly_hash_ref->{full_assembly_assembly_rowtotal}</td>}
		);
		$r->print(
qq{<td align="left" class="full_assembly">$full_assembly_hash_ref->{full_assembly_currency}</td>}
		);
		$r->print(
qq{<td align="left" class="full_assembly">$full_assembly_hash_ref->{full_assembly_assembly_id}</td>}
		);
		$r->print(
qq{<td align="left" class="full_assembly">$full_assembly_hash_ref->{full_assembly_full_assembly_list_id}</td>}
		);
		$r->print(
qq{<td align="left" class="full_assembly">$full_assembly_hash_ref->{full_assembly_url}</td>}
		);
		$r->print(
qq{<td align="left" class="full_assembly">$full_assembly_hash_ref->{full_assembly_notes}</td>}
		);
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

	@full_assembly_list_hash_assemblys = (
		'full_assembly_list_id',       'full_assembly_list_name',
		'full_assembly_list_category', 'full_assembly_list_subcategory',
		'full_assembly_list_total',    'full_assembly_list_currency',
		'full_assembly_list_notes'
	);
	$sth = $dbh->prepare(
            "SELECT
                    full_assembly_list_id,
					full_assembly_list_name,
					full_assembly_list_category,
					full_assembly_list_subcategory,
					full_assembly_list_total,
					full_assembly_list_currency,
					full_assembly_list_notes
               FROM full_assembly_list
              WHERE full_assembly_list_name = $full_assembly_list2;"
	);
	$sth->execute();
	$r->print(
		qq{
	<table summary="" border="2" rules="all" class="full_assembly_list">
	<caption class="FALcaption"><strong class="">Description of Final Complete Full Assembly</strong></caption>
	<thead>
	    <tr>
	    <th align="left">Full Assembly List ID</th>
	    <th align="left">Full Assembly List Name</th>
	    <th align="left">Full Assembly List Category</th>
	    <th align="left">Full Assembly List Subcategory</th>
	    <th align="left">Full Assembly List Total</th>
	    <th align="left">Full Assembly List Currency</th>
	    <th align="left">Full Assembly List Notes</th>
	    </tr>
	</thead>
	<tbody>}
	);

	while ( $full_assembly_list_hash_ref = $sth->fetchrow_hashref ) {
		$r->print(qq{<tr>});
		foreach my $assemblyh (@full_assembly_list_hash_assemblys) {
			if ( $$full_assembly_list_hash_ref{$assemblyh} ) {
				$$full_assembly_list_hash_ref{$assemblyh} =
				  $$full_assembly_list_hash_ref{$assemblyh};
				$$full_assembly_list_hash_ref{$assemblyh} =~ s/\n/<br \/>/g
				  ; # This substitution allows newlines to be converted to HTML code
			}
			else {
				$$full_assembly_list_hash_ref{$assemblyh} = '';
			}
		}
		$r->print(
qq{<td align="left" class="full_assembly_list">$full_assembly_list_hash_ref->{full_assembly_list_id}</td>}
		);
		$r->print(
qq{<td align="left" class="full_assembly_list">$full_assembly_list_hash_ref->{full_assembly_list_name}</td>}
		);
		$r->print(
qq{<td align="left" class="full_assembly_list">$full_assembly_list_hash_ref->{full_assembly_list_category}</td>}
		);
		$r->print(
qq{<td align="left" class="full_assembly_list">$full_assembly_list_hash_ref->{full_assembly_list_subcategory}</td>}
		);
		$r->print(
qq{<td align="left" class="full_assembly_list">$full_assembly_list_hash_ref->{full_assembly_list_total}</td>}
		);
		$r->print(
qq{<td align="left" class="full_assembly_list">$full_assembly_list_hash_ref->{full_assembly_list_currency}</td>}
		);
		$r->print(
qq{<td align="left" class="full_assembly_list">$full_assembly_list_hash_ref->{full_assembly_list_notes}</td>}
		);
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

#######################################################################
##		Sub DuplicateFullFALRecordsForm

#######################################################################
#
#	Use javascript to add assemblies:
#		This can be done similar to options changing I already use.
#		Just make the complete forms appear
#		Keep some assemblies AS IS for reuse in full_assemblies, but selected
#		to NOT insert again
#
#		Adding doesn't matter, since insert sub will be inserting one at a time
#		Form numbering does not matter, since insert sub will translate
#
#######################################################################
#	Record assemblies, assemblies_parts, full_assembly(s), full_assembly_list
#	in forms
#	Call up a form to select which assemblies and assemblies_parts to keep, how many extra
#		Form needs to be able to add new form slots?

#	All javascript seems to be working properly now.
#	assembly_name is shown and javascript updates changes for assemblies, assemblies_parts and full_assembly
#	product_description is shown in assemblies_parts as visual aid but is not inserted

sub DuplicateFullFALRecordsForm {

	# version = 2.3
	my $r       = shift;
	my $dbh     = shift;
	my $q       = shift;
	my $program = shift;
	my $full_assembly_list_selected;
	my $full_assembly_list_selected2;
	my $assembly_selected;
	my $currency_selected;
	my $currency_selected2;
	my $statement;
	my $sth;
	my $assembly_name_aref;
	my $assembly_name;
	#######################################################################
  #	The following exist to deal with both javascript refusing to accept pleasant
  #	symbols such as - ^ Etc. within id's etc.
  #	But perl runs variables into underscores.
  #	This deals with both idiocies
	my $dund   = "_assemblies_parts_count_";
	my $aund   = "__assemblies_count_";
	my $fund   = "_full_assembly_count_";
	my $flund  = "_full_assembly_list_count_";
	my $fund2  = "_full_assembly_count_";
	my $flund2 = "_full_assembly_list_count_";
	my $empty;
	my @all_assemblies         = ();
	my @vetor                  = ();
	my $assemblies_parts_count = 1;    # assemblies_parts_count
	my $a_c                    = 1;    # assemblies_count
	my $f_a_c                  = 1;    # full_assembly_count
	my $f_a_l_c                = 1;    # full_assembly_list_count
	$full_assembly_list_selected = $q->param("full_assembly_list_selected");
	$full_assembly_list_selected =~ s/''/"/g
	  ; # This substitution reverses substitution done in form which allows javascript to function
	$assembly_selected = $q->param("assembly_selected");
	$assembly_selected =~ s/''/"/g
	  ; # This substitution reverses substitution done in form which allows javascript to function
	$full_assembly_list_selected2 = $dbh->quote($full_assembly_list_selected);
	$full_assembly_list_selected =
	  HTML::Entities::encode($full_assembly_list_selected);
	$currency_selected  = $q->param("currency_selected");
	$currency_selected2 = $dbh->quote($currency_selected);
	my $assem_hash_ref;
	my @assem_hash_assemblys = (
		'assembly_name',     'assembly_description',
		'assembly_category', 'assembly_url',
		'assembly_currency', 'assembly_notes'
	);

	my $assem_part_hash_ref;
	my @assem_part_hash_assemblys = (
		'assembly_part_name',       'assembly_part_class',
		'assembly_part_subclass',   'assembly_part_description',
		'assembly_part_product_id', 'assembly_part_quantity',
		'assembly_part_currency',        'assembly_part_notes'
	);
	my $full_assembly_hash_ref;
	my @full_assembly_hash_assemblys = (
		'full_assembly_name', 'full_assembly_assembly_quantity',
		'full_assembly_url',  'full_assembly_currency',
		'full_assembly_notes'
	);
	my $full_assembly_list_hash_ref;
	my @full_assembly_list_hash_assemblys = (
		'full_assembly_list_name',        'full_assembly_list_category',
		'full_assembly_list_subcategory', 'full_assembly_list_currency',
		'full_assembly_list_notes'
	);

	if ( $assembly_selected eq 'All' ) {
		my $sth = $dbh->prepare(
                    "SELECT
                            assembly_id
                       FROM assemblies
                      WHERE assembly_id
                         IN
                            (
                                SELECT full_assembly_assembly_id
                                  FROM full_assembly
                                 WHERE full_assembly_name=$full_assembly_list_selected2
                            )
                   ORDER BY assembly_name;"
		);
		$sth->execute;
		while ( @vetor = $sth->fetchrow ) {
			push( @all_assemblies, @vetor );
		}
		$sth->finish();

	}
	else {
		push( @all_assemblies, $assembly_selected );
	}

####################################################################################
##		Fill Inputs Of Assemblies and Assemblies Parts With Existing Records
####################################################################################

	#######################################################################
	#	Normal Assembly Section
	#	Fills With Existing Assembly for Each Existing Assembly
	#	In Order of Assemblies Fetched
	#	All Assemblies Parts for Each Assembly Added in Loop
	#######################################################################

	$r->print(
		qq{
	<div><h1 class="titlehead">$full_assembly_list_selected</h1>
	<br /><br />
	<form name="duplicates" class="duplicates" id="duplicates" action="$program" method="post">
	<div>
	}
	);

	for my $assembly_selected (@all_assemblies) {
		$statement =
"SELECT assembly_name FROM assemblies WHERE assembly_id = $assembly_selected ORDER BY assembly_name;";
		$assembly_name_aref = $dbh->selectcol_arrayref($statement)
		  || die $dbh->errstr;

		$assembly_name = $$assembly_name_aref[0];
		$assembly_name = HTML::Entities::encode($assembly_name);
		$assembly_name =~ s/"/''/g;
		$sth = $dbh->prepare(
                "SELECT
                        assembly_name,
		    			assembly_description,
			    		assembly_category,
				    	assembly_url,
					    assembly_currency,
				    	assembly_notes
                   FROM assemblies
                  WHERE assembly_id = $assembly_selected;"
		);
		$sth->execute();

		$r->print(
			qq{
			<div class="a_c_$a_c" name="a_c_$a_c" id="a_c_$a_c">
		<p>assemblies_count_$a_c</p>
		<table summary="" border="1" rules="all" class="assemblies">
		<caption class="FALcaption">Assembly:<br />
	<input class="fals" type="text" name="as$aund$a_c" id="as$aund$a_c" style="width:100%;font-weight:bold;text-align:center;font-size:1.0em;" value="$assembly_name" readonly="readonly" /></caption>
		<tbody>}
		);

		while ( $assem_hash_ref = $sth->fetchrow_hashref ) {
			foreach my $assemblyh (@assem_hash_assemblys) {
				if ( $$assem_hash_ref{$assemblyh} ) {
					$$assem_hash_ref{$assemblyh} =
					  HTML::Entities::encode( $$assem_hash_ref{$assemblyh} );
					$$assem_hash_ref{$assemblyh} =~ s/"/''/g;
				}
				else {
					$$assem_hash_ref{$assemblyh} = '';
				}
			}
			$r->print(
				qq{<tr>
<td align="left">Do Not Insert This Assembly</td><td align="left" class="assemblies">&nbsp;&nbsp;
<input class="assemblies" type="checkbox" name="assembly_DoNotInsert$aund$a_c" id="assembly_DoNotInsert$aund$a_c" value="assembly_DoNotInsert$aund$a_c" />
</td>
</tr>}
			);
			for my $fieldRR (@assem_hash_assemblys) {
				 
				 if ( $fieldRR =~ /assembly_name/ ) {
					$r->print(
						qq{<tr>
<td align="left">$fieldRR</td><td align="left" class="assemblies">
<input class="assemblies" type="text" name="$fieldRR$aund$a_c" id="$fieldRR$aund$a_c" value="$assem_hash_ref->{$fieldRR}" onchange="AssemCopyDo$aund$a_c();" />
</td>
</tr>}
					);
				}
				elsif ( $fieldRR =~ /notes/ ) {
					$r->print(
						qq{<tr>
<td align="left">$fieldRR</td><td align="left" class="assemblies">
<textarea cols="99" rows="6" class="assemblies" type="text" name="$fieldRR$aund$a_c" id="$fieldRR$aund$a_c">$assem_hash_ref->{$fieldRR}</textarea>
</td>
</tr>}
					);

				}
				else {
					$r->print(
						qq{<tr>
<td align="left">$fieldRR</td><td align="left" class="assemblies">
<input class="assemblies" type="text" name="$fieldRR$aund$a_c" id="$fieldRR$aund$a_c" value="$assem_hash_ref->{$fieldRR}" />
</td>
</tr>}
					);
				}
			}

		}
		$r->print(
			qq{</tbody></table>
			<br />
			<br />
			</div>
}
		);
		$sth->finish;

#######################################################################
		#	Normal Assembly Parts Section
		#	Fills With Existing Assembly Parts for Each Existing Assembly
		#	In Order of Assemblies Fetched
#######################################################################

		$sth = $dbh->prepare(
                "SELECT
                        assembly_part_assembly_id,
                        assembly_part_name,
                        assembly_part_class,
                        assembly_part_subclass,
                        assembly_part_description,
                        assembly_part_product_id,
                        assembly_part_quantity,
                        assembly_part_currency,
                        assembly_part_notes
                   FROM assemblies_parts
                  WHERE assembly_part_assembly_id = $assembly_selected;"
		);
		$sth->execute();
		while ( $assem_part_hash_ref = $sth->fetchrow_hashref ) {
			$r->print(
qq{<div class="a_p_$assemblies_parts_count" id="assemblies_parts_count_$assemblies_parts_count">
				<p>assemblies_count_$a_c xx assemblies_parts_count_$assemblies_parts_count</p>
		<table summary="" border="1" rules="all" class="assemblies_parts">
		<caption class="FALcaption">Assembly Parts for:<br />
	<input class="fals" type="text" name="als$aund$a_c$dund$assemblies_parts_count" id="als$aund$a_c$dund$assemblies_parts_count" style="width:100%;font-weight:bold;text-align:center;font-size:1.0em;" value="$assembly_name" readonly="readonly" /></caption>
		<tbody>}
			);
			foreach my $assemblyh (@assem_part_hash_assemblys) {
				if ( $$assem_part_hash_ref{$assemblyh} ) {
					$$assem_part_hash_ref{$assemblyh} = HTML::Entities::encode(
						$$assem_part_hash_ref{$assemblyh} );
					$$assem_part_hash_ref{$assemblyh} =~ s/"/''/g;
				}
				else {
					$$assem_part_hash_ref{$assemblyh} = '';
				}
			}
			$r->print(
				qq{<tr>
<td align="left" class="assemblies_parts_auto">Do Not Insert This Assemblies Part</td><td align="left" class="assemblies_parts">&nbsp;&nbsp;
<input class="assemblies_parts" type="checkbox" name="assembly_part_DoNotInsert$aund$a_c$dund$assemblies_parts_count" id="assembly_part_DoNotInsert$aund$a_c$dund$assemblies_parts_count" value="assembly_part_DoNotInsert$aund$a_c$dund$assemblies_parts_count" />
</td>
</tr>}
			);

			for my $fieldRR (@assem_part_hash_assemblys) {
				unless ( $fieldRR =~ /notes/ || $fieldRR =~ /description/ ) {
					$r->print(
						qq{<tr>
<td align="left" class="assemblies_parts_auto">$fieldRR</td><td align="left" class="assemblies_parts">
<input class="assemblies_parts" type="text" name="$fieldRR$aund$a_c$dund$assemblies_parts_count" id="$fieldRR$aund$a_c$dund$assemblies_parts_count" value="$assem_part_hash_ref->{$fieldRR}" />
</td>
</tr>}
					);
				}
				elsif ( $fieldRR =~ /description/ ) {
					$r->print(
						qq{<tr>
<td align="left" class="assemblies_parts_auto">$fieldRR</td><td align="left" class="assemblies_parts">
<input class="assemblies_parts" type="text" readonly="readonly" name="" id="" value="$assem_part_hash_ref->{$fieldRR}" />
</td>
</tr>}
					);
				}
				else {
					$r->print(
						qq{<tr>
<td align="left" class="assemblies_parts_auto">$fieldRR</td><td align="left" class="assemblies_parts">
<textarea cols="99" rows="6" class="assemblies_parts" type="text" name="$fieldRR$aund$a_c$dund$assemblies_parts_count" id="$fieldRR$aund$a_c$dund$assemblies_parts_count">$assem_part_hash_ref->{$fieldRR}</textarea>
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
			$assemblies_parts_count++;
		}

# This javascript duplicates assembly_name into assembly_parts_assembly_name forms for that new assembly
		$r->print(
			qq|<script type="text/javascript">
		//<![CDATA[
		function AssemCopyDo$aund$a_c (evnt) {
		document.duplicates.as__assemblies_count_|
			  . qq|$a_c|
			  . qq|.value=document.duplicates.assembly_name__assemblies_count_|
			  . qq|$a_c.value;
		document.duplicates.assembly_name_full_assembly_count_|
			  . qq|$a_c.value=document.duplicates.assembly_name__assemblies_count_|
			  . qq|$a_c.value;
		|
		);
		for ( my $i = 1 ; $i < $assemblies_parts_count ; $i++ ) {
			$r->print(
				qq|
			document.duplicates.als__assemblies_count_| 
				  . qq|$a_c|
				  . qq|_assemblies_parts_count_|
				  . qq|$i.value=document.duplicates.assembly_name__assemblies_count_|
				  . qq|$a_c.value;
			|
			);
		}
		$r->print(
			qq|	}
	//]]>
	</script>
	|
		);

		$a_c++;
		$assemblies_parts_count = 1;
		$sth->finish;
	}

#######################################################################
	#	END of Normal Assemblies and Assemblies Parts Section
#######################################################################

#######################################################################
	#	Assembly Empty Section
#######################################################################

	$empty = $a_c;

	$r->print(
		qq{
<p><label for="assembly_DoNotInsert$aund$empty">Do Not Insert This Assembly</label>&nbsp;&nbsp;
<input class="assemblies" type="checkbox" checked="checked" name="assembly_DoNotInsert$aund$empty" id="assembly_DoNotInsert$aund$empty" value="assembly_DoNotInsert$aund$empty" />&nbsp;&nbsp;a_c_$empty
</p>
<div style="display:none" name="assembly_hidden$empty" id="assembly_hidden$empty">
<table summary="" border="1" rules="all" class="assemblies">
<caption class="FALcaption">Assembly:<br />
<input class="fals" type="text" name="as$aund$empty" id="as$aund$empty" style="width:100%;font-weight:bold;text-align:center;font-size:1.0em;" value="" /></caption>
<tbody>}
	);

	for my $fieldRR (@assem_hash_assemblys) {
		unless ( $fieldRR =~ /notes/ ) {
			$r->print(
				qq{<tr>
<td align="left">$fieldRR</td><td align="left" class="assemblies">
<input class="assemblies" type="text" name="$fieldRR$aund$empty" id="$fieldRR$aund$empty" value="" />
</td>
</tr>}
			);
		}
		else {
			$r->print(
				qq{<tr>
<td align="left">$fieldRR</td><td align="left" class="assemblies">
<textarea cols="99" rows="6" class="assemblies" type="text" name="$fieldRR$aund$empty" id="$fieldRR$aund$empty"></textarea>
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

	$r->print(
		qq~
	<script type="text/javascript">
//<![CDATA[
if (window.addEventListener) {
	window.addEventListener("load",setupCheckAll,false);
} else if (window.attachEvent) {
	window.attachEvent("onload",setupCheckAll);
} else {
	window.onload=setupCheckAll;
}

function setupCheckAll(evnt) {
	document.getElementById("assembly_DoNotInsert$aund$empty").onchange = ChecksEmpty;
}




function ChecksEmpty (evnt) {
	if (document.duplicates.assembly_DoNotInsert$aund$empty.checked) {
		document.getElementById("assembly_hidden$empty").style.display = ('none');
	} else {
		document.getElementById("assembly_hidden$empty").style.display = ('inline');
	}

}

//]]>
</script>~
	);

#######################################################################
	#	END Of Assembly Empty Section
#######################################################################

#######################################################################
	#	Assemblies Parts Empty Section
#######################################################################

	#	$empty Stays the Same, to Add to Above Empty Assembly
	for ( my $ass_part_empty = 1 ; $ass_part_empty <= 10 ; $ass_part_empty++ ) {

		$r->print(
qq{<div class="a_p_$aund$a_c$dund$ass_part_empty" id="ass_part_empty_$aund$a_c$dund$ass_part_empty">
<p><label for="assembly_part_DoNotInsert$aund$a_c$dund$ass_part_empty">Do Not Insert This Assemblies Part</label>&nbsp;&nbsp;
<input class="assemblies" type="checkbox" checked="checked" name="assembly_part_DoNotInsert$aund$a_c$dund$ass_part_empty" id="assembly_part_DoNotInsert$aund$a_c$dund$ass_part_empty" value="assembly_part_DoNotInsert$aund$a_c$dund$ass_part_empty" />&nbsp;&nbsp;assemblies_empty_$a_c xx assemblies_parts_empty_$ass_part_empty

</p>
<div style="display:none" name="ass_part_hidden$aund$a_c$dund$ass_part_empty" id="ass_part_hidden$aund$a_c$dund$ass_part_empty">
<table summary="" border="1" rules="all" class="assemblies_parts">
<caption class="FALcaption">Assembly Parts for:<br />
<input class="fals" type="text" name="als$aund$a_c$dund$ass_part_empty" id="als$aund$a_c$dund$ass_part_empty" style="width:100%;font-weight:bold;text-align:center;font-size:1.0em;" value="" readonly="readonly" /></caption>
<tbody>
}
		);

		for my $fieldRR (@assem_part_hash_assemblys) {
			unless ( $fieldRR =~ /notes/ || $fieldRR =~ /description/ ) {
				$r->print(
					qq{<tr>
<td align="left" class="assemblies_parts_auto">$fieldRR</td><td align="left" class="assemblies_parts">
<input class="assemblies_parts" type="text" name="$fieldRR$aund$a_c$dund$ass_part_empty" id="$fieldRR$aund$a_c$dund$ass_part_empty" value="" />
</td>
</tr>}
				);
			}
			elsif ( $fieldRR =~ /description/ ) {
				$r->print(
					qq{<tr>
<td align="left" class="assemblies_parts_auto">$fieldRR</td><td align="left" class="assemblies_parts">
<input class="assemblies_parts" type="text" readonly="readonly" name="$fieldRR$aund$a_c$dund$ass_part_empty" id="$fieldRR$aund$a_c$dund$ass_part_empty" value="" />
</td>
</tr>}
				);
			}
			else {
				$r->print(
					qq{<tr>
<td align="left" class="assemblies_parts_auto">$fieldRR</td><td align="left" class="assemblies_parts">
<textarea cols="99" rows="6" class="assemblies_parts" type="text" name="$fieldRR$aund$a_c$dund$ass_part_empty" id="$fieldRR$aund$a_c$dund$ass_part_empty"></textarea>
</td>
</tr>}
				);

			}
		}

		$r->print(
			qq{
</tbody></table>
<br />
<br />
</div>
}
		);

	}

	#######################################################################
	#	Script To Reveal Hidden Assemblies Parts Tables

	$r->print(
		qq~
	<script type="text/javascript">
//<![CDATA[
if (window.addEventListener) {
	window.addEventListener("load",setupAPCheckAll,false);
} else if (window.attachEvent) {
	window.attachEvent("onload",setupAPCheckAll);
} else {
	window.onload=setupAPCheckAll;
}

function setupAPCheckAll(evnt) {
~
	);
	for ( my $empty1 = 1 ; $empty1 <= 10 ; $empty1++ ) {
		$r->print(
			qq~
	document.getElementById("assembly_part_DoNotInsert$aund$a_c$dund$empty1").onchange = assembly_part_Checks;
	~
		);
	}
	$r->print(
		qq~
	}

function assembly_part_Checks (evnt) {
~
	);
	for ( my $empty1 = 1 ; $empty1 <= 10 ; $empty1++ ) {
		$r->print(
qq~	if (document.duplicates.assembly_part_DoNotInsert$aund$a_c$dund$empty1.checked) {
			document.getElementById("ass_part_hidden$aund$a_c$dund$empty1").style.display = ('none');
		} else {
			document.getElementById("ass_part_hidden$aund$a_c$dund$empty1").style.display = ('inline');
		}
		~
		);
	}
	$r->print(
		qq~
}

//]]>
</script>~
	);

# This javascript duplicates assembly_name into assembly_parts_assembly_name forms for that new empty assembly
	$r->print(
		qq|<script type="text/javascript">
		//<![CDATA[
		function AssemCopyEmptyDo$aund$a_c (evnt) {
		document.duplicates.as__assemblies_count_| 
		  . qq|$a_c|
		  . qq|.value=document.duplicates.assembly_name__assemblies_count_|
		  . qq|$a_c.value;
		document.duplicates.assembly_name_full_assembly_count_|
		  . qq|$a_c.value=document.duplicates.assembly_name__assemblies_count_|
		  . qq|$a_c.value;
		|
	);
	for ( my $i = 1 ; $i <= 10 ; $i++ ) {
		$r->print(
			qq|
			document.duplicates.als__assemblies_count_| 
			  . qq|$a_c|
			  . qq|_assemblies_parts_count_|
			  . qq|$i.value=document.duplicates.assembly_name__assemblies_count_|
			  . qq|$a_c.value;
			|
		);
	}
	$r->print(
		qq|	}
	//]]>
	</script>
	|
	);

########################################################################
	#	END Of Assemblies Parts Empty Section
#######################################################################

#######################################################################
	#	Normal Full Assembly Section
#######################################################################

	$sth = $dbh->prepare(
            "SELECT
                    full_assembly_name,
                    full_assembly_assembly_quantity,
                    full_assembly_assembly_id,
                    full_assembly_url,
                    full_assembly_currency,
                    full_assembly_notes
               FROM full_assembly
              WHERE full_assembly_name=$full_assembly_list_selected2;"
	);
	$sth->execute();
	while ( $full_assembly_hash_ref = $sth->fetchrow_hashref ) {
		$r->print(
			qq{<div class="f_a_c_$f_a_c" id="f_a_c_$f_a_c">
		<p>full_assembly_count_$f_a_c</p>
	<table summary="" border="1" rules="all" class="full_assembly">
	<caption class="FALcaption">Assemblies for Full Assembly:<br />
	<input class="fals" type="text" name="fals$fund2$f_a_c" id="fals$fund2$f_a_c" style="width:100%;font-weight:bold;text-align:center;font-size:1.0em;" value="$full_assembly_list_selected" readonly="readonly" /></caption>
	<tbody>}
		);
		foreach my $assemblyh (@full_assembly_hash_assemblys) {
			if ( $$full_assembly_hash_ref{$assemblyh} ) {
				$$full_assembly_hash_ref{$assemblyh} = HTML::Entities::encode(
					$$full_assembly_hash_ref{$assemblyh} );
				$$full_assembly_hash_ref{$assemblyh} =~ s/"/''/g;
			}
			else {
				$$full_assembly_hash_ref{$assemblyh} = '';
			}
		}
	$statement = "SELECT assembly_name FROM assemblies WHERE assembly_id = $$full_assembly_hash_ref{'full_assembly_assembly_id'};";
	$assembly_name_aref = $dbh->selectcol_arrayref($statement)
	  || die $dbh->errstr;

	$assembly_name = $$assembly_name_aref[0];
	$assembly_name = HTML::Entities::encode($assembly_name);
	$assembly_name =~ s/"/''/g;
		$r->print(
			qq{<tr>
<td align="left">Do Not Insert This Full Assembly</td><td align="left" class="full_assembly">&nbsp;&nbsp;
<input class="full_assembly" type="checkbox" name="full_assembly_DoNotInsert$fund2$f_a_c" id="full_assembly_DoNotInsert$fund2$f_a_c" value="full_assembly_DoNotInsert$fund2$f_a_c" />
</td>
</tr>
<tr>
<td align="left">Assembly Name</td><td align="left" class="full_assembly">
<input class="full_assembly" type="text" name="assembly_name_full_assembly_count_$f_a_c" id="assembly_name_full_assembly_count_$f_a_c" value="$assembly_name" readonly="readonly" />
</td>
</tr>});

		for my $fieldRR (@full_assembly_hash_assemblys) {
			unless ( $fieldRR =~ /notes/ || $fieldRR =~ /full_assembly_name/ ) {
				$r->print(
					qq{<tr>
<td align="left">$fieldRR</td><td align="left" class="full_assembly">
<input class="full_assembly" type="text" name="$fieldRR$fund2$f_a_c" id="$fieldRR$fund2$f_a_c" value="$full_assembly_hash_ref->{$fieldRR}" />
</td>
</tr>}
				);
			}
			elsif ( $fieldRR =~ /full_assembly_name/ ) {
				$r->print(
					qq{<tr>
<td align="left">$fieldRR</td><td align="left" class="full_assembly">
<input class="full_assembly" type="text" readonly="readonly" name="$fieldRR$fund2$f_a_c" id="$fieldRR$fund2$f_a_c" value="$full_assembly_hash_ref->{$fieldRR}" />
</td>
</tr>}
				);
			}
			else {
				$r->print(
					qq{<tr>
<td align="left">$fieldRR</td><td align="left" class="full_assembly">
<textarea cols="99" rows="6" class="full_assembly" type="text" name="$fieldRR$fund2$f_a_c" id="$fieldRR$fund2$f_a_c">$full_assembly_hash_ref->{$fieldRR}</textarea>
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
		$f_a_c++;
	}
#######################################################################
	#	END Of Normal Full Assembly Section
#######################################################################

#######################################################################
	#	Full Assembly Empty Section
#######################################################################

	$empty = $f_a_c;
	$r->print(
		qq{
<p><label for="full_assembly_DoNotInsert$fund$empty">Do Not Insert</label>&nbsp;&nbsp;
<input class="full_assembly" type="checkbox" checked="checked" name="full_assembly_DoNotInsert$fund$empty" id="full_assembly_DoNotInsert$fund$empty" value="full_assembly_DoNotInsert$fund$empty" />&nbsp;&nbsp;f_a_c_$empty
</p>
<div style="display:none" name="full_assembly_hidden$empty" id="full_assembly_hidden$empty">
<table summary="" border="1" rules="all" class="full_assembly">
<caption class="FALcaption">Assemblies for Full Assembly:<br />
<input class="fals" type="text" name="fals$fund2$empty" id="fals$fund2$empty" style="width:100%;font-weight:bold;text-align:center;font-size:1.0em;" /></caption>
<tbody>}
	);

	for my $fieldRR (@full_assembly_hash_assemblys) {
		unless ( $fieldRR =~ /notes/ || $fieldRR =~ /full_assembly_name/ ) {
			$r->print(
				qq{<tr>
<td align="left">$fieldRR</td><td align="left" class="full_assembly">
<input class="full_assembly" type="text" name="$fieldRR$fund2$fund$empty" id="$fieldRR$fund$empty" value="" />
</td>
</tr>}
			);
		}
		elsif ( $fieldRR =~ /full_assembly_name/ ) {
			$r->print(
				qq{<tr>
<td align="left">$fieldRR</td><td align="left" class="full_assembly">
<input class="full_assembly" type="text" readonly="readonly" name="$fieldRR$fund2$empty" id="$fieldRR$fund2$empty" value="" />
</td>
</tr>}
			);
		}
		else {
			$r->print(
				qq{<tr>
<td align="left">$fieldRR</td><td align="left" class="full_assembly">
<textarea cols="99" rows="6" class="full_assembly" type="text" name="$fieldRR$fund$empty" id="$fieldRR$fund$empty"></textarea>
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
	#	Script To Reveal Hidden Full Assembly Table

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
	document.getElementById("full_assembly_DoNotInsert$fund$empty").onchange = FChecksEmpty;
}




function FChecksEmpty (evnt) {
	if (document.duplicates.full_assembly_DoNotInsert$fund$empty.checked) {
		document.getElementById("full_assembly_hidden$empty").style.display = ('none');
	} else {
		document.getElementById("full_assembly_hidden$empty").style.display = ('inline');
	}

}

//]]>
</script>~
	);

#######################################################################
	#	END Of Full Assembly Empty Section
#######################################################################

	$sth->finish;
	$r->print(qq{</div>});

	$sth = $dbh->prepare(
            "SELECT
                    full_assembly_list_name,
                    full_assembly_list_category,
                    full_assembly_list_subcategory,
                    full_assembly_list_currency,
                    full_assembly_list_notes
               FROM full_assembly_list
              WHERE full_assembly_list_name = $full_assembly_list_selected2;"
	);
	$sth->execute();
	while ( $full_assembly_list_hash_ref = $sth->fetchrow_hashref ) {
		$r->print(
			qq{	<div class="f_a_l_c_$f_a_l_c" id="f_a_l_c_$f_a_l_c">
		<p>full_assembly_list_count_$f_a_l_c</p>
	<table summary="" border="1" rules="all">
	<caption class="FALcaption">Final Complete Full Assembly:<br />
	<input class="fals" type="text" name="fals$flund2" style="width:100%;font-weight:bold;text-align:center;font-size:1.0em;" value="$full_assembly_list_selected" readonly="readonly" /></caption>
	<tbody>}
		);
		foreach my $assemblyh (@full_assembly_list_hash_assemblys) {
			if ( $$full_assembly_list_hash_ref{$assemblyh} ) {
				$$full_assembly_list_hash_ref{$assemblyh} =
				  HTML::Entities::encode(
					$$full_assembly_list_hash_ref{$assemblyh} );
				$$full_assembly_list_hash_ref{$assemblyh} =~ s/"/''/g;
			}
			else {
				$$full_assembly_list_hash_ref{$assemblyh} = '';
			}
		}
		$r->print(
			qq{<tr>
<td align="left">Do Not Insert This Full Assembly List</td><td align="left" class="full_assembly_list">&nbsp;&nbsp;
<input type="checkbox" name="full_assembly_list_DoNotInsert$flund$f_a_l_c" id="full_assembly_list_DoNotInsert$flund2$f_a_l_c" class="full_assembly_list" value="full_assembly_list_DoNotInsert$flund$f_a_l_c" />
</td>
</tr>}
		);

		for my $fieldRR (@full_assembly_list_hash_assemblys) {
			unless ( $fieldRR =~ /notes/
				|| $fieldRR =~ /full_assembly_list_name/ )
			{
				$r->print(
					qq{<tr>
<td align="left">$fieldRR</td><td align="left" class="full_assembly_list">
<input class="full_assembly_list" type="text" name="$fieldRR$flund2$f_a_l_c" id="$fieldRR$flund$f_a_l_c" value="$full_assembly_list_hash_ref->{$fieldRR}" />
</td>
</tr>}
				);
			}
			elsif ( $fieldRR =~ /full_assembly_list_name/ ) {
				$r->print(
					qq{<tr>
<td align="left">Full Assembly List Name</td><td align="left" class="full_assembly_list">
<input type="text" name="full_assembly_list_name$flund2$f_a_l_c" id="full_assembly_list_name$flund2$f_a_l_c" class="full_assembly_list" value="$full_assembly_list_hash_ref->{full_assembly_list_name}" onblur="FullAssemListCopyDo();" />
</td>
</tr>}
				);
			}
			else {
				$r->print(
					qq{<tr>
<td align="left">$fieldRR</td><td align="left" class="full_assembly_list">
<textarea cols="99" rows="6" class="full_assembly_list" type="text" name="$fieldRR$flund$f_a_l_c" id="$fieldRR$flund2$f_a_l_c">$full_assembly_list_hash_ref->{$fieldRR}</textarea>
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
	}

# This javascript duplicates full_assembly_name into full_assembly_list_name forms for that new full_assembly and full_assembly_list
	$r->print(
		qq|<script type="text/javascript">
		//<![CDATA[
		function FullAssemListCopyDo (evnt) {
		document.duplicates.fals_full_assembly_list_count_.value=document.duplicates.full_assembly_list_name_full_assembly_list_count_1.value;
		|
	);
	for ( my $i = 1 ; $i <= $f_a_c ; $i++ ) {
		$r->print(
			qq|
			document.duplicates.full_assembly_name_full_assembly_count_|
			  . qq|$i.value=document.duplicates.full_assembly_list_name_full_assembly_list_count_1.value;
			document.duplicates.fals_full_assembly_count_$i.value=document.duplicates.full_assembly_list_name_full_assembly_list_count_1.value;
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
	<input type="hidden" value="DuplicateFullFALRecords" name="command" id="command" />
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
#	sub DuplicateFullFALRecords
#

sub DuplicateFullFALRecords {

	# version = 1.4
	# empties now carry through to end.
	my $r        = shift;
	my $dbh      = shift;
	my $q        = shift;
	my $database = shift;
	my $query;
	my $sth;
	my @assemblies_parts     = ();
	my @full_assembly_fields = ();
	my @full_assembly_values = ();
	my @full_assembly_list   = ();
	my $full_assembly_list_fields;
	my $full_assembly_list_values;
	my @assembly_insert_assemblys = ();
	my @assembly_insert_values    = ();
	my @assemblies_parts_inserts;
	my @assemblies_parts_insert_idassemblys = ();
	my @assemblies_parts_insert_ids         = ();
	my @assemblies_parts_insert_assemblys   = ();
	my @assemblies_parts_insert_values      = ();
	my $quoted;
	my $new_ass_id;
	my $new_ass_part_id;
	my $new_full_assembly_id;
	my $new_full_assembly_list_id;
	my $SQL;
	my $num_rows;
	my %args = map { $_ => $q->param($_) } $q->param;
	$r->print(qq|<br />xxxxxxxxxxx ASSEMBLIES xxxxxxxxxxxxxxxxxxxxx<br />|);

	foreach my $key ( keys %args ) {
		if (   ( $key =~ /(assembly.*)__assemblies_count_(\d+)$/ )
			|| ( $key =~ /(assembly.*)__assemblies_count_(\d+)$/ ) )
		{
			$assembly_insert_assemblys[$2] .= "$1, ";
			$quoted = $dbh->quote( $args{$key} );
			$assembly_insert_values[$2] .= "$quoted, ";
		}
	}

	for my $i ( 1 .. $#assembly_insert_assemblys ) {
		$assembly_insert_values[$i]    =~ s/, $//;
		$assembly_insert_assemblys[$i] =~ s/, $//;
		unless ( $assembly_insert_values[$i] =~ /DoNotInsert/ ) {
			$SQL =
qq{INSERT INTO assemblies ($assembly_insert_assemblys[$i]) VALUES ($assembly_insert_values[$i]) RETURNING assembly_id;};
			$r->print(qq~$SQL<br />~);
			$sth      = $dbh->prepare($SQL);
			$num_rows = $sth->execute();
			if ($num_rows) {
				$new_ass_id = $sth->fetch()->[0];
				$assemblies_parts_insert_idassemblys[$i] =
				  "assembly_part_assembly_id";
				$assemblies_parts_insert_ids[$i] = $new_ass_id;
				$r->print(qq{<div><h1>Success - $new_ass_id</h1></div>});
			}
			else {
				$r->print(qq{<div><h1>Failure -- $DBI::errstr</h1></div>});
			}
		}
		else {
			$assemblies_parts_insert_idassemblys[$i] =
			  "assembly_part_assembly_id";
			$assemblies_parts_insert_ids[$i] = "Not Inserted";
			$r->print(qq{<div><h1>Not Inserted</h1></div>});
		}

	}

	$r->print(
		qq|<br />xxxxxxxxxxxx ASSEMBLIES PARTS xxxxxxxxxxxxxxxxxxxx<br />|);

	foreach my $key ( keys %args ) {
		if (
			(
				$key =~
/(assembly_part.*)__assemblies_count_(\d+)_assemblies_parts_count_(\d+)$/
			)
			|| ( $key =~ /(assembly_part.*)__assemblies_count_(\d+)_assemblies_parts_count_(\d+)$/ )
		  )
		{
			$quoted = $args{$key};
			push @{ $assemblies_parts_inserts[$2][$3] }, { $1 => $quoted };

# This is an array of arrays of arrays of hashes  or @AoAoAoH
# This sets first array containing the assemblies in their numbers
# from the form ids
# The second set holds the assemblies_parts numbers from the form ids
# Each set of assemblies parts has its own number, each set is part of one
# assembly, repeated for however many assemblies there are.
# Finally, the last array is filled with all of the key values for each form assembly
		}
	}

# This next section is to insert the new assembly_ids into each assemblies_parts insert strings
	for my $i ( 1 .. $#assemblies_parts_inserts ) {
		for my $j ( 1 .. $#{ $assemblies_parts_inserts[$i] } ) {
			push @{ $assemblies_parts_inserts[$i][$j] },
			  { $assemblies_parts_insert_idassemblys[$i] =>
				  $assemblies_parts_insert_ids[$i] };
		}
	}
	for my $i ( 1 .. $#assemblies_parts_inserts ) {
		for my $j ( 1 .. $#{ $assemblies_parts_inserts[$i] } ) {
			for my $k ( @{ $assemblies_parts_inserts[$i][$j] } ) {
				for my $key ( sort keys %{$k} ) {
					$assemblies_parts_insert_assemblys[$i][$j] .= "$key, ";
					unless ( ( $key =~ /_id/ ) || ( $key =~ /quantity/ ) ) {
						$quoted = $dbh->quote( ${$k}{$key} );
					}
					else {
						$quoted = ${$k}{$key};
					}
					$assemblies_parts_insert_values[$i][$j] .= "$quoted, ";
				}
			}
			$assemblies_parts_insert_assemblys[$i][$j] =~ s/, $//;
			$assemblies_parts_insert_values[$i][$j]    =~ s/, $//;
			unless ( $assemblies_parts_insert_values[$i][$j] =~ /DoNotInsert/ )
			{
				$SQL =
qq{INSERT INTO assemblies_parts ($assemblies_parts_insert_assemblys[$i][$j]) VALUES ($assemblies_parts_insert_values[$i][$j]) RETURNING assembly_part_id;};
				$r->print(qq{$SQL<br />});
				$sth      = $dbh->prepare($SQL);
				$num_rows = $sth->execute();
				if ($num_rows) {
					$new_ass_part_id = $sth->fetch()->[0];
					$r->print(
						qq{<div><h1>Success - $new_ass_part_id</h1></div>});
				}
				else {
					$r->print(qq{<div><h1>Failure -- $DBI::errstr</h1></div>});
				}
			}
			else {
				$r->print(qq{<div><h1>Not Inserted</h1></div>});
			}
		}
	}
	$r->print(
		qq|<br />xxxxxxxxxxxxx FULL ASSEMBLIES xxxxxxxxxxxxxxxxxxx<br />|);
	foreach my $key ( keys %args ) {
		if (   ( $key =~ /(full_assembly.*)_full_assembly_count_(\d+)$/ )
			|| ( $key =~ /(full_assembly.*)_full_assembly_count_(\d+)$/ ) )
		{
			unless ( $1 eq "full_assembly_assembly_quantity" ) {
				$quoted = $dbh->quote( $args{$key} );
			}
			else {
				$quoted = $args{$key};
				$full_assembly_fields[$2] .=
				  "full_assembly_assembly_subtotal, ";
				$full_assembly_values[$2] .=
"(SELECT assembly_subtotal FROM assemblies WHERE assembly_id = $assemblies_parts_insert_ids[$2]), ";
				$full_assembly_fields[$2] .=
				  "full_assembly_assembly_rowtotal, ";
				$full_assembly_values[$2] .=
"(SELECT (assembly_subtotal)*$args{$key} FROM assemblies WHERE assembly_id = $assemblies_parts_insert_ids[$2]), ";
			}
			$full_assembly_fields[$2] .= "$1, ";
			$full_assembly_values[$2] .= "$quoted, ";
		}
	}
	for my $i ( 1 .. $#assemblies_parts_insert_ids ) {
		$full_assembly_fields[$i] .= "full_assembly_assembly_id";
		$full_assembly_values[$i] .= $assemblies_parts_insert_ids[$i];
	}
	for my $i ( 1 .. $#full_assembly_fields ) {
		unless ( $full_assembly_values[$i] =~ /DoNotInsert/ ) {
			$SQL =
qq{INSERT INTO full_assembly ($full_assembly_fields[$i]) VALUES ($full_assembly_values[$i]) RETURNING full_assembly_id;};
			$r->print(qq{$SQL<br />});
			$SQL =~ s/_full_assembly_count_//g;
			$r->print(qq{$SQL substituted<br />});
			$sth      = $dbh->prepare($SQL);
			$num_rows = $sth->execute();
			if ($num_rows) {
				$new_full_assembly_id = $sth->fetch()->[0];
				$r->print(
					qq{<div><h1>Success - $new_full_assembly_id</h1></div>});
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
		qq|<br />xxxxxxxxxxxxxx FULL ASSEMBLIES LIST xxxxxxxxxxxxxxxxxx<br />|);
	foreach my $key ( keys %args ) {
		if (
			(
				$key =~ /(full_assembly_list.*)_full_assembly_list_count_(\d+)$/
			)
			|| ( $key =~ /(full_assembly_list.*)_full_assembly_list_count_(\d+)$/ )
		  )
		{
			$full_assembly_list_fields .= "$1, ";
			$quoted = $dbh->quote( $args{$key} );
			$full_assembly_list_values .= "$quoted, ";

		}
	}
	$full_assembly_list_values =~ s/, $//;
	$full_assembly_list_fields =~ s/, $//;
	unless ( $full_assembly_list_values =~ /DoNotInsert/ ) {
		$SQL =
qq{INSERT INTO full_assembly_list ($full_assembly_list_fields) VALUES ($full_assembly_list_values) RETURNING full_assembly_list_id;};
		$r->print(qq{$SQL<br />});
		$sth      = $dbh->prepare($SQL);
		$num_rows = $sth->execute();
		if ($num_rows) {
			$new_full_assembly_list_id = $sth->fetch()->[0];
			$r->print(
				qq{<div><h1>Success - $new_full_assembly_list_id</h1></div>});
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

=pod

=head1 NAME

BWCL::ViewFALRecords - View full assembly list tree and reproduce
similar trees.

=head1 VERSION

This documentation refers to BWCL::ViewFALRecords version 1.2.00.

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
