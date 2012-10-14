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
-- Name: expenses_total_total_update(); Type: FUNCTION; Schema: public; Owner: bencon
--

CREATE FUNCTION expenses_total_total_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
expenses_total_total_to_be numeric;
time_unit_set text [];
convert_to_days_set numeric [];
i integer;
BEGIN
SELECT array(SELECT time_unit FROM time_units ORDER BY time_unit) INTO time_unit_set;
SELECT array(SELECT convert_to_days FROM time_units ORDER BY time_unit) INTO convert_to_days_set;
i := 1;
expenses_total_total_to_be := 0;
LOOP
IF time_unit_set[i] ISNULL THEN
EXIT;--Exit when no more values in array
END IF;
IF convert_to_days_set[i] ISNULL THEN
EXIT;--Exit when no more values in array
END IF;
expenses_total_total_to_be := expenses_total_total_to_be + COALESCE((SELECT SUM(expense_amount/convert_to_days_set[i]) FROM expenses where time_unit=time_unit_set[i]), 0);
i := i + 1;
END LOOP;
UPDATE expenses_total SET expenses_total_total= expenses_total_total_to_be;
RETURN NULL;
END;$$;


ALTER FUNCTION public.expenses_total_total_update() OWNER TO bencon;

--
-- Name: labor_project_labor_project_list_id_update(); Type: FUNCTION; Schema: public; Owner: bencon
--

CREATE FUNCTION labor_project_labor_project_list_id_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE labor_project set labor_project_labor_project_list_id = NEW.labor_project_list_id WHERE labor_project_name = NEW.labor_project_list_name;
RETURN NULL;
END;$$;


ALTER FUNCTION public.labor_project_labor_project_list_id_update() OWNER TO bencon;

--
-- Name: labor_project_list_total_insert(); Type: FUNCTION; Schema: public; Owner: bencon
--

CREATE FUNCTION labor_project_list_total_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
NEW.labor_project_list_total := SUM(labor_project_total) FROM labor_project WHERE labor_project_name = NEW.labor_project_list_name;
RETURN NEW;
END;$$;


ALTER FUNCTION public.labor_project_list_total_insert() OWNER TO bencon;

--
-- Name: labor_project_list_total_update(); Type: FUNCTION; Schema: public; Owner: bencon
--

CREATE FUNCTION labor_project_list_total_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE labor_project_list SET labor_project_list_total=(SELECT SUM(labor_project_total) FROM labor_project WHERE labor_project_name = labor_project_list_name);
RETURN NULL;
END;$$;


ALTER FUNCTION public.labor_project_list_total_update() OWNER TO bencon;

--
-- Name: labor_project_total_insert(); Type: FUNCTION; Schema: public; Owner: bencon
--

CREATE FUNCTION labor_project_total_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
labor_project_unit_price numeric;
labor_project_overhead_expenses numeric;
--expenses_total_total numeric;
BEGIN
--expenses_total_total := (SELECT expenses_total_total FROM expenses_total);
labor_project_unit_price := (NEW.labor_project_pay_out_rate)+(NEW.labor_project_received_in);
NEW.labor_project_total := labor_project_unit_price*NEW.units_charged;
labor_project_overhead_expenses := (NEW.labor_project_days)*(SELECT expenses_total_total FROM expenses_total);
NEW.labor_project_total := NEW.labor_project_total + labor_project_overhead_expenses;
NEW.labor_project_overhead_expenses := labor_project_overhead_expenses;
NEW.labor_project_unit_price := labor_project_unit_price;
RETURN NEW;
END;$$;


ALTER FUNCTION public.labor_project_total_insert() OWNER TO bencon;

--
-- Name: labor_project_total_paid_out_insert(); Type: FUNCTION; Schema: public; Owner: bencon
--

CREATE FUNCTION labor_project_total_paid_out_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
NEW.labor_project_total_paid_out := NEW.labor_project_pay_out_rate*NEW.units_charged;
RETURN NEW;
END;$$;


ALTER FUNCTION public.labor_project_total_paid_out_insert() OWNER TO bencon;

--
-- Name: labor_project_total_paid_out_update(); Type: FUNCTION; Schema: public; Owner: bencon
--

CREATE FUNCTION labor_project_total_paid_out_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE labor_project SET labor_project_total_paid_out=((labor_project_pay_out_rate)*(units_charged));
RETURN NULL;
END;$$;


ALTER FUNCTION public.labor_project_total_paid_out_update() OWNER TO bencon;

--
-- Name: labor_project_total_update(); Type: FUNCTION; Schema: public; Owner: bencon
--

