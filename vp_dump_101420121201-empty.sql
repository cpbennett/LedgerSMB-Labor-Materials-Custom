--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: assembly_part_description(); Type: FUNCTION; Schema: public; Owner: bencon
--

CREATE FUNCTION assembly_part_description() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
NEW.assembly_part_description := (SELECT product_description FROM products WHERE product_id=NEW.assembly_part_product_id);
RETURN NEW;
END;$$;


ALTER FUNCTION public.assembly_part_description() OWNER TO bencon;

--
-- Name: assembly_part_description_product_description_update(); Type: FUNCTION; Schema: public; Owner: bencon
--

CREATE FUNCTION assembly_part_description_product_description_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE assemblies_parts set assembly_part_description=(SELECT product_description FROM products WHERE product_id=NEW.product_id) WHERE assembly_part_product_id=NEW.product_id;
RETURN NULL;
END;$$;


ALTER FUNCTION public.assembly_part_description_product_description_update() OWNER TO bencon;

--
-- Name: full_assembly_full_assembly_list_id_update(); Type: FUNCTION; Schema: public; Owner: bencon
--

CREATE FUNCTION full_assembly_full_assembly_list_id_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE full_assembly set full_assembly_full_assembly_list_id = NEW.full_assembly_list_id WHERE full_assembly_name = NEW.full_assembly_list_name;
UPDATE full_assembly set full_assembly_full_assembly_list_id = NULL WHERE full_assembly_name NOT IN ( SELECT full_assembly_list_name FROM full_assembly_list);
RETURN NULL;
END;$$;


ALTER FUNCTION public.full_assembly_full_assembly_list_id_update() OWNER TO bencon;

--
-- Name: full_assembly_list_total_full_assembly_delete_run(); Type: FUNCTION; Schema: public; Owner: bencon
--

CREATE FUNCTION full_assembly_list_total_full_assembly_delete_run() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE full_assembly_list set full_assembly_list_total=(SELECT SUM(full_assembly_assembly_rowtotal) FROM full_assembly WHERE full_assembly_name=OLD.full_assembly_name);
RETURN NULL;
END;$$;


ALTER FUNCTION public.full_assembly_list_total_full_assembly_delete_run() OWNER TO bencon;

--
-- Name: full_assembly_list_total_insert(); Type: FUNCTION; Schema: public; Owner: bencon
--

CREATE FUNCTION full_assembly_list_total_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
NEW.full_assembly_list_total := SUM(full_assembly_assembly_rowtotal) FROM full_assembly WHERE full_assembly_name = NEW.full_assembly_list_name;
RETURN NEW;
END;$$;


ALTER FUNCTION public.full_assembly_list_total_insert() OWNER TO bencon;

--
-- Name: full_assembly_list_total_update(); Type: FUNCTION; Schema: public; Owner: bencon
--

CREATE FUNCTION full_assembly_list_total_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE full_assembly_list SET full_assembly_list_total=(SELECT SUM(full_assembly_assembly_rowtotal) FROM full_assembly WHERE full_assembly_name=full_assembly_list_name);
RETURN NULL;
END;$$;


ALTER FUNCTION public.full_assembly_list_total_update() OWNER TO bencon;

--
-- Name: sum_assembly_part_subtotal(); Type: FUNCTION; Schema: public; Owner: bencon
--

CREATE FUNCTION sum_assembly_part_subtotal() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
NEW.assembly_part_subtotal := NEW.assembly_part_quantity*(SELECT price FROM products WHERE product_id=NEW.assembly_part_product_id);
RETURN NEW;
END;$$;


ALTER FUNCTION public.sum_assembly_part_subtotal() OWNER TO bencon;

--
-- Name: sum_assembly_part_subtotal_update2(); Type: FUNCTION; Schema: public; Owner: bencon
--

CREATE FUNCTION sum_assembly_part_subtotal_update2() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
assembly_part_subtotal_new2 numeric(10,2);
assembly_part_id_set integer[];
i integer;
BEGIN
SELECT array(SELECT assembly_part_id FROM assemblies_parts WHERE assembly_part_product_id=NEW.product_id) INTO assembly_part_id_set;
i := 1;
LOOP
IF assembly_part_id_set[i] ISNULL THEN
EXIT;--Exit when no more values in array
END IF;
assembly_part_subtotal_new2 := 
(SELECT assembly_part_quantity FROM assemblies_parts WHERE assembly_part_id=assembly_part_id_set[i])*
(SELECT price FROM products WHERE product_id=NEW.product_id);
UPDATE assemblies_parts set assembly_part_subtotal=assembly_part_subtotal_new2 WHERE assembly_part_id=
assembly_part_id_set[i];
i := i + 1;
END LOOP;
RETURN NULL;
END;$$;


ALTER FUNCTION public.sum_assembly_part_subtotal_update2() OWNER TO bencon;

--
-- Name: sum_assembly_subtotal_delete_run(); Type: FUNCTION; Schema: public; Owner: bencon
--

CREATE FUNCTION sum_assembly_subtotal_delete_run() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE assemblies set assembly_subtotal=(SELECT SUM(assembly_part_subtotal) FROM assemblies_parts WHERE assembly_part_assembly_id=OLD.assembly_part_assembly_id) WHERE assembly_id=OLD.assembly_part_assembly_id;
RETURN OLD;
END;$$;


ALTER FUNCTION public.sum_assembly_subtotal_delete_run() OWNER TO bencon;

--
-- Name: sum_assembly_subtotal_update_run(); Type: FUNCTION; Schema: public; Owner: bencon
--

CREATE FUNCTION sum_assembly_subtotal_update_run() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE assemblies set assembly_subtotal=(SELECT SUM(assembly_part_subtotal) FROM assemblies_parts WHERE assembly_part_assembly_id=NEW.assembly_part_assembly_id) WHERE assembly_id=NEW.assembly_part_assembly_id;
RETURN NULL;
END;$$;


ALTER FUNCTION public.sum_assembly_subtotal_update_run() OWNER TO bencon;

--
-- Name: sum_n_full_assembly_subtotal_update_run_as(); Type: FUNCTION; Schema: public; Owner: bencon
--

CREATE FUNCTION sum_n_full_assembly_subtotal_update_run_as() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
full_assembly_id_set integer[];
i integer;
BEGIN
SELECT array(SELECT full_assembly_id FROM full_assembly WHERE full_assembly_assembly_id=NEW.assembly_id) INTO full_assembly_id_set;
i := 1;
LOOP--loop 1
IF full_assembly_id_set[i] ISNULL THEN
EXIT;--Exit LOOP when no more values in array
END IF;
UPDATE full_assembly SET full_assembly_assembly_subtotal=(SELECT assembly_subtotal FROM assemblies WHERE assembly_id=NEW.assembly_id) WHERE full_assembly_id=full_assembly_id_set[i];
i := i + 1;
END LOOP;-- end loop 1
UPDATE full_assembly SET full_assembly_assembly_rowtotal=full_assembly_assembly_subtotal*full_assembly_assembly_quantity;
RETURN NULL;
END;$$;


ALTER FUNCTION public.sum_n_full_assembly_subtotal_update_run_as() OWNER TO bencon;

--
-- Name: sum_p_full_assembly_subtotal_update_run_fq(); Type: FUNCTION; Schema: public; Owner: bencon
--

CREATE FUNCTION sum_p_full_assembly_subtotal_update_run_fq() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE full_assembly SET full_assembly_assembly_rowtotal=full_assembly_assembly_subtotal*full_assembly_assembly_quantity WHERE full_assembly_id=NEW.full_assembly_id;
RETURN NULL;
END;$$;


ALTER FUNCTION public.sum_p_full_assembly_subtotal_update_run_fq() OWNER TO bencon;

--
-- Name: sum_r_full_assembly_rowtotal_insert_run_fr(); Type: FUNCTION; Schema: public; Owner: bencon
--

