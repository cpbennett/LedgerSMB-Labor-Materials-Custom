#!/usr/bin/perl

our $VERSION = 0.0.03;
use warnings;
use strict;

use Apache::Request();
my $r = Apache->request;
my $q = Apache::Request->new($r, POST_MAX => 100000, DISABLE_UPLOADS => 1);
$r->content_type("text/html");
$r->send_http_header;
my $lang;
if (defined ($q->param("lang"))) {
	$lang = $q->param("lang");
}
elsif (defined $r->headers_in->get('Accept-Language')) {
	$lang = $r->headers_in->get('Accept-Language');
}
else {
	$lang = "en";
}

if ($lang =~ /^en/) {

$r->print(qq{<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US">
<head>
<title>Manual for Database Access Programs</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-language" content="en-US" />
<meta name="robots" content="noindex,nofollow" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta name="description" content="Database Access Programs Manual" />
<meta name="author" content="Chris Bennett" />
<link rel="stylesheet" type="text/css" href="/default.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/print.css" media="print" />
<link rel="stylesheet" type="text/css" href="/handheldimg.css" media="handheld" />
<script type="text/javascript" src="/javascript/external.js"></script>
</head>
<body>
<div class="content">
<br />
<br />

<h1 class="titlehead">Database Access Programs Manual</h1>
<br />
<hr />

<h2 class="big">Current Command List</h2>
<ul>
<li class="medium2"><strong>Insert Record(s)</strong> - Used to insert one or more new records into a table that you must pick from the list of tables. Select how many records you wish to insert from Items to Insert in Group field.<br /><br /></li>
<li class="medium2"><strong>Update Record</strong> - Used to update an existing record from a table from list of tables AND using the ID value that you need to know for that entry!<br /><br /></li>
<li class="medium2"><strong>View Records</strong> - Used to view records of a given table from list. You may pick a class and/or subclass and/or vendor if viewing products table only. Use % or _ as wildcards for Field Value entries.<br /><br /></li>
<li class="medium2"><strong>Delete Duplicates</strong> - Use to delete existing records in products table where duplicate entries exist.<br /><br /></li>
<li class="medium2"><strong>Show Columns</strong> - Shows all columns and their properties from a selected table from list. Use these field names for View Records command.<br /><br /></li>
<li class="medium2"><strong>Show Tables</strong> - Shows all tables in this database.<br /><br /></li>
</ul>
<hr />
<div>
	<h2 class="big">Current Table List - vp</h2>
	<div>
	<table summary="" border="2" rules="all">
	<thead>
	<tr>
	<th>Table&nbsp;Name</th><th>Table&nbsp;Description</th>

	</tr>
	</thead>
	<tbody>
	<tr>
	<td class="medium3" align="left">jobsites</td><td class="medium3" align="left">Physical locations for each customer's different jobs</td>
	</tr>
	<tr>
	<td class="medium3" align="left">full_assembly</td><td class="medium3" align="left">Completed full assemblies made from assemblies</td>

	</tr>
	<tr>
	<td class="medium3" align="left">assemblies_parts</td><td class="medium3" align="left">Product parts used to create a complete assembly</td>
	</tr>
	<tr>
	<td class="medium3" align="left">currencies</td><td class="medium3" align="left">Country currency used for each item. Exchange rates are NOT incorporated yet</td>
	</tr>

	<tr>
	<td class="medium3" align="left">countries</td><td class="medium3" align="left">Countries where each table item is used in</td>
	</tr>
	<tr>
	<td class="medium3" align="left">products</td><td class="medium3" align="left">Detailed product information from each vendor</td>
	</tr>
	<tr>
	<td class="medium3" align="left">vendor_contacts</td><td class="medium3" align="left">Individual contacts for each vendor</td>
	</tr>
	<tr>
	<td class="medium3" align="left">vendors</td><td class="medium3" align="left">Vendors who provide products or services. See labor database for contractors and employees</td>

	</tr>
	<tr>
	<td class="medium3" align="left">customers</td><td class="medium3" align="left">Customers who buy products and services</td>
	</tr>
	<tr>
	<td class="medium3" align="left">full_assembly_list</td><td class="medium3" align="left">Condensed list of full assemblies showing price total and other details</td>
	</tr>

	<tr>
	<td class="medium3" align="left">assemblies</td><td class="medium3" align="left">Small assemblies used to create a complete full assembly</td>
	</tr>
	</tbody>
	</table>
	</div>
<hr />
<div>
	<h2 class="big">Current Table List - gl</h2>
	<div>
	<table summary="" border="2" rules="all">
	<thead>
	<tr>
	<th>Table&nbsp;Name</th><th>Table&nbsp;Description</th>

	</tr>
	</thead>
	<tbody>
	<tr>
	<td class="medium3" align="left">general_labor</td><td class="medium3" align="left">General labor items</td>
	</tr>
	<tr>
	<td class="medium3" align="left">labor_project</td><td class="medium3" align="left">Labor projects with totals, categories and subcategories</td>

	</tr>
	<tr>
	<td class="medium3" align="left">labor_project_list</td><td class="medium3" align="left">Condensed list of labor projects showing price total and other details</td>
	</tr>
	<tr>
	<td class="medium3" align="left">labor_category</td><td class="medium3" align="left">Labor categories and subcategories</td>
	</tr>

	<tr>
	<td class="medium3" align="left">countries</td><td class="medium3" align="left">Countries where each table item is used in</td>
	</tr>
	<tr>
	<td class="medium3" align="left">method_to_charge</td><td class="medium3" align="left">Methods used to charge</td>
	</tr>
	<tr>

	<td class="medium3" align="left">labor_units</td><td class="medium3" align="left">Units used to charge labor</td>
	</tr>
	<tr>
	<td class="medium3" align="left">labor_service</td><td class="medium3" align="left">Service types</td>
	</tr>
	<tr>
	<td class="medium3" align="left">labor_skill</td><td class="medium3" align="left">Skill levels</td>

	</tr>
	<tr>
	<td class="medium3" align="left">currenciesg</td><td class="medium3" align="left">Country currency used for each item. Exchange rates are NOT incorporated yet</td>
	</tr>
	<tr>
	<td class="medium3" align="left">contractors</td><td class="medium3" align="left">Contractors who provide services</td>
	</tr>

	</tbody>
	</table>
	</div>
<hr />

<h2 class="big">Command Details</h2>
<p class="medium2">There are two forms on most pages. The bottom form is used to activate first step (Sometimes only step) of a command. For convenience, there are two submit and two reset buttons. After beginning a command, second page will have a continue or submit button above command selection form. This must be used to submit your changes.
</p>

<h3 class="medium">View Records:</h3>
<p class="medium2">You need to pick a particular table you want to search. Columns to choose from for searches are automatically made available in the field search boxes as you pick a table.<br />
Now, within the Field Value box or boxes, enter the search phrase or number you are looking for. This is not a full-blown search field like Google or Yahoo!<br />
For example, if you wish to see all customers living in the zip codes like 786-something, you may enter 78620, if you want that exact zip code, or you may enter 786% to search for all zip codes that begin with 786, which would bring up all customers with zip codes of 78660,78652,78664, etc.<br />
Use _ (underscore) to match a single position as wildcard. If you instead enter 78__2, you might get 78652 as a result.
Looking for an address? Field = cust_bill_street_addr and Field Value = %Cha% will bring up addresses on Chaparral, Chamois Knoll and Charlesworth streets. First % and last % are often needed.<br />
It is also possible to enter "or" values:<br />
To search for something like a 2 x 4 x 8, you can use (x|X) to signify either a small letter or capital letter x.<br />
So %2%(x|X)%4%(x|X)%8% will perform the search of:<br />
</p>
<ul>
	<li class="medium2">Look for anything at beginning of record</li>
	<li class="medium2">Then must find a 2</li>
	<li class="medium2">Then anything</li>
	<li class="medium2">Then either an x or an X</li>
	<li class="medium2">Then anything</li>
	<li class="medium2">Then must find a 4</li>
	<li class="medium2">Then anything</li>
	<li class="medium2">Then either an x or an X</li>
	<li class="medium2">Then must find a 8</li>
	<li class="medium2">Then anything until the end of record</li>
</ul>
<p class="medium2">This looks complicated but is very effective</p>

<h3 class="medium">Insert Record(s):</h3>
<p class="medium2">Use to insert a new record or multiple records (enter how many new records into "Items to Insert in Group") into a table that you must pick from the list of tables. Can only be used for first insertion. Afterwards, Update Record must be used to change a records values, including values that are blank (also called NULL.). This can be an acceptable way to quickly enter needed data. These records can then be filled out completely later. Insert Record Group is especially useful when filling almost identical assemblies and full_assemblies with similar information. The first set of insert fields on the insert form page allows you to duplicate the first value throughout all of the records. This can save a significant amount of time avoiding repetition.
</p>
<h3 class="medium">Update Record:</h3>
<p class="medium2">Use to update an existing record in a table from the list of tables AND using the ID value that you need to know for that single entry. Only ID field (such as cust_id ) can be used for this command.
</p>
<h3 class="medium">Delete Duplicates:</h3>
<p class="medium2">Use to delete existing records in products table where duplicate entries exist. A vendor must be selected. Only entries with duplicate sku AND model will be selected. Some entries have differing product_urls or product_descriptions, usually due to a minor difference such as color or other options. This is a defect in the vendor's database design. Please do not delete these items.
</p>
<h3 class="medium">Show Columns:</h3>
<p class="medium2">Shows all columns (also called fields) and their properties from a selected table from list. Use these field names for the View Some Records command. You will probably need to use the View All Records command to obtain the needed field values to then use View Some Records unless you already know what value you are searching for.
</p>
<h3 class="medium">Show Tables:</h3>
<p class="medium2">This command shows all tables in this particular database. Does not show anything about tables in other databases.
</p>

<hr />

<h2 class="big">Process of creating an item in the full assembly list table</h2>

<h3 class="medium2">First Create an assembly:</h3>
<p class="medium2">An assembly is an item used to create a full_assembly. An assembly consists of assembly_parts which are drawn form the products table. An assembly is a simple item, such as a wall of a certain size, that can be combined with other assemblies in the needed quantity to form a complete item, which is called a full_assembly. An example might be a small building consisting of wall assemblies, floor assemblies, roof assemblies, etc.</p>
<h3 class="medium2">Second, add assemblies_parts to this assembly</h3>
<p class="medium2">Add assemblies_parts using entries derived from the products table. Use the desired parts in the correct quantity, say 24 2" x 4" studs.</p>
<h3 class="medium2">Third, create a full_assembly</h3>
<p class="medium2">This will consist of one or more assemblies, with their correct quantities. Note that there will be multiple entries with the same full_assembly_name. Each of these will deal with one of the separate assemblies used.</p>
<h3 class="medium2">Finally, create a full_assembly_list for this particular set of full_assemblies.</h3>
<p class="medium2">This will be a single entry that summarizes the total price and category information for this final full_assembly. This is the item that will be used for the complete price of the item.</p>

<hr />

<div class="right"><br /><br />Last Updated: July 17, 2012<br /><br /></div>
<br />
</div>
</body></html>
});
}
elsif ($lang =~ /^es/) {
	$r->print(qq{<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xml:lang="es" xmlns="http://www.w3.org/1999/xhtml" lang="es">
<head>
<title>Manual de las Programas del Acceso de los Bases de Datos</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-language" content="es" />
<meta name="robots" content="noindex,nofollow" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta name="description" content="Manual de las Programas del Acceso de Bases de Datos" />
<meta name="author" content="Chris Bennett" />
<link rel="stylesheet" type="text/css" href="/default.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/print.css" media="print" />
<link rel="stylesheet" type="text/css" href="/handheldimg.css" media="handheld" />
<script type="text/javascript" src="/javascript/external.js"></script>
</head>
<body>
<div class="content">
<br />
<br />

<h1 class="titlehead">Manual de las Programas del Acceso de Bases de Datos</h1>
<br />
<hr />

<h2 class="big">Lista de comandos actual</h2>
<ul>
<li class="medium2"><strong>Insertar Registros</strong> - Se utiliza para insertar nuevos registros en una tabla que debe elegir entre la lista de tablas. Después de meter un registro nuevo, se tiene que cambiar o corregir con el comando de actualización de registro. Se debe escoger un numero de nuevos registros para insertar.<br /><br /></li>
<li class="medium2"><strong>Actualización de Registro</strong> - Se utiliza para actualizar un registro existente de una tabla de la lista de tablas y utilizando el ID de valor que hay que saber para que la entrada!<br /><br /></li>
<li class="medium2"><strong>Ver los Registros</strong> - Utilizado para ver todos los registros de una tabla de la lista. Usted puede elegir una clase o subclase de la clase y ver si la tabla de productos solamente. Además, se puede escoger un proveedor de la lista de proveedores, solamente cuando usando la tabla productos.  Se utiliza para ver determinadas registros combinados de una determinada tabla de la lista. Usted tendrá que escoger un terreno y el valor que desee partido. Ver columnas para mostrar los nombres de la columna real. Utilice % (el signo de porcentaje) como comodín.<br /><br /></li>
<li class="medium2"><strong>Borrar Duplicados</strong> - Usa para borrar registros en la tabla de productos cuando unos registros son duplicados.<br /><br /></li>
<li class="medium2"><strong>Mostrar Columnas</strong> - Muestra todas las columnas y sus propiedades de una tabla seleccionada de la lista. Utilice estos nombres de columna para ver algunos registros comando.<br /><br /></li>
<li class="medium2"><strong>Mostrar Tablas</strong> - Muestra todas las tablas en esta base de datos.<br /><br /></li>
</ul>
<hr />
<div>
	<h2 class="big">Lista de Tablas Actuales - vp</h2>
	<div>
	<table summary="" border="2" rules="all">
	<thead>
	<tr>
	<th>Nombre&nbsp;de&nbsp;Tabla</th><th>Descripción&nbsp;de&nbsp;Tabla</th>

	</tr>
	</thead>
	<tbody>
	<tr>
	<td class="medium3" align="left">jobsites</td><td class="medium3" align="left">Lugares físicos para diferentes puestos de trabajo de cada cliente</td>
	</tr>
	<tr>
	<td class="medium3" align="left">full_assembly</td><td class="medium3" align="left">Completado conjuntos completos elaborados a partir de las asambleas</td>

	</tr>
	<tr>
	<td class="medium3" align="left">assemblies_parts</td><td class="medium3" align="left">Partes del producto se utilizan para crear un conjunto completo</td>
	</tr>
	<tr>
	<td class="medium3" align="left">currencies</td><td class="medium3" align="left">Moneda del país para cada elemento. Los tipos de cambio no se han incorporado todavía</td>
	</tr>

	<tr>
	<td class="medium3" align="left">countries</td><td class="medium3" align="left">Los países donde se utiliza cada elemento de la tabla</td>
	</tr>
	<tr>
	<td class="medium3" align="left">products</td><td class="medium3" align="left">Información detallada del producto de cada vendedor</td>
	</tr>
	<tr>
	<td class="medium3" align="left">vendor_contacts</td><td class="medium3" align="left">Los contactos individuales para cada proveedor</td>
	</tr>
	<tr>
	<td class="medium3" align="left">vendors</td><td class="medium3" align="left">Proveedores que ofrecen productos o servicios. Ver base de datos de mano de obra para los contratistas y empleados</td>

	</tr>
	<tr>
	<td class="medium3" align="left">customers</td><td class="medium3" align="left">Los clientes que compran productos y servicios</td>
	</tr>
	<tr>
	<td class="medium3" align="left">full_assembly_list</td><td class="medium3" align="left">Lista resumida de los conjuntos completos que muestran el precio total y otros detalles</td>
	</tr>

	<tr>
	<td class="medium3" align="left">assemblies</td><td class="medium3" align="left">Asambleas pequeñas que se utilizan para crear un conjunto completo</td>
	</tr>
	</tbody>
	</table>
	</div>
<hr />
<div>
	<h2 class="big">Lista de Tablas Actuales - gl</h2>
	<div>
	<table summary="" border="2" rules="all">
	<thead>
	<tr>
	<th>Nombre&nbsp;de&nbsp;Tabla</th><th>Descripción&nbsp;de&nbsp;Tabla</th>

	</tr>
	</thead>
	<tbody>
	<tr>
	<td class="medium3" align="left">general_labor</td><td class="medium3" align="left">Tipos de labor generales</td>
	</tr>
	<tr>
	<td class="medium3" align="left">labor_project</td><td class="medium3" align="left">Proyectos de trabajo con los totales, categorías y subcategorías</td>

	</tr>
	<tr>
	<td class="medium3" align="left">labor_project_list</td><td class="medium3" align="left">Lista resumida de los proyectos de trabajo que muestra el precio total y otros detalles</td>
	</tr>
	<tr>
	<td class="medium3" align="left">labor_category</td><td class="medium3" align="left">Categorías y categorías secundarias de labor</td>
	</tr>

	<tr>
	<td class="medium3" align="left">countries</td><td class="medium3" align="left">Los países donde se utiliza cada elemento de la tabla</td>
	</tr>
	<tr>
	<td class="medium3" align="left">method_to_charge</td><td class="medium3" align="left">Métodos para cobrar labor</td>
	</tr>
	<tr>

	<td class="medium3" align="left">labor_units</td><td class="medium3" align="left">Unidades usados para cobrar labor</td>
	</tr>
	<tr>
	<td class="medium3" align="left">labor_service</td><td class="medium3" align="left">Tipos de servicio</td>
	</tr>
	<tr>
	<td class="medium3" align="left">labor_skill</td><td class="medium3" align="left">Los niveles de habilidad</td>

	</tr>
	<tr>
	<td class="medium3" align="left">currenciesg</td><td class="medium3" align="left">Moneda del país para cada elemento. Los tipos de cambio no se han incorporado todavía</td>
	</tr>
	<tr>
	<td class="medium3" align="left">contractors</td><td class="medium3" align="left">Los contratistas que prestan servicios</td>
	</tr>

	</tbody>
	</table>
	</div>
<hr />
<h2 class="big">Detalles de comando </h2>
<h3 class="medium">Uso de Formularios:</h3>
<p class="medium2">Hay dos formas en la mayoría de las páginas. Formulario de la parte inferior se utiliza para activar el primer paso (a veces solo paso) de un comando. Para mayor comodidad, hay dos presentar y dos botones de reinicio. Después del inicio de un comando, segunda página tendrá un botón de continuar o presentar comando anterior forma de selección. Esto debe ser utilizada para aplicar los cambios.</p>

<h3 class="medium">Ver los Registros:</h3>
<p class="medium2">Muestra todos los registros de una tabla según sus búsquedas.<br />
Por la tabla de productos, se puede seleccionar sólo aquellos registros que coinciden con el grupo más grande de manifiesto en virtud de una clase o subclase o proveedor o todos combinados de selección. Otras tablas también usan proveedor.
<br />
</p>

<p class="medium2">Tienes que recoger una tabla que desee buscar. Después de seleccionar una tabla, abajo aparecen todas las columnas para esa tabla. Se puede entonces meter términos de búsqueda para restringir y controlar los resultados.
<br />
Ahora, en el cuadro valor de columna, introduzca la frase de búsqueda o el número que busca. ¡Esto no es un verdadero motor de búsqueda como Google o Yahoo!
<br />
Por ejemplo, si desea ver todos los clientes que viven en los códigos postales como 786-algo, puede entrar en 78620, si desea que el código postal exacta, o usted puede entrar en 786% para buscar todos los códigos postales que comienzan con 786, que abrir todos los clientes con los códigos postales de 78660,78652,78664, etc.
<br />
¿Buscas una dirección? Columna = cust_bill_street_addr y = %Cha% traerá direcciones en Chaparral, Chamois Knoll y Charlesworth calles. Primera "%" y última "%" a menudo son necesarios.</p>

<p class="medium2">Tambien se puede buscar valores como esto o eso:
Para buscar una cosa como una 2 x 4 x 8, se puede usar (x|X) para buscar x con letra chica o letra grande.
Entonces %2%(x|X)%4%(x|X)%8% buscara así:</p>
<ul>
	<li class="medium2">Buscar para cualquier cosa o cosas al principio</li>
	<li class="medium2">Entonces requiere una 2</li>
	<li class="medium2">Entonces cualquier cosa o cosas</li>
	<li class="medium2">Entonces un x o un X</li>
	<li class="medium2">Entonces cualquier cosa o cosas</li>
	<li class="medium2">Entonces requiere una 4</li>
	<li class="medium2">Entonces cualquier cosa o cosas</li>
	<li class="medium2">Entonces un x o un X</li>
	<li class="medium2">Entonces requiere una 8</li>
	<li class="medium2">Entonces cualquier cosa o cosas hasta termina el registro</li>
</ul>
<p class="medium2">Parece complicado, pero es muy eficaz.</p>

<h3 class="medium">Insertar Registro:</h3>
<p class="medium2">Use para insertar un nuevo registro en una tabla que debe elegir entre la lista de tablas. Sólo se puede utilizar para la primera inserción, varios comandos de actualización se debe utilizar para cambiar los valores registros, incluyendo los valores que están en blanco (también llamado NULL.) Se debe escoger cuantos nuevos registros se quiere insertar por marcar un numero en la forma. La forma para insertar deja uno escoger a repetir en todas los siguientes datos lo que se mete en el primero dato. Esto ayuda muchísimo evitar teclear la misma cosa vez tras vez cuando insertando varios similares registros en grupo.</p>

<h3 class="medium">Actualización de Registro:</h3>
<p class="medium2">Utilizar para actualizar un registro existente en una tabla de la lista de tablas utilizando el ID y el valor que hay que saber para que de entrada único. Sólo el Columna ID (como cust_id) pueden ser utilizados para este comando.</p>

<h3 class="medium">Borrar Duplicados:</h3>

<p class="medium2">Usa para borrar registros en la tabla de productos cuando unos registros son duplicados. Un proveedor necesita estar seleccionado. Solamente registros con las columnas sku y model duplicados a mismo tiempo estarán mostrados. Unos de estos no son de veras duplicados por diferencias como color o product_url, etc. Se debe ver este problema como un defecto en el diseño del base de datos del proveedor. ¡Por favor de no borrar estos registros!</p>

<h3 class="medium">Mostrar Columnas:</h3>
<p class="medium2">Muestra todas las columnas y sus propiedades de una tabla seleccionada de la lista. Utilice estos nombres de columna para el comando Ver Algunos registros. Usted probablemente necesitará utilizar el comando Ver todos los registros necesarios para obtener los valores de las columnas a continuación, utilice Ver algunos registros a menos que usted ya conoce el valor de lo que está buscando.</p>

<h3 class="medium">Mostrar Tablas:</h3>
<p class="medium2">Este comando muestra todas las tablas en esta base de datos. No muestra nada acerca de las tablas en otras bases de datos.</p>

<hr />

<h2 class="big">Proceso de crear una unidad en la tabla de full assembly list</h2>
<h3 class="medium2">Primero, se debe crear una assembly apropiada:</h3>

<p class="medium2">Una assembly es una unidad usado para crear una full_assembly. Una assembly consiste de assembly_parts, los cuales son derivados de la tabla de products. Una assembly es una unidad simple, como una pared de cierto tamaño, que se puede estar combinado con otras assemblies usando las cantidades correctos para formar la unidad completa, cual es una unidad de la tabla full_assembly. Un ejemplo puede ser un edificio pequeño cual consiste de assemblies de paredes, assemblies de piso, assemblies de techos, etc.</p>
<h3 class="medium2">Segundo, se debe añadir assemblies_parts a este assembly</h3>

<p class="medium2">Añade assemblies_parts usando unidades de la tabla de products. Use los productos en la cantidades queridos, como 24 2" x 4" studs.</p>
<h3 class="medium2">Tercero, crear una full_assembly</h3>

<p class="medium2">Esto consiste de uno o mas assemblies, con sus cantidades correctas. Nota bien que estarán varios con la misma full_assembly_name. Cada uno de estos trata de una distinta assemblies usado.</p>
<h3 class="medium2">Finalmente, crear una full_assembly_list para este grupo de full_assemblies</h3>

<p class="medium2">Esto es una unidad solamente que junta toda la información desde abajo hasta algo completo, incluyendo precio, categoría y mas. Esta es el precio final y completo para este unidad completada.</p>
<hr />
<div class="right"><br /><br />Última Actualización: 25 de agosto de 2012 <br /><br /></div><br /></div>
</body></html>
});
}
1;