CREATE FUNCTION labor_project_total_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
labor_project_overhead_expenses numeric;
BEGIN
NEW.labor_project_total = (NEW.units_charged)*((NEW.labor_project_pay_out_rate)+(NEW.labor_project_received_in));
labor_project_overhead_expenses := (NEW.labor_project_days)*(SELECT expenses_total_total FROM expenses_total);
NEW.labor_project_total := NEW.labor_project_total + labor_project_overhead_expenses;
NEW.labor_project_overhead_expenses := labor_project_overhead_expenses;
NEW.labor_project_unit_price = ((NEW.labor_project_pay_out_rate)+(NEW.labor_project_received_in));
RETURN NEW;
END;$$;


ALTER FUNCTION public.labor_project_total_update() OWNER TO bencon;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: contractors; Type: TABLE; Schema: public; Owner: bencon; Tablespace: 
--

CREATE TABLE contractors (
    contractor_id integer NOT NULL,
    contractor_notes text,
    contractor_email text,
    contractor_phone2 character varying(35),
    contractor_contact_cell_phone character varying(35),
    contractor_fax character varying(35),
    contractor_website text,
    contractor_phone character varying(35),
    contractor_zip character varying(20),
    contractor_state text DEFAULT 'TX'::text,
    contractor_city text,
    contractor_street_address2 text,
    contractor_street_address text,
    contractor_contact_lname text,
    contractor_contact_fname text,
    contractor_business_name text,
    contractor_country text NOT NULL,
    contractor_currency text DEFAULT 'USD'::text NOT NULL,
    contractor_home_phone character varying(35)
);


ALTER TABLE public.contractors OWNER TO bencon;

--
-- Name: TABLE contractors; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON TABLE contractors IS 'Contractors who provide services';


--
-- Name: contractors_contractor_id_seq; Type: SEQUENCE; Schema: public; Owner: bencon
--

CREATE SEQUENCE contractors_contractor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contractors_contractor_id_seq OWNER TO bencon;

--
-- Name: contractors_contractor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bencon
--

ALTER SEQUENCE contractors_contractor_id_seq OWNED BY contractors.contractor_id;


--
-- Name: contractors_contractor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bencon
--

SELECT pg_catalog.setval('contractors_contractor_id_seq', 1, true);


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
-- Name: currenciesg; Type: TABLE; Schema: public; Owner: bencon; Tablespace: 
--

CREATE TABLE currenciesg (
    currency_id integer NOT NULL,
    currency text NOT NULL
);


ALTER TABLE public.currenciesg OWNER TO bencon;

--
-- Name: TABLE currenciesg; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON TABLE currenciesg IS 'Country currency used for each item. Exchange rates are NOT incorporated yet';


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

ALTER SEQUENCE currencies_currency_id_seq OWNED BY currenciesg.currency_id;


--
-- Name: currencies_currency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bencon
--

SELECT pg_catalog.setval('currencies_currency_id_seq', 1, true);


--
-- Name: expenses; Type: TABLE; Schema: public; Owner: bencon; Tablespace: 
--

CREATE TABLE expenses (
    expense_type text NOT NULL,
    expense_id integer NOT NULL,
    expense_amount numeric(10,2) NOT NULL,
    time_unit text NOT NULL,
    expense_notes text,
    expense_currency text DEFAULT 'USD'::text NOT NULL
);


ALTER TABLE public.expenses OWNER TO bencon;

--
-- Name: TABLE expenses; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON TABLE expenses IS 'Miscellaneous expenses.';


--
-- Name: COLUMN expenses.expense_type; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN expenses.expense_type IS 'Name for category of expense.';


--
-- Name: COLUMN expenses.expense_id; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN expenses.expense_id IS 'Expense ID.';


--
-- Name: COLUMN expenses.expense_amount; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN expenses.expense_amount IS 'Amount charged per expense unit.';


--
-- Name: COLUMN expenses.expense_notes; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN expenses.expense_notes IS 'Extra information about expenses';


--
-- Name: expenses_expense_id_seq; Type: SEQUENCE; Schema: public; Owner: bencon
--

CREATE SEQUENCE expenses_expense_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.expenses_expense_id_seq OWNER TO bencon;

--
-- Name: expenses_expense_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bencon
--

ALTER SEQUENCE expenses_expense_id_seq OWNED BY expenses.expense_id;


--
-- Name: expenses_expense_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bencon
--

SELECT pg_catalog.setval('expenses_expense_id_seq', 1, true);


--
-- Name: expenses_total; Type: TABLE; Schema: public; Owner: bencon; Tablespace: 
--

CREATE TABLE expenses_total (
    expenses_total_id integer NOT NULL,
    expenses_total_notes text,
    expenses_total_total numeric(10,2),
    expenses_total_currency text DEFAULT 'USD'::text NOT NULL
);