CREATE FUNCTION sum_r_full_assembly_rowtotal_insert_run_fr() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
NEW.full_assembly_assembly_subtotal := (SELECT assembly_subtotal FROM assemblies WHERE assembly_id = NEW.full_assembly_assembly_id);
NEW.full_assembly_assembly_rowtotal=NEW.full_assembly_assembly_subtotal*NEW.full_assembly_assembly_quantity;
NEW.full_assembly_assembly_id := (SELECT DISTINCT assembly_id FROM assemblies WHERE assembly_id = NEW.full_assembly_assembly_id);
RETURN NEW;
END;$$;


ALTER FUNCTION public.sum_r_full_assembly_rowtotal_insert_run_fr() OWNER TO bencon;

--
-- Name: update_full_assembly_assembly_id(); Type: FUNCTION; Schema: public; Owner: bencon
--

CREATE FUNCTION update_full_assembly_assembly_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
NEW.full_assembly_assembly_id := (SELECT DISTINCT assembly_id FROM assemblies WHERE assembly_id = NEW.full_assembly_assembly_id);
RETURN NEW;
END;$$;


ALTER FUNCTION public.update_full_assembly_assembly_id() OWNER TO bencon;

--
-- Name: update_products(); Type: FUNCTION; Schema: public; Owner: bencon
--

CREATE FUNCTION update_products() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.up_date := CURRENT_TIMESTAMP; 
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_products() OWNER TO bencon;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: assemblies; Type: TABLE; Schema: public; Owner: bencon; Tablespace: 
--

CREATE TABLE assemblies (
    assembly_id integer NOT NULL,
    assembly_notes text,
    assembly_url text,
    assembly_subtotal numeric(10,2) DEFAULT NULL::numeric,
    assembly_category text,
    assembly_description text,
    assembly_name text NOT NULL,
    assembly_currency text DEFAULT 'USD'::text NOT NULL
);


ALTER TABLE public.assemblies OWNER TO bencon;

--
-- Name: TABLE assemblies; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON TABLE assemblies IS 'Small assemblies used to create a complete full assembly';


--
-- Name: COLUMN assemblies.assembly_id; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN assemblies.assembly_id IS 'Assembly ID';


--
-- Name: COLUMN assemblies.assembly_notes; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN assemblies.assembly_notes IS 'Notes About Assembly';


--
-- Name: COLUMN assemblies.assembly_url; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN assemblies.assembly_url IS 'URL on our Website to Fully Display Assembly';


--
-- Name: COLUMN assemblies.assembly_subtotal; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN assemblies.assembly_subtotal IS 'Subtotal Derived from Sum of Assembly Parts Used';


--
-- Name: COLUMN assemblies.assembly_category; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN assemblies.assembly_category IS 'General Category this Assembly fits into';


--
-- Name: COLUMN assemblies.assembly_description; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN assemblies.assembly_description IS 'Details about this Particular Assembly';


--
-- Name: COLUMN assemblies.assembly_name; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN assemblies.assembly_name IS 'Assembly Name Used for Full Assembly and Assemblies Parts';


--
-- Name: COLUMN assemblies.assembly_currency; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN assemblies.assembly_currency IS 'Assembly Currency';


--
-- Name: assemblies_assembly_id_seq; Type: SEQUENCE; Schema: public; Owner: bencon
--

CREATE SEQUENCE assemblies_assembly_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assemblies_assembly_id_seq OWNER TO bencon;

--
-- Name: assemblies_assembly_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bencon
--

ALTER SEQUENCE assemblies_assembly_id_seq OWNED BY assemblies.assembly_id;


--
-- Name: assemblies_assembly_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bencon
--

SELECT pg_catalog.setval('assemblies_assembly_id_seq', 1, true);


--
-- Name: assemblies_parts; Type: TABLE; Schema: public; Owner: bencon; Tablespace: 
--

CREATE TABLE assemblies_parts (
    assembly_part_id integer NOT NULL,
    assembly_part_notes text,
    assembly_part_assembly_id integer NOT NULL,
    assembly_part_subtotal numeric(10,2) NOT NULL,
    assembly_part_quantity integer NOT NULL,
    assembly_part_product_id integer NOT NULL,
    assembly_part_description text NOT NULL,
    assembly_part_subclass text,
    assembly_part_class text,
    assembly_part_name text NOT NULL,
    assembly_part_currency text DEFAULT 'USD'::text NOT NULL
);


ALTER TABLE public.assemblies_parts OWNER TO bencon;

--
-- Name: TABLE assemblies_parts; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON TABLE assemblies_parts IS 'Product parts used to create a complete assembly';


--
-- Name: COLUMN assemblies_parts.assembly_part_id; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN assemblies_parts.assembly_part_id IS 'Assembly Part ID';


--
-- Name: COLUMN assemblies_parts.assembly_part_notes; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN assemblies_parts.assembly_part_notes IS 'Assembly Part Notes';


--
-- Name: COLUMN assemblies_parts.assembly_part_assembly_id; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN assemblies_parts.assembly_part_assembly_id IS 'Assembly Part Assembly ID';


--
-- Name: COLUMN assemblies_parts.assembly_part_subtotal; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN assemblies_parts.assembly_part_subtotal IS 'Assembly Part Subtotal is From Product Price times Assembly Part Quantity';


--
-- Name: COLUMN assemblies_parts.assembly_part_quantity; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN assemblies_parts.assembly_part_quantity IS 'Assembly Part Quantity Used for Assembly';


--
-- Name: COLUMN assemblies_parts.assembly_part_product_id; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN assemblies_parts.assembly_part_product_id IS 'Assembly Part Product ID';


--
-- Name: COLUMN assemblies_parts.assembly_part_description; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN assemblies_parts.assembly_part_description IS 'Assembly Part Description is Copy of Product Description';


--
-- Name: COLUMN assemblies_parts.assembly_part_subclass; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN assemblies_parts.assembly_part_subclass IS 'Assembly Part Subclass';


--
-- Name: COLUMN assemblies_parts.assembly_part_class; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN assemblies_parts.assembly_part_class IS 'Assembly Part Class';


--
-- Name: COLUMN assemblies_parts.assembly_part_name; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN assemblies_parts.assembly_part_name IS 'Assembly Part Name Describes Purpose of Assembly Part';


--
-- Name: COLUMN assemblies_parts.assembly_part_currency; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN assemblies_parts.assembly_part_currency IS 'Assembly Part Currency';


--
-- Name: assemblies_parts_assembly_part_id_seq; Type: SEQUENCE; Schema: public; Owner: bencon
--

CREATE SEQUENCE assemblies_parts_assembly_part_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assemblies_parts_assembly_part_id_seq OWNER TO bencon;

--
-- Name: assemblies_parts_assembly_part_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bencon
--

ALTER SEQUENCE assemblies_parts_assembly_part_id_seq OWNED BY assemblies_parts.assembly_part_id;


--
-- Name: assemblies_parts_assembly_part_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bencon
--

SELECT pg_catalog.setval('assemblies_parts_assembly_part_id_seq', 1, true);


--
-- Name: countries; Type: TABLE; Schema: public; Owner: bencon; Tablespace: 
--

CREATE TABLE countries (
    country text NOT NULL,
    country_id integer NOT NULL
);


ALTER TABLE public.countries OWNER TO bencon;

--
-- Name: TABLE countries; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON TABLE countries IS 'Countries where each table item is used in';


--
-- Name: COLUMN countries.country; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN countries.country IS 'Country';


--
-- Name: COLUMN countries.country_id; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN countries.country_id IS 'Country ID';


--
-- Name: countries_country_id_seq; Type: SEQUENCE; Schema: public; Owner: bencon
--

CREATE SEQUENCE countries_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.countries_country_id_seq OWNER TO bencon;

--
-- Name: countries_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bencon
--

ALTER SEQUENCE countries_country_id_seq OWNED BY countries.country_id;


--
-- Name: countries_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bencon
--

SELECT pg_catalog.setval('countries_country_id_seq', 1, true);


--
-- Name: currencies; Type: TABLE; Schema: public; Owner: bencon; Tablespace: 
--