ALTER TABLE public.expenses_total OWNER TO bencon;

--
-- Name: COLUMN expenses_total.expenses_total_currency; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN expenses_total.expenses_total_currency IS 'Expenses Currency';


--
-- Name: expenses_total_id_seq; Type: SEQUENCE; Schema: public; Owner: bencon
--

CREATE SEQUENCE expenses_total_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.expenses_total_id_seq OWNER TO bencon;

--
-- Name: expenses_total_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bencon
--

ALTER SEQUENCE expenses_total_id_seq OWNED BY expenses_total.expenses_total_id;


--
-- Name: expenses_total_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bencon
--

SELECT pg_catalog.setval('expenses_total_id_seq', 1, true);


--
-- Name: general_labor_id_seq; Type: SEQUENCE; Schema: public; Owner: bencon
--

CREATE SEQUENCE general_labor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.general_labor_id_seq OWNER TO bencon;

--
-- Name: general_labor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bencon
--

SELECT pg_catalog.setval('general_labor_id_seq', 1, true);


--
-- Name: general_labor; Type: TABLE; Schema: public; Owner: bencon; Tablespace: 
--

CREATE TABLE general_labor (
    general_labor_id integer DEFAULT nextval('general_labor_id_seq'::regclass) NOT NULL,
    general_labor_notes text,
    general_labor_is_subcontracted character(1) NOT NULL,
    general_labor_rate numeric(10,2) NOT NULL,
    method_to_charge text NOT NULL,
    labor_category_id integer NOT NULL,
    general_labor_name text NOT NULL,
    general_labor_currency text DEFAULT 'USD'::text NOT NULL,
    CONSTRAINT general_labor_is_subcontracted CHECK (((general_labor_is_subcontracted = 'Y'::bpchar) OR (general_labor_is_subcontracted = 'N'::bpchar)))
);


ALTER TABLE public.general_labor OWNER TO bencon;

--
-- Name: TABLE general_labor; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON TABLE general_labor IS 'General labor items';


--
-- Name: labor_category_id_seq; Type: SEQUENCE; Schema: public; Owner: bencon
--

CREATE SEQUENCE labor_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.labor_category_id_seq OWNER TO bencon;

--
-- Name: labor_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bencon
--

SELECT pg_catalog.setval('labor_category_id_seq', 1, true);


--
-- Name: labor_category; Type: TABLE; Schema: public; Owner: bencon; Tablespace: 
--

CREATE TABLE labor_category (
    labor_category_id integer DEFAULT nextval('labor_category_id_seq'::regclass) NOT NULL,
    labor_category_notes text,
    labor_category_skill text,
    labor_category_service text NOT NULL,
    labor_category_subcategory text NOT NULL,
    labor_category_category text NOT NULL
);


ALTER TABLE public.labor_category OWNER TO bencon;

--
-- Name: TABLE labor_category; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON TABLE labor_category IS 'Labor categories and subcategories';


--
-- Name: labor_project_id_seq; Type: SEQUENCE; Schema: public; Owner: bencon
--

CREATE SEQUENCE labor_project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.labor_project_id_seq OWNER TO bencon;

--
-- Name: labor_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bencon
--

SELECT pg_catalog.setval('labor_project_id_seq', 1, true);


--
-- Name: labor_project; Type: TABLE; Schema: public; Owner: bencon; Tablespace: 
--

CREATE TABLE labor_project (
    labor_project_id integer DEFAULT nextval('labor_project_id_seq'::regclass) NOT NULL,
    labor_project_notes text,
    labor_project_unit_notes text,
    labor_project_received_in numeric(10,2) NOT NULL,
    labor_project_total_paid_out numeric(10,2) NOT NULL,
    labor_project_total numeric(10,2) NOT NULL,
    labor_project_unit_price numeric(10,2) NOT NULL,
    units_charged numeric NOT NULL,
    method_to_charge text NOT NULL,
    labor_project_is_subcontracted character(1) NOT NULL,
    labor_project_subclass text,
    labor_project_class text,
    labor_project_name text NOT NULL,
    labor_project_currency text DEFAULT 'USD'::text NOT NULL,
    labor_project_labor_project_list_id integer,
    labor_project_pay_out_rate numeric(10,2) NOT NULL,
    labor_project_section text,
    labor_project_days numeric(10,2),
    labor_project_overhead_expenses numeric(10,2),
    CONSTRAINT labor_project_is_subcontracted CHECK (((labor_project_is_subcontracted = 'Y'::bpchar) OR (labor_project_is_subcontracted = 'N'::bpchar)))
);


ALTER TABLE public.labor_project OWNER TO bencon;

--
-- Name: TABLE labor_project; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON TABLE labor_project IS 'Labor projects with totals, categories and subcategories';


--
-- Name: labor_project_list; Type: TABLE; Schema: public; Owner: bencon; Tablespace: 
--

CREATE TABLE labor_project_list (
    labor_project_list_id integer NOT NULL,
    labor_project_list_notes text,
    labor_project_list_total numeric(10,2),
    labor_project_list_subcategory text,
    labor_project_list_category text,
    labor_project_list_name text NOT NULL,
    labor_project_list_currency text DEFAULT 'USD'::text NOT NULL
);


ALTER TABLE public.labor_project_list OWNER TO bencon;

--
-- Name: TABLE labor_project_list; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON TABLE labor_project_list IS 'Condensed list of labor projects showing price total and other details';


--
-- Name: COLUMN labor_project_list.labor_project_list_id; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN labor_project_list.labor_project_list_id IS 'Labor Project List Id';


--
-- Name: COLUMN labor_project_list.labor_project_list_notes; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN labor_project_list.labor_project_list_notes IS 'Labor Project List Notes';


--
-- Name: COLUMN labor_project_list.labor_project_list_total; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN labor_project_list.labor_project_list_total IS 'Labor Project List Total';


--
-- Name: COLUMN labor_project_list.labor_project_list_subcategory; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN labor_project_list.labor_project_list_subcategory IS 'Labor Project List Subcategory';


--
-- Name: COLUMN labor_project_list.labor_project_list_category; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN labor_project_list.labor_project_list_category IS 'Labor Project List Category';


--
-- Name: COLUMN labor_project_list.labor_project_list_name; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN labor_project_list.labor_project_list_name IS 'Labor Project List Name is Copy of Labor Project Name';


--
-- Name: COLUMN labor_project_list.labor_project_list_currency; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN labor_project_list.labor_project_list_currency IS 'Labor Project List Currency';


--
-- Name: labor_project_list_id_seq; Type: SEQUENCE; Schema: public; Owner: bencon
--

CREATE SEQUENCE labor_project_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.labor_project_list_id_seq OWNER TO bencon;

--
-- Name: labor_project_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bencon
--

ALTER SEQUENCE labor_project_list_id_seq OWNED BY labor_project_list.labor_project_list_id;


--
-- Name: labor_project_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bencon
--

SELECT pg_catalog.setval('labor_project_list_id_seq', 1, true);


--
-- Name: labor_service_id_seq; Type: SEQUENCE; Schema: public; Owner: bencon
--

CREATE SEQUENCE labor_service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.labor_service_id_seq OWNER TO bencon;

--
-- Name: labor_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bencon
--

SELECT pg_catalog.setval('labor_service_id_seq', 1, true);


--
-- Name: labor_service; Type: TABLE; Schema: public; Owner: bencon; Tablespace: 
--

CREATE TABLE labor_service (
    labor_service_id integer DEFAULT nextval('labor_service_id_seq'::regclass) NOT NULL,
    labor_service text NOT NULL
);


ALTER TABLE public.labor_service OWNER TO bencon;

--
-- Name: TABLE labor_service; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON TABLE labor_service IS 'Service types';


--
-- Name: labor_skill_id_seq; Type: SEQUENCE; Schema: public; Owner: bencon
--

CREATE SEQUENCE labor_skill_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.labor_skill_id_seq OWNER TO bencon;

--
-- Name: labor_skill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bencon
--

SELECT pg_catalog.setval('labor_skill_id_seq', 1, true);


--
-- Name: labor_skill; Type: TABLE; Schema: public; Owner: bencon; Tablespace: 
--

CREATE TABLE labor_skill (
    labor_skill_id integer DEFAULT nextval('labor_skill_id_seq'::regclass) NOT NULL,
    labor_skill text NOT NULL
);


ALTER TABLE public.labor_skill OWNER TO bencon;

--
-- Name: TABLE labor_skill; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON TABLE labor_skill IS 'Skill levels';


--
-- Name: method_to_charge_id_seq; Type: SEQUENCE; Schema: public; Owner: bencon
--

CREATE SEQUENCE method_to_charge_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.method_to_charge_id_seq OWNER TO bencon;

--
-- Name: method_to_charge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bencon
--

SELECT pg_catalog.setval('method_to_charge_id_seq', 1, true);


--
-- Name: method_to_charge; Type: TABLE; Schema: public; Owner: bencon; Tablespace: 
--

CREATE TABLE method_to_charge (
    method_to_charge_id integer DEFAULT nextval('method_to_charge_id_seq'::regclass) NOT NULL,
    method_to_charge text NOT NULL
);