CREATE TABLE currencies (
    currency_id integer NOT NULL,
    currency text NOT NULL
);


ALTER TABLE public.currencies OWNER TO bencon;

--
-- Name: TABLE currencies; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON TABLE currencies IS 'Country currency used for each item. Exchange rates are NOT incorporated yet';


--
-- Name: COLUMN currencies.currency_id; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN currencies.currency_id IS 'Currency ID';


--
-- Name: COLUMN currencies.currency; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN currencies.currency IS 'Currency';


--
-- Name: currencies_currency_id_seq; Type: SEQUENCE; Schema: public; Owner: bencon
--

CREATE SEQUENCE currencies_currency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.currencies_currency_id_seq OWNER TO bencon;

--
-- Name: currencies_currency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bencon
--

ALTER SEQUENCE currencies_currency_id_seq OWNED BY currencies.currency_id;


--
-- Name: currencies_currency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bencon
--

SELECT pg_catalog.setval('currencies_currency_id_seq', 1, true);


--
-- Name: customers; Type: TABLE; Schema: public; Owner: bencon; Tablespace: 
--

CREATE TABLE customers (
    cust_id integer NOT NULL,
    cust_bill_notes text,
    cust_bill_email2 text,
    cust_bill_email text,
    cust_bill_phone_fax character varying(35),
    cust_bill_phone_work2 character varying(35),
    cust_bill_phone_work character varying(35),
    cust_bill_phone_cell2 character varying(35),
    cust_bill_phone_cell character varying(35),
    cust_bill_phone_home character varying(35),
    cust_bill_zip character varying(20),
    cust_bill_state text DEFAULT 'TX'::character varying,
    cust_bill_city text,
    cust_bill_street_addr2 text,
    cust_bill_street_addr text,
    cust_bill_business_name text,
    residential_or_commercial character(1) NOT NULL,
    cust_bill_lname2 text,
    cust_bill_fname2 text,
    cust_bill_lname text,
    cust_bill_fname text,
    cust_bill_country text NOT NULL,
    CONSTRAINT residential_or_commercial CHECK (((residential_or_commercial = 'R'::bpchar) OR (residential_or_commercial = 'C'::bpchar)))
);


ALTER TABLE public.customers OWNER TO bencon;

--
-- Name: TABLE customers; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON TABLE customers IS 'Customers who buy products and services';


--
-- Name: COLUMN customers.cust_id; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN customers.cust_id IS 'Customer ID Number';


--
-- Name: COLUMN customers.cust_bill_notes; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN customers.cust_bill_notes IS 'Notes about Customer';


--
-- Name: COLUMN customers.cust_bill_email2; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN customers.cust_bill_email2 IS 'Second Customer Email';


--
-- Name: COLUMN customers.cust_bill_email; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN customers.cust_bill_email IS 'Customer Email';


--
-- Name: COLUMN customers.cust_bill_phone_fax; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN customers.cust_bill_phone_fax IS 'Customer Fax';


--
-- Name: COLUMN customers.cust_bill_phone_work2; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN customers.cust_bill_phone_work2 IS 'Second Customer Work Phone';


--
-- Name: COLUMN customers.cust_bill_phone_work; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN customers.cust_bill_phone_work IS 'Customer Work Phone';


--
-- Name: COLUMN customers.cust_bill_phone_cell2; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN customers.cust_bill_phone_cell2 IS 'Second Customer Cell Phone';


--
-- Name: COLUMN customers.cust_bill_phone_cell; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN customers.cust_bill_phone_cell IS 'Customer Cell Phone';


--
-- Name: COLUMN customers.cust_bill_phone_home; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN customers.cust_bill_phone_home IS 'Customer Home Phone';


--
-- Name: COLUMN customers.cust_bill_zip; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN customers.cust_bill_zip IS 'Customer Zip Code';


--
-- Name: COLUMN customers.cust_bill_state; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN customers.cust_bill_state IS 'Customer State';


--
-- Name: COLUMN customers.cust_bill_city; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN customers.cust_bill_city IS 'Customer City';


--
-- Name: COLUMN customers.cust_bill_street_addr2; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN customers.cust_bill_street_addr2 IS 'Customer Street Address cont.';


--
-- Name: COLUMN customers.cust_bill_street_addr; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN customers.cust_bill_street_addr IS 'Customer Street Address';


--
-- Name: COLUMN customers.cust_bill_business_name; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN customers.cust_bill_business_name IS 'Business Name for Customer';


--
-- Name: COLUMN customers.residential_or_commercial; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN customers.residential_or_commercial IS 'Customer is Commercial or Residential';


--
-- Name: COLUMN customers.cust_bill_lname2; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN customers.cust_bill_lname2 IS 'Second Customer Last Name';


--
-- Name: COLUMN customers.cust_bill_fname2; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN customers.cust_bill_fname2 IS 'Second Customer First Name';


--
-- Name: COLUMN customers.cust_bill_lname; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN customers.cust_bill_lname IS 'Customer Last Name';


--
-- Name: COLUMN customers.cust_bill_fname; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN customers.cust_bill_fname IS 'Customer First Name';


--
-- Name: COLUMN customers.cust_bill_country; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN customers.cust_bill_country IS 'Customer Country';


--
-- Name: customers_cust_id_seq; Type: SEQUENCE; Schema: public; Owner: bencon
--

CREATE SEQUENCE customers_cust_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_cust_id_seq OWNER TO bencon;

--
-- Name: customers_cust_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bencon
--

ALTER SEQUENCE customers_cust_id_seq OWNED BY customers.cust_id;


--
-- Name: customers_cust_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bencon
--

SELECT pg_catalog.setval('customers_cust_id_seq', 1, true);


--
-- Name: full_assembly; Type: TABLE; Schema: public; Owner: bencon; Tablespace: 
--

CREATE TABLE full_assembly (
    full_assembly_id integer NOT NULL,
    full_assembly_notes text,
    full_assembly_url text,
    full_assembly_full_assembly_list_id integer,
    full_assembly_assembly_id integer NOT NULL,
    full_assembly_assembly_rowtotal numeric(10,2) NOT NULL,
    full_assembly_assembly_subtotal numeric(10,2) NOT NULL,
    full_assembly_assembly_quantity integer NOT NULL,
    full_assembly_name text NOT NULL,
    full_assembly_currency text DEFAULT 'USD'::text NOT NULL
);


ALTER TABLE public.full_assembly OWNER TO bencon;

--
-- Name: TABLE full_assembly; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON TABLE full_assembly IS 'Completed full assemblies made from assemblies';


--
-- Name: COLUMN full_assembly.full_assembly_id; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN full_assembly.full_assembly_id IS 'Full Assembly ID';


--
-- Name: COLUMN full_assembly.full_assembly_notes; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN full_assembly.full_assembly_notes IS 'Full Assembly Notes';


--
-- Name: COLUMN full_assembly.full_assembly_url; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN full_assembly.full_assembly_url IS 'URL on our Website to Fully Display Full Assembly';


--
-- Name: COLUMN full_assembly.full_assembly_full_assembly_list_id; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN full_assembly.full_assembly_full_assembly_list_id IS 'Full Assembly Full Assembly List ID';


--
-- Name: COLUMN full_assembly.full_assembly_assembly_id; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN full_assembly.full_assembly_assembly_id IS 'Full Assembly Assembly ID';


--
-- Name: COLUMN full_assembly.full_assembly_assembly_rowtotal; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN full_assembly.full_assembly_assembly_rowtotal IS 'Full Assembly Assembly Rowtotal is Assembly Quantity times Assembly Subtotal';


--
-- Name: COLUMN full_assembly.full_assembly_assembly_subtotal; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN full_assembly.full_assembly_assembly_subtotal IS 'Full Assembly Assembly Subtotal';


--
-- Name: COLUMN full_assembly.full_assembly_assembly_quantity; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN full_assembly.full_assembly_assembly_quantity IS 'Full Assembly Assembly Quantity Used';