ALTER TABLE public.method_to_charge OWNER TO bencon;

--
-- Name: TABLE method_to_charge; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON TABLE method_to_charge IS 'Methods used to charge';


--
-- Name: time_units; Type: TABLE; Schema: public; Owner: bencon; Tablespace: 
--

CREATE TABLE time_units (
    time_unit_id integer NOT NULL,
    time_unit text NOT NULL,
    time_unit_notes text NOT NULL,
    convert_to_days numeric NOT NULL
);


ALTER TABLE public.time_units OWNER TO bencon;

--
-- Name: TABLE time_units; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON TABLE time_units IS 'Miscellaneous time units.';


--
-- Name: COLUMN time_units.time_unit; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN time_units.time_unit IS 'Time units, such as day, month, hour, etc.';


--
-- Name: COLUMN time_units.time_unit_notes; Type: COMMENT; Schema: public; Owner: bencon
--

COMMENT ON COLUMN time_units.time_unit_notes IS 'Extra information about time units';


--
-- Name: time_units_time_unit_id_seq; Type: SEQUENCE; Schema: public; Owner: bencon
--

CREATE SEQUENCE time_units_time_unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.time_units_time_unit_id_seq OWNER TO bencon;

--
-- Name: time_units_time_unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bencon
--

ALTER SEQUENCE time_units_time_unit_id_seq OWNED BY time_units.time_unit_id;


--
-- Name: time_units_time_unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bencon
--

SELECT pg_catalog.setval('time_units_time_unit_id_seq', 1, true);


--
-- Name: contractor_id; Type: DEFAULT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY contractors ALTER COLUMN contractor_id SET DEFAULT nextval('contractors_contractor_id_seq'::regclass);


--
-- Name: country_id; Type: DEFAULT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY countries ALTER COLUMN country_id SET DEFAULT nextval('countries_country_id_seq'::regclass);


--
-- Name: currency_id; Type: DEFAULT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY currenciesg ALTER COLUMN currency_id SET DEFAULT nextval('currencies_currency_id_seq'::regclass);


--
-- Name: expense_id; Type: DEFAULT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY expenses ALTER COLUMN expense_id SET DEFAULT nextval('expenses_expense_id_seq'::regclass);


--
-- Name: expenses_total_id; Type: DEFAULT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY expenses_total ALTER COLUMN expenses_total_id SET DEFAULT nextval('expenses_total_id_seq'::regclass);


--
-- Name: labor_project_list_id; Type: DEFAULT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY labor_project_list ALTER COLUMN labor_project_list_id SET DEFAULT nextval('labor_project_list_id_seq'::regclass);


--
-- Name: time_unit_id; Type: DEFAULT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY time_units ALTER COLUMN time_unit_id SET DEFAULT nextval('time_units_time_unit_id_seq'::regclass);


--
-- Data for Name: contractors; Type: TABLE DATA; Schema: public; Owner: bencon
--

COPY contractors (contractor_id, contractor_notes, contractor_email, contractor_phone2, contractor_contact_cell_phone, contractor_fax, contractor_website, contractor_phone, contractor_zip, contractor_state, contractor_city, contractor_street_address2, contractor_street_address, contractor_contact_lname, contractor_contact_fname, contractor_business_name, contractor_country, contractor_currency, contractor_home_phone) FROM stdin;
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: bencon
--

COPY countries (country, country_id) FROM stdin;
\.


--
-- Data for Name: currenciesg; Type: TABLE DATA; Schema: public; Owner: bencon
--

COPY currenciesg (currency_id, currency) FROM stdin;
\.


--
-- Data for Name: expenses; Type: TABLE DATA; Schema: public; Owner: bencon
--

COPY expenses (expense_type, expense_id, expense_amount, time_unit, expense_notes, expense_currency) FROM stdin;
\.


--
-- Data for Name: expenses_total; Type: TABLE DATA; Schema: public; Owner: bencon
--

COPY expenses_total (expenses_total_id, expenses_total_notes, expenses_total_total, expenses_total_currency) FROM stdin;
\.


--
-- Data for Name: general_labor; Type: TABLE DATA; Schema: public; Owner: bencon
--

COPY general_labor (general_labor_id, general_labor_notes, general_labor_is_subcontracted, general_labor_rate, method_to_charge, labor_category_id, general_labor_name, general_labor_currency) FROM stdin;
\.


--
-- Data for Name: labor_category; Type: TABLE DATA; Schema: public; Owner: bencon
--

COPY labor_category (labor_category_id, labor_category_notes, labor_category_skill, labor_category_service, labor_category_subcategory, labor_category_category) FROM stdin;
\.