--
-- Name: COLUMN full_assembly.full_assembly_name; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN full_assembly.full_assembly_name IS 'Full Assembly Name';


--
-- Name: COLUMN full_assembly.full_assembly_currency; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN full_assembly.full_assembly_currency IS 'Full Assembly Currency';


--
-- Name: full_assembly_full_assembly_id_seq; Type: SEQUENCE; Schema: public; Owner: bencon
--

CREATE SEQUENCE full_assembly_full_assembly_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.full_assembly_full_assembly_id_seq OWNER TO bencon;

--
-- Name: full_assembly_full_assembly_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bencon
--

ALTER SEQUENCE full_assembly_full_assembly_id_seq OWNED BY full_assembly.full_assembly_id;


--
-- Name: full_assembly_full_assembly_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bencon
--

SELECT pg_catalog.setval('full_assembly_full_assembly_id_seq', 1, true);


--
-- Name: full_assembly_list; Type: TABLE; Schema: public; Owner: bencon; Tablespace: 
--

CREATE TABLE full_assembly_list (
    full_assembly_list_id integer NOT NULL,
    full_assembly_list_notes text,
    full_assembly_list_total numeric(10,2),
    full_assembly_list_subcategory text,
    full_assembly_list_category text,
    full_assembly_list_name text NOT NULL,
    full_assembly_list_currency text DEFAULT 'USD'::text NOT NULL
);


ALTER TABLE public.full_assembly_list OWNER TO bencon;

--
-- Name: TABLE full_assembly_list; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON TABLE full_assembly_list IS 'Condensed list of full assemblies showing price total and other details';


--
-- Name: COLUMN full_assembly_list.full_assembly_list_id; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN full_assembly_list.full_assembly_list_id IS 'Full Assembly List Id';


--
-- Name: COLUMN full_assembly_list.full_assembly_list_notes; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN full_assembly_list.full_assembly_list_notes IS 'Full Assembly List Notes';


--
-- Name: COLUMN full_assembly_list.full_assembly_list_total; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN full_assembly_list.full_assembly_list_total IS 'Full Assembly List Total';


--
-- Name: COLUMN full_assembly_list.full_assembly_list_subcategory; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN full_assembly_list.full_assembly_list_subcategory IS 'Full Assembly List Subcategory';


--
-- Name: COLUMN full_assembly_list.full_assembly_list_category; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN full_assembly_list.full_assembly_list_category IS 'Full Assembly List Category';


--
-- Name: COLUMN full_assembly_list.full_assembly_list_name; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN full_assembly_list.full_assembly_list_name IS 'Full Assembly List Name is Copy of Full Assembly Name';


--
-- Name: COLUMN full_assembly_list.full_assembly_list_currency; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN full_assembly_list.full_assembly_list_currency IS 'Full Assembly List Currency';


--
-- Name: full_assembly_list_id_seq; Type: SEQUENCE; Schema: public; Owner: bencon
--

CREATE SEQUENCE full_assembly_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.full_assembly_list_id_seq OWNER TO bencon;

--
-- Name: full_assembly_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bencon
--

ALTER SEQUENCE full_assembly_list_id_seq OWNED BY full_assembly_list.full_assembly_list_id;


--
-- Name: full_assembly_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bencon
--

SELECT pg_catalog.setval('full_assembly_list_id_seq', 1, true);


--
-- Name: jobsites; Type: TABLE; Schema: public; Owner: bencon; Tablespace: 
--

CREATE TABLE jobsites (
    jobsite_id integer NOT NULL,
    jobsite_notes text,
    jobsite_website text,
    jobsite_phone_work2 character varying(35),
    jobsite_phone_cell2 character varying(35),
    jobsite_email text,
    jobsite_phone_fax character varying(35),
    jobsite_phone_work character varying(35),
    jobsite_phone_cell character varying(35),
    jobsite_phone_home character varying(35),
    jobsite_zip character varying(20),
    jobsite_state text DEFAULT 'TX'::text,
    jobsite_city text,
    jobsite_street_addr2 text,
    jobsite_street_addr text,
    jobsite_business_name text,
    residential_or_commercial character(1) NOT NULL,
    cust_id integer NOT NULL,
    jobsite_country text NOT NULL,
    CONSTRAINT residential_or_commercial CHECK (((residential_or_commercial = 'R'::bpchar) OR (residential_or_commercial = 'C'::bpchar)))
);


ALTER TABLE public.jobsites OWNER TO bencon;

--
-- Name: TABLE jobsites; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON TABLE jobsites IS 'Physical locations for each customer''s different jobs';


--
-- Name: COLUMN jobsites.jobsite_id; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN jobsites.jobsite_id IS 'Jobsite ID';


--
-- Name: COLUMN jobsites.jobsite_notes; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN jobsites.jobsite_notes IS 'Jobsite Notes';


--
-- Name: COLUMN jobsites.jobsite_website; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN jobsites.jobsite_website IS 'Jobsite Website';


--
-- Name: COLUMN jobsites.jobsite_phone_work2; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN jobsites.jobsite_phone_work2 IS 'Second Jobsite Work Phone';


--
-- Name: COLUMN jobsites.jobsite_phone_cell2; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN jobsites.jobsite_phone_cell2 IS 'Second Jobsite Cell Phone';


--
-- Name: COLUMN jobsites.jobsite_email; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN jobsites.jobsite_email IS 'Jobsite Email Address';


--
-- Name: COLUMN jobsites.jobsite_phone_fax; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN jobsites.jobsite_phone_fax IS 'Jobsite Fax';


--
-- Name: COLUMN jobsites.jobsite_phone_work; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN jobsites.jobsite_phone_work IS 'Jobsite Work Phone';


--
-- Name: COLUMN jobsites.jobsite_phone_cell; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN jobsites.jobsite_phone_cell IS 'Jobsite Cell Phone';


--
-- Name: COLUMN jobsites.jobsite_phone_home; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN jobsites.jobsite_phone_home IS 'Jobsite Home Phone';


--
-- Name: COLUMN jobsites.jobsite_zip; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN jobsites.jobsite_zip IS 'Jobsite Zip Code';


--
-- Name: COLUMN jobsites.jobsite_state; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN jobsites.jobsite_state IS 'Jobsite State';


--
-- Name: COLUMN jobsites.jobsite_city; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN jobsites.jobsite_city IS 'Jobsite City';


--
-- Name: COLUMN jobsites.jobsite_street_addr2; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN jobsites.jobsite_street_addr2 IS 'Jobsite Street Address cont.';


--
-- Name: COLUMN jobsites.jobsite_street_addr; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN jobsites.jobsite_street_addr IS 'Jobsite Street Address';


--
-- Name: COLUMN jobsites.jobsite_business_name; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN jobsites.jobsite_business_name IS 'Jobsite Business Name';


--
-- Name: COLUMN jobsites.residential_or_commercial; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN jobsites.residential_or_commercial IS 'Jobsite Customer is Commercial or Residential';


--
-- Name: COLUMN jobsites.cust_id; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN jobsites.cust_id IS 'Jobsite for Customer ID';


--
-- Name: COLUMN jobsites.jobsite_country; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN jobsites.jobsite_country IS 'Jobsite Country';


--
-- Name: jobsites_jobsite_id_seq; Type: SEQUENCE; Schema: public; Owner: bencon
--

CREATE SEQUENCE jobsites_jobsite_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobsites_jobsite_id_seq OWNER TO bencon;

--
-- Name: jobsites_jobsite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bencon
--

ALTER SEQUENCE jobsites_jobsite_id_seq OWNED BY jobsites.jobsite_id;


--
-- Name: jobsites_jobsite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bencon
--

SELECT pg_catalog.setval('jobsites_jobsite_id_seq', 1, true);


--
-- Name: products; Type: TABLE; Schema: public; Owner: bencon; Tablespace: 
--

CREATE TABLE products (
    product_id integer NOT NULL,
    product_notes text,
    product_url text,
    check_days text DEFAULT '13'::text NOT NULL,
    up_date date DEFAULT now() NOT NULL,
    vendor_name text NOT NULL,
    model character varying(100),
    sku character varying(100),
    price numeric(10,2) NOT NULL,
    subclass character varying(100),
    class character varying(100),
    product_description text,
    product_currency text DEFAULT 'USD'::text NOT NULL,
    CONSTRAINT check_days_max CHECK (((check_days)::integer < 29)),
    CONSTRAINT check_days_min CHECK (((check_days)::integer > 0))
);


ALTER TABLE public.products OWNER TO bencon;

--
-- Name: TABLE products; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON TABLE products IS 'Detailed product information from each vendor';


--
-- Name: COLUMN products.product_id; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN products.product_id IS 'Product ID';


--
-- Name: COLUMN products.product_notes; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN products.product_notes IS 'Product Notes';


--
-- Name: COLUMN products.product_url; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN products.product_url IS 'Product URL on Vendor Website';


--
-- Name: COLUMN products.check_days; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN products.check_days IS 'Days to Update Product Information on Vendor Website';


--
-- Name: COLUMN products.up_date; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN products.up_date IS 'Last Date Product Had Important Information Updated';


--
-- Name: COLUMN products.vendor_name; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN products.vendor_name IS 'Vendor Name for Product';


--
-- Name: COLUMN products.model; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN products.model IS 'Product Model';


--
-- Name: COLUMN products.sku; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN products.sku IS 'Product SKU';


--
-- Name: COLUMN products.price; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN products.price IS 'Product Price';


--
-- Name: COLUMN products.subclass; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN products.subclass IS 'Product Subclass';


--
-- Name: COLUMN products.class; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN products.class IS 'Product Class';


--
-- Name: COLUMN products.product_description; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN products.product_description IS 'Product Description, Manually Entered or from Vendor Website';


--
-- Name: COLUMN products.product_currency; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN products.product_currency IS 'Product Currency';


--
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: bencon
--

CREATE SEQUENCE products_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_id_seq OWNER TO bencon;

--
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bencon
--

ALTER SEQUENCE products_product_id_seq OWNED BY products.product_id;


--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bencon
--

SELECT pg_catalog.setval('products_product_id_seq', 1, true);


--
-- Name: vendor_contacts; Type: TABLE; Schema: public; Owner: bencon; Tablespace: 
--

CREATE TABLE vendor_contacts (
    vend_contact_id integer NOT NULL,
    ven_contact_notes text,
    ven_contact_home_phone character varying(35),
    ven_contact_fax character varying(35),
    ven_contact_email text,
    ven_contact_cell_phone character varying(35),
    ven_contact_phone character varying(35),
    ven_contact_lname text,
    ven_contact_fname text,
    vendor_name text NOT NULL,
    ven_contact_country text NOT NULL
);


ALTER TABLE public.vendor_contacts OWNER TO bencon;

--
-- Name: TABLE vendor_contacts; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON TABLE vendor_contacts IS 'Individual contacts for each vendor';


--
-- Name: COLUMN vendor_contacts.vend_contact_id; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN vendor_contacts.vend_contact_id IS 'Vendor Contact ID';


--
-- Name: COLUMN vendor_contacts.ven_contact_notes; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN vendor_contacts.ven_contact_notes IS 'Notes about Vendor Contact';


--
-- Name: COLUMN vendor_contacts.ven_contact_home_phone; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN vendor_contacts.ven_contact_home_phone IS 'Vendor Contact Home Phone';


--
-- Name: COLUMN vendor_contacts.ven_contact_fax; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN vendor_contacts.ven_contact_fax IS 'Vendor Contact Fax';


--
-- Name: COLUMN vendor_contacts.ven_contact_email; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN vendor_contacts.ven_contact_email IS 'Vendor Contact Email Address';


--
-- Name: COLUMN vendor_contacts.ven_contact_cell_phone; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN vendor_contacts.ven_contact_cell_phone IS 'Vendor Contact Cell Phone';


--
-- Name: COLUMN vendor_contacts.ven_contact_phone; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN vendor_contacts.ven_contact_phone IS 'Vendor Contact Phone';


--
-- Name: COLUMN vendor_contacts.ven_contact_lname; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN vendor_contacts.ven_contact_lname IS 'Vendor Contact Last Name';


--
-- Name: COLUMN vendor_contacts.ven_contact_fname; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN vendor_contacts.ven_contact_fname IS 'Vendor Contact First Name';


--
-- Name: COLUMN vendor_contacts.vendor_name; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN vendor_contacts.vendor_name IS 'Vendor Name of Contact';


--
-- Name: COLUMN vendor_contacts.ven_contact_country; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN vendor_contacts.ven_contact_country IS 'Vendor Contact Country';


--
-- Name: vendor_contacts_vend_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: bencon
--

CREATE SEQUENCE vendor_contacts_vend_contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendor_contacts_vend_contact_id_seq OWNER TO bencon;

--
-- Name: vendor_contacts_vend_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bencon
--

ALTER SEQUENCE vendor_contacts_vend_contact_id_seq OWNED BY vendor_contacts.vend_contact_id;


--
-- Name: vendor_contacts_vend_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bencon
--

SELECT pg_catalog.setval('vendor_contacts_vend_contact_id_seq', 1, true);


--
-- Name: vendors; Type: TABLE; Schema: public; Owner: bencon; Tablespace: 
--

CREATE TABLE vendors (
    vendor_id integer NOT NULL,
    vendor_notes text,
    vendor_email text,
    vendor_phone2 character varying(35),
    search_access text,
    vendor_fax character varying(35),
    vendor_website text,
    hours_open character varying(100),
    vendor_phone character varying(35),
    vendor_zip character varying(20),
    vendor_state text DEFAULT 'TX'::text,
    vendor_city text,
    vendor_street_address2 text,
    vendor_street_address text,
    vendor_name text NOT NULL,
    vendor_country text NOT NULL,
    vendor_currency text DEFAULT 'USD'::text NOT NULL
);


ALTER TABLE public.vendors OWNER TO bencon;

--
-- Name: TABLE vendors; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON TABLE vendors IS 'Vendors who provide products or services. See labor database for contractors and employees';


--
-- Name: COLUMN vendors.vendor_id; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN vendors.vendor_id IS 'Vendor ID';


--
-- Name: COLUMN vendors.vendor_notes; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN vendors.vendor_notes IS 'Notes about Vendor';


--
-- Name: COLUMN vendors.vendor_email; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN vendors.vendor_email IS 'Vendor Email';


--
-- Name: COLUMN vendors.vendor_phone2; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN vendors.vendor_phone2 IS 'Second Vendor Phone';


--
-- Name: COLUMN vendors.search_access; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN vendors.search_access IS 'Web Address for Updating Program to Use';


--
-- Name: COLUMN vendors.vendor_fax; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN vendors.vendor_fax IS 'Vendor Fax';


--
-- Name: COLUMN vendors.vendor_website; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN vendors.vendor_website IS 'Vendor Web Site';


--
-- Name: COLUMN vendors.hours_open; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN vendors.hours_open IS 'Hours Vendor is Open';


--
-- Name: COLUMN vendors.vendor_phone; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN vendors.vendor_phone IS 'Vendor Phone';


--
-- Name: COLUMN vendors.vendor_zip; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN vendors.vendor_zip IS 'Vendor Zip Code';


--
-- Name: COLUMN vendors.vendor_state; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN vendors.vendor_state IS 'Vendor State';


--
-- Name: COLUMN vendors.vendor_city; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN vendors.vendor_city IS 'Vendor City';


--
-- Name: COLUMN vendors.vendor_street_address2; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN vendors.vendor_street_address2 IS 'Vendor Street Address cont.';


--
-- Name: COLUMN vendors.vendor_street_address; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN vendors.vendor_street_address IS 'Vendor Street Address';


--
-- Name: COLUMN vendors.vendor_name; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN vendors.vendor_name IS 'Vendor Name';


--
-- Name: COLUMN vendors.vendor_country; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN vendors.vendor_country IS 'Vendor Country';