--
-- Data for Name: labor_project; Type: TABLE DATA; Schema: public; Owner: bencon
--

COPY labor_project (labor_project_id, labor_project_notes, labor_project_unit_notes, labor_project_received_in, labor_project_total_paid_out, labor_project_total, labor_project_unit_price, units_charged, method_to_charge, labor_project_is_subcontracted, labor_project_subclass, labor_project_class, labor_project_name, labor_project_currency, labor_project_labor_project_list_id, labor_project_pay_out_rate, labor_project_section, labor_project_days, labor_project_overhead_expenses) FROM stdin;
\.


--
-- Data for Name: labor_project_list; Type: TABLE DATA; Schema: public; Owner: bencon
--

COPY labor_project_list (labor_project_list_id, labor_project_list_notes, labor_project_list_total, labor_project_list_subcategory, labor_project_list_category, labor_project_list_name, labor_project_list_currency) FROM stdin;
\.


--
-- Data for Name: labor_service; Type: TABLE DATA; Schema: public; Owner: bencon
--

COPY labor_service (labor_service_id, labor_service) FROM stdin;
\.


--
-- Data for Name: labor_skill; Type: TABLE DATA; Schema: public; Owner: bencon
--

COPY labor_skill (labor_skill_id, labor_skill) FROM stdin;
\.


--
-- Data for Name: method_to_charge; Type: TABLE DATA; Schema: public; Owner: bencon
--

COPY method_to_charge (method_to_charge_id, method_to_charge) FROM stdin;
\.


--
-- Data for Name: time_units; Type: TABLE DATA; Schema: public; Owner: bencon
--

COPY time_units (time_unit_id, time_unit, time_unit_notes, convert_to_days) FROM stdin;
\.


--
-- Name: contractors_pkey; Type: CONSTRAINT; Schema: public; Owner: bencon; Tablespace: 
--

ALTER TABLE ONLY contractors
    ADD CONSTRAINT contractors_pkey PRIMARY KEY (contractor_id);


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
-- Name: currenciesg_pkey; Type: CONSTRAINT; Schema: public; Owner: bencon; Tablespace: 
--

ALTER TABLE ONLY currenciesg
    ADD CONSTRAINT currenciesg_pkey PRIMARY KEY (currency_id);


--
-- Name: currency_key; Type: CONSTRAINT; Schema: public; Owner: bencon; Tablespace: 
--

ALTER TABLE ONLY currenciesg
    ADD CONSTRAINT currency_key UNIQUE (currency);


--
-- Name: expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: bencon; Tablespace: 
--

ALTER TABLE ONLY expenses
    ADD CONSTRAINT expenses_pkey PRIMARY KEY (expense_id);


--
-- Name: expenses_total_id_pkey; Type: CONSTRAINT; Schema: public; Owner: bencon; Tablespace: 
--

ALTER TABLE ONLY expenses_total
    ADD CONSTRAINT expenses_total_id_pkey PRIMARY KEY (expenses_total_id);


--
-- Name: general_labor_pkey; Type: CONSTRAINT; Schema: public; Owner: bencon; Tablespace: 
--

ALTER TABLE ONLY general_labor
    ADD CONSTRAINT general_labor_pkey PRIMARY KEY (general_labor_id);


--
-- Name: labor_category_pkey; Type: CONSTRAINT; Schema: public; Owner: bencon; Tablespace: 
--

ALTER TABLE ONLY labor_category
    ADD CONSTRAINT labor_category_pkey PRIMARY KEY (labor_category_id);


--
-- Name: labor_project_list_name_key; Type: CONSTRAINT; Schema: public; Owner: bencon; Tablespace: 
--

ALTER TABLE ONLY labor_project_list
    ADD CONSTRAINT labor_project_list_name_key UNIQUE (labor_project_list_name);


--
-- Name: labor_project_list_pkey; Type: CONSTRAINT; Schema: public; Owner: bencon; Tablespace: 
--

ALTER TABLE ONLY labor_project_list
    ADD CONSTRAINT labor_project_list_pkey PRIMARY KEY (labor_project_list_id);


--
-- Name: labor_project_pkey; Type: CONSTRAINT; Schema: public; Owner: bencon; Tablespace: 
--

ALTER TABLE ONLY labor_project
    ADD CONSTRAINT labor_project_pkey PRIMARY KEY (labor_project_id);


--
-- Name: labor_service_key; Type: CONSTRAINT; Schema: public; Owner: bencon; Tablespace: 
--

ALTER TABLE ONLY labor_service
    ADD CONSTRAINT labor_service_key UNIQUE (labor_service);


--
-- Name: labor_service_pkey; Type: CONSTRAINT; Schema: public; Owner: bencon; Tablespace: 
--