--
-- Name: vendors_vendor_id_seq; Type: SEQUENCE; Schema: public; Owner: bencon
--

CREATE SEQUENCE vendors_vendor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendors_vendor_id_seq OWNER TO bencon;

--
-- Name: vendors_vendor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bencon
--

ALTER SEQUENCE vendors_vendor_id_seq OWNED BY vendors.vendor_id;


--
-- Name: vendors_vendor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bencon
--

SELECT pg_catalog.setval('vendors_vendor_id_seq', 1, true);


--
-- Name: assembly_id; Type: DEFAULT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY assemblies ALTER COLUMN assembly_id SET DEFAULT nextval('assemblies_assembly_id_seq'::regclass);


--
-- Name: assembly_part_id; Type: DEFAULT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY assemblies_parts ALTER COLUMN assembly_part_id SET DEFAULT nextval('assemblies_parts_assembly_part_id_seq'::regclass);


--
-- Name: country_id; Type: DEFAULT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY countries ALTER COLUMN country_id SET DEFAULT nextval('countries_country_id_seq'::regclass);


--
-- Name: currency_id; Type: DEFAULT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY currencies ALTER COLUMN currency_id SET DEFAULT nextval('currencies_currency_id_seq'::regclass);


--
-- Name: cust_id; Type: DEFAULT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY customers ALTER COLUMN cust_id SET DEFAULT nextval('customers_cust_id_seq'::regclass);


--
-- Name: full_assembly_id; Type: DEFAULT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY full_assembly ALTER COLUMN full_assembly_id SET DEFAULT nextval('full_assembly_full_assembly_id_seq'::regclass);


--
-- Name: full_assembly_list_id; Type: DEFAULT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY full_assembly_list ALTER COLUMN full_assembly_list_id SET DEFAULT nextval('full_assembly_list_id_seq'::regclass);


--
-- Name: jobsite_id; Type: DEFAULT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY jobsites ALTER COLUMN jobsite_id SET DEFAULT nextval('jobsites_jobsite_id_seq'::regclass);


--
-- Name: product_id; Type: DEFAULT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY products ALTER COLUMN product_id SET DEFAULT nextval('products_product_id_seq'::regclass);


--
-- Name: vend_contact_id; Type: DEFAULT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY vendor_contacts ALTER COLUMN vend_contact_id SET DEFAULT nextval('vendor_contacts_vend_contact_id_seq'::regclass);


--
-- Name: vendor_id; Type: DEFAULT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY vendors ALTER COLUMN vendor_id SET DEFAULT nextval('vendors_vendor_id_seq'::regclass);


--
-- Data for Name: assemblies; Type: TABLE DATA; Schema: public; Owner: bencon
--

COPY assemblies (assembly_id, assembly_notes, assembly_url, assembly_subtotal, assembly_category, assembly_description, assembly_name, assembly_currency) FROM stdin;
\.


--
-- Data for Name: assemblies_parts; Type: TABLE DATA; Schema: public; Owner: bencon
--

COPY assemblies_parts (assembly_part_id, assembly_part_notes, assembly_part_assembly_id, assembly_part_subtotal, assembly_part_quantity, assembly_part_product_id, assembly_part_description, assembly_part_subclass, assembly_part_class, assembly_part_name, assembly_part_currency) FROM stdin;
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: bencon
--

COPY countries (country, country_id) FROM stdin;
\.


--
-- Data for Name: currencies; Type: TABLE DATA; Schema: public; Owner: bencon
--

COPY currencies (currency_id, currency) FROM stdin;
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: bencon
--

COPY customers (cust_id, cust_bill_notes, cust_bill_email2, cust_bill_email, cust_bill_phone_fax, cust_bill_phone_work2, cust_bill_phone_work, cust_bill_phone_cell2, cust_bill_phone_cell, cust_bill_phone_home, cust_bill_zip, cust_bill_state, cust_bill_city, cust_bill_street_addr2, cust_bill_street_addr, cust_bill_business_name, residential_or_commercial, cust_bill_lname2, cust_bill_fname2, cust_bill_lname, cust_bill_fname, cust_bill_country) FROM stdin;
\.


--
-- Data for Name: full_assembly; Type: TABLE DATA; Schema: public; Owner: bencon
--

COPY full_assembly (full_assembly_id, full_assembly_notes, full_assembly_url, full_assembly_full_assembly_list_id, full_assembly_assembly_id, full_assembly_assembly_rowtotal, full_assembly_assembly_subtotal, full_assembly_assembly_quantity, full_assembly_name, full_assembly_currency) FROM stdin;
\.


--
-- Data for Name: full_assembly_list; Type: TABLE DATA; Schema: public; Owner: bencon
--

COPY full_assembly_list (full_assembly_list_id, full_assembly_list_notes, full_assembly_list_total, full_assembly_list_subcategory, full_assembly_list_category, full_assembly_list_name, full_assembly_list_currency) FROM stdin;
\.


--
-- Data for Name: jobsites; Type: TABLE DATA; Schema: public; Owner: bencon
--

COPY jobsites (jobsite_id, jobsite_notes, jobsite_website, jobsite_phone_work2, jobsite_phone_cell2, jobsite_email, jobsite_phone_fax, jobsite_phone_work, jobsite_phone_cell, jobsite_phone_home, jobsite_zip, jobsite_state, jobsite_city, jobsite_street_addr2, jobsite_street_addr, jobsite_business_name, residential_or_commercial, cust_id, jobsite_country) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: bencon
--

COPY products (product_id, product_notes, product_url, check_days, up_date, vendor_name, model, sku, price, subclass, class, product_description, product_currency) FROM stdin;
\.


--
-- Data for Name: vendor_contacts; Type: TABLE DATA; Schema: public; Owner: bencon
--

COPY vendor_contacts (vend_contact_id, ven_contact_notes, ven_contact_home_phone, ven_contact_fax, ven_contact_email, ven_contact_cell_phone, ven_contact_phone, ven_contact_lname, ven_contact_fname, vendor_name, ven_contact_country) FROM stdin;
\.


--
-- Data for Name: vendors; Type: TABLE DATA; Schema: public; Owner: bencon
--

COPY vendors (vendor_id, vendor_notes, vendor_email, vendor_phone2, search_access, vendor_fax, vendor_website, hours_open, vendor_phone, vendor_zip, vendor_state, vendor_city, vendor_street_address2, vendor_street_address, vendor_name, vendor_country, vendor_currency) FROM stdin;
\.


--
-- Name: assemblies_parts_pkey; Type: CONSTRAINT; Schema: public; Owner: bencon; Tablespace: 
--

ALTER TABLE ONLY assemblies_parts
    ADD CONSTRAINT assemblies_parts_pkey PRIMARY KEY (assembly_part_id);


--
-- Name: assemblies_pkey; Type: CONSTRAINT; Schema: public; Owner: bencon; Tablespace: 
--

ALTER TABLE ONLY assemblies
    ADD CONSTRAINT assemblies_pkey PRIMARY KEY (assembly_id);


--
-- Name: assembly_name_key; Type: CONSTRAINT; Schema: public; Owner: bencon; Tablespace: 
--

ALTER TABLE ONLY assemblies
    ADD CONSTRAINT assembly_name_key UNIQUE (assembly_name);


--
-- Name: countries_pkey; Type: CONSTRAINT; Schema: public; Owner: bencon; Tablespace: 
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (country_id);


--
-- Name: country_key; Type: CONSTRAINT; Schema: public; Owner: bencon; Tablespace: 
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT country_key UNIQUE (country);


--
-- Name: currencies_pkey; Type: CONSTRAINT; Schema: public; Owner: bencon; Tablespace: 
--

ALTER TABLE ONLY currencies
    ADD CONSTRAINT currencies_pkey PRIMARY KEY (currency_id);


--
-- Name: currency_key; Type: CONSTRAINT; Schema: public; Owner: bencon; Tablespace: 
--

ALTER TABLE ONLY currencies
    ADD CONSTRAINT currency_key UNIQUE (currency);


--
-- Name: customers_pkey; Type: CONSTRAINT; Schema: public; Owner: bencon; Tablespace: 
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (cust_id);


--
-- Name: full_assembly_list_name_key; Type: CONSTRAINT; Schema: public; Owner: bencon; Tablespace: 
--

ALTER TABLE ONLY full_assembly_list
    ADD CONSTRAINT full_assembly_list_name_key UNIQUE (full_assembly_list_name);


--
-- Name: full_assembly_list_pkey; Type: CONSTRAINT; Schema: public; Owner: bencon; Tablespace: 
--

ALTER TABLE ONLY full_assembly_list
    ADD CONSTRAINT full_assembly_list_pkey PRIMARY KEY (full_assembly_list_id);


--
-- Name: full_assembly_pkey; Type: CONSTRAINT; Schema: public; Owner: bencon; Tablespace: 
--

ALTER TABLE ONLY full_assembly
    ADD CONSTRAINT full_assembly_pkey PRIMARY KEY (full_assembly_id);


--
-- Name: jobsites_pkey; Type: CONSTRAINT; Schema: public; Owner: bencon; Tablespace: 
--

ALTER TABLE ONLY jobsites
    ADD CONSTRAINT jobsites_pkey PRIMARY KEY (jobsite_id);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: bencon; Tablespace: 
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- Name: vendor_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: bencon; Tablespace: 
--

ALTER TABLE ONLY vendor_contacts
    ADD CONSTRAINT vendor_contacts_pkey PRIMARY KEY (vend_contact_id);


--
-- Name: vendor_name; Type: CONSTRAINT; Schema: public; Owner: bencon; Tablespace: 
--

ALTER TABLE ONLY vendors
    ADD CONSTRAINT vendor_name UNIQUE (vendor_name);


--
-- Name: vendors_pkey; Type: CONSTRAINT; Schema: public; Owner: bencon; Tablespace: 
--

ALTER TABLE ONLY vendors
    ADD CONSTRAINT vendors_pkey PRIMARY KEY (vendor_id);


--
-- Name: cust_id_residential_or_commercial_key; Type: INDEX; Schema: public; Owner: bencon; Tablespace: 
--

CREATE UNIQUE INDEX cust_id_residential_or_commercial_key ON customers USING btree (cust_id, residential_or_commercial);


--
-- Name: assembly_part_description_insert_trigger; Type: TRIGGER; Schema: public; Owner: bencon
--

CREATE TRIGGER assembly_part_description_insert_trigger BEFORE INSERT ON assemblies_parts FOR EACH ROW EXECUTE PROCEDURE assembly_part_description();


--
-- Name: assembly_part_description_product_description_update_trigger; Type: TRIGGER; Schema: public; Owner: bencon
--

CREATE TRIGGER assembly_part_description_product_description_update_trigger AFTER UPDATE OF product_description ON products FOR EACH ROW WHEN ((old.product_description IS DISTINCT FROM new.product_description)) EXECUTE PROCEDURE assembly_part_description_product_description_update();


--
-- Name: assembly_part_description_update_trigger; Type: TRIGGER; Schema: public; Owner: bencon
--

CREATE TRIGGER assembly_part_description_update_trigger BEFORE UPDATE OF assembly_part_product_id ON assemblies_parts FOR EACH ROW EXECUTE PROCEDURE assembly_part_description();


--
-- Name: full_assembly_full_assembly_list_id_reset_trigger; Type: TRIGGER; Schema: public; Owner: bencon
--

CREATE TRIGGER full_assembly_full_assembly_list_id_reset_trigger AFTER UPDATE ON full_assembly_list FOR EACH ROW WHEN ((old.full_assembly_list_name IS DISTINCT FROM new.full_assembly_list_name)) EXECUTE PROCEDURE full_assembly_full_assembly_list_id_update();


--
-- Name: full_assembly_full_assembly_list_id_update_trigger; Type: TRIGGER; Schema: public; Owner: bencon
--

CREATE TRIGGER full_assembly_full_assembly_list_id_update_trigger AFTER INSERT ON full_assembly_list FOR EACH ROW EXECUTE PROCEDURE full_assembly_full_assembly_list_id_update();


--
-- Name: full_assembly_list_total_full_assembly_delete_run_trigger; Type: TRIGGER; Schema: public; Owner: bencon
--

CREATE TRIGGER full_assembly_list_total_full_assembly_delete_run_trigger AFTER DELETE ON full_assembly FOR EACH ROW EXECUTE PROCEDURE full_assembly_list_total_full_assembly_delete_run();


--
-- Name: full_assembly_list_total_insert_trigger; Type: TRIGGER; Schema: public; Owner: bencon
--

CREATE TRIGGER full_assembly_list_total_insert_trigger BEFORE INSERT ON full_assembly_list FOR EACH ROW EXECUTE PROCEDURE full_assembly_list_total_insert();


--
-- Name: full_assembly_list_total_update_insert_trigger; Type: TRIGGER; Schema: public; Owner: bencon
--

CREATE TRIGGER full_assembly_list_total_update_insert_trigger AFTER INSERT ON full_assembly FOR EACH ROW EXECUTE PROCEDURE full_assembly_list_total_update();


--
-- Name: full_assembly_list_total_update_name_trigger; Type: TRIGGER; Schema: public; Owner: bencon
--

CREATE TRIGGER full_assembly_list_total_update_name_trigger AFTER UPDATE ON full_assembly_list FOR EACH ROW WHEN ((old.full_assembly_list_name IS DISTINCT FROM new.full_assembly_list_name)) EXECUTE PROCEDURE full_assembly_list_total_update();


--
-- Name: full_assembly_list_total_update_trigger; Type: TRIGGER; Schema: public; Owner: bencon
--

CREATE TRIGGER full_assembly_list_total_update_trigger AFTER UPDATE ON full_assembly FOR EACH ROW WHEN ((old.full_assembly_assembly_rowtotal IS DISTINCT FROM new.full_assembly_assembly_rowtotal)) EXECUTE PROCEDURE full_assembly_list_total_update();


--
-- Name: sum_assembly_part_insert_subtotal_trigger; Type: TRIGGER; Schema: public; Owner: bencon
--

CREATE TRIGGER sum_assembly_part_insert_subtotal_trigger BEFORE INSERT ON assemblies_parts FOR EACH ROW EXECUTE PROCEDURE sum_assembly_part_subtotal();


--
-- Name: sum_assembly_part_subtotal_update2_trigger; Type: TRIGGER; Schema: public; Owner: bencon
--

CREATE TRIGGER sum_assembly_part_subtotal_update2_trigger AFTER UPDATE OF price ON products FOR EACH ROW WHEN ((old.price IS DISTINCT FROM new.price)) EXECUTE PROCEDURE sum_assembly_part_subtotal_update2();


--
-- Name: sum_assembly_part_subtotal_updatettt_trigger; Type: TRIGGER; Schema: public; Owner: bencon
--

CREATE TRIGGER sum_assembly_part_subtotal_updatettt_trigger BEFORE UPDATE OF assembly_part_quantity ON assemblies_parts FOR EACH ROW WHEN ((old.assembly_part_quantity IS DISTINCT FROM new.assembly_part_quantity)) EXECUTE PROCEDURE sum_assembly_part_subtotal();


--
-- Name: sum_assembly_part_update_subtotal_trigger; Type: TRIGGER; Schema: public; Owner: bencon
--

CREATE TRIGGER sum_assembly_part_update_subtotal_trigger BEFORE UPDATE OF assembly_part_product_id ON assemblies_parts FOR EACH ROW WHEN ((old.assembly_part_product_id IS DISTINCT FROM new.assembly_part_product_id)) EXECUTE PROCEDURE sum_assembly_part_subtotal();


--
-- Name: sum_assembly_subtotal_delete_run_del_trigger; Type: TRIGGER; Schema: public; Owner: bencon
--