ALTER TABLE ONLY labor_service
    ADD CONSTRAINT labor_service_pkey PRIMARY KEY (labor_service_id);


--
-- Name: labor_skill_key; Type: CONSTRAINT; Schema: public; Owner: bencon; Tablespace: 
--

ALTER TABLE ONLY labor_skill
    ADD CONSTRAINT labor_skill_key UNIQUE (labor_skill);


--
-- Name: labor_skill_pkey; Type: CONSTRAINT; Schema: public; Owner: bencon; Tablespace: 
--

ALTER TABLE ONLY labor_skill
    ADD CONSTRAINT labor_skill_pkey PRIMARY KEY (labor_skill_id);


--
-- Name: method_to_charge_key; Type: CONSTRAINT; Schema: public; Owner: bencon; Tablespace: 
--

ALTER TABLE ONLY method_to_charge
    ADD CONSTRAINT method_to_charge_key UNIQUE (method_to_charge);


--
-- Name: method_to_charge_pkey; Type: CONSTRAINT; Schema: public; Owner: bencon; Tablespace: 
--

ALTER TABLE ONLY method_to_charge
    ADD CONSTRAINT method_to_charge_pkey PRIMARY KEY (method_to_charge_id);


--
-- Name: time_units_key; Type: CONSTRAINT; Schema: public; Owner: bencon; Tablespace: 
--

ALTER TABLE ONLY time_units
    ADD CONSTRAINT time_units_key UNIQUE (time_unit);


--
-- Name: time_units_pkey; Type: CONSTRAINT; Schema: public; Owner: bencon; Tablespace: 
--

ALTER TABLE ONLY time_units
    ADD CONSTRAINT time_units_pkey PRIMARY KEY (time_unit_id);


--
-- Name: expenses_total_total_expenses_delete_run_trigger; Type: TRIGGER; Schema: public; Owner: bencon
--

CREATE TRIGGER expenses_total_total_expenses_delete_run_trigger AFTER DELETE ON expenses FOR EACH ROW EXECUTE PROCEDURE expenses_total_total_update();


--
-- Name: expenses_total_total_insert_trigger; Type: TRIGGER; Schema: public; Owner: bencon
--

CREATE TRIGGER expenses_total_total_insert_trigger AFTER INSERT ON expenses FOR EACH ROW EXECUTE PROCEDURE expenses_total_total_update();


--
-- Name: expenses_total_total_update_insert_trigger; Type: TRIGGER; Schema: public; Owner: bencon
--

CREATE TRIGGER expenses_total_total_update_insert_trigger AFTER UPDATE ON expenses FOR EACH ROW EXECUTE PROCEDURE expenses_total_total_update();


--
-- Name: labor_project_labor_project_list_id_update_trigger; Type: TRIGGER; Schema: public; Owner: bencon
--

CREATE TRIGGER labor_project_labor_project_list_id_update_trigger AFTER INSERT ON labor_project_list FOR EACH ROW EXECUTE PROCEDURE labor_project_labor_project_list_id_update();


--
-- Name: labor_project_list_total_insert_trigger; Type: TRIGGER; Schema: public; Owner: bencon
--

CREATE TRIGGER labor_project_list_total_insert_trigger BEFORE INSERT ON labor_project_list FOR EACH ROW EXECUTE PROCEDURE labor_project_list_total_insert();


--
-- Name: labor_project_list_total_labor_project_delete_run_trigger; Type: TRIGGER; Schema: public; Owner: bencon
--

CREATE TRIGGER labor_project_list_total_labor_project_delete_run_trigger AFTER DELETE ON labor_project FOR EACH ROW EXECUTE PROCEDURE labor_project_list_total_update();


--
-- Name: labor_project_list_total_update_insert_trigger; Type: TRIGGER; Schema: public; Owner: bencon
--

CREATE TRIGGER labor_project_list_total_update_insert_trigger AFTER INSERT ON labor_project FOR EACH ROW EXECUTE PROCEDURE labor_project_list_total_update();


--
-- Name: labor_project_list_total_update_trigger; Type: TRIGGER; Schema: public; Owner: bencon
--

CREATE TRIGGER labor_project_list_total_update_trigger AFTER UPDATE ON labor_project FOR EACH ROW WHEN ((old.labor_project_total IS DISTINCT FROM new.labor_project_total)) EXECUTE PROCEDURE labor_project_list_total_update();


--
-- Name: labor_project_total_insert_trigger; Type: TRIGGER; Schema: public; Owner: bencon
--

CREATE TRIGGER labor_project_total_insert_trigger BEFORE INSERT ON labor_project FOR EACH ROW EXECUTE PROCEDURE labor_project_total_insert();