CREATE TRIGGER sum_assembly_subtotal_delete_run_del_trigger AFTER DELETE ON assemblies_parts FOR EACH ROW EXECUTE PROCEDURE sum_assembly_subtotal_delete_run();


--
-- Name: sum_assembly_subtotal_update_run_appi_trigger; Type: TRIGGER; Schema: public; Owner: bencon
--

CREATE TRIGGER sum_assembly_subtotal_update_run_appi_trigger AFTER UPDATE OF assembly_part_product_id ON assemblies_parts FOR EACH ROW WHEN ((old.assembly_part_product_id IS DISTINCT FROM new.assembly_part_product_id)) EXECUTE PROCEDURE sum_assembly_subtotal_update_run();


--
-- Name: sum_assembly_subtotal_update_run_apq_trigger; Type: TRIGGER; Schema: public; Owner: bencon
--

CREATE TRIGGER sum_assembly_subtotal_update_run_apq_trigger AFTER UPDATE OF assembly_part_quantity ON assemblies_parts FOR EACH ROW WHEN ((old.assembly_part_quantity IS DISTINCT FROM new.assembly_part_quantity)) EXECUTE PROCEDURE sum_assembly_subtotal_update_run();


--
-- Name: sum_assembly_subtotal_update_run_as_trigger; Type: TRIGGER; Schema: public; Owner: bencon
--

CREATE TRIGGER sum_assembly_subtotal_update_run_as_trigger AFTER UPDATE OF assembly_part_subtotal ON assemblies_parts FOR EACH ROW WHEN ((old.assembly_part_subtotal IS DISTINCT FROM new.assembly_part_subtotal)) EXECUTE PROCEDURE sum_assembly_subtotal_update_run();


--
-- Name: sum_assembly_subtotal_update_run_trigger; Type: TRIGGER; Schema: public; Owner: bencon
--

CREATE TRIGGER sum_assembly_subtotal_update_run_trigger AFTER INSERT ON assemblies_parts FOR EACH ROW EXECUTE PROCEDURE sum_assembly_subtotal_update_run();


--
-- Name: sum_n_full_assembly_subtotal_update_run_as_trigger; Type: TRIGGER; Schema: public; Owner: bencon
--

CREATE TRIGGER sum_n_full_assembly_subtotal_update_run_as_trigger AFTER UPDATE OF assembly_subtotal ON assemblies FOR EACH ROW WHEN ((old.assembly_subtotal IS DISTINCT FROM new.assembly_subtotal)) EXECUTE PROCEDURE sum_n_full_assembly_subtotal_update_run_as();


--
-- Name: sum_p_full_assembly_subtotal_update_run_fq_trigger; Type: TRIGGER; Schema: public; Owner: bencon
--

CREATE TRIGGER sum_p_full_assembly_subtotal_update_run_fq_trigger AFTER UPDATE OF full_assembly_assembly_quantity ON full_assembly FOR EACH ROW WHEN ((old.full_assembly_assembly_quantity IS DISTINCT FROM new.full_assembly_assembly_quantity)) EXECUTE PROCEDURE sum_p_full_assembly_subtotal_update_run_fq();


--
-- Name: sum_r_full_assembly_rowtotal_insert_run_fr_trigger; Type: TRIGGER; Schema: public; Owner: bencon
--

CREATE TRIGGER sum_r_full_assembly_rowtotal_insert_run_fr_trigger BEFORE INSERT ON full_assembly FOR EACH ROW EXECUTE PROCEDURE sum_r_full_assembly_rowtotal_insert_run_fr();


--
-- Name: update_full_assembly_assembly_id_trigger; Type: TRIGGER; Schema: public; Owner: bencon
--

CREATE TRIGGER update_full_assembly_assembly_id_trigger BEFORE UPDATE ON full_assembly FOR EACH ROW EXECUTE PROCEDURE update_full_assembly_assembly_id();


--
-- Name: assemblies_parts_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY assemblies_parts
    ADD CONSTRAINT assemblies_parts_product_id_fkey FOREIGN KEY (assembly_part_product_id) REFERENCES products(product_id);


--
-- Name: assembly_currency_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY assemblies
    ADD CONSTRAINT assembly_currency_fkey FOREIGN KEY (assembly_currency) REFERENCES currencies(currency) ON UPDATE CASCADE;


--
-- Name: assembly_part_assembly_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY assemblies_parts
    ADD CONSTRAINT assembly_part_assembly_id_fkey FOREIGN KEY (assembly_part_assembly_id) REFERENCES assemblies(assembly_id);


--
-- Name: assembly_part_currency_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY assemblies_parts
    ADD CONSTRAINT assembly_part_currency_fkey FOREIGN KEY (assembly_part_currency) REFERENCES currencies(currency) ON UPDATE CASCADE;


--
-- Name: cust_bill_country_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT cust_bill_country_fkey FOREIGN KEY (cust_bill_country) REFERENCES countries(country) ON UPDATE CASCADE;


--
-- Name: full_assembly_currency_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY full_assembly
    ADD CONSTRAINT full_assembly_currency_fkey FOREIGN KEY (full_assembly_currency) REFERENCES currencies(currency) ON UPDATE CASCADE;


--
-- Name: full_assembly_full_assembly_assembly_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY full_assembly
    ADD CONSTRAINT full_assembly_full_assembly_assembly_id_fkey FOREIGN KEY (full_assembly_assembly_id) REFERENCES assemblies(assembly_id) ON UPDATE CASCADE;


--
-- Name: full_assembly_full_assembly_list_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY full_assembly
    ADD CONSTRAINT full_assembly_full_assembly_list_id_fkey FOREIGN KEY (full_assembly_full_assembly_list_id) REFERENCES full_assembly_list(full_assembly_list_id) ON UPDATE CASCADE;


--
-- Name: full_assembly_list_currency_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY full_assembly_list
    ADD CONSTRAINT full_assembly_list_currency_fkey FOREIGN KEY (full_assembly_list_currency) REFERENCES currencies(currency) ON UPDATE CASCADE;


--
-- Name: jobsite_country_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY jobsites
    ADD CONSTRAINT jobsite_country_fkey FOREIGN KEY (jobsite_country) REFERENCES countries(country) ON UPDATE CASCADE;


--
-- Name: jobsites_cust_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY jobsites
    ADD CONSTRAINT jobsites_cust_id_fkey FOREIGN KEY (cust_id) REFERENCES customers(cust_id);


--
-- Name: jobsites_cust_id_residential_or_commercial_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY jobsites
    ADD CONSTRAINT jobsites_cust_id_residential_or_commercial_fkey FOREIGN KEY (cust_id, residential_or_commercial) REFERENCES customers(cust_id, residential_or_commercial) ON UPDATE CASCADE;


--
-- Name: product_currency_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY products
    ADD CONSTRAINT product_currency_fkey FOREIGN KEY (product_currency) REFERENCES currencies(currency) ON UPDATE CASCADE;


--
-- Name: products_vendor_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_vendor_name_fkey FOREIGN KEY (vendor_name) REFERENCES vendors(vendor_name) ON UPDATE CASCADE;


--
-- Name: ven_contact_country_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY vendor_contacts
    ADD CONSTRAINT ven_contact_country_fkey FOREIGN KEY (ven_contact_country) REFERENCES countries(country) ON UPDATE CASCADE;


--
-- Name: vendor_contacts_vendor_name; Type: FK CONSTRAINT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY vendor_contacts
    ADD CONSTRAINT vendor_contacts_vendor_name FOREIGN KEY (vendor_name) REFERENCES vendors(vendor_name) ON UPDATE CASCADE;


--
-- Name: vendor_country_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY vendors
    ADD CONSTRAINT vendor_country_fkey FOREIGN KEY (vendor_country) REFERENCES countries(country) ON UPDATE CASCADE;


--
-- Name: vendor_currency_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY vendors
    ADD CONSTRAINT vendor_currency_fkey FOREIGN KEY (vendor_currency) REFERENCES currencies(currency) ON UPDATE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