--
-- Name: labor_project_total_paid_out_insert_trigger; Type: TRIGGER; Schema: public; Owner: bencon
--

CREATE TRIGGER labor_project_total_paid_out_insert_trigger BEFORE INSERT ON labor_project FOR EACH ROW EXECUTE PROCEDURE labor_project_total_paid_out_insert();


--
-- Name: labor_project_total_paid_out_units_update_trigger; Type: TRIGGER; Schema: public; Owner: bencon
--

CREATE TRIGGER labor_project_total_paid_out_units_update_trigger AFTER UPDATE ON labor_project FOR EACH ROW WHEN ((old.units_charged IS DISTINCT FROM new.units_charged)) EXECUTE PROCEDURE labor_project_total_paid_out_update();


--
-- Name: labor_project_total_paid_out_update_trigger; Type: TRIGGER; Schema: public; Owner: bencon
--

CREATE TRIGGER labor_project_total_paid_out_update_trigger AFTER UPDATE ON labor_project FOR EACH ROW WHEN ((old.labor_project_pay_out_rate IS DISTINCT FROM new.labor_project_pay_out_rate)) EXECUTE PROCEDURE labor_project_total_paid_out_update();


--
-- Name: labor_project_total_update_trigger; Type: TRIGGER; Schema: public; Owner: bencon
--

CREATE TRIGGER labor_project_total_update_trigger BEFORE UPDATE ON labor_project FOR EACH ROW EXECUTE PROCEDURE labor_project_total_update();


--
-- Name: contractor_currency_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY contractors
    ADD CONSTRAINT contractor_currency_fkey FOREIGN KEY (contractor_currency) REFERENCES currenciesg(currency) ON UPDATE CASCADE;


--
-- Name: contractors_country_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY contractors
    ADD CONSTRAINT contractors_country_fkey FOREIGN KEY (contractor_country) REFERENCES countries(country) ON UPDATE CASCADE;


--
-- Name: expenses_total_currency_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY expenses_total
    ADD CONSTRAINT expenses_total_currency_fkey FOREIGN KEY (expenses_total_currency) REFERENCES currenciesg(currency) ON UPDATE CASCADE;


--
-- Name: general_labor_currency_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY general_labor
    ADD CONSTRAINT general_labor_currency_fkey FOREIGN KEY (general_labor_currency) REFERENCES currenciesg(currency) ON UPDATE CASCADE;


--
-- Name: labor_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY general_labor
    ADD CONSTRAINT labor_category_id_fkey FOREIGN KEY (labor_category_id) REFERENCES labor_category(labor_category_id);


--
-- Name: labor_category_labor_service_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY labor_category
    ADD CONSTRAINT labor_category_labor_service_fkey FOREIGN KEY (labor_category_service) REFERENCES labor_service(labor_service) ON UPDATE CASCADE;


--
-- Name: labor_category_labor_skill_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY labor_category
    ADD CONSTRAINT labor_category_labor_skill_fkey FOREIGN KEY (labor_category_skill) REFERENCES labor_skill(labor_skill) ON UPDATE CASCADE;


--
-- Name: labor_project_currency_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY labor_project
    ADD CONSTRAINT labor_project_currency_fkey FOREIGN KEY (labor_project_currency) REFERENCES currenciesg(currency) ON UPDATE CASCADE;


--
-- Name: labor_project_labor_project_list_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY labor_project
    ADD CONSTRAINT labor_project_labor_project_list_id_fkey FOREIGN KEY (labor_project_labor_project_list_id) REFERENCES labor_project_list(labor_project_list_id) ON UPDATE CASCADE;


--
-- Name: labor_project_list_currency_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY labor_project_list
    ADD CONSTRAINT labor_project_list_currency_fkey FOREIGN KEY (labor_project_list_currency) REFERENCES currenciesg(currency) ON UPDATE CASCADE;


--
-- Name: method_to_charge_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY labor_project
    ADD CONSTRAINT method_to_charge_fkey FOREIGN KEY (method_to_charge) REFERENCES method_to_charge(method_to_charge) ON UPDATE CASCADE;


--
-- Name: method_to_charge_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY general_labor
    ADD CONSTRAINT method_to_charge_fkey FOREIGN KEY (method_to_charge) REFERENCES method_to_charge(method_to_charge) ON UPDATE CASCADE;


--
-- Name: time_unit_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bencon
--

ALTER TABLE ONLY expenses
    ADD CONSTRAINT time_unit_fkey FOREIGN KEY (time_unit) REFERENCES time_units(time_unit) ON UPDATE CASCADE;


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

