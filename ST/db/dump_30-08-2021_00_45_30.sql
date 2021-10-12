--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE awx;




--
-- Drop roles
--

DROP ROLE awx;


--
-- Roles
--

CREATE ROLE awx;
ALTER ROLE awx WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md5188dee03ebcd22908403a282106b2cb2';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.8 (Debian 12.8-1.pgdg100+1)
-- Dumped by pg_dump version 12.8 (Debian 12.8-1.pgdg100+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: awx
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO awx;

\connect template1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: awx
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: awx
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: awx
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "awx" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.8 (Debian 12.8-1.pgdg100+1)
-- Dumped by pg_dump version 12.8 (Debian 12.8-1.pgdg100+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: awx; Type: DATABASE; Schema: -; Owner: awx
--

CREATE DATABASE awx WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE awx OWNER TO awx;

\connect awx

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: _old_main_adhoccommandevent; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public._old_main_adhoccommandevent (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    host_name character varying(1024) NOT NULL,
    event character varying(100) NOT NULL,
    event_data text NOT NULL,
    failed boolean NOT NULL,
    changed boolean NOT NULL,
    counter integer NOT NULL,
    host_id integer,
    ad_hoc_command_id integer NOT NULL,
    end_line integer NOT NULL,
    start_line integer NOT NULL,
    stdout text NOT NULL,
    uuid character varying(1024) NOT NULL,
    verbosity integer NOT NULL
);


ALTER TABLE public._old_main_adhoccommandevent OWNER TO awx;

--
-- Name: _old_main_inventoryupdateevent; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public._old_main_inventoryupdateevent (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    event_data text NOT NULL,
    uuid character varying(1024) NOT NULL,
    counter integer NOT NULL,
    stdout text NOT NULL,
    verbosity integer NOT NULL,
    start_line integer NOT NULL,
    end_line integer NOT NULL,
    inventory_update_id integer NOT NULL
);


ALTER TABLE public._old_main_inventoryupdateevent OWNER TO awx;

--
-- Name: _old_main_jobevent; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public._old_main_jobevent (
    id integer NOT NULL,
    created timestamp with time zone,
    modified timestamp with time zone NOT NULL,
    event character varying(100) NOT NULL,
    event_data text NOT NULL,
    failed boolean NOT NULL,
    changed boolean NOT NULL,
    host_name character varying(1024) NOT NULL,
    play character varying(1024) NOT NULL,
    role character varying(1024) NOT NULL,
    task character varying(1024) NOT NULL,
    counter integer NOT NULL,
    host_id integer,
    job_id integer NOT NULL,
    uuid character varying(1024) NOT NULL,
    parent_uuid character varying(1024) NOT NULL,
    end_line integer NOT NULL,
    playbook character varying(1024) NOT NULL,
    start_line integer NOT NULL,
    stdout text NOT NULL,
    verbosity integer NOT NULL
);


ALTER TABLE public._old_main_jobevent OWNER TO awx;

--
-- Name: _old_main_projectupdateevent; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public._old_main_projectupdateevent (
    id integer NOT NULL,
    created timestamp with time zone,
    modified timestamp with time zone NOT NULL,
    event character varying(100) NOT NULL,
    event_data text NOT NULL,
    failed boolean NOT NULL,
    changed boolean NOT NULL,
    uuid character varying(1024) NOT NULL,
    playbook character varying(1024) NOT NULL,
    play character varying(1024) NOT NULL,
    role character varying(1024) NOT NULL,
    task character varying(1024) NOT NULL,
    counter integer NOT NULL,
    stdout text NOT NULL,
    verbosity integer NOT NULL,
    start_line integer NOT NULL,
    end_line integer NOT NULL,
    project_update_id integer NOT NULL
);


ALTER TABLE public._old_main_projectupdateevent OWNER TO awx;

--
-- Name: _old_main_systemjobevent; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public._old_main_systemjobevent (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    event_data text NOT NULL,
    uuid character varying(1024) NOT NULL,
    counter integer NOT NULL,
    stdout text NOT NULL,
    verbosity integer NOT NULL,
    start_line integer NOT NULL,
    end_line integer NOT NULL,
    system_job_id integer NOT NULL
);


ALTER TABLE public._old_main_systemjobevent OWNER TO awx;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO awx;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO awx;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO awx;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO awx;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO awx;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO awx;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO awx;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO awx;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO awx;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO awx;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO awx;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO awx;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: conf_setting; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.conf_setting (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    key character varying(255) NOT NULL,
    value text,
    user_id integer
);


ALTER TABLE public.conf_setting OWNER TO awx;

--
-- Name: conf_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.conf_setting_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conf_setting_id_seq OWNER TO awx;

--
-- Name: conf_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.conf_setting_id_seq OWNED BY public.conf_setting.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO awx;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO awx;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO awx;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO awx;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO awx;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO awx;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO awx;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: main_activitystream; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_activitystream (
    id integer NOT NULL,
    operation character varying(13) NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    changes text NOT NULL,
    object_relationship_type text NOT NULL,
    object1 text NOT NULL,
    object2 text NOT NULL,
    actor_id integer,
    setting text NOT NULL,
    deleted_actor text,
    action_node character varying(512) NOT NULL
);


ALTER TABLE public.main_activitystream OWNER TO awx;

--
-- Name: main_activitystream_ad_hoc_command; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_activitystream_ad_hoc_command (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    adhoccommand_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_ad_hoc_command OWNER TO awx;

--
-- Name: main_activitystream_ad_hoc_command_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_activitystream_ad_hoc_command_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_ad_hoc_command_id_seq OWNER TO awx;

--
-- Name: main_activitystream_ad_hoc_command_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_activitystream_ad_hoc_command_id_seq OWNED BY public.main_activitystream_ad_hoc_command.id;


--
-- Name: main_activitystream_credential; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_activitystream_credential (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    credential_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_credential OWNER TO awx;

--
-- Name: main_activitystream_credential_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_activitystream_credential_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_credential_id_seq OWNER TO awx;

--
-- Name: main_activitystream_credential_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_activitystream_credential_id_seq OWNED BY public.main_activitystream_credential.id;


--
-- Name: main_activitystream_credential_type; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_activitystream_credential_type (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    credentialtype_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_credential_type OWNER TO awx;

--
-- Name: main_activitystream_credential_type_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_activitystream_credential_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_credential_type_id_seq OWNER TO awx;

--
-- Name: main_activitystream_credential_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_activitystream_credential_type_id_seq OWNED BY public.main_activitystream_credential_type.id;


--
-- Name: main_activitystream_custom_inventory_script; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_activitystream_custom_inventory_script (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    custominventoryscript_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_custom_inventory_script OWNER TO awx;

--
-- Name: main_activitystream_custom_inventory_script_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_activitystream_custom_inventory_script_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_custom_inventory_script_id_seq OWNER TO awx;

--
-- Name: main_activitystream_custom_inventory_script_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_activitystream_custom_inventory_script_id_seq OWNED BY public.main_activitystream_custom_inventory_script.id;


--
-- Name: main_activitystream_group; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_activitystream_group (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_group OWNER TO awx;

--
-- Name: main_activitystream_group_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_activitystream_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_group_id_seq OWNER TO awx;

--
-- Name: main_activitystream_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_activitystream_group_id_seq OWNED BY public.main_activitystream_group.id;


--
-- Name: main_activitystream_host; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_activitystream_host (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    host_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_host OWNER TO awx;

--
-- Name: main_activitystream_host_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_activitystream_host_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_host_id_seq OWNER TO awx;

--
-- Name: main_activitystream_host_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_activitystream_host_id_seq OWNED BY public.main_activitystream_host.id;


--
-- Name: main_activitystream_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_activitystream_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_id_seq OWNER TO awx;

--
-- Name: main_activitystream_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_activitystream_id_seq OWNED BY public.main_activitystream.id;


--
-- Name: main_activitystream_instance; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_activitystream_instance (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    instance_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_instance OWNER TO awx;

--
-- Name: main_activitystream_instance_group; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_activitystream_instance_group (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    instancegroup_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_instance_group OWNER TO awx;

--
-- Name: main_activitystream_instance_group_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_activitystream_instance_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_instance_group_id_seq OWNER TO awx;

--
-- Name: main_activitystream_instance_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_activitystream_instance_group_id_seq OWNED BY public.main_activitystream_instance_group.id;


--
-- Name: main_activitystream_instance_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_activitystream_instance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_instance_id_seq OWNER TO awx;

--
-- Name: main_activitystream_instance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_activitystream_instance_id_seq OWNED BY public.main_activitystream_instance.id;


--
-- Name: main_activitystream_inventory; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_activitystream_inventory (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    inventory_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_inventory OWNER TO awx;

--
-- Name: main_activitystream_inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_activitystream_inventory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_inventory_id_seq OWNER TO awx;

--
-- Name: main_activitystream_inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_activitystream_inventory_id_seq OWNED BY public.main_activitystream_inventory.id;


--
-- Name: main_activitystream_inventory_source; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_activitystream_inventory_source (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    inventorysource_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_inventory_source OWNER TO awx;

--
-- Name: main_activitystream_inventory_source_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_activitystream_inventory_source_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_inventory_source_id_seq OWNER TO awx;

--
-- Name: main_activitystream_inventory_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_activitystream_inventory_source_id_seq OWNED BY public.main_activitystream_inventory_source.id;


--
-- Name: main_activitystream_inventory_update; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_activitystream_inventory_update (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    inventoryupdate_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_inventory_update OWNER TO awx;

--
-- Name: main_activitystream_inventory_update_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_activitystream_inventory_update_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_inventory_update_id_seq OWNER TO awx;

--
-- Name: main_activitystream_inventory_update_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_activitystream_inventory_update_id_seq OWNED BY public.main_activitystream_inventory_update.id;


--
-- Name: main_activitystream_job; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_activitystream_job (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    job_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_job OWNER TO awx;

--
-- Name: main_activitystream_job_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_activitystream_job_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_job_id_seq OWNER TO awx;

--
-- Name: main_activitystream_job_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_activitystream_job_id_seq OWNED BY public.main_activitystream_job.id;


--
-- Name: main_activitystream_job_template; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_activitystream_job_template (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    jobtemplate_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_job_template OWNER TO awx;

--
-- Name: main_activitystream_job_template_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_activitystream_job_template_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_job_template_id_seq OWNER TO awx;

--
-- Name: main_activitystream_job_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_activitystream_job_template_id_seq OWNED BY public.main_activitystream_job_template.id;


--
-- Name: main_activitystream_label; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_activitystream_label (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    label_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_label OWNER TO awx;

--
-- Name: main_activitystream_label_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_activitystream_label_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_label_id_seq OWNER TO awx;

--
-- Name: main_activitystream_label_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_activitystream_label_id_seq OWNED BY public.main_activitystream_label.id;


--
-- Name: main_activitystream_notification; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_activitystream_notification (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    notification_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_notification OWNER TO awx;

--
-- Name: main_activitystream_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_activitystream_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_notification_id_seq OWNER TO awx;

--
-- Name: main_activitystream_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_activitystream_notification_id_seq OWNED BY public.main_activitystream_notification.id;


--
-- Name: main_activitystream_notification_template; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_activitystream_notification_template (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    notificationtemplate_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_notification_template OWNER TO awx;

--
-- Name: main_activitystream_notification_template_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_activitystream_notification_template_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_notification_template_id_seq OWNER TO awx;

--
-- Name: main_activitystream_notification_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_activitystream_notification_template_id_seq OWNED BY public.main_activitystream_notification_template.id;


--
-- Name: main_activitystream_o_auth2_access_token; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_activitystream_o_auth2_access_token (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    oauth2accesstoken_id bigint NOT NULL
);


ALTER TABLE public.main_activitystream_o_auth2_access_token OWNER TO awx;

--
-- Name: main_activitystream_o_auth2_access_token_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_activitystream_o_auth2_access_token_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_o_auth2_access_token_id_seq OWNER TO awx;

--
-- Name: main_activitystream_o_auth2_access_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_activitystream_o_auth2_access_token_id_seq OWNED BY public.main_activitystream_o_auth2_access_token.id;


--
-- Name: main_activitystream_o_auth2_application; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_activitystream_o_auth2_application (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    oauth2application_id bigint NOT NULL
);


ALTER TABLE public.main_activitystream_o_auth2_application OWNER TO awx;

--
-- Name: main_activitystream_o_auth2_application_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_activitystream_o_auth2_application_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_o_auth2_application_id_seq OWNER TO awx;

--
-- Name: main_activitystream_o_auth2_application_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_activitystream_o_auth2_application_id_seq OWNED BY public.main_activitystream_o_auth2_application.id;


--
-- Name: main_activitystream_organization; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_activitystream_organization (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    organization_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_organization OWNER TO awx;

--
-- Name: main_activitystream_organization_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_activitystream_organization_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_organization_id_seq OWNER TO awx;

--
-- Name: main_activitystream_organization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_activitystream_organization_id_seq OWNED BY public.main_activitystream_organization.id;


--
-- Name: main_activitystream_project; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_activitystream_project (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    project_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_project OWNER TO awx;

--
-- Name: main_activitystream_project_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_activitystream_project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_project_id_seq OWNER TO awx;

--
-- Name: main_activitystream_project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_activitystream_project_id_seq OWNED BY public.main_activitystream_project.id;


--
-- Name: main_activitystream_project_update; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_activitystream_project_update (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    projectupdate_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_project_update OWNER TO awx;

--
-- Name: main_activitystream_project_update_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_activitystream_project_update_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_project_update_id_seq OWNER TO awx;

--
-- Name: main_activitystream_project_update_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_activitystream_project_update_id_seq OWNED BY public.main_activitystream_project_update.id;


--
-- Name: main_activitystream_role; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_activitystream_role (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_role OWNER TO awx;

--
-- Name: main_activitystream_role_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_activitystream_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_role_id_seq OWNER TO awx;

--
-- Name: main_activitystream_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_activitystream_role_id_seq OWNED BY public.main_activitystream_role.id;


--
-- Name: main_activitystream_schedule; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_activitystream_schedule (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    schedule_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_schedule OWNER TO awx;

--
-- Name: main_activitystream_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_activitystream_schedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_schedule_id_seq OWNER TO awx;

--
-- Name: main_activitystream_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_activitystream_schedule_id_seq OWNED BY public.main_activitystream_schedule.id;


--
-- Name: main_activitystream_team; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_activitystream_team (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    team_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_team OWNER TO awx;

--
-- Name: main_activitystream_team_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_activitystream_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_team_id_seq OWNER TO awx;

--
-- Name: main_activitystream_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_activitystream_team_id_seq OWNED BY public.main_activitystream_team.id;


--
-- Name: main_activitystream_unified_job; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_activitystream_unified_job (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    unifiedjob_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_unified_job OWNER TO awx;

--
-- Name: main_activitystream_unified_job_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_activitystream_unified_job_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_unified_job_id_seq OWNER TO awx;

--
-- Name: main_activitystream_unified_job_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_activitystream_unified_job_id_seq OWNED BY public.main_activitystream_unified_job.id;


--
-- Name: main_activitystream_unified_job_template; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_activitystream_unified_job_template (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    unifiedjobtemplate_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_unified_job_template OWNER TO awx;

--
-- Name: main_activitystream_unified_job_template_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_activitystream_unified_job_template_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_unified_job_template_id_seq OWNER TO awx;

--
-- Name: main_activitystream_unified_job_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_activitystream_unified_job_template_id_seq OWNED BY public.main_activitystream_unified_job_template.id;


--
-- Name: main_activitystream_user; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_activitystream_user (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_user OWNER TO awx;

--
-- Name: main_activitystream_user_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_activitystream_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_user_id_seq OWNER TO awx;

--
-- Name: main_activitystream_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_activitystream_user_id_seq OWNED BY public.main_activitystream_user.id;


--
-- Name: main_activitystream_workflow_approval; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_activitystream_workflow_approval (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    workflowapproval_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_workflow_approval OWNER TO awx;

--
-- Name: main_activitystream_workflow_approval_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_activitystream_workflow_approval_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_workflow_approval_id_seq OWNER TO awx;

--
-- Name: main_activitystream_workflow_approval_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_activitystream_workflow_approval_id_seq OWNED BY public.main_activitystream_workflow_approval.id;


--
-- Name: main_activitystream_workflow_approval_template; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_activitystream_workflow_approval_template (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    workflowapprovaltemplate_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_workflow_approval_template OWNER TO awx;

--
-- Name: main_activitystream_workflow_approval_template_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_activitystream_workflow_approval_template_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_workflow_approval_template_id_seq OWNER TO awx;

--
-- Name: main_activitystream_workflow_approval_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_activitystream_workflow_approval_template_id_seq OWNED BY public.main_activitystream_workflow_approval_template.id;


--
-- Name: main_activitystream_workflow_job; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_activitystream_workflow_job (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    workflowjob_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_workflow_job OWNER TO awx;

--
-- Name: main_activitystream_workflow_job_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_activitystream_workflow_job_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_workflow_job_id_seq OWNER TO awx;

--
-- Name: main_activitystream_workflow_job_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_activitystream_workflow_job_id_seq OWNED BY public.main_activitystream_workflow_job.id;


--
-- Name: main_activitystream_workflow_job_node; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_activitystream_workflow_job_node (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    workflowjobnode_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_workflow_job_node OWNER TO awx;

--
-- Name: main_activitystream_workflow_job_node_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_activitystream_workflow_job_node_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_workflow_job_node_id_seq OWNER TO awx;

--
-- Name: main_activitystream_workflow_job_node_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_activitystream_workflow_job_node_id_seq OWNED BY public.main_activitystream_workflow_job_node.id;


--
-- Name: main_activitystream_workflow_job_template; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_activitystream_workflow_job_template (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    workflowjobtemplate_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_workflow_job_template OWNER TO awx;

--
-- Name: main_activitystream_workflow_job_template_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_activitystream_workflow_job_template_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_workflow_job_template_id_seq OWNER TO awx;

--
-- Name: main_activitystream_workflow_job_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_activitystream_workflow_job_template_id_seq OWNED BY public.main_activitystream_workflow_job_template.id;


--
-- Name: main_activitystream_workflow_job_template_node; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_activitystream_workflow_job_template_node (
    id integer NOT NULL,
    activitystream_id integer NOT NULL,
    workflowjobtemplatenode_id integer NOT NULL
);


ALTER TABLE public.main_activitystream_workflow_job_template_node OWNER TO awx;

--
-- Name: main_activitystream_workflow_job_template_node_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_activitystream_workflow_job_template_node_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_activitystream_workflow_job_template_node_id_seq OWNER TO awx;

--
-- Name: main_activitystream_workflow_job_template_node_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_activitystream_workflow_job_template_node_id_seq OWNED BY public.main_activitystream_workflow_job_template_node.id;


--
-- Name: main_adhoccommand; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_adhoccommand (
    unifiedjob_ptr_id integer NOT NULL,
    job_type character varying(64) NOT NULL,
    "limit" text NOT NULL,
    module_name character varying(1024) NOT NULL,
    module_args text NOT NULL,
    forks integer NOT NULL,
    verbosity integer NOT NULL,
    become_enabled boolean NOT NULL,
    credential_id integer,
    inventory_id integer,
    extra_vars text NOT NULL,
    diff_mode boolean NOT NULL,
    CONSTRAINT main_adhoccommand_forks_check CHECK ((forks >= 0)),
    CONSTRAINT main_adhoccommand_verbosity_check CHECK ((verbosity >= 0))
);


ALTER TABLE public.main_adhoccommand OWNER TO awx;

--
-- Name: main_adhoccommandevent_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_adhoccommandevent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_adhoccommandevent_id_seq OWNER TO awx;

--
-- Name: main_adhoccommandevent; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_adhoccommandevent (
    id bigint DEFAULT nextval('public.main_adhoccommandevent_id_seq'::regclass) NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    host_name character varying(1024) NOT NULL,
    event character varying(100) NOT NULL,
    event_data text NOT NULL,
    failed boolean NOT NULL,
    changed boolean NOT NULL,
    counter integer NOT NULL,
    host_id integer,
    ad_hoc_command_id integer NOT NULL,
    end_line integer NOT NULL,
    start_line integer NOT NULL,
    stdout text NOT NULL,
    uuid character varying(1024) NOT NULL,
    verbosity integer NOT NULL,
    CONSTRAINT main_adhoccommandevent_counter_check CHECK ((counter >= 0)),
    CONSTRAINT main_adhoccommandevent_end_line_check CHECK ((end_line >= 0)),
    CONSTRAINT main_adhoccommandevent_start_line_check CHECK ((start_line >= 0)),
    CONSTRAINT main_adhoccommandevent_verbosity_check CHECK ((verbosity >= 0))
);


ALTER TABLE public.main_adhoccommandevent OWNER TO awx;

--
-- Name: main_credential; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_credential (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    description text NOT NULL,
    name character varying(512) NOT NULL,
    created_by_id integer,
    modified_by_id integer,
    organization_id integer,
    admin_role_id integer,
    use_role_id integer,
    read_role_id integer,
    inputs jsonb NOT NULL,
    credential_type_id integer NOT NULL,
    managed_by_tower boolean NOT NULL
);


ALTER TABLE public.main_credential OWNER TO awx;

--
-- Name: main_credential_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_credential_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_credential_id_seq OWNER TO awx;

--
-- Name: main_credential_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_credential_id_seq OWNED BY public.main_credential.id;


--
-- Name: main_credentialinputsource; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_credentialinputsource (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    description text NOT NULL,
    input_field_name character varying(1024) NOT NULL,
    metadata jsonb NOT NULL,
    created_by_id integer,
    modified_by_id integer,
    source_credential_id integer,
    target_credential_id integer
);


ALTER TABLE public.main_credentialinputsource OWNER TO awx;

--
-- Name: main_credentialinputsource_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_credentialinputsource_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_credentialinputsource_id_seq OWNER TO awx;

--
-- Name: main_credentialinputsource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_credentialinputsource_id_seq OWNED BY public.main_credentialinputsource.id;


--
-- Name: main_credentialtype; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_credentialtype (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    description text NOT NULL,
    name character varying(512) NOT NULL,
    kind character varying(32) NOT NULL,
    managed_by_tower boolean NOT NULL,
    inputs jsonb NOT NULL,
    injectors jsonb NOT NULL,
    created_by_id integer,
    modified_by_id integer,
    namespace character varying(1024)
);


ALTER TABLE public.main_credentialtype OWNER TO awx;

--
-- Name: main_credentialtype_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_credentialtype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_credentialtype_id_seq OWNER TO awx;

--
-- Name: main_credentialtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_credentialtype_id_seq OWNED BY public.main_credentialtype.id;


--
-- Name: main_custominventoryscript; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_custominventoryscript (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    description text NOT NULL,
    name character varying(512) NOT NULL,
    script text NOT NULL,
    created_by_id integer,
    modified_by_id integer,
    organization_id integer,
    admin_role_id integer,
    read_role_id integer
);


ALTER TABLE public.main_custominventoryscript OWNER TO awx;

--
-- Name: main_custominventoryscript_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_custominventoryscript_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_custominventoryscript_id_seq OWNER TO awx;

--
-- Name: main_custominventoryscript_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_custominventoryscript_id_seq OWNED BY public.main_custominventoryscript.id;


--
-- Name: main_group; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_group (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    description text NOT NULL,
    name character varying(512) NOT NULL,
    variables text NOT NULL,
    created_by_id integer,
    inventory_id integer NOT NULL,
    modified_by_id integer
);


ALTER TABLE public.main_group OWNER TO awx;

--
-- Name: main_group_hosts; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_group_hosts (
    id integer NOT NULL,
    group_id integer NOT NULL,
    host_id integer NOT NULL
);


ALTER TABLE public.main_group_hosts OWNER TO awx;

--
-- Name: main_group_hosts_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_group_hosts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_group_hosts_id_seq OWNER TO awx;

--
-- Name: main_group_hosts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_group_hosts_id_seq OWNED BY public.main_group_hosts.id;


--
-- Name: main_group_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_group_id_seq OWNER TO awx;

--
-- Name: main_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_group_id_seq OWNED BY public.main_group.id;


--
-- Name: main_group_inventory_sources; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_group_inventory_sources (
    id integer NOT NULL,
    group_id integer NOT NULL,
    inventorysource_id integer NOT NULL
);


ALTER TABLE public.main_group_inventory_sources OWNER TO awx;

--
-- Name: main_group_inventory_sources_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_group_inventory_sources_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_group_inventory_sources_id_seq OWNER TO awx;

--
-- Name: main_group_inventory_sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_group_inventory_sources_id_seq OWNED BY public.main_group_inventory_sources.id;


--
-- Name: main_group_parents; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_group_parents (
    id integer NOT NULL,
    from_group_id integer NOT NULL,
    to_group_id integer NOT NULL
);


ALTER TABLE public.main_group_parents OWNER TO awx;

--
-- Name: main_group_parents_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_group_parents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_group_parents_id_seq OWNER TO awx;

--
-- Name: main_group_parents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_group_parents_id_seq OWNED BY public.main_group_parents.id;


--
-- Name: main_host; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_host (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    description text NOT NULL,
    name character varying(512) NOT NULL,
    enabled boolean NOT NULL,
    instance_id character varying(1024) NOT NULL,
    variables text NOT NULL,
    created_by_id integer,
    inventory_id integer NOT NULL,
    last_job_host_summary_id integer,
    modified_by_id integer,
    last_job_id integer,
    ansible_facts jsonb NOT NULL,
    ansible_facts_modified timestamp with time zone,
    insights_system_id text
);


ALTER TABLE public.main_host OWNER TO awx;

--
-- Name: main_host_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_host_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_host_id_seq OWNER TO awx;

--
-- Name: main_host_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_host_id_seq OWNED BY public.main_host.id;


--
-- Name: main_host_inventory_sources; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_host_inventory_sources (
    id integer NOT NULL,
    host_id integer NOT NULL,
    inventorysource_id integer NOT NULL
);


ALTER TABLE public.main_host_inventory_sources OWNER TO awx;

--
-- Name: main_host_inventory_sources_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_host_inventory_sources_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_host_inventory_sources_id_seq OWNER TO awx;

--
-- Name: main_host_inventory_sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_host_inventory_sources_id_seq OWNED BY public.main_host_inventory_sources.id;


--
-- Name: main_instance; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_instance (
    id integer NOT NULL,
    uuid character varying(40) NOT NULL,
    hostname character varying(250) NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    capacity integer NOT NULL,
    version character varying(120) NOT NULL,
    last_isolated_check timestamp with time zone,
    capacity_adjustment numeric(3,2) NOT NULL,
    cpu integer NOT NULL,
    memory bigint NOT NULL,
    cpu_capacity integer NOT NULL,
    mem_capacity integer NOT NULL,
    enabled boolean NOT NULL,
    managed_by_policy boolean NOT NULL,
    ip_address character varying(50),
    CONSTRAINT main_instance_capacity_check CHECK ((capacity >= 0))
);


ALTER TABLE public.main_instance OWNER TO awx;

--
-- Name: main_instance_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_instance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_instance_id_seq OWNER TO awx;

--
-- Name: main_instance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_instance_id_seq OWNED BY public.main_instance.id;


--
-- Name: main_instancegroup; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_instancegroup (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    controller_id integer,
    policy_instance_list text NOT NULL,
    policy_instance_minimum integer NOT NULL,
    policy_instance_percentage integer NOT NULL,
    credential_id integer,
    pod_spec_override text NOT NULL
);


ALTER TABLE public.main_instancegroup OWNER TO awx;

--
-- Name: main_instancegroup_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_instancegroup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_instancegroup_id_seq OWNER TO awx;

--
-- Name: main_instancegroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_instancegroup_id_seq OWNED BY public.main_instancegroup.id;


--
-- Name: main_instancegroup_instances; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_instancegroup_instances (
    id integer NOT NULL,
    instancegroup_id integer NOT NULL,
    instance_id integer NOT NULL
);


ALTER TABLE public.main_instancegroup_instances OWNER TO awx;

--
-- Name: main_instancegroup_instances_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_instancegroup_instances_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_instancegroup_instances_id_seq OWNER TO awx;

--
-- Name: main_instancegroup_instances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_instancegroup_instances_id_seq OWNED BY public.main_instancegroup_instances.id;


--
-- Name: main_inventory; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_inventory (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    description text NOT NULL,
    name character varying(512) NOT NULL,
    variables text NOT NULL,
    has_active_failures boolean NOT NULL,
    total_hosts integer NOT NULL,
    hosts_with_active_failures integer NOT NULL,
    total_groups integer NOT NULL,
    has_inventory_sources boolean NOT NULL,
    total_inventory_sources integer NOT NULL,
    inventory_sources_with_failures integer NOT NULL,
    created_by_id integer,
    modified_by_id integer,
    organization_id integer,
    admin_role_id integer,
    adhoc_role_id integer,
    update_role_id integer,
    use_role_id integer,
    read_role_id integer,
    host_filter text,
    kind character varying(32) NOT NULL,
    pending_deletion boolean NOT NULL,
    insights_credential_id integer,
    CONSTRAINT main_inventory_hosts_with_active_failures_check CHECK ((hosts_with_active_failures >= 0)),
    CONSTRAINT main_inventory_inventory_sources_with_failures_check CHECK ((inventory_sources_with_failures >= 0)),
    CONSTRAINT main_inventory_total_groups_check CHECK ((total_groups >= 0)),
    CONSTRAINT main_inventory_total_hosts_check CHECK ((total_hosts >= 0)),
    CONSTRAINT main_inventory_total_inventory_sources_check CHECK ((total_inventory_sources >= 0))
);


ALTER TABLE public.main_inventory OWNER TO awx;

--
-- Name: main_inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_inventory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_inventory_id_seq OWNER TO awx;

--
-- Name: main_inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_inventory_id_seq OWNED BY public.main_inventory.id;


--
-- Name: main_inventoryinstancegroupmembership; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_inventoryinstancegroupmembership (
    id integer NOT NULL,
    "position" integer,
    instancegroup_id integer NOT NULL,
    inventory_id integer NOT NULL,
    CONSTRAINT main_inventoryinstancegroupmembership_position_check CHECK (("position" >= 0))
);


ALTER TABLE public.main_inventoryinstancegroupmembership OWNER TO awx;

--
-- Name: main_inventoryinstancegroupmembership_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_inventoryinstancegroupmembership_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_inventoryinstancegroupmembership_id_seq OWNER TO awx;

--
-- Name: main_inventoryinstancegroupmembership_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_inventoryinstancegroupmembership_id_seq OWNED BY public.main_inventoryinstancegroupmembership.id;


--
-- Name: main_inventorysource; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_inventorysource (
    unifiedjobtemplate_ptr_id integer NOT NULL,
    source character varying(32) NOT NULL,
    source_path character varying(1024) NOT NULL,
    source_vars text NOT NULL,
    overwrite boolean NOT NULL,
    overwrite_vars boolean NOT NULL,
    update_on_launch boolean NOT NULL,
    update_cache_timeout integer NOT NULL,
    inventory_id integer,
    source_script_id integer,
    timeout integer NOT NULL,
    scm_last_revision character varying(1024) NOT NULL,
    source_project_id integer,
    update_on_project_update boolean NOT NULL,
    verbosity integer NOT NULL,
    custom_virtualenv character varying(100),
    enabled_value text NOT NULL,
    enabled_var text NOT NULL,
    host_filter text NOT NULL,
    CONSTRAINT main_inventorysource_update_cache_timeout_check CHECK ((update_cache_timeout >= 0)),
    CONSTRAINT main_inventorysource_verbosity_check CHECK ((verbosity >= 0))
);


ALTER TABLE public.main_inventorysource OWNER TO awx;

--
-- Name: main_inventoryupdate; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_inventoryupdate (
    unifiedjob_ptr_id integer NOT NULL,
    source character varying(32) NOT NULL,
    source_path character varying(1024) NOT NULL,
    source_vars text NOT NULL,
    overwrite boolean NOT NULL,
    overwrite_vars boolean NOT NULL,
    license_error boolean NOT NULL,
    inventory_source_id integer NOT NULL,
    source_script_id integer,
    timeout integer NOT NULL,
    source_project_update_id integer,
    verbosity integer NOT NULL,
    inventory_id integer,
    custom_virtualenv character varying(100),
    org_host_limit_error boolean NOT NULL,
    enabled_value text NOT NULL,
    enabled_var text NOT NULL,
    host_filter text NOT NULL,
    CONSTRAINT main_inventoryupdate_verbosity_check CHECK ((verbosity >= 0))
);


ALTER TABLE public.main_inventoryupdate OWNER TO awx;

--
-- Name: main_inventoryupdateevent_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_inventoryupdateevent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_inventoryupdateevent_id_seq OWNER TO awx;

--
-- Name: main_inventoryupdateevent; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_inventoryupdateevent (
    id bigint DEFAULT nextval('public.main_inventoryupdateevent_id_seq'::regclass) NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    event_data text NOT NULL,
    uuid character varying(1024) NOT NULL,
    counter integer NOT NULL,
    stdout text NOT NULL,
    verbosity integer NOT NULL,
    start_line integer NOT NULL,
    end_line integer NOT NULL,
    inventory_update_id integer NOT NULL,
    CONSTRAINT main_inventoryupdateevent_counter_check CHECK ((counter >= 0)),
    CONSTRAINT main_inventoryupdateevent_end_line_check CHECK ((end_line >= 0)),
    CONSTRAINT main_inventoryupdateevent_start_line_check CHECK ((start_line >= 0)),
    CONSTRAINT main_inventoryupdateevent_verbosity_check CHECK ((verbosity >= 0))
);


ALTER TABLE public.main_inventoryupdateevent OWNER TO awx;

--
-- Name: main_job; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_job (
    unifiedjob_ptr_id integer NOT NULL,
    job_type character varying(64) NOT NULL,
    playbook character varying(1024) NOT NULL,
    forks integer NOT NULL,
    "limit" text NOT NULL,
    verbosity integer NOT NULL,
    extra_vars text NOT NULL,
    job_tags character varying(1024) NOT NULL,
    force_handlers boolean NOT NULL,
    skip_tags character varying(1024) NOT NULL,
    start_at_task character varying(1024) NOT NULL,
    become_enabled boolean NOT NULL,
    inventory_id integer,
    job_template_id integer,
    project_id integer,
    survey_passwords text NOT NULL,
    allow_simultaneous boolean NOT NULL,
    artifacts text NOT NULL,
    timeout integer NOT NULL,
    scm_revision character varying(1024) NOT NULL,
    project_update_id integer,
    use_fact_cache boolean NOT NULL,
    diff_mode boolean NOT NULL,
    job_slice_count integer NOT NULL,
    job_slice_number integer NOT NULL,
    custom_virtualenv character varying(100),
    scm_branch character varying(1024) NOT NULL,
    webhook_credential_id integer,
    webhook_guid character varying(128) NOT NULL,
    webhook_service character varying(16) NOT NULL,
    CONSTRAINT main_job_forks_check CHECK ((forks >= 0)),
    CONSTRAINT main_job_job_slice_count_check CHECK ((job_slice_count >= 0)),
    CONSTRAINT main_job_job_slice_number_check CHECK ((job_slice_number >= 0)),
    CONSTRAINT main_job_verbosity_check CHECK ((verbosity >= 0))
);


ALTER TABLE public.main_job OWNER TO awx;

--
-- Name: main_jobevent_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_jobevent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_jobevent_id_seq OWNER TO awx;

--
-- Name: main_jobevent; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_jobevent (
    id bigint DEFAULT nextval('public.main_jobevent_id_seq'::regclass) NOT NULL,
    created timestamp with time zone,
    modified timestamp with time zone NOT NULL,
    event character varying(100) NOT NULL,
    event_data text NOT NULL,
    failed boolean NOT NULL,
    changed boolean NOT NULL,
    host_name character varying(1024) NOT NULL,
    play character varying(1024) NOT NULL,
    role character varying(1024) NOT NULL,
    task character varying(1024) NOT NULL,
    counter integer NOT NULL,
    host_id integer,
    job_id integer NOT NULL,
    uuid character varying(1024) NOT NULL,
    parent_uuid character varying(1024) NOT NULL,
    end_line integer NOT NULL,
    playbook character varying(1024) NOT NULL,
    start_line integer NOT NULL,
    stdout text NOT NULL,
    verbosity integer NOT NULL,
    CONSTRAINT main_jobevent_counter_check CHECK ((counter >= 0)),
    CONSTRAINT main_jobevent_end_line_check CHECK ((end_line >= 0)),
    CONSTRAINT main_jobevent_start_line_check CHECK ((start_line >= 0)),
    CONSTRAINT main_jobevent_verbosity_check CHECK ((verbosity >= 0))
);


ALTER TABLE public.main_jobevent OWNER TO awx;

--
-- Name: main_jobhostsummary; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_jobhostsummary (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    host_name character varying(1024) NOT NULL,
    changed integer NOT NULL,
    dark integer NOT NULL,
    failures integer NOT NULL,
    ok integer NOT NULL,
    processed integer NOT NULL,
    skipped integer NOT NULL,
    failed boolean NOT NULL,
    host_id integer,
    job_id integer NOT NULL,
    ignored integer NOT NULL,
    rescued integer NOT NULL,
    CONSTRAINT main_jobhostsummary_changed_check CHECK ((changed >= 0)),
    CONSTRAINT main_jobhostsummary_dark_check CHECK ((dark >= 0)),
    CONSTRAINT main_jobhostsummary_failures_check CHECK ((failures >= 0)),
    CONSTRAINT main_jobhostsummary_ignored_check CHECK ((ignored >= 0)),
    CONSTRAINT main_jobhostsummary_ok_check CHECK ((ok >= 0)),
    CONSTRAINT main_jobhostsummary_processed_check CHECK ((processed >= 0)),
    CONSTRAINT main_jobhostsummary_rescued_check CHECK ((rescued >= 0)),
    CONSTRAINT main_jobhostsummary_skipped_check CHECK ((skipped >= 0))
);


ALTER TABLE public.main_jobhostsummary OWNER TO awx;

--
-- Name: main_jobhostsummary_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_jobhostsummary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_jobhostsummary_id_seq OWNER TO awx;

--
-- Name: main_jobhostsummary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_jobhostsummary_id_seq OWNED BY public.main_jobhostsummary.id;


--
-- Name: main_joblaunchconfig; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_joblaunchconfig (
    id integer NOT NULL,
    extra_data text NOT NULL,
    survey_passwords text NOT NULL,
    char_prompts text NOT NULL,
    inventory_id integer,
    job_id integer NOT NULL
);


ALTER TABLE public.main_joblaunchconfig OWNER TO awx;

--
-- Name: main_joblaunchconfig_credentials; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_joblaunchconfig_credentials (
    id integer NOT NULL,
    joblaunchconfig_id integer NOT NULL,
    credential_id integer NOT NULL
);


ALTER TABLE public.main_joblaunchconfig_credentials OWNER TO awx;

--
-- Name: main_joblaunchconfig_credentials_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_joblaunchconfig_credentials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_joblaunchconfig_credentials_id_seq OWNER TO awx;

--
-- Name: main_joblaunchconfig_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_joblaunchconfig_credentials_id_seq OWNED BY public.main_joblaunchconfig_credentials.id;


--
-- Name: main_joblaunchconfig_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_joblaunchconfig_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_joblaunchconfig_id_seq OWNER TO awx;

--
-- Name: main_joblaunchconfig_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_joblaunchconfig_id_seq OWNED BY public.main_joblaunchconfig.id;


--
-- Name: main_jobtemplate; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_jobtemplate (
    unifiedjobtemplate_ptr_id integer NOT NULL,
    job_type character varying(64) NOT NULL,
    playbook character varying(1024) NOT NULL,
    forks integer NOT NULL,
    "limit" text NOT NULL,
    verbosity integer NOT NULL,
    extra_vars text NOT NULL,
    job_tags character varying(1024) NOT NULL,
    force_handlers boolean NOT NULL,
    skip_tags character varying(1024) NOT NULL,
    start_at_task character varying(1024) NOT NULL,
    become_enabled boolean NOT NULL,
    host_config_key character varying(1024) NOT NULL,
    ask_variables_on_launch boolean NOT NULL,
    survey_enabled boolean NOT NULL,
    survey_spec text NOT NULL,
    inventory_id integer,
    project_id integer,
    admin_role_id integer,
    execute_role_id integer,
    read_role_id integer,
    ask_limit_on_launch boolean NOT NULL,
    ask_inventory_on_launch boolean NOT NULL,
    ask_credential_on_launch boolean NOT NULL,
    ask_job_type_on_launch boolean NOT NULL,
    ask_tags_on_launch boolean NOT NULL,
    allow_simultaneous boolean NOT NULL,
    ask_skip_tags_on_launch boolean NOT NULL,
    timeout integer NOT NULL,
    use_fact_cache boolean NOT NULL,
    ask_verbosity_on_launch boolean NOT NULL,
    ask_diff_mode_on_launch boolean NOT NULL,
    diff_mode boolean NOT NULL,
    custom_virtualenv character varying(100),
    job_slice_count integer NOT NULL,
    ask_scm_branch_on_launch boolean NOT NULL,
    scm_branch character varying(1024) NOT NULL,
    webhook_credential_id integer,
    webhook_key character varying(64) NOT NULL,
    webhook_service character varying(16) NOT NULL,
    CONSTRAINT main_jobtemplate_forks_check CHECK ((forks >= 0)),
    CONSTRAINT main_jobtemplate_job_slice_count_check CHECK ((job_slice_count >= 0)),
    CONSTRAINT main_jobtemplate_verbosity_check CHECK ((verbosity >= 0))
);


ALTER TABLE public.main_jobtemplate OWNER TO awx;

--
-- Name: main_label; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_label (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    description text NOT NULL,
    name character varying(512) NOT NULL,
    created_by_id integer,
    modified_by_id integer,
    organization_id integer NOT NULL
);


ALTER TABLE public.main_label OWNER TO awx;

--
-- Name: main_label_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_label_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_label_id_seq OWNER TO awx;

--
-- Name: main_label_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_label_id_seq OWNED BY public.main_label.id;


--
-- Name: main_notification; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_notification (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    status character varying(20) NOT NULL,
    error text NOT NULL,
    notifications_sent integer NOT NULL,
    notification_type character varying(32) NOT NULL,
    recipients text NOT NULL,
    subject text NOT NULL,
    body text NOT NULL,
    notification_template_id integer NOT NULL
);


ALTER TABLE public.main_notification OWNER TO awx;

--
-- Name: main_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_notification_id_seq OWNER TO awx;

--
-- Name: main_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_notification_id_seq OWNED BY public.main_notification.id;


--
-- Name: main_notificationtemplate; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_notificationtemplate (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    description text NOT NULL,
    name character varying(512) NOT NULL,
    notification_type character varying(32) NOT NULL,
    notification_configuration text NOT NULL,
    created_by_id integer,
    modified_by_id integer,
    organization_id integer,
    messages text
);


ALTER TABLE public.main_notificationtemplate OWNER TO awx;

--
-- Name: main_notificationtemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_notificationtemplate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_notificationtemplate_id_seq OWNER TO awx;

--
-- Name: main_notificationtemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_notificationtemplate_id_seq OWNED BY public.main_notificationtemplate.id;


--
-- Name: main_oauth2accesstoken; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_oauth2accesstoken (
    id bigint NOT NULL,
    token character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    scope text NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    description text NOT NULL,
    last_used timestamp with time zone,
    application_id bigint,
    user_id integer,
    source_refresh_token_id bigint,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.main_oauth2accesstoken OWNER TO awx;

--
-- Name: main_oauth2accesstoken_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_oauth2accesstoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_oauth2accesstoken_id_seq OWNER TO awx;

--
-- Name: main_oauth2accesstoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_oauth2accesstoken_id_seq OWNED BY public.main_oauth2accesstoken.id;


--
-- Name: main_oauth2application; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_oauth2application (
    id bigint NOT NULL,
    client_id character varying(100) NOT NULL,
    redirect_uris text NOT NULL,
    client_type character varying(32) NOT NULL,
    authorization_grant_type character varying(32) NOT NULL,
    client_secret character varying(1024) NOT NULL,
    name character varying(255) NOT NULL,
    skip_authorization boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    description text NOT NULL,
    logo_data text NOT NULL,
    user_id integer,
    organization_id integer
);


ALTER TABLE public.main_oauth2application OWNER TO awx;

--
-- Name: main_oauth2application_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_oauth2application_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_oauth2application_id_seq OWNER TO awx;

--
-- Name: main_oauth2application_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_oauth2application_id_seq OWNED BY public.main_oauth2application.id;


--
-- Name: main_organization; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_organization (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    description text NOT NULL,
    name character varying(512) NOT NULL,
    created_by_id integer,
    modified_by_id integer,
    admin_role_id integer,
    auditor_role_id integer,
    member_role_id integer,
    read_role_id integer,
    custom_virtualenv character varying(100),
    execute_role_id integer,
    job_template_admin_role_id integer,
    credential_admin_role_id integer,
    inventory_admin_role_id integer,
    project_admin_role_id integer,
    workflow_admin_role_id integer,
    notification_admin_role_id integer,
    max_hosts integer NOT NULL,
    approval_role_id integer,
    CONSTRAINT main_organization_max_hosts_check CHECK ((max_hosts >= 0))
);


ALTER TABLE public.main_organization OWNER TO awx;

--
-- Name: main_organization_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_organization_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_organization_id_seq OWNER TO awx;

--
-- Name: main_organization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_organization_id_seq OWNED BY public.main_organization.id;


--
-- Name: main_organization_notification_templates_approvals; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_organization_notification_templates_approvals (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    notificationtemplate_id integer NOT NULL
);


ALTER TABLE public.main_organization_notification_templates_approvals OWNER TO awx;

--
-- Name: main_organization_notification_templates_approvals_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_organization_notification_templates_approvals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_organization_notification_templates_approvals_id_seq OWNER TO awx;

--
-- Name: main_organization_notification_templates_approvals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_organization_notification_templates_approvals_id_seq OWNED BY public.main_organization_notification_templates_approvals.id;


--
-- Name: main_organization_notification_templates_error; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_organization_notification_templates_error (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    notificationtemplate_id integer NOT NULL
);


ALTER TABLE public.main_organization_notification_templates_error OWNER TO awx;

--
-- Name: main_organization_notification_templates_error_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_organization_notification_templates_error_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_organization_notification_templates_error_id_seq OWNER TO awx;

--
-- Name: main_organization_notification_templates_error_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_organization_notification_templates_error_id_seq OWNED BY public.main_organization_notification_templates_error.id;


--
-- Name: main_organization_notification_templates_started; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_organization_notification_templates_started (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    notificationtemplate_id integer NOT NULL
);


ALTER TABLE public.main_organization_notification_templates_started OWNER TO awx;

--
-- Name: main_organization_notification_templates_started_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_organization_notification_templates_started_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_organization_notification_templates_started_id_seq OWNER TO awx;

--
-- Name: main_organization_notification_templates_started_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_organization_notification_templates_started_id_seq OWNED BY public.main_organization_notification_templates_started.id;


--
-- Name: main_organization_notification_templates_success; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_organization_notification_templates_success (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    notificationtemplate_id integer NOT NULL
);


ALTER TABLE public.main_organization_notification_templates_success OWNER TO awx;

--
-- Name: main_organization_notification_templates_success_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_organization_notification_templates_success_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_organization_notification_templates_success_id_seq OWNER TO awx;

--
-- Name: main_organization_notification_templates_success_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_organization_notification_templates_success_id_seq OWNED BY public.main_organization_notification_templates_success.id;


--
-- Name: main_organizationgalaxycredentialmembership; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_organizationgalaxycredentialmembership (
    id integer NOT NULL,
    "position" integer,
    credential_id integer NOT NULL,
    organization_id integer NOT NULL,
    CONSTRAINT main_organizationgalaxycredentialmembership_position_check CHECK (("position" >= 0))
);


ALTER TABLE public.main_organizationgalaxycredentialmembership OWNER TO awx;

--
-- Name: main_organizationgalaxycredentialmembership_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_organizationgalaxycredentialmembership_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_organizationgalaxycredentialmembership_id_seq OWNER TO awx;

--
-- Name: main_organizationgalaxycredentialmembership_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_organizationgalaxycredentialmembership_id_seq OWNED BY public.main_organizationgalaxycredentialmembership.id;


--
-- Name: main_organizationinstancegroupmembership; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_organizationinstancegroupmembership (
    id integer NOT NULL,
    "position" integer,
    instancegroup_id integer NOT NULL,
    organization_id integer NOT NULL,
    CONSTRAINT main_organizationinstancegroupmembership_position_check CHECK (("position" >= 0))
);


ALTER TABLE public.main_organizationinstancegroupmembership OWNER TO awx;

--
-- Name: main_organizationinstancegroupmembership_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_organizationinstancegroupmembership_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_organizationinstancegroupmembership_id_seq OWNER TO awx;

--
-- Name: main_organizationinstancegroupmembership_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_organizationinstancegroupmembership_id_seq OWNED BY public.main_organizationinstancegroupmembership.id;


--
-- Name: main_profile; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_profile (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    ldap_dn character varying(1024) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.main_profile OWNER TO awx;

--
-- Name: main_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_profile_id_seq OWNER TO awx;

--
-- Name: main_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_profile_id_seq OWNED BY public.main_profile.id;


--
-- Name: main_project; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_project (
    unifiedjobtemplate_ptr_id integer NOT NULL,
    local_path character varying(1024) NOT NULL,
    scm_type character varying(8) NOT NULL,
    scm_url character varying(1024) NOT NULL,
    scm_branch character varying(256) NOT NULL,
    scm_clean boolean NOT NULL,
    scm_delete_on_update boolean NOT NULL,
    scm_update_on_launch boolean NOT NULL,
    scm_update_cache_timeout integer NOT NULL,
    credential_id integer,
    admin_role_id integer,
    use_role_id integer,
    update_role_id integer,
    read_role_id integer,
    timeout integer NOT NULL,
    scm_revision character varying(1024) NOT NULL,
    playbook_files text NOT NULL,
    inventory_files text NOT NULL,
    custom_virtualenv character varying(100),
    scm_refspec character varying(1024) NOT NULL,
    allow_override boolean NOT NULL,
    CONSTRAINT main_project_scm_update_cache_timeout_check CHECK ((scm_update_cache_timeout >= 0))
);


ALTER TABLE public.main_project OWNER TO awx;

--
-- Name: main_projectupdate; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_projectupdate (
    unifiedjob_ptr_id integer NOT NULL,
    local_path character varying(1024) NOT NULL,
    scm_type character varying(8) NOT NULL,
    scm_url character varying(1024) NOT NULL,
    scm_branch character varying(256) NOT NULL,
    scm_clean boolean NOT NULL,
    scm_delete_on_update boolean NOT NULL,
    credential_id integer,
    project_id integer NOT NULL,
    timeout integer NOT NULL,
    job_type character varying(64) NOT NULL,
    scm_refspec character varying(1024) NOT NULL,
    scm_revision character varying(1024) NOT NULL,
    job_tags character varying(1024) NOT NULL
);


ALTER TABLE public.main_projectupdate OWNER TO awx;

--
-- Name: main_projectupdateevent_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_projectupdateevent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_projectupdateevent_id_seq OWNER TO awx;

--
-- Name: main_projectupdateevent; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_projectupdateevent (
    id bigint DEFAULT nextval('public.main_projectupdateevent_id_seq'::regclass) NOT NULL,
    created timestamp with time zone,
    modified timestamp with time zone NOT NULL,
    event character varying(100) NOT NULL,
    event_data text NOT NULL,
    failed boolean NOT NULL,
    changed boolean NOT NULL,
    uuid character varying(1024) NOT NULL,
    playbook character varying(1024) NOT NULL,
    play character varying(1024) NOT NULL,
    role character varying(1024) NOT NULL,
    task character varying(1024) NOT NULL,
    counter integer NOT NULL,
    stdout text NOT NULL,
    verbosity integer NOT NULL,
    start_line integer NOT NULL,
    end_line integer NOT NULL,
    project_update_id integer NOT NULL,
    CONSTRAINT main_projectupdateevent_counter_check CHECK ((counter >= 0)),
    CONSTRAINT main_projectupdateevent_end_line_check CHECK ((end_line >= 0)),
    CONSTRAINT main_projectupdateevent_start_line_check CHECK ((start_line >= 0)),
    CONSTRAINT main_projectupdateevent_verbosity_check CHECK ((verbosity >= 0))
);


ALTER TABLE public.main_projectupdateevent OWNER TO awx;

--
-- Name: main_rbac_role_ancestors; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_rbac_role_ancestors (
    id integer NOT NULL,
    role_field text NOT NULL,
    content_type_id integer NOT NULL,
    object_id integer NOT NULL,
    ancestor_id integer NOT NULL,
    descendent_id integer NOT NULL,
    CONSTRAINT main_rbac_role_ancestors_content_type_id_check CHECK ((content_type_id >= 0)),
    CONSTRAINT main_rbac_role_ancestors_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.main_rbac_role_ancestors OWNER TO awx;

--
-- Name: main_rbac_role_ancestors_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_rbac_role_ancestors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_rbac_role_ancestors_id_seq OWNER TO awx;

--
-- Name: main_rbac_role_ancestors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_rbac_role_ancestors_id_seq OWNED BY public.main_rbac_role_ancestors.id;


--
-- Name: main_rbac_roles; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_rbac_roles (
    id integer NOT NULL,
    role_field text NOT NULL,
    singleton_name text,
    implicit_parents text NOT NULL,
    content_type_id integer,
    object_id integer,
    CONSTRAINT main_rbac_roles_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.main_rbac_roles OWNER TO awx;

--
-- Name: main_rbac_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_rbac_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_rbac_roles_id_seq OWNER TO awx;

--
-- Name: main_rbac_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_rbac_roles_id_seq OWNED BY public.main_rbac_roles.id;


--
-- Name: main_rbac_roles_members; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_rbac_roles_members (
    id integer NOT NULL,
    role_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.main_rbac_roles_members OWNER TO awx;

--
-- Name: main_rbac_roles_members_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_rbac_roles_members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_rbac_roles_members_id_seq OWNER TO awx;

--
-- Name: main_rbac_roles_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_rbac_roles_members_id_seq OWNED BY public.main_rbac_roles_members.id;


--
-- Name: main_rbac_roles_parents; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_rbac_roles_parents (
    id integer NOT NULL,
    from_role_id integer NOT NULL,
    to_role_id integer NOT NULL
);


ALTER TABLE public.main_rbac_roles_parents OWNER TO awx;

--
-- Name: main_rbac_roles_parents_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_rbac_roles_parents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_rbac_roles_parents_id_seq OWNER TO awx;

--
-- Name: main_rbac_roles_parents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_rbac_roles_parents_id_seq OWNED BY public.main_rbac_roles_parents.id;


--
-- Name: main_schedule; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_schedule (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    description text NOT NULL,
    name character varying(512) NOT NULL,
    enabled boolean NOT NULL,
    dtstart timestamp with time zone,
    dtend timestamp with time zone,
    rrule character varying(255) NOT NULL,
    next_run timestamp with time zone,
    extra_data text NOT NULL,
    created_by_id integer,
    modified_by_id integer,
    unified_job_template_id integer NOT NULL,
    char_prompts text NOT NULL,
    inventory_id integer,
    survey_passwords text NOT NULL
);


ALTER TABLE public.main_schedule OWNER TO awx;

--
-- Name: main_schedule_credentials; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_schedule_credentials (
    id integer NOT NULL,
    schedule_id integer NOT NULL,
    credential_id integer NOT NULL
);


ALTER TABLE public.main_schedule_credentials OWNER TO awx;

--
-- Name: main_schedule_credentials_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_schedule_credentials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_schedule_credentials_id_seq OWNER TO awx;

--
-- Name: main_schedule_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_schedule_credentials_id_seq OWNED BY public.main_schedule_credentials.id;


--
-- Name: main_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_schedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_schedule_id_seq OWNER TO awx;

--
-- Name: main_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_schedule_id_seq OWNED BY public.main_schedule.id;


--
-- Name: main_smartinventorymembership; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_smartinventorymembership (
    id integer NOT NULL,
    host_id integer NOT NULL,
    inventory_id integer NOT NULL
);


ALTER TABLE public.main_smartinventorymembership OWNER TO awx;

--
-- Name: main_smartinventorymembership_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_smartinventorymembership_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_smartinventorymembership_id_seq OWNER TO awx;

--
-- Name: main_smartinventorymembership_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_smartinventorymembership_id_seq OWNED BY public.main_smartinventorymembership.id;


--
-- Name: main_systemjob; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_systemjob (
    unifiedjob_ptr_id integer NOT NULL,
    job_type character varying(32) NOT NULL,
    extra_vars text NOT NULL,
    system_job_template_id integer
);


ALTER TABLE public.main_systemjob OWNER TO awx;

--
-- Name: main_systemjobevent_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_systemjobevent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_systemjobevent_id_seq OWNER TO awx;

--
-- Name: main_systemjobevent; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_systemjobevent (
    id bigint DEFAULT nextval('public.main_systemjobevent_id_seq'::regclass) NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    event_data text NOT NULL,
    uuid character varying(1024) NOT NULL,
    counter integer NOT NULL,
    stdout text NOT NULL,
    verbosity integer NOT NULL,
    start_line integer NOT NULL,
    end_line integer NOT NULL,
    system_job_id integer NOT NULL,
    CONSTRAINT main_systemjobevent_counter_check CHECK ((counter >= 0)),
    CONSTRAINT main_systemjobevent_end_line_check CHECK ((end_line >= 0)),
    CONSTRAINT main_systemjobevent_start_line_check CHECK ((start_line >= 0)),
    CONSTRAINT main_systemjobevent_verbosity_check CHECK ((verbosity >= 0))
);


ALTER TABLE public.main_systemjobevent OWNER TO awx;

--
-- Name: main_systemjobtemplate; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_systemjobtemplate (
    unifiedjobtemplate_ptr_id integer NOT NULL,
    job_type character varying(32) NOT NULL
);


ALTER TABLE public.main_systemjobtemplate OWNER TO awx;

--
-- Name: main_team; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_team (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    description text NOT NULL,
    name character varying(512) NOT NULL,
    created_by_id integer,
    modified_by_id integer,
    organization_id integer NOT NULL,
    admin_role_id integer,
    member_role_id integer,
    read_role_id integer
);


ALTER TABLE public.main_team OWNER TO awx;

--
-- Name: main_team_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_team_id_seq OWNER TO awx;

--
-- Name: main_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_team_id_seq OWNED BY public.main_team.id;


--
-- Name: main_towerschedulestate; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_towerschedulestate (
    id integer NOT NULL,
    schedule_last_run timestamp with time zone NOT NULL
);


ALTER TABLE public.main_towerschedulestate OWNER TO awx;

--
-- Name: main_towerschedulestate_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_towerschedulestate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_towerschedulestate_id_seq OWNER TO awx;

--
-- Name: main_towerschedulestate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_towerschedulestate_id_seq OWNED BY public.main_towerschedulestate.id;


--
-- Name: main_unifiedjob; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_unifiedjob (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    description text NOT NULL,
    name character varying(512) NOT NULL,
    old_pk integer,
    launch_type character varying(20) NOT NULL,
    cancel_flag boolean NOT NULL,
    status character varying(20) NOT NULL,
    failed boolean NOT NULL,
    started timestamp with time zone,
    finished timestamp with time zone,
    elapsed numeric(12,3) NOT NULL,
    job_args text NOT NULL,
    job_cwd character varying(1024) NOT NULL,
    job_env text NOT NULL,
    job_explanation text NOT NULL,
    start_args text NOT NULL,
    result_stdout_text text,
    result_traceback text NOT NULL,
    celery_task_id character varying(100) NOT NULL,
    created_by_id integer,
    modified_by_id integer,
    polymorphic_ctype_id integer,
    schedule_id integer,
    unified_job_template_id integer,
    execution_node text NOT NULL,
    instance_group_id integer,
    emitted_events integer NOT NULL,
    controller_node text NOT NULL,
    canceled_on timestamp with time zone,
    dependencies_processed boolean NOT NULL,
    organization_id integer,
    CONSTRAINT main_unifiedjob_emitted_events_check CHECK ((emitted_events >= 0)),
    CONSTRAINT main_unifiedjob_old_pk_check CHECK ((old_pk >= 0))
);


ALTER TABLE public.main_unifiedjob OWNER TO awx;

--
-- Name: main_unifiedjob_credentials; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_unifiedjob_credentials (
    id integer NOT NULL,
    unifiedjob_id integer NOT NULL,
    credential_id integer NOT NULL
);


ALTER TABLE public.main_unifiedjob_credentials OWNER TO awx;

--
-- Name: main_unifiedjob_credentials_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_unifiedjob_credentials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_unifiedjob_credentials_id_seq OWNER TO awx;

--
-- Name: main_unifiedjob_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_unifiedjob_credentials_id_seq OWNED BY public.main_unifiedjob_credentials.id;


--
-- Name: main_unifiedjob_dependent_jobs; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_unifiedjob_dependent_jobs (
    id integer NOT NULL,
    from_unifiedjob_id integer NOT NULL,
    to_unifiedjob_id integer NOT NULL
);


ALTER TABLE public.main_unifiedjob_dependent_jobs OWNER TO awx;

--
-- Name: main_unifiedjob_dependent_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_unifiedjob_dependent_jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_unifiedjob_dependent_jobs_id_seq OWNER TO awx;

--
-- Name: main_unifiedjob_dependent_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_unifiedjob_dependent_jobs_id_seq OWNED BY public.main_unifiedjob_dependent_jobs.id;


--
-- Name: main_unifiedjob_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_unifiedjob_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_unifiedjob_id_seq OWNER TO awx;

--
-- Name: main_unifiedjob_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_unifiedjob_id_seq OWNED BY public.main_unifiedjob.id;


--
-- Name: main_unifiedjob_labels; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_unifiedjob_labels (
    id integer NOT NULL,
    unifiedjob_id integer NOT NULL,
    label_id integer NOT NULL
);


ALTER TABLE public.main_unifiedjob_labels OWNER TO awx;

--
-- Name: main_unifiedjob_labels_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_unifiedjob_labels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_unifiedjob_labels_id_seq OWNER TO awx;

--
-- Name: main_unifiedjob_labels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_unifiedjob_labels_id_seq OWNED BY public.main_unifiedjob_labels.id;


--
-- Name: main_unifiedjob_notifications; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_unifiedjob_notifications (
    id integer NOT NULL,
    unifiedjob_id integer NOT NULL,
    notification_id integer NOT NULL
);


ALTER TABLE public.main_unifiedjob_notifications OWNER TO awx;

--
-- Name: main_unifiedjob_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_unifiedjob_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_unifiedjob_notifications_id_seq OWNER TO awx;

--
-- Name: main_unifiedjob_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_unifiedjob_notifications_id_seq OWNED BY public.main_unifiedjob_notifications.id;


--
-- Name: main_unifiedjobtemplate; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_unifiedjobtemplate (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    description text NOT NULL,
    name character varying(512) NOT NULL,
    old_pk integer,
    last_job_failed boolean NOT NULL,
    last_job_run timestamp with time zone,
    next_job_run timestamp with time zone,
    status character varying(32) NOT NULL,
    created_by_id integer,
    current_job_id integer,
    last_job_id integer,
    modified_by_id integer,
    next_schedule_id integer,
    polymorphic_ctype_id integer,
    organization_id integer,
    CONSTRAINT main_unifiedjobtemplate_old_pk_check CHECK ((old_pk >= 0))
);


ALTER TABLE public.main_unifiedjobtemplate OWNER TO awx;

--
-- Name: main_unifiedjobtemplate_credentials; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_unifiedjobtemplate_credentials (
    id integer NOT NULL,
    unifiedjobtemplate_id integer NOT NULL,
    credential_id integer NOT NULL
);


ALTER TABLE public.main_unifiedjobtemplate_credentials OWNER TO awx;

--
-- Name: main_unifiedjobtemplate_credentials_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_unifiedjobtemplate_credentials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_unifiedjobtemplate_credentials_id_seq OWNER TO awx;

--
-- Name: main_unifiedjobtemplate_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_unifiedjobtemplate_credentials_id_seq OWNED BY public.main_unifiedjobtemplate_credentials.id;


--
-- Name: main_unifiedjobtemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_unifiedjobtemplate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_unifiedjobtemplate_id_seq OWNER TO awx;

--
-- Name: main_unifiedjobtemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_unifiedjobtemplate_id_seq OWNED BY public.main_unifiedjobtemplate.id;


--
-- Name: main_unifiedjobtemplate_labels; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_unifiedjobtemplate_labels (
    id integer NOT NULL,
    unifiedjobtemplate_id integer NOT NULL,
    label_id integer NOT NULL
);


ALTER TABLE public.main_unifiedjobtemplate_labels OWNER TO awx;

--
-- Name: main_unifiedjobtemplate_labels_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_unifiedjobtemplate_labels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_unifiedjobtemplate_labels_id_seq OWNER TO awx;

--
-- Name: main_unifiedjobtemplate_labels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_unifiedjobtemplate_labels_id_seq OWNED BY public.main_unifiedjobtemplate_labels.id;


--
-- Name: main_unifiedjobtemplate_notification_templates_error; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_unifiedjobtemplate_notification_templates_error (
    id integer NOT NULL,
    unifiedjobtemplate_id integer NOT NULL,
    notificationtemplate_id integer NOT NULL
);


ALTER TABLE public.main_unifiedjobtemplate_notification_templates_error OWNER TO awx;

--
-- Name: main_unifiedjobtemplate_notification_templates_error_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_unifiedjobtemplate_notification_templates_error_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_unifiedjobtemplate_notification_templates_error_id_seq OWNER TO awx;

--
-- Name: main_unifiedjobtemplate_notification_templates_error_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_unifiedjobtemplate_notification_templates_error_id_seq OWNED BY public.main_unifiedjobtemplate_notification_templates_error.id;


--
-- Name: main_unifiedjobtemplate_notification_templates_started; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_unifiedjobtemplate_notification_templates_started (
    id integer NOT NULL,
    unifiedjobtemplate_id integer NOT NULL,
    notificationtemplate_id integer NOT NULL
);


ALTER TABLE public.main_unifiedjobtemplate_notification_templates_started OWNER TO awx;

--
-- Name: main_unifiedjobtemplate_notification_templates_started_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_unifiedjobtemplate_notification_templates_started_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_unifiedjobtemplate_notification_templates_started_id_seq OWNER TO awx;

--
-- Name: main_unifiedjobtemplate_notification_templates_started_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_unifiedjobtemplate_notification_templates_started_id_seq OWNED BY public.main_unifiedjobtemplate_notification_templates_started.id;


--
-- Name: main_unifiedjobtemplate_notification_templates_success; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_unifiedjobtemplate_notification_templates_success (
    id integer NOT NULL,
    unifiedjobtemplate_id integer NOT NULL,
    notificationtemplate_id integer NOT NULL
);


ALTER TABLE public.main_unifiedjobtemplate_notification_templates_success OWNER TO awx;

--
-- Name: main_unifiedjobtemplate_notification_templates_success_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_unifiedjobtemplate_notification_templates_success_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_unifiedjobtemplate_notification_templates_success_id_seq OWNER TO awx;

--
-- Name: main_unifiedjobtemplate_notification_templates_success_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_unifiedjobtemplate_notification_templates_success_id_seq OWNED BY public.main_unifiedjobtemplate_notification_templates_success.id;


--
-- Name: main_unifiedjobtemplateinstancegroupmembership; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_unifiedjobtemplateinstancegroupmembership (
    id integer NOT NULL,
    "position" integer,
    instancegroup_id integer NOT NULL,
    unifiedjobtemplate_id integer NOT NULL,
    CONSTRAINT main_unifiedjobtemplateinstancegroupmembership_position_check CHECK (("position" >= 0))
);


ALTER TABLE public.main_unifiedjobtemplateinstancegroupmembership OWNER TO awx;

--
-- Name: main_unifiedjobtemplateinstancegroupmembership_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_unifiedjobtemplateinstancegroupmembership_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_unifiedjobtemplateinstancegroupmembership_id_seq OWNER TO awx;

--
-- Name: main_unifiedjobtemplateinstancegroupmembership_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_unifiedjobtemplateinstancegroupmembership_id_seq OWNED BY public.main_unifiedjobtemplateinstancegroupmembership.id;


--
-- Name: main_usersessionmembership; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_usersessionmembership (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    session_id character varying(40) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.main_usersessionmembership OWNER TO awx;

--
-- Name: main_usersessionmembership_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_usersessionmembership_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_usersessionmembership_id_seq OWNER TO awx;

--
-- Name: main_usersessionmembership_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_usersessionmembership_id_seq OWNED BY public.main_usersessionmembership.id;


--
-- Name: main_workflowapproval; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_workflowapproval (
    unifiedjob_ptr_id integer NOT NULL,
    workflow_approval_template_id integer,
    timeout integer NOT NULL,
    timed_out boolean NOT NULL,
    approved_or_denied_by_id integer
);


ALTER TABLE public.main_workflowapproval OWNER TO awx;

--
-- Name: main_workflowapprovaltemplate; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_workflowapprovaltemplate (
    unifiedjobtemplate_ptr_id integer NOT NULL,
    timeout integer NOT NULL
);


ALTER TABLE public.main_workflowapprovaltemplate OWNER TO awx;

--
-- Name: main_workflowjob; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_workflowjob (
    unifiedjob_ptr_id integer NOT NULL,
    extra_vars text NOT NULL,
    workflow_job_template_id integer,
    survey_passwords text NOT NULL,
    allow_simultaneous boolean NOT NULL,
    is_sliced_job boolean NOT NULL,
    job_template_id integer,
    char_prompts text NOT NULL,
    inventory_id integer,
    webhook_credential_id integer,
    webhook_guid character varying(128) NOT NULL,
    webhook_service character varying(16) NOT NULL
);


ALTER TABLE public.main_workflowjob OWNER TO awx;

--
-- Name: main_workflowjobnode; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_workflowjobnode (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    job_id integer,
    unified_job_template_id integer,
    workflow_job_id integer,
    char_prompts text NOT NULL,
    inventory_id integer,
    ancestor_artifacts text NOT NULL,
    extra_data text NOT NULL,
    survey_passwords text NOT NULL,
    do_not_run boolean NOT NULL,
    all_parents_must_converge boolean NOT NULL,
    identifier character varying(512) NOT NULL
);


ALTER TABLE public.main_workflowjobnode OWNER TO awx;

--
-- Name: main_workflowjobnode_always_nodes; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_workflowjobnode_always_nodes (
    id integer NOT NULL,
    from_workflowjobnode_id integer NOT NULL,
    to_workflowjobnode_id integer NOT NULL
);


ALTER TABLE public.main_workflowjobnode_always_nodes OWNER TO awx;

--
-- Name: main_workflowjobnode_always_nodes_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_workflowjobnode_always_nodes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_workflowjobnode_always_nodes_id_seq OWNER TO awx;

--
-- Name: main_workflowjobnode_always_nodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_workflowjobnode_always_nodes_id_seq OWNED BY public.main_workflowjobnode_always_nodes.id;


--
-- Name: main_workflowjobnode_credentials; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_workflowjobnode_credentials (
    id integer NOT NULL,
    workflowjobnode_id integer NOT NULL,
    credential_id integer NOT NULL
);


ALTER TABLE public.main_workflowjobnode_credentials OWNER TO awx;

--
-- Name: main_workflowjobnode_credentials_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_workflowjobnode_credentials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_workflowjobnode_credentials_id_seq OWNER TO awx;

--
-- Name: main_workflowjobnode_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_workflowjobnode_credentials_id_seq OWNED BY public.main_workflowjobnode_credentials.id;


--
-- Name: main_workflowjobnode_failure_nodes; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_workflowjobnode_failure_nodes (
    id integer NOT NULL,
    from_workflowjobnode_id integer NOT NULL,
    to_workflowjobnode_id integer NOT NULL
);


ALTER TABLE public.main_workflowjobnode_failure_nodes OWNER TO awx;

--
-- Name: main_workflowjobnode_failure_nodes_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_workflowjobnode_failure_nodes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_workflowjobnode_failure_nodes_id_seq OWNER TO awx;

--
-- Name: main_workflowjobnode_failure_nodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_workflowjobnode_failure_nodes_id_seq OWNED BY public.main_workflowjobnode_failure_nodes.id;


--
-- Name: main_workflowjobnode_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_workflowjobnode_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_workflowjobnode_id_seq OWNER TO awx;

--
-- Name: main_workflowjobnode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_workflowjobnode_id_seq OWNED BY public.main_workflowjobnode.id;


--
-- Name: main_workflowjobnode_success_nodes; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_workflowjobnode_success_nodes (
    id integer NOT NULL,
    from_workflowjobnode_id integer NOT NULL,
    to_workflowjobnode_id integer NOT NULL
);


ALTER TABLE public.main_workflowjobnode_success_nodes OWNER TO awx;

--
-- Name: main_workflowjobnode_success_nodes_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_workflowjobnode_success_nodes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_workflowjobnode_success_nodes_id_seq OWNER TO awx;

--
-- Name: main_workflowjobnode_success_nodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_workflowjobnode_success_nodes_id_seq OWNED BY public.main_workflowjobnode_success_nodes.id;


--
-- Name: main_workflowjobtemplate; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_workflowjobtemplate (
    unifiedjobtemplate_ptr_id integer NOT NULL,
    extra_vars text NOT NULL,
    admin_role_id integer,
    execute_role_id integer,
    read_role_id integer,
    survey_enabled boolean NOT NULL,
    survey_spec text NOT NULL,
    allow_simultaneous boolean NOT NULL,
    ask_variables_on_launch boolean NOT NULL,
    ask_inventory_on_launch boolean NOT NULL,
    inventory_id integer,
    approval_role_id integer,
    ask_limit_on_launch boolean NOT NULL,
    ask_scm_branch_on_launch boolean NOT NULL,
    char_prompts text NOT NULL,
    webhook_credential_id integer,
    webhook_key character varying(64) NOT NULL,
    webhook_service character varying(16) NOT NULL
);


ALTER TABLE public.main_workflowjobtemplate OWNER TO awx;

--
-- Name: main_workflowjobtemplate_notification_templates_approvals; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_workflowjobtemplate_notification_templates_approvals (
    id integer NOT NULL,
    workflowjobtemplate_id integer NOT NULL,
    notificationtemplate_id integer NOT NULL
);


ALTER TABLE public.main_workflowjobtemplate_notification_templates_approvals OWNER TO awx;

--
-- Name: main_workflowjobtemplate_notification_templates_approval_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_workflowjobtemplate_notification_templates_approval_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_workflowjobtemplate_notification_templates_approval_id_seq OWNER TO awx;

--
-- Name: main_workflowjobtemplate_notification_templates_approval_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_workflowjobtemplate_notification_templates_approval_id_seq OWNED BY public.main_workflowjobtemplate_notification_templates_approvals.id;


--
-- Name: main_workflowjobtemplatenode; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_workflowjobtemplatenode (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    unified_job_template_id integer,
    workflow_job_template_id integer NOT NULL,
    char_prompts text NOT NULL,
    inventory_id integer,
    extra_data text NOT NULL,
    survey_passwords text NOT NULL,
    all_parents_must_converge boolean NOT NULL,
    identifier character varying(512) NOT NULL
);


ALTER TABLE public.main_workflowjobtemplatenode OWNER TO awx;

--
-- Name: main_workflowjobtemplatenode_always_nodes; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_workflowjobtemplatenode_always_nodes (
    id integer NOT NULL,
    from_workflowjobtemplatenode_id integer NOT NULL,
    to_workflowjobtemplatenode_id integer NOT NULL
);


ALTER TABLE public.main_workflowjobtemplatenode_always_nodes OWNER TO awx;

--
-- Name: main_workflowjobtemplatenode_always_nodes_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_workflowjobtemplatenode_always_nodes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_workflowjobtemplatenode_always_nodes_id_seq OWNER TO awx;

--
-- Name: main_workflowjobtemplatenode_always_nodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_workflowjobtemplatenode_always_nodes_id_seq OWNED BY public.main_workflowjobtemplatenode_always_nodes.id;


--
-- Name: main_workflowjobtemplatenode_credentials; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_workflowjobtemplatenode_credentials (
    id integer NOT NULL,
    workflowjobtemplatenode_id integer NOT NULL,
    credential_id integer NOT NULL
);


ALTER TABLE public.main_workflowjobtemplatenode_credentials OWNER TO awx;

--
-- Name: main_workflowjobtemplatenode_credentials_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_workflowjobtemplatenode_credentials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_workflowjobtemplatenode_credentials_id_seq OWNER TO awx;

--
-- Name: main_workflowjobtemplatenode_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_workflowjobtemplatenode_credentials_id_seq OWNED BY public.main_workflowjobtemplatenode_credentials.id;


--
-- Name: main_workflowjobtemplatenode_failure_nodes; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_workflowjobtemplatenode_failure_nodes (
    id integer NOT NULL,
    from_workflowjobtemplatenode_id integer NOT NULL,
    to_workflowjobtemplatenode_id integer NOT NULL
);


ALTER TABLE public.main_workflowjobtemplatenode_failure_nodes OWNER TO awx;

--
-- Name: main_workflowjobtemplatenode_failure_nodes_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_workflowjobtemplatenode_failure_nodes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_workflowjobtemplatenode_failure_nodes_id_seq OWNER TO awx;

--
-- Name: main_workflowjobtemplatenode_failure_nodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_workflowjobtemplatenode_failure_nodes_id_seq OWNED BY public.main_workflowjobtemplatenode_failure_nodes.id;


--
-- Name: main_workflowjobtemplatenode_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_workflowjobtemplatenode_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_workflowjobtemplatenode_id_seq OWNER TO awx;

--
-- Name: main_workflowjobtemplatenode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_workflowjobtemplatenode_id_seq OWNED BY public.main_workflowjobtemplatenode.id;


--
-- Name: main_workflowjobtemplatenode_success_nodes; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.main_workflowjobtemplatenode_success_nodes (
    id integer NOT NULL,
    from_workflowjobtemplatenode_id integer NOT NULL,
    to_workflowjobtemplatenode_id integer NOT NULL
);


ALTER TABLE public.main_workflowjobtemplatenode_success_nodes OWNER TO awx;

--
-- Name: main_workflowjobtemplatenode_success_nodes_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.main_workflowjobtemplatenode_success_nodes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_workflowjobtemplatenode_success_nodes_id_seq OWNER TO awx;

--
-- Name: main_workflowjobtemplatenode_success_nodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.main_workflowjobtemplatenode_success_nodes_id_seq OWNED BY public.main_workflowjobtemplatenode_success_nodes.id;


--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.oauth2_provider_grant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_grant_id_seq OWNER TO awx;

--
-- Name: oauth2_provider_grant; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.oauth2_provider_grant (
    id bigint DEFAULT nextval('public.oauth2_provider_grant_id_seq'::regclass) NOT NULL,
    code character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    redirect_uri character varying(255) NOT NULL,
    scope text NOT NULL,
    application_id bigint NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);


ALTER TABLE public.oauth2_provider_grant OWNER TO awx;

--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.oauth2_provider_refreshtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_refreshtoken_id_seq OWNER TO awx;

--
-- Name: oauth2_provider_refreshtoken; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.oauth2_provider_refreshtoken (
    id bigint DEFAULT nextval('public.oauth2_provider_refreshtoken_id_seq'::regclass) NOT NULL,
    token character varying(255) NOT NULL,
    access_token_id bigint,
    application_id bigint NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    revoked timestamp with time zone
);


ALTER TABLE public.oauth2_provider_refreshtoken OWNER TO awx;

--
-- Name: social_auth_association; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.social_auth_association (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    secret character varying(255) NOT NULL,
    issued integer NOT NULL,
    lifetime integer NOT NULL,
    assoc_type character varying(64) NOT NULL
);


ALTER TABLE public.social_auth_association OWNER TO awx;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.social_auth_association_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_association_id_seq OWNER TO awx;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.social_auth_association_id_seq OWNED BY public.social_auth_association.id;


--
-- Name: social_auth_code; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.social_auth_code (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    code character varying(32) NOT NULL,
    verified boolean NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.social_auth_code OWNER TO awx;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.social_auth_code_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_code_id_seq OWNER TO awx;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.social_auth_code_id_seq OWNED BY public.social_auth_code.id;


--
-- Name: social_auth_nonce; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.social_auth_nonce (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    "timestamp" integer NOT NULL,
    salt character varying(65) NOT NULL
);


ALTER TABLE public.social_auth_nonce OWNER TO awx;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.social_auth_nonce_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_nonce_id_seq OWNER TO awx;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.social_auth_nonce_id_seq OWNED BY public.social_auth_nonce.id;


--
-- Name: social_auth_partial; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.social_auth_partial (
    id integer NOT NULL,
    token character varying(32) NOT NULL,
    next_step smallint NOT NULL,
    backend character varying(32) NOT NULL,
    data text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    CONSTRAINT social_auth_partial_next_step_check CHECK ((next_step >= 0))
);


ALTER TABLE public.social_auth_partial OWNER TO awx;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.social_auth_partial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_partial_id_seq OWNER TO awx;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.social_auth_partial_id_seq OWNED BY public.social_auth_partial.id;


--
-- Name: social_auth_usersocialauth; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.social_auth_usersocialauth (
    id integer NOT NULL,
    provider character varying(32) NOT NULL,
    uid character varying(255) NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.social_auth_usersocialauth OWNER TO awx;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.social_auth_usersocialauth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_usersocialauth_id_seq OWNER TO awx;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.social_auth_usersocialauth_id_seq OWNED BY public.social_auth_usersocialauth.id;


--
-- Name: sso_userenterpriseauth; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.sso_userenterpriseauth (
    id integer NOT NULL,
    provider character varying(32) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.sso_userenterpriseauth OWNER TO awx;

--
-- Name: sso_userenterpriseauth_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.sso_userenterpriseauth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sso_userenterpriseauth_id_seq OWNER TO awx;

--
-- Name: sso_userenterpriseauth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.sso_userenterpriseauth_id_seq OWNED BY public.sso_userenterpriseauth.id;


--
-- Name: taggit_tag; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.taggit_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


ALTER TABLE public.taggit_tag OWNER TO awx;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.taggit_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_tag_id_seq OWNER TO awx;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.taggit_tag_id_seq OWNED BY public.taggit_tag.id;


--
-- Name: taggit_taggeditem; Type: TABLE; Schema: public; Owner: awx
--

CREATE TABLE public.taggit_taggeditem (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.taggit_taggeditem OWNER TO awx;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: awx
--

CREATE SEQUENCE public.taggit_taggeditem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_taggeditem_id_seq OWNER TO awx;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: awx
--

ALTER SEQUENCE public.taggit_taggeditem_id_seq OWNED BY public.taggit_taggeditem.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: conf_setting id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.conf_setting ALTER COLUMN id SET DEFAULT nextval('public.conf_setting_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: main_activitystream id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_id_seq'::regclass);


--
-- Name: main_activitystream_ad_hoc_command id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_ad_hoc_command ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_ad_hoc_command_id_seq'::regclass);


--
-- Name: main_activitystream_credential id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_credential ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_credential_id_seq'::regclass);


--
-- Name: main_activitystream_credential_type id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_credential_type ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_credential_type_id_seq'::regclass);


--
-- Name: main_activitystream_custom_inventory_script id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_custom_inventory_script ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_custom_inventory_script_id_seq'::regclass);


--
-- Name: main_activitystream_group id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_group ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_group_id_seq'::regclass);


--
-- Name: main_activitystream_host id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_host ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_host_id_seq'::regclass);


--
-- Name: main_activitystream_instance id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_instance ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_instance_id_seq'::regclass);


--
-- Name: main_activitystream_instance_group id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_instance_group ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_instance_group_id_seq'::regclass);


--
-- Name: main_activitystream_inventory id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_inventory ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_inventory_id_seq'::regclass);


--
-- Name: main_activitystream_inventory_source id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_inventory_source ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_inventory_source_id_seq'::regclass);


--
-- Name: main_activitystream_inventory_update id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_inventory_update ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_inventory_update_id_seq'::regclass);


--
-- Name: main_activitystream_job id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_job ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_job_id_seq'::regclass);


--
-- Name: main_activitystream_job_template id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_job_template ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_job_template_id_seq'::regclass);


--
-- Name: main_activitystream_label id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_label ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_label_id_seq'::regclass);


--
-- Name: main_activitystream_notification id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_notification ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_notification_id_seq'::regclass);


--
-- Name: main_activitystream_notification_template id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_notification_template ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_notification_template_id_seq'::regclass);


--
-- Name: main_activitystream_o_auth2_access_token id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_o_auth2_access_token ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_o_auth2_access_token_id_seq'::regclass);


--
-- Name: main_activitystream_o_auth2_application id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_o_auth2_application ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_o_auth2_application_id_seq'::regclass);


--
-- Name: main_activitystream_organization id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_organization ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_organization_id_seq'::regclass);


--
-- Name: main_activitystream_project id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_project ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_project_id_seq'::regclass);


--
-- Name: main_activitystream_project_update id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_project_update ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_project_update_id_seq'::regclass);


--
-- Name: main_activitystream_role id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_role ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_role_id_seq'::regclass);


--
-- Name: main_activitystream_schedule id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_schedule ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_schedule_id_seq'::regclass);


--
-- Name: main_activitystream_team id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_team ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_team_id_seq'::regclass);


--
-- Name: main_activitystream_unified_job id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_unified_job ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_unified_job_id_seq'::regclass);


--
-- Name: main_activitystream_unified_job_template id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_unified_job_template ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_unified_job_template_id_seq'::regclass);


--
-- Name: main_activitystream_user id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_user ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_user_id_seq'::regclass);


--
-- Name: main_activitystream_workflow_approval id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_workflow_approval ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_workflow_approval_id_seq'::regclass);


--
-- Name: main_activitystream_workflow_approval_template id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_workflow_approval_template ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_workflow_approval_template_id_seq'::regclass);


--
-- Name: main_activitystream_workflow_job id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_workflow_job ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_workflow_job_id_seq'::regclass);


--
-- Name: main_activitystream_workflow_job_node id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_workflow_job_node ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_workflow_job_node_id_seq'::regclass);


--
-- Name: main_activitystream_workflow_job_template id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_workflow_job_template ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_workflow_job_template_id_seq'::regclass);


--
-- Name: main_activitystream_workflow_job_template_node id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_workflow_job_template_node ALTER COLUMN id SET DEFAULT nextval('public.main_activitystream_workflow_job_template_node_id_seq'::regclass);


--
-- Name: main_credential id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_credential ALTER COLUMN id SET DEFAULT nextval('public.main_credential_id_seq'::regclass);


--
-- Name: main_credentialinputsource id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_credentialinputsource ALTER COLUMN id SET DEFAULT nextval('public.main_credentialinputsource_id_seq'::regclass);


--
-- Name: main_credentialtype id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_credentialtype ALTER COLUMN id SET DEFAULT nextval('public.main_credentialtype_id_seq'::regclass);


--
-- Name: main_custominventoryscript id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_custominventoryscript ALTER COLUMN id SET DEFAULT nextval('public.main_custominventoryscript_id_seq'::regclass);


--
-- Name: main_group id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_group ALTER COLUMN id SET DEFAULT nextval('public.main_group_id_seq'::regclass);


--
-- Name: main_group_hosts id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_group_hosts ALTER COLUMN id SET DEFAULT nextval('public.main_group_hosts_id_seq'::regclass);


--
-- Name: main_group_inventory_sources id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_group_inventory_sources ALTER COLUMN id SET DEFAULT nextval('public.main_group_inventory_sources_id_seq'::regclass);


--
-- Name: main_group_parents id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_group_parents ALTER COLUMN id SET DEFAULT nextval('public.main_group_parents_id_seq'::regclass);


--
-- Name: main_host id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_host ALTER COLUMN id SET DEFAULT nextval('public.main_host_id_seq'::regclass);


--
-- Name: main_host_inventory_sources id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_host_inventory_sources ALTER COLUMN id SET DEFAULT nextval('public.main_host_inventory_sources_id_seq'::regclass);


--
-- Name: main_instance id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_instance ALTER COLUMN id SET DEFAULT nextval('public.main_instance_id_seq'::regclass);


--
-- Name: main_instancegroup id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_instancegroup ALTER COLUMN id SET DEFAULT nextval('public.main_instancegroup_id_seq'::regclass);


--
-- Name: main_instancegroup_instances id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_instancegroup_instances ALTER COLUMN id SET DEFAULT nextval('public.main_instancegroup_instances_id_seq'::regclass);


--
-- Name: main_inventory id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_inventory ALTER COLUMN id SET DEFAULT nextval('public.main_inventory_id_seq'::regclass);


--
-- Name: main_inventoryinstancegroupmembership id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_inventoryinstancegroupmembership ALTER COLUMN id SET DEFAULT nextval('public.main_inventoryinstancegroupmembership_id_seq'::regclass);


--
-- Name: main_jobhostsummary id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_jobhostsummary ALTER COLUMN id SET DEFAULT nextval('public.main_jobhostsummary_id_seq'::regclass);


--
-- Name: main_joblaunchconfig id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_joblaunchconfig ALTER COLUMN id SET DEFAULT nextval('public.main_joblaunchconfig_id_seq'::regclass);


--
-- Name: main_joblaunchconfig_credentials id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_joblaunchconfig_credentials ALTER COLUMN id SET DEFAULT nextval('public.main_joblaunchconfig_credentials_id_seq'::regclass);


--
-- Name: main_label id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_label ALTER COLUMN id SET DEFAULT nextval('public.main_label_id_seq'::regclass);


--
-- Name: main_notification id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_notification ALTER COLUMN id SET DEFAULT nextval('public.main_notification_id_seq'::regclass);


--
-- Name: main_notificationtemplate id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_notificationtemplate ALTER COLUMN id SET DEFAULT nextval('public.main_notificationtemplate_id_seq'::regclass);


--
-- Name: main_oauth2accesstoken id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_oauth2accesstoken ALTER COLUMN id SET DEFAULT nextval('public.main_oauth2accesstoken_id_seq'::regclass);


--
-- Name: main_oauth2application id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_oauth2application ALTER COLUMN id SET DEFAULT nextval('public.main_oauth2application_id_seq'::regclass);


--
-- Name: main_organization id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organization ALTER COLUMN id SET DEFAULT nextval('public.main_organization_id_seq'::regclass);


--
-- Name: main_organization_notification_templates_approvals id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organization_notification_templates_approvals ALTER COLUMN id SET DEFAULT nextval('public.main_organization_notification_templates_approvals_id_seq'::regclass);


--
-- Name: main_organization_notification_templates_error id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organization_notification_templates_error ALTER COLUMN id SET DEFAULT nextval('public.main_organization_notification_templates_error_id_seq'::regclass);


--
-- Name: main_organization_notification_templates_started id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organization_notification_templates_started ALTER COLUMN id SET DEFAULT nextval('public.main_organization_notification_templates_started_id_seq'::regclass);


--
-- Name: main_organization_notification_templates_success id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organization_notification_templates_success ALTER COLUMN id SET DEFAULT nextval('public.main_organization_notification_templates_success_id_seq'::regclass);


--
-- Name: main_organizationgalaxycredentialmembership id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organizationgalaxycredentialmembership ALTER COLUMN id SET DEFAULT nextval('public.main_organizationgalaxycredentialmembership_id_seq'::regclass);


--
-- Name: main_organizationinstancegroupmembership id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organizationinstancegroupmembership ALTER COLUMN id SET DEFAULT nextval('public.main_organizationinstancegroupmembership_id_seq'::regclass);


--
-- Name: main_profile id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_profile ALTER COLUMN id SET DEFAULT nextval('public.main_profile_id_seq'::regclass);


--
-- Name: main_rbac_role_ancestors id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_rbac_role_ancestors ALTER COLUMN id SET DEFAULT nextval('public.main_rbac_role_ancestors_id_seq'::regclass);


--
-- Name: main_rbac_roles id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_rbac_roles ALTER COLUMN id SET DEFAULT nextval('public.main_rbac_roles_id_seq'::regclass);


--
-- Name: main_rbac_roles_members id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_rbac_roles_members ALTER COLUMN id SET DEFAULT nextval('public.main_rbac_roles_members_id_seq'::regclass);


--
-- Name: main_rbac_roles_parents id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_rbac_roles_parents ALTER COLUMN id SET DEFAULT nextval('public.main_rbac_roles_parents_id_seq'::regclass);


--
-- Name: main_schedule id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_schedule ALTER COLUMN id SET DEFAULT nextval('public.main_schedule_id_seq'::regclass);


--
-- Name: main_schedule_credentials id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_schedule_credentials ALTER COLUMN id SET DEFAULT nextval('public.main_schedule_credentials_id_seq'::regclass);


--
-- Name: main_smartinventorymembership id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_smartinventorymembership ALTER COLUMN id SET DEFAULT nextval('public.main_smartinventorymembership_id_seq'::regclass);


--
-- Name: main_team id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_team ALTER COLUMN id SET DEFAULT nextval('public.main_team_id_seq'::regclass);


--
-- Name: main_towerschedulestate id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_towerschedulestate ALTER COLUMN id SET DEFAULT nextval('public.main_towerschedulestate_id_seq'::regclass);


--
-- Name: main_unifiedjob id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjob ALTER COLUMN id SET DEFAULT nextval('public.main_unifiedjob_id_seq'::regclass);


--
-- Name: main_unifiedjob_credentials id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjob_credentials ALTER COLUMN id SET DEFAULT nextval('public.main_unifiedjob_credentials_id_seq'::regclass);


--
-- Name: main_unifiedjob_dependent_jobs id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjob_dependent_jobs ALTER COLUMN id SET DEFAULT nextval('public.main_unifiedjob_dependent_jobs_id_seq'::regclass);


--
-- Name: main_unifiedjob_labels id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjob_labels ALTER COLUMN id SET DEFAULT nextval('public.main_unifiedjob_labels_id_seq'::regclass);


--
-- Name: main_unifiedjob_notifications id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjob_notifications ALTER COLUMN id SET DEFAULT nextval('public.main_unifiedjob_notifications_id_seq'::regclass);


--
-- Name: main_unifiedjobtemplate id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplate ALTER COLUMN id SET DEFAULT nextval('public.main_unifiedjobtemplate_id_seq'::regclass);


--
-- Name: main_unifiedjobtemplate_credentials id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_credentials ALTER COLUMN id SET DEFAULT nextval('public.main_unifiedjobtemplate_credentials_id_seq'::regclass);


--
-- Name: main_unifiedjobtemplate_labels id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_labels ALTER COLUMN id SET DEFAULT nextval('public.main_unifiedjobtemplate_labels_id_seq'::regclass);


--
-- Name: main_unifiedjobtemplate_notification_templates_error id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_notification_templates_error ALTER COLUMN id SET DEFAULT nextval('public.main_unifiedjobtemplate_notification_templates_error_id_seq'::regclass);


--
-- Name: main_unifiedjobtemplate_notification_templates_started id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_notification_templates_started ALTER COLUMN id SET DEFAULT nextval('public.main_unifiedjobtemplate_notification_templates_started_id_seq'::regclass);


--
-- Name: main_unifiedjobtemplate_notification_templates_success id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_notification_templates_success ALTER COLUMN id SET DEFAULT nextval('public.main_unifiedjobtemplate_notification_templates_success_id_seq'::regclass);


--
-- Name: main_unifiedjobtemplateinstancegroupmembership id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplateinstancegroupmembership ALTER COLUMN id SET DEFAULT nextval('public.main_unifiedjobtemplateinstancegroupmembership_id_seq'::regclass);


--
-- Name: main_usersessionmembership id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_usersessionmembership ALTER COLUMN id SET DEFAULT nextval('public.main_usersessionmembership_id_seq'::regclass);


--
-- Name: main_workflowjobnode id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobnode ALTER COLUMN id SET DEFAULT nextval('public.main_workflowjobnode_id_seq'::regclass);


--
-- Name: main_workflowjobnode_always_nodes id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobnode_always_nodes ALTER COLUMN id SET DEFAULT nextval('public.main_workflowjobnode_always_nodes_id_seq'::regclass);


--
-- Name: main_workflowjobnode_credentials id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobnode_credentials ALTER COLUMN id SET DEFAULT nextval('public.main_workflowjobnode_credentials_id_seq'::regclass);


--
-- Name: main_workflowjobnode_failure_nodes id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobnode_failure_nodes ALTER COLUMN id SET DEFAULT nextval('public.main_workflowjobnode_failure_nodes_id_seq'::regclass);


--
-- Name: main_workflowjobnode_success_nodes id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobnode_success_nodes ALTER COLUMN id SET DEFAULT nextval('public.main_workflowjobnode_success_nodes_id_seq'::regclass);


--
-- Name: main_workflowjobtemplate_notification_templates_approvals id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplate_notification_templates_approvals ALTER COLUMN id SET DEFAULT nextval('public.main_workflowjobtemplate_notification_templates_approval_id_seq'::regclass);


--
-- Name: main_workflowjobtemplatenode id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode ALTER COLUMN id SET DEFAULT nextval('public.main_workflowjobtemplatenode_id_seq'::regclass);


--
-- Name: main_workflowjobtemplatenode_always_nodes id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_always_nodes ALTER COLUMN id SET DEFAULT nextval('public.main_workflowjobtemplatenode_always_nodes_id_seq'::regclass);


--
-- Name: main_workflowjobtemplatenode_credentials id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_credentials ALTER COLUMN id SET DEFAULT nextval('public.main_workflowjobtemplatenode_credentials_id_seq'::regclass);


--
-- Name: main_workflowjobtemplatenode_failure_nodes id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_failure_nodes ALTER COLUMN id SET DEFAULT nextval('public.main_workflowjobtemplatenode_failure_nodes_id_seq'::regclass);


--
-- Name: main_workflowjobtemplatenode_success_nodes id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_success_nodes ALTER COLUMN id SET DEFAULT nextval('public.main_workflowjobtemplatenode_success_nodes_id_seq'::regclass);


--
-- Name: social_auth_association id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.social_auth_association ALTER COLUMN id SET DEFAULT nextval('public.social_auth_association_id_seq'::regclass);


--
-- Name: social_auth_code id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.social_auth_code ALTER COLUMN id SET DEFAULT nextval('public.social_auth_code_id_seq'::regclass);


--
-- Name: social_auth_nonce id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.social_auth_nonce ALTER COLUMN id SET DEFAULT nextval('public.social_auth_nonce_id_seq'::regclass);


--
-- Name: social_auth_partial id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.social_auth_partial ALTER COLUMN id SET DEFAULT nextval('public.social_auth_partial_id_seq'::regclass);


--
-- Name: social_auth_usersocialauth id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.social_auth_usersocialauth ALTER COLUMN id SET DEFAULT nextval('public.social_auth_usersocialauth_id_seq'::regclass);


--
-- Name: sso_userenterpriseauth id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.sso_userenterpriseauth ALTER COLUMN id SET DEFAULT nextval('public.sso_userenterpriseauth_id_seq'::regclass);


--
-- Name: taggit_tag id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.taggit_tag ALTER COLUMN id SET DEFAULT nextval('public.taggit_tag_id_seq'::regclass);


--
-- Name: taggit_taggeditem id; Type: DEFAULT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('public.taggit_taggeditem_id_seq'::regclass);


--
-- Data for Name: _old_main_adhoccommandevent; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public._old_main_adhoccommandevent (id, created, modified, host_name, event, event_data, failed, changed, counter, host_id, ad_hoc_command_id, end_line, start_line, stdout, uuid, verbosity) FROM stdin;
\.


--
-- Data for Name: _old_main_inventoryupdateevent; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public._old_main_inventoryupdateevent (id, created, modified, event_data, uuid, counter, stdout, verbosity, start_line, end_line, inventory_update_id) FROM stdin;
\.


--
-- Data for Name: _old_main_jobevent; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public._old_main_jobevent (id, created, modified, event, event_data, failed, changed, host_name, play, role, task, counter, host_id, job_id, uuid, parent_uuid, end_line, playbook, start_line, stdout, verbosity) FROM stdin;
\.


--
-- Data for Name: _old_main_projectupdateevent; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public._old_main_projectupdateevent (id, created, modified, event, event_data, failed, changed, uuid, playbook, play, role, task, counter, stdout, verbosity, start_line, end_line, project_update_id) FROM stdin;
\.


--
-- Data for Name: _old_main_systemjobevent; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public._old_main_systemjobevent (id, created, modified, event_data, uuid, counter, stdout, verbosity, start_line, end_line, system_job_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	12	add_permission
2	Can change permission	12	change_permission
3	Can delete permission	12	delete_permission
4	Can view permission	12	view_permission
5	Can add group	13	add_group
6	Can change group	13	change_group
7	Can delete group	13	delete_group
8	Can view group	13	view_group
9	Can add user	2	add_user
10	Can change user	2	change_user
11	Can delete user	2	delete_user
12	Can view user	2	view_user
13	Can add content type	14	add_contenttype
14	Can change content type	14	change_contenttype
15	Can delete content type	14	delete_contenttype
16	Can view content type	14	view_contenttype
17	Can add session	15	add_session
18	Can change session	15	change_session
19	Can delete session	15	delete_session
20	Can view session	15	view_session
21	Can add site	16	add_site
22	Can change site	16	change_site
23	Can delete site	16	delete_site
24	Can view site	16	view_site
25	Can add grant	17	add_grant
26	Can change grant	17	change_grant
27	Can delete grant	17	delete_grant
28	Can view grant	17	view_grant
29	Can add refresh token	18	add_refreshtoken
30	Can change refresh token	18	change_refreshtoken
31	Can delete refresh token	18	delete_refreshtoken
32	Can view refresh token	18	view_refreshtoken
33	Can add Tag	19	add_tag
34	Can change Tag	19	change_tag
35	Can delete Tag	19	delete_tag
36	Can view Tag	19	view_tag
37	Can add Tagged Item	20	add_taggeditem
38	Can change Tagged Item	20	change_taggeditem
39	Can delete Tagged Item	20	delete_taggeditem
40	Can view Tagged Item	20	view_taggeditem
41	Can add association	21	add_association
42	Can change association	21	change_association
43	Can delete association	21	delete_association
44	Can view association	21	view_association
45	Can add code	22	add_code
46	Can change code	22	change_code
47	Can delete code	22	delete_code
48	Can view code	22	view_code
49	Can add nonce	23	add_nonce
50	Can change nonce	23	change_nonce
51	Can delete nonce	23	delete_nonce
52	Can view nonce	23	view_nonce
53	Can add user social auth	24	add_usersocialauth
54	Can change user social auth	24	change_usersocialauth
55	Can delete user social auth	24	delete_usersocialauth
56	Can view user social auth	24	view_usersocialauth
57	Can add partial	25	add_partial
58	Can change partial	25	change_partial
59	Can delete partial	25	delete_partial
60	Can view partial	25	view_partial
61	Can add setting	26	add_setting
62	Can change setting	26	change_setting
63	Can delete setting	26	delete_setting
64	Can view setting	26	view_setting
65	Can add activity stream	27	add_activitystream
66	Can change activity stream	27	change_activitystream
67	Can delete activity stream	27	delete_activitystream
68	Can view activity stream	27	view_activitystream
69	Can add ad hoc command event	28	add_adhoccommandevent
70	Can change ad hoc command event	28	change_adhoccommandevent
71	Can delete ad hoc command event	28	delete_adhoccommandevent
72	Can view ad hoc command event	28	view_adhoccommandevent
73	Can add credential	29	add_credential
74	Can change credential	29	change_credential
75	Can delete credential	29	delete_credential
76	Can view credential	29	view_credential
77	Can add custom inventory script	30	add_custominventoryscript
78	Can change custom inventory script	30	change_custominventoryscript
79	Can delete custom inventory script	30	delete_custominventoryscript
80	Can view custom inventory script	30	view_custominventoryscript
81	Can add group	31	add_group
82	Can change group	31	change_group
83	Can delete group	31	delete_group
84	Can view group	31	view_group
85	Can add host	32	add_host
86	Can change host	32	change_host
87	Can delete host	32	delete_host
88	Can view host	32	view_host
89	Can add instance	33	add_instance
90	Can change instance	33	change_instance
91	Can delete instance	33	delete_instance
92	Can view instance	33	view_instance
93	Can add inventory	34	add_inventory
94	Can change inventory	34	change_inventory
95	Can delete inventory	34	delete_inventory
96	Can view inventory	34	view_inventory
97	Can add job event	35	add_jobevent
98	Can change job event	35	change_jobevent
99	Can delete job event	35	delete_jobevent
100	Can view job event	35	view_jobevent
101	Can add job host summary	36	add_jobhostsummary
102	Can change job host summary	36	change_jobhostsummary
103	Can delete job host summary	36	delete_jobhostsummary
104	Can view job host summary	36	view_jobhostsummary
105	Can add organization	37	add_organization
106	Can change organization	37	change_organization
107	Can delete organization	37	delete_organization
108	Can view organization	37	view_organization
109	Can add profile	38	add_profile
110	Can change profile	38	change_profile
111	Can delete profile	38	delete_profile
112	Can view profile	38	view_profile
113	Can add schedule	39	add_schedule
114	Can change schedule	39	change_schedule
115	Can delete schedule	39	delete_schedule
116	Can view schedule	39	view_schedule
117	Can add team	40	add_team
118	Can change team	40	change_team
119	Can delete team	40	delete_team
120	Can view team	40	view_team
121	Can add unified job	41	add_unifiedjob
122	Can change unified job	41	change_unifiedjob
123	Can delete unified job	41	delete_unifiedjob
124	Can view unified job	41	view_unifiedjob
125	Can add unified job template	42	add_unifiedjobtemplate
126	Can change unified job template	42	change_unifiedjobtemplate
127	Can delete unified job template	42	delete_unifiedjobtemplate
128	Can view unified job template	42	view_unifiedjobtemplate
129	Can add ad hoc command	7	add_adhoccommand
130	Can change ad hoc command	7	change_adhoccommand
131	Can delete ad hoc command	7	delete_adhoccommand
132	Can view ad hoc command	7	view_adhoccommand
133	Can add inventory source	3	add_inventorysource
134	Can change inventory source	3	change_inventorysource
135	Can delete inventory source	3	delete_inventorysource
136	Can view inventory source	3	view_inventorysource
137	Can add inventory update	8	add_inventoryupdate
138	Can change inventory update	8	change_inventoryupdate
139	Can delete inventory update	8	delete_inventoryupdate
140	Can view inventory update	8	view_inventoryupdate
141	Can add job	9	add_job
142	Can change job	9	change_job
143	Can delete job	9	delete_job
144	Can view job	9	view_job
145	Can add job template	4	add_jobtemplate
146	Can change job template	4	change_jobtemplate
147	Can delete job template	4	delete_jobtemplate
148	Can view job template	4	view_jobtemplate
149	Can add project	5	add_project
150	Can change project	5	change_project
151	Can delete project	5	delete_project
152	Can view project	5	view_project
153	Can add project update	10	add_projectupdate
154	Can change project update	10	change_projectupdate
155	Can delete project update	10	delete_projectupdate
156	Can view project update	10	view_projectupdate
157	Can add system job	43	add_systemjob
158	Can change system job	43	change_systemjob
159	Can delete system job	43	delete_systemjob
160	Can view system job	43	view_systemjob
161	Can add system job template	1	add_systemjobtemplate
162	Can change system job template	1	change_systemjobtemplate
163	Can delete system job template	1	delete_systemjobtemplate
164	Can view system job template	1	view_systemjobtemplate
165	Can add notification	44	add_notification
166	Can change notification	44	change_notification
167	Can delete notification	44	delete_notification
168	Can view notification	44	view_notification
169	Can add notification template	45	add_notificationtemplate
170	Can change notification template	45	change_notificationtemplate
171	Can delete notification template	45	delete_notificationtemplate
172	Can view notification template	45	view_notificationtemplate
173	Can add role	46	add_role
174	Can change role	46	change_role
175	Can delete role	46	delete_role
176	Can view role	46	view_role
177	Can add role ancestor entry	47	add_roleancestorentry
178	Can change role ancestor entry	47	change_roleancestorentry
179	Can delete role ancestor entry	47	delete_roleancestorentry
180	Can view role ancestor entry	47	view_roleancestorentry
181	Can add label	48	add_label
182	Can change label	48	change_label
183	Can delete label	48	delete_label
184	Can view label	48	view_label
185	Can add workflow job	11	add_workflowjob
186	Can change workflow job	11	change_workflowjob
187	Can delete workflow job	11	delete_workflowjob
188	Can view workflow job	11	view_workflowjob
189	Can add workflow job node	49	add_workflowjobnode
190	Can change workflow job node	49	change_workflowjobnode
191	Can delete workflow job node	49	delete_workflowjobnode
192	Can view workflow job node	49	view_workflowjobnode
193	Can add workflow job template	6	add_workflowjobtemplate
194	Can change workflow job template	6	change_workflowjobtemplate
195	Can delete workflow job template	6	delete_workflowjobtemplate
196	Can view workflow job template	6	view_workflowjobtemplate
197	Can add workflow job template node	50	add_workflowjobtemplatenode
198	Can change workflow job template node	50	change_workflowjobtemplatenode
199	Can delete workflow job template node	50	delete_workflowjobtemplatenode
200	Can view workflow job template node	50	view_workflowjobtemplatenode
201	Can add tower schedule state	51	add_towerschedulestate
202	Can change tower schedule state	51	change_towerschedulestate
203	Can delete tower schedule state	51	delete_towerschedulestate
204	Can view tower schedule state	51	view_towerschedulestate
205	Can add smart inventory membership	52	add_smartinventorymembership
206	Can change smart inventory membership	52	change_smartinventorymembership
207	Can delete smart inventory membership	52	delete_smartinventorymembership
208	Can view smart inventory membership	52	view_smartinventorymembership
209	Can add credential type	53	add_credentialtype
210	Can change credential type	53	change_credentialtype
211	Can delete credential type	53	delete_credentialtype
212	Can view credential type	53	view_credentialtype
213	Can add instance group	54	add_instancegroup
214	Can change instance group	54	change_instancegroup
215	Can delete instance group	54	delete_instancegroup
216	Can view instance group	54	view_instancegroup
217	Can add job launch config	55	add_joblaunchconfig
218	Can change job launch config	55	change_joblaunchconfig
219	Can delete job launch config	55	delete_joblaunchconfig
220	Can view job launch config	55	view_joblaunchconfig
221	Can add unified job deprecated stdout	56	add_unifiedjobdeprecatedstdout
222	Can change unified job deprecated stdout	56	change_unifiedjobdeprecatedstdout
223	Can delete unified job deprecated stdout	56	delete_unifiedjobdeprecatedstdout
224	Can view unified job deprecated stdout	56	view_unifiedjobdeprecatedstdout
225	Can add inventory update event	57	add_inventoryupdateevent
226	Can change inventory update event	57	change_inventoryupdateevent
227	Can delete inventory update event	57	delete_inventoryupdateevent
228	Can view inventory update event	57	view_inventoryupdateevent
229	Can add project update event	58	add_projectupdateevent
230	Can change project update event	58	change_projectupdateevent
231	Can delete project update event	58	delete_projectupdateevent
232	Can view project update event	58	view_projectupdateevent
233	Can add system job event	59	add_systemjobevent
234	Can change system job event	59	change_systemjobevent
235	Can delete system job event	59	delete_systemjobevent
236	Can view system job event	59	view_systemjobevent
237	Can add user session membership	60	add_usersessionmembership
238	Can change user session membership	60	change_usersessionmembership
239	Can delete user session membership	60	delete_usersessionmembership
240	Can view user session membership	60	view_usersessionmembership
241	Can add application	61	add_oauth2application
242	Can change application	61	change_oauth2application
243	Can delete application	61	delete_oauth2application
244	Can view application	61	view_oauth2application
245	Can add access token	62	add_oauth2accesstoken
246	Can change access token	62	change_oauth2accesstoken
247	Can delete access token	62	delete_oauth2accesstoken
248	Can view access token	62	view_oauth2accesstoken
249	Can add credential input source	63	add_credentialinputsource
250	Can change credential input source	63	change_credentialinputsource
251	Can delete credential input source	63	delete_credentialinputsource
252	Can view credential input source	63	view_credentialinputsource
253	Can add inventory instance group membership	64	add_inventoryinstancegroupmembership
254	Can change inventory instance group membership	64	change_inventoryinstancegroupmembership
255	Can delete inventory instance group membership	64	delete_inventoryinstancegroupmembership
256	Can view inventory instance group membership	64	view_inventoryinstancegroupmembership
257	Can add organization instance group membership	65	add_organizationinstancegroupmembership
258	Can change organization instance group membership	65	change_organizationinstancegroupmembership
259	Can delete organization instance group membership	65	delete_organizationinstancegroupmembership
260	Can view organization instance group membership	65	view_organizationinstancegroupmembership
261	Can add unified job template instance group membership	66	add_unifiedjobtemplateinstancegroupmembership
262	Can change unified job template instance group membership	66	change_unifiedjobtemplateinstancegroupmembership
263	Can delete unified job template instance group membership	66	delete_unifiedjobtemplateinstancegroupmembership
264	Can view unified job template instance group membership	66	view_unifiedjobtemplateinstancegroupmembership
265	Can add workflow approval template	67	add_workflowapprovaltemplate
266	Can change workflow approval template	67	change_workflowapprovaltemplate
267	Can delete workflow approval template	67	delete_workflowapprovaltemplate
268	Can view workflow approval template	67	view_workflowapprovaltemplate
269	Can add workflow approval	68	add_workflowapproval
270	Can change workflow approval	68	change_workflowapproval
271	Can delete workflow approval	68	delete_workflowapproval
272	Can view workflow approval	68	view_workflowapproval
273	Can add organization galaxy credential membership	69	add_organizationgalaxycredentialmembership
274	Can change organization galaxy credential membership	69	change_organizationgalaxycredentialmembership
275	Can delete organization galaxy credential membership	69	delete_organizationgalaxycredentialmembership
276	Can view organization galaxy credential membership	69	view_organizationgalaxycredentialmembership
277	Can add user enterprise auth	70	add_userenterpriseauth
278	Can change user enterprise auth	70	change_userenterpriseauth
279	Can delete user enterprise auth	70	delete_userenterpriseauth
280	Can view user enterprise auth	70	view_userenterpriseauth
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$150000$9K1C4q4cvb1A$3iOzgOjMF8QByqzstcoxQTx5t9cntjVa51Xlf7Oeiec=	2021-08-30 04:21:07.595624+00	t	admin			root@localhost	t	t	2021-08-14 13:00:48.294703+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: conf_setting; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.conf_setting (id, created, modified, key, value, user_id) FROM stdin;
1	2021-08-14 12:59:36.595612+00	2021-08-14 12:59:36.595637+00	AUTH_LDAP_GROUP_TYPE_PARAMS	{"name_attr": "cn", "member_attr": "member"}	\N
2	2021-08-14 13:00:01.006475+00	2021-08-14 13:00:01.006498+00	INSTALL_UUID	"52faa835-8086-4133-a041-2517c02a7ce4"	\N
3	2021-08-14 13:00:50.204548+00	2021-08-14 13:00:50.204575+00	AWX_TASK_ENV	{"HOME": "/var/lib/awx"}	\N
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	main	systemjobtemplate
2	auth	user
3	main	inventorysource
4	main	jobtemplate
5	main	project
6	main	workflowjobtemplate
7	main	adhoccommand
8	main	inventoryupdate
9	main	job
10	main	projectupdate
11	main	workflowjob
12	auth	permission
13	auth	group
14	contenttypes	contenttype
15	sessions	session
16	sites	site
17	oauth2_provider	grant
18	oauth2_provider	refreshtoken
19	taggit	tag
20	taggit	taggeditem
21	social_django	association
22	social_django	code
23	social_django	nonce
24	social_django	usersocialauth
25	social_django	partial
26	conf	setting
27	main	activitystream
28	main	adhoccommandevent
29	main	credential
30	main	custominventoryscript
31	main	group
32	main	host
33	main	instance
34	main	inventory
35	main	jobevent
36	main	jobhostsummary
37	main	organization
38	main	profile
39	main	schedule
40	main	team
41	main	unifiedjob
42	main	unifiedjobtemplate
43	main	systemjob
44	main	notification
45	main	notificationtemplate
46	main	role
47	main	roleancestorentry
48	main	label
49	main	workflowjobnode
50	main	workflowjobtemplatenode
51	main	towerschedulestate
52	main	smartinventorymembership
53	main	credentialtype
54	main	instancegroup
55	main	joblaunchconfig
56	main	unifiedjobdeprecatedstdout
57	main	inventoryupdateevent
58	main	projectupdateevent
59	main	systemjobevent
60	main	usersessionmembership
61	main	oauth2application
62	main	oauth2accesstoken
63	main	credentialinputsource
64	main	inventoryinstancegroupmembership
65	main	organizationinstancegroupmembership
66	main	unifiedjobtemplateinstancegroupmembership
67	main	workflowapprovaltemplate
68	main	workflowapproval
69	main	organizationgalaxycredentialmembership
70	sso	userenterpriseauth
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-08-14 12:58:49.464649+00
2	contenttypes	0002_remove_content_type_name	2021-08-14 12:58:49.472074+00
3	taggit	0001_initial	2021-08-14 12:58:49.482722+00
4	taggit	0002_auto_20150616_2121	2021-08-14 12:58:49.493412+00
5	auth	0001_initial	2021-08-14 12:58:49.523453+00
6	main	0001_initial	2021-08-14 12:58:56.220433+00
7	main	0002_v300_tower_settings_changes	2021-08-14 12:59:06.336324+00
8	main	0003_v300_notification_changes	2021-08-14 12:59:06.337816+00
9	main	0004_v300_fact_changes	2021-08-14 12:59:06.339029+00
10	main	0005_v300_migrate_facts	2021-08-14 12:59:06.340237+00
11	main	0006_v300_active_flag_cleanup	2021-08-14 12:59:06.34146+00
12	main	0007_v300_active_flag_removal	2021-08-14 12:59:06.342659+00
13	main	0008_v300_rbac_changes	2021-08-14 12:59:06.343861+00
14	main	0009_v300_rbac_migrations	2021-08-14 12:59:06.345057+00
15	main	0010_v300_create_system_job_templates	2021-08-14 12:59:06.346251+00
16	main	0011_v300_credential_domain_field	2021-08-14 12:59:06.347475+00
17	main	0012_v300_create_labels	2021-08-14 12:59:06.348687+00
18	main	0013_v300_label_changes	2021-08-14 12:59:06.34988+00
19	main	0014_v300_invsource_cred	2021-08-14 12:59:06.351074+00
20	main	0015_v300_label_changes	2021-08-14 12:59:06.35227+00
21	main	0016_v300_prompting_changes	2021-08-14 12:59:06.353492+00
22	main	0017_v300_prompting_migrations	2021-08-14 12:59:06.354695+00
23	main	0018_v300_host_ordering	2021-08-14 12:59:06.355889+00
24	main	0019_v300_new_azure_credential	2021-08-14 12:59:06.357081+00
25	main	0020_v300_labels_changes	2021-08-14 12:59:08.178627+00
26	main	0021_v300_activity_stream	2021-08-14 12:59:08.180098+00
27	main	0022_v300_adhoc_extravars	2021-08-14 12:59:08.181345+00
28	main	0023_v300_activity_stream_ordering	2021-08-14 12:59:08.182611+00
29	main	0024_v300_jobtemplate_allow_simul	2021-08-14 12:59:08.183848+00
30	main	0025_v300_update_rbac_parents	2021-08-14 12:59:08.185122+00
31	main	0026_v300_credential_unique	2021-08-14 12:59:08.18639+00
32	main	0027_v300_team_migrations	2021-08-14 12:59:08.187676+00
33	main	0028_v300_org_team_cascade	2021-08-14 12:59:08.188939+00
34	main	0029_v302_add_ask_skip_tags	2021-08-14 12:59:19.584067+00
35	main	0030_v302_job_survey_passwords	2021-08-14 12:59:19.585676+00
36	main	0031_v302_migrate_survey_passwords	2021-08-14 12:59:19.587054+00
37	main	0032_v302_credential_permissions_update	2021-08-14 12:59:19.588358+00
38	main	0033_v303_v245_host_variable_fix	2021-08-14 12:59:19.589695+00
39	main	0034_v310_release	2021-08-14 12:59:19.591012+00
40	conf	0001_initial	2021-08-14 12:59:19.815717+00
41	conf	0002_v310_copy_tower_settings	2021-08-14 12:59:19.960514+00
42	main	0035_v310_remove_tower_settings	2021-08-14 12:59:20.85585+00
43	main	0036_v311_insights	2021-08-14 12:59:20.857418+00
44	main	0037_v313_instance_version	2021-08-14 12:59:20.858778+00
45	main	0006_v320_release	2021-08-14 12:59:30.302893+00
46	main	0007_v320_data_migrations	2021-08-14 12:59:30.475229+00
47	main	0008_v320_drop_v1_credential_fields	2021-08-14 12:59:33.904758+00
48	main	0009_v322_add_setting_field_for_activity_stream	2021-08-14 12:59:34.005729+00
49	main	0010_v322_add_ovirt4_tower_inventory	2021-08-14 12:59:34.181987+00
50	main	0011_v322_encrypt_survey_passwords	2021-08-14 12:59:34.183934+00
51	main	0012_v322_update_cred_types	2021-08-14 12:59:34.185658+00
52	main	0013_v330_multi_credential	2021-08-14 12:59:36.072593+00
53	auth	0002_alter_permission_name_max_length	2021-08-14 12:59:36.106649+00
54	auth	0003_alter_user_email_max_length	2021-08-14 12:59:36.129592+00
55	auth	0004_alter_user_username_opts	2021-08-14 12:59:36.153358+00
56	auth	0005_alter_user_last_login_null	2021-08-14 12:59:36.176163+00
57	auth	0006_require_contenttypes_0002	2021-08-14 12:59:36.177965+00
58	auth	0007_alter_validators_add_error_messages	2021-08-14 12:59:36.201225+00
59	auth	0008_alter_user_username_max_length	2021-08-14 12:59:36.22634+00
60	auth	0009_alter_user_last_name_max_length	2021-08-14 12:59:36.248955+00
61	auth	0010_alter_group_name_max_length	2021-08-14 12:59:36.260639+00
62	auth	0011_update_proxy_permissions	2021-08-14 12:59:36.366588+00
63	conf	0003_v310_JSONField_changes	2021-08-14 12:59:36.378755+00
64	conf	0004_v320_reencrypt	2021-08-14 12:59:36.380871+00
65	conf	0005_v330_rename_two_session_settings	2021-08-14 12:59:36.491018+00
66	conf	0006_v331_ldap_group_type	2021-08-14 12:59:36.597576+00
67	conf	0007_v380_rename_more_settings	2021-08-14 12:59:36.705806+00
68	conf	0008_subscriptions	2021-08-14 12:59:36.917659+00
69	sessions	0001_initial	2021-08-14 12:59:36.924735+00
70	main	0014_v330_saved_launchtime_configs	2021-08-14 12:59:40.326151+00
71	main	0015_v330_blank_start_args	2021-08-14 12:59:40.590974+00
72	main	0016_v330_non_blank_workflow	2021-08-14 12:59:40.705112+00
73	main	0017_v330_move_deprecated_stdout	2021-08-14 12:59:40.909109+00
74	main	0018_v330_add_additional_stdout_events	2021-08-14 12:59:41.509719+00
75	main	0019_v330_custom_virtualenv	2021-08-14 12:59:42.199068+00
76	main	0020_v330_instancegroup_policies	2021-08-14 12:59:42.386931+00
77	main	0021_v330_declare_new_rbac_roles	2021-08-14 12:59:44.556881+00
78	main	0022_v330_create_new_rbac_roles	2021-08-14 12:59:44.81402+00
79	main	0023_v330_inventory_multicred	2021-08-14 12:59:45.28004+00
80	main	0024_v330_create_user_session_membership	2021-08-14 12:59:45.394504+00
81	main	0025_v330_add_oauth_activity_stream_registrar	2021-08-14 12:59:45.9052+00
82	oauth2_provider	0001_initial	2021-08-14 12:59:46.870085+00
83	main	0026_v330_delete_authtoken	2021-08-14 12:59:46.993457+00
84	main	0027_v330_emitted_events	2021-08-14 12:59:47.092262+00
85	main	0028_v330_add_tower_verify	2021-08-14 12:59:47.219209+00
86	main	0030_v330_modify_application	2021-08-14 12:59:47.428905+00
87	main	0031_v330_encrypt_oauth2_secret	2021-08-14 12:59:47.522539+00
88	main	0032_v330_polymorphic_delete	2021-08-14 12:59:47.655925+00
89	main	0033_v330_oauth_help_text	2021-08-14 12:59:48.20551+00
90	main	0034_v330_delete_user_role	2021-08-14 12:59:49.074538+00
91	main	0035_v330_more_oauth2_help_text	2021-08-14 12:59:49.155567+00
92	main	0036_v330_credtype_remove_become_methods	2021-08-14 12:59:49.280288+00
93	main	0037_v330_remove_legacy_fact_cleanup	2021-08-14 12:59:49.431052+00
94	main	0038_v330_add_deleted_activitystream_actor	2021-08-14 12:59:49.550239+00
95	main	0039_v330_custom_venv_help_text	2021-08-14 12:59:49.812485+00
96	main	0040_v330_unifiedjob_controller_node	2021-08-14 12:59:49.89593+00
97	main	0041_v330_update_oauth_refreshtoken	2021-08-14 12:59:50.0261+00
98	main	0042_v330_org_member_role_deparent	2021-08-14 12:59:50.424342+00
99	main	0043_v330_oauth2accesstoken_modified	2021-08-14 12:59:50.508012+00
100	main	0044_v330_add_inventory_update_inventory	2021-08-14 12:59:50.675862+00
101	main	0045_v330_instance_managed_by_policy	2021-08-14 12:59:50.690176+00
102	main	0046_v330_remove_client_credentials_grant	2021-08-14 12:59:50.80886+00
103	main	0047_v330_activitystream_instance	2021-08-14 12:59:51.019263+00
104	main	0048_v330_django_created_modified_by_model_name	2021-08-14 12:59:55.576945+00
105	main	0049_v330_validate_instance_capacity_adjustment	2021-08-14 12:59:55.611924+00
106	main	0050_v340_drop_celery_tables	2021-08-14 12:59:55.634012+00
107	main	0051_v340_job_slicing	2021-08-14 12:59:56.276543+00
108	main	0052_v340_remove_project_scm_delete_on_next_update	2021-08-14 12:59:56.376949+00
109	main	0053_v340_workflow_inventory	2021-08-14 12:59:57.406381+00
110	main	0054_v340_workflow_convergence	2021-08-14 12:59:57.514449+00
111	main	0055_v340_add_grafana_notification	2021-08-14 12:59:57.626832+00
112	main	0056_v350_custom_venv_history	2021-08-14 12:59:57.834243+00
113	main	0057_v350_remove_become_method_type	2021-08-14 12:59:57.96325+00
114	main	0058_v350_remove_limit_limit	2021-08-14 12:59:58.165934+00
115	main	0059_v350_remove_adhoc_limit	2021-08-14 12:59:58.267397+00
116	main	0060_v350_update_schedule_uniqueness_constraint	2021-08-14 12:59:58.473623+00
117	main	0061_v350_track_native_credentialtype_source	2021-08-14 12:59:58.793653+00
118	main	0062_v350_new_playbook_stats	2021-08-14 12:59:58.957632+00
119	main	0063_v350_org_host_limits	2021-08-14 12:59:59.201775+00
120	main	0064_v350_analytics_state	2021-08-14 12:59:59.209529+00
121	main	0065_v350_index_job_status	2021-08-14 12:59:59.403635+00
122	main	0066_v350_inventorysource_custom_virtualenv	2021-08-14 12:59:59.52493+00
123	main	0067_v350_credential_plugins	2021-08-14 13:00:00.714386+00
124	main	0068_v350_index_event_created	2021-08-14 13:00:00.87597+00
125	main	0069_v350_generate_unique_install_uuid	2021-08-14 13:00:01.0087+00
126	main	0070_v350_gce_instance_id	2021-08-14 13:00:01.143073+00
127	main	0071_v350_remove_system_tracking	2021-08-14 13:00:01.32209+00
128	main	0072_v350_deprecate_fields	2021-08-14 13:00:03.141297+00
129	main	0073_v360_create_instance_group_m2m	2021-08-14 13:00:04.53442+00
130	main	0074_v360_migrate_instance_group_relations	2021-08-14 13:00:04.690297+00
131	main	0075_v360_remove_old_instance_group_relations	2021-08-14 13:00:05.055788+00
132	main	0076_v360_add_new_instance_group_relations	2021-08-14 13:00:05.427362+00
133	main	0077_v360_add_default_orderings	2021-08-14 13:00:06.286432+00
134	main	0078_v360_clear_sessions_tokens_jt	2021-08-14 13:00:07.254774+00
135	main	0079_v360_rm_implicit_oauth2_apps	2021-08-14 13:00:07.328846+00
136	main	0080_v360_replace_job_origin	2021-08-14 13:00:07.993812+00
137	main	0081_v360_notify_on_start	2021-08-14 13:00:08.745953+00
138	main	0082_v360_webhook_http_method	2021-08-14 13:00:08.88593+00
139	main	0083_v360_job_branch_override	2021-08-14 13:00:10.338697+00
140	main	0084_v360_token_description	2021-08-14 13:00:10.425796+00
141	main	0085_v360_add_notificationtemplate_messages	2021-08-14 13:00:10.62528+00
142	main	0086_v360_workflow_approval	2021-08-14 13:00:12.641272+00
143	main	0087_v360_update_credential_injector_help_text	2021-08-14 13:00:12.903107+00
144	main	0088_v360_dashboard_optimizations	2021-08-14 13:00:13.145692+00
145	main	0089_v360_new_job_event_types	2021-08-14 13:00:13.330924+00
146	main	0090_v360_WFJT_prompts	2021-08-14 13:00:14.5324+00
147	main	0091_v360_approval_node_notifications	2021-08-14 13:00:15.505733+00
148	main	0092_v360_webhook_mixin	2021-08-14 13:00:16.318142+00
149	main	0093_v360_personal_access_tokens	2021-08-14 13:00:16.691613+00
150	main	0094_v360_webhook_mixin2	2021-08-14 13:00:17.380065+00
151	main	0095_v360_increase_instance_version_length	2021-08-14 13:00:17.449978+00
152	main	0096_v360_container_groups	2021-08-14 13:00:18.559334+00
153	main	0097_v360_workflowapproval_approved_or_denied_by	2021-08-14 13:00:18.719754+00
154	main	0098_v360_rename_cyberark_aim_credential_type	2021-08-14 13:00:18.944094+00
155	main	0099_v361_license_cleanup	2021-08-14 13:00:19.078447+00
156	main	0100_v370_projectupdate_job_tags	2021-08-14 13:00:19.179631+00
157	main	0101_v370_generate_new_uuids_for_iso_nodes	2021-08-14 13:00:19.316718+00
158	main	0102_v370_unifiedjob_canceled	2021-08-14 13:00:19.46463+00
159	main	0103_v370_remove_computed_fields	2021-08-14 13:00:20.421975+00
160	main	0104_v370_cleanup_old_scan_jts	2021-08-14 13:00:20.660188+00
161	main	0105_v370_remove_jobevent_parent_and_hosts	2021-08-14 13:00:20.941706+00
162	main	0106_v370_remove_inventory_groups_with_active_failures	2021-08-14 13:00:21.817213+00
163	main	0107_v370_workflow_convergence_api_toggle	2021-08-14 13:00:22.028411+00
164	main	0108_v370_unifiedjob_dependencies_processed	2021-08-14 13:00:22.138824+00
165	main	0109_v370_job_template_organization_field	2021-08-14 13:00:24.443609+00
166	main	0110_v370_instance_ip_address	2021-08-14 13:00:24.485431+00
167	main	0111_v370_delete_channelgroup	2021-08-14 13:00:24.49115+00
168	main	0112_v370_workflow_node_identifier	2021-08-14 13:00:25.405496+00
169	main	0113_v370_event_bigint	2021-08-14 13:00:26.010173+00
170	main	0114_v370_remove_deprecated_manual_inventory_sources	2021-08-14 13:00:26.56034+00
171	main	0115_v370_schedule_set_null	2021-08-14 13:00:27.609888+00
172	main	0116_v400_remove_hipchat_notifications	2021-08-14 13:00:27.87149+00
173	main	0117_v400_remove_cloudforms_inventory	2021-08-14 13:00:28.219257+00
174	main	0118_add_remote_archive_scm_type	2021-08-14 13:00:28.420199+00
175	main	0119_inventory_plugins	2021-08-14 13:00:30.30736+00
176	main	0120_galaxy_credentials	2021-08-14 13:00:30.873724+00
177	main	0121_delete_toweranalyticsstate	2021-08-14 13:00:30.883196+00
178	main	0122_really_remove_cloudforms_inventory	2021-08-14 13:00:31.023386+00
179	main	0123_drop_hg_support	2021-08-14 13:00:31.357953+00
180	oauth2_provider	0002_08_updates	2021-08-14 13:00:31.667797+00
181	oauth2_provider	0003_auto_20160316_1503	2021-08-14 13:00:31.790278+00
182	oauth2_provider	0004_auto_20160525_1623	2021-08-14 13:00:32.703232+00
183	oauth2_provider	0005_auto_20170514_1141	2021-08-14 13:00:34.317581+00
184	oauth2_provider	0006_auto_20171214_2232	2021-08-14 13:00:35.599763+00
185	sites	0001_initial	2021-08-14 13:00:35.607073+00
186	sites	0002_alter_domain_unique	2021-08-14 13:00:35.615711+00
187	default	0001_initial	2021-08-14 13:00:35.852847+00
188	social_auth	0001_initial	2021-08-14 13:00:35.854431+00
189	default	0002_add_related_name	2021-08-14 13:00:35.985516+00
190	social_auth	0002_add_related_name	2021-08-14 13:00:35.98711+00
191	default	0003_alter_email_max_length	2021-08-14 13:00:35.995468+00
192	social_auth	0003_alter_email_max_length	2021-08-14 13:00:35.996892+00
193	default	0004_auto_20160423_0400	2021-08-14 13:00:36.083026+00
194	social_auth	0004_auto_20160423_0400	2021-08-14 13:00:36.084575+00
195	social_auth	0005_auto_20160727_2333	2021-08-14 13:00:36.092465+00
196	social_django	0006_partial	2021-08-14 13:00:36.100254+00
197	social_django	0007_code_timestamp	2021-08-14 13:00:36.109595+00
198	social_django	0008_partial_timestamp	2021-08-14 13:00:36.118016+00
199	sso	0001_initial	2021-08-14 13:00:36.36212+00
200	sso	0002_expand_provider_options	2021-08-14 13:00:36.455112+00
201	taggit	0003_taggeditem_add_unique_index	2021-08-14 13:00:36.509251+00
202	social_django	0001_initial	2021-08-14 13:00:36.512877+00
203	social_django	0003_alter_email_max_length	2021-08-14 13:00:36.514456+00
204	social_django	0005_auto_20160727_2333	2021-08-14 13:00:36.516044+00
205	social_django	0004_auto_20160423_0400	2021-08-14 13:00:36.517645+00
206	social_django	0002_add_related_name	2021-08-14 13:00:36.519241+00
207	main	0002_squashed_v300_release	2021-08-14 13:00:36.520821+00
208	main	0003_squashed_v300_v303_updates	2021-08-14 13:00:36.522393+00
209	main	0004_squashed_v310_release	2021-08-14 13:00:36.523982+00
210	main	0005_squashed_v310_v313_updates	2021-08-14 13:00:36.52557+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
pyy4n74fa52fa6yrb1pvayoiagqiqa3t	Y2E1MzNmN2UxMTJiYTgxYWQ0ZTNlMDAwNjgyMjIxYTA0MGY4MDhlMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNTJhYmY1MjI5OTVmOGI0ZmJjN2ZlOWFiMjM5MWUyYjJlZGIwZDhmIiwiX3Nlc3Npb25fZXhwaXJ5IjoxODAwfQ==	2021-08-14 13:34:31.926078+00
r3haqv3bztiqhzv7phg9buybxgamxke8	Y2E1MzNmN2UxMTJiYTgxYWQ0ZTNlMDAwNjgyMjIxYTA0MGY4MDhlMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNTJhYmY1MjI5OTVmOGI0ZmJjN2ZlOWFiMjM5MWUyYjJlZGIwZDhmIiwiX3Nlc3Npb25fZXhwaXJ5IjoxODAwfQ==	2021-08-17 07:59:52.97154+00
qljboxhgduzmpld7mzfpyr2ryj72acpd	Y2E1MzNmN2UxMTJiYTgxYWQ0ZTNlMDAwNjgyMjIxYTA0MGY4MDhlMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNTJhYmY1MjI5OTVmOGI0ZmJjN2ZlOWFiMjM5MWUyYjJlZGIwZDhmIiwiX3Nlc3Npb25fZXhwaXJ5IjoxODAwfQ==	2021-08-17 05:30:32.588882+00
rwbbdz0qqkl80pkuomj33659b9l7tq62	Y2E1MzNmN2UxMTJiYTgxYWQ0ZTNlMDAwNjgyMjIxYTA0MGY4MDhlMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNTJhYmY1MjI5OTVmOGI0ZmJjN2ZlOWFiMjM5MWUyYjJlZGIwZDhmIiwiX3Nlc3Npb25fZXhwaXJ5IjoxODAwfQ==	2021-08-30 05:14:28.668392+00
rxo91yr3zy540qbi6r1jh7yjjr2fhvh3	Y2E1MzNmN2UxMTJiYTgxYWQ0ZTNlMDAwNjgyMjIxYTA0MGY4MDhlMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNTJhYmY1MjI5OTVmOGI0ZmJjN2ZlOWFiMjM5MWUyYjJlZGIwZDhmIiwiX3Nlc3Npb25fZXhwaXJ5IjoxODAwfQ==	2021-08-18 06:39:03.800875+00
edxu9itzp7y5rk0bmv47fx0o83ro79vg	Y2E1MzNmN2UxMTJiYTgxYWQ0ZTNlMDAwNjgyMjIxYTA0MGY4MDhlMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNTJhYmY1MjI5OTVmOGI0ZmJjN2ZlOWFiMjM5MWUyYjJlZGIwZDhmIiwiX3Nlc3Npb25fZXhwaXJ5IjoxODAwfQ==	2021-08-19 07:48:05.007032+00
hu7r49ygdwtff5ctfpol4ckgzcnil6ar	Y2E1MzNmN2UxMTJiYTgxYWQ0ZTNlMDAwNjgyMjIxYTA0MGY4MDhlMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNTJhYmY1MjI5OTVmOGI0ZmJjN2ZlOWFiMjM5MWUyYjJlZGIwZDhmIiwiX3Nlc3Npb25fZXhwaXJ5IjoxODAwfQ==	2021-08-23 05:31:17.702385+00
9af62vaa40j1tlv34fzrk4myhsal18lu	Y2E1MzNmN2UxMTJiYTgxYWQ0ZTNlMDAwNjgyMjIxYTA0MGY4MDhlMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNTJhYmY1MjI5OTVmOGI0ZmJjN2ZlOWFiMjM5MWUyYjJlZGIwZDhmIiwiX3Nlc3Npb25fZXhwaXJ5IjoxODAwfQ==	2021-08-17 06:50:51.213069+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: main_activitystream; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_activitystream (id, operation, "timestamp", changes, object_relationship_type, object1, object2, actor_id, setting, deleted_actor, action_node) FROM stdin;
1	create	2021-08-14 12:59:58.67855+00	{"name": "Machine", "description": "", "kind": "ssh", "id": 1}		credential_type		\N	{}	\N	
2	create	2021-08-14 12:59:58.686513+00	{"name": "Source Control", "description": "", "kind": "scm", "id": 2}		credential_type		\N	{}	\N	
3	create	2021-08-14 12:59:58.691761+00	{"name": "Vault", "description": "", "kind": "vault", "id": 3}		credential_type		\N	{}	\N	
4	create	2021-08-14 12:59:58.696976+00	{"name": "Network", "description": "", "kind": "net", "id": 4}		credential_type		\N	{}	\N	
5	create	2021-08-14 12:59:58.702149+00	{"name": "Amazon Web Services", "description": "", "kind": "cloud", "id": 5}		credential_type		\N	{}	\N	
6	create	2021-08-14 12:59:58.707375+00	{"name": "OpenStack", "description": "", "kind": "cloud", "id": 6}		credential_type		\N	{}	\N	
7	create	2021-08-14 12:59:58.712523+00	{"name": "VMware vCenter", "description": "", "kind": "cloud", "id": 7}		credential_type		\N	{}	\N	
8	create	2021-08-14 12:59:58.717742+00	{"name": "Red Hat Satellite 6", "description": "", "kind": "cloud", "id": 8}		credential_type		\N	{}	\N	
9	create	2021-08-14 12:59:58.722905+00	{"name": "Google Compute Engine", "description": "", "kind": "cloud", "id": 9}		credential_type		\N	{}	\N	
10	create	2021-08-14 12:59:58.728251+00	{"name": "Microsoft Azure Resource Manager", "description": "", "kind": "cloud", "id": 10}		credential_type		\N	{}	\N	
11	create	2021-08-14 12:59:58.733416+00	{"name": "GitHub Personal Access Token", "description": "", "kind": "token", "id": 11}		credential_type		\N	{}	\N	
12	create	2021-08-14 12:59:58.738609+00	{"name": "GitLab Personal Access Token", "description": "", "kind": "token", "id": 12}		credential_type		\N	{}	\N	
13	create	2021-08-14 12:59:58.743757+00	{"name": "Insights", "description": "", "kind": "insights", "id": 13}		credential_type		\N	{}	\N	
14	create	2021-08-14 12:59:58.749055+00	{"name": "Red Hat Virtualization", "description": "", "kind": "cloud", "id": 14}		credential_type		\N	{}	\N	
15	create	2021-08-14 12:59:58.754212+00	{"name": "Ansible Tower", "description": "", "kind": "cloud", "id": 15}		credential_type		\N	{}	\N	
16	create	2021-08-14 12:59:58.759364+00	{"name": "OpenShift or Kubernetes API Bearer Token", "description": "", "kind": "kubernetes", "id": 16}		credential_type		\N	{}	\N	
17	create	2021-08-14 12:59:58.764532+00	{"name": "Ansible Galaxy/Automation Hub API Token", "description": "", "kind": "galaxy", "id": 17}		credential_type		\N	{}	\N	
18	create	2021-08-14 12:59:58.769791+00	{"name": "CyberArk AIM Central Credential Provider Lookup", "description": "", "kind": "external", "id": 18}		credential_type		\N	{}	\N	
19	create	2021-08-14 12:59:58.774955+00	{"name": "Microsoft Azure Key Vault", "description": "", "kind": "external", "id": 19}		credential_type		\N	{}	\N	
20	create	2021-08-14 12:59:58.780137+00	{"name": "CyberArk Conjur Secret Lookup", "description": "", "kind": "external", "id": 20}		credential_type		\N	{}	\N	
21	create	2021-08-14 12:59:58.785298+00	{"name": "HashiCorp Vault Secret Lookup", "description": "", "kind": "external", "id": 21}		credential_type		\N	{}	\N	
22	create	2021-08-14 12:59:58.790656+00	{"name": "HashiCorp Vault Signed SSH", "description": "", "kind": "external", "id": 22}		credential_type		\N	{}	\N	
23	create	2021-08-14 13:00:46.004159+00	{"name": "tower", "credential": null, "policy_instance_percentage": 0, "policy_instance_minimum": 0, "policy_instance_list": "[]", "pod_spec_override": "", "id": 1}		instance_group		\N	{}	\N	awx
24	update	2021-08-14 13:00:46.023459+00	{"policy_instance_percentage": [0, 100]}		instance_group		\N	{}	\N	awx
25	create	2021-08-14 13:00:48.440331+00	{"username": "admin", "first_name": "", "last_name": "", "email": "root@localhost", "is_superuser": true, "password": "hidden", "id": 1}		user		\N	{}	\N	awx
26	create	2021-08-14 13:00:50.230374+00	{"value": "{\\"HOME\\": \\"/var/lib/awx\\"}", "id": 3}		setting		\N	{"category": "jobs", "name": "AWX_TASK_ENV"}	\N	awx
27	create	2021-08-14 13:00:54.02638+00	{"name": "Default", "description": "", "max_hosts": 0, "custom_virtualenv": null, "id": 1}		organization		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
28	create	2021-08-14 13:00:54.142897+00	{"name": "Demo Project", "description": "", "local_path": "", "scm_type": "git", "scm_url": "https://github.com/ansible/ansible-tower-samples", "scm_branch": "", "scm_refspec": "", "scm_clean": false, "scm_delete_on_update": false, "credential": null, "timeout": 0, "organization": "Default-1", "scm_update_on_launch": true, "scm_update_cache_timeout": 0, "allow_override": false, "custom_virtualenv": null, "id": 6}		project		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
29	create	2021-08-14 13:00:54.232924+00	{"name": "Demo Credential", "description": "", "organization": null, "credential_type": "Machine-1", "inputs": "hidden", "id": 1}		credential		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
30	associate	2021-08-14 13:00:54.290364+00	{"object1": "credential", "object1_pk": 1, "object2": "user", "object2_pk": 1, "action": "associate", "relationship": "awx.main.models.rbac.Role_members"}	awx.main.models.credential.Credential.admin_role	credential	user	1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
31	create	2021-08-14 13:00:54.412532+00	{"name": "Ansible Galaxy", "description": "", "organization": null, "credential_type": "Ansible Galaxy/Automation Hub API Token-17", "inputs": "hidden", "id": 2}		credential		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
32	associate	2021-08-14 13:00:54.46847+00	{"object1": "organization", "object1_pk": 1, "object2": "credential", "object2_pk": 2, "action": "associate", "relationship": "awx.main.models.organization.OrganizationGalaxyCredentialMembership"}	awx.main.models.organization.OrganizationGalaxyCredentialMembership	organization	credential	1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
33	create	2021-08-14 13:00:54.566487+00	{"name": "Demo Inventory", "description": "", "organization": "Default-1", "kind": "", "host_filter": null, "variables": "", "insights_credential": null, "id": 1}		inventory		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
34	create	2021-08-14 13:00:54.612442+00	{"name": "localhost", "description": "", "inventory": "Demo Inventory-1", "enabled": true, "instance_id": "", "variables": "ansible_connection: local\\nansible_python_interpreter: '{{ ansible_playbook_python }}'", "id": 1}		host		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
54	create	2021-08-17 05:00:10.198006+00	{"name": "createfile", "description": "", "job_type": "run", "inventory": "lbserver-2", "project": "createfile-8", "playbook": "06command.yml", "scm_branch": "", "forks": 0, "limit": "", "verbosity": 0, "extra_vars": "{}", "job_tags": "", "force_handlers": false, "skip_tags": "", "start_at_task": "", "timeout": 0, "use_fact_cache": false, "job_template": "createfile-9", "allow_simultaneous": false, "instance_group": null, "diff_mode": false, "job_slice_number": 0, "job_slice_count": 1, "webhook_service": "", "webhook_credential": null, "webhook_guid": "", "id": 8, "credentials": ["k8s (3)"], "labels": []}		job		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
35	create	2021-08-14 13:00:54.705465+00	{"name": "Demo Job Template", "description": "", "job_type": "run", "inventory": "Demo Inventory-1", "project": "Demo Project-6", "playbook": "hello_world.yml", "scm_branch": "", "forks": 0, "limit": "", "verbosity": 0, "extra_vars": "", "job_tags": "", "force_handlers": false, "skip_tags": "", "start_at_task": "", "timeout": 0, "use_fact_cache": false, "host_config_key": "", "ask_scm_branch_on_launch": false, "ask_diff_mode_on_launch": false, "ask_variables_on_launch": false, "ask_limit_on_launch": false, "ask_tags_on_launch": false, "ask_skip_tags_on_launch": false, "ask_job_type_on_launch": false, "ask_verbosity_on_launch": false, "ask_inventory_on_launch": false, "ask_credential_on_launch": false, "survey_enabled": false, "become_enabled": false, "diff_mode": false, "allow_simultaneous": false, "custom_virtualenv": null, "job_slice_count": 1, "webhook_service": "", "webhook_credential": null, "survey_spec": "{}", "id": 7}		job_template		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
36	associate	2021-08-14 13:00:54.75165+00	{"object1": "job_template", "object1_pk": 7, "object2": "credential", "object2_pk": 1, "action": "associate", "relationship": "awx.main.models.unified_jobs.UnifiedJobTemplate_credentials"}	awx.main.models.unified_jobs.UnifiedJobTemplate_credentials	job_template	credential	1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
37	create	2021-08-17 04:40:55.579226+00	{"name": "k8s", "description": "", "organization": "Default-1", "kind": "", "host_filter": null, "variables": "---", "insights_credential": null, "id": 2}		inventory		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
38	create	2021-08-17 04:41:10.438427+00	{"name": "k8s", "description": "", "inventory": "k8s-2", "enabled": true, "instance_id": "", "variables": "---", "id": 2}		host		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
39	create	2021-08-17 04:42:41.978487+00	{"name": "k8s", "description": "", "organization": "Default-1", "credential_type": "Machine-1", "inputs": "hidden", "id": 3}		credential		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
40	update	2021-08-17 04:44:54.271434+00	{"extra_vars": ["", "---"]}		job_template		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
41	create	2021-08-17 04:45:05.844717+00	{"name": "Demo Job Template", "description": "", "job_type": "run", "inventory": "Demo Inventory-1", "project": "Demo Project-6", "playbook": "hello_world.yml", "scm_branch": "", "forks": 0, "limit": "", "verbosity": 0, "extra_vars": "{}", "job_tags": "", "force_handlers": false, "skip_tags": "", "start_at_task": "", "timeout": 0, "use_fact_cache": false, "job_template": "Demo Job Template-7", "allow_simultaneous": false, "instance_group": null, "diff_mode": false, "job_slice_number": 0, "job_slice_count": 1, "webhook_service": "", "webhook_credential": null, "webhook_guid": "", "id": 3, "credentials": ["Demo Credential (1)"], "labels": []}		job		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
42	create	2021-08-17 04:47:21.743504+00	{"name": "github", "description": "github", "kind": "cloud", "inputs": "{}", "injectors": "{}", "id": 23}		credential_type		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
43	delete	2021-08-17 04:47:35.938644+00	{"name": "github", "description": "github", "kind": "cloud", "inputs": "{}", "injectors": "{}", "id": 23}		credential_type		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
44	create	2021-08-17 04:50:46.49307+00	{"name": "github", "description": "", "organization": "Default-1", "credential_type": "Source Control-2", "inputs": "hidden", "id": 4}		credential		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
45	update	2021-08-17 04:51:18.337549+00	{"inputs": ["hidden", "hidden"]}		credential		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
46	update	2021-08-17 04:52:19.453841+00	{"name": ["k8s", "10.170.1.16"]}		host		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
47	update	2021-08-17 04:52:52.809012+00	{"name": ["k8s", "lbserver"]}		inventory		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
48	create	2021-08-17 04:56:06.290172+00	{"name": "createfile", "description": "", "local_path": "", "scm_type": "git", "scm_url": "https://github.com/rmspavan/AnsibleTower.git", "scm_branch": "", "scm_refspec": "", "scm_clean": false, "scm_delete_on_update": false, "credential": "github-4", "timeout": 0, "organization": "Default-1", "scm_update_on_launch": false, "scm_update_cache_timeout": 0, "allow_override": false, "custom_virtualenv": null, "id": 8}		project		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
49	create	2021-08-17 04:56:53.16625+00	{"name": "createfile", "description": "", "job_type": "run", "inventory": "lbserver-2", "project": "createfile-8", "playbook": "02createFile.yml", "scm_branch": "", "forks": 0, "limit": "", "verbosity": 0, "extra_vars": "---", "job_tags": "", "force_handlers": false, "skip_tags": "", "start_at_task": "", "timeout": 0, "use_fact_cache": false, "host_config_key": "", "ask_scm_branch_on_launch": false, "ask_diff_mode_on_launch": false, "ask_variables_on_launch": false, "ask_limit_on_launch": false, "ask_tags_on_launch": false, "ask_skip_tags_on_launch": false, "ask_job_type_on_launch": false, "ask_verbosity_on_launch": false, "ask_inventory_on_launch": false, "ask_credential_on_launch": false, "survey_enabled": false, "become_enabled": false, "diff_mode": false, "allow_simultaneous": false, "custom_virtualenv": null, "job_slice_count": 1, "webhook_service": "", "webhook_credential": null, "survey_spec": "{}", "id": 9}		job_template		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
50	associate	2021-08-17 04:56:53.190135+00	{"object1": "job_template", "object1_pk": 9, "object2": "user", "object2_pk": 1, "action": "associate", "relationship": "awx.main.models.rbac.Role_members"}	awx.main.models.jobs.JobTemplate.admin_role	job_template	user	1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
51	associate	2021-08-17 04:56:53.844608+00	{"object1": "job_template", "object1_pk": 9, "object2": "credential", "object2_pk": 3, "action": "associate", "relationship": "awx.main.models.unified_jobs.UnifiedJobTemplate_credentials"}	awx.main.models.unified_jobs.UnifiedJobTemplate_credentials	job_template	credential	1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
52	create	2021-08-17 04:57:08.028031+00	{"name": "createfile", "description": "", "job_type": "run", "inventory": "lbserver-2", "project": "createfile-8", "playbook": "02createFile.yml", "scm_branch": "", "forks": 0, "limit": "", "verbosity": 0, "extra_vars": "{}", "job_tags": "", "force_handlers": false, "skip_tags": "", "start_at_task": "", "timeout": 0, "use_fact_cache": false, "job_template": "createfile-9", "allow_simultaneous": false, "instance_group": null, "diff_mode": false, "job_slice_number": 0, "job_slice_count": 1, "webhook_service": "", "webhook_credential": null, "webhook_guid": "", "id": 7, "credentials": ["k8s (3)"], "labels": []}		job		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
53	update	2021-08-17 05:00:07.087606+00	{"playbook": ["02createFile.yml", "06command.yml"]}		job_template		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
55	create	2021-08-17 06:07:25.488803+00	{"name": "win2016", "description": "", "organization": "Default-1", "credential_type": "Machine-1", "inputs": "hidden", "id": 5}		credential		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
56	create	2021-08-17 06:16:03.062121+00	{"name": "win2016", "description": "", "organization": "Default-1", "kind": "", "host_filter": null, "variables": "---\\nansible_port: 5986\\nansible_connection: winrm", "insights_credential": null, "id": 3}		inventory		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
57	update	2021-08-17 06:16:40.518504+00	{"variables": ["---\\nansible_port: 5986\\nansible_connection: winrm", "---\\nansible_port: 5986\\nansible_connection: winrm\\nansible_winrm_scheme: https\\nansible_winrm_server_cert_validation: ignore\\nansible_winrm_kerberos_delegation: true"]}		inventory		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
58	create	2021-08-17 06:18:13.127784+00	{"name": "windows2016", "description": "", "inventory": "win2016-3", "enabled": true, "instance_id": "", "variables": "---\\nhost: 10.170.1.104", "id": 3}		host		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
59	create	2021-08-17 06:18:52.894386+00	{"name": "createfile @ 2:18:53 PM", "description": "", "local_path": "", "scm_type": "git", "scm_url": "https://github.com/rmspavan/AnsibleTower.git", "scm_branch": "", "scm_refspec": "", "scm_clean": false, "scm_delete_on_update": false, "credential": "github-4", "timeout": 0, "organization": "Default-1", "scm_update_on_launch": false, "scm_update_cache_timeout": 0, "allow_override": false, "custom_virtualenv": null, "id": 10}		project		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
60	associate	2021-08-17 06:18:52.97469+00	{"object1": "project", "object1_pk": 10, "object2": "user", "object2_pk": 1, "action": "associate", "relationship": "awx.main.models.rbac.Role_members"}	awx.main.models.projects.Project.admin_role	project	user	1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
61	update	2021-08-17 06:19:46.290333+00	{"name": ["createfile @ 2:18:53 PM", "win-copy"]}		project		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
62	create	2021-08-17 06:19:55.038762+00	{"name": "createfile @ 2:19:55 PM", "description": "", "job_type": "run", "inventory": "lbserver-2", "project": "createfile-8", "playbook": "06command.yml", "scm_branch": "", "forks": 0, "limit": "", "verbosity": 0, "extra_vars": "---", "job_tags": "", "force_handlers": false, "skip_tags": "", "start_at_task": "", "timeout": 0, "use_fact_cache": false, "host_config_key": "", "ask_scm_branch_on_launch": false, "ask_diff_mode_on_launch": false, "ask_variables_on_launch": false, "ask_limit_on_launch": false, "ask_tags_on_launch": false, "ask_skip_tags_on_launch": false, "ask_job_type_on_launch": false, "ask_verbosity_on_launch": false, "ask_inventory_on_launch": false, "ask_credential_on_launch": false, "survey_enabled": false, "become_enabled": false, "diff_mode": false, "allow_simultaneous": false, "custom_virtualenv": null, "job_slice_count": 1, "webhook_service": "", "webhook_credential": null, "survey_spec": "{}", "id": 11}		job_template		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
63	associate	2021-08-17 06:19:55.071696+00	{"object1": "job_template", "object1_pk": 11, "object2": "user", "object2_pk": 1, "action": "associate", "relationship": "awx.main.models.rbac.Role_members"}	awx.main.models.jobs.JobTemplate.admin_role	job_template	user	1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
64	update	2021-08-17 06:54:19.216664+00	{"name": ["createfile @ 2:19:55 PM", "windeom"], "inventory": ["lbserver-2", "win2016-3"], "project": ["createfile-8", "win-copy-10"], "playbook": ["06command.yml", "win-copy.yml"]}		job_template		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
65	disassociate	2021-08-17 06:54:19.358611+00	{"object1": "job_template", "object1_pk": 11, "object2": "credential", "object2_pk": 3, "action": "disassociate", "relationship": "awx.main.models.unified_jobs.UnifiedJobTemplate_credentials"}	awx.main.models.unified_jobs.UnifiedJobTemplate_credentials	job_template	credential	1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
66	associate	2021-08-17 06:54:19.482517+00	{"object1": "job_template", "object1_pk": 11, "object2": "credential", "object2_pk": 5, "action": "associate", "relationship": "awx.main.models.unified_jobs.UnifiedJobTemplate_credentials"}	awx.main.models.unified_jobs.UnifiedJobTemplate_credentials	job_template	credential	1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
67	create	2021-08-17 06:54:21.345178+00	{"name": "windeom", "description": "", "job_type": "run", "inventory": "win2016-3", "project": "win-copy-10", "playbook": "win-copy.yml", "scm_branch": "", "forks": 0, "limit": "", "verbosity": 0, "extra_vars": "{}", "job_tags": "", "force_handlers": false, "skip_tags": "", "start_at_task": "", "timeout": 0, "use_fact_cache": false, "job_template": "windeom-11", "allow_simultaneous": false, "instance_group": null, "diff_mode": false, "job_slice_number": 0, "job_slice_count": 1, "webhook_service": "", "webhook_credential": null, "webhook_guid": "", "id": 10, "credentials": ["win2016 (5)"], "labels": []}		job		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
68	update	2021-08-17 06:55:49.410115+00	{"name": ["windows2016", "10.170.1.104"], "variables": ["---\\nhost: 10.170.1.104", "---"]}		host		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
69	update	2021-08-17 06:56:36.517499+00	{"name": ["windeom", "windemo"]}		job_template		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
70	create	2021-08-17 06:56:38.814181+00	{"name": "windemo", "description": "", "job_type": "run", "inventory": "win2016-3", "project": "win-copy-10", "playbook": "win-copy.yml", "scm_branch": "", "forks": 0, "limit": "", "verbosity": 0, "extra_vars": "{}", "job_tags": "", "force_handlers": false, "skip_tags": "", "start_at_task": "", "timeout": 0, "use_fact_cache": false, "job_template": "windemo-11", "allow_simultaneous": false, "instance_group": null, "diff_mode": false, "job_slice_number": 0, "job_slice_count": 1, "webhook_service": "", "webhook_credential": null, "webhook_guid": "", "id": 11, "credentials": ["win2016 (5)"], "labels": []}		job		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
71	update	2021-08-17 06:57:41.459005+00	{"inputs": ["hidden", "hidden"]}		credential		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
72	create	2021-08-17 07:01:15.951491+00	{"name": "windemo", "description": "", "job_type": "run", "inventory": "win2016-3", "project": "win-copy-10", "playbook": "win-copy.yml", "scm_branch": "", "forks": 0, "limit": "", "verbosity": 0, "extra_vars": "{}", "job_tags": "", "force_handlers": false, "skip_tags": "", "start_at_task": "", "timeout": 0, "use_fact_cache": false, "job_template": "windemo-11", "allow_simultaneous": false, "instance_group": null, "diff_mode": false, "job_slice_number": 0, "job_slice_count": 1, "webhook_service": "", "webhook_credential": null, "webhook_guid": "", "id": 12, "credentials": ["win2016 (5)"], "labels": []}		job		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
73	delete	2021-08-17 07:01:50.932938+00	{"name": "windemo", "description": "", "job_type": "run", "inventory": "win2016-3", "project": "win-copy-10", "playbook": "win-copy.yml", "scm_branch": "", "forks": 0, "limit": "", "verbosity": 0, "extra_vars": "---", "job_tags": "", "force_handlers": false, "skip_tags": "", "start_at_task": "", "timeout": 0, "use_fact_cache": false, "host_config_key": "", "ask_scm_branch_on_launch": false, "ask_diff_mode_on_launch": false, "ask_variables_on_launch": false, "ask_limit_on_launch": false, "ask_tags_on_launch": false, "ask_skip_tags_on_launch": false, "ask_job_type_on_launch": false, "ask_verbosity_on_launch": false, "ask_inventory_on_launch": false, "ask_credential_on_launch": false, "survey_enabled": false, "become_enabled": false, "diff_mode": false, "allow_simultaneous": false, "custom_virtualenv": null, "job_slice_count": 1, "webhook_service": "", "webhook_credential": null, "survey_spec": "{}", "id": 11}		job_template		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
74	create	2021-08-17 07:03:39.878792+00	{"name": "windows-copy", "description": "demo", "job_type": "run", "inventory": "win2016-3", "project": "win-copy-10", "playbook": "win-copy.yml", "scm_branch": "", "forks": 0, "limit": "", "verbosity": 0, "extra_vars": "---", "job_tags": "", "force_handlers": false, "skip_tags": "", "start_at_task": "", "timeout": 0, "use_fact_cache": false, "host_config_key": "", "ask_scm_branch_on_launch": false, "ask_diff_mode_on_launch": false, "ask_variables_on_launch": false, "ask_limit_on_launch": false, "ask_tags_on_launch": false, "ask_skip_tags_on_launch": false, "ask_job_type_on_launch": false, "ask_verbosity_on_launch": false, "ask_inventory_on_launch": false, "ask_credential_on_launch": false, "survey_enabled": false, "become_enabled": false, "diff_mode": false, "allow_simultaneous": false, "custom_virtualenv": null, "job_slice_count": 1, "webhook_service": "", "webhook_credential": null, "survey_spec": "{}", "id": 12}		job_template		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
75	associate	2021-08-17 07:03:39.902312+00	{"object1": "job_template", "object1_pk": 12, "object2": "user", "object2_pk": 1, "action": "associate", "relationship": "awx.main.models.rbac.Role_members"}	awx.main.models.jobs.JobTemplate.admin_role	job_template	user	1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
76	associate	2021-08-17 07:03:40.068665+00	{"object1": "job_template", "object1_pk": 12, "object2": "credential", "object2_pk": 5, "action": "associate", "relationship": "awx.main.models.unified_jobs.UnifiedJobTemplate_credentials"}	awx.main.models.unified_jobs.UnifiedJobTemplate_credentials	job_template	credential	1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
77	create	2021-08-17 07:03:42.144369+00	{"name": "windows-copy", "description": "demo", "job_type": "run", "inventory": "win2016-3", "project": "win-copy-10", "playbook": "win-copy.yml", "scm_branch": "", "forks": 0, "limit": "", "verbosity": 0, "extra_vars": "{}", "job_tags": "", "force_handlers": false, "skip_tags": "", "start_at_task": "", "timeout": 0, "use_fact_cache": false, "job_template": "windows-copy-12", "allow_simultaneous": false, "instance_group": null, "diff_mode": false, "job_slice_number": 0, "job_slice_count": 1, "webhook_service": "", "webhook_credential": null, "webhook_guid": "", "id": 13, "credentials": ["win2016 (5)"], "labels": []}		job		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
78	create	2021-08-17 07:06:17.64772+00	{"name": "createfile", "description": "", "job_type": "run", "inventory": "lbserver-2", "project": "createfile-8", "playbook": "06command.yml", "scm_branch": "", "forks": 0, "limit": "", "verbosity": 0, "extra_vars": "{}", "job_tags": "", "force_handlers": false, "skip_tags": "", "start_at_task": "", "timeout": 0, "use_fact_cache": false, "job_template": "createfile-9", "allow_simultaneous": false, "instance_group": null, "diff_mode": false, "job_slice_number": 0, "job_slice_count": 1, "webhook_service": "", "webhook_credential": null, "webhook_guid": "", "id": 14, "credentials": ["k8s (3)"], "labels": []}		job		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
79	delete	2021-08-17 07:09:19.963315+00	{"name": "createfile", "description": "", "job_type": "run", "inventory": "lbserver-2", "project": "createfile-8", "playbook": "06command.yml", "scm_branch": "", "forks": 0, "limit": "", "verbosity": 0, "extra_vars": "{}", "job_tags": "", "force_handlers": false, "skip_tags": "", "start_at_task": "", "timeout": 0, "use_fact_cache": false, "job_template": "createfile-9", "allow_simultaneous": false, "instance_group": "tower-1", "diff_mode": false, "job_slice_number": 0, "job_slice_count": 1, "webhook_service": "", "webhook_credential": null, "webhook_guid": "", "id": 14}		job		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
80	delete	2021-08-17 07:09:19.963502+00	{"name": "windows-copy", "description": "demo", "job_type": "run", "inventory": "win2016-3", "project": "win-copy-10", "playbook": "win-copy.yml", "scm_branch": "", "forks": 0, "limit": "", "verbosity": 0, "extra_vars": "{}", "job_tags": "", "force_handlers": false, "skip_tags": "", "start_at_task": "", "timeout": 0, "use_fact_cache": false, "job_template": "windows-copy-12", "allow_simultaneous": false, "instance_group": "tower-1", "diff_mode": false, "job_slice_number": 0, "job_slice_count": 1, "webhook_service": "", "webhook_credential": null, "webhook_guid": "", "id": 13}		job		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
81	delete	2021-08-17 07:09:20.018481+00	{"name": "windemo", "description": "", "job_type": "run", "inventory": "win2016-3", "project": "win-copy-10", "playbook": "win-copy.yml", "scm_branch": "", "forks": 0, "limit": "", "verbosity": 0, "extra_vars": "{}", "job_tags": "", "force_handlers": false, "skip_tags": "", "start_at_task": "", "timeout": 0, "use_fact_cache": false, "job_template": null, "allow_simultaneous": false, "instance_group": "tower-1", "diff_mode": false, "job_slice_number": 0, "job_slice_count": 1, "webhook_service": "", "webhook_credential": null, "webhook_guid": "", "id": 12}		job		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
82	delete	2021-08-17 07:09:20.019151+00	{"name": "windemo", "description": "", "job_type": "run", "inventory": "win2016-3", "project": "win-copy-10", "playbook": "win-copy.yml", "scm_branch": "", "forks": 0, "limit": "", "verbosity": 0, "extra_vars": "{}", "job_tags": "", "force_handlers": false, "skip_tags": "", "start_at_task": "", "timeout": 0, "use_fact_cache": false, "job_template": null, "allow_simultaneous": false, "instance_group": "tower-1", "diff_mode": false, "job_slice_number": 0, "job_slice_count": 1, "webhook_service": "", "webhook_credential": null, "webhook_guid": "", "id": 11}		job		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
83	delete	2021-08-17 07:09:20.172931+00	{"name": "createfile", "description": "", "job_type": "run", "inventory": "lbserver-2", "project": "createfile-8", "playbook": "06command.yml", "scm_branch": "", "forks": 0, "limit": "", "verbosity": 0, "extra_vars": "{}", "job_tags": "", "force_handlers": false, "skip_tags": "", "start_at_task": "", "timeout": 0, "use_fact_cache": false, "job_template": "createfile-9", "allow_simultaneous": false, "instance_group": "tower-1", "diff_mode": false, "job_slice_number": 0, "job_slice_count": 1, "webhook_service": "", "webhook_credential": null, "webhook_guid": "", "id": 8}		job		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
84	delete	2021-08-17 07:09:20.178683+00	{"name": "windeom", "description": "", "job_type": "run", "inventory": "win2016-3", "project": "win-copy-10", "playbook": "win-copy.yml", "scm_branch": "", "forks": 0, "limit": "", "verbosity": 0, "extra_vars": "{}", "job_tags": "", "force_handlers": false, "skip_tags": "", "start_at_task": "", "timeout": 0, "use_fact_cache": false, "job_template": null, "allow_simultaneous": false, "instance_group": "tower-1", "diff_mode": false, "job_slice_number": 0, "job_slice_count": 1, "webhook_service": "", "webhook_credential": null, "webhook_guid": "", "id": 10}		job		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
85	delete	2021-08-17 07:09:40.329356+00	{"name": "createfile", "description": "", "job_type": "run", "inventory": "lbserver-2", "project": "createfile-8", "playbook": "02createFile.yml", "scm_branch": "", "forks": 0, "limit": "", "verbosity": 0, "extra_vars": "{}", "job_tags": "", "force_handlers": false, "skip_tags": "", "start_at_task": "", "timeout": 0, "use_fact_cache": false, "job_template": "createfile-9", "allow_simultaneous": false, "instance_group": "tower-1", "diff_mode": false, "job_slice_number": 0, "job_slice_count": 1, "webhook_service": "", "webhook_credential": null, "webhook_guid": "", "id": 7}		job		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
86	delete	2021-08-17 07:09:40.346348+00	{"name": "Demo Job Template", "description": "", "job_type": "run", "inventory": "Demo Inventory-1", "project": "Demo Project-6", "playbook": "hello_world.yml", "scm_branch": "", "forks": 0, "limit": "", "verbosity": 0, "extra_vars": "{}", "job_tags": "", "force_handlers": false, "skip_tags": "", "start_at_task": "", "timeout": 0, "use_fact_cache": false, "job_template": "Demo Job Template-7", "allow_simultaneous": false, "instance_group": "tower-1", "diff_mode": false, "job_slice_number": 0, "job_slice_count": 1, "webhook_service": "", "webhook_credential": null, "webhook_guid": "", "id": 3}		job		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
87	update	2021-08-17 07:10:37.495937+00	{"variables": ["---\\nansible_port: 5986\\nansible_connection: winrm\\nansible_winrm_scheme: https\\nansible_winrm_server_cert_validation: ignore\\nansible_winrm_kerberos_delegation: true", "---\\nansible_port: 5986\\nansible_connection: winrm"]}		inventory		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
88	update	2021-08-17 07:14:36.110841+00	{"inputs": ["hidden", "hidden"]}		credential		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
89	delete	2021-08-17 07:14:48.266503+00	{"name": "windows-copy", "description": "demo", "job_type": "run", "inventory": "win2016-3", "project": "win-copy-10", "playbook": "win-copy.yml", "scm_branch": "", "forks": 0, "limit": "", "verbosity": 0, "extra_vars": "---", "job_tags": "", "force_handlers": false, "skip_tags": "", "start_at_task": "", "timeout": 0, "use_fact_cache": false, "host_config_key": "", "ask_scm_branch_on_launch": false, "ask_diff_mode_on_launch": false, "ask_variables_on_launch": false, "ask_limit_on_launch": false, "ask_tags_on_launch": false, "ask_skip_tags_on_launch": false, "ask_job_type_on_launch": false, "ask_verbosity_on_launch": false, "ask_inventory_on_launch": false, "ask_credential_on_launch": false, "survey_enabled": false, "become_enabled": false, "diff_mode": false, "allow_simultaneous": false, "custom_virtualenv": null, "job_slice_count": 1, "webhook_service": "", "webhook_credential": null, "survey_spec": "{}", "id": 12}		job_template		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
90	delete	2021-08-17 07:15:14.651674+00	{"name": "win-copy", "description": "", "local_path": "_10__createfile_21853_pm", "scm_type": "git", "scm_url": "https://github.com/rmspavan/AnsibleTower.git", "scm_branch": "", "scm_refspec": "", "scm_clean": false, "scm_delete_on_update": false, "credential": "github-4", "timeout": 0, "organization": "Default-1", "scm_update_on_launch": false, "scm_update_cache_timeout": 0, "allow_override": false, "custom_virtualenv": null, "id": 10}		project		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
91	create	2021-08-17 07:15:49.066627+00	{"name": "winserver", "description": "", "local_path": "", "scm_type": "git", "scm_url": "https://github.com/rmspavan/AnsibleTower.git", "scm_branch": "", "scm_refspec": "", "scm_clean": false, "scm_delete_on_update": false, "credential": "github-4", "timeout": 0, "organization": "Default-1", "scm_update_on_launch": false, "scm_update_cache_timeout": 0, "allow_override": false, "custom_virtualenv": null, "id": 13}		project		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
92	create	2021-08-17 07:17:05.977606+00	{"name": "winserver", "description": "", "job_type": "run", "inventory": "win2016-3", "project": "winserver-13", "playbook": "winserver.yml", "scm_branch": "", "forks": 0, "limit": "", "verbosity": 0, "extra_vars": "---", "job_tags": "", "force_handlers": false, "skip_tags": "", "start_at_task": "", "timeout": 0, "use_fact_cache": false, "host_config_key": "", "ask_scm_branch_on_launch": false, "ask_diff_mode_on_launch": false, "ask_variables_on_launch": false, "ask_limit_on_launch": false, "ask_tags_on_launch": false, "ask_skip_tags_on_launch": false, "ask_job_type_on_launch": false, "ask_verbosity_on_launch": false, "ask_inventory_on_launch": false, "ask_credential_on_launch": false, "survey_enabled": false, "become_enabled": false, "diff_mode": false, "allow_simultaneous": false, "custom_virtualenv": null, "job_slice_count": 1, "webhook_service": "", "webhook_credential": null, "survey_spec": "{}", "id": 14}		job_template		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
93	associate	2021-08-17 07:17:06.000865+00	{"object1": "job_template", "object1_pk": 14, "object2": "user", "object2_pk": 1, "action": "associate", "relationship": "awx.main.models.rbac.Role_members"}	awx.main.models.jobs.JobTemplate.admin_role	job_template	user	1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
94	associate	2021-08-17 07:17:06.166377+00	{"object1": "job_template", "object1_pk": 14, "object2": "credential", "object2_pk": 5, "action": "associate", "relationship": "awx.main.models.unified_jobs.UnifiedJobTemplate_credentials"}	awx.main.models.unified_jobs.UnifiedJobTemplate_credentials	job_template	credential	1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
95	create	2021-08-17 07:17:20.544851+00	{"name": "winserver", "description": "", "job_type": "run", "inventory": "win2016-3", "project": "winserver-13", "playbook": "winserver.yml", "scm_branch": "", "forks": 0, "limit": "", "verbosity": 0, "extra_vars": "{}", "job_tags": "", "force_handlers": false, "skip_tags": "", "start_at_task": "", "timeout": 0, "use_fact_cache": false, "job_template": "winserver-14", "allow_simultaneous": false, "instance_group": null, "diff_mode": false, "job_slice_number": 0, "job_slice_count": 1, "webhook_service": "", "webhook_credential": null, "webhook_guid": "", "id": 20, "credentials": ["win2016 (5)"], "labels": []}		job		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
96	create	2021-08-17 07:19:37.021653+00	{"name": "winserver", "description": "", "job_type": "run", "inventory": "win2016-3", "project": "winserver-13", "playbook": "winserver.yml", "scm_branch": "", "forks": 0, "limit": "", "verbosity": 0, "extra_vars": "{}", "job_tags": "", "force_handlers": false, "skip_tags": "", "start_at_task": "", "timeout": 0, "use_fact_cache": false, "job_template": "winserver-14", "allow_simultaneous": false, "instance_group": null, "diff_mode": false, "job_slice_number": 0, "job_slice_count": 1, "webhook_service": "", "webhook_credential": null, "webhook_guid": "", "id": 22, "credentials": ["win2016 (5)"], "labels": []}		job		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
97	update	2021-08-17 07:20:39.919917+00	{"playbook": ["winserver.yml", "win-copy.yml"]}		job_template		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
98	create	2021-08-17 07:20:44.137035+00	{"name": "winserver", "description": "", "job_type": "run", "inventory": "win2016-3", "project": "winserver-13", "playbook": "win-copy.yml", "scm_branch": "", "forks": 0, "limit": "", "verbosity": 0, "extra_vars": "{}", "job_tags": "", "force_handlers": false, "skip_tags": "", "start_at_task": "", "timeout": 0, "use_fact_cache": false, "job_template": "winserver-14", "allow_simultaneous": false, "instance_group": null, "diff_mode": false, "job_slice_number": 0, "job_slice_count": 1, "webhook_service": "", "webhook_credential": null, "webhook_guid": "", "id": 24, "credentials": ["win2016 (5)"], "labels": []}		job		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
99	update	2021-08-17 07:22:01.352589+00	{"variables": ["---\\nansible_port: 5986\\nansible_connection: winrm", "---\\nansible_port: 5986\\nansible_connection: winrm\\nansible_winrm_scheme: https\\nansible_winrm_server_cert_validation: ignore\\nansible_winrm_kerberos_delegation: true"]}		inventory		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
100	create	2021-08-17 07:22:08.287359+00	{"name": "winserver", "description": "", "job_type": "run", "inventory": "win2016-3", "project": "winserver-13", "playbook": "win-copy.yml", "scm_branch": "", "forks": 0, "limit": "", "verbosity": 0, "extra_vars": "{}", "job_tags": "", "force_handlers": false, "skip_tags": "", "start_at_task": "", "timeout": 0, "use_fact_cache": false, "job_template": "winserver-14", "allow_simultaneous": false, "instance_group": null, "diff_mode": false, "job_slice_number": 0, "job_slice_count": 1, "webhook_service": "", "webhook_credential": null, "webhook_guid": "", "id": 25, "credentials": ["win2016 (5)"], "labels": []}		job		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
101	delete	2021-08-18 06:08:50.693119+00	{"name": "createfile", "description": "", "job_type": "run", "inventory": "lbserver-2", "project": "createfile-8", "playbook": "06command.yml", "scm_branch": "", "forks": 0, "limit": "", "verbosity": 0, "extra_vars": "---", "job_tags": "", "force_handlers": false, "skip_tags": "", "start_at_task": "", "timeout": 0, "use_fact_cache": false, "host_config_key": "", "ask_scm_branch_on_launch": false, "ask_diff_mode_on_launch": false, "ask_variables_on_launch": false, "ask_limit_on_launch": false, "ask_tags_on_launch": false, "ask_skip_tags_on_launch": false, "ask_job_type_on_launch": false, "ask_verbosity_on_launch": false, "ask_inventory_on_launch": false, "ask_credential_on_launch": false, "survey_enabled": false, "become_enabled": false, "diff_mode": false, "allow_simultaneous": false, "custom_virtualenv": null, "job_slice_count": 1, "webhook_service": "", "webhook_credential": null, "survey_spec": "{}", "id": 9}		job_template		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
102	delete	2021-08-18 06:08:50.695274+00	{"name": "winserver", "description": "", "job_type": "run", "inventory": "win2016-3", "project": "winserver-13", "playbook": "win-copy.yml", "scm_branch": "", "forks": 0, "limit": "", "verbosity": 0, "extra_vars": "---", "job_tags": "", "force_handlers": false, "skip_tags": "", "start_at_task": "", "timeout": 0, "use_fact_cache": false, "host_config_key": "", "ask_scm_branch_on_launch": false, "ask_diff_mode_on_launch": false, "ask_variables_on_launch": false, "ask_limit_on_launch": false, "ask_tags_on_launch": false, "ask_skip_tags_on_launch": false, "ask_job_type_on_launch": false, "ask_verbosity_on_launch": false, "ask_inventory_on_launch": false, "ask_credential_on_launch": false, "survey_enabled": false, "become_enabled": false, "diff_mode": false, "allow_simultaneous": false, "custom_virtualenv": null, "job_slice_count": 1, "webhook_service": "", "webhook_credential": null, "survey_spec": "{}", "id": 14}		job_template		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
103	delete	2021-08-18 06:09:03.475517+00	{"name": "10.170.1.104", "description": "", "inventory": "win2016-3", "enabled": true, "instance_id": "", "variables": "---", "id": 3}		host		1	{}	{"id": 1, "username": "admin", "first_name": "", "last_name": ""}	awx
\.


--
-- Data for Name: main_activitystream_ad_hoc_command; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_activitystream_ad_hoc_command (id, activitystream_id, adhoccommand_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_credential; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_activitystream_credential (id, activitystream_id, credential_id) FROM stdin;
1	29	1
2	30	1
3	31	2
4	32	2
5	36	1
6	39	3
7	44	4
8	45	3
9	51	3
10	55	5
11	65	3
12	66	5
13	71	5
14	76	5
15	88	5
16	94	5
\.


--
-- Data for Name: main_activitystream_credential_type; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_activitystream_credential_type (id, activitystream_id, credentialtype_id) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	4
5	5	5
6	6	6
7	7	7
8	8	8
9	9	9
10	10	10
11	11	11
12	12	12
13	13	13
14	14	14
15	15	15
16	16	16
17	17	17
18	18	18
19	19	19
20	20	20
21	21	21
22	22	22
\.


--
-- Data for Name: main_activitystream_custom_inventory_script; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_activitystream_custom_inventory_script (id, activitystream_id, custominventoryscript_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_group; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_activitystream_group (id, activitystream_id, group_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_host; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_activitystream_host (id, activitystream_id, host_id) FROM stdin;
1	34	1
2	38	2
3	46	2
\.


--
-- Data for Name: main_activitystream_instance; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_activitystream_instance (id, activitystream_id, instance_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_instance_group; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_activitystream_instance_group (id, activitystream_id, instancegroup_id) FROM stdin;
1	23	1
2	24	1
\.


--
-- Data for Name: main_activitystream_inventory; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_activitystream_inventory (id, activitystream_id, inventory_id) FROM stdin;
1	33	1
2	37	2
3	47	2
4	56	3
5	57	3
6	87	3
7	99	3
\.


--
-- Data for Name: main_activitystream_inventory_source; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_activitystream_inventory_source (id, activitystream_id, inventorysource_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_inventory_update; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_activitystream_inventory_update (id, activitystream_id, inventoryupdate_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_job; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_activitystream_job (id, activitystream_id, job_id) FROM stdin;
9	95	20
10	96	22
11	98	24
12	100	25
\.


--
-- Data for Name: main_activitystream_job_template; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_activitystream_job_template (id, activitystream_id, jobtemplate_id) FROM stdin;
1	35	7
2	36	7
3	40	7
\.


--
-- Data for Name: main_activitystream_label; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_activitystream_label (id, activitystream_id, label_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_notification; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_activitystream_notification (id, activitystream_id, notification_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_notification_template; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_activitystream_notification_template (id, activitystream_id, notificationtemplate_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_o_auth2_access_token; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_activitystream_o_auth2_access_token (id, activitystream_id, oauth2accesstoken_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_o_auth2_application; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_activitystream_o_auth2_application (id, activitystream_id, oauth2application_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_organization; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_activitystream_organization (id, activitystream_id, organization_id) FROM stdin;
1	27	1
2	32	1
\.


--
-- Data for Name: main_activitystream_project; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_activitystream_project (id, activitystream_id, project_id) FROM stdin;
1	28	6
2	48	8
6	91	13
\.


--
-- Data for Name: main_activitystream_project_update; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_activitystream_project_update (id, activitystream_id, projectupdate_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_role; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_activitystream_role (id, activitystream_id, role_id) FROM stdin;
1	30	19
\.


--
-- Data for Name: main_activitystream_schedule; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_activitystream_schedule (id, activitystream_id, schedule_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_team; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_activitystream_team (id, activitystream_id, team_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_unified_job; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_activitystream_unified_job (id, activitystream_id, unifiedjob_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_unified_job_template; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_activitystream_unified_job_template (id, activitystream_id, unifiedjobtemplate_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_user; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_activitystream_user (id, activitystream_id, user_id) FROM stdin;
1	25	1
2	30	1
3	50	1
4	60	1
5	63	1
6	75	1
7	93	1
\.


--
-- Data for Name: main_activitystream_workflow_approval; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_activitystream_workflow_approval (id, activitystream_id, workflowapproval_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_workflow_approval_template; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_activitystream_workflow_approval_template (id, activitystream_id, workflowapprovaltemplate_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_workflow_job; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_activitystream_workflow_job (id, activitystream_id, workflowjob_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_workflow_job_node; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_activitystream_workflow_job_node (id, activitystream_id, workflowjobnode_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_workflow_job_template; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_activitystream_workflow_job_template (id, activitystream_id, workflowjobtemplate_id) FROM stdin;
\.


--
-- Data for Name: main_activitystream_workflow_job_template_node; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_activitystream_workflow_job_template_node (id, activitystream_id, workflowjobtemplatenode_id) FROM stdin;
\.


--
-- Data for Name: main_adhoccommand; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_adhoccommand (unifiedjob_ptr_id, job_type, "limit", module_name, module_args, forks, verbosity, become_enabled, credential_id, inventory_id, extra_vars, diff_mode) FROM stdin;
\.


--
-- Data for Name: main_adhoccommandevent; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_adhoccommandevent (id, created, modified, host_name, event, event_data, failed, changed, counter, host_id, ad_hoc_command_id, end_line, start_line, stdout, uuid, verbosity) FROM stdin;
\.


--
-- Data for Name: main_credential; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_credential (id, created, modified, description, name, created_by_id, modified_by_id, organization_id, admin_role_id, use_role_id, read_role_id, inputs, credential_type_id, managed_by_tower) FROM stdin;
1	2021-08-14 13:00:54.200216+00	2021-08-14 13:00:54.20024+00		Demo Credential	1	1	\N	19	20	21	{"username": "admin"}	1	f
2	2021-08-14 13:00:54.340027+00	2021-08-14 13:00:54.340051+00		Ansible Galaxy	1	1	\N	22	23	24	{"url": "https://galaxy.ansible.com/"}	17	t
4	2021-08-17 04:50:46.453739+00	2021-08-17 04:50:46.453765+00		github	1	1	1	41	42	43	{"password": "$encrypted$UTF8$AESCBC$Z0FBQUFBQmhHMEFtLXlLbzh6YU9GQU9Qc09ycjgtWS1VSmRXV3JFWC0yRldfMWRYR3FqTDhPQ09kdWZFc3ZFS0JUOWFOTlB5UDZ3ekJaSmUwT0d3eGNTRkh6czlfbnFQTFE9PQ==", "username": "rmspavan"}	2	f
3	2021-08-17 04:42:41.9399+00	2021-08-17 04:51:18.333136+00		k8s	1	1	1	38	39	40	{"password": "$encrypted$UTF8$AESCBC$Z0FBQUFBQmhHMEJHZXhMaERmUGFMdWhYS3ZySWhBdnB0eUZkcWhDWXcwOHI5WEZwM1VRUWJseVNESGhNR2hwN1U3cXFWbFVUbFhua2JBdlVUcWM1RlBwYUNCcUFSWV9VOWc9PQ==", "username": "root", "become_method": "", "become_username": ""}	1	f
5	2021-08-17 06:07:25.450518+00	2021-08-17 07:14:36.10668+00		win2016	1	1	1	51	52	53	{"password": "$encrypted$UTF8$AESCBC$Z0FBQUFBQmhHMkhjOGFzNzUxNURBbDdOdHJBS2o5bC1TdDAxdmNmNE10azFwaVROb3EzZGdXQlc0Wkc2UVZhVjM2dDdYQkJkSzNYanJpb3hLZ0d1anVuRzAxY2xPc2xhUXc9PQ==", "username": "pdmskul", "become_method": "", "become_username": ""}	1	f
\.


--
-- Data for Name: main_credentialinputsource; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_credentialinputsource (id, created, modified, description, input_field_name, metadata, created_by_id, modified_by_id, source_credential_id, target_credential_id) FROM stdin;
\.


--
-- Data for Name: main_credentialtype; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_credentialtype (id, created, modified, description, name, kind, managed_by_tower, inputs, injectors, created_by_id, modified_by_id, namespace) FROM stdin;
1	2021-08-14 12:59:58.675025+00	2021-08-14 13:00:18.860858+00		Machine	ssh	t	{}	{}	\N	\N	ssh
2	2021-08-14 12:59:58.684663+00	2021-08-14 13:00:18.865221+00		Source Control	scm	t	{}	{}	\N	\N	scm
3	2021-08-14 12:59:58.689916+00	2021-08-14 13:00:18.868902+00		Vault	vault	t	{}	{}	\N	\N	vault
4	2021-08-14 12:59:58.695162+00	2021-08-14 13:00:18.872711+00		Network	net	t	{}	{}	\N	\N	net
5	2021-08-14 12:59:58.700286+00	2021-08-14 13:00:18.876379+00		Amazon Web Services	cloud	t	{}	{}	\N	\N	aws
6	2021-08-14 12:59:58.70559+00	2021-08-14 13:00:18.880053+00		OpenStack	cloud	t	{}	{}	\N	\N	openstack
7	2021-08-14 12:59:58.710709+00	2021-08-14 13:00:18.883668+00		VMware vCenter	cloud	t	{}	{}	\N	\N	vmware
8	2021-08-14 12:59:58.715933+00	2021-08-14 13:00:18.887307+00		Red Hat Satellite 6	cloud	t	{}	{}	\N	\N	satellite6
9	2021-08-14 12:59:58.721099+00	2021-08-14 13:00:18.891112+00		Google Compute Engine	cloud	t	{}	{}	\N	\N	gce
10	2021-08-14 12:59:58.726427+00	2021-08-14 13:00:18.894721+00		Microsoft Azure Resource Manager	cloud	t	{}	{}	\N	\N	azure_rm
11	2021-08-14 12:59:58.731592+00	2021-08-14 13:00:18.898325+00		GitHub Personal Access Token	token	t	{}	{}	\N	\N	github_token
12	2021-08-14 12:59:58.736814+00	2021-08-14 13:00:18.901989+00		GitLab Personal Access Token	token	t	{}	{}	\N	\N	gitlab_token
13	2021-08-14 12:59:58.741923+00	2021-08-14 13:00:18.905643+00		Insights	insights	t	{}	{}	\N	\N	insights
14	2021-08-14 12:59:58.74723+00	2021-08-14 13:00:18.909301+00		Red Hat Virtualization	cloud	t	{}	{}	\N	\N	rhv
15	2021-08-14 12:59:58.75238+00	2021-08-14 13:00:18.913103+00		Ansible Tower	cloud	t	{}	{}	\N	\N	tower
16	2021-08-14 12:59:58.757527+00	2021-08-14 13:00:18.916718+00		OpenShift or Kubernetes API Bearer Token	kubernetes	t	{}	{}	\N	\N	kubernetes_bearer_token
17	2021-08-14 12:59:58.762717+00	2021-08-14 13:00:18.920339+00		Ansible Galaxy/Automation Hub API Token	galaxy	t	{}	{}	\N	\N	galaxy_api_token
18	2021-08-14 12:59:58.767994+00	2021-08-14 13:00:18.924009+00		CyberArk AIM Central Credential Provider Lookup	external	t	{}	{}	\N	\N	aim
19	2021-08-14 12:59:58.773137+00	2021-08-14 13:00:18.927615+00		Microsoft Azure Key Vault	external	t	{}	{}	\N	\N	azure_kv
20	2021-08-14 12:59:58.778302+00	2021-08-14 13:00:18.931223+00		CyberArk Conjur Secret Lookup	external	t	{}	{}	\N	\N	conjur
21	2021-08-14 12:59:58.783447+00	2021-08-14 13:00:18.935745+00		HashiCorp Vault Secret Lookup	external	t	{}	{}	\N	\N	hashivault_kv
22	2021-08-14 12:59:58.788827+00	2021-08-14 13:00:18.939422+00		HashiCorp Vault Signed SSH	external	t	{}	{}	\N	\N	hashivault_ssh
\.


--
-- Data for Name: main_custominventoryscript; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_custominventoryscript (id, created, modified, description, name, script, created_by_id, modified_by_id, organization_id, admin_role_id, read_role_id) FROM stdin;
\.


--
-- Data for Name: main_group; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_group (id, created, modified, description, name, variables, created_by_id, inventory_id, modified_by_id) FROM stdin;
\.


--
-- Data for Name: main_group_hosts; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_group_hosts (id, group_id, host_id) FROM stdin;
\.


--
-- Data for Name: main_group_inventory_sources; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_group_inventory_sources (id, group_id, inventorysource_id) FROM stdin;
\.


--
-- Data for Name: main_group_parents; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_group_parents (id, from_group_id, to_group_id) FROM stdin;
\.


--
-- Data for Name: main_host; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_host (id, created, modified, description, name, enabled, instance_id, variables, created_by_id, inventory_id, last_job_host_summary_id, modified_by_id, last_job_id, ansible_facts, ansible_facts_modified, insights_system_id) FROM stdin;
2	2021-08-17 04:41:10.434973+00	2021-08-17 04:52:19.450176+00		10.170.1.16	t		---	1	2	\N	1	\N	{}	\N	\N
1	2021-08-14 13:00:54.609258+00	2021-08-14 13:00:54.609281+00		localhost	t		ansible_connection: local\nansible_python_interpreter: '{{ ansible_playbook_python }}'	1	1	\N	1	\N	{}	\N	\N
\.


--
-- Data for Name: main_host_inventory_sources; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_host_inventory_sources (id, host_id, inventorysource_id) FROM stdin;
\.


--
-- Data for Name: main_instance; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_instance (id, uuid, hostname, created, modified, capacity, version, last_isolated_check, capacity_adjustment, cpu, memory, cpu_capacity, mem_capacity, enabled, managed_by_policy, ip_address) FROM stdin;
1	00000000-0000-0000-0000-000000000000	awx	2021-08-14 13:00:43.917554+00	2021-08-30 04:44:39.38226+00	59	17.1.0	\N	1.00	4	8347475968	16	59	t	t	\N
\.


--
-- Data for Name: main_instancegroup; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_instancegroup (id, name, created, modified, controller_id, policy_instance_list, policy_instance_minimum, policy_instance_percentage, credential_id, pod_spec_override) FROM stdin;
1	tower	2021-08-14 13:00:45.999262+00	2021-08-14 13:00:46.033933+00	\N	[]	0	100	\N	
\.


--
-- Data for Name: main_instancegroup_instances; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_instancegroup_instances (id, instancegroup_id, instance_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: main_inventory; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_inventory (id, created, modified, description, name, variables, has_active_failures, total_hosts, hosts_with_active_failures, total_groups, has_inventory_sources, total_inventory_sources, inventory_sources_with_failures, created_by_id, modified_by_id, organization_id, admin_role_id, adhoc_role_id, update_role_id, use_role_id, read_role_id, host_filter, kind, pending_deletion, insights_credential_id) FROM stdin;
1	2021-08-14 13:00:54.515794+00	2021-08-14 13:00:54.515819+00		Demo Inventory		f	1	0	0	f	0	0	1	1	1	25	27	26	28	29	\N		f	\N
2	2021-08-17 04:40:55.515589+00	2021-08-17 04:52:52.804967+00		lbserver	---	f	1	0	0	f	0	0	1	1	1	33	35	34	36	37	\N		f	\N
3	2021-08-17 06:16:03.014134+00	2021-08-17 07:22:01.348611+00		win2016	---\nansible_port: 5986\nansible_connection: winrm\nansible_winrm_scheme: https\nansible_winrm_server_cert_validation: ignore\nansible_winrm_kerberos_delegation: true	f	0	0	0	f	0	0	1	1	1	54	56	55	57	58	\N		f	\N
\.


--
-- Data for Name: main_inventoryinstancegroupmembership; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_inventoryinstancegroupmembership (id, "position", instancegroup_id, inventory_id) FROM stdin;
\.


--
-- Data for Name: main_inventorysource; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_inventorysource (unifiedjobtemplate_ptr_id, source, source_path, source_vars, overwrite, overwrite_vars, update_on_launch, update_cache_timeout, inventory_id, source_script_id, timeout, scm_last_revision, source_project_id, update_on_project_update, verbosity, custom_virtualenv, enabled_value, enabled_var, host_filter) FROM stdin;
\.


--
-- Data for Name: main_inventoryupdate; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_inventoryupdate (unifiedjob_ptr_id, source, source_path, source_vars, overwrite, overwrite_vars, license_error, inventory_source_id, source_script_id, timeout, source_project_update_id, verbosity, inventory_id, custom_virtualenv, org_host_limit_error, enabled_value, enabled_var, host_filter) FROM stdin;
\.


--
-- Data for Name: main_inventoryupdateevent; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_inventoryupdateevent (id, created, modified, event_data, uuid, counter, stdout, verbosity, start_line, end_line, inventory_update_id) FROM stdin;
\.


--
-- Data for Name: main_job; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_job (unifiedjob_ptr_id, job_type, playbook, forks, "limit", verbosity, extra_vars, job_tags, force_handlers, skip_tags, start_at_task, become_enabled, inventory_id, job_template_id, project_id, survey_passwords, allow_simultaneous, artifacts, timeout, scm_revision, project_update_id, use_fact_cache, diff_mode, job_slice_count, job_slice_number, custom_virtualenv, scm_branch, webhook_credential_id, webhook_guid, webhook_service) FROM stdin;
25	run	win-copy.yml	0		0	{}		f			f	3	\N	13	{}	f	{}	0	f34509208c70e4ccedbd54480abf68b01f9d221b	\N	f	f	1	0	/var/lib/awx/venv/ansible		\N		
20	run	winserver.yml	0		0	{}		f			f	3	\N	13	{}	f	{}	0	355d65af0d6cc43865251aea89a57e5c3ae0b282	\N	f	f	1	0	/var/lib/awx/venv/ansible		\N		
22	run	winserver.yml	0		0	{}		f			f	3	\N	13	{}	f	{}	0	f34509208c70e4ccedbd54480abf68b01f9d221b	\N	f	f	1	0	/var/lib/awx/venv/ansible		\N		
24	run	win-copy.yml	0		0	{}		f			f	3	\N	13	{}	f	{}	0	f34509208c70e4ccedbd54480abf68b01f9d221b	\N	f	f	1	0	/var/lib/awx/venv/ansible		\N		
\.


--
-- Data for Name: main_jobevent; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_jobevent (id, created, modified, event, event_data, failed, changed, host_name, play, role, task, counter, host_id, job_id, uuid, parent_uuid, end_line, playbook, start_line, stdout, verbosity) FROM stdin;
82	2021-08-17 07:17:21.779449+00	2021-08-17 07:17:21.779449+00	verbose	{}	f	f					1	\N	20	7f9bf816-9640-48e4-85bb-0a27eea029d3		1		0	SSH password: 	0
83	2021-08-17 07:17:22.03574+00	2021-08-17 07:17:22.03574+00	verbose	{}	f	f					2	\N	20	05e16286-fd20-4b8c-ad13-44b60c81d8d2		2		1	[0;31mERROR! We were unable to read either as JSON nor YAML, these are the errors we got from each:[0m	0
84	2021-08-17 07:17:22.041787+00	2021-08-17 07:17:22.041787+00	verbose	{}	f	f					3	\N	20	769a4901-095f-4043-9a63-4715d0c7fcf5		3		2	[0;31mJSON: Expecting value: line 1 column 1 (char 0)[0m	0
85	2021-08-17 07:17:22.040944+00	2021-08-17 07:17:22.040944+00	verbose	{}	f	f					4	\N	20	5060e6fd-3cd5-4083-8f04-f83d5e950125		4		3	[0;31m[0m	0
86	2021-08-17 07:17:22.038173+00	2021-08-17 07:17:22.038173+00	verbose	{}	f	f					5	\N	20	96cc76a5-a2ad-4e0f-a812-534696197b38		5		4	[0;31mSyntax Error while loading YAML.[0m	0
87	2021-08-17 07:17:23.146185+00	2021-08-17 07:17:23.146185+00	verbose	{}	f	f					12	\N	20	ec8e1954-43a5-4b4a-a36e-3fe041be59de		12		11	[0;31m[0m	0
88	2021-08-17 07:17:23.146808+00	2021-08-17 07:17:23.146808+00	verbose	{}	f	f					14	\N	20	276e389d-4002-4b22-b6cd-1c6556d03359		14		13	[0;31m hosts: all[0m	0
89	2021-08-17 07:17:23.146185+00	2021-08-17 07:17:23.146185+00	verbose	{}	f	f					15	\N	20	3dd88359-74ca-46c7-87b2-fc3f235fde17		15		14	[0;31m ^ here[0m	0
90	2021-08-17 07:17:23.146227+00	2021-08-17 07:17:23.146227+00	verbose	{}	f	f					6	\N	20	10ab3ec3-052b-419d-af69-ca7b8e32eeee		6		5	[0;31m  did not find expected '-' indicator[0m	0
91	2021-08-17 07:17:23.146227+00	2021-08-17 07:17:23.146227+00	verbose	{}	f	f					7	\N	20	d880ad32-41ef-4d25-82bd-b79e1902d2fb		7		6	[0;31m[0m	0
92	2021-08-17 07:17:23.146227+00	2021-08-17 07:17:23.146227+00	verbose	{}	f	f					9	\N	20	3a8d600e-d9b5-496f-ace4-164f00593a44		9		8	[0;31mbe elsewhere in the file depending on the exact syntax problem.[0m	0
93	2021-08-17 07:17:23.146227+00	2021-08-17 07:17:23.146227+00	verbose	{}	f	f					10	\N	20	c1b28bd9-7c4f-486a-a7d6-e8b1f5ad6024		10		9	[0;31m[0m	0
94	2021-08-17 07:17:23.146227+00	2021-08-17 07:17:23.146227+00	verbose	{}	f	f					13	\N	20	c29f107c-aebc-477b-8b62-eb6317fba616		13		12	[0;31m- name: Install Telnet and check SQL[0m	0
95	2021-08-17 07:17:23.247356+00	2021-08-17 07:17:23.247356+00	verbose	{}	f	f					8	\N	20	5d30d803-b179-4342-91e3-ea5abb19d1c4		8		7	[0;31mThe error appears to be in '/tmp/bwrap_20_paumsrqn/awx_20_sao0k761/project/winserver.yml': line 3, column 2, but may[0m	0
96	2021-08-17 07:17:23.247356+00	2021-08-17 07:17:23.247356+00	verbose	{}	f	f					11	\N	20	19053522-f612-4302-84ef-f9f7f6b3437d		11		10	[0;31mThe offending line appears to be:[0m	0
97	2021-08-17 07:19:38.369528+00	2021-08-17 07:19:38.369528+00	verbose	{}	f	f					1	\N	22	16b5dd25-dc2b-44a8-9fc0-69aa22711d83		1		0	SSH password: 	0
98	2021-08-17 07:19:38.626716+00	2021-08-17 07:19:38.626716+00	verbose	{}	f	f					3	\N	22	e795dfe9-53e3-462c-a9e1-6b1f6bbfe05d		3		2	[1;35m/tmp/bwrap_22__7ivdckt/awx_22_b0hfuoi6/project/winserver.yml, line 5, column 5,[0m	0
99	2021-08-17 07:19:38.627435+00	2021-08-17 07:19:38.627435+00	verbose	{}	f	f					4	\N	22	ca4de80c-166f-418e-a1a5-c10a62f1fb56		4		3	[1;35mfound a duplicate dict key (name). Using last defined value only.[0m	0
100	2021-08-17 07:19:38.628651+00	2021-08-17 07:19:38.628651+00	verbose	{}	f	f					5	\N	22	b46683a1-1ce7-44d8-9520-ecedaeb91a3f		5		4	[1;35m[WARNING]: While constructing a mapping from[0m	0
101	2021-08-17 07:19:38.626318+00	2021-08-17 07:19:38.626318+00	verbose	{}	f	f					2	\N	22	4f3a8eb2-93f6-4bc6-9880-23b32e383bb6		2		1	[1;35m[WARNING]: While constructing a mapping from[0m	0
102	2021-08-17 07:19:38.810658+00	2021-08-17 07:19:38.810658+00	verbose	{}	f	f					9	\N	22	d3129f9e-89bd-4580-a406-5d35c9e761d0		9		8	[0;31m[0m	0
103	2021-08-17 07:19:38.811115+00	2021-08-17 07:19:38.811115+00	verbose	{}	f	f					11	\N	22	f43ca68b-e8a0-4f45-b4bc-fd8ac99bcec2		11		10	[0;31mbe elsewhere in the file depending on the exact syntax problem.[0m	0
104	2021-08-17 07:19:38.810162+00	2021-08-17 07:19:38.810162+00	verbose	{}	f	f					10	\N	22	7aca61ba-f70c-4989-8eed-4ecb821f4b42		10		9	[0;31mThe error appears to be in '/tmp/bwrap_22__7ivdckt/awx_22_b0hfuoi6/project/winserver.yml': line 10, column 5, but may[0m	0
105	2021-08-17 07:19:38.809562+00	2021-08-17 07:19:38.809562+00	verbose	{}	f	f					6	\N	22	c9e8877e-0575-4370-af85-bb65f8ea1918		6		5	[1;35m/tmp/bwrap_22__7ivdckt/awx_22_b0hfuoi6/project/winserver.yml, line 10, column[0m	0
106	2021-08-17 07:19:38.809562+00	2021-08-17 07:19:38.809562+00	verbose	{}	f	f					7	\N	22	9c76b458-1b74-4d37-b68e-3bfa28c6adca		7		6	[1;35m5, found a duplicate dict key (name). Using last defined value only.[0m	0
107	2021-08-17 07:19:38.809562+00	2021-08-17 07:19:38.809562+00	verbose	{}	f	f					8	\N	22	4e010fc4-bf90-4b5e-b48e-bf8ad45d63e8		8		7	[0;31mERROR! conflicting action statements: win_service, start_mode[0m	0
108	2021-08-17 07:19:39.830274+00	2021-08-17 07:19:39.830274+00	verbose	{}	f	f					16	\N	22	d6aa402f-bdc9-40c2-9bef-8efc0128e45e		16		15	[0;31m  - name: Start SQL Service[0m	0
109	2021-08-17 07:19:39.830228+00	2021-08-17 07:19:39.830228+00	verbose	{}	f	f					12	\N	22	b4c9bd8f-de25-4669-81e3-3759c2559c0e		12		11	[0;31m[0m	0
110	2021-08-17 07:19:39.830228+00	2021-08-17 07:19:39.830228+00	verbose	{}	f	f					13	\N	22	2878bb0d-00d7-480b-af30-ef5f91580455		13		12	[0;31mThe offending line appears to be:[0m	0
111	2021-08-17 07:19:39.830228+00	2021-08-17 07:19:39.830228+00	verbose	{}	f	f					15	\N	22	2c7dc4fb-0dee-41dc-9190-d4555abe890c		15		14	[0;31m[0m	0
112	2021-08-17 07:19:40.032423+00	2021-08-17 07:19:40.032423+00	verbose	{}	f	f					14	\N	22	acdaac35-1038-4599-9551-39ad061ddf8c		14		13	[0;31m[0m	0
113	2021-08-17 07:19:40.032423+00	2021-08-17 07:19:40.032423+00	verbose	{}	f	f					17	\N	22	c96beaaa-d851-48f5-9546-2bc10b8a3614		17		16	[0;31m    ^ here[0m	0
114	2021-08-17 07:20:45.383698+00	2021-08-17 07:20:45.383698+00	verbose	{}	f	f					1	\N	24	a9b2e92a-1b90-4443-a71a-ac5e3a05b7d8		1		0	SSH password: 	0
115	2021-08-17 07:20:45.704368+00	2021-08-17 07:20:45.706086+00	playbook_on_start	{"playbook": "win-copy.yml", "playbook_uuid": "6474cae4-0dae-4eb1-87d7-963382e1e2f6", "uuid": "6474cae4-0dae-4eb1-87d7-963382e1e2f6"}	f	f					2	\N	24	6474cae4-0dae-4eb1-87d7-963382e1e2f6		1	win-copy.yml	1		0
116	2021-08-17 07:20:45.706668+00	2021-08-17 07:20:45.709526+00	playbook_on_play_start	{"playbook": "win-copy.yml", "playbook_uuid": "6474cae4-0dae-4eb1-87d7-963382e1e2f6", "play": "all", "play_uuid": "0242ac12-0005-19b8-32e2-000000000006", "play_pattern": "all", "name": "all", "pattern": "all", "uuid": "0242ac12-0005-19b8-32e2-000000000006"}	f	f		all			3	\N	24	0242ac12-0005-19b8-32e2-000000000006	6474cae4-0dae-4eb1-87d7-963382e1e2f6	3	win-copy.yml	1	\r\nPLAY [all] *********************************************************************	0
117	2021-08-17 07:20:45.71591+00	2021-08-17 07:20:45.720002+00	playbook_on_task_start	{"playbook": "win-copy.yml", "playbook_uuid": "6474cae4-0dae-4eb1-87d7-963382e1e2f6", "play": "all", "play_uuid": "0242ac12-0005-19b8-32e2-000000000006", "play_pattern": "all", "task": "Gathering Facts", "task_uuid": "0242ac12-0005-19b8-32e2-00000000000c", "task_action": "gather_facts", "task_args": "", "task_path": "/tmp/bwrap_24_va7ph4io/awx_24_qk0xhtd1/project/win-copy.yml:2", "name": "Gathering Facts", "is_conditional": false, "uuid": "0242ac12-0005-19b8-32e2-00000000000c"}	t	f		all		Gathering Facts	4	\N	24	0242ac12-0005-19b8-32e2-00000000000c	0242ac12-0005-19b8-32e2-000000000006	5	win-copy.yml	3	\r\nTASK [Gathering Facts] *********************************************************	0
120	2021-08-17 07:20:46.107603+00	2021-08-17 07:20:46.156928+00	playbook_on_stats	{"playbook": "win-copy.yml", "playbook_uuid": "6474cae4-0dae-4eb1-87d7-963382e1e2f6", "changed": {}, "dark": {"10.170.1.104": 1}, "failures": {}, "ignored": {}, "ok": {}, "processed": {"10.170.1.104": 1}, "rescued": {}, "skipped": {}, "artifact_data": {}, "uuid": "69fed759-3437-4086-a056-32f372d360a4"}	t	f					7	\N	24	69fed759-3437-4086-a056-32f372d360a4	6474cae4-0dae-4eb1-87d7-963382e1e2f6	10	win-copy.yml	6	\r\nPLAY RECAP *********************************************************************\r\n[0;31m10.170.1.104[0m               : ok=0    changed=0    [1;31munreachable=1   [0m failed=0    skipped=0    rescued=0    ignored=0   \r\n	0
121	2021-08-17 07:22:09.529076+00	2021-08-17 07:22:09.529076+00	verbose	{}	f	f					1	\N	25	21d3d579-4de3-44a8-ae4d-fde29d3f04f8		1		0	SSH password: 	0
122	2021-08-17 07:22:09.845995+00	2021-08-17 07:22:09.847779+00	playbook_on_start	{"playbook": "win-copy.yml", "playbook_uuid": "f75f10d6-befd-4e1c-b1c0-ec1d974b2550", "uuid": "f75f10d6-befd-4e1c-b1c0-ec1d974b2550"}	f	f					2	\N	25	f75f10d6-befd-4e1c-b1c0-ec1d974b2550		1	win-copy.yml	1		0
123	2021-08-17 07:22:09.84828+00	2021-08-17 07:22:09.8502+00	playbook_on_play_start	{"playbook": "win-copy.yml", "playbook_uuid": "f75f10d6-befd-4e1c-b1c0-ec1d974b2550", "play": "all", "play_uuid": "0242ac12-0005-cca6-3f46-000000000006", "play_pattern": "all", "name": "all", "pattern": "all", "uuid": "0242ac12-0005-cca6-3f46-000000000006"}	f	f		all			3	\N	25	0242ac12-0005-cca6-3f46-000000000006	f75f10d6-befd-4e1c-b1c0-ec1d974b2550	3	win-copy.yml	1	\r\nPLAY [all] *********************************************************************	0
124	2021-08-17 07:22:09.857389+00	2021-08-17 07:22:09.861876+00	playbook_on_task_start	{"playbook": "win-copy.yml", "playbook_uuid": "f75f10d6-befd-4e1c-b1c0-ec1d974b2550", "play": "all", "play_uuid": "0242ac12-0005-cca6-3f46-000000000006", "play_pattern": "all", "task": "Gathering Facts", "task_uuid": "0242ac12-0005-cca6-3f46-00000000000c", "task_action": "gather_facts", "task_args": "", "task_path": "/tmp/bwrap_25_wdbktjim/awx_25_hjb6fgsm/project/win-copy.yml:2", "name": "Gathering Facts", "is_conditional": false, "uuid": "0242ac12-0005-cca6-3f46-00000000000c"}	f	f		all		Gathering Facts	4	\N	25	0242ac12-0005-cca6-3f46-00000000000c	0242ac12-0005-cca6-3f46-000000000006	5	win-copy.yml	3	\r\nTASK [Gathering Facts] *********************************************************	0
128	2021-08-17 07:22:14.862808+00	2021-08-17 07:22:14.864308+00	playbook_on_task_start	{"playbook": "win-copy.yml", "playbook_uuid": "f75f10d6-befd-4e1c-b1c0-ec1d974b2550", "play": "all", "play_uuid": "0242ac12-0005-cca6-3f46-000000000006", "play_pattern": "all", "task": "Copy File", "task_uuid": "0242ac12-0005-cca6-3f46-000000000008", "task_action": "win_copy", "task_args": "", "task_path": "/tmp/bwrap_25_wdbktjim/awx_25_hjb6fgsm/project/win-copy.yml:4", "name": "Copy File", "is_conditional": false, "uuid": "0242ac12-0005-cca6-3f46-000000000008"}	f	f		all		Copy File	7	\N	25	0242ac12-0005-cca6-3f46-000000000008	0242ac12-0005-cca6-3f46-000000000006	8	win-copy.yml	6	\r\nTASK [Copy File] ***************************************************************	0
129	2021-08-17 07:22:15.987599+00	2021-08-17 07:22:16.035664+00	playbook_on_stats	{"playbook": "win-copy.yml", "playbook_uuid": "f75f10d6-befd-4e1c-b1c0-ec1d974b2550", "changed": {"10.170.1.104": 1}, "dark": {}, "failures": {}, "ignored": {}, "ok": {"10.170.1.104": 2}, "processed": {"10.170.1.104": 1}, "rescued": {}, "skipped": {}, "artifact_data": {}, "uuid": "d3aaa957-837e-4450-826b-6dafb8b1626e"}	f	t					10	\N	25	d3aaa957-837e-4450-826b-6dafb8b1626e	f75f10d6-befd-4e1c-b1c0-ec1d974b2550	13	win-copy.yml	9	\r\nPLAY RECAP *********************************************************************\r\n[0;33m10.170.1.104[0m               : [0;32mok=2   [0m [0;33mchanged=1   [0m unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   \r\n	0
118	2021-08-17 07:20:46.104311+00	2021-08-17 07:20:46.10636+00	runner_on_unreachable	{"playbook": "win-copy.yml", "playbook_uuid": "6474cae4-0dae-4eb1-87d7-963382e1e2f6", "play": "all", "play_uuid": "0242ac12-0005-19b8-32e2-000000000006", "play_pattern": "all", "task": "Gathering Facts", "task_uuid": "0242ac12-0005-19b8-32e2-00000000000c", "task_action": "gather_facts", "task_args": "", "task_path": "/tmp/bwrap_24_va7ph4io/awx_24_qk0xhtd1/project/win-copy.yml:2", "host": "10.170.1.104", "remote_addr": "10.170.1.104", "start": "2021-08-17T07:20:45.716553", "end": "2021-08-17T07:20:46.104092", "duration": 0.387539, "res": {"unreachable": true, "msg": "ssl: HTTPSConnectionPool(host='10.170.1.104', port=5986): Max retries exceeded with url: /wsman (Caused by SSLError(SSLError(\\"bad handshake: Error([('SSL routines', 'tls_process_server_certificate', 'certificate verify failed')],)\\",),))", "changed": false}, "uuid": "d23b75c2-b6f8-4e82-95ab-fcbf91262749"}	t	f	10.170.1.104	all		Gathering Facts	6	\N	24	d23b75c2-b6f8-4e82-95ab-fcbf91262749	0242ac12-0005-19b8-32e2-00000000000c	6	win-copy.yml	5	[1;31mfatal: [10.170.1.104]: UNREACHABLE! => {"changed": false, "msg": "ssl: HTTPSConnectionPool(host='10.170.1.104', port=5986): Max retries exceeded with url: /wsman (Caused by SSLError(SSLError(\\"bad handshake: Error([('SSL routines', 'tls_process_server_certificate', 'certificate verify failed')],)\\",),))", "unreachable": true}[0m	0
119	2021-08-17 07:20:45.71663+00	2021-08-17 07:20:46.156928+00	runner_on_start	{"playbook": "win-copy.yml", "playbook_uuid": "6474cae4-0dae-4eb1-87d7-963382e1e2f6", "play": "all", "play_uuid": "0242ac12-0005-19b8-32e2-000000000006", "play_pattern": "all", "task": "Gathering Facts", "task_uuid": "0242ac12-0005-19b8-32e2-00000000000c", "task_action": "gather_facts", "task_args": "", "task_path": "/tmp/bwrap_24_va7ph4io/awx_24_qk0xhtd1/project/win-copy.yml:2", "host": "10.170.1.104", "uuid": "e7c4fb84-e951-4200-88ac-0975ab4f6628"}	f	f	10.170.1.104	all		Gathering Facts	5	\N	24	e7c4fb84-e951-4200-88ac-0975ab4f6628	0242ac12-0005-19b8-32e2-00000000000c	5	win-copy.yml	5		0
125	2021-08-17 07:22:09.858091+00	2021-08-17 07:22:09.861794+00	runner_on_start	{"playbook": "win-copy.yml", "playbook_uuid": "f75f10d6-befd-4e1c-b1c0-ec1d974b2550", "play": "all", "play_uuid": "0242ac12-0005-cca6-3f46-000000000006", "play_pattern": "all", "task": "Gathering Facts", "task_uuid": "0242ac12-0005-cca6-3f46-00000000000c", "task_action": "gather_facts", "task_args": "", "task_path": "/tmp/bwrap_25_wdbktjim/awx_25_hjb6fgsm/project/win-copy.yml:2", "host": "10.170.1.104", "uuid": "64a354b0-6de2-4318-b63e-7afb49622c69"}	f	f	10.170.1.104	all		Gathering Facts	5	\N	25	64a354b0-6de2-4318-b63e-7afb49622c69	0242ac12-0005-cca6-3f46-00000000000c	5	win-copy.yml	5		0
126	2021-08-17 07:22:14.846657+00	2021-08-17 07:22:14.848776+00	runner_on_ok	{"playbook": "win-copy.yml", "playbook_uuid": "f75f10d6-befd-4e1c-b1c0-ec1d974b2550", "play": "all", "play_uuid": "0242ac12-0005-cca6-3f46-000000000006", "play_pattern": "all", "task": "Gathering Facts", "task_uuid": "0242ac12-0005-cca6-3f46-00000000000c", "task_action": "gather_facts", "task_args": "", "task_path": "/tmp/bwrap_25_wdbktjim/awx_25_hjb6fgsm/project/win-copy.yml:2", "host": "10.170.1.104", "remote_addr": "10.170.1.104", "res": {"ansible_facts": {"ansible_ip_addresses": ["10.170.1.104", "fe80::f148:526c:b288:6f47", "10.15.253.131", "fe80::b5cc:89dd:d571:3fcf", "192.168.18.1", "fe80::594:ae40:6165:d522", "192.168.199.1", "fe80::7b:cb75:88f6:6426", "192.168.56.1", "fe80::55e7:10e7:3687:f904"], "ansible_windows_domain_role": "Stand-alone server", "ansible_distribution_version": "10.0.14393.0", "ansible_distribution_major_version": "10", "ansible_netbios_name": "SPOGSVR01", "ansible_os_name": "Microsoft Windows Server 2016 Standard", "ansible_system_description": "SPOGSVR01", "ansible_machine_id": "S-1-5-21-3561869480-4110372908-2426507412", "ansible_product_serial": "2K1SRK2", "ansible_system_vendor": "Dell Inc.", "ansible_owner_contact": "", "ansible_user_id": "pdmskul", "ansible_date_time": {"time": "15:22:11", "date": "2021-08-17", "second": "11", "tz": "Singapore Standard Time", "iso8601_micro": "2021-08-17T07:22:11.565961Z", "iso8601_basic_short": "20210817T152211", "minute": "22", "day": "17", "weekday": "Tuesday", "iso8601": "2021-08-17T07:22:11Z", "tz_offset": "+08:00", "iso8601_basic": "20210817T152211565961", "epoch": "1629213731.57917", "weekday_number": "2", "hour": "15", "year": "2021", "month": "08", "weeknumber": "32"}, "ansible_user_sid": "S-1-5-21-3561869480-4110372908-2426507412-1051", "ansible_powershell_version": 5, "ansible_processor": ["GenuineIntel", "Intel(R) Xeon(R) CPU E5-2667 v4 @ 3.20GHz", "GenuineIntel", "Intel(R) Xeon(R) CPU E5-2667 v4 @ 3.20GHz", "GenuineIntel", "Intel(R) Xeon(R) CPU E5-2667 v4 @ 3.20GHz", "GenuineIntel", "Intel(R) Xeon(R) CPU E5-2667 v4 @ 3.20GHz", "GenuineIntel", "Intel(R) Xeon(R) CPU E5-2667 v4 @ 3.20GHz", "GenuineIntel", "Intel(R) Xeon(R) CPU E5-2667 v4 @ 3.20GHz", "GenuineIntel", "Intel(R) Xeon(R) CPU E5-2667 v4 @ 3.20GHz", "GenuineIntel", "Intel(R) Xeon(R) CPU E5-2667 v4 @ 3.20GHz", "GenuineIntel", "Intel(R) Xeon(R) CPU E5-2667 v4 @ 3.20GHz", "GenuineIntel", "Intel(R) Xeon(R) CPU E5-2667 v4 @ 3.20GHz", "GenuineIntel", "Intel(R) Xeon(R) CPU E5-2667 v4 @ 3.20GHz", "GenuineIntel", "Intel(R) Xeon(R) CPU E5-2667 v4 @ 3.20GHz", "GenuineIntel", "Intel(R) Xeon(R) CPU E5-2667 v4 @ 3.20GHz", "GenuineIntel", "Intel(R) Xeon(R) CPU E5-2667 v4 @ 3.20GHz", "GenuineIntel", "Intel(R) Xeon(R) CPU E5-2667 v4 @ 3.20GHz", "GenuineIntel", "Intel(R) Xeon(R) CPU E5-2667 v4 @ 3.20GHz"], "ansible_domain": "", "ansible_uptime_seconds": 12763416, "ansible_architecture": "64-bit", "ansible_win_rm_certificate_expires": "2024-08-15 21:30:38", "ansible_windows_domain_member": false, "ansible_swaptotal_mb": 0, "ansible_hostname": "SPOGSVR01", "ansible_os_family": "Windows", "ansible_virtualization_role": "NA", "ansible_user_gecos": "", "ansible_processor_count": 1, "ansible_os_product_type": "server", "ansible_user_dir": "C:\\\\Users\\\\pdmskul", "ansible_bios_version": "2.4.3", "ansible_virtualization_type": "NA", "ansible_lastboot": "2021-03-22 21:58:37Z", "ansible_distribution": "Microsoft Windows Server 2016 Standard", "ansible_bios_date": "01/17/2017", "ansible_processor_cores": 8, "ansible_product_name": "PowerEdge R730", "ansible_interfaces": [{"connection_name": "NIC1", "interface_name": "Broadcom NetXtreme Gigabit Ethernet #2", "macaddress": "80:18:44:E3:B1:FC", "default_gateway": "10.170.1.1", "interface_index": 9, "dns_domain": null}, {"connection_name": "NIC4", "interface_name": "Broadcom NetXtreme Gigabit Ethernet #4", "macaddress": "80:18:44:E3:B1:FF", "default_gateway": "10.15.253.254", "interface_index": 6, "dns_domain": null}, {"connection_name": "VMware Network Adapter VMnet1", "interface_name": "VMware Virtual Ethernet Adapter for VMnet1", "macaddress": "00:50:56:C0:00:01", "default_gateway": null, "interface_index": 24, "dns_domain": null}, {"connection_name": "VMware Network Adapter VMnet8", "interface_name": "VMware Virtual Ethernet Adapter for VMnet8", "macaddress": "00:50:56:C0:00:08", "default_gateway": null, "interface_index": 26, "dns_domain": null}, {"connection_name": "VirtualBox Host-Only Network", "interface_name": "VirtualBox Host-Only Ethernet Adapter", "macaddress": "0A:00:27:00:00:1C", "default_gateway": null, "interface_index": 28, "dns_domain": null}], "ansible_processor_threads_per_core": 2, "ansible_memtotal_mb": 32673, "ansible_processor_vcpus": 16, "module_setup": true, "ansible_nodename": "SPOGSVR01", "ansible_fqdn": "SPOGSVR01", "gather_subset": ["all"], "ansible_kernel": "10.0.14393.0", "ansible_windows_domain": "WORKGROUP", "ansible_reboot_pending": null, "ansible_system": "Win32NT", "ansible_owner_name": "Windows User"}, "warnings": [], "deprecations": [], "_ansible_verbose_override": true, "_ansible_no_log": false, "changed": false}, "start": "2021-08-17T07:22:09.858015", "end": "2021-08-17T07:22:14.846452", "duration": 4.988437, "event_loop": null, "uuid": "a0c4fd4c-8945-4181-b2d4-6b8bb9956572"}	f	f	10.170.1.104	all		Gathering Facts	6	\N	25	a0c4fd4c-8945-4181-b2d4-6b8bb9956572	0242ac12-0005-cca6-3f46-00000000000c	6	win-copy.yml	5	[0;32mok: [10.170.1.104][0m	0
127	2021-08-17 07:22:14.863689+00	2021-08-17 07:22:14.865971+00	runner_on_start	{"playbook": "win-copy.yml", "playbook_uuid": "f75f10d6-befd-4e1c-b1c0-ec1d974b2550", "play": "all", "play_uuid": "0242ac12-0005-cca6-3f46-000000000006", "play_pattern": "all", "task": "Copy File", "task_uuid": "0242ac12-0005-cca6-3f46-000000000008", "task_action": "win_copy", "task_args": "", "task_path": "/tmp/bwrap_25_wdbktjim/awx_25_hjb6fgsm/project/win-copy.yml:4", "host": "10.170.1.104", "uuid": "7a2769e9-24ca-4cab-98e0-8fb9fc475c93"}	f	f	10.170.1.104	all		Copy File	8	\N	25	7a2769e9-24ca-4cab-98e0-8fb9fc475c93	0242ac12-0005-cca6-3f46-000000000008	8	win-copy.yml	8		0
130	2021-08-17 07:22:15.98496+00	2021-08-17 07:22:17.036308+00	runner_on_ok	{"playbook": "win-copy.yml", "playbook_uuid": "f75f10d6-befd-4e1c-b1c0-ec1d974b2550", "play": "all", "play_uuid": "0242ac12-0005-cca6-3f46-000000000006", "play_pattern": "all", "task": "Copy File", "task_uuid": "0242ac12-0005-cca6-3f46-000000000008", "task_action": "win_copy", "task_args": "", "task_path": "/tmp/bwrap_25_wdbktjim/awx_25_hjb6fgsm/project/win-copy.yml:4", "host": "10.170.1.104", "remote_addr": "10.170.1.104", "res": {"src": "C:\\\\output.pdf", "dest": "C:\\\\test\\\\output.pdf", "checksum": "0ef6ea65b6b4e77f4c3e02b9c50da79293e02be2", "size": 8695276, "original_basename": "output.pdf", "changed": true, "operation": "file_copy", "_ansible_no_log": false}, "start": "2021-08-17T07:22:14.863583", "end": "2021-08-17T07:22:15.984723", "duration": 1.12114, "event_loop": null, "uuid": "a2f22aac-d3f8-43f8-ac05-7a72a025bbb3"}	f	t	10.170.1.104	all		Copy File	9	\N	25	a2f22aac-d3f8-43f8-ac05-7a72a025bbb3	0242ac12-0005-cca6-3f46-000000000008	9	win-copy.yml	8	[0;33mchanged: [10.170.1.104][0m	0
\.


--
-- Data for Name: main_jobhostsummary; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_jobhostsummary (id, created, modified, host_name, changed, dark, failures, ok, processed, skipped, failed, host_id, job_id, ignored, rescued) FROM stdin;
5	2021-08-17 07:20:46.118788+00	2021-08-17 07:20:46.118799+00	10.170.1.104	0	1	0	0	1	0	t	\N	24	0	0
6	2021-08-17 07:22:15.999824+00	2021-08-17 07:22:15.999837+00	10.170.1.104	1	0	0	2	1	0	f	\N	25	0	0
\.


--
-- Data for Name: main_joblaunchconfig; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_joblaunchconfig (id, extra_data, survey_passwords, char_prompts, inventory_id, job_id) FROM stdin;
1	{}	{}	{}	\N	1
15	{}	{}	{}	\N	15
16	{}	{}	{}	\N	16
17	{}	{}	{}	\N	17
18	{}	{}	{}	\N	18
19	{}	{}	{}	\N	19
20	{}	{}	{}	\N	20
21	{}	{}	{}	\N	21
22	{}	{}	{}	\N	22
23	{}	{}	{}	\N	23
24	{}	{}	{}	\N	24
25	{}	{}	{}	\N	25
26	{"days": "120"}	{}	{}	\N	26
27	{"days": "355"}	{}	{}	\N	27
\.


--
-- Data for Name: main_joblaunchconfig_credentials; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_joblaunchconfig_credentials (id, joblaunchconfig_id, credential_id) FROM stdin;
\.


--
-- Data for Name: main_jobtemplate; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_jobtemplate (unifiedjobtemplate_ptr_id, job_type, playbook, forks, "limit", verbosity, extra_vars, job_tags, force_handlers, skip_tags, start_at_task, become_enabled, host_config_key, ask_variables_on_launch, survey_enabled, survey_spec, inventory_id, project_id, admin_role_id, execute_role_id, read_role_id, ask_limit_on_launch, ask_inventory_on_launch, ask_credential_on_launch, ask_job_type_on_launch, ask_tags_on_launch, allow_simultaneous, ask_skip_tags_on_launch, timeout, use_fact_cache, ask_verbosity_on_launch, ask_diff_mode_on_launch, diff_mode, custom_virtualenv, job_slice_count, ask_scm_branch_on_launch, scm_branch, webhook_credential_id, webhook_key, webhook_service) FROM stdin;
7	run	hello_world.yml	0		0	---		f			f		f	f	{}	1	6	30	31	32	f	f	f	f	f	f	f	0	f	f	f	f	\N	1	f		\N		
\.


--
-- Data for Name: main_label; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_label (id, created, modified, description, name, created_by_id, modified_by_id, organization_id) FROM stdin;
\.


--
-- Data for Name: main_notification; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_notification (id, created, modified, status, error, notifications_sent, notification_type, recipients, subject, body, notification_template_id) FROM stdin;
\.


--
-- Data for Name: main_notificationtemplate; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_notificationtemplate (id, created, modified, description, name, notification_type, notification_configuration, created_by_id, modified_by_id, organization_id, messages) FROM stdin;
\.


--
-- Data for Name: main_oauth2accesstoken; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_oauth2accesstoken (id, token, expires, scope, created, updated, description, last_used, application_id, user_id, source_refresh_token_id, modified) FROM stdin;
\.


--
-- Data for Name: main_oauth2application; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_oauth2application (id, client_id, redirect_uris, client_type, authorization_grant_type, client_secret, name, skip_authorization, created, updated, description, logo_data, user_id, organization_id) FROM stdin;
\.


--
-- Data for Name: main_organization; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_organization (id, created, modified, description, name, created_by_id, modified_by_id, admin_role_id, auditor_role_id, member_role_id, read_role_id, custom_virtualenv, execute_role_id, job_template_admin_role_id, credential_admin_role_id, inventory_admin_role_id, project_admin_role_id, workflow_admin_role_id, notification_admin_role_id, max_hosts, approval_role_id) FROM stdin;
1	2021-08-14 13:00:53.934215+00	2021-08-14 13:00:53.934239+00		Default	1	1	2	10	11	12	\N	3	9	6	5	4	7	8	0	13
\.


--
-- Data for Name: main_organization_notification_templates_approvals; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_organization_notification_templates_approvals (id, organization_id, notificationtemplate_id) FROM stdin;
\.


--
-- Data for Name: main_organization_notification_templates_error; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_organization_notification_templates_error (id, organization_id, notificationtemplate_id) FROM stdin;
\.


--
-- Data for Name: main_organization_notification_templates_started; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_organization_notification_templates_started (id, organization_id, notificationtemplate_id) FROM stdin;
\.


--
-- Data for Name: main_organization_notification_templates_success; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_organization_notification_templates_success (id, organization_id, notificationtemplate_id) FROM stdin;
\.


--
-- Data for Name: main_organizationgalaxycredentialmembership; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_organizationgalaxycredentialmembership (id, "position", credential_id, organization_id) FROM stdin;
1	0	2	1
\.


--
-- Data for Name: main_organizationinstancegroupmembership; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_organizationinstancegroupmembership (id, "position", instancegroup_id, organization_id) FROM stdin;
\.


--
-- Data for Name: main_profile; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_profile (id, created, modified, ldap_dn, user_id) FROM stdin;
1	2021-08-14 13:04:30.857737+00	2021-08-14 13:04:30.857763+00		1
\.


--
-- Data for Name: main_project; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_project (unifiedjobtemplate_ptr_id, local_path, scm_type, scm_url, scm_branch, scm_clean, scm_delete_on_update, scm_update_on_launch, scm_update_cache_timeout, credential_id, admin_role_id, use_role_id, update_role_id, read_role_id, timeout, scm_revision, playbook_files, inventory_files, custom_virtualenv, scm_refspec, allow_override) FROM stdin;
8	_8__createfile	git	https://github.com/rmspavan/AnsibleTower.git		f	f	f	0	4	44	45	46	47	0	355d65af0d6cc43865251aea89a57e5c3ae0b282	["01pingServers.yml", "01pingServersWithFacts.yml", "02createFile.yml", "03installHTTPServer.yml", "04installHTTPServerandStart.yml", "05installHTTPServerWithHandlers.yml", "06command.yml", "06copy.yml", "07loops1.yml", "07loops2.yml", "ansible-createuser-withpassword.yml", "ansible-createuser.yml", "deploy-docker.yml", "gitclone.yml", "HTTPServerWithHandlers.yml", "installHttpdWithCopyTemplate.yml", "installJenkins.yml", "installPackagesUsingVars.yaml", "installTomat.yml", "loops.yml", "loops1.yml", "loops2.yml", "tags.yaml", "uninstallJenkins.yml", "when.yaml", "win-copy.yml", "winserver.yml"]	["Ansibletower"]	\N		f
6	_6__demo_project	git	https://github.com/ansible/ansible-tower-samples		f	f	t	0	\N	15	16	17	18	0	347e44fea036c94d5f60e544de006453ee5c71ad	["hello_world.yml"]	[]	\N		f
13	_13__winserver	git	https://github.com/rmspavan/AnsibleTower.git		f	f	f	0	4	69	70	71	72	0	f34509208c70e4ccedbd54480abf68b01f9d221b	["01pingServers.yml", "01pingServersWithFacts.yml", "02createFile.yml", "03installHTTPServer.yml", "04installHTTPServerandStart.yml", "05installHTTPServerWithHandlers.yml", "06command.yml", "06copy.yml", "07loops1.yml", "07loops2.yml", "ansible-createuser-withpassword.yml", "ansible-createuser.yml", "deploy-docker.yml", "gitclone.yml", "HTTPServerWithHandlers.yml", "installHttpdWithCopyTemplate.yml", "installJenkins.yml", "installPackagesUsingVars.yaml", "installTomat.yml", "loops.yml", "loops1.yml", "loops2.yml", "tags.yaml", "uninstallJenkins.yml", "when.yaml", "win-copy.yml", "winserver.yml"]	["Ansibletower"]	\N		f
\.


--
-- Data for Name: main_projectupdate; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_projectupdate (unifiedjob_ptr_id, local_path, scm_type, scm_url, scm_branch, scm_clean, scm_delete_on_update, credential_id, project_id, timeout, job_type, scm_refspec, scm_revision, job_tags) FROM stdin;
1	_6__demo_project	git	https://github.com/ansible/ansible-tower-samples		f	f	\N	6	0	check		347e44fea036c94d5f60e544de006453ee5c71ad	update_git,install_roles,install_collections
15	_13__winserver	git	https://github.com/rmspavan/AnsibleTower.git		f	f	4	13	0	check		355d65af0d6cc43865251aea89a57e5c3ae0b282	update_git,install_roles,install_collections
16	_13__winserver	git	https://github.com/rmspavan/AnsibleTower.git		f	f	4	13	0	check		355d65af0d6cc43865251aea89a57e5c3ae0b282	update_git,install_roles,install_collections
17	_13__winserver	git	https://github.com/rmspavan/AnsibleTower.git		f	f	4	13	0	check		355d65af0d6cc43865251aea89a57e5c3ae0b282	update_git,install_roles,install_collections
18	_8__createfile	git	https://github.com/rmspavan/AnsibleTower.git		f	f	4	8	0	check		355d65af0d6cc43865251aea89a57e5c3ae0b282	update_git,install_roles,install_collections
19	_6__demo_project	git	https://github.com/ansible/ansible-tower-samples		f	f	\N	6	0	check		347e44fea036c94d5f60e544de006453ee5c71ad	update_git,install_roles,install_collections
21	_13__winserver	git	https://github.com/rmspavan/AnsibleTower.git		f	f	4	13	0	check		f34509208c70e4ccedbd54480abf68b01f9d221b	update_git,install_roles,install_collections
23	_13__winserver	git	https://github.com/rmspavan/AnsibleTower.git		f	f	4	13	0	check		f34509208c70e4ccedbd54480abf68b01f9d221b	update_git,install_roles,install_collections
\.


--
-- Data for Name: main_projectupdateevent; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_projectupdateevent (id, created, modified, event, event_data, failed, changed, uuid, playbook, play, role, task, counter, stdout, verbosity, start_line, end_line, project_update_id) FROM stdin;
1	2021-08-17 04:44:39.626071+00	2021-08-17 04:44:39.630581+00	playbook_on_start	{"playbook": "project_update.yml", "playbook_uuid": "b5beb502-8c90-4efb-9ffc-557935a5835d", "uuid": "b5beb502-8c90-4efb-9ffc-557935a5835d"}	f	f	b5beb502-8c90-4efb-9ffc-557935a5835d	project_update.yml				1		0	0	0	1
199	2021-08-17 07:15:50.339734+00	2021-08-17 07:15:50.342911+00	playbook_on_start	{"playbook": "project_update.yml", "playbook_uuid": "e098ff2c-0cc7-4fa4-ac6b-c3749ed06769", "uuid": "e098ff2c-0cc7-4fa4-ac6b-c3749ed06769"}	f	f	e098ff2c-0cc7-4fa4-ac6b-c3749ed06769	project_update.yml				1		0	0	0	15
221	2021-08-17 07:15:54.379394+00	2021-08-17 07:15:54.386233+00	runner_item_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "e098ff2c-0cc7-4fa4-ac6b-c3749ed06769", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-d907-6799-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-d907-6799-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_15_ewsgoefo/awx_15_8r8m9hjb/project/project_update.yml:168", "host": "localhost", "res": {"changed": false, "skip_reason": "Conditional result was False", "_ansible_no_log": false, "item": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item"}, "ansible_loop_var": "item", "_ansible_item_label": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item"}}, "uuid": "7e1564f0-0dc4-4673-be7b-4f1193893ba5"}	f	f	7e1564f0-0dc4-4673-be7b-4f1193893ba5	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	21	[0;36mskipping: [localhost] => (item={'changed': False, 'stat': {'exists': False}, 'invocation': {'module_args': {'path': '/var/lib/awx/projects/_13__winserver/roles/requirements.yaml', 'follow': False, 'get_md5': False, 'get_checksum': True, 'get_mime': True, 'get_attributes': True, 'checksum_algorithm': 'sha1'}}, 'failed': False, 'item': {'ext': '.yaml'}, 'ansible_loop_var': 'item'}) [0m	0	22	23	15
244	2021-08-17 07:15:58.340439+00	2021-08-17 07:15:58.34444+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "b015f3c4-357b-4a03-970a-86ca8efae653", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-b443-2c62-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-b443-2c62-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_16_xquwi25g/awx_16_yv8gg_96/project/project_update.yml:162", "host": "localhost", "uuid": "61294418-fe9b-429f-8f6a-3f01686c1d63"}	f	f	61294418-fe9b-429f-8f6a-3f01686c1d63	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	14		0	17	17	16
267	2021-08-17 07:16:01.407844+00	2021-08-17 07:16:01.410708+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "7a91cb39-1634-4325-9545-e05a1718df76", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-c9e0-8ff4-000000000006", "play_pattern": "localhost", "task": "update project using git", "task_uuid": "0242ac12-0005-c9e0-8ff4-00000000000a", "task_action": "git", "task_args": "", "task_path": "/tmp/bwrap_17_cnh8436b/awx_17_njz3midn/project/project_update.yml:34", "name": "update project using git", "is_conditional": false, "uuid": "0242ac12-0005-c9e0-8ff4-00000000000a"}	f	f	0242ac12-0005-c9e0-8ff4-00000000000a	project_update.yml	Update source tree if necessary		update project using git	3	\r\nTASK [update project using git] ************************************************	0	2	4	17
290	2021-08-17 07:16:04.709318+00	2021-08-17 07:16:04.712006+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "7a91cb39-1634-4325-9545-e05a1718df76", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-c9e0-8ff4-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-c9e0-8ff4-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_17_cnh8436b/awx_17_njz3midn/project/project_update.yml:188", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"results": [{"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yml"}}, {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yaml"}}], "msg": "All items completed", "changed": false}, "start": "2021-08-17T07:16:04.165937", "end": "2021-08-17T07:16:04.709221", "duration": 0.543284, "event_loop": "items", "uuid": "0ce37190-09cc-4cf2-af0c-bdbed1d6af2a"}	f	f	0ce37190-09cc-4cf2-af0c-bdbed1d6af2a	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	27		0	27	27	17
310	2021-08-17 07:16:09.84767+00	2021-08-17 07:16:09.850436+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "9423ec19-3f36-4b3c-9c49-1a4429dcbbd0", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-4b9d-ad82-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-4b9d-ad82-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_18_o_rdcv1n/awx_18_mry1qamd/project/project_update.yml:162", "host": "localhost", "uuid": "970907fc-2e9c-4b6f-81f6-b03048d80474"}	f	f	970907fc-2e9c-4b6f-81f6-b03048d80474	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	14		0	17	17	18
324	2021-08-17 07:16:11.244994+00	2021-08-17 07:16:11.248331+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "9423ec19-3f36-4b3c-9c49-1a4429dcbbd0", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-4b9d-ad82-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-4b9d-ad82-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_18_o_rdcv1n/awx_18_mry1qamd/project/project_update.yml:188", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"results": [{"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_8__createfile/collections/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yml"}}, {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_8__createfile/collections/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yaml"}}], "msg": "All items completed", "changed": false}, "start": "2021-08-17T07:16:10.704479", "end": "2021-08-17T07:16:11.244871", "duration": 0.540392, "event_loop": "items", "uuid": "65608818-3bd0-4653-b8aa-7ea526b839b5"}	f	f	65608818-3bd0-4653-b8aa-7ea526b839b5	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	27		0	27	27	18
3	2021-08-17 04:44:39.639019+00	2021-08-17 04:44:39.645844+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "b5beb502-8c90-4efb-9ffc-557935a5835d", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-925e-954a-000000000006", "play_pattern": "localhost", "task": "update project using git", "task_uuid": "0242ac12-0005-925e-954a-00000000000a", "task_action": "git", "task_args": "", "task_path": "/tmp/bwrap_1_nbx_idbg/awx_1_yb8lwdax/project/project_update.yml:34", "name": "update project using git", "is_conditional": false, "uuid": "0242ac12-0005-925e-954a-00000000000a"}	f	f	0242ac12-0005-925e-954a-00000000000a	project_update.yml	Update source tree if necessary		update project using git	3	\r\nTASK [update project using git] ************************************************	0	2	4	1
23	2021-08-17 04:44:43.174247+00	2021-08-17 04:44:43.177346+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "b5beb502-8c90-4efb-9ffc-557935a5835d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-925e-954a-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-925e-954a-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_1_nbx_idbg/awx_1_yb8lwdax/project/project_update.yml:188", "name": "detect collections/requirements.(yml/yaml)", "is_conditional": false, "uuid": "0242ac12-0005-925e-954a-000000000022"}	f	f	0242ac12-0005-925e-954a-000000000022	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	23	\r\nTASK [detect collections/requirements.(yml/yaml)] ******************************	0	23	25	1
200	2021-08-17 07:15:50.343231+00	2021-08-17 07:15:50.345062+00	playbook_on_play_start	{"playbook": "project_update.yml", "playbook_uuid": "e098ff2c-0cc7-4fa4-ac6b-c3749ed06769", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-d907-6799-000000000006", "play_pattern": "localhost", "name": "Update source tree if necessary", "pattern": "localhost", "uuid": "0242ac12-0005-d907-6799-000000000006"}	f	f	0242ac12-0005-d907-6799-000000000006	project_update.yml	Update source tree if necessary			2	\r\nPLAY [Update source tree if necessary] *****************************************	0	0	2	15
222	2021-08-17 07:15:54.384644+00	2021-08-17 07:15:54.756844+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "e098ff2c-0cc7-4fa4-ac6b-c3749ed06769", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-d907-6799-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-d907-6799-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_15_ewsgoefo/awx_15_8r8m9hjb/project/project_update.yml:188", "host": "localhost", "uuid": "cb653684-0bac-4c83-bd4c-900e3b33f8fd"}	f	f	cb653684-0bac-4c83-bd4c-900e3b33f8fd	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	24		0	25	25	15
223	2021-08-17 07:15:54.755257+00	2021-08-17 07:15:54.756844+00	runner_item_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "e098ff2c-0cc7-4fa4-ac6b-c3749ed06769", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-d907-6799-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-d907-6799-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_15_ewsgoefo/awx_15_8r8m9hjb/project/project_update.yml:188", "host": "localhost", "res": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yml"}}, "uuid": "3485ae98-ac1a-4c97-9456-5dc080e97f78"}	f	f	3485ae98-ac1a-4c97-9456-5dc080e97f78	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	25	[0;32mok: [localhost] => (item={'ext': '.yml'})[0m	0	25	26	15
245	2021-08-17 07:15:58.339889+00	2021-08-17 07:15:58.344076+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "b015f3c4-357b-4a03-970a-86ca8efae653", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-b443-2c62-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-b443-2c62-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_16_xquwi25g/awx_16_yv8gg_96/project/project_update.yml:162", "name": "detect roles/requirements.(yml/yaml)", "is_conditional": false, "uuid": "0242ac12-0005-b443-2c62-00000000001f"}	f	f	0242ac12-0005-b443-2c62-00000000001f	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	13	\r\nTASK [detect roles/requirements.(yml/yaml)] ************************************	0	15	17	16
268	2021-08-17 07:16:01.40854+00	2021-08-17 07:16:01.4136+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "7a91cb39-1634-4325-9545-e05a1718df76", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-c9e0-8ff4-000000000006", "play_pattern": "localhost", "task": "update project using git", "task_uuid": "0242ac12-0005-c9e0-8ff4-00000000000a", "task_action": "git", "task_args": "", "task_path": "/tmp/bwrap_17_cnh8436b/awx_17_njz3midn/project/project_update.yml:34", "host": "localhost", "uuid": "ab308f5f-07ed-4481-9aa0-382e5f999c38"}	f	f	ab308f5f-07ed-4481-9aa0-382e5f999c38	project_update.yml	Update source tree if necessary		update project using git	4		0	4	4	17
291	2021-08-17 07:16:04.708409+00	2021-08-17 07:16:04.710351+00	runner_item_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "7a91cb39-1634-4325-9545-e05a1718df76", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-c9e0-8ff4-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-c9e0-8ff4-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_17_cnh8436b/awx_17_njz3midn/project/project_update.yml:188", "host": "localhost", "res": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yaml"}}, "uuid": "f1c76f5b-99be-4ff1-b4d8-3fcd42b78ae9"}	f	f	f1c76f5b-99be-4ff1-b4d8-3fcd42b78ae9	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	26	[0;32mok: [localhost] => (item={'ext': '.yaml'})[0m	0	26	27	17
340	2021-08-17 07:16:14.099742+00	2021-08-17 07:16:14.103391+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "48221bd1-55e7-40c7-9019-5e5e9e53acd3", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-8926-da79-000000000006", "play_pattern": "localhost", "task": "Repository Version", "task_uuid": "0242ac12-0005-8926-da79-00000000001c", "task_action": "debug", "task_args": "", "task_path": "/tmp/bwrap_19_qa3qu_ri/awx_19_d93vso43/project/project_update.yml:142", "host": "localhost", "uuid": "13885434-28cf-406d-9fae-6c4157e8857d"}	f	f	13885434-28cf-406d-9fae-6c4157e8857d	project_update.yml	Update source tree if necessary		Repository Version	10		0	10	10	19
4	2021-08-17 04:44:39.639773+00	2021-08-17 04:44:39.648116+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "b5beb502-8c90-4efb-9ffc-557935a5835d", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-925e-954a-000000000006", "play_pattern": "localhost", "task": "update project using git", "task_uuid": "0242ac12-0005-925e-954a-00000000000a", "task_action": "git", "task_args": "", "task_path": "/tmp/bwrap_1_nbx_idbg/awx_1_yb8lwdax/project/project_update.yml:34", "host": "localhost", "uuid": "474883ab-8b06-44ac-9fe7-4b1bf6fcd345"}	f	f	474883ab-8b06-44ac-9fe7-4b1bf6fcd345	project_update.yml	Update source tree if necessary		update project using git	4		0	4	4	1
24	2021-08-17 04:44:43.17483+00	2021-08-17 04:44:43.549532+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "b5beb502-8c90-4efb-9ffc-557935a5835d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-925e-954a-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-925e-954a-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_1_nbx_idbg/awx_1_yb8lwdax/project/project_update.yml:188", "host": "localhost", "uuid": "1efa1f26-5e9e-4377-bae2-75e15a49627e"}	f	f	1efa1f26-5e9e-4377-bae2-75e15a49627e	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	24		0	25	25	1
25	2021-08-17 04:44:43.546671+00	2021-08-17 04:44:43.549532+00	runner_item_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "b5beb502-8c90-4efb-9ffc-557935a5835d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-925e-954a-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-925e-954a-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_1_nbx_idbg/awx_1_yb8lwdax/project/project_update.yml:188", "host": "localhost", "res": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_6__demo_project/collections/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yml"}}, "uuid": "8b5fe559-2faa-4711-b79c-d894e40f7aca"}	f	f	8b5fe559-2faa-4711-b79c-d894e40f7aca	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	25	[0;32mok: [localhost] => (item={'ext': '.yml'})[0m	0	25	26	1
201	2021-08-17 07:15:50.354172+00	2021-08-17 07:15:50.358804+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "e098ff2c-0cc7-4fa4-ac6b-c3749ed06769", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-d907-6799-000000000006", "play_pattern": "localhost", "task": "update project using git", "task_uuid": "0242ac12-0005-d907-6799-00000000000a", "task_action": "git", "task_args": "", "task_path": "/tmp/bwrap_15_ewsgoefo/awx_15_8r8m9hjb/project/project_update.yml:34", "name": "update project using git", "is_conditional": false, "uuid": "0242ac12-0005-d907-6799-00000000000a"}	f	f	0242ac12-0005-d907-6799-00000000000a	project_update.yml	Update source tree if necessary		update project using git	3	\r\nTASK [update project using git] ************************************************	0	2	4	15
224	2021-08-17 07:15:54.924136+00	2021-08-17 07:15:54.928084+00	runner_item_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "e098ff2c-0cc7-4fa4-ac6b-c3749ed06769", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-d907-6799-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-d907-6799-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_15_ewsgoefo/awx_15_8r8m9hjb/project/project_update.yml:188", "host": "localhost", "res": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yaml"}}, "uuid": "2f398828-f835-4ee3-9ed2-5d60c7071d7c"}	f	f	2f398828-f835-4ee3-9ed2-5d60c7071d7c	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	26	[0;32mok: [localhost] => (item={'ext': '.yaml'})[0m	0	26	27	15
246	2021-08-17 07:15:58.809606+00	2021-08-17 07:15:58.811211+00	runner_item_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "b015f3c4-357b-4a03-970a-86ca8efae653", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-b443-2c62-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-b443-2c62-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_16_xquwi25g/awx_16_yv8gg_96/project/project_update.yml:162", "host": "localhost", "res": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yml"}}, "uuid": "b31223dd-35e8-4538-9e3d-a83f1ad114eb"}	f	f	b31223dd-35e8-4538-9e3d-a83f1ad114eb	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	15	[0;32mok: [localhost] => (item={'ext': '.yml'})[0m	0	17	18	16
269	2021-08-17 07:16:02.911343+00	2021-08-17 07:16:02.915319+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "7a91cb39-1634-4325-9545-e05a1718df76", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-c9e0-8ff4-000000000006", "play_pattern": "localhost", "task": "update project using git", "task_uuid": "0242ac12-0005-c9e0-8ff4-00000000000a", "task_action": "git", "task_args": "", "task_path": "/tmp/bwrap_17_cnh8436b/awx_17_njz3midn/project/project_update.yml:34", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"changed": false, "before": "355d65af0d6cc43865251aea89a57e5c3ae0b282", "remote_url_changed": false, "after": "355d65af0d6cc43865251aea89a57e5c3ae0b282", "invocation": {"module_args": {"dest": "/var/lib/awx/projects/_13__winserver", "repo": "https://$encrypted$:$encrypted$@github.com/rmspavan/AnsibleTower.git", "version": "HEAD", "force": false, "remote": "origin", "clone": true, "update": true, "verify_commit": false, "gpg_whitelist": [], "accept_hostkey": false, "bare": false, "recursive": true, "track_submodules": false, "refspec": null, "reference": null, "depth": null, "key_file": null, "ssh_opts": null, "executable": null, "umask": null, "archive": null, "separate_git_dir": null}}, "_ansible_no_log": false}, "start": "2021-08-17T07:16:01.408465", "end": "2021-08-17T07:16:02.911002", "duration": 1.502537, "event_loop": null, "uuid": "551fa22e-54d9-4d2f-99b9-c899cdd35387"}	f	f	551fa22e-54d9-4d2f-99b9-c899cdd35387	project_update.yml	Update source tree if necessary		update project using git	5	[0;32mok: [localhost][0m	0	4	5	17
364	2021-08-17 07:19:29.31483+00	2021-08-17 07:19:29.3182+00	playbook_on_start	{"playbook": "project_update.yml", "playbook_uuid": "da241f84-0a6a-4d4d-8f34-9e6b6aad725d", "uuid": "da241f84-0a6a-4d4d-8f34-9e6b6aad725d"}	f	f	da241f84-0a6a-4d4d-8f34-9e6b6aad725d	project_update.yml				1		0	0	0	21
5	2021-08-17 04:44:41.830085+00	2021-08-17 04:44:41.831845+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "b5beb502-8c90-4efb-9ffc-557935a5835d", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-925e-954a-000000000006", "play_pattern": "localhost", "task": "Set the git repository version", "task_uuid": "0242ac12-0005-925e-954a-00000000000b", "task_action": "set_fact", "task_args": "", "task_path": "/tmp/bwrap_1_nbx_idbg/awx_1_yb8lwdax/project/project_update.yml:44", "name": "Set the git repository version", "is_conditional": false, "uuid": "0242ac12-0005-925e-954a-00000000000b"}	f	f	0242ac12-0005-925e-954a-00000000000b	project_update.yml	Update source tree if necessary		Set the git repository version	6	\r\nTASK [Set the git repository version] ******************************************	0	5	7	1
26	2021-08-17 04:44:43.717021+00	2021-08-17 04:44:43.719479+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "b5beb502-8c90-4efb-9ffc-557935a5835d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-925e-954a-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-925e-954a-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_1_nbx_idbg/awx_1_yb8lwdax/project/project_update.yml:188", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"results": [{"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_6__demo_project/collections/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yml"}}, {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_6__demo_project/collections/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yaml"}}], "msg": "All items completed", "changed": false}, "start": "2021-08-17T04:44:43.174755", "end": "2021-08-17T04:44:43.716925", "duration": 0.54217, "event_loop": "items", "uuid": "9f02b24a-98b3-4d8b-bb34-f683e8512e55"}	f	f	9f02b24a-98b3-4d8b-bb34-f683e8512e55	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	27		0	27	27	1
202	2021-08-17 07:15:50.354887+00	2021-08-17 07:15:51.439509+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "e098ff2c-0cc7-4fa4-ac6b-c3749ed06769", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-d907-6799-000000000006", "play_pattern": "localhost", "task": "update project using git", "task_uuid": "0242ac12-0005-d907-6799-00000000000a", "task_action": "git", "task_args": "", "task_path": "/tmp/bwrap_15_ewsgoefo/awx_15_8r8m9hjb/project/project_update.yml:34", "host": "localhost", "uuid": "7e0f04ce-4bdc-41e8-996e-1519a7aa3acb"}	f	f	7e0f04ce-4bdc-41e8-996e-1519a7aa3acb	project_update.yml	Update source tree if necessary		update project using git	4		0	4	4	15
225	2021-08-17 07:15:54.925023+00	2021-08-17 07:15:54.927062+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "e098ff2c-0cc7-4fa4-ac6b-c3749ed06769", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-d907-6799-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-d907-6799-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_15_ewsgoefo/awx_15_8r8m9hjb/project/project_update.yml:188", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"results": [{"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yml"}}, {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yaml"}}], "msg": "All items completed", "changed": false}, "start": "2021-08-17T07:15:54.384568", "end": "2021-08-17T07:15:54.924927", "duration": 0.540359, "event_loop": "items", "uuid": "36b521ce-f62e-43bb-bc45-ee30ae3a1d2a"}	f	f	36b521ce-f62e-43bb-bc45-ee30ae3a1d2a	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	27		0	27	27	15
247	2021-08-17 07:15:58.975709+00	2021-08-17 07:15:58.977614+00	runner_item_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "b015f3c4-357b-4a03-970a-86ca8efae653", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-b443-2c62-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-b443-2c62-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_16_xquwi25g/awx_16_yv8gg_96/project/project_update.yml:162", "host": "localhost", "res": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yaml"}}, "uuid": "46bbd342-dfed-458c-a97e-deb6a810a8d6"}	f	f	46bbd342-dfed-458c-a97e-deb6a810a8d6	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	16	[0;32mok: [localhost] => (item={'ext': '.yaml'})[0m	0	18	19	16
270	2021-08-17 07:16:02.916951+00	2021-08-17 07:16:02.920524+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "7a91cb39-1634-4325-9545-e05a1718df76", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-c9e0-8ff4-000000000006", "play_pattern": "localhost", "task": "Set the git repository version", "task_uuid": "0242ac12-0005-c9e0-8ff4-00000000000b", "task_action": "set_fact", "task_args": "", "task_path": "/tmp/bwrap_17_cnh8436b/awx_17_njz3midn/project/project_update.yml:44", "name": "Set the git repository version", "is_conditional": false, "uuid": "0242ac12-0005-c9e0-8ff4-00000000000b"}	f	f	0242ac12-0005-c9e0-8ff4-00000000000b	project_update.yml	Update source tree if necessary		Set the git repository version	6	\r\nTASK [Set the git repository version] ******************************************	0	5	7	17
342	2021-08-17 07:16:14.27185+00	2021-08-17 07:16:14.27392+00	playbook_on_play_start	{"playbook": "project_update.yml", "playbook_uuid": "48221bd1-55e7-40c7-9019-5e5e9e53acd3", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-8926-da79-00000000001d", "play_pattern": "localhost", "name": "Install content with ansible-galaxy command if necessary", "pattern": "localhost", "uuid": "0242ac12-0005-8926-da79-00000000001d"}	f	f	0242ac12-0005-8926-da79-00000000001d	project_update.yml	Install content with ansible-galaxy command if necessary			12	\r\nPLAY [Install content with ansible-galaxy command if necessary] ****************	0	13	15	19
6	2021-08-17 04:44:41.830845+00	2021-08-17 04:44:41.833675+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "b5beb502-8c90-4efb-9ffc-557935a5835d", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-925e-954a-000000000006", "play_pattern": "localhost", "task": "Set the git repository version", "task_uuid": "0242ac12-0005-925e-954a-00000000000b", "task_action": "set_fact", "task_args": "", "task_path": "/tmp/bwrap_1_nbx_idbg/awx_1_yb8lwdax/project/project_update.yml:44", "host": "localhost", "uuid": "b8aaaf43-0b45-4f74-9775-56e8ad906dff"}	f	f	b8aaaf43-0b45-4f74-9775-56e8ad906dff	project_update.yml	Update source tree if necessary		Set the git repository version	7		0	7	7	1
27	2021-08-17 04:44:43.71612+00	2021-08-17 04:44:43.718459+00	runner_item_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "b5beb502-8c90-4efb-9ffc-557935a5835d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-925e-954a-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-925e-954a-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_1_nbx_idbg/awx_1_yb8lwdax/project/project_update.yml:188", "host": "localhost", "res": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_6__demo_project/collections/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yaml"}}, "uuid": "ddba88fd-541e-4db5-be1d-be4700b6383a"}	f	f	ddba88fd-541e-4db5-be1d-be4700b6383a	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	26	[0;32mok: [localhost] => (item={'ext': '.yaml'})[0m	0	26	27	1
203	2021-08-17 07:15:53.11808+00	2021-08-17 07:15:53.12262+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "e098ff2c-0cc7-4fa4-ac6b-c3749ed06769", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-d907-6799-000000000006", "play_pattern": "localhost", "task": "update project using git", "task_uuid": "0242ac12-0005-d907-6799-00000000000a", "task_action": "git", "task_args": "", "task_path": "/tmp/bwrap_15_ewsgoefo/awx_15_8r8m9hjb/project/project_update.yml:34", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"changed": true, "before": null, "after": "355d65af0d6cc43865251aea89a57e5c3ae0b282", "invocation": {"module_args": {"dest": "/var/lib/awx/projects/_13__winserver", "repo": "https://$encrypted$:$encrypted$@github.com/rmspavan/AnsibleTower.git", "version": "HEAD", "force": false, "remote": "origin", "clone": true, "update": true, "verify_commit": false, "gpg_whitelist": [], "accept_hostkey": false, "bare": false, "recursive": true, "track_submodules": false, "refspec": null, "reference": null, "depth": null, "key_file": null, "ssh_opts": null, "executable": null, "umask": null, "archive": null, "separate_git_dir": null}}, "_ansible_no_log": false}, "start": "2021-08-17T07:15:50.354811", "end": "2021-08-17T07:15:53.117896", "duration": 2.763085, "event_loop": null, "uuid": "a80ad1f8-167b-4ad7-86e4-37b4008ec00f"}	f	t	a80ad1f8-167b-4ad7-86e4-37b4008ec00f	project_update.yml	Update source tree if necessary		update project using git	5	[0;33mchanged: [localhost][0m	0	4	5	15
226	2021-08-17 07:15:54.928982+00	2021-08-17 07:15:54.932241+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "e098ff2c-0cc7-4fa4-ac6b-c3749ed06769", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-d907-6799-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-d907-6799-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_15_ewsgoefo/awx_15_8r8m9hjb/project/project_update.yml:194", "host": "localhost", "uuid": "1ba2c43f-3c30-4a5b-bc31-0b739c9b5dc0"}	f	f	1ba2c43f-3c30-4a5b-bc31-0b739c9b5dc0	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	29		0	29	29	15
248	2021-08-17 07:15:58.976623+00	2021-08-17 07:15:58.979323+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "b015f3c4-357b-4a03-970a-86ca8efae653", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-b443-2c62-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-b443-2c62-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_16_xquwi25g/awx_16_yv8gg_96/project/project_update.yml:162", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"results": [{"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yml"}}, {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yaml"}}], "msg": "All items completed", "changed": false}, "start": "2021-08-17T07:15:58.340365", "end": "2021-08-17T07:15:58.976524", "duration": 0.636159, "event_loop": "items", "uuid": "710f8620-0a5c-470e-bf78-bc1e51a77fa9"}	f	f	710f8620-0a5c-470e-bf78-bc1e51a77fa9	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	17		0	19	19	16
271	2021-08-17 07:16:02.917711+00	2021-08-17 07:16:02.920901+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "7a91cb39-1634-4325-9545-e05a1718df76", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-c9e0-8ff4-000000000006", "play_pattern": "localhost", "task": "Set the git repository version", "task_uuid": "0242ac12-0005-c9e0-8ff4-00000000000b", "task_action": "set_fact", "task_args": "", "task_path": "/tmp/bwrap_17_cnh8436b/awx_17_njz3midn/project/project_update.yml:44", "host": "localhost", "uuid": "280bfc80-7357-4b95-bdc3-5a018810d2bf"}	f	f	280bfc80-7357-4b95-bdc3-5a018810d2bf	project_update.yml	Update source tree if necessary		Set the git repository version	7		0	7	7	17
292	2021-08-17 07:16:04.712544+00	2021-08-17 07:16:04.714387+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "7a91cb39-1634-4325-9545-e05a1718df76", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-c9e0-8ff4-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-c9e0-8ff4-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_17_cnh8436b/awx_17_njz3midn/project/project_update.yml:194", "name": "fetch galaxy collections from collections/requirements.(yml/yaml)", "is_conditional": false, "uuid": "0242ac12-0005-c9e0-8ff4-000000000023"}	f	f	0242ac12-0005-c9e0-8ff4-000000000023	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	28	\r\nTASK [fetch galaxy collections from collections/requirements.(yml/yaml)] *******	0	27	29	17
7	2021-08-17 04:44:41.82567+00	2021-08-17 04:44:41.829833+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "b5beb502-8c90-4efb-9ffc-557935a5835d", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-925e-954a-000000000006", "play_pattern": "localhost", "task": "update project using git", "task_uuid": "0242ac12-0005-925e-954a-00000000000a", "task_action": "git", "task_args": "", "task_path": "/tmp/bwrap_1_nbx_idbg/awx_1_yb8lwdax/project/project_update.yml:34", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"changed": true, "before": null, "after": "347e44fea036c94d5f60e544de006453ee5c71ad", "invocation": {"module_args": {"dest": "/var/lib/awx/projects/_6__demo_project", "repo": "https://github.com/ansible/ansible-tower-samples", "version": "HEAD", "force": false, "remote": "origin", "clone": true, "update": true, "verify_commit": false, "gpg_whitelist": [], "accept_hostkey": false, "bare": false, "recursive": true, "track_submodules": false, "refspec": null, "reference": null, "depth": null, "key_file": null, "ssh_opts": null, "executable": null, "umask": null, "archive": null, "separate_git_dir": null}}, "_ansible_no_log": false}, "start": "2021-08-17T04:44:39.639696", "end": "2021-08-17T04:44:41.825481", "duration": 2.185785, "event_loop": null, "uuid": "0c700244-d89d-4cfc-9dae-984b91fd24fe"}	f	t	0c700244-d89d-4cfc-9dae-984b91fd24fe	project_update.yml	Update source tree if necessary		update project using git	5	[0;33mchanged: [localhost][0m	0	4	5	1
28	2021-08-17 04:44:43.720393+00	2021-08-17 04:44:43.721977+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "b5beb502-8c90-4efb-9ffc-557935a5835d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-925e-954a-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-925e-954a-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_1_nbx_idbg/awx_1_yb8lwdax/project/project_update.yml:194", "name": "fetch galaxy collections from collections/requirements.(yml/yaml)", "is_conditional": false, "uuid": "0242ac12-0005-925e-954a-000000000023"}	f	f	0242ac12-0005-925e-954a-000000000023	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	28	\r\nTASK [fetch galaxy collections from collections/requirements.(yml/yaml)] *******	0	27	29	1
204	2021-08-17 07:15:53.122054+00	2021-08-17 07:15:53.124162+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "e098ff2c-0cc7-4fa4-ac6b-c3749ed06769", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-d907-6799-000000000006", "play_pattern": "localhost", "task": "Set the git repository version", "task_uuid": "0242ac12-0005-d907-6799-00000000000b", "task_action": "set_fact", "task_args": "", "task_path": "/tmp/bwrap_15_ewsgoefo/awx_15_8r8m9hjb/project/project_update.yml:44", "name": "Set the git repository version", "is_conditional": false, "uuid": "0242ac12-0005-d907-6799-00000000000b"}	f	f	0242ac12-0005-d907-6799-00000000000b	project_update.yml	Update source tree if necessary		Set the git repository version	6	\r\nTASK [Set the git repository version] ******************************************	0	5	7	15
227	2021-08-17 07:15:54.928331+00	2021-08-17 07:15:54.93001+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "e098ff2c-0cc7-4fa4-ac6b-c3749ed06769", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-d907-6799-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-d907-6799-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_15_ewsgoefo/awx_15_8r8m9hjb/project/project_update.yml:194", "name": "fetch galaxy collections from collections/requirements.(yml/yaml)", "is_conditional": false, "uuid": "0242ac12-0005-d907-6799-000000000023"}	f	f	0242ac12-0005-d907-6799-000000000023	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	28	\r\nTASK [fetch galaxy collections from collections/requirements.(yml/yaml)] *******	0	27	29	15
249	2021-08-17 07:15:58.980233+00	2021-08-17 07:15:58.98233+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "b015f3c4-357b-4a03-970a-86ca8efae653", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-b443-2c62-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-b443-2c62-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_16_xquwi25g/awx_16_yv8gg_96/project/project_update.yml:168", "name": "fetch galaxy roles from requirements.(yml/yaml)", "is_conditional": false, "uuid": "0242ac12-0005-b443-2c62-000000000020"}	f	f	0242ac12-0005-b443-2c62-000000000020	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	18	\r\nTASK [fetch galaxy roles from requirements.(yml/yaml)] *************************	0	19	21	16
272	2021-08-17 07:16:03.088498+00	2021-08-17 07:16:03.092923+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "7a91cb39-1634-4325-9545-e05a1718df76", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-c9e0-8ff4-000000000006", "play_pattern": "localhost", "task": "Set the git repository version", "task_uuid": "0242ac12-0005-c9e0-8ff4-00000000000b", "task_action": "set_fact", "task_args": "", "task_path": "/tmp/bwrap_17_cnh8436b/awx_17_njz3midn/project/project_update.yml:44", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"changed": false, "ansible_facts": {"scm_version": "355d65af0d6cc43865251aea89a57e5c3ae0b282"}, "_ansible_no_log": false}, "start": "2021-08-17T07:16:02.917632", "end": "2021-08-17T07:16:03.088290", "duration": 0.170658, "event_loop": null, "uuid": "c7ad61d7-8a32-48b0-bd2e-c1a0c8d532f5"}	f	f	c7ad61d7-8a32-48b0-bd2e-c1a0c8d532f5	project_update.yml	Update source tree if necessary		Set the git repository version	8	[0;32mok: [localhost][0m	0	7	8	17
293	2021-08-17 07:16:04.713173+00	2021-08-17 07:16:04.714326+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "7a91cb39-1634-4325-9545-e05a1718df76", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-c9e0-8ff4-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-c9e0-8ff4-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_17_cnh8436b/awx_17_njz3midn/project/project_update.yml:194", "host": "localhost", "uuid": "fa483b85-a0f0-4853-b316-d167348509eb"}	f	f	fa483b85-a0f0-4853-b316-d167348509eb	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	29		0	29	29	17
334	2021-08-17 07:16:12.553042+00	2021-08-17 07:16:13.609052+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "48221bd1-55e7-40c7-9019-5e5e9e53acd3", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-8926-da79-000000000006", "play_pattern": "localhost", "task": "update project using git", "task_uuid": "0242ac12-0005-8926-da79-00000000000a", "task_action": "git", "task_args": "", "task_path": "/tmp/bwrap_19_qa3qu_ri/awx_19_d93vso43/project/project_update.yml:34", "name": "update project using git", "is_conditional": false, "uuid": "0242ac12-0005-8926-da79-00000000000a"}	f	f	0242ac12-0005-8926-da79-00000000000a	project_update.yml	Update source tree if necessary		update project using git	3	\r\nTASK [update project using git] ************************************************	0	2	4	19
8	2021-08-17 04:44:42.034171+00	2021-08-17 04:44:42.036406+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "b5beb502-8c90-4efb-9ffc-557935a5835d", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-925e-954a-000000000006", "play_pattern": "localhost", "task": "Set the git repository version", "task_uuid": "0242ac12-0005-925e-954a-00000000000b", "task_action": "set_fact", "task_args": "", "task_path": "/tmp/bwrap_1_nbx_idbg/awx_1_yb8lwdax/project/project_update.yml:44", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"changed": false, "ansible_facts": {"scm_version": "347e44fea036c94d5f60e544de006453ee5c71ad"}, "_ansible_no_log": false}, "start": "2021-08-17T04:44:41.830764", "end": "2021-08-17T04:44:42.033965", "duration": 0.203201, "event_loop": null, "uuid": "70d56d19-2264-4506-b0e3-4008174cb1f0"}	f	f	70d56d19-2264-4506-b0e3-4008174cb1f0	project_update.yml	Update source tree if necessary		Set the git repository version	8	[0;32mok: [localhost][0m	0	7	8	1
29	2021-08-17 04:44:43.720988+00	2021-08-17 04:44:43.725791+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "b5beb502-8c90-4efb-9ffc-557935a5835d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-925e-954a-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-925e-954a-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_1_nbx_idbg/awx_1_yb8lwdax/project/project_update.yml:194", "host": "localhost", "uuid": "a56fd346-1a1d-49cf-a9c8-26092347257f"}	f	f	a56fd346-1a1d-49cf-a9c8-26092347257f	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	29		0	29	29	1
205	2021-08-17 07:15:53.122794+00	2021-08-17 07:15:53.125809+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "e098ff2c-0cc7-4fa4-ac6b-c3749ed06769", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-d907-6799-000000000006", "play_pattern": "localhost", "task": "Set the git repository version", "task_uuid": "0242ac12-0005-d907-6799-00000000000b", "task_action": "set_fact", "task_args": "", "task_path": "/tmp/bwrap_15_ewsgoefo/awx_15_8r8m9hjb/project/project_update.yml:44", "host": "localhost", "uuid": "a2c45305-61c1-4148-b0cb-c34bc6f7173d"}	f	f	a2c45305-61c1-4148-b0cb-c34bc6f7173d	project_update.yml	Update source tree if necessary		Set the git repository version	7		0	7	7	15
228	2021-08-17 07:15:55.143587+00	2021-08-17 07:15:55.145325+00	runner_item_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "e098ff2c-0cc7-4fa4-ac6b-c3749ed06769", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-d907-6799-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-d907-6799-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_15_ewsgoefo/awx_15_8r8m9hjb/project/project_update.yml:194", "host": "localhost", "res": {"changed": false, "skip_reason": "Conditional result was False", "_ansible_no_log": false, "item": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item"}, "ansible_loop_var": "item", "_ansible_item_label": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item"}}, "uuid": "2073bbe2-8dcf-41c6-9e00-c547778d18a8"}	f	f	2073bbe2-8dcf-41c6-9e00-c547778d18a8	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	30	[0;36mskipping: [localhost] => (item={'changed': False, 'stat': {'exists': False}, 'invocation': {'module_args': {'path': '/var/lib/awx/projects/_13__winserver/collections/requirements.yml', 'follow': False, 'get_md5': False, 'get_checksum': True, 'get_mime': True, 'get_attributes': True, 'checksum_algorithm': 'sha1'}}, 'failed': False, 'item': {'ext': '.yml'}, 'ansible_loop_var': 'item'}) [0m	0	29	30	15
250	2021-08-17 07:15:58.981016+00	2021-08-17 07:15:58.985472+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "b015f3c4-357b-4a03-970a-86ca8efae653", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-b443-2c62-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-b443-2c62-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_16_xquwi25g/awx_16_yv8gg_96/project/project_update.yml:168", "host": "localhost", "uuid": "57b4c093-30fd-4243-a4f1-6ead88146a0a"}	f	f	57b4c093-30fd-4243-a4f1-6ead88146a0a	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	19		0	21	21	16
273	2021-08-17 07:16:03.09266+00	2021-08-17 07:16:03.094673+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "7a91cb39-1634-4325-9545-e05a1718df76", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-c9e0-8ff4-000000000006", "play_pattern": "localhost", "task": "Repository Version", "task_uuid": "0242ac12-0005-c9e0-8ff4-00000000001c", "task_action": "debug", "task_args": "", "task_path": "/tmp/bwrap_17_cnh8436b/awx_17_njz3midn/project/project_update.yml:142", "name": "Repository Version", "is_conditional": false, "uuid": "0242ac12-0005-c9e0-8ff4-00000000001c"}	f	f	0242ac12-0005-c9e0-8ff4-00000000001c	project_update.yml	Update source tree if necessary		Repository Version	9	\r\nTASK [Repository Version] ******************************************************	0	8	10	17
294	2021-08-17 07:16:04.922814+00	2021-08-17 07:16:04.92448+00	runner_item_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "7a91cb39-1634-4325-9545-e05a1718df76", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-c9e0-8ff4-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-c9e0-8ff4-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_17_cnh8436b/awx_17_njz3midn/project/project_update.yml:194", "host": "localhost", "res": {"changed": false, "skip_reason": "Conditional result was False", "_ansible_no_log": false, "item": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item"}, "ansible_loop_var": "item", "_ansible_item_label": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item"}}, "uuid": "7eb72723-f84d-41c8-b311-1996a84b7591"}	f	f	7eb72723-f84d-41c8-b311-1996a84b7591	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	30	[0;36mskipping: [localhost] => (item={'changed': False, 'stat': {'exists': False}, 'invocation': {'module_args': {'path': '/var/lib/awx/projects/_13__winserver/collections/requirements.yml', 'follow': False, 'get_md5': False, 'get_checksum': True, 'get_mime': True, 'get_attributes': True, 'checksum_algorithm': 'sha1'}}, 'failed': False, 'item': {'ext': '.yml'}, 'ansible_loop_var': 'item'}) [0m	0	29	30	17
311	2021-08-17 07:16:09.847019+00	2021-08-17 07:16:09.850564+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "9423ec19-3f36-4b3c-9c49-1a4429dcbbd0", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-4b9d-ad82-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-4b9d-ad82-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_18_o_rdcv1n/awx_18_mry1qamd/project/project_update.yml:162", "name": "detect roles/requirements.(yml/yaml)", "is_conditional": false, "uuid": "0242ac12-0005-4b9d-ad82-00000000001f"}	f	f	0242ac12-0005-4b9d-ad82-00000000001f	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	13	\r\nTASK [detect roles/requirements.(yml/yaml)] ************************************	0	15	17	18
10	2021-08-17 04:44:42.051721+00	2021-08-17 04:44:42.053302+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "b5beb502-8c90-4efb-9ffc-557935a5835d", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-925e-954a-000000000006", "play_pattern": "localhost", "task": "Repository Version", "task_uuid": "0242ac12-0005-925e-954a-00000000001c", "task_action": "debug", "task_args": "", "task_path": "/tmp/bwrap_1_nbx_idbg/awx_1_yb8lwdax/project/project_update.yml:142", "name": "Repository Version", "is_conditional": false, "uuid": "0242ac12-0005-925e-954a-00000000001c"}	f	f	0242ac12-0005-925e-954a-00000000001c	project_update.yml	Update source tree if necessary		Repository Version	9	\r\nTASK [Repository Version] ******************************************************	0	8	10	1
30	2021-08-17 04:44:43.931201+00	2021-08-17 04:44:43.932869+00	runner_item_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "b5beb502-8c90-4efb-9ffc-557935a5835d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-925e-954a-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-925e-954a-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_1_nbx_idbg/awx_1_yb8lwdax/project/project_update.yml:194", "host": "localhost", "res": {"changed": false, "skip_reason": "Conditional result was False", "_ansible_no_log": false, "item": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_6__demo_project/collections/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item"}, "ansible_loop_var": "item", "_ansible_item_label": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_6__demo_project/collections/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item"}}, "uuid": "f48cde8e-444a-4175-a4bd-a0be423363be"}	f	f	f48cde8e-444a-4175-a4bd-a0be423363be	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	30	[0;36mskipping: [localhost] => (item={'changed': False, 'stat': {'exists': False}, 'invocation': {'module_args': {'path': '/var/lib/awx/projects/_6__demo_project/collections/requirements.yml', 'follow': False, 'get_md5': False, 'get_checksum': True, 'get_mime': True, 'get_attributes': True, 'checksum_algorithm': 'sha1'}}, 'failed': False, 'item': {'ext': '.yml'}, 'ansible_loop_var': 'item'}) [0m	0	29	30	1
206	2021-08-17 07:15:53.327941+00	2021-08-17 07:15:53.329767+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "e098ff2c-0cc7-4fa4-ac6b-c3749ed06769", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-d907-6799-000000000006", "play_pattern": "localhost", "task": "Repository Version", "task_uuid": "0242ac12-0005-d907-6799-00000000001c", "task_action": "debug", "task_args": "", "task_path": "/tmp/bwrap_15_ewsgoefo/awx_15_8r8m9hjb/project/project_update.yml:142", "name": "Repository Version", "is_conditional": false, "uuid": "0242ac12-0005-d907-6799-00000000001c"}	f	f	0242ac12-0005-d907-6799-00000000001c	project_update.yml	Update source tree if necessary		Repository Version	9	\r\nTASK [Repository Version] ******************************************************	0	8	10	15
229	2021-08-17 07:15:55.153387+00	2021-08-17 07:15:55.156408+00	runner_item_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "e098ff2c-0cc7-4fa4-ac6b-c3749ed06769", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-d907-6799-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-d907-6799-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_15_ewsgoefo/awx_15_8r8m9hjb/project/project_update.yml:194", "host": "localhost", "res": {"changed": false, "skip_reason": "Conditional result was False", "_ansible_no_log": false, "item": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item"}, "ansible_loop_var": "item", "_ansible_item_label": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item"}}, "uuid": "010ba556-ff53-4586-86d1-7b38dc718e51"}	f	f	010ba556-ff53-4586-86d1-7b38dc718e51	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	31	[0;36mskipping: [localhost] => (item={'changed': False, 'stat': {'exists': False}, 'invocation': {'module_args': {'path': '/var/lib/awx/projects/_13__winserver/collections/requirements.yaml', 'follow': False, 'get_md5': False, 'get_checksum': True, 'get_mime': True, 'get_attributes': True, 'checksum_algorithm': 'sha1'}}, 'failed': False, 'item': {'ext': '.yaml'}, 'ansible_loop_var': 'item'}) [0m	0	30	31	15
251	2021-08-17 07:15:59.188914+00	2021-08-17 07:15:59.191505+00	runner_item_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "b015f3c4-357b-4a03-970a-86ca8efae653", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-b443-2c62-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-b443-2c62-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_16_xquwi25g/awx_16_yv8gg_96/project/project_update.yml:168", "host": "localhost", "res": {"changed": false, "skip_reason": "Conditional result was False", "_ansible_no_log": false, "item": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item"}, "ansible_loop_var": "item", "_ansible_item_label": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item"}}, "uuid": "17e77171-0288-40c6-90ce-8d87420a7afa"}	f	f	17e77171-0288-40c6-90ce-8d87420a7afa	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	20	[0;36mskipping: [localhost] => (item={'changed': False, 'stat': {'exists': False}, 'invocation': {'module_args': {'path': '/var/lib/awx/projects/_13__winserver/roles/requirements.yml', 'follow': False, 'get_md5': False, 'get_checksum': True, 'get_mime': True, 'get_attributes': True, 'checksum_algorithm': 'sha1'}}, 'failed': False, 'item': {'ext': '.yml'}, 'ansible_loop_var': 'item'}) [0m	0	21	22	16
274	2021-08-17 07:16:03.093451+00	2021-08-17 07:16:03.096959+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "7a91cb39-1634-4325-9545-e05a1718df76", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-c9e0-8ff4-000000000006", "play_pattern": "localhost", "task": "Repository Version", "task_uuid": "0242ac12-0005-c9e0-8ff4-00000000001c", "task_action": "debug", "task_args": "", "task_path": "/tmp/bwrap_17_cnh8436b/awx_17_njz3midn/project/project_update.yml:142", "host": "localhost", "uuid": "5d48013e-b780-40f4-bf60-e7561fc0f4d6"}	f	f	5d48013e-b780-40f4-bf60-e7561fc0f4d6	project_update.yml	Update source tree if necessary		Repository Version	10		0	10	10	17
295	2021-08-17 07:16:04.931565+00	2021-08-17 07:16:04.935341+00	runner_item_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "7a91cb39-1634-4325-9545-e05a1718df76", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-c9e0-8ff4-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-c9e0-8ff4-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_17_cnh8436b/awx_17_njz3midn/project/project_update.yml:194", "host": "localhost", "res": {"changed": false, "skip_reason": "Conditional result was False", "_ansible_no_log": false, "item": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item"}, "ansible_loop_var": "item", "_ansible_item_label": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item"}}, "uuid": "b03e5446-eea8-46fb-bc93-9bc808ebc49a"}	f	f	b03e5446-eea8-46fb-bc93-9bc808ebc49a	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	31	[0;36mskipping: [localhost] => (item={'changed': False, 'stat': {'exists': False}, 'invocation': {'module_args': {'path': '/var/lib/awx/projects/_13__winserver/collections/requirements.yaml', 'follow': False, 'get_md5': False, 'get_checksum': True, 'get_mime': True, 'get_attributes': True, 'checksum_algorithm': 'sha1'}}, 'failed': False, 'item': {'ext': '.yaml'}, 'ansible_loop_var': 'item'}) [0m	0	30	31	17
9	2021-08-17 04:44:42.052563+00	2021-08-17 04:44:42.054288+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "b5beb502-8c90-4efb-9ffc-557935a5835d", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-925e-954a-000000000006", "play_pattern": "localhost", "task": "Repository Version", "task_uuid": "0242ac12-0005-925e-954a-00000000001c", "task_action": "debug", "task_args": "", "task_path": "/tmp/bwrap_1_nbx_idbg/awx_1_yb8lwdax/project/project_update.yml:142", "host": "localhost", "uuid": "100346c0-dc9d-4c81-b118-58f4b17b4dcb"}	f	f	100346c0-dc9d-4c81-b118-58f4b17b4dcb	project_update.yml	Update source tree if necessary		Repository Version	10		0	10	10	1
31	2021-08-17 04:44:43.940482+00	2021-08-17 04:44:43.943563+00	runner_item_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "b5beb502-8c90-4efb-9ffc-557935a5835d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-925e-954a-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-925e-954a-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_1_nbx_idbg/awx_1_yb8lwdax/project/project_update.yml:194", "host": "localhost", "res": {"changed": false, "skip_reason": "Conditional result was False", "_ansible_no_log": false, "item": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_6__demo_project/collections/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item"}, "ansible_loop_var": "item", "_ansible_item_label": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_6__demo_project/collections/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item"}}, "uuid": "332bf7a3-0ec1-4fa3-8269-0387973617be"}	f	f	332bf7a3-0ec1-4fa3-8269-0387973617be	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	31	[0;36mskipping: [localhost] => (item={'changed': False, 'stat': {'exists': False}, 'invocation': {'module_args': {'path': '/var/lib/awx/projects/_6__demo_project/collections/requirements.yaml', 'follow': False, 'get_md5': False, 'get_checksum': True, 'get_mime': True, 'get_attributes': True, 'checksum_algorithm': 'sha1'}}, 'failed': False, 'item': {'ext': '.yaml'}, 'ansible_loop_var': 'item'}) [0m	0	30	31	1
207	2021-08-17 07:15:53.324198+00	2021-08-17 07:15:53.327891+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "e098ff2c-0cc7-4fa4-ac6b-c3749ed06769", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-d907-6799-000000000006", "play_pattern": "localhost", "task": "Set the git repository version", "task_uuid": "0242ac12-0005-d907-6799-00000000000b", "task_action": "set_fact", "task_args": "", "task_path": "/tmp/bwrap_15_ewsgoefo/awx_15_8r8m9hjb/project/project_update.yml:44", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"changed": false, "ansible_facts": {"scm_version": "355d65af0d6cc43865251aea89a57e5c3ae0b282"}, "_ansible_no_log": false}, "start": "2021-08-17T07:15:53.122716", "end": "2021-08-17T07:15:53.323961", "duration": 0.201245, "event_loop": null, "uuid": "58822b80-cb73-4d8d-b720-2876baa8f532"}	f	f	58822b80-cb73-4d8d-b720-2876baa8f532	project_update.yml	Update source tree if necessary		Set the git repository version	8	[0;32mok: [localhost][0m	0	7	8	15
230	2021-08-17 07:15:55.154382+00	2021-08-17 07:15:55.1564+00	runner_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "e098ff2c-0cc7-4fa4-ac6b-c3749ed06769", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-d907-6799-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-d907-6799-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_15_ewsgoefo/awx_15_8r8m9hjb/project/project_update.yml:194", "host": "localhost", "remote_addr": "127.0.0.1", "start": "2021-08-17T07:15:54.928907", "end": "2021-08-17T07:15:55.154285", "duration": 0.225378, "event_loop": "items", "uuid": "90458453-16a0-4ea8-9029-53775fca0293"}	f	f	90458453-16a0-4ea8-9029-53775fca0293	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	32		0	31	31	15
252	2021-08-17 07:15:59.195138+00	2021-08-17 07:15:59.197668+00	runner_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "b015f3c4-357b-4a03-970a-86ca8efae653", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-b443-2c62-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-b443-2c62-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_16_xquwi25g/awx_16_yv8gg_96/project/project_update.yml:168", "host": "localhost", "remote_addr": "127.0.0.1", "start": "2021-08-17T07:15:58.980937", "end": "2021-08-17T07:15:59.195042", "duration": 0.214105, "event_loop": "items", "uuid": "186ec026-b121-4621-bba2-28d32278afed"}	f	f	186ec026-b121-4621-bba2-28d32278afed	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	22		0	23	23	16
275	2021-08-17 07:16:03.295856+00	2021-08-17 07:16:03.297396+00	playbook_on_play_start	{"playbook": "project_update.yml", "playbook_uuid": "7a91cb39-1634-4325-9545-e05a1718df76", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-c9e0-8ff4-00000000001d", "play_pattern": "localhost", "name": "Install content with ansible-galaxy command if necessary", "pattern": "localhost", "uuid": "0242ac12-0005-c9e0-8ff4-00000000001d"}	f	f	0242ac12-0005-c9e0-8ff4-00000000001d	project_update.yml	Install content with ansible-galaxy command if necessary			12	\r\nPLAY [Install content with ansible-galaxy command if necessary] ****************	0	13	15	17
296	2021-08-17 07:16:04.93507+00	2021-08-17 07:16:04.939741+00	playbook_on_stats	{"playbook": "project_update.yml", "playbook_uuid": "7a91cb39-1634-4325-9545-e05a1718df76", "changed": {}, "dark": {}, "failures": {}, "ignored": {}, "ok": {"localhost": 5}, "processed": {"localhost": 1}, "rescued": {}, "skipped": {"localhost": 2}, "artifact_data": {}, "uuid": "d65754f1-42b5-4822-b10f-c3e596fea7de"}	f	f	d65754f1-42b5-4822-b10f-c3e596fea7de	project_update.yml				33	\r\nPLAY RECAP *********************************************************************\r\n[0;32mlocalhost[0m                  : [0;32mok=5   [0m changed=0    unreachable=0    failed=0    [0;36mskipped=2   [0m rescued=0    ignored=0   \r\n	0	31	35	17
312	2021-08-17 07:16:10.316922+00	2021-08-17 07:16:10.318542+00	runner_item_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "9423ec19-3f36-4b3c-9c49-1a4429dcbbd0", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-4b9d-ad82-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-4b9d-ad82-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_18_o_rdcv1n/awx_18_mry1qamd/project/project_update.yml:162", "host": "localhost", "res": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_8__createfile/roles/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yml"}}, "uuid": "d6a58065-fa61-4449-b7e6-1fc496aa3189"}	f	f	d6a58065-fa61-4449-b7e6-1fc496aa3189	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	15	[0;32mok: [localhost] => (item={'ext': '.yml'})[0m	0	17	18	18
11	2021-08-17 04:44:42.249538+00	2021-08-17 04:44:42.251203+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "b5beb502-8c90-4efb-9ffc-557935a5835d", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-925e-954a-000000000006", "play_pattern": "localhost", "task": "Repository Version", "task_uuid": "0242ac12-0005-925e-954a-00000000001c", "task_action": "debug", "task_args": "", "task_path": "/tmp/bwrap_1_nbx_idbg/awx_1_yb8lwdax/project/project_update.yml:142", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"msg": "Repository Version 347e44fea036c94d5f60e544de006453ee5c71ad", "_ansible_verbose_always": true, "_ansible_no_log": false, "changed": false}, "start": "2021-08-17T04:44:42.052483", "end": "2021-08-17T04:44:42.249330", "duration": 0.196847, "event_loop": null, "uuid": "7a343731-cf64-4035-8a03-c3cfe695cd9a"}	f	f	7a343731-cf64-4035-8a03-c3cfe695cd9a	project_update.yml	Update source tree if necessary		Repository Version	11	[0;32mok: [localhost] => {[0m\r\n[0;32m    "msg": "Repository Version 347e44fea036c94d5f60e544de006453ee5c71ad"[0m\r\n[0;32m}[0m	0	10	13	1
32	2021-08-17 04:44:43.941465+00	2021-08-17 04:44:43.944406+00	runner_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "b5beb502-8c90-4efb-9ffc-557935a5835d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-925e-954a-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-925e-954a-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_1_nbx_idbg/awx_1_yb8lwdax/project/project_update.yml:194", "host": "localhost", "remote_addr": "127.0.0.1", "start": "2021-08-17T04:44:43.720912", "end": "2021-08-17T04:44:43.941370", "duration": 0.220458, "event_loop": "items", "uuid": "98d569c0-e16b-4f0c-84d0-49836335a7d2"}	f	f	98d569c0-e16b-4f0c-84d0-49836335a7d2	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	32		0	31	31	1
208	2021-08-17 07:15:53.328834+00	2021-08-17 07:15:53.332175+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "e098ff2c-0cc7-4fa4-ac6b-c3749ed06769", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-d907-6799-000000000006", "play_pattern": "localhost", "task": "Repository Version", "task_uuid": "0242ac12-0005-d907-6799-00000000001c", "task_action": "debug", "task_args": "", "task_path": "/tmp/bwrap_15_ewsgoefo/awx_15_8r8m9hjb/project/project_update.yml:142", "host": "localhost", "uuid": "89b37def-3120-4568-b719-a1d8d85706c7"}	f	f	89b37def-3120-4568-b719-a1d8d85706c7	project_update.yml	Update source tree if necessary		Repository Version	10		0	10	10	15
231	2021-08-17 07:15:55.15731+00	2021-08-17 07:15:55.15946+00	playbook_on_stats	{"playbook": "project_update.yml", "playbook_uuid": "e098ff2c-0cc7-4fa4-ac6b-c3749ed06769", "changed": {"localhost": 1}, "dark": {}, "failures": {}, "ignored": {}, "ok": {"localhost": 5}, "processed": {"localhost": 1}, "rescued": {}, "skipped": {"localhost": 2}, "artifact_data": {}, "uuid": "3bf764cb-4170-49af-9739-4ffb5a319a80"}	f	t	3bf764cb-4170-49af-9739-4ffb5a319a80	project_update.yml				33	\r\nPLAY RECAP *********************************************************************\r\n[0;33mlocalhost[0m                  : [0;32mok=5   [0m [0;33mchanged=1   [0m unreachable=0    failed=0    [0;36mskipped=2   [0m rescued=0    ignored=0   \r\n	0	31	35	15
253	2021-08-17 07:15:59.194054+00	2021-08-17 07:15:59.196587+00	runner_item_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "b015f3c4-357b-4a03-970a-86ca8efae653", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-b443-2c62-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-b443-2c62-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_16_xquwi25g/awx_16_yv8gg_96/project/project_update.yml:168", "host": "localhost", "res": {"changed": false, "skip_reason": "Conditional result was False", "_ansible_no_log": false, "item": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item"}, "ansible_loop_var": "item", "_ansible_item_label": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item"}}, "uuid": "76193e3d-7138-47e4-8beb-abac036ca3a1"}	f	f	76193e3d-7138-47e4-8beb-abac036ca3a1	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	21	[0;36mskipping: [localhost] => (item={'changed': False, 'stat': {'exists': False}, 'invocation': {'module_args': {'path': '/var/lib/awx/projects/_13__winserver/roles/requirements.yaml', 'follow': False, 'get_md5': False, 'get_checksum': True, 'get_mime': True, 'get_attributes': True, 'checksum_algorithm': 'sha1'}}, 'failed': False, 'item': {'ext': '.yaml'}, 'ansible_loop_var': 'item'}) [0m	0	22	23	16
276	2021-08-17 07:16:03.292114+00	2021-08-17 07:16:03.295153+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "7a91cb39-1634-4325-9545-e05a1718df76", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-c9e0-8ff4-000000000006", "play_pattern": "localhost", "task": "Repository Version", "task_uuid": "0242ac12-0005-c9e0-8ff4-00000000001c", "task_action": "debug", "task_args": "", "task_path": "/tmp/bwrap_17_cnh8436b/awx_17_njz3midn/project/project_update.yml:142", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"msg": "Repository Version 355d65af0d6cc43865251aea89a57e5c3ae0b282", "_ansible_verbose_always": true, "_ansible_no_log": false, "changed": false}, "start": "2021-08-17T07:16:03.093373", "end": "2021-08-17T07:16:03.291874", "duration": 0.198501, "event_loop": null, "uuid": "1646c78e-a04f-4254-9827-6cf2f84db943"}	f	f	1646c78e-a04f-4254-9827-6cf2f84db943	project_update.yml	Update source tree if necessary		Repository Version	11	[0;32mok: [localhost] => {[0m\r\n[0;32m    "msg": "Repository Version 355d65af0d6cc43865251aea89a57e5c3ae0b282"[0m\r\n[0;32m}[0m	0	10	13	17
297	2021-08-17 07:16:04.932489+00	2021-08-17 07:16:04.937926+00	runner_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "7a91cb39-1634-4325-9545-e05a1718df76", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-c9e0-8ff4-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-c9e0-8ff4-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_17_cnh8436b/awx_17_njz3midn/project/project_update.yml:194", "host": "localhost", "remote_addr": "127.0.0.1", "start": "2021-08-17T07:16:04.713074", "end": "2021-08-17T07:16:04.932400", "duration": 0.219326, "event_loop": "items", "uuid": "9ef31c85-0c61-473c-8e50-b9770fef6c0a"}	f	f	9ef31c85-0c61-473c-8e50-b9770fef6c0a	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	32		0	31	31	17
325	2021-08-17 07:16:11.248252+00	2021-08-17 07:16:11.250299+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "9423ec19-3f36-4b3c-9c49-1a4429dcbbd0", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-4b9d-ad82-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-4b9d-ad82-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_18_o_rdcv1n/awx_18_mry1qamd/project/project_update.yml:194", "name": "fetch galaxy collections from collections/requirements.(yml/yaml)", "is_conditional": false, "uuid": "0242ac12-0005-4b9d-ad82-000000000023"}	f	f	0242ac12-0005-4b9d-ad82-000000000023	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	28	\r\nTASK [fetch galaxy collections from collections/requirements.(yml/yaml)] *******	0	27	29	18
12	2021-08-17 04:44:42.253762+00	2021-08-17 04:44:42.256237+00	playbook_on_play_start	{"playbook": "project_update.yml", "playbook_uuid": "b5beb502-8c90-4efb-9ffc-557935a5835d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-925e-954a-00000000001d", "play_pattern": "localhost", "name": "Install content with ansible-galaxy command if necessary", "pattern": "localhost", "uuid": "0242ac12-0005-925e-954a-00000000001d"}	f	f	0242ac12-0005-925e-954a-00000000001d	project_update.yml	Install content with ansible-galaxy command if necessary			12	\r\nPLAY [Install content with ansible-galaxy command if necessary] ****************	0	13	15	1
33	2021-08-17 04:44:43.944316+00	2021-08-17 04:44:43.94652+00	playbook_on_stats	{"playbook": "project_update.yml", "playbook_uuid": "b5beb502-8c90-4efb-9ffc-557935a5835d", "changed": {"localhost": 1}, "dark": {}, "failures": {}, "ignored": {}, "ok": {"localhost": 5}, "processed": {"localhost": 1}, "rescued": {}, "skipped": {"localhost": 2}, "artifact_data": {}, "uuid": "7c3ce943-4458-406f-a02d-9623fc6e4130"}	f	t	7c3ce943-4458-406f-a02d-9623fc6e4130	project_update.yml				33	\r\nPLAY RECAP *********************************************************************\r\n[0;33mlocalhost[0m                  : [0;32mok=5   [0m [0;33mchanged=1   [0m unreachable=0    failed=0    [0;36mskipped=2   [0m rescued=0    ignored=0   \r\n	0	31	35	1
209	2021-08-17 07:15:53.527001+00	2021-08-17 07:15:53.528848+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "e098ff2c-0cc7-4fa4-ac6b-c3749ed06769", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-d907-6799-000000000006", "play_pattern": "localhost", "task": "Repository Version", "task_uuid": "0242ac12-0005-d907-6799-00000000001c", "task_action": "debug", "task_args": "", "task_path": "/tmp/bwrap_15_ewsgoefo/awx_15_8r8m9hjb/project/project_update.yml:142", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"msg": "Repository Version 355d65af0d6cc43865251aea89a57e5c3ae0b282", "_ansible_verbose_always": true, "_ansible_no_log": false, "changed": false}, "start": "2021-08-17T07:15:53.328751", "end": "2021-08-17T07:15:53.526807", "duration": 0.198056, "event_loop": null, "uuid": "4c4a059f-d89b-4c42-92fb-b1a12dd237f7"}	f	f	4c4a059f-d89b-4c42-92fb-b1a12dd237f7	project_update.yml	Update source tree if necessary		Repository Version	11	[0;32mok: [localhost] => {[0m\r\n[0;32m    "msg": "Repository Version 355d65af0d6cc43865251aea89a57e5c3ae0b282"[0m\r\n[0;32m}[0m	0	10	13	15
232	2021-08-17 07:15:56.562162+00	2021-08-17 07:15:56.56419+00	playbook_on_start	{"playbook": "project_update.yml", "playbook_uuid": "b015f3c4-357b-4a03-970a-86ca8efae653", "uuid": "b015f3c4-357b-4a03-970a-86ca8efae653"}	f	f	b015f3c4-357b-4a03-970a-86ca8efae653	project_update.yml				1		0	0	0	16
254	2021-08-17 07:15:59.199203+00	2021-08-17 07:15:59.201446+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "b015f3c4-357b-4a03-970a-86ca8efae653", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-b443-2c62-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-b443-2c62-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_16_xquwi25g/awx_16_yv8gg_96/project/project_update.yml:188", "name": "detect collections/requirements.(yml/yaml)", "is_conditional": false, "uuid": "0242ac12-0005-b443-2c62-000000000022"}	f	f	0242ac12-0005-b443-2c62-000000000022	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	23	\r\nTASK [detect collections/requirements.(yml/yaml)] ******************************	0	23	25	16
277	2021-08-17 07:16:03.302378+00	2021-08-17 07:16:03.305398+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "7a91cb39-1634-4325-9545-e05a1718df76", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-c9e0-8ff4-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-c9e0-8ff4-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_17_cnh8436b/awx_17_njz3midn/project/project_update.yml:162", "host": "localhost", "uuid": "d3e2d395-99d3-4f49-9a82-27a3cc864427"}	f	f	d3e2d395-99d3-4f49-9a82-27a3cc864427	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	14		0	17	17	17
298	2021-08-17 07:16:07.695163+00	2021-08-17 07:16:07.697645+00	playbook_on_start	{"playbook": "project_update.yml", "playbook_uuid": "9423ec19-3f36-4b3c-9c49-1a4429dcbbd0", "uuid": "9423ec19-3f36-4b3c-9c49-1a4429dcbbd0"}	f	f	9423ec19-3f36-4b3c-9c49-1a4429dcbbd0	project_update.yml				1		0	0	0	18
313	2021-08-17 07:16:10.484338+00	2021-08-17 07:16:10.48606+00	runner_item_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "9423ec19-3f36-4b3c-9c49-1a4429dcbbd0", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-4b9d-ad82-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-4b9d-ad82-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_18_o_rdcv1n/awx_18_mry1qamd/project/project_update.yml:162", "host": "localhost", "res": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_8__createfile/roles/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yaml"}}, "uuid": "a0dd4206-2885-4d95-9d2c-fe572b478088"}	f	f	a0dd4206-2885-4d95-9d2c-fe572b478088	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	16	[0;32mok: [localhost] => (item={'ext': '.yaml'})[0m	0	18	19	18
326	2021-08-17 07:16:11.248875+00	2021-08-17 07:16:11.251689+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "9423ec19-3f36-4b3c-9c49-1a4429dcbbd0", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-4b9d-ad82-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-4b9d-ad82-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_18_o_rdcv1n/awx_18_mry1qamd/project/project_update.yml:194", "host": "localhost", "uuid": "a7d5bc4e-0146-4c37-8453-05cd05ce8af3"}	f	f	a7d5bc4e-0146-4c37-8453-05cd05ce8af3	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	29		0	29	29	18
336	2021-08-17 07:16:13.925502+00	2021-08-17 07:16:13.927015+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "48221bd1-55e7-40c7-9019-5e5e9e53acd3", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-8926-da79-000000000006", "play_pattern": "localhost", "task": "Set the git repository version", "task_uuid": "0242ac12-0005-8926-da79-00000000000b", "task_action": "set_fact", "task_args": "", "task_path": "/tmp/bwrap_19_qa3qu_ri/awx_19_d93vso43/project/project_update.yml:44", "host": "localhost", "uuid": "9a801bb7-bdd4-4731-8149-4151619fc5bb"}	f	f	9a801bb7-bdd4-4731-8149-4151619fc5bb	project_update.yml	Update source tree if necessary		Set the git repository version	7		0	7	7	19
13	2021-08-17 04:44:42.260377+00	2021-08-17 04:44:42.263329+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "b5beb502-8c90-4efb-9ffc-557935a5835d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-925e-954a-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-925e-954a-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_1_nbx_idbg/awx_1_yb8lwdax/project/project_update.yml:162", "name": "detect roles/requirements.(yml/yaml)", "is_conditional": false, "uuid": "0242ac12-0005-925e-954a-00000000001f"}	f	f	0242ac12-0005-925e-954a-00000000001f	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	13	\r\nTASK [detect roles/requirements.(yml/yaml)] ************************************	0	15	17	1
210	2021-08-17 07:15:53.530696+00	2021-08-17 07:15:53.532324+00	playbook_on_play_start	{"playbook": "project_update.yml", "playbook_uuid": "e098ff2c-0cc7-4fa4-ac6b-c3749ed06769", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-d907-6799-00000000001d", "play_pattern": "localhost", "name": "Install content with ansible-galaxy command if necessary", "pattern": "localhost", "uuid": "0242ac12-0005-d907-6799-00000000001d"}	f	f	0242ac12-0005-d907-6799-00000000001d	project_update.yml	Install content with ansible-galaxy command if necessary			12	\r\nPLAY [Install content with ansible-galaxy command if necessary] ****************	0	13	15	15
233	2021-08-17 07:15:56.564654+00	2021-08-17 07:15:56.567167+00	playbook_on_play_start	{"playbook": "project_update.yml", "playbook_uuid": "b015f3c4-357b-4a03-970a-86ca8efae653", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-b443-2c62-000000000006", "play_pattern": "localhost", "name": "Update source tree if necessary", "pattern": "localhost", "uuid": "0242ac12-0005-b443-2c62-000000000006"}	f	f	0242ac12-0005-b443-2c62-000000000006	project_update.yml	Update source tree if necessary			2	\r\nPLAY [Update source tree if necessary] *****************************************	0	0	2	16
255	2021-08-17 07:15:59.199841+00	2021-08-17 07:15:59.576849+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "b015f3c4-357b-4a03-970a-86ca8efae653", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-b443-2c62-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-b443-2c62-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_16_xquwi25g/awx_16_yv8gg_96/project/project_update.yml:188", "host": "localhost", "uuid": "81120a66-a7e3-497f-a066-50c5e0fbf2cf"}	f	f	81120a66-a7e3-497f-a066-50c5e0fbf2cf	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	24		0	25	25	16
256	2021-08-17 07:15:59.574657+00	2021-08-17 07:15:59.576849+00	runner_item_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "b015f3c4-357b-4a03-970a-86ca8efae653", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-b443-2c62-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-b443-2c62-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_16_xquwi25g/awx_16_yv8gg_96/project/project_update.yml:188", "host": "localhost", "res": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yml"}}, "uuid": "90fc13f5-c516-4705-ab02-99208188e5f1"}	f	f	90fc13f5-c516-4705-ab02-99208188e5f1	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	25	[0;32mok: [localhost] => (item={'ext': '.yml'})[0m	0	25	26	16
278	2021-08-17 07:16:03.301783+00	2021-08-17 07:16:03.30665+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "7a91cb39-1634-4325-9545-e05a1718df76", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-c9e0-8ff4-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-c9e0-8ff4-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_17_cnh8436b/awx_17_njz3midn/project/project_update.yml:162", "name": "detect roles/requirements.(yml/yaml)", "is_conditional": false, "uuid": "0242ac12-0005-c9e0-8ff4-00000000001f"}	f	f	0242ac12-0005-c9e0-8ff4-00000000001f	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	13	\r\nTASK [detect roles/requirements.(yml/yaml)] ************************************	0	15	17	17
299	2021-08-17 07:16:07.697667+00	2021-08-17 07:16:07.700224+00	playbook_on_play_start	{"playbook": "project_update.yml", "playbook_uuid": "9423ec19-3f36-4b3c-9c49-1a4429dcbbd0", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-4b9d-ad82-000000000006", "play_pattern": "localhost", "name": "Update source tree if necessary", "pattern": "localhost", "uuid": "0242ac12-0005-4b9d-ad82-000000000006"}	f	f	0242ac12-0005-4b9d-ad82-000000000006	project_update.yml	Update source tree if necessary			2	\r\nPLAY [Update source tree if necessary] *****************************************	0	0	2	18
314	2021-08-17 07:16:10.485198+00	2021-08-17 07:16:10.487493+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "9423ec19-3f36-4b3c-9c49-1a4429dcbbd0", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-4b9d-ad82-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-4b9d-ad82-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_18_o_rdcv1n/awx_18_mry1qamd/project/project_update.yml:162", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"results": [{"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_8__createfile/roles/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yml"}}, {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_8__createfile/roles/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yaml"}}], "msg": "All items completed", "changed": false}, "start": "2021-08-17T07:16:09.847594", "end": "2021-08-17T07:16:10.485100", "duration": 0.637506, "event_loop": "items", "uuid": "0c6cd4bb-ff68-4d19-a60c-d75d634ef2b1"}	f	f	0c6cd4bb-ff68-4d19-a60c-d75d634ef2b1	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	17		0	19	19	18
14	2021-08-17 04:44:42.26098+00	2021-08-17 04:44:42.265908+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "b5beb502-8c90-4efb-9ffc-557935a5835d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-925e-954a-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-925e-954a-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_1_nbx_idbg/awx_1_yb8lwdax/project/project_update.yml:162", "host": "localhost", "uuid": "6555a8bb-97d6-45a1-b9f0-e58c6936e45f"}	f	f	6555a8bb-97d6-45a1-b9f0-e58c6936e45f	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	14		0	17	17	1
211	2021-08-17 07:15:53.536014+00	2021-08-17 07:15:53.538678+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "e098ff2c-0cc7-4fa4-ac6b-c3749ed06769", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-d907-6799-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-d907-6799-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_15_ewsgoefo/awx_15_8r8m9hjb/project/project_update.yml:162", "host": "localhost", "uuid": "1b3eb769-ec65-4d3f-b126-c31618e9061c"}	f	f	1b3eb769-ec65-4d3f-b126-c31618e9061c	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	14		0	17	17	15
234	2021-08-17 07:15:56.574699+00	2021-08-17 07:15:56.579023+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "b015f3c4-357b-4a03-970a-86ca8efae653", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-b443-2c62-000000000006", "play_pattern": "localhost", "task": "update project using git", "task_uuid": "0242ac12-0005-b443-2c62-00000000000a", "task_action": "git", "task_args": "", "task_path": "/tmp/bwrap_16_xquwi25g/awx_16_yv8gg_96/project/project_update.yml:34", "name": "update project using git", "is_conditional": false, "uuid": "0242ac12-0005-b443-2c62-00000000000a"}	f	f	0242ac12-0005-b443-2c62-00000000000a	project_update.yml	Update source tree if necessary		update project using git	3	\r\nTASK [update project using git] ************************************************	0	2	4	16
257	2021-08-17 07:15:59.747127+00	2021-08-17 07:15:59.748599+00	runner_item_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "b015f3c4-357b-4a03-970a-86ca8efae653", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-b443-2c62-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-b443-2c62-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_16_xquwi25g/awx_16_yv8gg_96/project/project_update.yml:188", "host": "localhost", "res": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yaml"}}, "uuid": "edb4bad4-a626-40f0-8ec8-c4ca0e3f829f"}	f	f	edb4bad4-a626-40f0-8ec8-c4ca0e3f829f	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	26	[0;32mok: [localhost] => (item={'ext': '.yaml'})[0m	0	26	27	16
279	2021-08-17 07:16:03.775744+00	2021-08-17 07:16:03.777787+00	runner_item_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "7a91cb39-1634-4325-9545-e05a1718df76", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-c9e0-8ff4-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-c9e0-8ff4-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_17_cnh8436b/awx_17_njz3midn/project/project_update.yml:162", "host": "localhost", "res": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yml"}}, "uuid": "32416beb-465f-4103-a0ad-b604c7fcaa95"}	f	f	32416beb-465f-4103-a0ad-b604c7fcaa95	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	15	[0;32mok: [localhost] => (item={'ext': '.yml'})[0m	0	17	18	17
300	2021-08-17 07:16:07.708074+00	2021-08-17 07:16:07.710353+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "9423ec19-3f36-4b3c-9c49-1a4429dcbbd0", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-4b9d-ad82-000000000006", "play_pattern": "localhost", "task": "update project using git", "task_uuid": "0242ac12-0005-4b9d-ad82-00000000000a", "task_action": "git", "task_args": "", "task_path": "/tmp/bwrap_18_o_rdcv1n/awx_18_mry1qamd/project/project_update.yml:34", "name": "update project using git", "is_conditional": false, "uuid": "0242ac12-0005-4b9d-ad82-00000000000a"}	f	f	0242ac12-0005-4b9d-ad82-00000000000a	project_update.yml	Update source tree if necessary		update project using git	3	\r\nTASK [update project using git] ************************************************	0	2	4	18
315	2021-08-17 07:16:10.489499+00	2021-08-17 07:16:10.492315+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "9423ec19-3f36-4b3c-9c49-1a4429dcbbd0", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-4b9d-ad82-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-4b9d-ad82-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_18_o_rdcv1n/awx_18_mry1qamd/project/project_update.yml:168", "host": "localhost", "uuid": "eecf0d8a-1ba1-4d39-820e-9e60bacf03f7"}	f	f	eecf0d8a-1ba1-4d39-820e-9e60bacf03f7	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	19		0	21	21	18
327	2021-08-17 07:16:11.458506+00	2021-08-17 07:16:11.461852+00	runner_item_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "9423ec19-3f36-4b3c-9c49-1a4429dcbbd0", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-4b9d-ad82-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-4b9d-ad82-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_18_o_rdcv1n/awx_18_mry1qamd/project/project_update.yml:194", "host": "localhost", "res": {"changed": false, "skip_reason": "Conditional result was False", "_ansible_no_log": false, "item": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_8__createfile/collections/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item"}, "ansible_loop_var": "item", "_ansible_item_label": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_8__createfile/collections/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item"}}, "uuid": "376fc76b-1f85-4cf0-9a97-2d8b5c227db2"}	f	f	376fc76b-1f85-4cf0-9a97-2d8b5c227db2	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	30	[0;36mskipping: [localhost] => (item={'changed': False, 'stat': {'exists': False}, 'invocation': {'module_args': {'path': '/var/lib/awx/projects/_8__createfile/collections/requirements.yml', 'follow': False, 'get_md5': False, 'get_checksum': True, 'get_mime': True, 'get_attributes': True, 'checksum_algorithm': 'sha1'}}, 'failed': False, 'item': {'ext': '.yml'}, 'ansible_loop_var': 'item'}) [0m	0	29	30	18
15	2021-08-17 04:44:42.75431+00	2021-08-17 04:44:42.756008+00	runner_item_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "b5beb502-8c90-4efb-9ffc-557935a5835d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-925e-954a-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-925e-954a-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_1_nbx_idbg/awx_1_yb8lwdax/project/project_update.yml:162", "host": "localhost", "res": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_6__demo_project/roles/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yml"}}, "uuid": "0f13cf51-dbfa-45dd-8ab8-2722f9143337"}	f	f	0f13cf51-dbfa-45dd-8ab8-2722f9143337	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	15	[0;32mok: [localhost] => (item={'ext': '.yml'})[0m	0	17	18	1
212	2021-08-17 07:15:53.535462+00	2021-08-17 07:15:53.53914+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "e098ff2c-0cc7-4fa4-ac6b-c3749ed06769", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-d907-6799-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-d907-6799-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_15_ewsgoefo/awx_15_8r8m9hjb/project/project_update.yml:162", "name": "detect roles/requirements.(yml/yaml)", "is_conditional": false, "uuid": "0242ac12-0005-d907-6799-00000000001f"}	f	f	0242ac12-0005-d907-6799-00000000001f	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	13	\r\nTASK [detect roles/requirements.(yml/yaml)] ************************************	0	15	17	15
235	2021-08-17 07:15:56.57539+00	2021-08-17 07:15:56.579804+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "b015f3c4-357b-4a03-970a-86ca8efae653", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-b443-2c62-000000000006", "play_pattern": "localhost", "task": "update project using git", "task_uuid": "0242ac12-0005-b443-2c62-00000000000a", "task_action": "git", "task_args": "", "task_path": "/tmp/bwrap_16_xquwi25g/awx_16_yv8gg_96/project/project_update.yml:34", "host": "localhost", "uuid": "c4e33058-0b77-4d62-9a9d-a9a9323efe99"}	f	f	c4e33058-0b77-4d62-9a9d-a9a9323efe99	project_update.yml	Update source tree if necessary		update project using git	4		0	4	4	16
258	2021-08-17 07:15:59.748078+00	2021-08-17 07:15:59.751301+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "b015f3c4-357b-4a03-970a-86ca8efae653", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-b443-2c62-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-b443-2c62-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_16_xquwi25g/awx_16_yv8gg_96/project/project_update.yml:188", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"results": [{"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yml"}}, {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yaml"}}], "msg": "All items completed", "changed": false}, "start": "2021-08-17T07:15:59.199765", "end": "2021-08-17T07:15:59.747942", "duration": 0.548177, "event_loop": "items", "uuid": "85f12427-f815-4e15-8e8d-b94c659e8ac9"}	f	f	85f12427-f815-4e15-8e8d-b94c659e8ac9	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	27		0	27	27	16
280	2021-08-17 07:16:03.94339+00	2021-08-17 07:16:03.945715+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "7a91cb39-1634-4325-9545-e05a1718df76", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-c9e0-8ff4-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-c9e0-8ff4-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_17_cnh8436b/awx_17_njz3midn/project/project_update.yml:162", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"results": [{"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yml"}}, {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yaml"}}], "msg": "All items completed", "changed": false}, "start": "2021-08-17T07:16:03.302304", "end": "2021-08-17T07:16:03.943291", "duration": 0.640987, "event_loop": "items", "uuid": "024ce4d8-01b2-4b6d-83c4-3cee11698265"}	f	f	024ce4d8-01b2-4b6d-83c4-3cee11698265	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	17		0	19	19	17
301	2021-08-17 07:16:07.708763+00	2021-08-17 07:16:07.712539+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "9423ec19-3f36-4b3c-9c49-1a4429dcbbd0", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-4b9d-ad82-000000000006", "play_pattern": "localhost", "task": "update project using git", "task_uuid": "0242ac12-0005-4b9d-ad82-00000000000a", "task_action": "git", "task_args": "", "task_path": "/tmp/bwrap_18_o_rdcv1n/awx_18_mry1qamd/project/project_update.yml:34", "host": "localhost", "uuid": "358bd863-e573-4ba4-8399-199191858792"}	f	f	358bd863-e573-4ba4-8399-199191858792	project_update.yml	Update source tree if necessary		update project using git	4		0	4	4	18
329	2021-08-17 07:16:11.471298+00	2021-08-17 07:16:11.478022+00	playbook_on_stats	{"playbook": "project_update.yml", "playbook_uuid": "9423ec19-3f36-4b3c-9c49-1a4429dcbbd0", "changed": {"localhost": 1}, "dark": {}, "failures": {}, "ignored": {}, "ok": {"localhost": 5}, "processed": {"localhost": 1}, "rescued": {}, "skipped": {"localhost": 2}, "artifact_data": {}, "uuid": "e8f26036-e032-4db4-a082-23b07889a7ae"}	f	t	e8f26036-e032-4db4-a082-23b07889a7ae	project_update.yml				33	\r\nPLAY RECAP *********************************************************************\r\n[0;33mlocalhost[0m                  : [0;32mok=5   [0m [0;33mchanged=1   [0m unreachable=0    failed=0    [0;36mskipped=2   [0m rescued=0    ignored=0   \r\n	0	31	35	18
16	2021-08-17 04:44:42.91904+00	2021-08-17 04:44:42.921001+00	runner_item_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "b5beb502-8c90-4efb-9ffc-557935a5835d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-925e-954a-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-925e-954a-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_1_nbx_idbg/awx_1_yb8lwdax/project/project_update.yml:162", "host": "localhost", "res": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_6__demo_project/roles/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yaml"}}, "uuid": "91c98fb3-3632-45d8-97a6-64cfa9bce8e7"}	f	f	91c98fb3-3632-45d8-97a6-64cfa9bce8e7	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	16	[0;32mok: [localhost] => (item={'ext': '.yaml'})[0m	0	18	19	1
213	2021-08-17 07:15:54.001865+00	2021-08-17 07:15:54.004047+00	runner_item_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "e098ff2c-0cc7-4fa4-ac6b-c3749ed06769", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-d907-6799-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-d907-6799-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_15_ewsgoefo/awx_15_8r8m9hjb/project/project_update.yml:162", "host": "localhost", "res": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yml"}}, "uuid": "9f2ea297-922b-4b3f-841c-623bcc2d7e3e"}	f	f	9f2ea297-922b-4b3f-841c-623bcc2d7e3e	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	15	[0;32mok: [localhost] => (item={'ext': '.yml'})[0m	0	17	18	15
236	2021-08-17 07:15:57.979903+00	2021-08-17 07:15:57.984381+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "b015f3c4-357b-4a03-970a-86ca8efae653", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-b443-2c62-000000000006", "play_pattern": "localhost", "task": "update project using git", "task_uuid": "0242ac12-0005-b443-2c62-00000000000a", "task_action": "git", "task_args": "", "task_path": "/tmp/bwrap_16_xquwi25g/awx_16_yv8gg_96/project/project_update.yml:34", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"changed": false, "before": "355d65af0d6cc43865251aea89a57e5c3ae0b282", "remote_url_changed": false, "after": "355d65af0d6cc43865251aea89a57e5c3ae0b282", "invocation": {"module_args": {"dest": "/var/lib/awx/projects/_13__winserver", "repo": "https://$encrypted$:$encrypted$@github.com/rmspavan/AnsibleTower.git", "version": "HEAD", "force": false, "remote": "origin", "clone": true, "update": true, "verify_commit": false, "gpg_whitelist": [], "accept_hostkey": false, "bare": false, "recursive": true, "track_submodules": false, "refspec": null, "reference": null, "depth": null, "key_file": null, "ssh_opts": null, "executable": null, "umask": null, "archive": null, "separate_git_dir": null}}, "_ansible_no_log": false}, "start": "2021-08-17T07:15:56.575315", "end": "2021-08-17T07:15:57.979709", "duration": 1.404394, "event_loop": null, "uuid": "c18a2fef-3be6-47c3-9910-47d920bde779"}	f	f	c18a2fef-3be6-47c3-9910-47d920bde779	project_update.yml	Update source tree if necessary		update project using git	5	[0;32mok: [localhost][0m	0	4	5	16
259	2021-08-17 07:15:59.751961+00	2021-08-17 07:15:59.753772+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "b015f3c4-357b-4a03-970a-86ca8efae653", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-b443-2c62-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-b443-2c62-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_16_xquwi25g/awx_16_yv8gg_96/project/project_update.yml:194", "host": "localhost", "uuid": "45100eaf-978a-46d6-947c-ed287c7074f3"}	f	f	45100eaf-978a-46d6-947c-ed287c7074f3	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	29		0	29	29	16
281	2021-08-17 07:16:03.942362+00	2021-08-17 07:16:03.945593+00	runner_item_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "7a91cb39-1634-4325-9545-e05a1718df76", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-c9e0-8ff4-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-c9e0-8ff4-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_17_cnh8436b/awx_17_njz3midn/project/project_update.yml:162", "host": "localhost", "res": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yaml"}}, "uuid": "af28330c-7aa8-49ee-89f5-9025cb8f6490"}	f	f	af28330c-7aa8-49ee-89f5-9025cb8f6490	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	16	[0;32mok: [localhost] => (item={'ext': '.yaml'})[0m	0	18	19	17
302	2021-08-17 07:16:09.430243+00	2021-08-17 07:16:09.435074+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "9423ec19-3f36-4b3c-9c49-1a4429dcbbd0", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-4b9d-ad82-000000000006", "play_pattern": "localhost", "task": "update project using git", "task_uuid": "0242ac12-0005-4b9d-ad82-00000000000a", "task_action": "git", "task_args": "", "task_path": "/tmp/bwrap_18_o_rdcv1n/awx_18_mry1qamd/project/project_update.yml:34", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"changed": true, "before": "9b2fddce42287306690205513cd5b591ee005035", "remote_url_changed": false, "after": "355d65af0d6cc43865251aea89a57e5c3ae0b282", "invocation": {"module_args": {"dest": "/var/lib/awx/projects/_8__createfile", "repo": "https://$encrypted$:$encrypted$@github.com/rmspavan/AnsibleTower.git", "version": "HEAD", "force": false, "remote": "origin", "clone": true, "update": true, "verify_commit": false, "gpg_whitelist": [], "accept_hostkey": false, "bare": false, "recursive": true, "track_submodules": false, "refspec": null, "reference": null, "depth": null, "key_file": null, "ssh_opts": null, "executable": null, "umask": null, "archive": null, "separate_git_dir": null}}, "_ansible_no_log": false}, "start": "2021-08-17T07:16:07.708688", "end": "2021-08-17T07:16:09.429996", "duration": 1.721308, "event_loop": null, "uuid": "233ef829-7c43-43fe-b120-69c15c721d7c"}	f	t	233ef829-7c43-43fe-b120-69c15c721d7c	project_update.yml	Update source tree if necessary		update project using git	5	[0;33mchanged: [localhost][0m	0	4	5	18
17	2021-08-17 04:44:42.919941+00	2021-08-17 04:44:42.921713+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "b5beb502-8c90-4efb-9ffc-557935a5835d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-925e-954a-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-925e-954a-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_1_nbx_idbg/awx_1_yb8lwdax/project/project_update.yml:162", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"results": [{"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_6__demo_project/roles/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yml"}}, {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_6__demo_project/roles/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yaml"}}], "msg": "All items completed", "changed": false}, "start": "2021-08-17T04:44:42.260905", "end": "2021-08-17T04:44:42.919845", "duration": 0.65894, "event_loop": "items", "uuid": "8d134d44-d313-43ee-8ae1-8e9675465c7c"}	f	f	8d134d44-d313-43ee-8ae1-8e9675465c7c	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	17		0	19	19	1
214	2021-08-17 07:15:54.16595+00	2021-08-17 07:15:54.168034+00	runner_item_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "e098ff2c-0cc7-4fa4-ac6b-c3749ed06769", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-d907-6799-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-d907-6799-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_15_ewsgoefo/awx_15_8r8m9hjb/project/project_update.yml:162", "host": "localhost", "res": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yaml"}}, "uuid": "3cb18434-6147-4000-9ee8-8c11f99236d7"}	f	f	3cb18434-6147-4000-9ee8-8c11f99236d7	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	16	[0;32mok: [localhost] => (item={'ext': '.yaml'})[0m	0	18	19	15
237	2021-08-17 07:15:57.984741+00	2021-08-17 07:15:57.986081+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "b015f3c4-357b-4a03-970a-86ca8efae653", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-b443-2c62-000000000006", "play_pattern": "localhost", "task": "Set the git repository version", "task_uuid": "0242ac12-0005-b443-2c62-00000000000b", "task_action": "set_fact", "task_args": "", "task_path": "/tmp/bwrap_16_xquwi25g/awx_16_yv8gg_96/project/project_update.yml:44", "name": "Set the git repository version", "is_conditional": false, "uuid": "0242ac12-0005-b443-2c62-00000000000b"}	f	f	0242ac12-0005-b443-2c62-00000000000b	project_update.yml	Update source tree if necessary		Set the git repository version	6	\r\nTASK [Set the git repository version] ******************************************	0	5	7	16
260	2021-08-17 07:15:59.751339+00	2021-08-17 07:15:59.753876+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "b015f3c4-357b-4a03-970a-86ca8efae653", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-b443-2c62-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-b443-2c62-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_16_xquwi25g/awx_16_yv8gg_96/project/project_update.yml:194", "name": "fetch galaxy collections from collections/requirements.(yml/yaml)", "is_conditional": false, "uuid": "0242ac12-0005-b443-2c62-000000000023"}	f	f	0242ac12-0005-b443-2c62-000000000023	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	28	\r\nTASK [fetch galaxy collections from collections/requirements.(yml/yaml)] *******	0	27	29	16
282	2021-08-17 07:16:03.947212+00	2021-08-17 07:16:03.94865+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "7a91cb39-1634-4325-9545-e05a1718df76", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-c9e0-8ff4-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-c9e0-8ff4-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_17_cnh8436b/awx_17_njz3midn/project/project_update.yml:168", "name": "fetch galaxy roles from requirements.(yml/yaml)", "is_conditional": false, "uuid": "0242ac12-0005-c9e0-8ff4-000000000020"}	f	f	0242ac12-0005-c9e0-8ff4-000000000020	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	18	\r\nTASK [fetch galaxy roles from requirements.(yml/yaml)] *************************	0	19	21	17
303	2021-08-17 07:16:09.435126+00	2021-08-17 07:16:09.440573+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "9423ec19-3f36-4b3c-9c49-1a4429dcbbd0", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-4b9d-ad82-000000000006", "play_pattern": "localhost", "task": "Set the git repository version", "task_uuid": "0242ac12-0005-4b9d-ad82-00000000000b", "task_action": "set_fact", "task_args": "", "task_path": "/tmp/bwrap_18_o_rdcv1n/awx_18_mry1qamd/project/project_update.yml:44", "host": "localhost", "uuid": "b28f369f-b0dc-4d55-85b3-64da243ea59f"}	f	f	b28f369f-b0dc-4d55-85b3-64da243ea59f	project_update.yml	Update source tree if necessary		Set the git repository version	7		0	7	7	18
316	2021-08-17 07:16:10.488695+00	2021-08-17 07:16:10.490289+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "9423ec19-3f36-4b3c-9c49-1a4429dcbbd0", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-4b9d-ad82-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-4b9d-ad82-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_18_o_rdcv1n/awx_18_mry1qamd/project/project_update.yml:168", "name": "fetch galaxy roles from requirements.(yml/yaml)", "is_conditional": false, "uuid": "0242ac12-0005-4b9d-ad82-000000000020"}	f	f	0242ac12-0005-4b9d-ad82-000000000020	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	18	\r\nTASK [fetch galaxy roles from requirements.(yml/yaml)] *************************	0	19	21	18
18	2021-08-17 04:44:42.960278+00	2021-08-17 04:44:42.962154+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "b5beb502-8c90-4efb-9ffc-557935a5835d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-925e-954a-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-925e-954a-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_1_nbx_idbg/awx_1_yb8lwdax/project/project_update.yml:168", "host": "localhost", "uuid": "05ba5f18-e0e4-497f-b83c-b657652eb99f"}	f	f	05ba5f18-e0e4-497f-b83c-b657652eb99f	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	19		0	21	21	1
215	2021-08-17 07:15:54.171141+00	2021-08-17 07:15:54.172525+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "e098ff2c-0cc7-4fa4-ac6b-c3749ed06769", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-d907-6799-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-d907-6799-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_15_ewsgoefo/awx_15_8r8m9hjb/project/project_update.yml:168", "host": "localhost", "uuid": "664c16f4-8634-4cbf-93e2-bb18ea666d09"}	f	f	664c16f4-8634-4cbf-93e2-bb18ea666d09	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	19		0	21	21	15
238	2021-08-17 07:15:57.985565+00	2021-08-17 07:15:57.988437+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "b015f3c4-357b-4a03-970a-86ca8efae653", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-b443-2c62-000000000006", "play_pattern": "localhost", "task": "Set the git repository version", "task_uuid": "0242ac12-0005-b443-2c62-00000000000b", "task_action": "set_fact", "task_args": "", "task_path": "/tmp/bwrap_16_xquwi25g/awx_16_yv8gg_96/project/project_update.yml:44", "host": "localhost", "uuid": "2ed1a0ae-ae38-4449-a45d-f623e552f8ca"}	f	f	2ed1a0ae-ae38-4449-a45d-f623e552f8ca	project_update.yml	Update source tree if necessary		Set the git repository version	7		0	7	7	16
261	2021-08-17 07:15:59.961097+00	2021-08-17 07:15:59.962813+00	runner_item_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "b015f3c4-357b-4a03-970a-86ca8efae653", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-b443-2c62-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-b443-2c62-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_16_xquwi25g/awx_16_yv8gg_96/project/project_update.yml:194", "host": "localhost", "res": {"changed": false, "skip_reason": "Conditional result was False", "_ansible_no_log": false, "item": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item"}, "ansible_loop_var": "item", "_ansible_item_label": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item"}}, "uuid": "87182209-c375-4e14-ab00-5413020de55f"}	f	f	87182209-c375-4e14-ab00-5413020de55f	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	30	[0;36mskipping: [localhost] => (item={'changed': False, 'stat': {'exists': False}, 'invocation': {'module_args': {'path': '/var/lib/awx/projects/_13__winserver/collections/requirements.yml', 'follow': False, 'get_md5': False, 'get_checksum': True, 'get_mime': True, 'get_attributes': True, 'checksum_algorithm': 'sha1'}}, 'failed': False, 'item': {'ext': '.yml'}, 'ansible_loop_var': 'item'}) [0m	0	29	30	16
283	2021-08-17 07:16:03.948034+00	2021-08-17 07:16:03.951014+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "7a91cb39-1634-4325-9545-e05a1718df76", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-c9e0-8ff4-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-c9e0-8ff4-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_17_cnh8436b/awx_17_njz3midn/project/project_update.yml:168", "host": "localhost", "uuid": "027b1fef-ad44-402c-adf3-a206c7f844af"}	f	f	027b1fef-ad44-402c-adf3-a206c7f844af	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	19		0	21	21	17
304	2021-08-17 07:16:09.434305+00	2021-08-17 07:16:09.439686+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "9423ec19-3f36-4b3c-9c49-1a4429dcbbd0", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-4b9d-ad82-000000000006", "play_pattern": "localhost", "task": "Set the git repository version", "task_uuid": "0242ac12-0005-4b9d-ad82-00000000000b", "task_action": "set_fact", "task_args": "", "task_path": "/tmp/bwrap_18_o_rdcv1n/awx_18_mry1qamd/project/project_update.yml:44", "name": "Set the git repository version", "is_conditional": false, "uuid": "0242ac12-0005-4b9d-ad82-00000000000b"}	f	f	0242ac12-0005-4b9d-ad82-00000000000b	project_update.yml	Update source tree if necessary		Set the git repository version	6	\r\nTASK [Set the git repository version] ******************************************	0	5	7	18
317	2021-08-17 07:16:10.693898+00	2021-08-17 07:16:10.695643+00	runner_item_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "9423ec19-3f36-4b3c-9c49-1a4429dcbbd0", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-4b9d-ad82-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-4b9d-ad82-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_18_o_rdcv1n/awx_18_mry1qamd/project/project_update.yml:168", "host": "localhost", "res": {"changed": false, "skip_reason": "Conditional result was False", "_ansible_no_log": false, "item": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_8__createfile/roles/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item"}, "ansible_loop_var": "item", "_ansible_item_label": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_8__createfile/roles/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item"}}, "uuid": "d542935f-4cb0-4a1b-82c6-be5b06ba234c"}	f	f	d542935f-4cb0-4a1b-82c6-be5b06ba234c	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	20	[0;36mskipping: [localhost] => (item={'changed': False, 'stat': {'exists': False}, 'invocation': {'module_args': {'path': '/var/lib/awx/projects/_8__createfile/roles/requirements.yml', 'follow': False, 'get_md5': False, 'get_checksum': True, 'get_mime': True, 'get_attributes': True, 'checksum_algorithm': 'sha1'}}, 'failed': False, 'item': {'ext': '.yml'}, 'ansible_loop_var': 'item'}) [0m	0	21	22	18
330	2021-08-17 07:16:11.468474+00	2021-08-17 07:16:11.472566+00	runner_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "9423ec19-3f36-4b3c-9c49-1a4429dcbbd0", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-4b9d-ad82-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-4b9d-ad82-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_18_o_rdcv1n/awx_18_mry1qamd/project/project_update.yml:194", "host": "localhost", "remote_addr": "127.0.0.1", "start": "2021-08-17T07:16:11.248797", "end": "2021-08-17T07:16:11.468385", "duration": 0.219588, "event_loop": "items", "uuid": "bc2d863d-f99f-4988-a4f7-ad7a28e449a6"}	f	f	bc2d863d-f99f-4988-a4f7-ad7a28e449a6	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	32		0	31	31	18
19	2021-08-17 04:44:42.959456+00	2021-08-17 04:44:42.960755+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "b5beb502-8c90-4efb-9ffc-557935a5835d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-925e-954a-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-925e-954a-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_1_nbx_idbg/awx_1_yb8lwdax/project/project_update.yml:168", "name": "fetch galaxy roles from requirements.(yml/yaml)", "is_conditional": false, "uuid": "0242ac12-0005-925e-954a-000000000020"}	f	f	0242ac12-0005-925e-954a-000000000020	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	18	\r\nTASK [fetch galaxy roles from requirements.(yml/yaml)] *************************	0	19	21	1
216	2021-08-17 07:15:54.170314+00	2021-08-17 07:15:54.172475+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "e098ff2c-0cc7-4fa4-ac6b-c3749ed06769", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-d907-6799-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-d907-6799-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_15_ewsgoefo/awx_15_8r8m9hjb/project/project_update.yml:168", "name": "fetch galaxy roles from requirements.(yml/yaml)", "is_conditional": false, "uuid": "0242ac12-0005-d907-6799-000000000020"}	f	f	0242ac12-0005-d907-6799-000000000020	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	18	\r\nTASK [fetch galaxy roles from requirements.(yml/yaml)] *************************	0	19	21	15
239	2021-08-17 07:15:58.156434+00	2021-08-17 07:15:58.158008+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "b015f3c4-357b-4a03-970a-86ca8efae653", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-b443-2c62-000000000006", "play_pattern": "localhost", "task": "Set the git repository version", "task_uuid": "0242ac12-0005-b443-2c62-00000000000b", "task_action": "set_fact", "task_args": "", "task_path": "/tmp/bwrap_16_xquwi25g/awx_16_yv8gg_96/project/project_update.yml:44", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"changed": false, "ansible_facts": {"scm_version": "355d65af0d6cc43865251aea89a57e5c3ae0b282"}, "_ansible_no_log": false}, "start": "2021-08-17T07:15:57.985487", "end": "2021-08-17T07:15:58.156228", "duration": 0.170741, "event_loop": null, "uuid": "775a97eb-defc-4e1a-a331-fa3027cef57c"}	f	f	775a97eb-defc-4e1a-a331-fa3027cef57c	project_update.yml	Update source tree if necessary		Set the git repository version	8	[0;32mok: [localhost][0m	0	7	8	16
262	2021-08-17 07:15:59.971124+00	2021-08-17 07:15:59.974163+00	runner_item_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "b015f3c4-357b-4a03-970a-86ca8efae653", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-b443-2c62-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-b443-2c62-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_16_xquwi25g/awx_16_yv8gg_96/project/project_update.yml:194", "host": "localhost", "res": {"changed": false, "skip_reason": "Conditional result was False", "_ansible_no_log": false, "item": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item"}, "ansible_loop_var": "item", "_ansible_item_label": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item"}}, "uuid": "db7fb319-d47a-4bdf-83e9-b3f7b441a603"}	f	f	db7fb319-d47a-4bdf-83e9-b3f7b441a603	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	31	[0;36mskipping: [localhost] => (item={'changed': False, 'stat': {'exists': False}, 'invocation': {'module_args': {'path': '/var/lib/awx/projects/_13__winserver/collections/requirements.yaml', 'follow': False, 'get_md5': False, 'get_checksum': True, 'get_mime': True, 'get_attributes': True, 'checksum_algorithm': 'sha1'}}, 'failed': False, 'item': {'ext': '.yaml'}, 'ansible_loop_var': 'item'}) [0m	0	30	31	16
284	2021-08-17 07:16:04.155566+00	2021-08-17 07:16:04.157727+00	runner_item_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "7a91cb39-1634-4325-9545-e05a1718df76", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-c9e0-8ff4-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-c9e0-8ff4-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_17_cnh8436b/awx_17_njz3midn/project/project_update.yml:168", "host": "localhost", "res": {"changed": false, "skip_reason": "Conditional result was False", "_ansible_no_log": false, "item": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item"}, "ansible_loop_var": "item", "_ansible_item_label": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item"}}, "uuid": "ef5ea714-a32e-427f-9390-84c174234ec4"}	f	f	ef5ea714-a32e-427f-9390-84c174234ec4	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	20	[0;36mskipping: [localhost] => (item={'changed': False, 'stat': {'exists': False}, 'invocation': {'module_args': {'path': '/var/lib/awx/projects/_13__winserver/roles/requirements.yml', 'follow': False, 'get_md5': False, 'get_checksum': True, 'get_mime': True, 'get_attributes': True, 'checksum_algorithm': 'sha1'}}, 'failed': False, 'item': {'ext': '.yml'}, 'ansible_loop_var': 'item'}) [0m	0	21	22	17
305	2021-08-17 07:16:09.638335+00	2021-08-17 07:16:09.640287+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "9423ec19-3f36-4b3c-9c49-1a4429dcbbd0", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-4b9d-ad82-000000000006", "play_pattern": "localhost", "task": "Repository Version", "task_uuid": "0242ac12-0005-4b9d-ad82-00000000001c", "task_action": "debug", "task_args": "", "task_path": "/tmp/bwrap_18_o_rdcv1n/awx_18_mry1qamd/project/project_update.yml:142", "name": "Repository Version", "is_conditional": false, "uuid": "0242ac12-0005-4b9d-ad82-00000000001c"}	f	f	0242ac12-0005-4b9d-ad82-00000000001c	project_update.yml	Update source tree if necessary		Repository Version	9	\r\nTASK [Repository Version] ******************************************************	0	8	10	18
318	2021-08-17 07:16:10.700726+00	2021-08-17 07:16:10.703608+00	runner_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "9423ec19-3f36-4b3c-9c49-1a4429dcbbd0", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-4b9d-ad82-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-4b9d-ad82-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_18_o_rdcv1n/awx_18_mry1qamd/project/project_update.yml:168", "host": "localhost", "remote_addr": "127.0.0.1", "start": "2021-08-17T07:16:10.489420", "end": "2021-08-17T07:16:10.700636", "duration": 0.211216, "event_loop": "items", "uuid": "a8c6b832-3a13-4ff4-8450-e5047ae1d59b"}	f	f	a8c6b832-3a13-4ff4-8450-e5047ae1d59b	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	22		0	23	23	18
331	2021-08-17 07:16:12.540542+00	2021-08-17 07:16:12.542284+00	playbook_on_start	{"playbook": "project_update.yml", "playbook_uuid": "48221bd1-55e7-40c7-9019-5e5e9e53acd3", "uuid": "48221bd1-55e7-40c7-9019-5e5e9e53acd3"}	f	f	48221bd1-55e7-40c7-9019-5e5e9e53acd3	project_update.yml				1		0	0	0	19
20	2021-08-17 04:44:43.165012+00	2021-08-17 04:44:43.16703+00	runner_item_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "b5beb502-8c90-4efb-9ffc-557935a5835d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-925e-954a-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-925e-954a-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_1_nbx_idbg/awx_1_yb8lwdax/project/project_update.yml:168", "host": "localhost", "res": {"changed": false, "skip_reason": "Conditional result was False", "_ansible_no_log": false, "item": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_6__demo_project/roles/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item"}, "ansible_loop_var": "item", "_ansible_item_label": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_6__demo_project/roles/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item"}}, "uuid": "45342df8-b85c-4344-aae2-9117bda00c69"}	f	f	45342df8-b85c-4344-aae2-9117bda00c69	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	20	[0;36mskipping: [localhost] => (item={'changed': False, 'stat': {'exists': False}, 'invocation': {'module_args': {'path': '/var/lib/awx/projects/_6__demo_project/roles/requirements.yml', 'follow': False, 'get_md5': False, 'get_checksum': True, 'get_mime': True, 'get_attributes': True, 'checksum_algorithm': 'sha1'}}, 'failed': False, 'item': {'ext': '.yml'}, 'ansible_loop_var': 'item'}) [0m	0	21	22	1
217	2021-08-17 07:15:54.166831+00	2021-08-17 07:15:54.168463+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "e098ff2c-0cc7-4fa4-ac6b-c3749ed06769", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-d907-6799-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-d907-6799-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_15_ewsgoefo/awx_15_8r8m9hjb/project/project_update.yml:162", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"results": [{"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yml"}}, {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yaml"}}], "msg": "All items completed", "changed": false}, "start": "2021-08-17T07:15:53.535941", "end": "2021-08-17T07:15:54.166736", "duration": 0.630795, "event_loop": "items", "uuid": "5dc17abb-023d-4538-8792-ef47dbb17aba"}	f	f	5dc17abb-023d-4538-8792-ef47dbb17aba	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	17		0	19	19	15
240	2021-08-17 07:15:58.160084+00	2021-08-17 07:15:58.161691+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "b015f3c4-357b-4a03-970a-86ca8efae653", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-b443-2c62-000000000006", "play_pattern": "localhost", "task": "Repository Version", "task_uuid": "0242ac12-0005-b443-2c62-00000000001c", "task_action": "debug", "task_args": "", "task_path": "/tmp/bwrap_16_xquwi25g/awx_16_yv8gg_96/project/project_update.yml:142", "name": "Repository Version", "is_conditional": false, "uuid": "0242ac12-0005-b443-2c62-00000000001c"}	f	f	0242ac12-0005-b443-2c62-00000000001c	project_update.yml	Update source tree if necessary		Repository Version	9	\r\nTASK [Repository Version] ******************************************************	0	8	10	16
263	2021-08-17 07:15:59.972084+00	2021-08-17 07:15:59.974667+00	runner_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "b015f3c4-357b-4a03-970a-86ca8efae653", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-b443-2c62-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-b443-2c62-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_16_xquwi25g/awx_16_yv8gg_96/project/project_update.yml:194", "host": "localhost", "remote_addr": "127.0.0.1", "start": "2021-08-17T07:15:59.751884", "end": "2021-08-17T07:15:59.971994", "duration": 0.22011, "event_loop": "items", "uuid": "12a934a9-61ff-4dc1-b2f3-90f52dfbe35d"}	f	f	12a934a9-61ff-4dc1-b2f3-90f52dfbe35d	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	32		0	31	31	16
285	2021-08-17 07:16:04.162086+00	2021-08-17 07:16:04.168726+00	runner_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "7a91cb39-1634-4325-9545-e05a1718df76", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-c9e0-8ff4-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-c9e0-8ff4-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_17_cnh8436b/awx_17_njz3midn/project/project_update.yml:168", "host": "localhost", "remote_addr": "127.0.0.1", "start": "2021-08-17T07:16:03.947954", "end": "2021-08-17T07:16:04.161965", "duration": 0.214011, "event_loop": "items", "uuid": "2c86189f-9ffc-47bf-bd80-8a6324a465c5"}	f	f	2c86189f-9ffc-47bf-bd80-8a6324a465c5	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	22		0	23	23	17
306	2021-08-17 07:16:09.639349+00	2021-08-17 07:16:09.640692+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "9423ec19-3f36-4b3c-9c49-1a4429dcbbd0", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-4b9d-ad82-000000000006", "play_pattern": "localhost", "task": "Repository Version", "task_uuid": "0242ac12-0005-4b9d-ad82-00000000001c", "task_action": "debug", "task_args": "", "task_path": "/tmp/bwrap_18_o_rdcv1n/awx_18_mry1qamd/project/project_update.yml:142", "host": "localhost", "uuid": "47c9413f-de0d-4a90-830e-8d3917c34f39"}	f	f	47c9413f-de0d-4a90-830e-8d3917c34f39	project_update.yml	Update source tree if necessary		Repository Version	10		0	10	10	18
319	2021-08-17 07:16:10.699792+00	2021-08-17 07:16:10.702665+00	runner_item_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "9423ec19-3f36-4b3c-9c49-1a4429dcbbd0", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-4b9d-ad82-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-4b9d-ad82-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_18_o_rdcv1n/awx_18_mry1qamd/project/project_update.yml:168", "host": "localhost", "res": {"changed": false, "skip_reason": "Conditional result was False", "_ansible_no_log": false, "item": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_8__createfile/roles/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item"}, "ansible_loop_var": "item", "_ansible_item_label": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_8__createfile/roles/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item"}}, "uuid": "170bd186-b37d-4ee9-9dbe-aa3c41774bb4"}	f	f	170bd186-b37d-4ee9-9dbe-aa3c41774bb4	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	21	[0;36mskipping: [localhost] => (item={'changed': False, 'stat': {'exists': False}, 'invocation': {'module_args': {'path': '/var/lib/awx/projects/_8__createfile/roles/requirements.yaml', 'follow': False, 'get_md5': False, 'get_checksum': True, 'get_mime': True, 'get_attributes': True, 'checksum_algorithm': 'sha1'}}, 'failed': False, 'item': {'ext': '.yaml'}, 'ansible_loop_var': 'item'}) [0m	0	22	23	18
21	2021-08-17 04:44:43.170056+00	2021-08-17 04:44:43.173834+00	runner_item_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "b5beb502-8c90-4efb-9ffc-557935a5835d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-925e-954a-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-925e-954a-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_1_nbx_idbg/awx_1_yb8lwdax/project/project_update.yml:168", "host": "localhost", "res": {"changed": false, "skip_reason": "Conditional result was False", "_ansible_no_log": false, "item": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_6__demo_project/roles/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item"}, "ansible_loop_var": "item", "_ansible_item_label": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_6__demo_project/roles/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item"}}, "uuid": "221a13ba-de65-4681-b716-a25a79763c68"}	f	f	221a13ba-de65-4681-b716-a25a79763c68	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	21	[0;36mskipping: [localhost] => (item={'changed': False, 'stat': {'exists': False}, 'invocation': {'module_args': {'path': '/var/lib/awx/projects/_6__demo_project/roles/requirements.yaml', 'follow': False, 'get_md5': False, 'get_checksum': True, 'get_mime': True, 'get_attributes': True, 'checksum_algorithm': 'sha1'}}, 'failed': False, 'item': {'ext': '.yaml'}, 'ansible_loop_var': 'item'}) [0m	0	22	23	1
218	2021-08-17 07:15:54.374959+00	2021-08-17 07:15:54.376774+00	runner_item_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "e098ff2c-0cc7-4fa4-ac6b-c3749ed06769", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-d907-6799-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-d907-6799-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_15_ewsgoefo/awx_15_8r8m9hjb/project/project_update.yml:168", "host": "localhost", "res": {"changed": false, "skip_reason": "Conditional result was False", "_ansible_no_log": false, "item": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item"}, "ansible_loop_var": "item", "_ansible_item_label": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item"}}, "uuid": "4154bcab-32ca-4aae-b3a4-3cf8d6505937"}	f	f	4154bcab-32ca-4aae-b3a4-3cf8d6505937	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	20	[0;36mskipping: [localhost] => (item={'changed': False, 'stat': {'exists': False}, 'invocation': {'module_args': {'path': '/var/lib/awx/projects/_13__winserver/roles/requirements.yml', 'follow': False, 'get_md5': False, 'get_checksum': True, 'get_mime': True, 'get_attributes': True, 'checksum_algorithm': 'sha1'}}, 'failed': False, 'item': {'ext': '.yml'}, 'ansible_loop_var': 'item'}) [0m	0	21	22	15
241	2021-08-17 07:15:58.160878+00	2021-08-17 07:15:58.162841+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "b015f3c4-357b-4a03-970a-86ca8efae653", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-b443-2c62-000000000006", "play_pattern": "localhost", "task": "Repository Version", "task_uuid": "0242ac12-0005-b443-2c62-00000000001c", "task_action": "debug", "task_args": "", "task_path": "/tmp/bwrap_16_xquwi25g/awx_16_yv8gg_96/project/project_update.yml:142", "host": "localhost", "uuid": "219674eb-72c5-49cf-90c3-63f5124016de"}	f	f	219674eb-72c5-49cf-90c3-63f5124016de	project_update.yml	Update source tree if necessary		Repository Version	10		0	10	10	16
264	2021-08-17 07:15:59.975002+00	2021-08-17 07:15:59.977323+00	playbook_on_stats	{"playbook": "project_update.yml", "playbook_uuid": "b015f3c4-357b-4a03-970a-86ca8efae653", "changed": {}, "dark": {}, "failures": {}, "ignored": {}, "ok": {"localhost": 5}, "processed": {"localhost": 1}, "rescued": {}, "skipped": {"localhost": 2}, "artifact_data": {}, "uuid": "781c8cf3-c28e-40ea-ad96-3d36c6c3329a"}	f	f	781c8cf3-c28e-40ea-ad96-3d36c6c3329a	project_update.yml				33	\r\nPLAY RECAP *********************************************************************\r\n[0;32mlocalhost[0m                  : [0;32mok=5   [0m changed=0    unreachable=0    failed=0    [0;36mskipped=2   [0m rescued=0    ignored=0   \r\n	0	31	35	16
286	2021-08-17 07:16:04.165384+00	2021-08-17 07:16:04.167015+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "7a91cb39-1634-4325-9545-e05a1718df76", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-c9e0-8ff4-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-c9e0-8ff4-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_17_cnh8436b/awx_17_njz3midn/project/project_update.yml:188", "name": "detect collections/requirements.(yml/yaml)", "is_conditional": false, "uuid": "0242ac12-0005-c9e0-8ff4-000000000022"}	f	f	0242ac12-0005-c9e0-8ff4-000000000022	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	23	\r\nTASK [detect collections/requirements.(yml/yaml)] ******************************	0	23	25	17
307	2021-08-17 07:16:09.634632+00	2021-08-17 07:16:09.641029+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "9423ec19-3f36-4b3c-9c49-1a4429dcbbd0", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-4b9d-ad82-000000000006", "play_pattern": "localhost", "task": "Set the git repository version", "task_uuid": "0242ac12-0005-4b9d-ad82-00000000000b", "task_action": "set_fact", "task_args": "", "task_path": "/tmp/bwrap_18_o_rdcv1n/awx_18_mry1qamd/project/project_update.yml:44", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"changed": false, "ansible_facts": {"scm_version": "355d65af0d6cc43865251aea89a57e5c3ae0b282"}, "_ansible_no_log": false}, "start": "2021-08-17T07:16:09.435047", "end": "2021-08-17T07:16:09.634414", "duration": 0.199367, "event_loop": null, "uuid": "14e78f79-66ac-4108-9de5-4dbfaeb54bb5"}	f	f	14e78f79-66ac-4108-9de5-4dbfaeb54bb5	project_update.yml	Update source tree if necessary		Set the git repository version	8	[0;32mok: [localhost][0m	0	7	8	18
320	2021-08-17 07:16:10.703933+00	2021-08-17 07:16:10.70608+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "9423ec19-3f36-4b3c-9c49-1a4429dcbbd0", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-4b9d-ad82-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-4b9d-ad82-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_18_o_rdcv1n/awx_18_mry1qamd/project/project_update.yml:188", "name": "detect collections/requirements.(yml/yaml)", "is_conditional": false, "uuid": "0242ac12-0005-4b9d-ad82-000000000022"}	f	f	0242ac12-0005-4b9d-ad82-000000000022	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	23	\r\nTASK [detect collections/requirements.(yml/yaml)] ******************************	0	23	25	18
332	2021-08-17 07:16:12.553708+00	2021-08-17 07:16:13.608476+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "48221bd1-55e7-40c7-9019-5e5e9e53acd3", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-8926-da79-000000000006", "play_pattern": "localhost", "task": "update project using git", "task_uuid": "0242ac12-0005-8926-da79-00000000000a", "task_action": "git", "task_args": "", "task_path": "/tmp/bwrap_19_qa3qu_ri/awx_19_d93vso43/project/project_update.yml:34", "host": "localhost", "uuid": "cef047ec-f83e-49c7-96b9-1761ade9b0fb"}	f	f	cef047ec-f83e-49c7-96b9-1761ade9b0fb	project_update.yml	Update source tree if necessary		update project using git	4		0	4	4	19
22	2021-08-17 04:44:43.170991+00	2021-08-17 04:44:43.176081+00	runner_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "b5beb502-8c90-4efb-9ffc-557935a5835d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-925e-954a-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-925e-954a-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_1_nbx_idbg/awx_1_yb8lwdax/project/project_update.yml:168", "host": "localhost", "remote_addr": "127.0.0.1", "start": "2021-08-17T04:44:42.960200", "end": "2021-08-17T04:44:43.170898", "duration": 0.210698, "event_loop": "items", "uuid": "c56fb845-3a52-4b7f-95f0-4d1434ba1d5f"}	f	f	c56fb845-3a52-4b7f-95f0-4d1434ba1d5f	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	22		0	23	23	1
219	2021-08-17 07:15:54.380556+00	2021-08-17 07:15:54.384673+00	runner_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "e098ff2c-0cc7-4fa4-ac6b-c3749ed06769", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-d907-6799-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-d907-6799-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_15_ewsgoefo/awx_15_8r8m9hjb/project/project_update.yml:168", "host": "localhost", "remote_addr": "127.0.0.1", "start": "2021-08-17T07:15:54.171063", "end": "2021-08-17T07:15:54.380454", "duration": 0.209391, "event_loop": "items", "uuid": "0e3147df-a944-420a-9a58-648972032e70"}	f	f	0e3147df-a944-420a-9a58-648972032e70	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	22		0	23	23	15
242	2021-08-17 07:15:58.330684+00	2021-08-17 07:15:58.334472+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "b015f3c4-357b-4a03-970a-86ca8efae653", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-b443-2c62-000000000006", "play_pattern": "localhost", "task": "Repository Version", "task_uuid": "0242ac12-0005-b443-2c62-00000000001c", "task_action": "debug", "task_args": "", "task_path": "/tmp/bwrap_16_xquwi25g/awx_16_yv8gg_96/project/project_update.yml:142", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"msg": "Repository Version 355d65af0d6cc43865251aea89a57e5c3ae0b282", "_ansible_verbose_always": true, "_ansible_no_log": false, "changed": false}, "start": "2021-08-17T07:15:58.160800", "end": "2021-08-17T07:15:58.330470", "duration": 0.16967, "event_loop": null, "uuid": "8b2dc3b3-6ed4-48c5-9da1-eca6274dc473"}	f	f	8b2dc3b3-6ed4-48c5-9da1-eca6274dc473	project_update.yml	Update source tree if necessary		Repository Version	11	[0;32mok: [localhost] => {[0m\r\n[0;32m    "msg": "Repository Version 355d65af0d6cc43865251aea89a57e5c3ae0b282"[0m\r\n[0;32m}[0m	0	10	13	16
265	2021-08-17 07:16:01.394756+00	2021-08-17 07:16:01.396504+00	playbook_on_start	{"playbook": "project_update.yml", "playbook_uuid": "7a91cb39-1634-4325-9545-e05a1718df76", "uuid": "7a91cb39-1634-4325-9545-e05a1718df76"}	f	f	7a91cb39-1634-4325-9545-e05a1718df76	project_update.yml				1		0	0	0	17
287	2021-08-17 07:16:04.161138+00	2021-08-17 07:16:04.16713+00	runner_item_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "7a91cb39-1634-4325-9545-e05a1718df76", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-c9e0-8ff4-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-c9e0-8ff4-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_17_cnh8436b/awx_17_njz3midn/project/project_update.yml:168", "host": "localhost", "res": {"changed": false, "skip_reason": "Conditional result was False", "_ansible_no_log": false, "item": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item"}, "ansible_loop_var": "item", "_ansible_item_label": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item"}}, "uuid": "6b7d0d2d-570d-4450-8ef0-928598c49a98"}	f	f	6b7d0d2d-570d-4450-8ef0-928598c49a98	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	21	[0;36mskipping: [localhost] => (item={'changed': False, 'stat': {'exists': False}, 'invocation': {'module_args': {'path': '/var/lib/awx/projects/_13__winserver/roles/requirements.yaml', 'follow': False, 'get_md5': False, 'get_checksum': True, 'get_mime': True, 'get_attributes': True, 'checksum_algorithm': 'sha1'}}, 'failed': False, 'item': {'ext': '.yaml'}, 'ansible_loop_var': 'item'}) [0m	0	22	23	17
308	2021-08-17 07:16:09.838348+00	2021-08-17 07:16:09.841198+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "9423ec19-3f36-4b3c-9c49-1a4429dcbbd0", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-4b9d-ad82-000000000006", "play_pattern": "localhost", "task": "Repository Version", "task_uuid": "0242ac12-0005-4b9d-ad82-00000000001c", "task_action": "debug", "task_args": "", "task_path": "/tmp/bwrap_18_o_rdcv1n/awx_18_mry1qamd/project/project_update.yml:142", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"msg": "Repository Version 355d65af0d6cc43865251aea89a57e5c3ae0b282", "_ansible_verbose_always": true, "_ansible_no_log": false, "changed": false}, "start": "2021-08-17T07:16:09.639269", "end": "2021-08-17T07:16:09.838115", "duration": 0.198846, "event_loop": null, "uuid": "00148b5b-5a44-4d79-b220-d87900978857"}	f	f	00148b5b-5a44-4d79-b220-d87900978857	project_update.yml	Update source tree if necessary		Repository Version	11	[0;32mok: [localhost] => {[0m\r\n[0;32m    "msg": "Repository Version 355d65af0d6cc43865251aea89a57e5c3ae0b282"[0m\r\n[0;32m}[0m	0	10	13	18
321	2021-08-17 07:16:10.704555+00	2021-08-17 07:16:11.075746+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "9423ec19-3f36-4b3c-9c49-1a4429dcbbd0", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-4b9d-ad82-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-4b9d-ad82-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_18_o_rdcv1n/awx_18_mry1qamd/project/project_update.yml:188", "host": "localhost", "uuid": "2ca06ce0-6992-4817-81d2-c1342c224870"}	f	f	2ca06ce0-6992-4817-81d2-c1342c224870	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	24		0	25	25	18
322	2021-08-17 07:16:11.074231+00	2021-08-17 07:16:11.075746+00	runner_item_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "9423ec19-3f36-4b3c-9c49-1a4429dcbbd0", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-4b9d-ad82-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-4b9d-ad82-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_18_o_rdcv1n/awx_18_mry1qamd/project/project_update.yml:188", "host": "localhost", "res": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_8__createfile/collections/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yml"}}, "uuid": "4ce6296f-6636-4dd9-a148-c0a86482d618"}	f	f	4ce6296f-6636-4dd9-a148-c0a86482d618	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	25	[0;32mok: [localhost] => (item={'ext': '.yml'})[0m	0	25	26	18
2	2021-08-17 04:44:39.6286+00	2021-08-17 04:44:39.631147+00	playbook_on_play_start	{"playbook": "project_update.yml", "playbook_uuid": "b5beb502-8c90-4efb-9ffc-557935a5835d", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-925e-954a-000000000006", "play_pattern": "localhost", "name": "Update source tree if necessary", "pattern": "localhost", "uuid": "0242ac12-0005-925e-954a-000000000006"}	f	f	0242ac12-0005-925e-954a-000000000006	project_update.yml	Update source tree if necessary			2	\r\nPLAY [Update source tree if necessary] *****************************************	0	0	2	1
220	2021-08-17 07:15:54.383997+00	2021-08-17 07:15:54.386709+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "e098ff2c-0cc7-4fa4-ac6b-c3749ed06769", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-d907-6799-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-d907-6799-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_15_ewsgoefo/awx_15_8r8m9hjb/project/project_update.yml:188", "name": "detect collections/requirements.(yml/yaml)", "is_conditional": false, "uuid": "0242ac12-0005-d907-6799-000000000022"}	f	f	0242ac12-0005-d907-6799-000000000022	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	23	\r\nTASK [detect collections/requirements.(yml/yaml)] ******************************	0	23	25	15
243	2021-08-17 07:15:58.335079+00	2021-08-17 07:15:58.338093+00	playbook_on_play_start	{"playbook": "project_update.yml", "playbook_uuid": "b015f3c4-357b-4a03-970a-86ca8efae653", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-b443-2c62-00000000001d", "play_pattern": "localhost", "name": "Install content with ansible-galaxy command if necessary", "pattern": "localhost", "uuid": "0242ac12-0005-b443-2c62-00000000001d"}	f	f	0242ac12-0005-b443-2c62-00000000001d	project_update.yml	Install content with ansible-galaxy command if necessary			12	\r\nPLAY [Install content with ansible-galaxy command if necessary] ****************	0	13	15	16
266	2021-08-17 07:16:01.397314+00	2021-08-17 07:16:01.398734+00	playbook_on_play_start	{"playbook": "project_update.yml", "playbook_uuid": "7a91cb39-1634-4325-9545-e05a1718df76", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-c9e0-8ff4-000000000006", "play_pattern": "localhost", "name": "Update source tree if necessary", "pattern": "localhost", "uuid": "0242ac12-0005-c9e0-8ff4-000000000006"}	f	f	0242ac12-0005-c9e0-8ff4-000000000006	project_update.yml	Update source tree if necessary			2	\r\nPLAY [Update source tree if necessary] *****************************************	0	0	2	17
288	2021-08-17 07:16:04.166032+00	2021-08-17 07:16:04.539759+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "7a91cb39-1634-4325-9545-e05a1718df76", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-c9e0-8ff4-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-c9e0-8ff4-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_17_cnh8436b/awx_17_njz3midn/project/project_update.yml:188", "host": "localhost", "uuid": "6a636fd4-8dc7-401f-bc04-e9dc60381855"}	f	f	6a636fd4-8dc7-401f-bc04-e9dc60381855	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	24		0	25	25	17
289	2021-08-17 07:16:04.538224+00	2021-08-17 07:16:04.539759+00	runner_item_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "7a91cb39-1634-4325-9545-e05a1718df76", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-c9e0-8ff4-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-c9e0-8ff4-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_17_cnh8436b/awx_17_njz3midn/project/project_update.yml:188", "host": "localhost", "res": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yml"}}, "uuid": "c36dcf3d-ec77-4b4b-9139-cbf529f59c55"}	f	f	c36dcf3d-ec77-4b4b-9139-cbf529f59c55	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	25	[0;32mok: [localhost] => (item={'ext': '.yml'})[0m	0	25	26	17
309	2021-08-17 07:16:09.842072+00	2021-08-17 07:16:09.843476+00	playbook_on_play_start	{"playbook": "project_update.yml", "playbook_uuid": "9423ec19-3f36-4b3c-9c49-1a4429dcbbd0", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-4b9d-ad82-00000000001d", "play_pattern": "localhost", "name": "Install content with ansible-galaxy command if necessary", "pattern": "localhost", "uuid": "0242ac12-0005-4b9d-ad82-00000000001d"}	f	f	0242ac12-0005-4b9d-ad82-00000000001d	project_update.yml	Install content with ansible-galaxy command if necessary			12	\r\nPLAY [Install content with ansible-galaxy command if necessary] ****************	0	13	15	18
323	2021-08-17 07:16:11.244097+00	2021-08-17 07:16:11.245549+00	runner_item_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "9423ec19-3f36-4b3c-9c49-1a4429dcbbd0", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-4b9d-ad82-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-4b9d-ad82-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_18_o_rdcv1n/awx_18_mry1qamd/project/project_update.yml:188", "host": "localhost", "res": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_8__createfile/collections/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yaml"}}, "uuid": "18f03b47-371e-4a9d-8048-86130c3ea459"}	f	f	18f03b47-371e-4a9d-8048-86130c3ea459	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	26	[0;32mok: [localhost] => (item={'ext': '.yaml'})[0m	0	26	27	18
333	2021-08-17 07:16:12.543013+00	2021-08-17 07:16:13.608477+00	playbook_on_play_start	{"playbook": "project_update.yml", "playbook_uuid": "48221bd1-55e7-40c7-9019-5e5e9e53acd3", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-8926-da79-000000000006", "play_pattern": "localhost", "name": "Update source tree if necessary", "pattern": "localhost", "uuid": "0242ac12-0005-8926-da79-000000000006"}	f	f	0242ac12-0005-8926-da79-000000000006	project_update.yml	Update source tree if necessary			2	\r\nPLAY [Update source tree if necessary] *****************************************	0	0	2	19
365	2021-08-17 07:19:29.317458+00	2021-08-17 07:19:29.320041+00	playbook_on_play_start	{"playbook": "project_update.yml", "playbook_uuid": "da241f84-0a6a-4d4d-8f34-9e6b6aad725d", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-9c78-5455-000000000006", "play_pattern": "localhost", "name": "Update source tree if necessary", "pattern": "localhost", "uuid": "0242ac12-0005-9c78-5455-000000000006"}	f	f	0242ac12-0005-9c78-5455-000000000006	project_update.yml	Update source tree if necessary			2	\r\nPLAY [Update source tree if necessary] *****************************************	0	0	2	21
328	2021-08-17 07:16:11.467511+00	2021-08-17 07:16:11.471287+00	runner_item_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "9423ec19-3f36-4b3c-9c49-1a4429dcbbd0", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-4b9d-ad82-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-4b9d-ad82-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_18_o_rdcv1n/awx_18_mry1qamd/project/project_update.yml:194", "host": "localhost", "res": {"changed": false, "skip_reason": "Conditional result was False", "_ansible_no_log": false, "item": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_8__createfile/collections/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item"}, "ansible_loop_var": "item", "_ansible_item_label": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_8__createfile/collections/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item"}}, "uuid": "ece22f7c-00c2-4822-9b67-8634bf2c2a18"}	f	f	ece22f7c-00c2-4822-9b67-8634bf2c2a18	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	31	[0;36mskipping: [localhost] => (item={'changed': False, 'stat': {'exists': False}, 'invocation': {'module_args': {'path': '/var/lib/awx/projects/_8__createfile/collections/requirements.yaml', 'follow': False, 'get_md5': False, 'get_checksum': True, 'get_mime': True, 'get_attributes': True, 'checksum_algorithm': 'sha1'}}, 'failed': False, 'item': {'ext': '.yaml'}, 'ansible_loop_var': 'item'}) [0m	0	30	31	18
335	2021-08-17 07:16:13.92067+00	2021-08-17 07:16:13.925141+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "48221bd1-55e7-40c7-9019-5e5e9e53acd3", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-8926-da79-000000000006", "play_pattern": "localhost", "task": "update project using git", "task_uuid": "0242ac12-0005-8926-da79-00000000000a", "task_action": "git", "task_args": "", "task_path": "/tmp/bwrap_19_qa3qu_ri/awx_19_d93vso43/project/project_update.yml:34", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"changed": false, "before": "347e44fea036c94d5f60e544de006453ee5c71ad", "remote_url_changed": false, "after": "347e44fea036c94d5f60e544de006453ee5c71ad", "invocation": {"module_args": {"dest": "/var/lib/awx/projects/_6__demo_project", "repo": "https://github.com/ansible/ansible-tower-samples", "version": "HEAD", "force": false, "remote": "origin", "clone": true, "update": true, "verify_commit": false, "gpg_whitelist": [], "accept_hostkey": false, "bare": false, "recursive": true, "track_submodules": false, "refspec": null, "reference": null, "depth": null, "key_file": null, "ssh_opts": null, "executable": null, "umask": null, "archive": null, "separate_git_dir": null}}, "_ansible_no_log": false}, "start": "2021-08-17T07:16:12.553633", "end": "2021-08-17T07:16:13.920472", "duration": 1.366839, "event_loop": null, "uuid": "c4de1dac-bf20-4af1-9f17-5851e52bcdb3"}	f	f	c4de1dac-bf20-4af1-9f17-5851e52bcdb3	project_update.yml	Update source tree if necessary		update project using git	5	[0;32mok: [localhost][0m	0	4	5	19
337	2021-08-17 07:16:13.924696+00	2021-08-17 07:16:13.928482+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "48221bd1-55e7-40c7-9019-5e5e9e53acd3", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-8926-da79-000000000006", "play_pattern": "localhost", "task": "Set the git repository version", "task_uuid": "0242ac12-0005-8926-da79-00000000000b", "task_action": "set_fact", "task_args": "", "task_path": "/tmp/bwrap_19_qa3qu_ri/awx_19_d93vso43/project/project_update.yml:44", "name": "Set the git repository version", "is_conditional": false, "uuid": "0242ac12-0005-8926-da79-00000000000b"}	f	f	0242ac12-0005-8926-da79-00000000000b	project_update.yml	Update source tree if necessary		Set the git repository version	6	\r\nTASK [Set the git repository version] ******************************************	0	5	7	19
338	2021-08-17 07:16:14.095327+00	2021-08-17 07:16:14.097665+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "48221bd1-55e7-40c7-9019-5e5e9e53acd3", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-8926-da79-000000000006", "play_pattern": "localhost", "task": "Set the git repository version", "task_uuid": "0242ac12-0005-8926-da79-00000000000b", "task_action": "set_fact", "task_args": "", "task_path": "/tmp/bwrap_19_qa3qu_ri/awx_19_d93vso43/project/project_update.yml:44", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"changed": false, "ansible_facts": {"scm_version": "347e44fea036c94d5f60e544de006453ee5c71ad"}, "_ansible_no_log": false}, "start": "2021-08-17T07:16:13.925404", "end": "2021-08-17T07:16:14.095100", "duration": 0.169696, "event_loop": null, "uuid": "d64802c4-5600-4d60-b8cb-0045940c52b0"}	f	f	d64802c4-5600-4d60-b8cb-0045940c52b0	project_update.yml	Update source tree if necessary		Set the git repository version	8	[0;32mok: [localhost][0m	0	7	8	19
339	2021-08-17 07:16:14.09894+00	2021-08-17 07:16:14.100841+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "48221bd1-55e7-40c7-9019-5e5e9e53acd3", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-8926-da79-000000000006", "play_pattern": "localhost", "task": "Repository Version", "task_uuid": "0242ac12-0005-8926-da79-00000000001c", "task_action": "debug", "task_args": "", "task_path": "/tmp/bwrap_19_qa3qu_ri/awx_19_d93vso43/project/project_update.yml:142", "name": "Repository Version", "is_conditional": false, "uuid": "0242ac12-0005-8926-da79-00000000001c"}	f	f	0242ac12-0005-8926-da79-00000000001c	project_update.yml	Update source tree if necessary		Repository Version	9	\r\nTASK [Repository Version] ******************************************************	0	8	10	19
341	2021-08-17 07:16:14.26698+00	2021-08-17 07:16:14.269047+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "48221bd1-55e7-40c7-9019-5e5e9e53acd3", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-8926-da79-000000000006", "play_pattern": "localhost", "task": "Repository Version", "task_uuid": "0242ac12-0005-8926-da79-00000000001c", "task_action": "debug", "task_args": "", "task_path": "/tmp/bwrap_19_qa3qu_ri/awx_19_d93vso43/project/project_update.yml:142", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"msg": "Repository Version 347e44fea036c94d5f60e544de006453ee5c71ad", "_ansible_verbose_always": true, "_ansible_no_log": false, "changed": false}, "start": "2021-08-17T07:16:14.099663", "end": "2021-08-17T07:16:14.266751", "duration": 0.167088, "event_loop": null, "uuid": "dae3908b-44e4-4b99-88ee-0a68a0b711fb"}	f	f	dae3908b-44e4-4b99-88ee-0a68a0b711fb	project_update.yml	Update source tree if necessary		Repository Version	11	[0;32mok: [localhost] => {[0m\r\n[0;32m    "msg": "Repository Version 347e44fea036c94d5f60e544de006453ee5c71ad"[0m\r\n[0;32m}[0m	0	10	13	19
343	2021-08-17 07:16:14.278058+00	2021-08-17 07:16:14.279819+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "48221bd1-55e7-40c7-9019-5e5e9e53acd3", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-8926-da79-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-8926-da79-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_19_qa3qu_ri/awx_19_d93vso43/project/project_update.yml:162", "name": "detect roles/requirements.(yml/yaml)", "is_conditional": false, "uuid": "0242ac12-0005-8926-da79-00000000001f"}	f	f	0242ac12-0005-8926-da79-00000000001f	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	13	\r\nTASK [detect roles/requirements.(yml/yaml)] ************************************	0	15	17	19
344	2021-08-17 07:16:14.278612+00	2021-08-17 07:16:14.282548+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "48221bd1-55e7-40c7-9019-5e5e9e53acd3", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-8926-da79-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-8926-da79-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_19_qa3qu_ri/awx_19_d93vso43/project/project_update.yml:162", "host": "localhost", "uuid": "661624af-c94c-4825-ac87-1cb53425f929"}	f	f	661624af-c94c-4825-ac87-1cb53425f929	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	14		0	17	17	19
345	2021-08-17 07:16:14.746684+00	2021-08-17 07:16:14.749396+00	runner_item_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "48221bd1-55e7-40c7-9019-5e5e9e53acd3", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-8926-da79-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-8926-da79-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_19_qa3qu_ri/awx_19_d93vso43/project/project_update.yml:162", "host": "localhost", "res": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_6__demo_project/roles/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yml"}}, "uuid": "8e8209c6-67c1-487a-a3bf-cf111fbc37c2"}	f	f	8e8209c6-67c1-487a-a3bf-cf111fbc37c2	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	15	[0;32mok: [localhost] => (item={'ext': '.yml'})[0m	0	17	18	19
352	2021-08-17 07:16:15.133433+00	2021-08-17 07:16:15.137818+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "48221bd1-55e7-40c7-9019-5e5e9e53acd3", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-8926-da79-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-8926-da79-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_19_qa3qu_ri/awx_19_d93vso43/project/project_update.yml:188", "name": "detect collections/requirements.(yml/yaml)", "is_conditional": false, "uuid": "0242ac12-0005-8926-da79-000000000022"}	f	f	0242ac12-0005-8926-da79-000000000022	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	23	\r\nTASK [detect collections/requirements.(yml/yaml)] ******************************	0	23	25	19
397	2021-08-17 07:20:25.86619+00	2021-08-17 07:20:25.868946+00	playbook_on_start	{"playbook": "project_update.yml", "playbook_uuid": "491edf08-3de5-4678-8dfb-130296824545", "uuid": "491edf08-3de5-4678-8dfb-130296824545"}	f	f	491edf08-3de5-4678-8dfb-130296824545	project_update.yml				1		0	0	0	23
346	2021-08-17 07:16:14.915563+00	2021-08-17 07:16:14.918899+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "48221bd1-55e7-40c7-9019-5e5e9e53acd3", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-8926-da79-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-8926-da79-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_19_qa3qu_ri/awx_19_d93vso43/project/project_update.yml:162", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"results": [{"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_6__demo_project/roles/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yml"}}, {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_6__demo_project/roles/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yaml"}}], "msg": "All items completed", "changed": false}, "start": "2021-08-17T07:16:14.278538", "end": "2021-08-17T07:16:14.915446", "duration": 0.636908, "event_loop": "items", "uuid": "bdabcb14-9aca-4500-9b02-920827f08577"}	f	f	bdabcb14-9aca-4500-9b02-920827f08577	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	17		0	19	19	19
347	2021-08-17 07:16:14.914646+00	2021-08-17 07:16:14.918517+00	runner_item_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "48221bd1-55e7-40c7-9019-5e5e9e53acd3", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-8926-da79-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-8926-da79-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_19_qa3qu_ri/awx_19_d93vso43/project/project_update.yml:162", "host": "localhost", "res": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_6__demo_project/roles/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yaml"}}, "uuid": "4c65a2bb-781d-41ea-89d8-4cf4d2df7a2a"}	f	f	4c65a2bb-781d-41ea-89d8-4cf4d2df7a2a	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	16	[0;32mok: [localhost] => (item={'ext': '.yaml'})[0m	0	18	19	19
348	2021-08-17 07:16:14.919077+00	2021-08-17 07:16:14.922448+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "48221bd1-55e7-40c7-9019-5e5e9e53acd3", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-8926-da79-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-8926-da79-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_19_qa3qu_ri/awx_19_d93vso43/project/project_update.yml:168", "name": "fetch galaxy roles from requirements.(yml/yaml)", "is_conditional": false, "uuid": "0242ac12-0005-8926-da79-000000000020"}	f	f	0242ac12-0005-8926-da79-000000000020	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	18	\r\nTASK [fetch galaxy roles from requirements.(yml/yaml)] *************************	0	19	21	19
349	2021-08-17 07:16:14.920043+00	2021-08-17 07:16:14.923279+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "48221bd1-55e7-40c7-9019-5e5e9e53acd3", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-8926-da79-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-8926-da79-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_19_qa3qu_ri/awx_19_d93vso43/project/project_update.yml:168", "host": "localhost", "uuid": "44aad686-1dc7-409f-9ad2-3b7fe7d769f0"}	f	f	44aad686-1dc7-409f-9ad2-3b7fe7d769f0	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	19		0	21	21	19
350	2021-08-17 07:16:15.124298+00	2021-08-17 07:16:15.126806+00	runner_item_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "48221bd1-55e7-40c7-9019-5e5e9e53acd3", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-8926-da79-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-8926-da79-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_19_qa3qu_ri/awx_19_d93vso43/project/project_update.yml:168", "host": "localhost", "res": {"changed": false, "skip_reason": "Conditional result was False", "_ansible_no_log": false, "item": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_6__demo_project/roles/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item"}, "ansible_loop_var": "item", "_ansible_item_label": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_6__demo_project/roles/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item"}}, "uuid": "d99ed56d-d7c6-40db-99ed-2a8b12fb67e0"}	f	f	d99ed56d-d7c6-40db-99ed-2a8b12fb67e0	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	20	[0;36mskipping: [localhost] => (item={'changed': False, 'stat': {'exists': False}, 'invocation': {'module_args': {'path': '/var/lib/awx/projects/_6__demo_project/roles/requirements.yml', 'follow': False, 'get_md5': False, 'get_checksum': True, 'get_mime': True, 'get_attributes': True, 'checksum_algorithm': 'sha1'}}, 'failed': False, 'item': {'ext': '.yml'}, 'ansible_loop_var': 'item'}) [0m	0	21	22	19
351	2021-08-17 07:16:15.129149+00	2021-08-17 07:16:15.1328+00	runner_item_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "48221bd1-55e7-40c7-9019-5e5e9e53acd3", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-8926-da79-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-8926-da79-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_19_qa3qu_ri/awx_19_d93vso43/project/project_update.yml:168", "host": "localhost", "res": {"changed": false, "skip_reason": "Conditional result was False", "_ansible_no_log": false, "item": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_6__demo_project/roles/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item"}, "ansible_loop_var": "item", "_ansible_item_label": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_6__demo_project/roles/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item"}}, "uuid": "4d0dd1bb-4997-4860-b0cf-efb26e997e7a"}	f	f	4d0dd1bb-4997-4860-b0cf-efb26e997e7a	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	21	[0;36mskipping: [localhost] => (item={'changed': False, 'stat': {'exists': False}, 'invocation': {'module_args': {'path': '/var/lib/awx/projects/_6__demo_project/roles/requirements.yaml', 'follow': False, 'get_md5': False, 'get_checksum': True, 'get_mime': True, 'get_attributes': True, 'checksum_algorithm': 'sha1'}}, 'failed': False, 'item': {'ext': '.yaml'}, 'ansible_loop_var': 'item'}) [0m	0	22	23	19
353	2021-08-17 07:16:15.130149+00	2021-08-17 07:16:15.133247+00	runner_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "48221bd1-55e7-40c7-9019-5e5e9e53acd3", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-8926-da79-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-8926-da79-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_19_qa3qu_ri/awx_19_d93vso43/project/project_update.yml:168", "host": "localhost", "remote_addr": "127.0.0.1", "start": "2021-08-17T07:16:14.919962", "end": "2021-08-17T07:16:15.130024", "duration": 0.210062, "event_loop": "items", "uuid": "36daae8d-15ae-418b-b742-b824a0aa7c9f"}	f	f	36daae8d-15ae-418b-b742-b824a0aa7c9f	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	22		0	23	23	19
354	2021-08-17 07:16:15.134012+00	2021-08-17 07:16:15.511534+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "48221bd1-55e7-40c7-9019-5e5e9e53acd3", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-8926-da79-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-8926-da79-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_19_qa3qu_ri/awx_19_d93vso43/project/project_update.yml:188", "host": "localhost", "uuid": "2e7e9f17-fa71-4d91-9e6e-a3d5d4c09d67"}	f	f	2e7e9f17-fa71-4d91-9e6e-a3d5d4c09d67	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	24		0	25	25	19
355	2021-08-17 07:16:15.509211+00	2021-08-17 07:16:15.511534+00	runner_item_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "48221bd1-55e7-40c7-9019-5e5e9e53acd3", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-8926-da79-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-8926-da79-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_19_qa3qu_ri/awx_19_d93vso43/project/project_update.yml:188", "host": "localhost", "res": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_6__demo_project/collections/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yml"}}, "uuid": "24223b74-3df0-41f6-85c0-839ee9fdd48f"}	f	f	24223b74-3df0-41f6-85c0-839ee9fdd48f	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	25	[0;32mok: [localhost] => (item={'ext': '.yml'})[0m	0	25	26	19
356	2021-08-17 07:16:15.680969+00	2021-08-17 07:16:15.682348+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "48221bd1-55e7-40c7-9019-5e5e9e53acd3", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-8926-da79-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-8926-da79-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_19_qa3qu_ri/awx_19_d93vso43/project/project_update.yml:188", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"results": [{"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_6__demo_project/collections/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yml"}}, {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_6__demo_project/collections/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yaml"}}], "msg": "All items completed", "changed": false}, "start": "2021-08-17T07:16:15.133934", "end": "2021-08-17T07:16:15.680868", "duration": 0.546934, "event_loop": "items", "uuid": "b9a2d473-f777-44b8-aae3-61b41ccf77b9"}	f	f	b9a2d473-f777-44b8-aae3-61b41ccf77b9	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	27		0	27	27	19
357	2021-08-17 07:16:15.680032+00	2021-08-17 07:16:15.682216+00	runner_item_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "48221bd1-55e7-40c7-9019-5e5e9e53acd3", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-8926-da79-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-8926-da79-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_19_qa3qu_ri/awx_19_d93vso43/project/project_update.yml:188", "host": "localhost", "res": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_6__demo_project/collections/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yaml"}}, "uuid": "2687f04d-6b72-40f2-8b4b-9d0b9882a098"}	f	f	2687f04d-6b72-40f2-8b4b-9d0b9882a098	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	26	[0;32mok: [localhost] => (item={'ext': '.yaml'})[0m	0	26	27	19
358	2021-08-17 07:16:15.684963+00	2021-08-17 07:16:15.687959+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "48221bd1-55e7-40c7-9019-5e5e9e53acd3", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-8926-da79-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-8926-da79-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_19_qa3qu_ri/awx_19_d93vso43/project/project_update.yml:194", "host": "localhost", "uuid": "86efd0cb-28c0-44b4-a9d1-03aed7c6d9b2"}	f	f	86efd0cb-28c0-44b4-a9d1-03aed7c6d9b2	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	29		0	29	29	19
359	2021-08-17 07:16:15.684361+00	2021-08-17 07:16:15.68583+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "48221bd1-55e7-40c7-9019-5e5e9e53acd3", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-8926-da79-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-8926-da79-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_19_qa3qu_ri/awx_19_d93vso43/project/project_update.yml:194", "name": "fetch galaxy collections from collections/requirements.(yml/yaml)", "is_conditional": false, "uuid": "0242ac12-0005-8926-da79-000000000023"}	f	f	0242ac12-0005-8926-da79-000000000023	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	28	\r\nTASK [fetch galaxy collections from collections/requirements.(yml/yaml)] *******	0	27	29	19
360	2021-08-17 07:16:15.894257+00	2021-08-17 07:16:15.895979+00	runner_item_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "48221bd1-55e7-40c7-9019-5e5e9e53acd3", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-8926-da79-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-8926-da79-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_19_qa3qu_ri/awx_19_d93vso43/project/project_update.yml:194", "host": "localhost", "res": {"changed": false, "skip_reason": "Conditional result was False", "_ansible_no_log": false, "item": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_6__demo_project/collections/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item"}, "ansible_loop_var": "item", "_ansible_item_label": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_6__demo_project/collections/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item"}}, "uuid": "ff00f0ee-242a-4bc9-9b6b-14749aa2fd5d"}	f	f	ff00f0ee-242a-4bc9-9b6b-14749aa2fd5d	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	30	[0;36mskipping: [localhost] => (item={'changed': False, 'stat': {'exists': False}, 'invocation': {'module_args': {'path': '/var/lib/awx/projects/_6__demo_project/collections/requirements.yml', 'follow': False, 'get_md5': False, 'get_checksum': True, 'get_mime': True, 'get_attributes': True, 'checksum_algorithm': 'sha1'}}, 'failed': False, 'item': {'ext': '.yml'}, 'ansible_loop_var': 'item'}) [0m	0	29	30	19
361	2021-08-17 07:16:15.904962+00	2021-08-17 07:16:15.907135+00	runner_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "48221bd1-55e7-40c7-9019-5e5e9e53acd3", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-8926-da79-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-8926-da79-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_19_qa3qu_ri/awx_19_d93vso43/project/project_update.yml:194", "host": "localhost", "remote_addr": "127.0.0.1", "start": "2021-08-17T07:16:15.684883", "end": "2021-08-17T07:16:15.904863", "duration": 0.21998, "event_loop": "items", "uuid": "703b0ec1-b818-4b81-b314-d53574202e35"}	f	f	703b0ec1-b818-4b81-b314-d53574202e35	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	32		0	31	31	19
362	2021-08-17 07:16:15.903941+00	2021-08-17 07:16:15.906576+00	runner_item_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "48221bd1-55e7-40c7-9019-5e5e9e53acd3", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-8926-da79-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-8926-da79-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_19_qa3qu_ri/awx_19_d93vso43/project/project_update.yml:194", "host": "localhost", "res": {"changed": false, "skip_reason": "Conditional result was False", "_ansible_no_log": false, "item": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_6__demo_project/collections/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item"}, "ansible_loop_var": "item", "_ansible_item_label": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_6__demo_project/collections/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item"}}, "uuid": "2135dd6a-d891-4856-830b-21d50a501a14"}	f	f	2135dd6a-d891-4856-830b-21d50a501a14	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	31	[0;36mskipping: [localhost] => (item={'changed': False, 'stat': {'exists': False}, 'invocation': {'module_args': {'path': '/var/lib/awx/projects/_6__demo_project/collections/requirements.yaml', 'follow': False, 'get_md5': False, 'get_checksum': True, 'get_mime': True, 'get_attributes': True, 'checksum_algorithm': 'sha1'}}, 'failed': False, 'item': {'ext': '.yaml'}, 'ansible_loop_var': 'item'}) [0m	0	30	31	19
363	2021-08-17 07:16:15.909653+00	2021-08-17 07:16:15.911016+00	playbook_on_stats	{"playbook": "project_update.yml", "playbook_uuid": "48221bd1-55e7-40c7-9019-5e5e9e53acd3", "changed": {}, "dark": {}, "failures": {}, "ignored": {}, "ok": {"localhost": 5}, "processed": {"localhost": 1}, "rescued": {}, "skipped": {"localhost": 2}, "artifact_data": {}, "uuid": "29b16b27-0dd1-4d57-8422-3f90d479f3fd"}	f	f	29b16b27-0dd1-4d57-8422-3f90d479f3fd	project_update.yml				33	\r\nPLAY RECAP *********************************************************************\r\n[0;32mlocalhost[0m                  : [0;32mok=5   [0m changed=0    unreachable=0    failed=0    [0;36mskipped=2   [0m rescued=0    ignored=0   \r\n	0	31	35	19
366	2021-08-17 07:19:29.32796+00	2021-08-17 07:19:29.331489+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "da241f84-0a6a-4d4d-8f34-9e6b6aad725d", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-9c78-5455-000000000006", "play_pattern": "localhost", "task": "update project using git", "task_uuid": "0242ac12-0005-9c78-5455-00000000000a", "task_action": "git", "task_args": "", "task_path": "/tmp/bwrap_21_x9o0zwv8/awx_21_kt3wo3wy/project/project_update.yml:34", "name": "update project using git", "is_conditional": false, "uuid": "0242ac12-0005-9c78-5455-00000000000a"}	f	f	0242ac12-0005-9c78-5455-00000000000a	project_update.yml	Update source tree if necessary		update project using git	3	\r\nTASK [update project using git] ************************************************	0	2	4	21
367	2021-08-17 07:19:29.328674+00	2021-08-17 07:19:29.332926+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "da241f84-0a6a-4d4d-8f34-9e6b6aad725d", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-9c78-5455-000000000006", "play_pattern": "localhost", "task": "update project using git", "task_uuid": "0242ac12-0005-9c78-5455-00000000000a", "task_action": "git", "task_args": "", "task_path": "/tmp/bwrap_21_x9o0zwv8/awx_21_kt3wo3wy/project/project_update.yml:34", "host": "localhost", "uuid": "dd2a1260-65fc-48b3-bf5a-5d29dd4eb1c9"}	f	f	dd2a1260-65fc-48b3-bf5a-5d29dd4eb1c9	project_update.yml	Update source tree if necessary		update project using git	4		0	4	4	21
368	2021-08-17 07:19:30.945207+00	2021-08-17 07:19:30.949077+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "da241f84-0a6a-4d4d-8f34-9e6b6aad725d", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-9c78-5455-000000000006", "play_pattern": "localhost", "task": "update project using git", "task_uuid": "0242ac12-0005-9c78-5455-00000000000a", "task_action": "git", "task_args": "", "task_path": "/tmp/bwrap_21_x9o0zwv8/awx_21_kt3wo3wy/project/project_update.yml:34", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"changed": true, "before": "355d65af0d6cc43865251aea89a57e5c3ae0b282", "remote_url_changed": false, "after": "f34509208c70e4ccedbd54480abf68b01f9d221b", "invocation": {"module_args": {"dest": "/var/lib/awx/projects/_13__winserver", "repo": "https://$encrypted$:$encrypted$@github.com/rmspavan/AnsibleTower.git", "version": "HEAD", "force": false, "remote": "origin", "clone": true, "update": true, "verify_commit": false, "gpg_whitelist": [], "accept_hostkey": false, "bare": false, "recursive": true, "track_submodules": false, "refspec": null, "reference": null, "depth": null, "key_file": null, "ssh_opts": null, "executable": null, "umask": null, "archive": null, "separate_git_dir": null}}, "_ansible_no_log": false}, "start": "2021-08-17T07:19:29.328597", "end": "2021-08-17T07:19:30.944980", "duration": 1.616383, "event_loop": null, "uuid": "8aa7b9e6-5d3e-4acf-90c1-78706d4e6ac2"}	f	t	8aa7b9e6-5d3e-4acf-90c1-78706d4e6ac2	project_update.yml	Update source tree if necessary		update project using git	5	[0;33mchanged: [localhost][0m	0	4	5	21
369	2021-08-17 07:19:30.949229+00	2021-08-17 07:19:30.95052+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "da241f84-0a6a-4d4d-8f34-9e6b6aad725d", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-9c78-5455-000000000006", "play_pattern": "localhost", "task": "Set the git repository version", "task_uuid": "0242ac12-0005-9c78-5455-00000000000b", "task_action": "set_fact", "task_args": "", "task_path": "/tmp/bwrap_21_x9o0zwv8/awx_21_kt3wo3wy/project/project_update.yml:44", "name": "Set the git repository version", "is_conditional": false, "uuid": "0242ac12-0005-9c78-5455-00000000000b"}	f	f	0242ac12-0005-9c78-5455-00000000000b	project_update.yml	Update source tree if necessary		Set the git repository version	6	\r\nTASK [Set the git repository version] ******************************************	0	5	7	21
370	2021-08-17 07:19:30.950106+00	2021-08-17 07:19:30.951965+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "da241f84-0a6a-4d4d-8f34-9e6b6aad725d", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-9c78-5455-000000000006", "play_pattern": "localhost", "task": "Set the git repository version", "task_uuid": "0242ac12-0005-9c78-5455-00000000000b", "task_action": "set_fact", "task_args": "", "task_path": "/tmp/bwrap_21_x9o0zwv8/awx_21_kt3wo3wy/project/project_update.yml:44", "host": "localhost", "uuid": "4c469230-2c15-4c21-8da6-83e6d748a183"}	f	f	4c469230-2c15-4c21-8da6-83e6d748a183	project_update.yml	Update source tree if necessary		Set the git repository version	7		0	7	7	21
371	2021-08-17 07:19:31.121737+00	2021-08-17 07:19:31.124297+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "da241f84-0a6a-4d4d-8f34-9e6b6aad725d", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-9c78-5455-000000000006", "play_pattern": "localhost", "task": "Set the git repository version", "task_uuid": "0242ac12-0005-9c78-5455-00000000000b", "task_action": "set_fact", "task_args": "", "task_path": "/tmp/bwrap_21_x9o0zwv8/awx_21_kt3wo3wy/project/project_update.yml:44", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"changed": false, "ansible_facts": {"scm_version": "f34509208c70e4ccedbd54480abf68b01f9d221b"}, "_ansible_no_log": false}, "start": "2021-08-17T07:19:30.950001", "end": "2021-08-17T07:19:31.121506", "duration": 0.171505, "event_loop": null, "uuid": "2abd445d-e3c5-4a86-8c14-70c60de298b9"}	f	f	2abd445d-e3c5-4a86-8c14-70c60de298b9	project_update.yml	Update source tree if necessary		Set the git repository version	8	[0;32mok: [localhost][0m	0	7	8	21
372	2021-08-17 07:19:31.125503+00	2021-08-17 07:19:31.127101+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "da241f84-0a6a-4d4d-8f34-9e6b6aad725d", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-9c78-5455-000000000006", "play_pattern": "localhost", "task": "Repository Version", "task_uuid": "0242ac12-0005-9c78-5455-00000000001c", "task_action": "debug", "task_args": "", "task_path": "/tmp/bwrap_21_x9o0zwv8/awx_21_kt3wo3wy/project/project_update.yml:142", "name": "Repository Version", "is_conditional": false, "uuid": "0242ac12-0005-9c78-5455-00000000001c"}	f	f	0242ac12-0005-9c78-5455-00000000001c	project_update.yml	Update source tree if necessary		Repository Version	9	\r\nTASK [Repository Version] ******************************************************	0	8	10	21
373	2021-08-17 07:19:31.126316+00	2021-08-17 07:19:31.127788+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "da241f84-0a6a-4d4d-8f34-9e6b6aad725d", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-9c78-5455-000000000006", "play_pattern": "localhost", "task": "Repository Version", "task_uuid": "0242ac12-0005-9c78-5455-00000000001c", "task_action": "debug", "task_args": "", "task_path": "/tmp/bwrap_21_x9o0zwv8/awx_21_kt3wo3wy/project/project_update.yml:142", "host": "localhost", "uuid": "1301fd58-8922-43e3-9262-04d4ebd0a2ee"}	f	f	1301fd58-8922-43e3-9262-04d4ebd0a2ee	project_update.yml	Update source tree if necessary		Repository Version	10		0	10	10	21
374	2021-08-17 07:19:31.299022+00	2021-08-17 07:19:31.302086+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "da241f84-0a6a-4d4d-8f34-9e6b6aad725d", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-9c78-5455-000000000006", "play_pattern": "localhost", "task": "Repository Version", "task_uuid": "0242ac12-0005-9c78-5455-00000000001c", "task_action": "debug", "task_args": "", "task_path": "/tmp/bwrap_21_x9o0zwv8/awx_21_kt3wo3wy/project/project_update.yml:142", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"msg": "Repository Version f34509208c70e4ccedbd54480abf68b01f9d221b", "_ansible_verbose_always": true, "_ansible_no_log": false, "changed": false}, "start": "2021-08-17T07:19:31.126234", "end": "2021-08-17T07:19:31.298800", "duration": 0.172566, "event_loop": null, "uuid": "9b858524-30bd-4d87-a9a3-68e3f60583b6"}	f	f	9b858524-30bd-4d87-a9a3-68e3f60583b6	project_update.yml	Update source tree if necessary		Repository Version	11	[0;32mok: [localhost] => {[0m\r\n[0;32m    "msg": "Repository Version f34509208c70e4ccedbd54480abf68b01f9d221b"[0m\r\n[0;32m}[0m	0	10	13	21
375	2021-08-17 07:19:31.302697+00	2021-08-17 07:19:31.304571+00	playbook_on_play_start	{"playbook": "project_update.yml", "playbook_uuid": "da241f84-0a6a-4d4d-8f34-9e6b6aad725d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-9c78-5455-00000000001d", "play_pattern": "localhost", "name": "Install content with ansible-galaxy command if necessary", "pattern": "localhost", "uuid": "0242ac12-0005-9c78-5455-00000000001d"}	f	f	0242ac12-0005-9c78-5455-00000000001d	project_update.yml	Install content with ansible-galaxy command if necessary			12	\r\nPLAY [Install content with ansible-galaxy command if necessary] ****************	0	13	15	21
376	2021-08-17 07:19:31.307573+00	2021-08-17 07:19:31.311692+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "da241f84-0a6a-4d4d-8f34-9e6b6aad725d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-9c78-5455-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-9c78-5455-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_21_x9o0zwv8/awx_21_kt3wo3wy/project/project_update.yml:162", "name": "detect roles/requirements.(yml/yaml)", "is_conditional": false, "uuid": "0242ac12-0005-9c78-5455-00000000001f"}	f	f	0242ac12-0005-9c78-5455-00000000001f	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	13	\r\nTASK [detect roles/requirements.(yml/yaml)] ************************************	0	15	17	21
377	2021-08-17 07:19:31.308161+00	2021-08-17 07:19:31.313741+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "da241f84-0a6a-4d4d-8f34-9e6b6aad725d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-9c78-5455-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-9c78-5455-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_21_x9o0zwv8/awx_21_kt3wo3wy/project/project_update.yml:162", "host": "localhost", "uuid": "aa481015-6115-4982-a6c8-2436344a169c"}	f	f	aa481015-6115-4982-a6c8-2436344a169c	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	14		0	17	17	21
378	2021-08-17 07:19:31.783223+00	2021-08-17 07:19:31.785573+00	runner_item_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "da241f84-0a6a-4d4d-8f34-9e6b6aad725d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-9c78-5455-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-9c78-5455-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_21_x9o0zwv8/awx_21_kt3wo3wy/project/project_update.yml:162", "host": "localhost", "res": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yml"}}, "uuid": "8b50f8f9-ab74-4783-9463-768af6d045ff"}	f	f	8b50f8f9-ab74-4783-9463-768af6d045ff	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	15	[0;32mok: [localhost] => (item={'ext': '.yml'})[0m	0	17	18	21
379	2021-08-17 07:19:31.949418+00	2021-08-17 07:19:31.951493+00	runner_item_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "da241f84-0a6a-4d4d-8f34-9e6b6aad725d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-9c78-5455-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-9c78-5455-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_21_x9o0zwv8/awx_21_kt3wo3wy/project/project_update.yml:162", "host": "localhost", "res": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yaml"}}, "uuid": "43a69d65-6be5-47ad-99ce-c62e3bf979c2"}	f	f	43a69d65-6be5-47ad-99ce-c62e3bf979c2	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	16	[0;32mok: [localhost] => (item={'ext': '.yaml'})[0m	0	18	19	21
380	2021-08-17 07:19:31.950481+00	2021-08-17 07:19:31.954237+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "da241f84-0a6a-4d4d-8f34-9e6b6aad725d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-9c78-5455-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-9c78-5455-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_21_x9o0zwv8/awx_21_kt3wo3wy/project/project_update.yml:162", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"results": [{"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yml"}}, {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yaml"}}], "msg": "All items completed", "changed": false}, "start": "2021-08-17T07:19:31.308084", "end": "2021-08-17T07:19:31.950364", "duration": 0.64228, "event_loop": "items", "uuid": "f53e5277-e66b-4505-ad6e-6911a6be2625"}	f	f	f53e5277-e66b-4505-ad6e-6911a6be2625	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	17		0	19	19	21
381	2021-08-17 07:19:31.954732+00	2021-08-17 07:19:31.95648+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "da241f84-0a6a-4d4d-8f34-9e6b6aad725d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-9c78-5455-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-9c78-5455-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_21_x9o0zwv8/awx_21_kt3wo3wy/project/project_update.yml:168", "host": "localhost", "uuid": "97c35e49-8898-4072-8191-1af3eb214b63"}	f	f	97c35e49-8898-4072-8191-1af3eb214b63	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	19		0	21	21	21
382	2021-08-17 07:19:31.953954+00	2021-08-17 07:19:31.955821+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "da241f84-0a6a-4d4d-8f34-9e6b6aad725d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-9c78-5455-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-9c78-5455-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_21_x9o0zwv8/awx_21_kt3wo3wy/project/project_update.yml:168", "name": "fetch galaxy roles from requirements.(yml/yaml)", "is_conditional": false, "uuid": "0242ac12-0005-9c78-5455-000000000020"}	f	f	0242ac12-0005-9c78-5455-000000000020	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	18	\r\nTASK [fetch galaxy roles from requirements.(yml/yaml)] *************************	0	19	21	21
383	2021-08-17 07:19:32.160188+00	2021-08-17 07:19:32.161973+00	runner_item_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "da241f84-0a6a-4d4d-8f34-9e6b6aad725d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-9c78-5455-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-9c78-5455-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_21_x9o0zwv8/awx_21_kt3wo3wy/project/project_update.yml:168", "host": "localhost", "res": {"changed": false, "skip_reason": "Conditional result was False", "_ansible_no_log": false, "item": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item"}, "ansible_loop_var": "item", "_ansible_item_label": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item"}}, "uuid": "4812ec94-956d-4b0e-9932-8d1309fd28ad"}	f	f	4812ec94-956d-4b0e-9932-8d1309fd28ad	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	20	[0;36mskipping: [localhost] => (item={'changed': False, 'stat': {'exists': False}, 'invocation': {'module_args': {'path': '/var/lib/awx/projects/_13__winserver/roles/requirements.yml', 'follow': False, 'get_md5': False, 'get_checksum': True, 'get_mime': True, 'get_attributes': True, 'checksum_algorithm': 'sha1'}}, 'failed': False, 'item': {'ext': '.yml'}, 'ansible_loop_var': 'item'}) [0m	0	21	22	21
384	2021-08-17 07:19:32.166731+00	2021-08-17 07:19:32.16928+00	runner_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "da241f84-0a6a-4d4d-8f34-9e6b6aad725d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-9c78-5455-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-9c78-5455-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_21_x9o0zwv8/awx_21_kt3wo3wy/project/project_update.yml:168", "host": "localhost", "remote_addr": "127.0.0.1", "start": "2021-08-17T07:19:31.954654", "end": "2021-08-17T07:19:32.166638", "duration": 0.211984, "event_loop": "items", "uuid": "d270f4a1-70f3-498e-889f-5364c1c57c27"}	f	f	d270f4a1-70f3-498e-889f-5364c1c57c27	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	22		0	23	23	21
385	2021-08-17 07:19:32.165788+00	2021-08-17 07:19:32.167686+00	runner_item_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "da241f84-0a6a-4d4d-8f34-9e6b6aad725d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-9c78-5455-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-9c78-5455-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_21_x9o0zwv8/awx_21_kt3wo3wy/project/project_update.yml:168", "host": "localhost", "res": {"changed": false, "skip_reason": "Conditional result was False", "_ansible_no_log": false, "item": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item"}, "ansible_loop_var": "item", "_ansible_item_label": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item"}}, "uuid": "5a1792c3-4a41-4116-9922-4e4e2f01bb3c"}	f	f	5a1792c3-4a41-4116-9922-4e4e2f01bb3c	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	21	[0;36mskipping: [localhost] => (item={'changed': False, 'stat': {'exists': False}, 'invocation': {'module_args': {'path': '/var/lib/awx/projects/_13__winserver/roles/requirements.yaml', 'follow': False, 'get_md5': False, 'get_checksum': True, 'get_mime': True, 'get_attributes': True, 'checksum_algorithm': 'sha1'}}, 'failed': False, 'item': {'ext': '.yaml'}, 'ansible_loop_var': 'item'}) [0m	0	22	23	21
386	2021-08-17 07:19:32.170074+00	2021-08-17 07:19:32.172725+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "da241f84-0a6a-4d4d-8f34-9e6b6aad725d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-9c78-5455-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-9c78-5455-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_21_x9o0zwv8/awx_21_kt3wo3wy/project/project_update.yml:188", "name": "detect collections/requirements.(yml/yaml)", "is_conditional": false, "uuid": "0242ac12-0005-9c78-5455-000000000022"}	f	f	0242ac12-0005-9c78-5455-000000000022	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	23	\r\nTASK [detect collections/requirements.(yml/yaml)] ******************************	0	23	25	21
387	2021-08-17 07:19:32.170659+00	2021-08-17 07:19:32.549298+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "da241f84-0a6a-4d4d-8f34-9e6b6aad725d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-9c78-5455-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-9c78-5455-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_21_x9o0zwv8/awx_21_kt3wo3wy/project/project_update.yml:188", "host": "localhost", "uuid": "ce28ee0e-2042-4b88-b3b0-8fbe39edeb55"}	f	f	ce28ee0e-2042-4b88-b3b0-8fbe39edeb55	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	24		0	25	25	21
398	2021-08-17 07:20:25.868662+00	2021-08-17 07:20:25.870445+00	playbook_on_play_start	{"playbook": "project_update.yml", "playbook_uuid": "491edf08-3de5-4678-8dfb-130296824545", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-a39f-bc88-000000000006", "play_pattern": "localhost", "name": "Update source tree if necessary", "pattern": "localhost", "uuid": "0242ac12-0005-a39f-bc88-000000000006"}	f	f	0242ac12-0005-a39f-bc88-000000000006	project_update.yml	Update source tree if necessary			2	\r\nPLAY [Update source tree if necessary] *****************************************	0	0	2	23
388	2021-08-17 07:19:32.54632+00	2021-08-17 07:19:32.549298+00	runner_item_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "da241f84-0a6a-4d4d-8f34-9e6b6aad725d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-9c78-5455-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-9c78-5455-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_21_x9o0zwv8/awx_21_kt3wo3wy/project/project_update.yml:188", "host": "localhost", "res": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yml"}}, "uuid": "661d7328-34e4-4194-b446-b0ac53685ec1"}	f	f	661d7328-34e4-4194-b446-b0ac53685ec1	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	25	[0;32mok: [localhost] => (item={'ext': '.yml'})[0m	0	25	26	21
389	2021-08-17 07:19:32.715804+00	2021-08-17 07:19:32.718705+00	runner_item_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "da241f84-0a6a-4d4d-8f34-9e6b6aad725d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-9c78-5455-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-9c78-5455-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_21_x9o0zwv8/awx_21_kt3wo3wy/project/project_update.yml:188", "host": "localhost", "res": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yaml"}}, "uuid": "4cdd644e-9216-48e0-8e32-f71d8a754f8c"}	f	f	4cdd644e-9216-48e0-8e32-f71d8a754f8c	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	26	[0;32mok: [localhost] => (item={'ext': '.yaml'})[0m	0	26	27	21
390	2021-08-17 07:19:32.716708+00	2021-08-17 07:19:32.719331+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "da241f84-0a6a-4d4d-8f34-9e6b6aad725d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-9c78-5455-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-9c78-5455-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_21_x9o0zwv8/awx_21_kt3wo3wy/project/project_update.yml:188", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"results": [{"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yml"}}, {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yaml"}}], "msg": "All items completed", "changed": false}, "start": "2021-08-17T07:19:32.170572", "end": "2021-08-17T07:19:32.716610", "duration": 0.546038, "event_loop": "items", "uuid": "eeb0845d-6aa8-479f-97ab-26c3fbb1e76c"}	f	f	eeb0845d-6aa8-479f-97ab-26c3fbb1e76c	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	27		0	27	27	21
391	2021-08-17 07:19:32.720192+00	2021-08-17 07:19:32.723971+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "da241f84-0a6a-4d4d-8f34-9e6b6aad725d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-9c78-5455-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-9c78-5455-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_21_x9o0zwv8/awx_21_kt3wo3wy/project/project_update.yml:194", "name": "fetch galaxy collections from collections/requirements.(yml/yaml)", "is_conditional": false, "uuid": "0242ac12-0005-9c78-5455-000000000023"}	f	f	0242ac12-0005-9c78-5455-000000000023	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	28	\r\nTASK [fetch galaxy collections from collections/requirements.(yml/yaml)] *******	0	27	29	21
392	2021-08-17 07:19:32.720843+00	2021-08-17 07:19:32.72548+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "da241f84-0a6a-4d4d-8f34-9e6b6aad725d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-9c78-5455-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-9c78-5455-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_21_x9o0zwv8/awx_21_kt3wo3wy/project/project_update.yml:194", "host": "localhost", "uuid": "54b70379-0d38-4094-a16e-e3efb6d68a69"}	f	f	54b70379-0d38-4094-a16e-e3efb6d68a69	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	29		0	29	29	21
393	2021-08-17 07:19:32.931086+00	2021-08-17 07:19:32.932882+00	runner_item_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "da241f84-0a6a-4d4d-8f34-9e6b6aad725d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-9c78-5455-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-9c78-5455-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_21_x9o0zwv8/awx_21_kt3wo3wy/project/project_update.yml:194", "host": "localhost", "res": {"changed": false, "skip_reason": "Conditional result was False", "_ansible_no_log": false, "item": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item"}, "ansible_loop_var": "item", "_ansible_item_label": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item"}}, "uuid": "3dd0f8dd-93fa-4b98-9cbc-a358f2dd06df"}	f	f	3dd0f8dd-93fa-4b98-9cbc-a358f2dd06df	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	30	[0;36mskipping: [localhost] => (item={'changed': False, 'stat': {'exists': False}, 'invocation': {'module_args': {'path': '/var/lib/awx/projects/_13__winserver/collections/requirements.yml', 'follow': False, 'get_md5': False, 'get_checksum': True, 'get_mime': True, 'get_attributes': True, 'checksum_algorithm': 'sha1'}}, 'failed': False, 'item': {'ext': '.yml'}, 'ansible_loop_var': 'item'}) [0m	0	29	30	21
394	2021-08-17 07:19:32.94133+00	2021-08-17 07:19:32.943271+00	runner_item_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "da241f84-0a6a-4d4d-8f34-9e6b6aad725d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-9c78-5455-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-9c78-5455-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_21_x9o0zwv8/awx_21_kt3wo3wy/project/project_update.yml:194", "host": "localhost", "res": {"changed": false, "skip_reason": "Conditional result was False", "_ansible_no_log": false, "item": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item"}, "ansible_loop_var": "item", "_ansible_item_label": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item"}}, "uuid": "54705561-18fb-4fd6-8d72-bed15cf89c7a"}	f	f	54705561-18fb-4fd6-8d72-bed15cf89c7a	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	31	[0;36mskipping: [localhost] => (item={'changed': False, 'stat': {'exists': False}, 'invocation': {'module_args': {'path': '/var/lib/awx/projects/_13__winserver/collections/requirements.yaml', 'follow': False, 'get_md5': False, 'get_checksum': True, 'get_mime': True, 'get_attributes': True, 'checksum_algorithm': 'sha1'}}, 'failed': False, 'item': {'ext': '.yaml'}, 'ansible_loop_var': 'item'}) [0m	0	30	31	21
395	2021-08-17 07:19:32.944572+00	2021-08-17 07:19:32.946201+00	playbook_on_stats	{"playbook": "project_update.yml", "playbook_uuid": "da241f84-0a6a-4d4d-8f34-9e6b6aad725d", "changed": {"localhost": 1}, "dark": {}, "failures": {}, "ignored": {}, "ok": {"localhost": 5}, "processed": {"localhost": 1}, "rescued": {}, "skipped": {"localhost": 2}, "artifact_data": {}, "uuid": "86f47309-290d-4076-a913-d3fb76fb8d04"}	f	t	86f47309-290d-4076-a913-d3fb76fb8d04	project_update.yml				33	\r\nPLAY RECAP *********************************************************************\r\n[0;33mlocalhost[0m                  : [0;32mok=5   [0m [0;33mchanged=1   [0m unreachable=0    failed=0    [0;36mskipped=2   [0m rescued=0    ignored=0   \r\n	0	31	35	21
396	2021-08-17 07:19:32.942315+00	2021-08-17 07:19:32.946131+00	runner_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "da241f84-0a6a-4d4d-8f34-9e6b6aad725d", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-9c78-5455-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-9c78-5455-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_21_x9o0zwv8/awx_21_kt3wo3wy/project/project_update.yml:194", "host": "localhost", "remote_addr": "127.0.0.1", "start": "2021-08-17T07:19:32.720766", "end": "2021-08-17T07:19:32.942172", "duration": 0.221406, "event_loop": "items", "uuid": "fb9d40dd-308f-4d17-8188-484be7880c34"}	f	f	fb9d40dd-308f-4d17-8188-484be7880c34	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	32		0	31	31	21
399	2021-08-17 07:20:25.879451+00	2021-08-17 07:20:25.883407+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "491edf08-3de5-4678-8dfb-130296824545", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-a39f-bc88-000000000006", "play_pattern": "localhost", "task": "update project using git", "task_uuid": "0242ac12-0005-a39f-bc88-00000000000a", "task_action": "git", "task_args": "", "task_path": "/tmp/bwrap_23_phnll4jj/awx_23_btzg_d4e/project/project_update.yml:34", "name": "update project using git", "is_conditional": false, "uuid": "0242ac12-0005-a39f-bc88-00000000000a"}	f	f	0242ac12-0005-a39f-bc88-00000000000a	project_update.yml	Update source tree if necessary		update project using git	3	\r\nTASK [update project using git] ************************************************	0	2	4	23
400	2021-08-17 07:20:25.880155+00	2021-08-17 07:20:25.884618+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "491edf08-3de5-4678-8dfb-130296824545", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-a39f-bc88-000000000006", "play_pattern": "localhost", "task": "update project using git", "task_uuid": "0242ac12-0005-a39f-bc88-00000000000a", "task_action": "git", "task_args": "", "task_path": "/tmp/bwrap_23_phnll4jj/awx_23_btzg_d4e/project/project_update.yml:34", "host": "localhost", "uuid": "bfd5bfe3-378f-4320-a5a9-b95c84d8bc8d"}	f	f	bfd5bfe3-378f-4320-a5a9-b95c84d8bc8d	project_update.yml	Update source tree if necessary		update project using git	4		0	4	4	23
401	2021-08-17 07:20:27.261531+00	2021-08-17 07:20:27.264798+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "491edf08-3de5-4678-8dfb-130296824545", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-a39f-bc88-000000000006", "play_pattern": "localhost", "task": "update project using git", "task_uuid": "0242ac12-0005-a39f-bc88-00000000000a", "task_action": "git", "task_args": "", "task_path": "/tmp/bwrap_23_phnll4jj/awx_23_btzg_d4e/project/project_update.yml:34", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"changed": false, "before": "f34509208c70e4ccedbd54480abf68b01f9d221b", "remote_url_changed": false, "after": "f34509208c70e4ccedbd54480abf68b01f9d221b", "invocation": {"module_args": {"dest": "/var/lib/awx/projects/_13__winserver", "repo": "https://$encrypted$:$encrypted$@github.com/rmspavan/AnsibleTower.git", "version": "HEAD", "force": false, "remote": "origin", "clone": true, "update": true, "verify_commit": false, "gpg_whitelist": [], "accept_hostkey": false, "bare": false, "recursive": true, "track_submodules": false, "refspec": null, "reference": null, "depth": null, "key_file": null, "ssh_opts": null, "executable": null, "umask": null, "archive": null, "separate_git_dir": null}}, "_ansible_no_log": false}, "start": "2021-08-17T07:20:25.880075", "end": "2021-08-17T07:20:27.261320", "duration": 1.381245, "event_loop": null, "uuid": "4078e509-1843-413c-9263-be9bc69be464"}	f	f	4078e509-1843-413c-9263-be9bc69be464	project_update.yml	Update source tree if necessary		update project using git	5	[0;32mok: [localhost][0m	0	4	5	23
402	2021-08-17 07:20:27.265695+00	2021-08-17 07:20:27.267237+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "491edf08-3de5-4678-8dfb-130296824545", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-a39f-bc88-000000000006", "play_pattern": "localhost", "task": "Set the git repository version", "task_uuid": "0242ac12-0005-a39f-bc88-00000000000b", "task_action": "set_fact", "task_args": "", "task_path": "/tmp/bwrap_23_phnll4jj/awx_23_btzg_d4e/project/project_update.yml:44", "name": "Set the git repository version", "is_conditional": false, "uuid": "0242ac12-0005-a39f-bc88-00000000000b"}	f	f	0242ac12-0005-a39f-bc88-00000000000b	project_update.yml	Update source tree if necessary		Set the git repository version	6	\r\nTASK [Set the git repository version] ******************************************	0	5	7	23
403	2021-08-17 07:20:27.266534+00	2021-08-17 07:20:27.268408+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "491edf08-3de5-4678-8dfb-130296824545", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-a39f-bc88-000000000006", "play_pattern": "localhost", "task": "Set the git repository version", "task_uuid": "0242ac12-0005-a39f-bc88-00000000000b", "task_action": "set_fact", "task_args": "", "task_path": "/tmp/bwrap_23_phnll4jj/awx_23_btzg_d4e/project/project_update.yml:44", "host": "localhost", "uuid": "532f0456-260e-4025-a579-88bae6e8e998"}	f	f	532f0456-260e-4025-a579-88bae6e8e998	project_update.yml	Update source tree if necessary		Set the git repository version	7		0	7	7	23
404	2021-08-17 07:20:27.436318+00	2021-08-17 07:20:27.439439+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "491edf08-3de5-4678-8dfb-130296824545", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-a39f-bc88-000000000006", "play_pattern": "localhost", "task": "Set the git repository version", "task_uuid": "0242ac12-0005-a39f-bc88-00000000000b", "task_action": "set_fact", "task_args": "", "task_path": "/tmp/bwrap_23_phnll4jj/awx_23_btzg_d4e/project/project_update.yml:44", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"changed": false, "ansible_facts": {"scm_version": "f34509208c70e4ccedbd54480abf68b01f9d221b"}, "_ansible_no_log": false}, "start": "2021-08-17T07:20:27.266454", "end": "2021-08-17T07:20:27.436133", "duration": 0.169679, "event_loop": null, "uuid": "0a6e4672-776f-472b-82e3-6fcfcf44b6a4"}	f	f	0a6e4672-776f-472b-82e3-6fcfcf44b6a4	project_update.yml	Update source tree if necessary		Set the git repository version	8	[0;32mok: [localhost][0m	0	7	8	23
405	2021-08-17 07:20:27.439976+00	2021-08-17 07:20:27.441769+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "491edf08-3de5-4678-8dfb-130296824545", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-a39f-bc88-000000000006", "play_pattern": "localhost", "task": "Repository Version", "task_uuid": "0242ac12-0005-a39f-bc88-00000000001c", "task_action": "debug", "task_args": "", "task_path": "/tmp/bwrap_23_phnll4jj/awx_23_btzg_d4e/project/project_update.yml:142", "name": "Repository Version", "is_conditional": false, "uuid": "0242ac12-0005-a39f-bc88-00000000001c"}	f	f	0242ac12-0005-a39f-bc88-00000000001c	project_update.yml	Update source tree if necessary		Repository Version	9	\r\nTASK [Repository Version] ******************************************************	0	8	10	23
406	2021-08-17 07:20:27.440828+00	2021-08-17 07:20:27.444109+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "491edf08-3de5-4678-8dfb-130296824545", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-a39f-bc88-000000000006", "play_pattern": "localhost", "task": "Repository Version", "task_uuid": "0242ac12-0005-a39f-bc88-00000000001c", "task_action": "debug", "task_args": "", "task_path": "/tmp/bwrap_23_phnll4jj/awx_23_btzg_d4e/project/project_update.yml:142", "host": "localhost", "uuid": "d6e95f78-e88c-499f-9a59-ac579c1183cd"}	f	f	d6e95f78-e88c-499f-9a59-ac579c1183cd	project_update.yml	Update source tree if necessary		Repository Version	10		0	10	10	23
407	2021-08-17 07:20:27.60645+00	2021-08-17 07:20:27.608624+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "491edf08-3de5-4678-8dfb-130296824545", "play": "Update source tree if necessary", "play_uuid": "0242ac12-0005-a39f-bc88-000000000006", "play_pattern": "localhost", "task": "Repository Version", "task_uuid": "0242ac12-0005-a39f-bc88-00000000001c", "task_action": "debug", "task_args": "", "task_path": "/tmp/bwrap_23_phnll4jj/awx_23_btzg_d4e/project/project_update.yml:142", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"msg": "Repository Version f34509208c70e4ccedbd54480abf68b01f9d221b", "_ansible_verbose_always": true, "_ansible_no_log": false, "changed": false}, "start": "2021-08-17T07:20:27.440747", "end": "2021-08-17T07:20:27.606253", "duration": 0.165506, "event_loop": null, "uuid": "5d82d049-2976-49bf-b5a8-5a8e4d1cbaea"}	f	f	5d82d049-2976-49bf-b5a8-5a8e4d1cbaea	project_update.yml	Update source tree if necessary		Repository Version	11	[0;32mok: [localhost] => {[0m\r\n[0;32m    "msg": "Repository Version f34509208c70e4ccedbd54480abf68b01f9d221b"[0m\r\n[0;32m}[0m	0	10	13	23
408	2021-08-17 07:20:27.610936+00	2021-08-17 07:20:27.613022+00	playbook_on_play_start	{"playbook": "project_update.yml", "playbook_uuid": "491edf08-3de5-4678-8dfb-130296824545", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-a39f-bc88-00000000001d", "play_pattern": "localhost", "name": "Install content with ansible-galaxy command if necessary", "pattern": "localhost", "uuid": "0242ac12-0005-a39f-bc88-00000000001d"}	f	f	0242ac12-0005-a39f-bc88-00000000001d	project_update.yml	Install content with ansible-galaxy command if necessary			12	\r\nPLAY [Install content with ansible-galaxy command if necessary] ****************	0	13	15	23
409	2021-08-17 07:20:27.6158+00	2021-08-17 07:20:27.617689+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "491edf08-3de5-4678-8dfb-130296824545", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-a39f-bc88-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-a39f-bc88-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_23_phnll4jj/awx_23_btzg_d4e/project/project_update.yml:162", "name": "detect roles/requirements.(yml/yaml)", "is_conditional": false, "uuid": "0242ac12-0005-a39f-bc88-00000000001f"}	f	f	0242ac12-0005-a39f-bc88-00000000001f	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	13	\r\nTASK [detect roles/requirements.(yml/yaml)] ************************************	0	15	17	23
410	2021-08-17 07:20:27.61636+00	2021-08-17 07:20:27.618771+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "491edf08-3de5-4678-8dfb-130296824545", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-a39f-bc88-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-a39f-bc88-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_23_phnll4jj/awx_23_btzg_d4e/project/project_update.yml:162", "host": "localhost", "uuid": "84e489ea-dadc-46c9-9ad8-258181fa588d"}	f	f	84e489ea-dadc-46c9-9ad8-258181fa588d	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	14		0	17	17	23
411	2021-08-17 07:20:28.089308+00	2021-08-17 07:20:28.091422+00	runner_item_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "491edf08-3de5-4678-8dfb-130296824545", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-a39f-bc88-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-a39f-bc88-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_23_phnll4jj/awx_23_btzg_d4e/project/project_update.yml:162", "host": "localhost", "res": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yml"}}, "uuid": "63f21f78-5b71-4c8f-b7fb-d6e5b0223966"}	f	f	63f21f78-5b71-4c8f-b7fb-d6e5b0223966	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	15	[0;32mok: [localhost] => (item={'ext': '.yml'})[0m	0	17	18	23
412	2021-08-17 07:20:28.265099+00	2021-08-17 07:20:28.266869+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "491edf08-3de5-4678-8dfb-130296824545", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-a39f-bc88-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-a39f-bc88-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_23_phnll4jj/awx_23_btzg_d4e/project/project_update.yml:162", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"results": [{"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yml"}}, {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yaml"}}], "msg": "All items completed", "changed": false}, "start": "2021-08-17T07:20:27.616286", "end": "2021-08-17T07:20:28.265006", "duration": 0.64872, "event_loop": "items", "uuid": "1851bdd3-f1a7-409a-a718-37e4020c0d2e"}	f	f	1851bdd3-f1a7-409a-a718-37e4020c0d2e	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	17		0	19	19	23
414	2021-08-17 07:20:28.264159+00	2021-08-17 07:20:28.267799+00	runner_item_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "491edf08-3de5-4678-8dfb-130296824545", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-a39f-bc88-00000000001d", "play_pattern": "localhost", "task": "detect roles/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-a39f-bc88-00000000001f", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_23_phnll4jj/awx_23_btzg_d4e/project/project_update.yml:162", "host": "localhost", "res": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yaml"}}, "uuid": "ec2a4c95-99cf-400b-9118-f9fba7204030"}	f	f	ec2a4c95-99cf-400b-9118-f9fba7204030	project_update.yml	Install content with ansible-galaxy command if necessary		detect roles/requirements.(yml/yaml)	16	[0;32mok: [localhost] => (item={'ext': '.yaml'})[0m	0	18	19	23
413	2021-08-17 07:20:28.270346+00	2021-08-17 07:20:28.273954+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "491edf08-3de5-4678-8dfb-130296824545", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-a39f-bc88-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-a39f-bc88-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_23_phnll4jj/awx_23_btzg_d4e/project/project_update.yml:168", "host": "localhost", "uuid": "d6ad0635-ee0f-4812-9b4e-938a01aacab7"}	f	f	d6ad0635-ee0f-4812-9b4e-938a01aacab7	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	19		0	21	21	23
415	2021-08-17 07:20:28.269587+00	2021-08-17 07:20:28.273467+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "491edf08-3de5-4678-8dfb-130296824545", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-a39f-bc88-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-a39f-bc88-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_23_phnll4jj/awx_23_btzg_d4e/project/project_update.yml:168", "name": "fetch galaxy roles from requirements.(yml/yaml)", "is_conditional": false, "uuid": "0242ac12-0005-a39f-bc88-000000000020"}	f	f	0242ac12-0005-a39f-bc88-000000000020	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	18	\r\nTASK [fetch galaxy roles from requirements.(yml/yaml)] *************************	0	19	21	23
416	2021-08-17 07:20:28.486137+00	2021-08-17 07:20:28.49172+00	runner_item_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "491edf08-3de5-4678-8dfb-130296824545", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-a39f-bc88-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-a39f-bc88-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_23_phnll4jj/awx_23_btzg_d4e/project/project_update.yml:168", "host": "localhost", "res": {"changed": false, "skip_reason": "Conditional result was False", "_ansible_no_log": false, "item": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item"}, "ansible_loop_var": "item", "_ansible_item_label": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item"}}, "uuid": "5da75db6-cd4d-44c7-95b3-f9623399c382"}	f	f	5da75db6-cd4d-44c7-95b3-f9623399c382	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	21	[0;36mskipping: [localhost] => (item={'changed': False, 'stat': {'exists': False}, 'invocation': {'module_args': {'path': '/var/lib/awx/projects/_13__winserver/roles/requirements.yaml', 'follow': False, 'get_md5': False, 'get_checksum': True, 'get_mime': True, 'get_attributes': True, 'checksum_algorithm': 'sha1'}}, 'failed': False, 'item': {'ext': '.yaml'}, 'ansible_loop_var': 'item'}) [0m	0	22	23	23
417	2021-08-17 07:20:28.483222+00	2021-08-17 07:20:28.489021+00	runner_item_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "491edf08-3de5-4678-8dfb-130296824545", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-a39f-bc88-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-a39f-bc88-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_23_phnll4jj/awx_23_btzg_d4e/project/project_update.yml:168", "host": "localhost", "res": {"changed": false, "skip_reason": "Conditional result was False", "_ansible_no_log": false, "item": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item"}, "ansible_loop_var": "item", "_ansible_item_label": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/roles/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item"}}, "uuid": "ae217054-fa01-4db8-b954-a331034c4007"}	f	f	ae217054-fa01-4db8-b954-a331034c4007	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	20	[0;36mskipping: [localhost] => (item={'changed': False, 'stat': {'exists': False}, 'invocation': {'module_args': {'path': '/var/lib/awx/projects/_13__winserver/roles/requirements.yml', 'follow': False, 'get_md5': False, 'get_checksum': True, 'get_mime': True, 'get_attributes': True, 'checksum_algorithm': 'sha1'}}, 'failed': False, 'item': {'ext': '.yml'}, 'ansible_loop_var': 'item'}) [0m	0	21	22	23
418	2021-08-17 07:20:28.490359+00	2021-08-17 07:20:28.495007+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "491edf08-3de5-4678-8dfb-130296824545", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-a39f-bc88-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-a39f-bc88-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_23_phnll4jj/awx_23_btzg_d4e/project/project_update.yml:188", "name": "detect collections/requirements.(yml/yaml)", "is_conditional": false, "uuid": "0242ac12-0005-a39f-bc88-000000000022"}	f	f	0242ac12-0005-a39f-bc88-000000000022	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	23	\r\nTASK [detect collections/requirements.(yml/yaml)] ******************************	0	23	25	23
419	2021-08-17 07:20:28.487091+00	2021-08-17 07:20:28.497914+00	runner_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "491edf08-3de5-4678-8dfb-130296824545", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-a39f-bc88-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy roles from requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-a39f-bc88-000000000020", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_23_phnll4jj/awx_23_btzg_d4e/project/project_update.yml:168", "host": "localhost", "remote_addr": "127.0.0.1", "start": "2021-08-17T07:20:28.270268", "end": "2021-08-17T07:20:28.486994", "duration": 0.216726, "event_loop": "items", "uuid": "7a0285b6-a87a-4550-b746-a92ce3273720"}	f	f	7a0285b6-a87a-4550-b746-a92ce3273720	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy roles from requirements.(yml/yaml)	22		0	23	23	23
420	2021-08-17 07:20:28.494298+00	2021-08-17 07:20:28.884085+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "491edf08-3de5-4678-8dfb-130296824545", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-a39f-bc88-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-a39f-bc88-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_23_phnll4jj/awx_23_btzg_d4e/project/project_update.yml:188", "host": "localhost", "uuid": "63dd32b7-7a13-40a7-bc3c-1ef239bf7abd"}	f	f	63dd32b7-7a13-40a7-bc3c-1ef239bf7abd	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	24		0	25	25	23
421	2021-08-17 07:20:28.881737+00	2021-08-17 07:20:28.884085+00	runner_item_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "491edf08-3de5-4678-8dfb-130296824545", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-a39f-bc88-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-a39f-bc88-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_23_phnll4jj/awx_23_btzg_d4e/project/project_update.yml:188", "host": "localhost", "res": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yml"}}, "uuid": "6af25057-1d53-4b91-ac90-7e754d8aa644"}	f	f	6af25057-1d53-4b91-ac90-7e754d8aa644	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	25	[0;32mok: [localhost] => (item={'ext': '.yml'})[0m	0	25	26	23
422	2021-08-17 07:20:29.051654+00	2021-08-17 07:20:29.053452+00	runner_item_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "491edf08-3de5-4678-8dfb-130296824545", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-a39f-bc88-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-a39f-bc88-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_23_phnll4jj/awx_23_btzg_d4e/project/project_update.yml:188", "host": "localhost", "res": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yaml"}}, "uuid": "85ad65f7-f388-4a19-85b7-0079bb9539f9"}	f	f	85ad65f7-f388-4a19-85b7-0079bb9539f9	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	26	[0;32mok: [localhost] => (item={'ext': '.yaml'})[0m	0	26	27	23
423	2021-08-17 07:20:29.052533+00	2021-08-17 07:20:29.05541+00	runner_on_ok	{"playbook": "project_update.yml", "playbook_uuid": "491edf08-3de5-4678-8dfb-130296824545", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-a39f-bc88-00000000001d", "play_pattern": "localhost", "task": "detect collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-a39f-bc88-000000000022", "task_action": "stat", "task_args": "", "task_path": "/tmp/bwrap_23_phnll4jj/awx_23_btzg_d4e/project/project_update.yml:188", "host": "localhost", "remote_addr": "127.0.0.1", "res": {"results": [{"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yml"}}, {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "_ansible_no_log": false, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item", "_ansible_item_label": {"ext": ".yaml"}}], "msg": "All items completed", "changed": false}, "start": "2021-08-17T07:20:28.494191", "end": "2021-08-17T07:20:29.052438", "duration": 0.558247, "event_loop": "items", "uuid": "970d7414-a600-41c3-af78-2c23813d79da"}	f	f	970d7414-a600-41c3-af78-2c23813d79da	project_update.yml	Install content with ansible-galaxy command if necessary		detect collections/requirements.(yml/yaml)	27		0	27	27	23
424	2021-08-17 07:20:29.055724+00	2021-08-17 07:20:29.057428+00	playbook_on_task_start	{"playbook": "project_update.yml", "playbook_uuid": "491edf08-3de5-4678-8dfb-130296824545", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-a39f-bc88-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-a39f-bc88-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_23_phnll4jj/awx_23_btzg_d4e/project/project_update.yml:194", "name": "fetch galaxy collections from collections/requirements.(yml/yaml)", "is_conditional": false, "uuid": "0242ac12-0005-a39f-bc88-000000000023"}	f	f	0242ac12-0005-a39f-bc88-000000000023	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	28	\r\nTASK [fetch galaxy collections from collections/requirements.(yml/yaml)] *******	0	27	29	23
425	2021-08-17 07:20:29.056339+00	2021-08-17 07:20:29.058772+00	runner_on_start	{"playbook": "project_update.yml", "playbook_uuid": "491edf08-3de5-4678-8dfb-130296824545", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-a39f-bc88-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-a39f-bc88-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_23_phnll4jj/awx_23_btzg_d4e/project/project_update.yml:194", "host": "localhost", "uuid": "12e27537-c252-4893-911a-4e4e11e841cb"}	f	f	12e27537-c252-4893-911a-4e4e11e841cb	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	29		0	29	29	23
426	2021-08-17 07:20:29.266621+00	2021-08-17 07:20:29.268438+00	runner_item_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "491edf08-3de5-4678-8dfb-130296824545", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-a39f-bc88-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-a39f-bc88-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_23_phnll4jj/awx_23_btzg_d4e/project/project_update.yml:194", "host": "localhost", "res": {"changed": false, "skip_reason": "Conditional result was False", "_ansible_no_log": false, "item": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item"}, "ansible_loop_var": "item", "_ansible_item_label": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yml"}, "ansible_loop_var": "item"}}, "uuid": "effc379c-ab0f-44e0-a2d1-422bfe192bc1"}	f	f	effc379c-ab0f-44e0-a2d1-422bfe192bc1	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	30	[0;36mskipping: [localhost] => (item={'changed': False, 'stat': {'exists': False}, 'invocation': {'module_args': {'path': '/var/lib/awx/projects/_13__winserver/collections/requirements.yml', 'follow': False, 'get_md5': False, 'get_checksum': True, 'get_mime': True, 'get_attributes': True, 'checksum_algorithm': 'sha1'}}, 'failed': False, 'item': {'ext': '.yml'}, 'ansible_loop_var': 'item'}) [0m	0	29	30	23
427	2021-08-17 07:20:29.276854+00	2021-08-17 07:20:29.279559+00	runner_item_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "491edf08-3de5-4678-8dfb-130296824545", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-a39f-bc88-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-a39f-bc88-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_23_phnll4jj/awx_23_btzg_d4e/project/project_update.yml:194", "host": "localhost", "res": {"changed": false, "skip_reason": "Conditional result was False", "_ansible_no_log": false, "item": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item"}, "ansible_loop_var": "item", "_ansible_item_label": {"changed": false, "stat": {"exists": false}, "invocation": {"module_args": {"path": "/var/lib/awx/projects/_13__winserver/collections/requirements.yaml", "follow": false, "get_md5": false, "get_checksum": true, "get_mime": true, "get_attributes": true, "checksum_algorithm": "sha1"}}, "failed": false, "item": {"ext": ".yaml"}, "ansible_loop_var": "item"}}, "uuid": "d4211edb-e116-4b31-8b94-d4572d4093ab"}	f	f	d4211edb-e116-4b31-8b94-d4572d4093ab	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	31	[0;36mskipping: [localhost] => (item={'changed': False, 'stat': {'exists': False}, 'invocation': {'module_args': {'path': '/var/lib/awx/projects/_13__winserver/collections/requirements.yaml', 'follow': False, 'get_md5': False, 'get_checksum': True, 'get_mime': True, 'get_attributes': True, 'checksum_algorithm': 'sha1'}}, 'failed': False, 'item': {'ext': '.yaml'}, 'ansible_loop_var': 'item'}) [0m	0	30	31	23
428	2021-08-17 07:20:29.277901+00	2021-08-17 07:20:29.2796+00	runner_on_skipped	{"playbook": "project_update.yml", "playbook_uuid": "491edf08-3de5-4678-8dfb-130296824545", "play": "Install content with ansible-galaxy command if necessary", "play_uuid": "0242ac12-0005-a39f-bc88-00000000001d", "play_pattern": "localhost", "task": "fetch galaxy collections from collections/requirements.(yml/yaml)", "task_uuid": "0242ac12-0005-a39f-bc88-000000000023", "task_action": "command", "task_args": "", "task_path": "/tmp/bwrap_23_phnll4jj/awx_23_btzg_d4e/project/project_update.yml:194", "host": "localhost", "remote_addr": "127.0.0.1", "start": "2021-08-17T07:20:29.056261", "end": "2021-08-17T07:20:29.277778", "duration": 0.221517, "event_loop": "items", "uuid": "1435d52d-5230-44bb-a049-816b9a125f3d"}	f	f	1435d52d-5230-44bb-a049-816b9a125f3d	project_update.yml	Install content with ansible-galaxy command if necessary		fetch galaxy collections from collections/requirements.(yml/yaml)	32		0	31	31	23
429	2021-08-17 07:20:29.280425+00	2021-08-17 07:20:29.284147+00	playbook_on_stats	{"playbook": "project_update.yml", "playbook_uuid": "491edf08-3de5-4678-8dfb-130296824545", "changed": {}, "dark": {}, "failures": {}, "ignored": {}, "ok": {"localhost": 5}, "processed": {"localhost": 1}, "rescued": {}, "skipped": {"localhost": 2}, "artifact_data": {}, "uuid": "5eb913e5-fd23-432c-a342-4384a5c88ea4"}	f	f	5eb913e5-fd23-432c-a342-4384a5c88ea4	project_update.yml				33	\r\nPLAY RECAP *********************************************************************\r\n[0;32mlocalhost[0m                  : [0;32mok=5   [0m changed=0    unreachable=0    failed=0    [0;36mskipped=2   [0m rescued=0    ignored=0   \r\n	0	31	35	23
\.


--
-- Data for Name: main_rbac_role_ancestors; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_rbac_role_ancestors (id, role_field, content_type_id, object_id, ancestor_id, descendent_id) FROM stdin;
1	system_administrator	0	0	1	1
2	execute_role	37	1	3	3
3	admin_role	37	1	2	2
4	system_auditor	0	0	14	14
5	project_admin_role	37	1	4	4
6	job_template_admin_role	37	1	9	9
7	notification_admin_role	37	1	8	8
8	auditor_role	37	1	10	10
9	workflow_admin_role	37	1	7	7
10	approval_role	37	1	13	13
11	inventory_admin_role	37	1	5	5
12	admin_role	37	1	1	2
13	read_role	37	1	12	12
14	member_role	37	1	11	11
15	credential_admin_role	37	1	6	6
16	inventory_admin_role	37	1	1	5
17	approval_role	37	1	1	13
18	read_role	37	1	6	12
19	auditor_role	37	1	14	10
20	read_role	37	1	11	12
21	project_admin_role	37	1	2	4
22	project_admin_role	37	1	1	4
23	read_role	37	1	9	12
24	notification_admin_role	37	1	2	8
25	member_role	37	1	1	11
26	job_template_admin_role	37	1	1	9
27	read_role	37	1	13	12
28	inventory_admin_role	37	1	2	5
29	approval_role	37	1	2	13
30	member_role	37	1	2	11
31	read_role	37	1	10	12
32	read_role	37	1	7	12
33	workflow_admin_role	37	1	2	7
34	job_template_admin_role	37	1	2	9
35	notification_admin_role	37	1	1	8
36	execute_role	37	1	2	3
37	read_role	37	1	4	12
38	read_role	37	1	5	12
39	read_role	37	1	8	12
40	read_role	37	1	3	12
41	workflow_admin_role	37	1	1	7
42	execute_role	37	1	1	3
43	credential_admin_role	37	1	1	6
44	credential_admin_role	37	1	2	6
45	read_role	37	1	1	12
46	read_role	37	1	2	12
47	read_role	37	1	14	12
48	admin_role	5	6	4	15
49	admin_role	5	6	2	15
50	use_role	5	6	16	16
51	read_role	5	6	10	18
52	admin_role	5	6	1	15
53	read_role	5	6	18	18
54	update_role	5	6	17	17
55	read_role	5	6	14	18
56	admin_role	5	6	15	15
57	update_role	5	6	2	17
58	update_role	5	6	1	17
59	use_role	5	6	4	16
60	read_role	5	6	16	18
61	update_role	5	6	15	17
62	use_role	5	6	2	16
63	use_role	5	6	1	16
64	read_role	5	6	17	18
65	update_role	5	6	4	17
66	use_role	5	6	15	16
67	read_role	5	6	15	18
68	read_role	5	6	4	18
69	read_role	5	6	1	18
70	read_role	5	6	2	18
71	admin_role	29	1	1	19
72	admin_role	29	1	19	19
73	read_role	29	1	14	21
74	use_role	29	1	20	20
75	read_role	29	1	21	21
76	use_role	29	1	19	20
77	read_role	29	1	20	21
78	use_role	29	1	1	20
79	read_role	29	1	19	21
80	read_role	29	1	1	21
81	read_role	29	2	24	24
82	use_role	29	2	23	23
83	read_role	29	2	14	24
84	admin_role	29	2	22	22
85	admin_role	29	2	1	22
86	read_role	29	2	23	24
87	use_role	29	2	22	23
88	use_role	29	2	1	23
89	read_role	29	2	22	24
90	read_role	29	2	1	24
91	admin_role	34	1	5	25
92	read_role	34	1	10	29
93	adhoc_role	34	1	27	27
94	update_role	34	1	26	26
95	read_role	34	1	29	29
96	use_role	34	1	28	28
97	admin_role	34	1	1	25
98	read_role	34	1	14	29
99	admin_role	34	1	2	25
100	admin_role	34	1	25	25
101	update_role	34	1	1	26
102	adhoc_role	34	1	2	27
103	adhoc_role	34	1	1	27
104	adhoc_role	34	1	5	27
105	update_role	34	1	5	26
106	adhoc_role	34	1	25	27
107	read_role	34	1	26	29
108	use_role	34	1	27	28
109	read_role	34	1	1	29
110	read_role	34	1	28	29
111	update_role	34	1	25	26
112	read_role	34	1	25	29
113	read_role	34	1	2	29
114	update_role	34	1	2	26
115	read_role	34	1	5	29
116	use_role	34	1	1	28
117	use_role	34	1	25	28
118	use_role	34	1	2	28
119	read_role	34	1	27	29
120	use_role	34	1	5	28
121	admin_role	4	7	1	30
122	read_role	4	7	14	32
123	admin_role	4	7	9	30
124	read_role	4	7	32	32
125	execute_role	4	7	2	31
126	read_role	4	7	10	32
127	execute_role	4	7	31	31
128	execute_role	4	7	1	31
129	execute_role	4	7	3	31
130	admin_role	4	7	30	30
131	admin_role	4	7	2	30
132	read_role	4	7	30	32
133	read_role	4	7	1	32
134	read_role	4	7	3	32
135	execute_role	4	7	9	31
136	read_role	4	7	9	32
137	read_role	4	7	31	32
138	read_role	4	7	2	32
139	execute_role	4	7	30	31
140	admin_role	34	2	2	33
141	read_role	34	2	10	37
142	adhoc_role	34	2	35	35
143	use_role	34	2	36	36
144	read_role	34	2	14	37
145	admin_role	34	2	5	33
146	read_role	34	2	37	37
147	admin_role	34	2	33	33
148	admin_role	34	2	1	33
149	update_role	34	2	34	34
150	update_role	34	2	1	34
151	read_role	34	2	34	37
152	read_role	34	2	36	37
153	adhoc_role	34	2	33	35
154	read_role	34	2	1	37
155	read_role	34	2	5	37
156	read_role	34	2	2	37
157	adhoc_role	34	2	2	35
158	update_role	34	2	33	34
159	update_role	34	2	2	34
160	adhoc_role	34	2	5	35
161	adhoc_role	34	2	1	35
162	read_role	34	2	33	37
163	use_role	34	2	35	36
164	update_role	34	2	5	34
165	read_role	34	2	35	37
166	use_role	34	2	1	36
167	use_role	34	2	33	36
168	use_role	34	2	2	36
169	use_role	34	2	5	36
170	use_role	29	3	39	39
171	admin_role	29	3	2	38
172	admin_role	29	3	6	38
173	read_role	29	3	14	40
174	admin_role	29	3	38	38
175	read_role	29	3	40	40
176	read_role	29	3	10	40
177	admin_role	29	3	1	38
178	read_role	29	3	38	40
179	read_role	29	3	39	40
180	use_role	29	3	1	39
181	use_role	29	3	2	39
182	read_role	29	3	2	40
183	use_role	29	3	38	39
184	read_role	29	3	1	40
185	read_role	29	3	6	40
186	use_role	29	3	6	39
187	admin_role	29	4	41	41
188	admin_role	29	4	2	41
189	read_role	29	4	14	43
190	read_role	29	4	10	43
191	admin_role	29	4	1	41
192	read_role	29	4	43	43
193	admin_role	29	4	6	41
194	use_role	29	4	42	42
195	read_role	29	4	6	43
196	read_role	29	4	1	43
197	read_role	29	4	42	43
198	use_role	29	4	1	42
199	read_role	29	4	2	43
200	read_role	29	4	41	43
201	use_role	29	4	6	42
202	use_role	29	4	41	42
203	use_role	29	4	2	42
204	admin_role	5	8	2	44
205	read_role	5	8	47	47
206	update_role	5	8	46	46
207	admin_role	5	8	4	44
208	read_role	5	8	14	47
209	read_role	5	8	10	47
210	admin_role	5	8	1	44
211	use_role	5	8	45	45
212	admin_role	5	8	44	44
213	update_role	5	8	44	46
214	read_role	5	8	45	47
215	update_role	5	8	4	46
216	use_role	5	8	44	45
217	use_role	5	8	2	45
218	update_role	5	8	2	46
219	use_role	5	8	4	45
220	update_role	5	8	1	46
221	use_role	5	8	1	45
222	read_role	5	8	46	47
223	read_role	5	8	4	47
224	read_role	5	8	2	47
225	read_role	5	8	1	47
226	read_role	5	8	44	47
246	read_role	29	5	14	53
247	read_role	29	5	10	53
248	admin_role	29	5	6	51
249	read_role	29	5	53	53
250	admin_role	29	5	1	51
251	use_role	29	5	52	52
252	admin_role	29	5	2	51
253	admin_role	29	5	51	51
254	read_role	29	5	2	53
255	read_role	29	5	52	53
256	use_role	29	5	2	52
257	read_role	29	5	1	53
258	read_role	29	5	6	53
259	use_role	29	5	51	52
260	use_role	29	5	1	52
261	use_role	29	5	6	52
262	read_role	29	5	51	53
263	admin_role	34	3	5	54
264	read_role	34	3	10	58
265	read_role	34	3	14	58
266	update_role	34	3	55	55
267	admin_role	34	3	1	54
268	admin_role	34	3	2	54
269	adhoc_role	34	3	56	56
270	admin_role	34	3	54	54
271	read_role	34	3	58	58
272	use_role	34	3	57	57
273	update_role	34	3	5	55
274	read_role	34	3	55	58
275	use_role	34	3	56	57
276	read_role	34	3	2	58
277	read_role	34	3	57	58
278	update_role	34	3	54	55
279	read_role	34	3	5	58
280	update_role	34	3	2	55
281	read_role	34	3	54	58
282	adhoc_role	34	3	54	56
283	adhoc_role	34	3	2	56
284	adhoc_role	34	3	5	56
285	update_role	34	3	1	55
286	read_role	34	3	1	58
287	adhoc_role	34	3	1	56
288	use_role	34	3	54	57
289	use_role	34	3	1	57
290	use_role	34	3	5	57
291	read_role	34	3	56	58
292	use_role	34	3	2	57
354	use_role	5	13	70	70
355	read_role	5	13	72	72
356	admin_role	5	13	69	69
357	admin_role	5	13	2	69
358	read_role	5	13	10	72
359	admin_role	5	13	1	69
360	admin_role	5	13	4	69
361	read_role	5	13	14	72
362	update_role	5	13	71	71
363	update_role	5	13	4	71
364	use_role	5	13	2	70
365	update_role	5	13	1	71
366	update_role	5	13	2	71
367	use_role	5	13	69	70
368	update_role	5	13	69	71
369	read_role	5	13	70	72
370	use_role	5	13	4	70
371	read_role	5	13	71	72
372	use_role	5	13	1	70
373	read_role	5	13	2	72
374	read_role	5	13	69	72
375	read_role	5	13	1	72
376	read_role	5	13	4	72
\.


--
-- Data for Name: main_rbac_roles; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_rbac_roles (id, role_field, singleton_name, implicit_parents, content_type_id, object_id) FROM stdin;
1	system_administrator	system_administrator	[]	\N	\N
2	admin_role	\N	[1]	37	1
3	execute_role	\N	[2]	37	1
4	project_admin_role	\N	[2]	37	1
5	inventory_admin_role	\N	[2]	37	1
6	credential_admin_role	\N	[2]	37	1
7	workflow_admin_role	\N	[2]	37	1
8	notification_admin_role	\N	[2]	37	1
9	job_template_admin_role	\N	[2]	37	1
14	system_auditor	system_auditor	[]	\N	\N
10	auditor_role	\N	[14]	37	1
11	member_role	\N	[2]	37	1
12	read_role	\N	[3, 4, 5, 6, 7, 8, 9, 10, 11, 13]	37	1
13	approval_role	\N	[2]	37	1
15	admin_role	\N	[1, 4]	5	6
16	use_role	\N	[15]	5	6
17	update_role	\N	[15]	5	6
18	read_role	\N	[10, 14, 16, 17]	5	6
19	admin_role	\N	[1]	29	1
20	use_role	\N	[19]	29	1
21	read_role	\N	[14, 19, 20]	29	1
22	admin_role	\N	[1]	29	2
23	use_role	\N	[22]	29	2
24	read_role	\N	[14, 22, 23]	29	2
25	admin_role	\N	[5]	34	1
26	update_role	\N	[25]	34	1
27	adhoc_role	\N	[25]	34	1
28	use_role	\N	[27]	34	1
29	read_role	\N	[10, 25, 26, 28]	34	1
30	admin_role	\N	[9]	4	7
31	execute_role	\N	[3, 30]	4	7
32	read_role	\N	[10, 30, 31]	4	7
33	admin_role	\N	[5]	34	2
34	update_role	\N	[33]	34	2
35	adhoc_role	\N	[33]	34	2
36	use_role	\N	[35]	34	2
37	read_role	\N	[10, 33, 34, 36]	34	2
38	admin_role	\N	[1, 6]	29	3
39	use_role	\N	[38]	29	3
40	read_role	\N	[10, 14, 38, 39]	29	3
41	admin_role	\N	[1, 6]	29	4
42	use_role	\N	[41]	29	4
43	read_role	\N	[10, 14, 41, 42]	29	4
44	admin_role	\N	[1, 4]	5	8
45	use_role	\N	[44]	5	8
46	update_role	\N	[44]	5	8
47	read_role	\N	[10, 14, 45, 46]	5	8
51	admin_role	\N	[1, 6]	29	5
52	use_role	\N	[51]	29	5
53	read_role	\N	[10, 14, 51, 52]	29	5
54	admin_role	\N	[5]	34	3
55	update_role	\N	[54]	34	3
56	adhoc_role	\N	[54]	34	3
57	use_role	\N	[56]	34	3
58	read_role	\N	[10, 54, 55, 57]	34	3
69	admin_role	\N	[1, 4]	5	13
70	use_role	\N	[69]	5	13
71	update_role	\N	[69]	5	13
72	read_role	\N	[10, 14, 70, 71]	5	13
\.


--
-- Data for Name: main_rbac_roles_members; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_rbac_roles_members (id, role_id, user_id) FROM stdin;
1	1	1
2	19	1
\.


--
-- Data for Name: main_rbac_roles_parents; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_rbac_roles_parents (id, from_role_id, to_role_id) FROM stdin;
1	2	1
2	3	2
3	4	2
4	5	2
5	6	2
6	7	2
7	8	2
8	9	2
9	10	14
10	11	2
11	12	3
12	12	4
13	12	5
14	12	6
15	12	7
16	12	8
17	12	9
18	12	10
19	12	11
20	12	13
21	13	2
22	15	1
23	15	4
24	16	15
25	17	15
26	18	16
27	18	17
28	18	10
29	18	14
30	19	1
31	20	19
32	21	19
33	21	20
34	21	14
35	22	1
36	23	22
37	24	14
38	24	22
39	24	23
40	25	5
41	26	25
42	27	25
43	28	27
44	29	25
45	29	10
46	29	26
47	29	28
48	30	9
49	31	3
50	31	30
51	32	10
52	32	30
53	32	31
54	33	5
55	34	33
56	35	33
57	36	35
58	37	33
59	37	10
60	37	34
61	37	36
62	38	1
63	38	6
64	39	38
65	40	10
66	40	39
67	40	38
68	40	14
69	41	1
70	41	6
71	42	41
72	43	41
73	43	10
74	43	42
75	43	14
76	44	1
77	44	4
78	45	44
79	46	44
80	47	10
81	47	45
82	47	46
83	47	14
90	51	1
91	51	6
92	52	51
93	53	10
94	53	51
95	53	52
96	53	14
97	54	5
98	55	54
99	56	54
100	57	56
101	58	57
102	58	10
103	58	54
104	58	55
125	69	1
126	69	4
127	70	69
128	71	69
129	72	10
130	72	71
131	72	70
132	72	14
\.


--
-- Data for Name: main_schedule; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_schedule (id, created, modified, description, name, enabled, dtstart, dtend, rrule, next_run, extra_data, created_by_id, modified_by_id, unified_job_template_id, char_prompts, inventory_id, survey_passwords) FROM stdin;
4	2021-08-14 13:00:07.006571+00	2021-08-14 13:00:07.006571+00	Cleans out expired browser sessions	Cleanup Expired Sessions	t	2021-08-14 13:00:07+00	2021-08-14 13:00:07+00	DTSTART:20210814T130007Z RRULE:FREQ=WEEKLY;INTERVAL=1;COUNT=1	\N	{}	\N	\N	4	{}	\N	{}
5	2021-08-14 13:00:07.141696+00	2021-08-14 13:00:07.141696+00	Removes expired OAuth 2 access and refresh tokens	Cleanup Expired OAuth 2 Tokens	t	2021-08-14 13:00:07+00	2021-08-14 13:00:07+00	DTSTART:20210814T130007Z RRULE:FREQ=WEEKLY;INTERVAL=1;COUNT=1	\N	{}	\N	\N	5	{}	\N	{}
2	2021-08-14 12:59:03.15785+00	2021-08-14 12:59:03.15785+00	Automatically Generated Schedule	Cleanup Activity Schedule	t	2021-08-17 12:59:03+00	\N	DTSTART:20210814T125903Z RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=TU	2021-08-31 12:59:03+00	{"days": "355"}	\N	\N	2	{}	\N	{}
1	2021-08-14 12:59:03.15785+00	2021-08-14 12:59:03.15785+00	Automatically Generated Schedule	Cleanup Job Schedule	t	2021-08-15 12:59:03+00	\N	DTSTART:20210814T125903Z RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=SU	2021-09-05 12:59:03+00	{"days": "120"}	\N	\N	1	{}	\N	{}
\.


--
-- Data for Name: main_schedule_credentials; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_schedule_credentials (id, schedule_id, credential_id) FROM stdin;
\.


--
-- Data for Name: main_smartinventorymembership; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_smartinventorymembership (id, host_id, inventory_id) FROM stdin;
\.


--
-- Data for Name: main_systemjob; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_systemjob (unifiedjob_ptr_id, job_type, extra_vars, system_job_template_id) FROM stdin;
26	cleanup_jobs	{"days": "120"}	1
27	cleanup_activitystream	{"days": "355"}	2
\.


--
-- Data for Name: main_systemjobevent; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_systemjobevent (id, created, modified, event_data, uuid, counter, stdout, verbosity, start_line, end_line, system_job_id) FROM stdin;
3	2021-08-22 12:59:27.672997+00	2021-08-22 12:59:27.672997+00	{}	60a0da96-d5ba-42d9-9c02-a6a075af58e0	4	inventory updates: 0 deleted, 0 skipped.	0	3	4	26
2	2021-08-22 12:59:27.215014+00	2021-08-22 12:59:27.215014+00	{}	931fe906-75e3-4c6d-9e78-7d0fee0afde8	2	ad hoc commands: 0 deleted, 0 skipped.	0	1	2	26
4	2021-08-22 12:59:27.116626+00	2021-08-22 12:59:27.116626+00	{}	548ee771-2af2-4178-8580-9906482474b2	1	jobs: 0 deleted, 4 skipped.	0	0	1	26
5	2021-08-22 12:59:36.458381+00	2021-08-22 12:59:36.458381+00	{}	2e53f8e0-9be4-4f2c-ab92-c2ca00e75117	6	workflow jobs: 0 deleted, 0 skipped.	0	5	6	26
6	2021-08-22 12:59:36.458374+00	2021-08-22 12:59:36.458374+00	{}	52de24bc-4d08-4aad-9538-831955bdd1ca	7	notifications: 0 deleted, 0 skipped.	0	6	7	26
7	2021-08-22 12:59:36.458375+00	2021-08-22 12:59:36.458375+00	{}	8cd1cb95-788f-4d48-b3dd-efa51a0484d3	5	management jobs: 0 deleted, 1 skipped.	0	4	5	26
8	2021-08-24 12:59:42.788325+00	2021-08-24 12:59:42.788325+00	{}	20040383-a4e3-4bf7-869b-1da7e42530fd	1	Removed 0 items	0	0	1	27
1	2021-08-22 12:59:27.116591+00	2021-08-22 12:59:27.116591+00	{}	f457429e-f7ef-437a-8d8d-f44a1a0301a1	3	project updates: 0 deleted, 8 skipped.	0	2	3	26
\.


--
-- Data for Name: main_systemjobtemplate; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_systemjobtemplate (unifiedjobtemplate_ptr_id, job_type) FROM stdin;
1	cleanup_jobs
2	cleanup_activitystream
4	cleanup_sessions
5	cleanup_tokens
\.


--
-- Data for Name: main_team; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_team (id, created, modified, description, name, created_by_id, modified_by_id, organization_id, admin_role_id, member_role_id, read_role_id) FROM stdin;
\.


--
-- Data for Name: main_towerschedulestate; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_towerschedulestate (id, schedule_last_run) FROM stdin;
1	2021-08-30 04:44:39.377759+00
\.


--
-- Data for Name: main_unifiedjob; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_unifiedjob (id, created, modified, description, name, old_pk, launch_type, cancel_flag, status, failed, started, finished, elapsed, job_args, job_cwd, job_env, job_explanation, start_args, result_stdout_text, result_traceback, celery_task_id, created_by_id, modified_by_id, polymorphic_ctype_id, schedule_id, unified_job_template_id, execution_node, instance_group_id, emitted_events, controller_node, canceled_on, dependencies_processed, organization_id) FROM stdin;
20	2021-08-17 07:17:20.526068+00	2021-08-17 07:17:20.733415+00		winserver	\N	manual	f	failed	t	2021-08-17 07:17:20.774776+00	2021-08-17 07:17:22.202102+00	1.427	["ansible-playbook", "-u", "pdmskul", "--ask-pass", "-i", "/tmp/bwrap_20_paumsrqn/awx_20_sao0k761/tmpgph4m926", "-e", "@/tmp/bwrap_20_paumsrqn/awx_20_sao0k761/env/extravars", "winserver.yml"]	/tmp/bwrap_20_paumsrqn/awx_20_sao0k761/project	{"LC_ALL": "en_US.UTF-8", "SUPERVISOR_WEB_CONFIG_PATH": "/etc/supervisord.conf", "LANG": "en_US.UTF-8", "HOSTNAME": "awx", "AWX_SKIP_MIGRATIONS": "1", "PWD": "/", "HOME": "/var/lib/awx", "SHLVL": "1", "LANGUAGE": "en_US:en", "PATH": "/var/lib/awx/venv/ansible/bin:/usr/pgsql-10/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin", "_": "/usr/local/bin/supervisord", "SUPERVISOR_ENABLED": "1", "SUPERVISOR_SERVER_URL": "unix:///var/run/supervisor/supervisor.sock", "SUPERVISOR_PROCESS_NAME": "dispatcher", "SUPERVISOR_GROUP_NAME": "tower-processes", "DJANGO_SETTINGS_MODULE": "awx.settings.production", "DJANGO_LIVE_TEST_SERVER_ADDRESS": "localhost:9013-9199", "TZ": "UTC", "ANSIBLE_FORCE_COLOR": "True", "ANSIBLE_HOST_KEY_CHECKING": "False", "ANSIBLE_INVENTORY_UNPARSED_FAILED": "True", "ANSIBLE_PARAMIKO_RECORD_HOST_KEYS": "False", "ANSIBLE_VENV_PATH": "/var/lib/awx/venv/ansible", "AWX_PRIVATE_DATA_DIR": "/tmp/bwrap_20_paumsrqn/awx_20_sao0k761", "VIRTUAL_ENV": "/var/lib/awx/venv/ansible", "PYTHONPATH": "/var/lib/awx/venv/ansible/lib/python3.6/site-packages:", "JOB_ID": "20", "INVENTORY_ID": "3", "PROJECT_REVISION": "355d65af0d6cc43865251aea89a57e5c3ae0b282", "ANSIBLE_RETRY_FILES_ENABLED": "False", "MAX_EVENT_RES": "700000", "AWX_HOST": "https://towerhost", "ANSIBLE_SSH_CONTROL_PATH_DIR": "/tmp/bwrap_20_paumsrqn/awx_20_sao0k761/cp", "ANSIBLE_COLLECTIONS_PATHS": "/tmp/bwrap_20_paumsrqn/awx_20_sao0k761/requirements_collections:~/.ansible/collections:/usr/share/ansible/collections", "ANSIBLE_ROLES_PATH": "/tmp/bwrap_20_paumsrqn/awx_20_sao0k761/requirements_roles:~/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles", "ANSIBLE_CALLBACK_PLUGINS": "/var/lib/awx/venv/awx/lib/python3.6/site-packages/ansible_runner/callbacks", "ANSIBLE_STDOUT_CALLBACK": "awx_display", "AWX_ISOLATED_DATA_DIR": "/tmp/bwrap_20_paumsrqn/awx_20_sao0k761/artifacts/20", "RUNNER_OMIT_EVENTS": "False", "RUNNER_ONLY_FAILED_EVENTS": "False"}			\N		5dce58b7-494a-4407-94be-267d84ce40cc	1	\N	9	\N	\N	awx	1	15		\N	f	1
17	2021-08-17 07:15:55.611721+00	2021-08-17 07:16:00.297238+00		winserver	\N	manual	f	successful	f	2021-08-17 07:16:00.337881+00	2021-08-17 07:16:05.158949+00	4.821	["ansible-playbook", "-t", "update_git,install_roles,install_collections", "-i", "/tmp/bwrap_17_cnh8436b/awx_17_njz3midn/inventory/hosts", "-e", "@/tmp/bwrap_17_cnh8436b/awx_17_njz3midn/env/extravars", "project_update.yml"]	/tmp/bwrap_17_cnh8436b/awx_17_njz3midn/project	{"LC_ALL": "en_US.UTF-8", "SUPERVISOR_WEB_CONFIG_PATH": "/etc/supervisord.conf", "LANG": "en_US.UTF-8", "HOSTNAME": "awx", "AWX_SKIP_MIGRATIONS": "1", "PWD": "/", "HOME": "/var/lib/awx", "SHLVL": "1", "LANGUAGE": "en_US:en", "PATH": "/var/lib/awx/venv/ansible/bin:/usr/pgsql-10/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin", "_": "/usr/local/bin/supervisord", "SUPERVISOR_ENABLED": "1", "SUPERVISOR_SERVER_URL": "unix:///var/run/supervisor/supervisor.sock", "SUPERVISOR_PROCESS_NAME": "dispatcher", "SUPERVISOR_GROUP_NAME": "tower-processes", "DJANGO_SETTINGS_MODULE": "awx.settings.production", "DJANGO_LIVE_TEST_SERVER_ADDRESS": "localhost:9013-9199", "TZ": "UTC", "ANSIBLE_FORCE_COLOR": "True", "ANSIBLE_HOST_KEY_CHECKING": "False", "ANSIBLE_INVENTORY_UNPARSED_FAILED": "True", "ANSIBLE_PARAMIKO_RECORD_HOST_KEYS": "False", "ANSIBLE_VENV_PATH": "/var/lib/awx/venv/ansible", "AWX_PRIVATE_DATA_DIR": "/tmp/bwrap_17_cnh8436b/awx_17_njz3midn", "VIRTUAL_ENV": "/var/lib/awx/venv/ansible", "PYTHONPATH": "/var/lib/awx/venv/ansible/lib/python3.6/site-packages:", "ANSIBLE_RETRY_FILES_ENABLED": "False", "ANSIBLE_ASK_PASS": "False", "ANSIBLE_BECOME_ASK_PASS": "False", "DISPLAY": "", "TMP": "/tmp", "PROJECT_UPDATE_ID": "17", "ANSIBLE_GALAXY_SERVER_SERVER0_URL": "https://galaxy.ansible.com/", "ANSIBLE_GALAXY_SERVER_LIST": "server0", "ANSIBLE_CALLBACK_PLUGINS": "/var/lib/awx/venv/awx/lib/python3.6/site-packages/ansible_runner/callbacks", "ANSIBLE_STDOUT_CALLBACK": "awx_display", "AWX_ISOLATED_DATA_DIR": "/tmp/bwrap_17_cnh8436b/awx_17_njz3midn/artifacts/17", "RUNNER_OMIT_EVENTS": "False", "RUNNER_ONLY_FAILED_EVENTS": "False"}			\N		27adedb5-b4c8-4494-94c2-1171e5b9e2f3	1	\N	10	\N	13	awx	1	33		\N	t	1
1	2021-08-17 04:44:37.005941+00	2021-08-17 04:44:37.196625+00		Demo Project	\N	manual	f	successful	f	2021-08-17 04:44:37.305094+00	2021-08-17 04:44:44.160582+00	6.855	["ansible-playbook", "-t", "update_git,install_roles,install_collections", "-i", "/tmp/bwrap_1_nbx_idbg/awx_1_yb8lwdax/inventory/hosts", "-e", "@/tmp/bwrap_1_nbx_idbg/awx_1_yb8lwdax/env/extravars", "project_update.yml"]	/tmp/bwrap_1_nbx_idbg/awx_1_yb8lwdax/project	{"LC_ALL": "en_US.UTF-8", "SUPERVISOR_WEB_CONFIG_PATH": "/etc/supervisord.conf", "LANG": "en_US.UTF-8", "HOSTNAME": "awx", "AWX_SKIP_MIGRATIONS": "1", "PWD": "/", "HOME": "/var/lib/awx", "SHLVL": "1", "LANGUAGE": "en_US:en", "PATH": "/var/lib/awx/venv/ansible/bin:/usr/pgsql-10/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin", "_": "/usr/local/bin/supervisord", "SUPERVISOR_ENABLED": "1", "SUPERVISOR_SERVER_URL": "unix:///var/run/supervisor/supervisor.sock", "SUPERVISOR_PROCESS_NAME": "dispatcher", "SUPERVISOR_GROUP_NAME": "tower-processes", "DJANGO_SETTINGS_MODULE": "awx.settings.production", "DJANGO_LIVE_TEST_SERVER_ADDRESS": "localhost:9013-9199", "TZ": "UTC", "ANSIBLE_FORCE_COLOR": "True", "ANSIBLE_HOST_KEY_CHECKING": "False", "ANSIBLE_INVENTORY_UNPARSED_FAILED": "True", "ANSIBLE_PARAMIKO_RECORD_HOST_KEYS": "False", "ANSIBLE_VENV_PATH": "/var/lib/awx/venv/ansible", "AWX_PRIVATE_DATA_DIR": "/tmp/bwrap_1_nbx_idbg/awx_1_yb8lwdax", "VIRTUAL_ENV": "/var/lib/awx/venv/ansible", "PYTHONPATH": "/var/lib/awx/venv/ansible/lib/python3.6/site-packages:", "ANSIBLE_RETRY_FILES_ENABLED": "False", "ANSIBLE_ASK_PASS": "False", "ANSIBLE_BECOME_ASK_PASS": "False", "DISPLAY": "", "TMP": "/tmp", "PROJECT_UPDATE_ID": "1", "ANSIBLE_GALAXY_SERVER_SERVER0_URL": "https://galaxy.ansible.com/", "ANSIBLE_GALAXY_SERVER_LIST": "server0", "ANSIBLE_CALLBACK_PLUGINS": "/var/lib/awx/venv/awx/lib/python3.6/site-packages/ansible_runner/callbacks", "ANSIBLE_STDOUT_CALLBACK": "awx_display", "AWX_ISOLATED_DATA_DIR": "/tmp/bwrap_1_nbx_idbg/awx_1_yb8lwdax/artifacts/1", "RUNNER_OMIT_EVENTS": "False", "RUNNER_ONLY_FAILED_EVENTS": "False"}			\N		c3910a89-2b58-469c-87bb-f014694614b3	1	\N	10	\N	6	awx	1	33		\N	f	1
21	2021-08-17 07:19:28.128437+00	2021-08-17 07:19:28.234707+00		winserver	\N	manual	f	successful	f	2021-08-17 07:19:28.276644+00	2021-08-17 07:19:33.170118+00	4.893	["ansible-playbook", "-t", "update_git,install_roles,install_collections", "-i", "/tmp/bwrap_21_x9o0zwv8/awx_21_kt3wo3wy/inventory/hosts", "-e", "@/tmp/bwrap_21_x9o0zwv8/awx_21_kt3wo3wy/env/extravars", "project_update.yml"]	/tmp/bwrap_21_x9o0zwv8/awx_21_kt3wo3wy/project	{"LC_ALL": "en_US.UTF-8", "SUPERVISOR_WEB_CONFIG_PATH": "/etc/supervisord.conf", "LANG": "en_US.UTF-8", "HOSTNAME": "awx", "AWX_SKIP_MIGRATIONS": "1", "PWD": "/", "HOME": "/var/lib/awx", "SHLVL": "1", "LANGUAGE": "en_US:en", "PATH": "/var/lib/awx/venv/ansible/bin:/usr/pgsql-10/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin", "_": "/usr/local/bin/supervisord", "SUPERVISOR_ENABLED": "1", "SUPERVISOR_SERVER_URL": "unix:///var/run/supervisor/supervisor.sock", "SUPERVISOR_PROCESS_NAME": "dispatcher", "SUPERVISOR_GROUP_NAME": "tower-processes", "DJANGO_SETTINGS_MODULE": "awx.settings.production", "DJANGO_LIVE_TEST_SERVER_ADDRESS": "localhost:9013-9199", "TZ": "UTC", "ANSIBLE_FORCE_COLOR": "True", "ANSIBLE_HOST_KEY_CHECKING": "False", "ANSIBLE_INVENTORY_UNPARSED_FAILED": "True", "ANSIBLE_PARAMIKO_RECORD_HOST_KEYS": "False", "ANSIBLE_VENV_PATH": "/var/lib/awx/venv/ansible", "AWX_PRIVATE_DATA_DIR": "/tmp/bwrap_21_x9o0zwv8/awx_21_kt3wo3wy", "VIRTUAL_ENV": "/var/lib/awx/venv/ansible", "PYTHONPATH": "/var/lib/awx/venv/ansible/lib/python3.6/site-packages:", "ANSIBLE_RETRY_FILES_ENABLED": "False", "ANSIBLE_ASK_PASS": "False", "ANSIBLE_BECOME_ASK_PASS": "False", "DISPLAY": "", "TMP": "/tmp", "PROJECT_UPDATE_ID": "21", "ANSIBLE_GALAXY_SERVER_SERVER0_URL": "https://galaxy.ansible.com/", "ANSIBLE_GALAXY_SERVER_LIST": "server0", "ANSIBLE_CALLBACK_PLUGINS": "/var/lib/awx/venv/awx/lib/python3.6/site-packages/ansible_runner/callbacks", "ANSIBLE_STDOUT_CALLBACK": "awx_display", "AWX_ISOLATED_DATA_DIR": "/tmp/bwrap_21_x9o0zwv8/awx_21_kt3wo3wy/artifacts/21", "RUNNER_OMIT_EVENTS": "False", "RUNNER_ONLY_FAILED_EVENTS": "False"}			\N		179d234b-d139-4e4f-83ed-59b7bdd62683	1	\N	10	\N	13	awx	1	33		\N	f	1
26	2021-08-22 12:59:09.42816+00	2021-08-22 12:59:09.914983+00	Remove job history	Cleanup Job Details	\N	scheduled	f	successful	f	2021-08-22 12:59:10.017038+00	2021-08-22 12:59:27.432823+00	17.416	["awx-manage", "cleanup_jobs", "--days", "120", "--jobs", "--project-updates", "--inventory-updates", "--management-jobs", "--ad-hoc-commands", "--workflow-jobs", "--notifications"]	/var/lib/awx/venv/awx/lib/python3.6/site-packages/awx	{"LC_ALL": "en_US.UTF-8", "SUPERVISOR_WEB_CONFIG_PATH": "/etc/supervisord.conf", "LANG": "en_US.UTF-8", "HOSTNAME": "awx", "AWX_SKIP_MIGRATIONS": "1", "PWD": "/", "HOME": "/var/lib/awx", "SHLVL": "1", "LANGUAGE": "en_US:en", "PATH": "/var/lib/awx/venv/awx/bin:/usr/pgsql-10/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin", "_": "/usr/local/bin/supervisord", "SUPERVISOR_ENABLED": "1", "SUPERVISOR_SERVER_URL": "unix:///var/run/supervisor/supervisor.sock", "SUPERVISOR_PROCESS_NAME": "dispatcher", "SUPERVISOR_GROUP_NAME": "tower-processes", "DJANGO_SETTINGS_MODULE": "awx.settings.production", "DJANGO_LIVE_TEST_SERVER_ADDRESS": "localhost:9013-9199", "TZ": "UTC", "ANSIBLE_FORCE_COLOR": "True", "ANSIBLE_HOST_KEY_CHECKING": "False", "ANSIBLE_INVENTORY_UNPARSED_FAILED": "True", "ANSIBLE_PARAMIKO_RECORD_HOST_KEYS": "False", "ANSIBLE_VENV_PATH": "/var/lib/awx/venv/ansible", "AWX_PRIVATE_DATA_DIR": "/tmp/bwrap_26_grmg8jfj/awx_26_k58kyant", "VIRTUAL_ENV": "/var/lib/awx/venv/awx", "ANSIBLE_CALLBACK_PLUGINS": "/var/lib/awx/venv/awx/lib/python3.6/site-packages/ansible_runner/callbacks", "ANSIBLE_STDOUT_CALLBACK": "awx_display", "ANSIBLE_RETRY_FILES_ENABLED": "False", "AWX_ISOLATED_DATA_DIR": "/tmp/bwrap_26_grmg8jfj/awx_26_k58kyant/artifacts/26", "PYTHONPATH": "/var/lib/awx/venv/awx/lib/python3.6/site-packages/ansible_runner/callbacks", "RUNNER_OMIT_EVENTS": "False", "RUNNER_ONLY_FAILED_EVENTS": "False"}			\N		fe35d58c-5c96-4240-ad8e-ebc7821b97f0	\N	\N	43	1	1	awx	1	7		\N	f	\N
27	2021-08-24 12:59:33.137925+00	2021-08-24 12:59:33.478688+00	Remove activity stream history	Cleanup Activity Stream	\N	scheduled	f	successful	f	2021-08-24 12:59:33.576762+00	2021-08-24 12:59:43.21898+00	9.642	["awx-manage", "cleanup_activitystream", "--days", "355"]	/var/lib/awx/venv/awx/lib/python3.6/site-packages/awx	{"LC_ALL": "en_US.UTF-8", "SUPERVISOR_WEB_CONFIG_PATH": "/etc/supervisord.conf", "LANG": "en_US.UTF-8", "HOSTNAME": "awx", "AWX_SKIP_MIGRATIONS": "1", "PWD": "/", "HOME": "/var/lib/awx", "SHLVL": "1", "LANGUAGE": "en_US:en", "PATH": "/var/lib/awx/venv/awx/bin:/usr/pgsql-10/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin", "_": "/usr/local/bin/supervisord", "SUPERVISOR_ENABLED": "1", "SUPERVISOR_SERVER_URL": "unix:///var/run/supervisor/supervisor.sock", "SUPERVISOR_PROCESS_NAME": "dispatcher", "SUPERVISOR_GROUP_NAME": "tower-processes", "DJANGO_SETTINGS_MODULE": "awx.settings.production", "DJANGO_LIVE_TEST_SERVER_ADDRESS": "localhost:9013-9199", "TZ": "UTC", "ANSIBLE_FORCE_COLOR": "True", "ANSIBLE_HOST_KEY_CHECKING": "False", "ANSIBLE_INVENTORY_UNPARSED_FAILED": "True", "ANSIBLE_PARAMIKO_RECORD_HOST_KEYS": "False", "ANSIBLE_VENV_PATH": "/var/lib/awx/venv/ansible", "AWX_PRIVATE_DATA_DIR": "/tmp/bwrap_27__ve_1xwb/awx_27_uo8otvl5", "VIRTUAL_ENV": "/var/lib/awx/venv/awx", "ANSIBLE_CALLBACK_PLUGINS": "/var/lib/awx/venv/awx/lib/python3.6/site-packages/ansible_runner/callbacks", "ANSIBLE_STDOUT_CALLBACK": "awx_display", "ANSIBLE_RETRY_FILES_ENABLED": "False", "AWX_ISOLATED_DATA_DIR": "/tmp/bwrap_27__ve_1xwb/awx_27_uo8otvl5/artifacts/27", "PYTHONPATH": "/var/lib/awx/venv/awx/lib/python3.6/site-packages/ansible_runner/callbacks", "RUNNER_OMIT_EVENTS": "False", "RUNNER_ONLY_FAILED_EVENTS": "False"}			\N		3d3d7b20-4ef2-4849-9d15-0edd734cf650	\N	\N	43	2	2	awx	1	1		\N	f	\N
15	2021-08-17 07:15:49.082312+00	2021-08-17 07:15:49.246318+00		winserver	\N	manual	f	successful	f	2021-08-17 07:15:49.292619+00	2021-08-17 07:15:55.378919+00	6.086	["ansible-playbook", "-t", "update_git,install_roles,install_collections", "-i", "/tmp/bwrap_15_ewsgoefo/awx_15_8r8m9hjb/inventory/hosts", "-e", "@/tmp/bwrap_15_ewsgoefo/awx_15_8r8m9hjb/env/extravars", "project_update.yml"]	/tmp/bwrap_15_ewsgoefo/awx_15_8r8m9hjb/project	{"LC_ALL": "en_US.UTF-8", "SUPERVISOR_WEB_CONFIG_PATH": "/etc/supervisord.conf", "LANG": "en_US.UTF-8", "HOSTNAME": "awx", "AWX_SKIP_MIGRATIONS": "1", "PWD": "/", "HOME": "/var/lib/awx", "SHLVL": "1", "LANGUAGE": "en_US:en", "PATH": "/var/lib/awx/venv/ansible/bin:/usr/pgsql-10/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin", "_": "/usr/local/bin/supervisord", "SUPERVISOR_ENABLED": "1", "SUPERVISOR_SERVER_URL": "unix:///var/run/supervisor/supervisor.sock", "SUPERVISOR_PROCESS_NAME": "dispatcher", "SUPERVISOR_GROUP_NAME": "tower-processes", "DJANGO_SETTINGS_MODULE": "awx.settings.production", "DJANGO_LIVE_TEST_SERVER_ADDRESS": "localhost:9013-9199", "TZ": "UTC", "ANSIBLE_FORCE_COLOR": "True", "ANSIBLE_HOST_KEY_CHECKING": "False", "ANSIBLE_INVENTORY_UNPARSED_FAILED": "True", "ANSIBLE_PARAMIKO_RECORD_HOST_KEYS": "False", "ANSIBLE_VENV_PATH": "/var/lib/awx/venv/ansible", "AWX_PRIVATE_DATA_DIR": "/tmp/bwrap_15_ewsgoefo/awx_15_8r8m9hjb", "VIRTUAL_ENV": "/var/lib/awx/venv/ansible", "PYTHONPATH": "/var/lib/awx/venv/ansible/lib/python3.6/site-packages:", "ANSIBLE_RETRY_FILES_ENABLED": "False", "ANSIBLE_ASK_PASS": "False", "ANSIBLE_BECOME_ASK_PASS": "False", "DISPLAY": "", "TMP": "/tmp", "PROJECT_UPDATE_ID": "15", "ANSIBLE_GALAXY_SERVER_SERVER0_URL": "https://galaxy.ansible.com/", "ANSIBLE_GALAXY_SERVER_LIST": "server0", "ANSIBLE_CALLBACK_PLUGINS": "/var/lib/awx/venv/awx/lib/python3.6/site-packages/ansible_runner/callbacks", "ANSIBLE_STDOUT_CALLBACK": "awx_display", "AWX_ISOLATED_DATA_DIR": "/tmp/bwrap_15_ewsgoefo/awx_15_8r8m9hjb/artifacts/15", "RUNNER_OMIT_EVENTS": "False", "RUNNER_ONLY_FAILED_EVENTS": "False"}			\N		7bb151ef-ecbc-4c53-8598-e07285e29c52	1	\N	10	\N	13	awx	1	33		\N	f	1
22	2021-08-17 07:19:37.001458+00	2021-08-17 07:19:37.208565+00		winserver	\N	manual	f	failed	t	2021-08-17 07:19:37.25494+00	2021-08-17 07:19:38.979536+00	1.725	["ansible-playbook", "-u", "pdmskul", "--ask-pass", "-i", "/tmp/bwrap_22__7ivdckt/awx_22_b0hfuoi6/tmpkdpaipw0", "-e", "@/tmp/bwrap_22__7ivdckt/awx_22_b0hfuoi6/env/extravars", "winserver.yml"]	/tmp/bwrap_22__7ivdckt/awx_22_b0hfuoi6/project	{"LC_ALL": "en_US.UTF-8", "SUPERVISOR_WEB_CONFIG_PATH": "/etc/supervisord.conf", "LANG": "en_US.UTF-8", "HOSTNAME": "awx", "AWX_SKIP_MIGRATIONS": "1", "PWD": "/", "HOME": "/var/lib/awx", "SHLVL": "1", "LANGUAGE": "en_US:en", "PATH": "/var/lib/awx/venv/ansible/bin:/usr/pgsql-10/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin", "_": "/usr/local/bin/supervisord", "SUPERVISOR_ENABLED": "1", "SUPERVISOR_SERVER_URL": "unix:///var/run/supervisor/supervisor.sock", "SUPERVISOR_PROCESS_NAME": "dispatcher", "SUPERVISOR_GROUP_NAME": "tower-processes", "DJANGO_SETTINGS_MODULE": "awx.settings.production", "DJANGO_LIVE_TEST_SERVER_ADDRESS": "localhost:9013-9199", "TZ": "UTC", "ANSIBLE_FORCE_COLOR": "True", "ANSIBLE_HOST_KEY_CHECKING": "False", "ANSIBLE_INVENTORY_UNPARSED_FAILED": "True", "ANSIBLE_PARAMIKO_RECORD_HOST_KEYS": "False", "ANSIBLE_VENV_PATH": "/var/lib/awx/venv/ansible", "AWX_PRIVATE_DATA_DIR": "/tmp/bwrap_22__7ivdckt/awx_22_b0hfuoi6", "VIRTUAL_ENV": "/var/lib/awx/venv/ansible", "PYTHONPATH": "/var/lib/awx/venv/ansible/lib/python3.6/site-packages:", "JOB_ID": "22", "INVENTORY_ID": "3", "PROJECT_REVISION": "f34509208c70e4ccedbd54480abf68b01f9d221b", "ANSIBLE_RETRY_FILES_ENABLED": "False", "MAX_EVENT_RES": "700000", "AWX_HOST": "https://towerhost", "ANSIBLE_SSH_CONTROL_PATH_DIR": "/tmp/bwrap_22__7ivdckt/awx_22_b0hfuoi6/cp", "ANSIBLE_COLLECTIONS_PATHS": "/tmp/bwrap_22__7ivdckt/awx_22_b0hfuoi6/requirements_collections:~/.ansible/collections:/usr/share/ansible/collections", "ANSIBLE_ROLES_PATH": "/tmp/bwrap_22__7ivdckt/awx_22_b0hfuoi6/requirements_roles:~/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles", "ANSIBLE_CALLBACK_PLUGINS": "/var/lib/awx/venv/awx/lib/python3.6/site-packages/ansible_runner/callbacks", "ANSIBLE_STDOUT_CALLBACK": "awx_display", "AWX_ISOLATED_DATA_DIR": "/tmp/bwrap_22__7ivdckt/awx_22_b0hfuoi6/artifacts/22", "RUNNER_OMIT_EVENTS": "False", "RUNNER_ONLY_FAILED_EVENTS": "False"}			\N		ea7dda29-9e9f-4835-98e8-0735dc3a363d	1	\N	9	\N	\N	awx	1	17		\N	f	1
18	2021-08-17 07:16:06.503323+00	2021-08-17 07:16:06.611072+00		createfile	\N	manual	f	successful	f	2021-08-17 07:16:06.64872+00	2021-08-17 07:16:11.710845+00	5.062	["ansible-playbook", "-t", "update_git,install_roles,install_collections", "-i", "/tmp/bwrap_18_o_rdcv1n/awx_18_mry1qamd/inventory/hosts", "-e", "@/tmp/bwrap_18_o_rdcv1n/awx_18_mry1qamd/env/extravars", "project_update.yml"]	/tmp/bwrap_18_o_rdcv1n/awx_18_mry1qamd/project	{"LC_ALL": "en_US.UTF-8", "SUPERVISOR_WEB_CONFIG_PATH": "/etc/supervisord.conf", "LANG": "en_US.UTF-8", "HOSTNAME": "awx", "AWX_SKIP_MIGRATIONS": "1", "PWD": "/", "HOME": "/var/lib/awx", "SHLVL": "1", "LANGUAGE": "en_US:en", "PATH": "/var/lib/awx/venv/ansible/bin:/usr/pgsql-10/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin", "_": "/usr/local/bin/supervisord", "SUPERVISOR_ENABLED": "1", "SUPERVISOR_SERVER_URL": "unix:///var/run/supervisor/supervisor.sock", "SUPERVISOR_PROCESS_NAME": "dispatcher", "SUPERVISOR_GROUP_NAME": "tower-processes", "DJANGO_SETTINGS_MODULE": "awx.settings.production", "DJANGO_LIVE_TEST_SERVER_ADDRESS": "localhost:9013-9199", "TZ": "UTC", "ANSIBLE_FORCE_COLOR": "True", "ANSIBLE_HOST_KEY_CHECKING": "False", "ANSIBLE_INVENTORY_UNPARSED_FAILED": "True", "ANSIBLE_PARAMIKO_RECORD_HOST_KEYS": "False", "ANSIBLE_VENV_PATH": "/var/lib/awx/venv/ansible", "AWX_PRIVATE_DATA_DIR": "/tmp/bwrap_18_o_rdcv1n/awx_18_mry1qamd", "VIRTUAL_ENV": "/var/lib/awx/venv/ansible", "PYTHONPATH": "/var/lib/awx/venv/ansible/lib/python3.6/site-packages:", "ANSIBLE_RETRY_FILES_ENABLED": "False", "ANSIBLE_ASK_PASS": "False", "ANSIBLE_BECOME_ASK_PASS": "False", "DISPLAY": "", "TMP": "/tmp", "PROJECT_UPDATE_ID": "18", "ANSIBLE_GALAXY_SERVER_SERVER0_URL": "https://galaxy.ansible.com/", "ANSIBLE_GALAXY_SERVER_LIST": "server0", "ANSIBLE_CALLBACK_PLUGINS": "/var/lib/awx/venv/awx/lib/python3.6/site-packages/ansible_runner/callbacks", "ANSIBLE_STDOUT_CALLBACK": "awx_display", "AWX_ISOLATED_DATA_DIR": "/tmp/bwrap_18_o_rdcv1n/awx_18_mry1qamd/artifacts/18", "RUNNER_OMIT_EVENTS": "False", "RUNNER_ONLY_FAILED_EVENTS": "False"}			\N		88be95fa-3458-49b7-b7da-41648c7f5d39	1	\N	10	\N	8	awx	1	33		\N	f	1
23	2021-08-17 07:20:24.674773+00	2021-08-17 07:20:24.78127+00		winserver	\N	manual	f	successful	f	2021-08-17 07:20:24.821393+00	2021-08-17 07:20:29.507495+00	4.686	["ansible-playbook", "-t", "update_git,install_roles,install_collections", "-i", "/tmp/bwrap_23_phnll4jj/awx_23_btzg_d4e/inventory/hosts", "-e", "@/tmp/bwrap_23_phnll4jj/awx_23_btzg_d4e/env/extravars", "project_update.yml"]	/tmp/bwrap_23_phnll4jj/awx_23_btzg_d4e/project	{"LC_ALL": "en_US.UTF-8", "SUPERVISOR_WEB_CONFIG_PATH": "/etc/supervisord.conf", "LANG": "en_US.UTF-8", "HOSTNAME": "awx", "AWX_SKIP_MIGRATIONS": "1", "PWD": "/", "HOME": "/var/lib/awx", "SHLVL": "1", "LANGUAGE": "en_US:en", "PATH": "/var/lib/awx/venv/ansible/bin:/usr/pgsql-10/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin", "_": "/usr/local/bin/supervisord", "SUPERVISOR_ENABLED": "1", "SUPERVISOR_SERVER_URL": "unix:///var/run/supervisor/supervisor.sock", "SUPERVISOR_PROCESS_NAME": "dispatcher", "SUPERVISOR_GROUP_NAME": "tower-processes", "DJANGO_SETTINGS_MODULE": "awx.settings.production", "DJANGO_LIVE_TEST_SERVER_ADDRESS": "localhost:9013-9199", "TZ": "UTC", "ANSIBLE_FORCE_COLOR": "True", "ANSIBLE_HOST_KEY_CHECKING": "False", "ANSIBLE_INVENTORY_UNPARSED_FAILED": "True", "ANSIBLE_PARAMIKO_RECORD_HOST_KEYS": "False", "ANSIBLE_VENV_PATH": "/var/lib/awx/venv/ansible", "AWX_PRIVATE_DATA_DIR": "/tmp/bwrap_23_phnll4jj/awx_23_btzg_d4e", "VIRTUAL_ENV": "/var/lib/awx/venv/ansible", "PYTHONPATH": "/var/lib/awx/venv/ansible/lib/python3.6/site-packages:", "ANSIBLE_RETRY_FILES_ENABLED": "False", "ANSIBLE_ASK_PASS": "False", "ANSIBLE_BECOME_ASK_PASS": "False", "DISPLAY": "", "TMP": "/tmp", "PROJECT_UPDATE_ID": "23", "ANSIBLE_GALAXY_SERVER_SERVER0_URL": "https://galaxy.ansible.com/", "ANSIBLE_GALAXY_SERVER_LIST": "server0", "ANSIBLE_CALLBACK_PLUGINS": "/var/lib/awx/venv/awx/lib/python3.6/site-packages/ansible_runner/callbacks", "ANSIBLE_STDOUT_CALLBACK": "awx_display", "AWX_ISOLATED_DATA_DIR": "/tmp/bwrap_23_phnll4jj/awx_23_btzg_d4e/artifacts/23", "RUNNER_OMIT_EVENTS": "False", "RUNNER_ONLY_FAILED_EVENTS": "False"}			\N		07dfad98-a22d-4ece-8e27-5f4527b73f39	1	\N	10	\N	13	awx	1	33		\N	f	1
24	2021-08-17 07:20:44.118352+00	2021-08-17 07:20:44.325653+00		winserver	\N	manual	f	failed	t	2021-08-17 07:20:44.371307+00	2021-08-17 07:20:46.290555+00	1.919	["ansible-playbook", "-u", "pdmskul", "--ask-pass", "-i", "/tmp/bwrap_24_va7ph4io/awx_24_qk0xhtd1/tmpy5mpnxl7", "-e", "@/tmp/bwrap_24_va7ph4io/awx_24_qk0xhtd1/env/extravars", "win-copy.yml"]	/tmp/bwrap_24_va7ph4io/awx_24_qk0xhtd1/project	{"LC_ALL": "en_US.UTF-8", "SUPERVISOR_WEB_CONFIG_PATH": "/etc/supervisord.conf", "LANG": "en_US.UTF-8", "HOSTNAME": "awx", "AWX_SKIP_MIGRATIONS": "1", "PWD": "/", "HOME": "/var/lib/awx", "SHLVL": "1", "LANGUAGE": "en_US:en", "PATH": "/var/lib/awx/venv/ansible/bin:/usr/pgsql-10/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin", "_": "/usr/local/bin/supervisord", "SUPERVISOR_ENABLED": "1", "SUPERVISOR_SERVER_URL": "unix:///var/run/supervisor/supervisor.sock", "SUPERVISOR_PROCESS_NAME": "dispatcher", "SUPERVISOR_GROUP_NAME": "tower-processes", "DJANGO_SETTINGS_MODULE": "awx.settings.production", "DJANGO_LIVE_TEST_SERVER_ADDRESS": "localhost:9013-9199", "TZ": "UTC", "ANSIBLE_FORCE_COLOR": "True", "ANSIBLE_HOST_KEY_CHECKING": "False", "ANSIBLE_INVENTORY_UNPARSED_FAILED": "True", "ANSIBLE_PARAMIKO_RECORD_HOST_KEYS": "False", "ANSIBLE_VENV_PATH": "/var/lib/awx/venv/ansible", "AWX_PRIVATE_DATA_DIR": "/tmp/bwrap_24_va7ph4io/awx_24_qk0xhtd1", "VIRTUAL_ENV": "/var/lib/awx/venv/ansible", "PYTHONPATH": "/var/lib/awx/venv/ansible/lib/python3.6/site-packages:", "JOB_ID": "24", "INVENTORY_ID": "3", "PROJECT_REVISION": "f34509208c70e4ccedbd54480abf68b01f9d221b", "ANSIBLE_RETRY_FILES_ENABLED": "False", "MAX_EVENT_RES": "700000", "AWX_HOST": "https://towerhost", "ANSIBLE_SSH_CONTROL_PATH_DIR": "/tmp/bwrap_24_va7ph4io/awx_24_qk0xhtd1/cp", "ANSIBLE_COLLECTIONS_PATHS": "/tmp/bwrap_24_va7ph4io/awx_24_qk0xhtd1/requirements_collections:~/.ansible/collections:/usr/share/ansible/collections", "ANSIBLE_ROLES_PATH": "/tmp/bwrap_24_va7ph4io/awx_24_qk0xhtd1/requirements_roles:~/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles", "ANSIBLE_CALLBACK_PLUGINS": "/var/lib/awx/venv/awx/lib/python3.6/site-packages/ansible_runner/callbacks", "ANSIBLE_STDOUT_CALLBACK": "awx_display", "AWX_ISOLATED_DATA_DIR": "/tmp/bwrap_24_va7ph4io/awx_24_qk0xhtd1/artifacts/24", "RUNNER_OMIT_EVENTS": "False", "RUNNER_ONLY_FAILED_EVENTS": "False"}			\N		1951eeb5-3f2d-42d5-8c1e-4df9597d97d5	1	\N	9	\N	\N	awx	1	7		\N	f	1
16	2021-08-17 07:15:52.049828+00	2021-08-17 07:15:55.473968+00		winserver	\N	manual	f	successful	f	2021-08-17 07:15:55.513955+00	2021-08-17 07:16:00.200385+00	4.686	["ansible-playbook", "-t", "update_git,install_roles,install_collections", "-i", "/tmp/bwrap_16_xquwi25g/awx_16_yv8gg_96/inventory/hosts", "-e", "@/tmp/bwrap_16_xquwi25g/awx_16_yv8gg_96/env/extravars", "project_update.yml"]	/tmp/bwrap_16_xquwi25g/awx_16_yv8gg_96/project	{"LC_ALL": "en_US.UTF-8", "SUPERVISOR_WEB_CONFIG_PATH": "/etc/supervisord.conf", "LANG": "en_US.UTF-8", "HOSTNAME": "awx", "AWX_SKIP_MIGRATIONS": "1", "PWD": "/", "HOME": "/var/lib/awx", "SHLVL": "1", "LANGUAGE": "en_US:en", "PATH": "/var/lib/awx/venv/ansible/bin:/usr/pgsql-10/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin", "_": "/usr/local/bin/supervisord", "SUPERVISOR_ENABLED": "1", "SUPERVISOR_SERVER_URL": "unix:///var/run/supervisor/supervisor.sock", "SUPERVISOR_PROCESS_NAME": "dispatcher", "SUPERVISOR_GROUP_NAME": "tower-processes", "DJANGO_SETTINGS_MODULE": "awx.settings.production", "DJANGO_LIVE_TEST_SERVER_ADDRESS": "localhost:9013-9199", "TZ": "UTC", "ANSIBLE_FORCE_COLOR": "True", "ANSIBLE_HOST_KEY_CHECKING": "False", "ANSIBLE_INVENTORY_UNPARSED_FAILED": "True", "ANSIBLE_PARAMIKO_RECORD_HOST_KEYS": "False", "ANSIBLE_VENV_PATH": "/var/lib/awx/venv/ansible", "AWX_PRIVATE_DATA_DIR": "/tmp/bwrap_16_xquwi25g/awx_16_yv8gg_96", "VIRTUAL_ENV": "/var/lib/awx/venv/ansible", "PYTHONPATH": "/var/lib/awx/venv/ansible/lib/python3.6/site-packages:", "ANSIBLE_RETRY_FILES_ENABLED": "False", "ANSIBLE_ASK_PASS": "False", "ANSIBLE_BECOME_ASK_PASS": "False", "DISPLAY": "", "TMP": "/tmp", "PROJECT_UPDATE_ID": "16", "ANSIBLE_GALAXY_SERVER_SERVER0_URL": "https://galaxy.ansible.com/", "ANSIBLE_GALAXY_SERVER_LIST": "server0", "ANSIBLE_CALLBACK_PLUGINS": "/var/lib/awx/venv/awx/lib/python3.6/site-packages/ansible_runner/callbacks", "ANSIBLE_STDOUT_CALLBACK": "awx_display", "AWX_ISOLATED_DATA_DIR": "/tmp/bwrap_16_xquwi25g/awx_16_yv8gg_96/artifacts/16", "RUNNER_OMIT_EVENTS": "False", "RUNNER_ONLY_FAILED_EVENTS": "False"}			\N		b84c2a24-fdc8-445c-8e55-ca370db911ff	1	\N	10	\N	13	awx	1	33		\N	t	1
19	2021-08-17 07:16:11.357351+00	2021-08-17 07:16:11.475104+00		Demo Project	\N	manual	f	successful	f	2021-08-17 07:16:11.513041+00	2021-08-17 07:16:16.129838+00	4.617	["ansible-playbook", "-t", "update_git,install_roles,install_collections", "-i", "/tmp/bwrap_19_qa3qu_ri/awx_19_d93vso43/inventory/hosts", "-e", "@/tmp/bwrap_19_qa3qu_ri/awx_19_d93vso43/env/extravars", "project_update.yml"]	/tmp/bwrap_19_qa3qu_ri/awx_19_d93vso43/project	{"LC_ALL": "en_US.UTF-8", "SUPERVISOR_WEB_CONFIG_PATH": "/etc/supervisord.conf", "LANG": "en_US.UTF-8", "HOSTNAME": "awx", "AWX_SKIP_MIGRATIONS": "1", "PWD": "/", "HOME": "/var/lib/awx", "SHLVL": "1", "LANGUAGE": "en_US:en", "PATH": "/var/lib/awx/venv/ansible/bin:/usr/pgsql-10/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin", "_": "/usr/local/bin/supervisord", "SUPERVISOR_ENABLED": "1", "SUPERVISOR_SERVER_URL": "unix:///var/run/supervisor/supervisor.sock", "SUPERVISOR_PROCESS_NAME": "dispatcher", "SUPERVISOR_GROUP_NAME": "tower-processes", "DJANGO_SETTINGS_MODULE": "awx.settings.production", "DJANGO_LIVE_TEST_SERVER_ADDRESS": "localhost:9013-9199", "TZ": "UTC", "ANSIBLE_FORCE_COLOR": "True", "ANSIBLE_HOST_KEY_CHECKING": "False", "ANSIBLE_INVENTORY_UNPARSED_FAILED": "True", "ANSIBLE_PARAMIKO_RECORD_HOST_KEYS": "False", "ANSIBLE_VENV_PATH": "/var/lib/awx/venv/ansible", "AWX_PRIVATE_DATA_DIR": "/tmp/bwrap_19_qa3qu_ri/awx_19_d93vso43", "VIRTUAL_ENV": "/var/lib/awx/venv/ansible", "PYTHONPATH": "/var/lib/awx/venv/ansible/lib/python3.6/site-packages:", "ANSIBLE_RETRY_FILES_ENABLED": "False", "ANSIBLE_ASK_PASS": "False", "ANSIBLE_BECOME_ASK_PASS": "False", "DISPLAY": "", "TMP": "/tmp", "PROJECT_UPDATE_ID": "19", "ANSIBLE_GALAXY_SERVER_SERVER0_URL": "https://galaxy.ansible.com/", "ANSIBLE_GALAXY_SERVER_LIST": "server0", "ANSIBLE_CALLBACK_PLUGINS": "/var/lib/awx/venv/awx/lib/python3.6/site-packages/ansible_runner/callbacks", "ANSIBLE_STDOUT_CALLBACK": "awx_display", "AWX_ISOLATED_DATA_DIR": "/tmp/bwrap_19_qa3qu_ri/awx_19_d93vso43/artifacts/19", "RUNNER_OMIT_EVENTS": "False", "RUNNER_ONLY_FAILED_EVENTS": "False"}			\N		24f88e71-587a-4e18-8eb9-be52b5a72566	1	\N	10	\N	6	awx	1	33		\N	f	1
25	2021-08-17 07:22:08.268731+00	2021-08-17 07:22:08.475149+00		winserver	\N	manual	f	successful	f	2021-08-17 07:22:08.522986+00	2021-08-17 07:22:16.169548+00	7.647	["ansible-playbook", "-u", "pdmskul", "--ask-pass", "-i", "/tmp/bwrap_25_wdbktjim/awx_25_hjb6fgsm/tmp41w09197", "-e", "@/tmp/bwrap_25_wdbktjim/awx_25_hjb6fgsm/env/extravars", "win-copy.yml"]	/tmp/bwrap_25_wdbktjim/awx_25_hjb6fgsm/project	{"LC_ALL": "en_US.UTF-8", "SUPERVISOR_WEB_CONFIG_PATH": "/etc/supervisord.conf", "LANG": "en_US.UTF-8", "HOSTNAME": "awx", "AWX_SKIP_MIGRATIONS": "1", "PWD": "/", "HOME": "/var/lib/awx", "SHLVL": "1", "LANGUAGE": "en_US:en", "PATH": "/var/lib/awx/venv/ansible/bin:/usr/pgsql-10/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin", "_": "/usr/local/bin/supervisord", "SUPERVISOR_ENABLED": "1", "SUPERVISOR_SERVER_URL": "unix:///var/run/supervisor/supervisor.sock", "SUPERVISOR_PROCESS_NAME": "dispatcher", "SUPERVISOR_GROUP_NAME": "tower-processes", "DJANGO_SETTINGS_MODULE": "awx.settings.production", "DJANGO_LIVE_TEST_SERVER_ADDRESS": "localhost:9013-9199", "TZ": "UTC", "ANSIBLE_FORCE_COLOR": "True", "ANSIBLE_HOST_KEY_CHECKING": "False", "ANSIBLE_INVENTORY_UNPARSED_FAILED": "True", "ANSIBLE_PARAMIKO_RECORD_HOST_KEYS": "False", "ANSIBLE_VENV_PATH": "/var/lib/awx/venv/ansible", "AWX_PRIVATE_DATA_DIR": "/tmp/bwrap_25_wdbktjim/awx_25_hjb6fgsm", "VIRTUAL_ENV": "/var/lib/awx/venv/ansible", "PYTHONPATH": "/var/lib/awx/venv/ansible/lib/python3.6/site-packages:", "JOB_ID": "25", "INVENTORY_ID": "3", "PROJECT_REVISION": "f34509208c70e4ccedbd54480abf68b01f9d221b", "ANSIBLE_RETRY_FILES_ENABLED": "False", "MAX_EVENT_RES": "700000", "AWX_HOST": "https://towerhost", "ANSIBLE_SSH_CONTROL_PATH_DIR": "/tmp/bwrap_25_wdbktjim/awx_25_hjb6fgsm/cp", "ANSIBLE_COLLECTIONS_PATHS": "/tmp/bwrap_25_wdbktjim/awx_25_hjb6fgsm/requirements_collections:~/.ansible/collections:/usr/share/ansible/collections", "ANSIBLE_ROLES_PATH": "/tmp/bwrap_25_wdbktjim/awx_25_hjb6fgsm/requirements_roles:~/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles", "ANSIBLE_CALLBACK_PLUGINS": "/var/lib/awx/venv/awx/lib/python3.6/site-packages/ansible_runner/callbacks", "ANSIBLE_STDOUT_CALLBACK": "awx_display", "AWX_ISOLATED_DATA_DIR": "/tmp/bwrap_25_wdbktjim/awx_25_hjb6fgsm/artifacts/25", "RUNNER_OMIT_EVENTS": "False", "RUNNER_ONLY_FAILED_EVENTS": "False"}			\N		9d789b00-9593-493a-a663-da5fb473038f	1	\N	9	\N	\N	awx	1	10		\N	f	1
\.


--
-- Data for Name: main_unifiedjob_credentials; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_unifiedjob_credentials (id, unifiedjob_id, credential_id) FROM stdin;
9	20	5
10	22	5
11	24	5
12	25	5
\.


--
-- Data for Name: main_unifiedjob_dependent_jobs; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_unifiedjob_dependent_jobs (id, from_unifiedjob_id, to_unifiedjob_id) FROM stdin;
\.


--
-- Data for Name: main_unifiedjob_labels; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_unifiedjob_labels (id, unifiedjob_id, label_id) FROM stdin;
\.


--
-- Data for Name: main_unifiedjob_notifications; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_unifiedjob_notifications (id, unifiedjob_id, notification_id) FROM stdin;
\.


--
-- Data for Name: main_unifiedjobtemplate; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_unifiedjobtemplate (id, created, modified, description, name, old_pk, last_job_failed, last_job_run, next_job_run, status, created_by_id, current_job_id, last_job_id, modified_by_id, next_schedule_id, polymorphic_ctype_id, organization_id) FROM stdin;
4	2021-08-14 13:00:07.006571+00	2021-08-14 13:00:07.006571+00	Cleans out expired browser sessions	Cleanup Expired Sessions	\N	f	\N	\N	ok	\N	\N	\N	\N	\N	1	\N
5	2021-08-14 13:00:07.141696+00	2021-08-14 13:00:07.141696+00	Cleanup expired OAuth 2 access and refresh tokens	Cleanup Expired OAuth 2 Tokens	\N	f	\N	\N	ok	\N	\N	\N	\N	\N	1	\N
2	2021-08-14 12:59:03.15785+00	2021-08-14 12:59:03.15785+00	Remove activity stream history	Cleanup Activity Stream	\N	f	2021-08-24 12:59:43.21898+00	2021-08-31 12:59:03+00	successful	\N	\N	27	\N	2	1	\N
1	2021-08-14 12:59:03.15785+00	2021-08-14 12:59:03.15785+00	Remove job history	Cleanup Job Details	\N	f	2021-08-22 12:59:27.432823+00	2021-09-05 12:59:03+00	successful	\N	\N	26	\N	1	1	\N
8	2021-08-17 04:56:06.241109+00	2021-08-17 04:56:06.241134+00		createfile	\N	f	2021-08-17 07:16:11.710845+00	\N	successful	1	\N	18	1	\N	5	1
6	2021-08-14 13:00:54.093444+00	2021-08-14 13:00:54.093469+00		Demo Project	\N	f	2021-08-17 07:16:16.129838+00	\N	successful	1	\N	19	1	\N	5	1
13	2021-08-17 07:15:49.018031+00	2021-08-17 07:15:49.018056+00		winserver	\N	f	2021-08-17 07:20:29.507495+00	\N	successful	1	\N	23	1	\N	5	1
7	2021-08-14 13:00:54.655446+00	2021-08-17 04:44:54.26395+00		Demo Job Template	\N	f	2021-08-17 04:45:13.8953+00	\N	successful	1	\N	\N	1	\N	4	1
\.


--
-- Data for Name: main_unifiedjobtemplate_credentials; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_unifiedjobtemplate_credentials (id, unifiedjobtemplate_id, credential_id) FROM stdin;
1	7	1
\.


--
-- Data for Name: main_unifiedjobtemplate_labels; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_unifiedjobtemplate_labels (id, unifiedjobtemplate_id, label_id) FROM stdin;
\.


--
-- Data for Name: main_unifiedjobtemplate_notification_templates_error; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_unifiedjobtemplate_notification_templates_error (id, unifiedjobtemplate_id, notificationtemplate_id) FROM stdin;
\.


--
-- Data for Name: main_unifiedjobtemplate_notification_templates_started; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_unifiedjobtemplate_notification_templates_started (id, unifiedjobtemplate_id, notificationtemplate_id) FROM stdin;
\.


--
-- Data for Name: main_unifiedjobtemplate_notification_templates_success; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_unifiedjobtemplate_notification_templates_success (id, unifiedjobtemplate_id, notificationtemplate_id) FROM stdin;
\.


--
-- Data for Name: main_unifiedjobtemplateinstancegroupmembership; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_unifiedjobtemplateinstancegroupmembership (id, "position", instancegroup_id, unifiedjobtemplate_id) FROM stdin;
\.


--
-- Data for Name: main_usersessionmembership; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_usersessionmembership (id, created, session_id, user_id) FROM stdin;
1	2021-08-14 13:04:30.866889+00	pyy4n74fa52fa6yrb1pvayoiagqiqa3t	1
2	2021-08-17 04:13:14.451896+00	qljboxhgduzmpld7mzfpyr2ryj72acpd	1
3	2021-08-17 06:05:02.674301+00	9af62vaa40j1tlv34fzrk4myhsal18lu	1
4	2021-08-17 06:52:58.570385+00	r3haqv3bztiqhzv7phg9buybxgamxke8	1
5	2021-08-18 06:08:24.308155+00	rxo91yr3zy540qbi6r1jh7yjjr2fhvh3	1
6	2021-08-19 07:18:02.320708+00	edxu9itzp7y5rk0bmv47fx0o83ro79vg	1
7	2021-08-23 05:01:06.005219+00	hu7r49ygdwtff5ctfpol4ckgzcnil6ar	1
8	2021-08-30 04:21:07.638372+00	rwbbdz0qqkl80pkuomj33659b9l7tq62	1
\.


--
-- Data for Name: main_workflowapproval; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_workflowapproval (unifiedjob_ptr_id, workflow_approval_template_id, timeout, timed_out, approved_or_denied_by_id) FROM stdin;
\.


--
-- Data for Name: main_workflowapprovaltemplate; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_workflowapprovaltemplate (unifiedjobtemplate_ptr_id, timeout) FROM stdin;
\.


--
-- Data for Name: main_workflowjob; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_workflowjob (unifiedjob_ptr_id, extra_vars, workflow_job_template_id, survey_passwords, allow_simultaneous, is_sliced_job, job_template_id, char_prompts, inventory_id, webhook_credential_id, webhook_guid, webhook_service) FROM stdin;
\.


--
-- Data for Name: main_workflowjobnode; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_workflowjobnode (id, created, modified, job_id, unified_job_template_id, workflow_job_id, char_prompts, inventory_id, ancestor_artifacts, extra_data, survey_passwords, do_not_run, all_parents_must_converge, identifier) FROM stdin;
\.


--
-- Data for Name: main_workflowjobnode_always_nodes; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_workflowjobnode_always_nodes (id, from_workflowjobnode_id, to_workflowjobnode_id) FROM stdin;
\.


--
-- Data for Name: main_workflowjobnode_credentials; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_workflowjobnode_credentials (id, workflowjobnode_id, credential_id) FROM stdin;
\.


--
-- Data for Name: main_workflowjobnode_failure_nodes; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_workflowjobnode_failure_nodes (id, from_workflowjobnode_id, to_workflowjobnode_id) FROM stdin;
\.


--
-- Data for Name: main_workflowjobnode_success_nodes; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_workflowjobnode_success_nodes (id, from_workflowjobnode_id, to_workflowjobnode_id) FROM stdin;
\.


--
-- Data for Name: main_workflowjobtemplate; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_workflowjobtemplate (unifiedjobtemplate_ptr_id, extra_vars, admin_role_id, execute_role_id, read_role_id, survey_enabled, survey_spec, allow_simultaneous, ask_variables_on_launch, ask_inventory_on_launch, inventory_id, approval_role_id, ask_limit_on_launch, ask_scm_branch_on_launch, char_prompts, webhook_credential_id, webhook_key, webhook_service) FROM stdin;
\.


--
-- Data for Name: main_workflowjobtemplate_notification_templates_approvals; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_workflowjobtemplate_notification_templates_approvals (id, workflowjobtemplate_id, notificationtemplate_id) FROM stdin;
\.


--
-- Data for Name: main_workflowjobtemplatenode; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_workflowjobtemplatenode (id, created, modified, unified_job_template_id, workflow_job_template_id, char_prompts, inventory_id, extra_data, survey_passwords, all_parents_must_converge, identifier) FROM stdin;
\.


--
-- Data for Name: main_workflowjobtemplatenode_always_nodes; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_workflowjobtemplatenode_always_nodes (id, from_workflowjobtemplatenode_id, to_workflowjobtemplatenode_id) FROM stdin;
\.


--
-- Data for Name: main_workflowjobtemplatenode_credentials; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_workflowjobtemplatenode_credentials (id, workflowjobtemplatenode_id, credential_id) FROM stdin;
\.


--
-- Data for Name: main_workflowjobtemplatenode_failure_nodes; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_workflowjobtemplatenode_failure_nodes (id, from_workflowjobtemplatenode_id, to_workflowjobtemplatenode_id) FROM stdin;
\.


--
-- Data for Name: main_workflowjobtemplatenode_success_nodes; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.main_workflowjobtemplatenode_success_nodes (id, from_workflowjobtemplatenode_id, to_workflowjobtemplatenode_id) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_grant; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.oauth2_provider_grant (id, code, expires, redirect_uri, scope, application_id, user_id, created, updated) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_refreshtoken; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.oauth2_provider_refreshtoken (id, token, access_token_id, application_id, user_id, created, updated, revoked) FROM stdin;
\.


--
-- Data for Name: social_auth_association; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.social_auth_association (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
\.


--
-- Data for Name: social_auth_code; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.social_auth_code (id, email, code, verified, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_nonce; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.social_auth_nonce (id, server_url, "timestamp", salt) FROM stdin;
\.


--
-- Data for Name: social_auth_partial; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.social_auth_partial (id, token, next_step, backend, data, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_usersocialauth; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.social_auth_usersocialauth (id, provider, uid, extra_data, user_id) FROM stdin;
\.


--
-- Data for Name: sso_userenterpriseauth; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.sso_userenterpriseauth (id, provider, user_id) FROM stdin;
\.


--
-- Data for Name: taggit_tag; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.taggit_tag (id, name, slug) FROM stdin;
\.


--
-- Data for Name: taggit_taggeditem; Type: TABLE DATA; Schema: public; Owner: awx
--

COPY public.taggit_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 280, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 38, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: conf_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.conf_setting_id_seq', 3, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 70, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 210, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: main_activitystream_ad_hoc_command_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_activitystream_ad_hoc_command_id_seq', 1, false);


--
-- Name: main_activitystream_credential_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_activitystream_credential_id_seq', 16, true);


--
-- Name: main_activitystream_credential_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_activitystream_credential_type_id_seq', 23, true);


--
-- Name: main_activitystream_custom_inventory_script_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_activitystream_custom_inventory_script_id_seq', 1, false);


--
-- Name: main_activitystream_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_activitystream_group_id_seq', 1, false);


--
-- Name: main_activitystream_host_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_activitystream_host_id_seq', 5, true);


--
-- Name: main_activitystream_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_activitystream_id_seq', 103, true);


--
-- Name: main_activitystream_instance_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_activitystream_instance_group_id_seq', 2, true);


--
-- Name: main_activitystream_instance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_activitystream_instance_id_seq', 1, false);


--
-- Name: main_activitystream_inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_activitystream_inventory_id_seq', 7, true);


--
-- Name: main_activitystream_inventory_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_activitystream_inventory_source_id_seq', 1, false);


--
-- Name: main_activitystream_inventory_update_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_activitystream_inventory_update_id_seq', 1, false);


--
-- Name: main_activitystream_job_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_activitystream_job_id_seq', 12, true);


--
-- Name: main_activitystream_job_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_activitystream_job_template_id_seq', 20, true);


--
-- Name: main_activitystream_label_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_activitystream_label_id_seq', 1, false);


--
-- Name: main_activitystream_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_activitystream_notification_id_seq', 1, false);


--
-- Name: main_activitystream_notification_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_activitystream_notification_template_id_seq', 1, false);


--
-- Name: main_activitystream_o_auth2_access_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_activitystream_o_auth2_access_token_id_seq', 1, false);


--
-- Name: main_activitystream_o_auth2_application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_activitystream_o_auth2_application_id_seq', 1, false);


--
-- Name: main_activitystream_organization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_activitystream_organization_id_seq', 2, true);


--
-- Name: main_activitystream_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_activitystream_project_id_seq', 6, true);


--
-- Name: main_activitystream_project_update_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_activitystream_project_update_id_seq', 1, false);


--
-- Name: main_activitystream_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_activitystream_role_id_seq', 6, true);


--
-- Name: main_activitystream_schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_activitystream_schedule_id_seq', 1, false);


--
-- Name: main_activitystream_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_activitystream_team_id_seq', 1, false);


--
-- Name: main_activitystream_unified_job_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_activitystream_unified_job_id_seq', 1, false);


--
-- Name: main_activitystream_unified_job_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_activitystream_unified_job_template_id_seq', 1, false);


--
-- Name: main_activitystream_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_activitystream_user_id_seq', 7, true);


--
-- Name: main_activitystream_workflow_approval_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_activitystream_workflow_approval_id_seq', 1, false);


--
-- Name: main_activitystream_workflow_approval_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_activitystream_workflow_approval_template_id_seq', 1, false);


--
-- Name: main_activitystream_workflow_job_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_activitystream_workflow_job_id_seq', 1, false);


--
-- Name: main_activitystream_workflow_job_node_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_activitystream_workflow_job_node_id_seq', 1, false);


--
-- Name: main_activitystream_workflow_job_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_activitystream_workflow_job_template_id_seq', 1, false);


--
-- Name: main_activitystream_workflow_job_template_node_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_activitystream_workflow_job_template_node_id_seq', 1, false);


--
-- Name: main_adhoccommandevent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_adhoccommandevent_id_seq', 1, false);


--
-- Name: main_credential_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_credential_id_seq', 5, true);


--
-- Name: main_credentialinputsource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_credentialinputsource_id_seq', 1, false);


--
-- Name: main_credentialtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_credentialtype_id_seq', 23, true);


--
-- Name: main_custominventoryscript_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_custominventoryscript_id_seq', 1, false);


--
-- Name: main_group_hosts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_group_hosts_id_seq', 1, false);


--
-- Name: main_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_group_id_seq', 1, false);


--
-- Name: main_group_inventory_sources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_group_inventory_sources_id_seq', 1, false);


--
-- Name: main_group_parents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_group_parents_id_seq', 1, false);


--
-- Name: main_host_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_host_id_seq', 3, true);


--
-- Name: main_host_inventory_sources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_host_inventory_sources_id_seq', 1, false);


--
-- Name: main_instance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_instance_id_seq', 1, true);


--
-- Name: main_instancegroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_instancegroup_id_seq', 1, true);


--
-- Name: main_instancegroup_instances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_instancegroup_instances_id_seq', 1, true);


--
-- Name: main_inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_inventory_id_seq', 3, true);


--
-- Name: main_inventoryinstancegroupmembership_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_inventoryinstancegroupmembership_id_seq', 1, false);


--
-- Name: main_inventoryupdateevent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_inventoryupdateevent_id_seq', 1, false);


--
-- Name: main_jobevent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_jobevent_id_seq', 130, true);


--
-- Name: main_jobhostsummary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_jobhostsummary_id_seq', 6, true);


--
-- Name: main_joblaunchconfig_credentials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_joblaunchconfig_credentials_id_seq', 1, false);


--
-- Name: main_joblaunchconfig_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_joblaunchconfig_id_seq', 27, true);


--
-- Name: main_label_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_label_id_seq', 1, false);


--
-- Name: main_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_notification_id_seq', 1, false);


--
-- Name: main_notificationtemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_notificationtemplate_id_seq', 1, false);


--
-- Name: main_oauth2accesstoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_oauth2accesstoken_id_seq', 1, false);


--
-- Name: main_oauth2application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_oauth2application_id_seq', 1, false);


--
-- Name: main_organization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_organization_id_seq', 1, true);


--
-- Name: main_organization_notification_templates_approvals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_organization_notification_templates_approvals_id_seq', 1, false);


--
-- Name: main_organization_notification_templates_error_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_organization_notification_templates_error_id_seq', 1, false);


--
-- Name: main_organization_notification_templates_started_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_organization_notification_templates_started_id_seq', 1, false);


--
-- Name: main_organization_notification_templates_success_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_organization_notification_templates_success_id_seq', 1, false);


--
-- Name: main_organizationgalaxycredentialmembership_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_organizationgalaxycredentialmembership_id_seq', 1, true);


--
-- Name: main_organizationinstancegroupmembership_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_organizationinstancegroupmembership_id_seq', 1, false);


--
-- Name: main_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_profile_id_seq', 1, true);


--
-- Name: main_projectupdateevent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_projectupdateevent_id_seq', 429, true);


--
-- Name: main_rbac_role_ancestors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_rbac_role_ancestors_id_seq', 395, true);


--
-- Name: main_rbac_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_rbac_roles_id_seq', 75, true);


--
-- Name: main_rbac_roles_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_rbac_roles_members_id_seq', 7, true);


--
-- Name: main_rbac_roles_parents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_rbac_roles_parents_id_seq', 138, true);


--
-- Name: main_schedule_credentials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_schedule_credentials_id_seq', 1, false);


--
-- Name: main_schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_schedule_id_seq', 5, true);


--
-- Name: main_smartinventorymembership_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_smartinventorymembership_id_seq', 1, false);


--
-- Name: main_systemjobevent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_systemjobevent_id_seq', 8, true);


--
-- Name: main_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_team_id_seq', 1, false);


--
-- Name: main_towerschedulestate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_towerschedulestate_id_seq', 1, false);


--
-- Name: main_unifiedjob_credentials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_unifiedjob_credentials_id_seq', 12, true);


--
-- Name: main_unifiedjob_dependent_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_unifiedjob_dependent_jobs_id_seq', 2, true);


--
-- Name: main_unifiedjob_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_unifiedjob_id_seq', 27, true);


--
-- Name: main_unifiedjob_labels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_unifiedjob_labels_id_seq', 1, false);


--
-- Name: main_unifiedjob_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_unifiedjob_notifications_id_seq', 1, false);


--
-- Name: main_unifiedjobtemplate_credentials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_unifiedjobtemplate_credentials_id_seq', 6, true);


--
-- Name: main_unifiedjobtemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_unifiedjobtemplate_id_seq', 14, true);


--
-- Name: main_unifiedjobtemplate_labels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_unifiedjobtemplate_labels_id_seq', 1, false);


--
-- Name: main_unifiedjobtemplate_notification_templates_error_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_unifiedjobtemplate_notification_templates_error_id_seq', 1, false);


--
-- Name: main_unifiedjobtemplate_notification_templates_started_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_unifiedjobtemplate_notification_templates_started_id_seq', 1, false);


--
-- Name: main_unifiedjobtemplate_notification_templates_success_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_unifiedjobtemplate_notification_templates_success_id_seq', 1, false);


--
-- Name: main_unifiedjobtemplateinstancegroupmembership_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_unifiedjobtemplateinstancegroupmembership_id_seq', 1, false);


--
-- Name: main_usersessionmembership_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_usersessionmembership_id_seq', 8, true);


--
-- Name: main_workflowjobnode_always_nodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_workflowjobnode_always_nodes_id_seq', 1, false);


--
-- Name: main_workflowjobnode_credentials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_workflowjobnode_credentials_id_seq', 1, false);


--
-- Name: main_workflowjobnode_failure_nodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_workflowjobnode_failure_nodes_id_seq', 1, false);


--
-- Name: main_workflowjobnode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_workflowjobnode_id_seq', 1, false);


--
-- Name: main_workflowjobnode_success_nodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_workflowjobnode_success_nodes_id_seq', 1, false);


--
-- Name: main_workflowjobtemplate_notification_templates_approval_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_workflowjobtemplate_notification_templates_approval_id_seq', 1, false);


--
-- Name: main_workflowjobtemplatenode_always_nodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_workflowjobtemplatenode_always_nodes_id_seq', 1, false);


--
-- Name: main_workflowjobtemplatenode_credentials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_workflowjobtemplatenode_credentials_id_seq', 1, false);


--
-- Name: main_workflowjobtemplatenode_failure_nodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_workflowjobtemplatenode_failure_nodes_id_seq', 1, false);


--
-- Name: main_workflowjobtemplatenode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_workflowjobtemplatenode_id_seq', 1, false);


--
-- Name: main_workflowjobtemplatenode_success_nodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.main_workflowjobtemplatenode_success_nodes_id_seq', 1, false);


--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.oauth2_provider_grant_id_seq', 1, false);


--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.oauth2_provider_refreshtoken_id_seq', 1, false);


--
-- Name: social_auth_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.social_auth_association_id_seq', 1, false);


--
-- Name: social_auth_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.social_auth_code_id_seq', 1, false);


--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.social_auth_nonce_id_seq', 1, false);


--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.social_auth_partial_id_seq', 1, false);


--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.social_auth_usersocialauth_id_seq', 1, false);


--
-- Name: sso_userenterpriseauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.sso_userenterpriseauth_id_seq', 1, false);


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.taggit_tag_id_seq', 1, false);


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: awx
--

SELECT pg_catalog.setval('public.taggit_taggeditem_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: conf_setting conf_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.conf_setting
    ADD CONSTRAINT conf_setting_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_ad_hoc_command main_activitystream_ad_h_activitystream_id_adhocc_710d9648_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_ad_hoc_command
    ADD CONSTRAINT main_activitystream_ad_h_activitystream_id_adhocc_710d9648_uniq UNIQUE (activitystream_id, adhoccommand_id);


--
-- Name: main_activitystream_ad_hoc_command main_activitystream_ad_hoc_command_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_ad_hoc_command
    ADD CONSTRAINT main_activitystream_ad_hoc_command_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_credential main_activitystream_cred_activitystream_id_creden_6b3be6d5_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_credential
    ADD CONSTRAINT main_activitystream_cred_activitystream_id_creden_6b3be6d5_uniq UNIQUE (activitystream_id, credential_id);


--
-- Name: main_activitystream_credential_type main_activitystream_cred_activitystream_id_creden_85746647_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_credential_type
    ADD CONSTRAINT main_activitystream_cred_activitystream_id_creden_85746647_uniq UNIQUE (activitystream_id, credentialtype_id);


--
-- Name: main_activitystream_credential main_activitystream_credential_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_credential
    ADD CONSTRAINT main_activitystream_credential_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_credential_type main_activitystream_credential_type_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_credential_type
    ADD CONSTRAINT main_activitystream_credential_type_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_custom_inventory_script main_activitystream_cust_activitystream_id_custom_2e4ddecc_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_custom_inventory_script
    ADD CONSTRAINT main_activitystream_cust_activitystream_id_custom_2e4ddecc_uniq UNIQUE (activitystream_id, custominventoryscript_id);


--
-- Name: main_activitystream_custom_inventory_script main_activitystream_custom_inventory_script_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_custom_inventory_script
    ADD CONSTRAINT main_activitystream_custom_inventory_script_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_group main_activitystream_grou_activitystream_id_group__3068b98d_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_group
    ADD CONSTRAINT main_activitystream_grou_activitystream_id_group__3068b98d_uniq UNIQUE (activitystream_id, group_id);


--
-- Name: main_activitystream_group main_activitystream_group_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_group
    ADD CONSTRAINT main_activitystream_group_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_host main_activitystream_host_activitystream_id_host_i_7ec5e62e_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_host
    ADD CONSTRAINT main_activitystream_host_activitystream_id_host_i_7ec5e62e_uniq UNIQUE (activitystream_id, host_id);


--
-- Name: main_activitystream_host main_activitystream_host_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_host
    ADD CONSTRAINT main_activitystream_host_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_instance_group main_activitystream_inst_activitystream_id_instan_173bfccd_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_instance_group
    ADD CONSTRAINT main_activitystream_inst_activitystream_id_instan_173bfccd_uniq UNIQUE (activitystream_id, instancegroup_id);


--
-- Name: main_activitystream_instance main_activitystream_inst_activitystream_id_instan_eba71ee1_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_instance
    ADD CONSTRAINT main_activitystream_inst_activitystream_id_instan_eba71ee1_uniq UNIQUE (activitystream_id, instance_id);


--
-- Name: main_activitystream_instance_group main_activitystream_instance_group_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_instance_group
    ADD CONSTRAINT main_activitystream_instance_group_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_instance main_activitystream_instance_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_instance
    ADD CONSTRAINT main_activitystream_instance_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_inventory_update main_activitystream_inve_activitystream_id_invent_28edee6e_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_inventory_update
    ADD CONSTRAINT main_activitystream_inve_activitystream_id_invent_28edee6e_uniq UNIQUE (activitystream_id, inventoryupdate_id);


--
-- Name: main_activitystream_inventory main_activitystream_inve_activitystream_id_invent_410769d5_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_inventory
    ADD CONSTRAINT main_activitystream_inve_activitystream_id_invent_410769d5_uniq UNIQUE (activitystream_id, inventory_id);


--
-- Name: main_activitystream_inventory_source main_activitystream_inve_activitystream_id_invent_e9d8f675_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_inventory_source
    ADD CONSTRAINT main_activitystream_inve_activitystream_id_invent_e9d8f675_uniq UNIQUE (activitystream_id, inventorysource_id);


--
-- Name: main_activitystream_inventory main_activitystream_inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_inventory
    ADD CONSTRAINT main_activitystream_inventory_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_inventory_source main_activitystream_inventory_source_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_inventory_source
    ADD CONSTRAINT main_activitystream_inventory_source_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_inventory_update main_activitystream_inventory_update_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_inventory_update
    ADD CONSTRAINT main_activitystream_inventory_update_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_job_template main_activitystream_job__activitystream_id_jobtem_ca7c997a_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_job_template
    ADD CONSTRAINT main_activitystream_job__activitystream_id_jobtem_ca7c997a_uniq UNIQUE (activitystream_id, jobtemplate_id);


--
-- Name: main_activitystream_job main_activitystream_job_activitystream_id_job_id_dbb86499_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_job
    ADD CONSTRAINT main_activitystream_job_activitystream_id_job_id_dbb86499_uniq UNIQUE (activitystream_id, job_id);


--
-- Name: main_activitystream_job main_activitystream_job_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_job
    ADD CONSTRAINT main_activitystream_job_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_job_template main_activitystream_job_template_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_job_template
    ADD CONSTRAINT main_activitystream_job_template_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_label main_activitystream_labe_activitystream_id_label__04ca98fb_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_label
    ADD CONSTRAINT main_activitystream_labe_activitystream_id_label__04ca98fb_uniq UNIQUE (activitystream_id, label_id);


--
-- Name: main_activitystream_label main_activitystream_label_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_label
    ADD CONSTRAINT main_activitystream_label_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_notification_template main_activitystream_noti_activitystream_id_notifi_2ecdc66e_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_notification_template
    ADD CONSTRAINT main_activitystream_noti_activitystream_id_notifi_2ecdc66e_uniq UNIQUE (activitystream_id, notificationtemplate_id);


--
-- Name: main_activitystream_notification main_activitystream_noti_activitystream_id_notifi_3f05835f_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_notification
    ADD CONSTRAINT main_activitystream_noti_activitystream_id_notifi_3f05835f_uniq UNIQUE (activitystream_id, notification_id);


--
-- Name: main_activitystream_notification main_activitystream_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_notification
    ADD CONSTRAINT main_activitystream_notification_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_notification_template main_activitystream_notification_template_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_notification_template
    ADD CONSTRAINT main_activitystream_notification_template_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_o_auth2_application main_activitystream_o_au_activitystream_id_oauth2_50acf66a_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_o_auth2_application
    ADD CONSTRAINT main_activitystream_o_au_activitystream_id_oauth2_50acf66a_uniq UNIQUE (activitystream_id, oauth2application_id);


--
-- Name: main_activitystream_o_auth2_access_token main_activitystream_o_au_activitystream_id_oauth2_625b181f_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_o_auth2_access_token
    ADD CONSTRAINT main_activitystream_o_au_activitystream_id_oauth2_625b181f_uniq UNIQUE (activitystream_id, oauth2accesstoken_id);


--
-- Name: main_activitystream_o_auth2_access_token main_activitystream_o_auth2_access_token_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_o_auth2_access_token
    ADD CONSTRAINT main_activitystream_o_auth2_access_token_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_o_auth2_application main_activitystream_o_auth2_application_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_o_auth2_application
    ADD CONSTRAINT main_activitystream_o_auth2_application_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_organization main_activitystream_orga_activitystream_id_organi_ad587114_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_organization
    ADD CONSTRAINT main_activitystream_orga_activitystream_id_organi_ad587114_uniq UNIQUE (activitystream_id, organization_id);


--
-- Name: main_activitystream_organization main_activitystream_organization_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_organization
    ADD CONSTRAINT main_activitystream_organization_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream main_activitystream_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream
    ADD CONSTRAINT main_activitystream_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_project main_activitystream_proj_activitystream_id_projec_25dcced8_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_project
    ADD CONSTRAINT main_activitystream_proj_activitystream_id_projec_25dcced8_uniq UNIQUE (activitystream_id, project_id);


--
-- Name: main_activitystream_project_update main_activitystream_proj_activitystream_id_projec_a3be3a08_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_project_update
    ADD CONSTRAINT main_activitystream_proj_activitystream_id_projec_a3be3a08_uniq UNIQUE (activitystream_id, projectupdate_id);


--
-- Name: main_activitystream_project main_activitystream_project_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_project
    ADD CONSTRAINT main_activitystream_project_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_project_update main_activitystream_project_update_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_project_update
    ADD CONSTRAINT main_activitystream_project_update_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_role main_activitystream_role_activitystream_id_role_i_b51f6b40_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_role
    ADD CONSTRAINT main_activitystream_role_activitystream_id_role_i_b51f6b40_uniq UNIQUE (activitystream_id, role_id);


--
-- Name: main_activitystream_role main_activitystream_role_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_role
    ADD CONSTRAINT main_activitystream_role_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_schedule main_activitystream_sche_activitystream_id_schedu_a871c992_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_schedule
    ADD CONSTRAINT main_activitystream_sche_activitystream_id_schedu_a871c992_uniq UNIQUE (activitystream_id, schedule_id);


--
-- Name: main_activitystream_schedule main_activitystream_schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_schedule
    ADD CONSTRAINT main_activitystream_schedule_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_team main_activitystream_team_activitystream_id_team_i_89af4b2a_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_team
    ADD CONSTRAINT main_activitystream_team_activitystream_id_team_i_89af4b2a_uniq UNIQUE (activitystream_id, team_id);


--
-- Name: main_activitystream_team main_activitystream_team_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_team
    ADD CONSTRAINT main_activitystream_team_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_unified_job main_activitystream_unif_activitystream_id_unifie_0fc17da3_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_unified_job
    ADD CONSTRAINT main_activitystream_unif_activitystream_id_unifie_0fc17da3_uniq UNIQUE (activitystream_id, unifiedjob_id);


--
-- Name: main_activitystream_unified_job_template main_activitystream_unif_activitystream_id_unifie_e4b906b4_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_unified_job_template
    ADD CONSTRAINT main_activitystream_unif_activitystream_id_unifie_e4b906b4_uniq UNIQUE (activitystream_id, unifiedjobtemplate_id);


--
-- Name: main_activitystream_unified_job main_activitystream_unified_job_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_unified_job
    ADD CONSTRAINT main_activitystream_unified_job_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_unified_job_template main_activitystream_unified_job_template_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_unified_job_template
    ADD CONSTRAINT main_activitystream_unified_job_template_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_user main_activitystream_user_activitystream_id_user_i_3fa08b1e_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_user
    ADD CONSTRAINT main_activitystream_user_activitystream_id_user_i_3fa08b1e_uniq UNIQUE (activitystream_id, user_id);


--
-- Name: main_activitystream_user main_activitystream_user_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_user
    ADD CONSTRAINT main_activitystream_user_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_workflow_approval_template main_activitystream_work_activitystream_id_workfl_6145f2cd_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_workflow_approval_template
    ADD CONSTRAINT main_activitystream_work_activitystream_id_workfl_6145f2cd_uniq UNIQUE (activitystream_id, workflowapprovaltemplate_id);


--
-- Name: main_activitystream_workflow_approval main_activitystream_work_activitystream_id_workfl_7c76df21_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_workflow_approval
    ADD CONSTRAINT main_activitystream_work_activitystream_id_workfl_7c76df21_uniq UNIQUE (activitystream_id, workflowapproval_id);


--
-- Name: main_activitystream_workflow_job_template main_activitystream_work_activitystream_id_workfl_9cf83c74_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_workflow_job_template
    ADD CONSTRAINT main_activitystream_work_activitystream_id_workfl_9cf83c74_uniq UNIQUE (activitystream_id, workflowjobtemplate_id);


--
-- Name: main_activitystream_workflow_job main_activitystream_work_activitystream_id_workfl_bfe2d0c3_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_workflow_job
    ADD CONSTRAINT main_activitystream_work_activitystream_id_workfl_bfe2d0c3_uniq UNIQUE (activitystream_id, workflowjob_id);


--
-- Name: main_activitystream_workflow_job_template_node main_activitystream_work_activitystream_id_workfl_c3080a18_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_workflow_job_template_node
    ADD CONSTRAINT main_activitystream_work_activitystream_id_workfl_c3080a18_uniq UNIQUE (activitystream_id, workflowjobtemplatenode_id);


--
-- Name: main_activitystream_workflow_job_node main_activitystream_work_activitystream_id_workfl_d615af7e_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_workflow_job_node
    ADD CONSTRAINT main_activitystream_work_activitystream_id_workfl_d615af7e_uniq UNIQUE (activitystream_id, workflowjobnode_id);


--
-- Name: main_activitystream_workflow_approval main_activitystream_workflow_approval_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_workflow_approval
    ADD CONSTRAINT main_activitystream_workflow_approval_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_workflow_approval_template main_activitystream_workflow_approval_template_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_workflow_approval_template
    ADD CONSTRAINT main_activitystream_workflow_approval_template_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_workflow_job_node main_activitystream_workflow_job_node_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_workflow_job_node
    ADD CONSTRAINT main_activitystream_workflow_job_node_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_workflow_job main_activitystream_workflow_job_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_workflow_job
    ADD CONSTRAINT main_activitystream_workflow_job_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_workflow_job_template_node main_activitystream_workflow_job_template_node_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_workflow_job_template_node
    ADD CONSTRAINT main_activitystream_workflow_job_template_node_pkey PRIMARY KEY (id);


--
-- Name: main_activitystream_workflow_job_template main_activitystream_workflow_job_template_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_workflow_job_template
    ADD CONSTRAINT main_activitystream_workflow_job_template_pkey PRIMARY KEY (id);


--
-- Name: main_adhoccommand main_adhoccommand_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_adhoccommand
    ADD CONSTRAINT main_adhoccommand_pkey PRIMARY KEY (unifiedjob_ptr_id);


--
-- Name: _old_main_adhoccommandevent main_adhoccommandevent_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public._old_main_adhoccommandevent
    ADD CONSTRAINT main_adhoccommandevent_pkey PRIMARY KEY (id);


--
-- Name: main_adhoccommandevent main_adhoccommandevent_pkey1; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_adhoccommandevent
    ADD CONSTRAINT main_adhoccommandevent_pkey1 PRIMARY KEY (id);


--
-- Name: main_credential main_credential_organization_id_name_cre_55ee19c5_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_credential
    ADD CONSTRAINT main_credential_organization_id_name_cre_55ee19c5_uniq UNIQUE (organization_id, name, credential_type_id);


--
-- Name: main_credential main_credential_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_credential
    ADD CONSTRAINT main_credential_pkey PRIMARY KEY (id);


--
-- Name: main_credentialinputsource main_credentialinputsour_target_credential_id_inp_8e297f1b_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_credentialinputsource
    ADD CONSTRAINT main_credentialinputsour_target_credential_id_inp_8e297f1b_uniq UNIQUE (target_credential_id, input_field_name);


--
-- Name: main_credentialinputsource main_credentialinputsource_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_credentialinputsource
    ADD CONSTRAINT main_credentialinputsource_pkey PRIMARY KEY (id);


--
-- Name: main_credentialtype main_credentialtype_name_kind_af26d717_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_credentialtype
    ADD CONSTRAINT main_credentialtype_name_kind_af26d717_uniq UNIQUE (name, kind);


--
-- Name: main_credentialtype main_credentialtype_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_credentialtype
    ADD CONSTRAINT main_credentialtype_pkey PRIMARY KEY (id);


--
-- Name: main_custominventoryscript main_custominventoryscript_name_organization_id_ff151956_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_custominventoryscript
    ADD CONSTRAINT main_custominventoryscript_name_organization_id_ff151956_uniq UNIQUE (name, organization_id);


--
-- Name: main_custominventoryscript main_custominventoryscript_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_custominventoryscript
    ADD CONSTRAINT main_custominventoryscript_pkey PRIMARY KEY (id);


--
-- Name: main_group_hosts main_group_hosts_group_id_host_id_0713d0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_group_hosts
    ADD CONSTRAINT main_group_hosts_group_id_host_id_0713d0ac_uniq UNIQUE (group_id, host_id);


--
-- Name: main_group_hosts main_group_hosts_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_group_hosts
    ADD CONSTRAINT main_group_hosts_pkey PRIMARY KEY (id);


--
-- Name: main_group_inventory_sources main_group_inventory_sou_group_id_inventorysource_dcb51e86_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_group_inventory_sources
    ADD CONSTRAINT main_group_inventory_sou_group_id_inventorysource_dcb51e86_uniq UNIQUE (group_id, inventorysource_id);


--
-- Name: main_group_inventory_sources main_group_inventory_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_group_inventory_sources
    ADD CONSTRAINT main_group_inventory_sources_pkey PRIMARY KEY (id);


--
-- Name: main_group main_group_name_inventory_id_459cfada_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_group
    ADD CONSTRAINT main_group_name_inventory_id_459cfada_uniq UNIQUE (name, inventory_id);


--
-- Name: main_group_parents main_group_parents_from_group_id_to_group_id_8c9a3fcb_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_group_parents
    ADD CONSTRAINT main_group_parents_from_group_id_to_group_id_8c9a3fcb_uniq UNIQUE (from_group_id, to_group_id);


--
-- Name: main_group_parents main_group_parents_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_group_parents
    ADD CONSTRAINT main_group_parents_pkey PRIMARY KEY (id);


--
-- Name: main_group main_group_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_group
    ADD CONSTRAINT main_group_pkey PRIMARY KEY (id);


--
-- Name: main_host_inventory_sources main_host_inventory_sour_host_id_inventorysource__bdf6a207_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_host_inventory_sources
    ADD CONSTRAINT main_host_inventory_sour_host_id_inventorysource__bdf6a207_uniq UNIQUE (host_id, inventorysource_id);


--
-- Name: main_host_inventory_sources main_host_inventory_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_host_inventory_sources
    ADD CONSTRAINT main_host_inventory_sources_pkey PRIMARY KEY (id);


--
-- Name: main_host main_host_name_inventory_id_45aecd68_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_host
    ADD CONSTRAINT main_host_name_inventory_id_45aecd68_uniq UNIQUE (name, inventory_id);


--
-- Name: main_host main_host_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_host
    ADD CONSTRAINT main_host_pkey PRIMARY KEY (id);


--
-- Name: main_instance main_instance_hostname_key; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_instance
    ADD CONSTRAINT main_instance_hostname_key UNIQUE (hostname);


--
-- Name: main_instance main_instance_ip_address_key; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_instance
    ADD CONSTRAINT main_instance_ip_address_key UNIQUE (ip_address);


--
-- Name: main_instance main_instance_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_instance
    ADD CONSTRAINT main_instance_pkey PRIMARY KEY (id);


--
-- Name: main_instancegroup_instances main_instancegroup_insta_instancegroup_id_instanc_d224c278_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_instancegroup_instances
    ADD CONSTRAINT main_instancegroup_insta_instancegroup_id_instanc_d224c278_uniq UNIQUE (instancegroup_id, instance_id);


--
-- Name: main_instancegroup_instances main_instancegroup_instances_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_instancegroup_instances
    ADD CONSTRAINT main_instancegroup_instances_pkey PRIMARY KEY (id);


--
-- Name: main_instancegroup main_instancegroup_name_key; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_instancegroup
    ADD CONSTRAINT main_instancegroup_name_key UNIQUE (name);


--
-- Name: main_instancegroup main_instancegroup_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_instancegroup
    ADD CONSTRAINT main_instancegroup_pkey PRIMARY KEY (id);


--
-- Name: main_inventory main_inventory_name_organization_id_5137f34c_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_inventory
    ADD CONSTRAINT main_inventory_name_organization_id_5137f34c_uniq UNIQUE (name, organization_id);


--
-- Name: main_inventory main_inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_inventory
    ADD CONSTRAINT main_inventory_pkey PRIMARY KEY (id);


--
-- Name: main_inventoryinstancegroupmembership main_inventoryinstancegroupmembership_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_inventoryinstancegroupmembership
    ADD CONSTRAINT main_inventoryinstancegroupmembership_pkey PRIMARY KEY (id);


--
-- Name: main_inventorysource main_inventorysource_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_inventorysource
    ADD CONSTRAINT main_inventorysource_pkey PRIMARY KEY (unifiedjobtemplate_ptr_id);


--
-- Name: main_inventoryupdate main_inventoryupdate_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_inventoryupdate
    ADD CONSTRAINT main_inventoryupdate_pkey PRIMARY KEY (unifiedjob_ptr_id);


--
-- Name: _old_main_inventoryupdateevent main_inventoryupdateevent_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public._old_main_inventoryupdateevent
    ADD CONSTRAINT main_inventoryupdateevent_pkey PRIMARY KEY (id);


--
-- Name: main_inventoryupdateevent main_inventoryupdateevent_pkey1; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_inventoryupdateevent
    ADD CONSTRAINT main_inventoryupdateevent_pkey1 PRIMARY KEY (id);


--
-- Name: main_job main_job_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_job
    ADD CONSTRAINT main_job_pkey PRIMARY KEY (unifiedjob_ptr_id);


--
-- Name: _old_main_jobevent main_jobevent_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public._old_main_jobevent
    ADD CONSTRAINT main_jobevent_pkey PRIMARY KEY (id);


--
-- Name: main_jobevent main_jobevent_pkey1; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_jobevent
    ADD CONSTRAINT main_jobevent_pkey1 PRIMARY KEY (id);


--
-- Name: main_jobhostsummary main_jobhostsummary_job_id_host_name_eb22f938_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_jobhostsummary
    ADD CONSTRAINT main_jobhostsummary_job_id_host_name_eb22f938_uniq UNIQUE (job_id, host_name);


--
-- Name: main_jobhostsummary main_jobhostsummary_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_jobhostsummary
    ADD CONSTRAINT main_jobhostsummary_pkey PRIMARY KEY (id);


--
-- Name: main_joblaunchconfig_credentials main_joblaunchconfig_cre_joblaunchconfig_id_crede_77f9ef8b_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_joblaunchconfig_credentials
    ADD CONSTRAINT main_joblaunchconfig_cre_joblaunchconfig_id_crede_77f9ef8b_uniq UNIQUE (joblaunchconfig_id, credential_id);


--
-- Name: main_joblaunchconfig_credentials main_joblaunchconfig_credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_joblaunchconfig_credentials
    ADD CONSTRAINT main_joblaunchconfig_credentials_pkey PRIMARY KEY (id);


--
-- Name: main_joblaunchconfig main_joblaunchconfig_job_id_key; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_joblaunchconfig
    ADD CONSTRAINT main_joblaunchconfig_job_id_key UNIQUE (job_id);


--
-- Name: main_joblaunchconfig main_joblaunchconfig_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_joblaunchconfig
    ADD CONSTRAINT main_joblaunchconfig_pkey PRIMARY KEY (id);


--
-- Name: main_jobtemplate main_jobtemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_jobtemplate
    ADD CONSTRAINT main_jobtemplate_pkey PRIMARY KEY (unifiedjobtemplate_ptr_id);


--
-- Name: main_label main_label_name_organization_id_f79d7ac4_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_label
    ADD CONSTRAINT main_label_name_organization_id_f79d7ac4_uniq UNIQUE (name, organization_id);


--
-- Name: main_label main_label_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_label
    ADD CONSTRAINT main_label_pkey PRIMARY KEY (id);


--
-- Name: main_notification main_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_notification
    ADD CONSTRAINT main_notification_pkey PRIMARY KEY (id);


--
-- Name: main_notificationtemplate main_notificationtemplate_organization_id_name_07260e01_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_notificationtemplate
    ADD CONSTRAINT main_notificationtemplate_organization_id_name_07260e01_uniq UNIQUE (organization_id, name);


--
-- Name: main_notificationtemplate main_notificationtemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_notificationtemplate
    ADD CONSTRAINT main_notificationtemplate_pkey PRIMARY KEY (id);


--
-- Name: main_oauth2accesstoken main_oauth2accesstoken_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_oauth2accesstoken
    ADD CONSTRAINT main_oauth2accesstoken_pkey PRIMARY KEY (id);


--
-- Name: main_oauth2accesstoken main_oauth2accesstoken_source_refresh_token_id_key; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_oauth2accesstoken
    ADD CONSTRAINT main_oauth2accesstoken_source_refresh_token_id_key UNIQUE (source_refresh_token_id);


--
-- Name: main_oauth2accesstoken main_oauth2accesstoken_token_key; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_oauth2accesstoken
    ADD CONSTRAINT main_oauth2accesstoken_token_key UNIQUE (token);


--
-- Name: main_oauth2application main_oauth2application_client_id_key; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_oauth2application
    ADD CONSTRAINT main_oauth2application_client_id_key UNIQUE (client_id);


--
-- Name: main_oauth2application main_oauth2application_name_organization_id_55462c8e_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_oauth2application
    ADD CONSTRAINT main_oauth2application_name_organization_id_55462c8e_uniq UNIQUE (name, organization_id);


--
-- Name: main_oauth2application main_oauth2application_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_oauth2application
    ADD CONSTRAINT main_oauth2application_pkey PRIMARY KEY (id);


--
-- Name: main_organization main_organization_name_key; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organization
    ADD CONSTRAINT main_organization_name_key UNIQUE (name);


--
-- Name: main_organization_notification_templates_started main_organization_notifi_organization_id_notifica_2ef43b54_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organization_notification_templates_started
    ADD CONSTRAINT main_organization_notifi_organization_id_notifica_2ef43b54_uniq UNIQUE (organization_id, notificationtemplate_id);


--
-- Name: main_organization_notification_templates_success main_organization_notifi_organization_id_notifica_3ccf8832_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organization_notification_templates_success
    ADD CONSTRAINT main_organization_notifi_organization_id_notifica_3ccf8832_uniq UNIQUE (organization_id, notificationtemplate_id);


--
-- Name: main_organization_notification_templates_error main_organization_notifi_organization_id_notifica_88aa41f6_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organization_notification_templates_error
    ADD CONSTRAINT main_organization_notifi_organization_id_notifica_88aa41f6_uniq UNIQUE (organization_id, notificationtemplate_id);


--
-- Name: main_organization_notification_templates_approvals main_organization_notifi_organization_id_notifica_ec9bb02b_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organization_notification_templates_approvals
    ADD CONSTRAINT main_organization_notifi_organization_id_notifica_ec9bb02b_uniq UNIQUE (organization_id, notificationtemplate_id);


--
-- Name: main_organization_notification_templates_approvals main_organization_notification_templates_approvals_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organization_notification_templates_approvals
    ADD CONSTRAINT main_organization_notification_templates_approvals_pkey PRIMARY KEY (id);


--
-- Name: main_organization_notification_templates_error main_organization_notification_templates_error_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organization_notification_templates_error
    ADD CONSTRAINT main_organization_notification_templates_error_pkey PRIMARY KEY (id);


--
-- Name: main_organization_notification_templates_started main_organization_notification_templates_started_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organization_notification_templates_started
    ADD CONSTRAINT main_organization_notification_templates_started_pkey PRIMARY KEY (id);


--
-- Name: main_organization_notification_templates_success main_organization_notification_templates_success_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organization_notification_templates_success
    ADD CONSTRAINT main_organization_notification_templates_success_pkey PRIMARY KEY (id);


--
-- Name: main_organization main_organization_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organization
    ADD CONSTRAINT main_organization_pkey PRIMARY KEY (id);


--
-- Name: main_organizationgalaxycredentialmembership main_organizationgalaxycredentialmembership_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organizationgalaxycredentialmembership
    ADD CONSTRAINT main_organizationgalaxycredentialmembership_pkey PRIMARY KEY (id);


--
-- Name: main_organizationinstancegroupmembership main_organizationinstancegroupmembership_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organizationinstancegroupmembership
    ADD CONSTRAINT main_organizationinstancegroupmembership_pkey PRIMARY KEY (id);


--
-- Name: main_profile main_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_profile
    ADD CONSTRAINT main_profile_pkey PRIMARY KEY (id);


--
-- Name: main_profile main_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_profile
    ADD CONSTRAINT main_profile_user_id_key UNIQUE (user_id);


--
-- Name: main_project main_project_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_project
    ADD CONSTRAINT main_project_pkey PRIMARY KEY (unifiedjobtemplate_ptr_id);


--
-- Name: main_projectupdate main_projectupdate_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_projectupdate
    ADD CONSTRAINT main_projectupdate_pkey PRIMARY KEY (unifiedjob_ptr_id);


--
-- Name: _old_main_projectupdateevent main_projectupdateevent_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public._old_main_projectupdateevent
    ADD CONSTRAINT main_projectupdateevent_pkey PRIMARY KEY (id);


--
-- Name: main_projectupdateevent main_projectupdateevent_pkey1; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_projectupdateevent
    ADD CONSTRAINT main_projectupdateevent_pkey1 PRIMARY KEY (id);


--
-- Name: main_rbac_role_ancestors main_rbac_role_ancestors_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_rbac_role_ancestors
    ADD CONSTRAINT main_rbac_role_ancestors_pkey PRIMARY KEY (id);


--
-- Name: main_rbac_roles_members main_rbac_roles_members_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_rbac_roles_members
    ADD CONSTRAINT main_rbac_roles_members_pkey PRIMARY KEY (id);


--
-- Name: main_rbac_roles_members main_rbac_roles_members_role_id_user_id_9803c082_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_rbac_roles_members
    ADD CONSTRAINT main_rbac_roles_members_role_id_user_id_9803c082_uniq UNIQUE (role_id, user_id);


--
-- Name: main_rbac_roles_parents main_rbac_roles_parents_from_role_id_to_role_id_1ab75c81_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_rbac_roles_parents
    ADD CONSTRAINT main_rbac_roles_parents_from_role_id_to_role_id_1ab75c81_uniq UNIQUE (from_role_id, to_role_id);


--
-- Name: main_rbac_roles_parents main_rbac_roles_parents_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_rbac_roles_parents
    ADD CONSTRAINT main_rbac_roles_parents_pkey PRIMARY KEY (id);


--
-- Name: main_rbac_roles main_rbac_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_rbac_roles
    ADD CONSTRAINT main_rbac_roles_pkey PRIMARY KEY (id);


--
-- Name: main_rbac_roles main_rbac_roles_singleton_name_key; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_rbac_roles
    ADD CONSTRAINT main_rbac_roles_singleton_name_key UNIQUE (singleton_name);


--
-- Name: main_schedule_credentials main_schedule_credential_schedule_id_credential_i_11bed4b0_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_schedule_credentials
    ADD CONSTRAINT main_schedule_credential_schedule_id_credential_i_11bed4b0_uniq UNIQUE (schedule_id, credential_id);


--
-- Name: main_schedule_credentials main_schedule_credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_schedule_credentials
    ADD CONSTRAINT main_schedule_credentials_pkey PRIMARY KEY (id);


--
-- Name: main_schedule main_schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_schedule
    ADD CONSTRAINT main_schedule_pkey PRIMARY KEY (id);


--
-- Name: main_schedule main_schedule_unified_job_template_id_name_9ba35d7e_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_schedule
    ADD CONSTRAINT main_schedule_unified_job_template_id_name_9ba35d7e_uniq UNIQUE (unified_job_template_id, name);


--
-- Name: main_smartinventorymembership main_smartinventorymembe_host_id_inventory_id_58137be6_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_smartinventorymembership
    ADD CONSTRAINT main_smartinventorymembe_host_id_inventory_id_58137be6_uniq UNIQUE (host_id, inventory_id);


--
-- Name: main_smartinventorymembership main_smartinventorymembership_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_smartinventorymembership
    ADD CONSTRAINT main_smartinventorymembership_pkey PRIMARY KEY (id);


--
-- Name: main_systemjob main_systemjob_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_systemjob
    ADD CONSTRAINT main_systemjob_pkey PRIMARY KEY (unifiedjob_ptr_id);


--
-- Name: _old_main_systemjobevent main_systemjobevent_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public._old_main_systemjobevent
    ADD CONSTRAINT main_systemjobevent_pkey PRIMARY KEY (id);


--
-- Name: main_systemjobevent main_systemjobevent_pkey1; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_systemjobevent
    ADD CONSTRAINT main_systemjobevent_pkey1 PRIMARY KEY (id);


--
-- Name: main_systemjobtemplate main_systemjobtemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_systemjobtemplate
    ADD CONSTRAINT main_systemjobtemplate_pkey PRIMARY KEY (unifiedjobtemplate_ptr_id);


--
-- Name: main_team main_team_organization_id_name_70f0184b_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_team
    ADD CONSTRAINT main_team_organization_id_name_70f0184b_uniq UNIQUE (organization_id, name);


--
-- Name: main_team main_team_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_team
    ADD CONSTRAINT main_team_pkey PRIMARY KEY (id);


--
-- Name: main_towerschedulestate main_towerschedulestate_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_towerschedulestate
    ADD CONSTRAINT main_towerschedulestate_pkey PRIMARY KEY (id);


--
-- Name: main_unifiedjob_credentials main_unifiedjob_credenti_unifiedjob_id_credential_f4b12e17_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjob_credentials
    ADD CONSTRAINT main_unifiedjob_credenti_unifiedjob_id_credential_f4b12e17_uniq UNIQUE (unifiedjob_id, credential_id);


--
-- Name: main_unifiedjob_credentials main_unifiedjob_credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjob_credentials
    ADD CONSTRAINT main_unifiedjob_credentials_pkey PRIMARY KEY (id);


--
-- Name: main_unifiedjob_dependent_jobs main_unifiedjob_dependen_from_unifiedjob_id_to_un_8ee8a967_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjob_dependent_jobs
    ADD CONSTRAINT main_unifiedjob_dependen_from_unifiedjob_id_to_un_8ee8a967_uniq UNIQUE (from_unifiedjob_id, to_unifiedjob_id);


--
-- Name: main_unifiedjob_dependent_jobs main_unifiedjob_dependent_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjob_dependent_jobs
    ADD CONSTRAINT main_unifiedjob_dependent_jobs_pkey PRIMARY KEY (id);


--
-- Name: main_unifiedjob_labels main_unifiedjob_labels_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjob_labels
    ADD CONSTRAINT main_unifiedjob_labels_pkey PRIMARY KEY (id);


--
-- Name: main_unifiedjob_labels main_unifiedjob_labels_unifiedjob_id_label_id_f6e1dc96_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjob_labels
    ADD CONSTRAINT main_unifiedjob_labels_unifiedjob_id_label_id_f6e1dc96_uniq UNIQUE (unifiedjob_id, label_id);


--
-- Name: main_unifiedjob_notifications main_unifiedjob_notifica_unifiedjob_id_notificati_895ae806_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjob_notifications
    ADD CONSTRAINT main_unifiedjob_notifica_unifiedjob_id_notificati_895ae806_uniq UNIQUE (unifiedjob_id, notification_id);


--
-- Name: main_unifiedjob_notifications main_unifiedjob_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjob_notifications
    ADD CONSTRAINT main_unifiedjob_notifications_pkey PRIMARY KEY (id);


--
-- Name: main_unifiedjob main_unifiedjob_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjob
    ADD CONSTRAINT main_unifiedjob_pkey PRIMARY KEY (id);


--
-- Name: main_unifiedjobtemplate_credentials main_unifiedjobtemplate__unifiedjobtemplate_id_cr_e10bc7a4_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_credentials
    ADD CONSTRAINT main_unifiedjobtemplate__unifiedjobtemplate_id_cr_e10bc7a4_uniq UNIQUE (unifiedjobtemplate_id, credential_id);


--
-- Name: main_unifiedjobtemplate_labels main_unifiedjobtemplate__unifiedjobtemplate_id_la_ad69a027_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_labels
    ADD CONSTRAINT main_unifiedjobtemplate__unifiedjobtemplate_id_la_ad69a027_uniq UNIQUE (unifiedjobtemplate_id, label_id);


--
-- Name: main_unifiedjobtemplate_notification_templates_success main_unifiedjobtemplate__unifiedjobtemplate_id_no_113bd2d4_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_notification_templates_success
    ADD CONSTRAINT main_unifiedjobtemplate__unifiedjobtemplate_id_no_113bd2d4_uniq UNIQUE (unifiedjobtemplate_id, notificationtemplate_id);


--
-- Name: main_unifiedjobtemplate_notification_templates_error main_unifiedjobtemplate__unifiedjobtemplate_id_no_172864be_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_notification_templates_error
    ADD CONSTRAINT main_unifiedjobtemplate__unifiedjobtemplate_id_no_172864be_uniq UNIQUE (unifiedjobtemplate_id, notificationtemplate_id);


--
-- Name: main_unifiedjobtemplate_notification_templates_started main_unifiedjobtemplate__unifiedjobtemplate_id_no_5b15714c_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_notification_templates_started
    ADD CONSTRAINT main_unifiedjobtemplate__unifiedjobtemplate_id_no_5b15714c_uniq UNIQUE (unifiedjobtemplate_id, notificationtemplate_id);


--
-- Name: main_unifiedjobtemplate_credentials main_unifiedjobtemplate_credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_credentials
    ADD CONSTRAINT main_unifiedjobtemplate_credentials_pkey PRIMARY KEY (id);


--
-- Name: main_unifiedjobtemplate_labels main_unifiedjobtemplate_labels_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_labels
    ADD CONSTRAINT main_unifiedjobtemplate_labels_pkey PRIMARY KEY (id);


--
-- Name: main_unifiedjobtemplate_notification_templates_error main_unifiedjobtemplate_notification_templates_error_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_notification_templates_error
    ADD CONSTRAINT main_unifiedjobtemplate_notification_templates_error_pkey PRIMARY KEY (id);


--
-- Name: main_unifiedjobtemplate_notification_templates_started main_unifiedjobtemplate_notification_templates_started_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_notification_templates_started
    ADD CONSTRAINT main_unifiedjobtemplate_notification_templates_started_pkey PRIMARY KEY (id);


--
-- Name: main_unifiedjobtemplate_notification_templates_success main_unifiedjobtemplate_notification_templates_success_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_notification_templates_success
    ADD CONSTRAINT main_unifiedjobtemplate_notification_templates_success_pkey PRIMARY KEY (id);


--
-- Name: main_unifiedjobtemplate main_unifiedjobtemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplate
    ADD CONSTRAINT main_unifiedjobtemplate_pkey PRIMARY KEY (id);


--
-- Name: main_unifiedjobtemplateinstancegroupmembership main_unifiedjobtemplateinstancegroupmembership_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplateinstancegroupmembership
    ADD CONSTRAINT main_unifiedjobtemplateinstancegroupmembership_pkey PRIMARY KEY (id);


--
-- Name: main_usersessionmembership main_usersessionmembership_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_usersessionmembership
    ADD CONSTRAINT main_usersessionmembership_pkey PRIMARY KEY (id);


--
-- Name: main_usersessionmembership main_usersessionmembership_session_id_key; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_usersessionmembership
    ADD CONSTRAINT main_usersessionmembership_session_id_key UNIQUE (session_id);


--
-- Name: main_workflowapproval main_workflowapproval_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowapproval
    ADD CONSTRAINT main_workflowapproval_pkey PRIMARY KEY (unifiedjob_ptr_id);


--
-- Name: main_workflowapprovaltemplate main_workflowapprovaltemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowapprovaltemplate
    ADD CONSTRAINT main_workflowapprovaltemplate_pkey PRIMARY KEY (unifiedjobtemplate_ptr_id);


--
-- Name: main_workflowjob main_workflowjob_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjob
    ADD CONSTRAINT main_workflowjob_pkey PRIMARY KEY (unifiedjob_ptr_id);


--
-- Name: main_workflowjobnode_always_nodes main_workflowjobnode_alw_from_workflowjobnode_id__550e0051_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobnode_always_nodes
    ADD CONSTRAINT main_workflowjobnode_alw_from_workflowjobnode_id__550e0051_uniq UNIQUE (from_workflowjobnode_id, to_workflowjobnode_id);


--
-- Name: main_workflowjobnode_always_nodes main_workflowjobnode_always_nodes_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobnode_always_nodes
    ADD CONSTRAINT main_workflowjobnode_always_nodes_pkey PRIMARY KEY (id);


--
-- Name: main_workflowjobnode_credentials main_workflowjobnode_cre_workflowjobnode_id_crede_75628d2d_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobnode_credentials
    ADD CONSTRAINT main_workflowjobnode_cre_workflowjobnode_id_crede_75628d2d_uniq UNIQUE (workflowjobnode_id, credential_id);


--
-- Name: main_workflowjobnode_credentials main_workflowjobnode_credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobnode_credentials
    ADD CONSTRAINT main_workflowjobnode_credentials_pkey PRIMARY KEY (id);


--
-- Name: main_workflowjobnode_failure_nodes main_workflowjobnode_fai_from_workflowjobnode_id__355631cb_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobnode_failure_nodes
    ADD CONSTRAINT main_workflowjobnode_fai_from_workflowjobnode_id__355631cb_uniq UNIQUE (from_workflowjobnode_id, to_workflowjobnode_id);


--
-- Name: main_workflowjobnode_failure_nodes main_workflowjobnode_failure_nodes_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobnode_failure_nodes
    ADD CONSTRAINT main_workflowjobnode_failure_nodes_pkey PRIMARY KEY (id);


--
-- Name: main_workflowjobnode main_workflowjobnode_job_id_key; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobnode
    ADD CONSTRAINT main_workflowjobnode_job_id_key UNIQUE (job_id);


--
-- Name: main_workflowjobnode main_workflowjobnode_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobnode
    ADD CONSTRAINT main_workflowjobnode_pkey PRIMARY KEY (id);


--
-- Name: main_workflowjobnode_success_nodes main_workflowjobnode_suc_from_workflowjobnode_id__59094efc_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobnode_success_nodes
    ADD CONSTRAINT main_workflowjobnode_suc_from_workflowjobnode_id__59094efc_uniq UNIQUE (from_workflowjobnode_id, to_workflowjobnode_id);


--
-- Name: main_workflowjobnode_success_nodes main_workflowjobnode_success_nodes_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobnode_success_nodes
    ADD CONSTRAINT main_workflowjobnode_success_nodes_pkey PRIMARY KEY (id);


--
-- Name: main_workflowjobtemplatenode_always_nodes main_workflowjobtemplate_from_workflowjobtemplate_01869c4a_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_always_nodes
    ADD CONSTRAINT main_workflowjobtemplate_from_workflowjobtemplate_01869c4a_uniq UNIQUE (from_workflowjobtemplatenode_id, to_workflowjobtemplatenode_id);


--
-- Name: main_workflowjobtemplatenode_failure_nodes main_workflowjobtemplate_from_workflowjobtemplate_5f970860_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_failure_nodes
    ADD CONSTRAINT main_workflowjobtemplate_from_workflowjobtemplate_5f970860_uniq UNIQUE (from_workflowjobtemplatenode_id, to_workflowjobtemplatenode_id);


--
-- Name: main_workflowjobtemplatenode_success_nodes main_workflowjobtemplate_from_workflowjobtemplate_b5f4a54a_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_success_nodes
    ADD CONSTRAINT main_workflowjobtemplate_from_workflowjobtemplate_b5f4a54a_uniq UNIQUE (from_workflowjobtemplatenode_id, to_workflowjobtemplatenode_id);


--
-- Name: main_workflowjobtemplatenode main_workflowjobtemplate_identifier_workflow_job__03484516_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode
    ADD CONSTRAINT main_workflowjobtemplate_identifier_workflow_job__03484516_uniq UNIQUE (identifier, workflow_job_template_id);


--
-- Name: main_workflowjobtemplate_notification_templates_approvals main_workflowjobtemplate_notification_templates_approvals_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplate_notification_templates_approvals
    ADD CONSTRAINT main_workflowjobtemplate_notification_templates_approvals_pkey PRIMARY KEY (id);


--
-- Name: main_workflowjobtemplate main_workflowjobtemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplate
    ADD CONSTRAINT main_workflowjobtemplate_pkey PRIMARY KEY (unifiedjobtemplate_ptr_id);


--
-- Name: main_workflowjobtemplate_notification_templates_approvals main_workflowjobtemplate_workflowjobtemplate_id_n_4b1a7a0a_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplate_notification_templates_approvals
    ADD CONSTRAINT main_workflowjobtemplate_workflowjobtemplate_id_n_4b1a7a0a_uniq UNIQUE (workflowjobtemplate_id, notificationtemplate_id);


--
-- Name: main_workflowjobtemplatenode_credentials main_workflowjobtemplate_workflowjobtemplatenode__a6ba785b_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_credentials
    ADD CONSTRAINT main_workflowjobtemplate_workflowjobtemplatenode__a6ba785b_uniq UNIQUE (workflowjobtemplatenode_id, credential_id);


--
-- Name: main_workflowjobtemplatenode_always_nodes main_workflowjobtemplatenode_always_nodes_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_always_nodes
    ADD CONSTRAINT main_workflowjobtemplatenode_always_nodes_pkey PRIMARY KEY (id);


--
-- Name: main_workflowjobtemplatenode_credentials main_workflowjobtemplatenode_credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_credentials
    ADD CONSTRAINT main_workflowjobtemplatenode_credentials_pkey PRIMARY KEY (id);


--
-- Name: main_workflowjobtemplatenode_failure_nodes main_workflowjobtemplatenode_failure_nodes_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_failure_nodes
    ADD CONSTRAINT main_workflowjobtemplatenode_failure_nodes_pkey PRIMARY KEY (id);


--
-- Name: main_workflowjobtemplatenode main_workflowjobtemplatenode_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode
    ADD CONSTRAINT main_workflowjobtemplatenode_pkey PRIMARY KEY (id);


--
-- Name: main_workflowjobtemplatenode_success_nodes main_workflowjobtemplatenode_success_nodes_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_success_nodes
    ADD CONSTRAINT main_workflowjobtemplatenode_success_nodes_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_grant oauth2_provider_grant_code_49ab4ddf_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_code_49ab4ddf_uniq UNIQUE (code);


--
-- Name: oauth2_provider_grant oauth2_provider_grant_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_access_token_id_key; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_access_token_id_key UNIQUE (access_token_id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq UNIQUE (token, revoked);


--
-- Name: social_auth_association social_auth_association_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association social_auth_association_server_url_handle_078befa2_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_server_url_handle_078befa2_uniq UNIQUE (server_url, handle);


--
-- Name: social_auth_code social_auth_code_email_code_801b2d02_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_email_code_801b2d02_uniq UNIQUE (email, code);


--
-- Name: social_auth_code social_auth_code_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_server_url_timestamp_salt_f6284463_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_server_url_timestamp_salt_f6284463_uniq UNIQUE (server_url, "timestamp", salt);


--
-- Name: social_auth_partial social_auth_partial_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.social_auth_partial
    ADD CONSTRAINT social_auth_partial_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_provider_uid_e6b5e668_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_provider_uid_e6b5e668_uniq UNIQUE (provider, uid);


--
-- Name: sso_userenterpriseauth sso_userenterpriseauth_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.sso_userenterpriseauth
    ADD CONSTRAINT sso_userenterpriseauth_pkey PRIMARY KEY (id);


--
-- Name: sso_userenterpriseauth sso_userenterpriseauth_user_id_provider_baa07d7f_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.sso_userenterpriseauth
    ADD CONSTRAINT sso_userenterpriseauth_user_id_provider_baa07d7f_uniq UNIQUE (user_id, provider);


--
-- Name: taggit_tag taggit_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_name_key UNIQUE (name);


--
-- Name: taggit_tag taggit_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag taggit_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_slug_key UNIQUE (slug);


--
-- Name: taggit_taggeditem taggit_taggeditem_content_type_id_object_i_4bb97a8e_uniq; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_object_i_4bb97a8e_uniq UNIQUE (content_type_id, object_id, tag_id);


--
-- Name: taggit_taggeditem taggit_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: conf_setting_user_id_ce9d5138; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX conf_setting_user_id_ce9d5138 ON public.conf_setting USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: host_ansible_facts_default_gin; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX host_ansible_facts_default_gin ON public.main_host USING gin (ansible_facts jsonb_path_ops);


--
-- Name: main_activitystream_actor_id_29aafc0f; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_actor_id_29aafc0f ON public.main_activitystream USING btree (actor_id);


--
-- Name: main_activitystream_ad_hoc_command_activitystream_id_870ddb01; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_ad_hoc_command_activitystream_id_870ddb01 ON public.main_activitystream_ad_hoc_command USING btree (activitystream_id);


--
-- Name: main_activitystream_ad_hoc_command_adhoccommand_id_0df7bfcd; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_ad_hoc_command_adhoccommand_id_0df7bfcd ON public.main_activitystream_ad_hoc_command USING btree (adhoccommand_id);


--
-- Name: main_activitystream_credential_activitystream_id_4be1a957; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_credential_activitystream_id_4be1a957 ON public.main_activitystream_credential USING btree (activitystream_id);


--
-- Name: main_activitystream_credential_credential_id_d5911596; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_credential_credential_id_d5911596 ON public.main_activitystream_credential USING btree (credential_id);


--
-- Name: main_activitystream_credential_type_activitystream_id_b7a4b49d; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_credential_type_activitystream_id_b7a4b49d ON public.main_activitystream_credential_type USING btree (activitystream_id);


--
-- Name: main_activitystream_credential_type_credentialtype_id_89572b10; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_credential_type_credentialtype_id_89572b10 ON public.main_activitystream_credential_type USING btree (credentialtype_id);


--
-- Name: main_activitystream_custom_activitystream_id_2d7243ca; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_custom_activitystream_id_2d7243ca ON public.main_activitystream_custom_inventory_script USING btree (activitystream_id);


--
-- Name: main_activitystream_custom_custominventoryscript_id_9208376f; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_custom_custominventoryscript_id_9208376f ON public.main_activitystream_custom_inventory_script USING btree (custominventoryscript_id);


--
-- Name: main_activitystream_group_activitystream_id_94d31559; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_group_activitystream_id_94d31559 ON public.main_activitystream_group USING btree (activitystream_id);


--
-- Name: main_activitystream_group_group_id_fd48b400; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_group_group_id_fd48b400 ON public.main_activitystream_group USING btree (group_id);


--
-- Name: main_activitystream_host_activitystream_id_c4d91cb7; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_host_activitystream_id_c4d91cb7 ON public.main_activitystream_host USING btree (activitystream_id);


--
-- Name: main_activitystream_host_host_id_0e598602; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_host_host_id_0e598602 ON public.main_activitystream_host USING btree (host_id);


--
-- Name: main_activitystream_instance_activitystream_id_04ccbf32; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_instance_activitystream_id_04ccbf32 ON public.main_activitystream_instance USING btree (activitystream_id);


--
-- Name: main_activitystream_instance_group_activitystream_id_e81ef38a; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_instance_group_activitystream_id_e81ef38a ON public.main_activitystream_instance_group USING btree (activitystream_id);


--
-- Name: main_activitystream_instance_group_instancegroup_id_fca49f6c; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_instance_group_instancegroup_id_fca49f6c ON public.main_activitystream_instance_group USING btree (instancegroup_id);


--
-- Name: main_activitystream_instance_instance_id_d10eb669; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_instance_instance_id_d10eb669 ON public.main_activitystream_instance USING btree (instance_id);


--
-- Name: main_activitystream_invent_inventorysource_id_235e699a; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_invent_inventorysource_id_235e699a ON public.main_activitystream_inventory_source USING btree (inventorysource_id);


--
-- Name: main_activitystream_invent_inventoryupdate_id_817749c5; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_invent_inventoryupdate_id_817749c5 ON public.main_activitystream_inventory_update USING btree (inventoryupdate_id);


--
-- Name: main_activitystream_inventory_activitystream_id_4a1242eb; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_inventory_activitystream_id_4a1242eb ON public.main_activitystream_inventory USING btree (activitystream_id);


--
-- Name: main_activitystream_inventory_inventory_id_8daf9251; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_inventory_inventory_id_8daf9251 ON public.main_activitystream_inventory USING btree (inventory_id);


--
-- Name: main_activitystream_inventory_source_activitystream_id_d88c8423; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_inventory_source_activitystream_id_d88c8423 ON public.main_activitystream_inventory_source USING btree (activitystream_id);


--
-- Name: main_activitystream_inventory_update_activitystream_id_732f074a; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_inventory_update_activitystream_id_732f074a ON public.main_activitystream_inventory_update USING btree (activitystream_id);


--
-- Name: main_activitystream_job_activitystream_id_b1f2ab1b; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_job_activitystream_id_b1f2ab1b ON public.main_activitystream_job USING btree (activitystream_id);


--
-- Name: main_activitystream_job_job_id_aa6811b5; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_job_job_id_aa6811b5 ON public.main_activitystream_job USING btree (job_id);


--
-- Name: main_activitystream_job_template_activitystream_id_abd63b6d; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_job_template_activitystream_id_abd63b6d ON public.main_activitystream_job_template USING btree (activitystream_id);


--
-- Name: main_activitystream_job_template_jobtemplate_id_c05e0b6c; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_job_template_jobtemplate_id_c05e0b6c ON public.main_activitystream_job_template USING btree (jobtemplate_id);


--
-- Name: main_activitystream_label_activitystream_id_afd608d7; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_label_activitystream_id_afd608d7 ON public.main_activitystream_label USING btree (activitystream_id);


--
-- Name: main_activitystream_label_label_id_b33683fb; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_label_label_id_b33683fb ON public.main_activitystream_label USING btree (label_id);


--
-- Name: main_activitystream_notifi_activitystream_id_214c1789; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_notifi_activitystream_id_214c1789 ON public.main_activitystream_notification_template USING btree (activitystream_id);


--
-- Name: main_activitystream_notifi_notificationtemplate_id_96d11a5d; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_notifi_notificationtemplate_id_96d11a5d ON public.main_activitystream_notification_template USING btree (notificationtemplate_id);


--
-- Name: main_activitystream_notification_activitystream_id_7d39234a; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_notification_activitystream_id_7d39234a ON public.main_activitystream_notification USING btree (activitystream_id);


--
-- Name: main_activitystream_notification_notification_id_bbfaa8ac; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_notification_notification_id_bbfaa8ac ON public.main_activitystream_notification USING btree (notification_id);


--
-- Name: main_activitystream_o_auth_activitystream_id_9cd33ed4; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_o_auth_activitystream_id_9cd33ed4 ON public.main_activitystream_o_auth2_access_token USING btree (activitystream_id);


--
-- Name: main_activitystream_o_auth_activitystream_id_ea629ffe; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_o_auth_activitystream_id_ea629ffe ON public.main_activitystream_o_auth2_application USING btree (activitystream_id);


--
-- Name: main_activitystream_o_auth_oauth2accesstoken_id_76c333c8; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_o_auth_oauth2accesstoken_id_76c333c8 ON public.main_activitystream_o_auth2_access_token USING btree (oauth2accesstoken_id);


--
-- Name: main_activitystream_o_auth_oauth2application_id_23726fd8; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_o_auth_oauth2application_id_23726fd8 ON public.main_activitystream_o_auth2_application USING btree (oauth2application_id);


--
-- Name: main_activitystream_organization_activitystream_id_0283e075; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_organization_activitystream_id_0283e075 ON public.main_activitystream_organization USING btree (activitystream_id);


--
-- Name: main_activitystream_organization_organization_id_8ccdfd12; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_organization_organization_id_8ccdfd12 ON public.main_activitystream_organization USING btree (organization_id);


--
-- Name: main_activitystream_project_activitystream_id_f6aa28cc; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_project_activitystream_id_f6aa28cc ON public.main_activitystream_project USING btree (activitystream_id);


--
-- Name: main_activitystream_project_project_id_836f7b93; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_project_project_id_836f7b93 ON public.main_activitystream_project USING btree (project_id);


--
-- Name: main_activitystream_project_update_activitystream_id_2965eda0; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_project_update_activitystream_id_2965eda0 ON public.main_activitystream_project_update USING btree (activitystream_id);


--
-- Name: main_activitystream_project_update_projectupdate_id_8ac4ba92; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_project_update_projectupdate_id_8ac4ba92 ON public.main_activitystream_project_update USING btree (projectupdate_id);


--
-- Name: main_activitystream_role_activitystream_id_d591eb98; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_role_activitystream_id_d591eb98 ON public.main_activitystream_role USING btree (activitystream_id);


--
-- Name: main_activitystream_role_role_id_e19fce37; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_role_role_id_e19fce37 ON public.main_activitystream_role USING btree (role_id);


--
-- Name: main_activitystream_schedule_activitystream_id_a5fd87ef; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_schedule_activitystream_id_a5fd87ef ON public.main_activitystream_schedule USING btree (activitystream_id);


--
-- Name: main_activitystream_schedule_schedule_id_9bde99e8; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_schedule_schedule_id_9bde99e8 ON public.main_activitystream_schedule USING btree (schedule_id);


--
-- Name: main_activitystream_team_activitystream_id_c4874e73; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_team_activitystream_id_c4874e73 ON public.main_activitystream_team USING btree (activitystream_id);


--
-- Name: main_activitystream_team_team_id_725f033a; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_team_team_id_725f033a ON public.main_activitystream_team USING btree (team_id);


--
-- Name: main_activitystream_unifie_activitystream_id_e4ce5d15; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_unifie_activitystream_id_e4ce5d15 ON public.main_activitystream_unified_job_template USING btree (activitystream_id);


--
-- Name: main_activitystream_unifie_unifiedjobtemplate_id_71f8a21f; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_unifie_unifiedjobtemplate_id_71f8a21f ON public.main_activitystream_unified_job_template USING btree (unifiedjobtemplate_id);


--
-- Name: main_activitystream_unified_job_activitystream_id_e29d497f; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_unified_job_activitystream_id_e29d497f ON public.main_activitystream_unified_job USING btree (activitystream_id);


--
-- Name: main_activitystream_unified_job_unifiedjob_id_bd9f07c6; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_unified_job_unifiedjob_id_bd9f07c6 ON public.main_activitystream_unified_job USING btree (unifiedjob_id);


--
-- Name: main_activitystream_user_activitystream_id_f120c9d1; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_user_activitystream_id_f120c9d1 ON public.main_activitystream_user USING btree (activitystream_id);


--
-- Name: main_activitystream_user_user_id_435f8320; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_user_user_id_435f8320 ON public.main_activitystream_user USING btree (user_id);


--
-- Name: main_activitystream_workfl_activitystream_id_14401444; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_workfl_activitystream_id_14401444 ON public.main_activitystream_workflow_approval USING btree (activitystream_id);


--
-- Name: main_activitystream_workfl_activitystream_id_259ad363; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_workfl_activitystream_id_259ad363 ON public.main_activitystream_workflow_job_template USING btree (activitystream_id);


--
-- Name: main_activitystream_workfl_activitystream_id_7e8e02aa; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_workfl_activitystream_id_7e8e02aa ON public.main_activitystream_workflow_approval_template USING btree (activitystream_id);


--
-- Name: main_activitystream_workfl_activitystream_id_b3d1beb6; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_workfl_activitystream_id_b3d1beb6 ON public.main_activitystream_workflow_job_template_node USING btree (activitystream_id);


--
-- Name: main_activitystream_workfl_activitystream_id_c8397668; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_workfl_activitystream_id_c8397668 ON public.main_activitystream_workflow_job_node USING btree (activitystream_id);


--
-- Name: main_activitystream_workfl_workflowapproval_id_8d4193a7; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_workfl_workflowapproval_id_8d4193a7 ON public.main_activitystream_workflow_approval USING btree (workflowapproval_id);


--
-- Name: main_activitystream_workfl_workflowapprovaltemplate_i_93e9e097; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_workfl_workflowapprovaltemplate_i_93e9e097 ON public.main_activitystream_workflow_approval_template USING btree (workflowapprovaltemplate_id);


--
-- Name: main_activitystream_workfl_workflowjobnode_id_85bb51d6; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_workfl_workflowjobnode_id_85bb51d6 ON public.main_activitystream_workflow_job_node USING btree (workflowjobnode_id);


--
-- Name: main_activitystream_workfl_workflowjobtemplate_id_efd4c1aa; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_workfl_workflowjobtemplate_id_efd4c1aa ON public.main_activitystream_workflow_job_template USING btree (workflowjobtemplate_id);


--
-- Name: main_activitystream_workfl_workflowjobtemplatenode_id_a2630ab6; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_workfl_workflowjobtemplatenode_id_a2630ab6 ON public.main_activitystream_workflow_job_template_node USING btree (workflowjobtemplatenode_id);


--
-- Name: main_activitystream_workflow_job_activitystream_id_93d66e38; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_workflow_job_activitystream_id_93d66e38 ON public.main_activitystream_workflow_job USING btree (activitystream_id);


--
-- Name: main_activitystream_workflow_job_workflowjob_id_c29366d7; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_activitystream_workflow_job_workflowjob_id_c29366d7 ON public.main_activitystream_workflow_job USING btree (workflowjob_id);


--
-- Name: main_adhoccommand_credential_id_da6b1c87; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_adhoccommand_credential_id_da6b1c87 ON public.main_adhoccommand USING btree (credential_id);


--
-- Name: main_adhoccommand_inventory_id_b29bba0e; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_adhoccommand_inventory_id_b29bba0e ON public.main_adhoccommand USING btree (inventory_id);


--
-- Name: main_adhoccommandevent_ad_hoc_command_id_end_line_idx; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_adhoccommandevent_ad_hoc_command_id_end_line_idx ON public.main_adhoccommandevent USING btree (ad_hoc_command_id, end_line);


--
-- Name: main_adhoccommandevent_ad_hoc_command_id_event_idx; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_adhoccommandevent_ad_hoc_command_id_event_idx ON public.main_adhoccommandevent USING btree (ad_hoc_command_id, event);


--
-- Name: main_adhoccommandevent_ad_hoc_command_id_idx; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_adhoccommandevent_ad_hoc_command_id_idx ON public.main_adhoccommandevent USING btree (ad_hoc_command_id);


--
-- Name: main_adhoccommandevent_ad_hoc_command_id_start_line_idx; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_adhoccommandevent_ad_hoc_command_id_start_line_idx ON public.main_adhoccommandevent USING btree (ad_hoc_command_id, start_line);


--
-- Name: main_adhoccommandevent_ad_hoc_command_id_uuid_idx; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_adhoccommandevent_ad_hoc_command_id_uuid_idx ON public.main_adhoccommandevent USING btree (ad_hoc_command_id, uuid);


--
-- Name: main_adhoccommandevent_host_id_idx; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_adhoccommandevent_host_id_idx ON public.main_adhoccommandevent USING btree (host_id);


--
-- Name: main_credential_admin_role_id_6cd7ab86; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_credential_admin_role_id_6cd7ab86 ON public.main_credential USING btree (admin_role_id);


--
-- Name: main_credential_created_by_id_237add04; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_credential_created_by_id_237add04 ON public.main_credential USING btree (created_by_id);


--
-- Name: main_credential_credential_type_id_0120654c; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_credential_credential_type_id_0120654c ON public.main_credential USING btree (credential_type_id);


--
-- Name: main_credential_modified_by_id_c290955a; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_credential_modified_by_id_c290955a ON public.main_credential USING btree (modified_by_id);


--
-- Name: main_credential_organization_id_18d4ae89; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_credential_organization_id_18d4ae89 ON public.main_credential USING btree (organization_id);


--
-- Name: main_credential_read_role_id_12be41a2; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_credential_read_role_id_12be41a2 ON public.main_credential USING btree (read_role_id);


--
-- Name: main_credential_use_role_id_122159d4; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_credential_use_role_id_122159d4 ON public.main_credential USING btree (use_role_id);


--
-- Name: main_credentialinputsource_created_by_id_d2dc637c; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_credentialinputsource_created_by_id_d2dc637c ON public.main_credentialinputsource USING btree (created_by_id);


--
-- Name: main_credentialinputsource_modified_by_id_e3fd88dd; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_credentialinputsource_modified_by_id_e3fd88dd ON public.main_credentialinputsource USING btree (modified_by_id);


--
-- Name: main_credentialinputsource_source_credential_id_868d93af; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_credentialinputsource_source_credential_id_868d93af ON public.main_credentialinputsource USING btree (source_credential_id);


--
-- Name: main_credentialinputsource_target_credential_id_4bf0e248; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_credentialinputsource_target_credential_id_4bf0e248 ON public.main_credentialinputsource USING btree (target_credential_id);


--
-- Name: main_credentialtype_created_by_id_0f8451ed; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_credentialtype_created_by_id_0f8451ed ON public.main_credentialtype USING btree (created_by_id);


--
-- Name: main_credentialtype_modified_by_id_b425580d; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_credentialtype_modified_by_id_b425580d ON public.main_credentialtype USING btree (modified_by_id);


--
-- Name: main_custominventoryscript_admin_role_id_c18fcf29; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_custominventoryscript_admin_role_id_c18fcf29 ON public.main_custominventoryscript USING btree (admin_role_id);


--
-- Name: main_custominventoryscript_created_by_id_45a39526; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_custominventoryscript_created_by_id_45a39526 ON public.main_custominventoryscript USING btree (created_by_id);


--
-- Name: main_custominventoryscript_modified_by_id_6c74f1d0; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_custominventoryscript_modified_by_id_6c74f1d0 ON public.main_custominventoryscript USING btree (modified_by_id);


--
-- Name: main_custominventoryscript_organization_id_b2fa3e3b; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_custominventoryscript_organization_id_b2fa3e3b ON public.main_custominventoryscript USING btree (organization_id);


--
-- Name: main_custominventoryscript_read_role_id_fb907425; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_custominventoryscript_read_role_id_fb907425 ON public.main_custominventoryscript USING btree (read_role_id);


--
-- Name: main_group_created_by_id_326129d5; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_group_created_by_id_326129d5 ON public.main_group USING btree (created_by_id);


--
-- Name: main_group_hosts_group_id_524c3b29; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_group_hosts_group_id_524c3b29 ON public.main_group_hosts USING btree (group_id);


--
-- Name: main_group_hosts_host_id_672eaed0; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_group_hosts_host_id_672eaed0 ON public.main_group_hosts USING btree (host_id);


--
-- Name: main_group_inventory_id_f9e83725; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_group_inventory_id_f9e83725 ON public.main_group USING btree (inventory_id);


--
-- Name: main_group_inventory_sources_group_id_1be295c4; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_group_inventory_sources_group_id_1be295c4 ON public.main_group_inventory_sources USING btree (group_id);


--
-- Name: main_group_inventory_sources_inventorysource_id_5da14efc; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_group_inventory_sources_inventorysource_id_5da14efc ON public.main_group_inventory_sources USING btree (inventorysource_id);


--
-- Name: main_group_modified_by_id_20a1b654; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_group_modified_by_id_20a1b654 ON public.main_group USING btree (modified_by_id);


--
-- Name: main_group_parents_from_group_id_9d63324d; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_group_parents_from_group_id_9d63324d ON public.main_group_parents USING btree (from_group_id);


--
-- Name: main_group_parents_to_group_id_851cc1ce; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_group_parents_to_group_id_851cc1ce ON public.main_group_parents USING btree (to_group_id);


--
-- Name: main_host_created_by_id_2b5e0abe; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_host_created_by_id_2b5e0abe ON public.main_host USING btree (created_by_id);


--
-- Name: main_host_insights_system_id_0580b97b; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_host_insights_system_id_0580b97b ON public.main_host USING btree (insights_system_id);


--
-- Name: main_host_insights_system_id_0580b97b_like; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_host_insights_system_id_0580b97b_like ON public.main_host USING btree (insights_system_id text_pattern_ops);


--
-- Name: main_host_inventory_id_e5bcdb08; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_host_inventory_id_e5bcdb08 ON public.main_host USING btree (inventory_id);


--
-- Name: main_host_inventory_sources_host_id_03f0dcdc; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_host_inventory_sources_host_id_03f0dcdc ON public.main_host_inventory_sources USING btree (host_id);


--
-- Name: main_host_inventory_sources_inventorysource_id_b25d3959; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_host_inventory_sources_inventorysource_id_b25d3959 ON public.main_host_inventory_sources USING btree (inventorysource_id);


--
-- Name: main_host_last_job_host_summary_id_b8bd727d; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_host_last_job_host_summary_id_b8bd727d ON public.main_host USING btree (last_job_host_summary_id);


--
-- Name: main_host_last_job_id_d247075b; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_host_last_job_id_d247075b ON public.main_host USING btree (last_job_id);


--
-- Name: main_host_modified_by_id_28b76283; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_host_modified_by_id_28b76283 ON public.main_host USING btree (modified_by_id);


--
-- Name: main_instance_hostname_f2698dae_like; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_instance_hostname_f2698dae_like ON public.main_instance USING btree (hostname varchar_pattern_ops);


--
-- Name: main_instance_ip_address_28190262_like; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_instance_ip_address_28190262_like ON public.main_instance USING btree (ip_address varchar_pattern_ops);


--
-- Name: main_instancegroup_controller_id_043cd3a9; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_instancegroup_controller_id_043cd3a9 ON public.main_instancegroup USING btree (controller_id);


--
-- Name: main_instancegroup_credential_id_98351d10; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_instancegroup_credential_id_98351d10 ON public.main_instancegroup USING btree (credential_id);


--
-- Name: main_instancegroup_instances_instance_id_d41cb05c; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_instancegroup_instances_instance_id_d41cb05c ON public.main_instancegroup_instances USING btree (instance_id);


--
-- Name: main_instancegroup_instances_instancegroup_id_b4b19635; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_instancegroup_instances_instancegroup_id_b4b19635 ON public.main_instancegroup_instances USING btree (instancegroup_id);


--
-- Name: main_instancegroup_name_bde73070_like; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_instancegroup_name_bde73070_like ON public.main_instancegroup USING btree (name varchar_pattern_ops);


--
-- Name: main_inventory_adhoc_role_id_b57042aa; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_inventory_adhoc_role_id_b57042aa ON public.main_inventory USING btree (adhoc_role_id);


--
-- Name: main_inventory_admin_role_id_3bb301cb; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_inventory_admin_role_id_3bb301cb ON public.main_inventory USING btree (admin_role_id);


--
-- Name: main_inventory_created_by_id_5d690781; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_inventory_created_by_id_5d690781 ON public.main_inventory USING btree (created_by_id);


--
-- Name: main_inventory_insights_credential_id_ce91863f; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_inventory_insights_credential_id_ce91863f ON public.main_inventory USING btree (insights_credential_id);


--
-- Name: main_inventory_modified_by_id_a4a91734; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_inventory_modified_by_id_a4a91734 ON public.main_inventory USING btree (modified_by_id);


--
-- Name: main_inventory_organization_id_3ee77ea9; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_inventory_organization_id_3ee77ea9 ON public.main_inventory USING btree (organization_id);


--
-- Name: main_inventory_read_role_id_270dd070; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_inventory_read_role_id_270dd070 ON public.main_inventory USING btree (read_role_id);


--
-- Name: main_inventory_update_role_id_be0903a1; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_inventory_update_role_id_be0903a1 ON public.main_inventory USING btree (update_role_id);


--
-- Name: main_inventory_use_role_id_77407b26; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_inventory_use_role_id_77407b26 ON public.main_inventory USING btree (use_role_id);


--
-- Name: main_inventoryinstancegroupmembership_instancegroup_id_8c752e87; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_inventoryinstancegroupmembership_instancegroup_id_8c752e87 ON public.main_inventoryinstancegroupmembership USING btree (instancegroup_id);


--
-- Name: main_inventoryinstancegroupmembership_inventory_id_76a877b6; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_inventoryinstancegroupmembership_inventory_id_76a877b6 ON public.main_inventoryinstancegroupmembership USING btree (inventory_id);


--
-- Name: main_inventoryinstancegroupmembership_position_f7487717; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_inventoryinstancegroupmembership_position_f7487717 ON public.main_inventoryinstancegroupmembership USING btree ("position");


--
-- Name: main_inventorysource_inventory_id_3c1cac19; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_inventorysource_inventory_id_3c1cac19 ON public.main_inventorysource USING btree (inventory_id);


--
-- Name: main_inventorysource_source_project_id_5b9c4374; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_inventorysource_source_project_id_5b9c4374 ON public.main_inventorysource USING btree (source_project_id);


--
-- Name: main_inventorysource_source_script_id_03a7c8d7; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_inventorysource_source_script_id_03a7c8d7 ON public.main_inventorysource USING btree (source_script_id);


--
-- Name: main_inventoryupdate_inventory_id_e60f1f2e; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_inventoryupdate_inventory_id_e60f1f2e ON public.main_inventoryupdate USING btree (inventory_id);


--
-- Name: main_inventoryupdate_inventory_source_id_bc4b2567; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_inventoryupdate_inventory_source_id_bc4b2567 ON public.main_inventoryupdate USING btree (inventory_source_id);


--
-- Name: main_inventoryupdate_source_project_update_id_b896d555; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_inventoryupdate_source_project_update_id_b896d555 ON public.main_inventoryupdate USING btree (source_project_update_id);


--
-- Name: main_inventoryupdate_source_script_id_f2d2c3a8; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_inventoryupdate_source_script_id_f2d2c3a8 ON public.main_inventoryupdate USING btree (source_script_id);


--
-- Name: main_inventoryupdateevent_inventory_update_id_end_line_idx; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_inventoryupdateevent_inventory_update_id_end_line_idx ON public.main_inventoryupdateevent USING btree (inventory_update_id, end_line);


--
-- Name: main_inventoryupdateevent_inventory_update_id_idx; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_inventoryupdateevent_inventory_update_id_idx ON public.main_inventoryupdateevent USING btree (inventory_update_id);


--
-- Name: main_inventoryupdateevent_inventory_update_id_start_line_idx; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_inventoryupdateevent_inventory_update_id_start_line_idx ON public.main_inventoryupdateevent USING btree (inventory_update_id, start_line);


--
-- Name: main_inventoryupdateevent_inventory_update_id_uuid_idx; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_inventoryupdateevent_inventory_update_id_uuid_idx ON public.main_inventoryupdateevent USING btree (inventory_update_id, uuid);


--
-- Name: main_job_inventory_id_1b436658; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_job_inventory_id_1b436658 ON public.main_job USING btree (inventory_id);


--
-- Name: main_job_job_template_id_070b0d56; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_job_job_template_id_070b0d56 ON public.main_job USING btree (job_template_id);


--
-- Name: main_job_project_id_a8f63894; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_job_project_id_a8f63894 ON public.main_job USING btree (project_id);


--
-- Name: main_job_project_update_id_5adf90ad; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_job_project_update_id_5adf90ad ON public.main_job USING btree (project_update_id);


--
-- Name: main_job_webhook_credential_id_40ca94fa; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_job_webhook_credential_id_40ca94fa ON public.main_job USING btree (webhook_credential_id);


--
-- Name: main_jobevent_created_idx; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_jobevent_created_idx ON public.main_jobevent USING btree (created);


--
-- Name: main_jobevent_host_id_idx; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_jobevent_host_id_idx ON public.main_jobevent USING btree (host_id);


--
-- Name: main_jobevent_job_id_brin_idx; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_jobevent_job_id_brin_idx ON public.main_jobevent USING brin (job_id);


--
-- Name: main_jobevent_job_id_end_line_idx; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_jobevent_job_id_end_line_idx ON public.main_jobevent USING btree (job_id, end_line);


--
-- Name: main_jobevent_job_id_event_idx; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_jobevent_job_id_event_idx ON public.main_jobevent USING btree (job_id, event);


--
-- Name: main_jobevent_job_id_parent_uuid_idx; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_jobevent_job_id_parent_uuid_idx ON public.main_jobevent USING btree (job_id, parent_uuid);


--
-- Name: main_jobevent_job_id_start_line_idx; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_jobevent_job_id_start_line_idx ON public.main_jobevent USING btree (job_id, start_line);


--
-- Name: main_jobevent_job_id_uuid_idx; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_jobevent_job_id_uuid_idx ON public.main_jobevent USING btree (job_id, uuid);


--
-- Name: main_jobhostsummary_failed_42948cd9; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_jobhostsummary_failed_42948cd9 ON public.main_jobhostsummary USING btree (failed);


--
-- Name: main_jobhostsummary_host_id_7d9f6bf9; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_jobhostsummary_host_id_7d9f6bf9 ON public.main_jobhostsummary USING btree (host_id);


--
-- Name: main_jobhostsummary_job_id_8d60afa0; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_jobhostsummary_job_id_8d60afa0 ON public.main_jobhostsummary USING btree (job_id);


--
-- Name: main_joblaunchconfig_credentials_credential_id_2f5c0487; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_joblaunchconfig_credentials_credential_id_2f5c0487 ON public.main_joblaunchconfig_credentials USING btree (credential_id);


--
-- Name: main_joblaunchconfig_credentials_joblaunchconfig_id_37dc31b9; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_joblaunchconfig_credentials_joblaunchconfig_id_37dc31b9 ON public.main_joblaunchconfig_credentials USING btree (joblaunchconfig_id);


--
-- Name: main_joblaunchconfig_inventory_id_f905306d; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_joblaunchconfig_inventory_id_f905306d ON public.main_joblaunchconfig USING btree (inventory_id);


--
-- Name: main_jobtemplate_admin_role_id_f9dc66ce; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_jobtemplate_admin_role_id_f9dc66ce ON public.main_jobtemplate USING btree (admin_role_id);


--
-- Name: main_jobtemplate_execute_role_id_c2f0db2c; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_jobtemplate_execute_role_id_c2f0db2c ON public.main_jobtemplate USING btree (execute_role_id);


--
-- Name: main_jobtemplate_inventory_id_9b8df646; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_jobtemplate_inventory_id_9b8df646 ON public.main_jobtemplate USING btree (inventory_id);


--
-- Name: main_jobtemplate_project_id_36e80985; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_jobtemplate_project_id_36e80985 ON public.main_jobtemplate USING btree (project_id);


--
-- Name: main_jobtemplate_read_role_id_0e489c81; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_jobtemplate_read_role_id_0e489c81 ON public.main_jobtemplate USING btree (read_role_id);


--
-- Name: main_jobtemplate_webhook_credential_id_eff7fb4b; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_jobtemplate_webhook_credential_id_eff7fb4b ON public.main_jobtemplate USING btree (webhook_credential_id);


--
-- Name: main_label_created_by_id_201182c0; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_label_created_by_id_201182c0 ON public.main_label USING btree (created_by_id);


--
-- Name: main_label_modified_by_id_7f9aac68; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_label_modified_by_id_7f9aac68 ON public.main_label USING btree (modified_by_id);


--
-- Name: main_label_organization_id_78a1bd27; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_label_organization_id_78a1bd27 ON public.main_label USING btree (organization_id);


--
-- Name: main_notification_notification_template_id_9eed1d65; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_notification_notification_template_id_9eed1d65 ON public.main_notification USING btree (notification_template_id);


--
-- Name: main_notificationtemplate_created_by_id_1f77983a; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_notificationtemplate_created_by_id_1f77983a ON public.main_notificationtemplate USING btree (created_by_id);


--
-- Name: main_notificationtemplate_modified_by_id_83c40510; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_notificationtemplate_modified_by_id_83c40510 ON public.main_notificationtemplate USING btree (modified_by_id);


--
-- Name: main_notificationtemplate_organization_id_15933abb; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_notificationtemplate_organization_id_15933abb ON public.main_notificationtemplate USING btree (organization_id);


--
-- Name: main_oauth2accesstoken_application_id_c21bc74c; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_oauth2accesstoken_application_id_c21bc74c ON public.main_oauth2accesstoken USING btree (application_id);


--
-- Name: main_oauth2accesstoken_token_e3bb4f7a_like; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_oauth2accesstoken_token_e3bb4f7a_like ON public.main_oauth2accesstoken USING btree (token varchar_pattern_ops);


--
-- Name: main_oauth2accesstoken_user_id_71ee5fe6; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_oauth2accesstoken_user_id_71ee5fe6 ON public.main_oauth2accesstoken USING btree (user_id);


--
-- Name: main_oauth2application_client_id_45882763_like; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_oauth2application_client_id_45882763_like ON public.main_oauth2application USING btree (client_id varchar_pattern_ops);


--
-- Name: main_oauth2application_client_secret_0b8ee789; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_oauth2application_client_secret_0b8ee789 ON public.main_oauth2application USING btree (client_secret);


--
-- Name: main_oauth2application_client_secret_0b8ee789_like; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_oauth2application_client_secret_0b8ee789_like ON public.main_oauth2application USING btree (client_secret varchar_pattern_ops);


--
-- Name: main_oauth2application_organization_id_5e579421; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_oauth2application_organization_id_5e579421 ON public.main_oauth2application USING btree (organization_id);


--
-- Name: main_oauth2application_user_id_c4dffdbb; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_oauth2application_user_id_c4dffdbb ON public.main_oauth2application USING btree (user_id);


--
-- Name: main_organization_admin_role_id_e3ffdd41; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_organization_admin_role_id_e3ffdd41 ON public.main_organization USING btree (admin_role_id);


--
-- Name: main_organization_approval_role_id_14c1d96f; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_organization_approval_role_id_14c1d96f ON public.main_organization USING btree (approval_role_id);


--
-- Name: main_organization_auditor_role_id_f912df0a; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_organization_auditor_role_id_f912df0a ON public.main_organization USING btree (auditor_role_id);


--
-- Name: main_organization_created_by_id_141da798; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_organization_created_by_id_141da798 ON public.main_organization USING btree (created_by_id);


--
-- Name: main_organization_credential_admin_role_id_55733eb5; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_organization_credential_admin_role_id_55733eb5 ON public.main_organization USING btree (credential_admin_role_id);


--
-- Name: main_organization_execute_role_id_76038d3c; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_organization_execute_role_id_76038d3c ON public.main_organization USING btree (execute_role_id);


--
-- Name: main_organization_inventory_admin_role_id_dae5c7e2; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_organization_inventory_admin_role_id_dae5c7e2 ON public.main_organization USING btree (inventory_admin_role_id);


--
-- Name: main_organization_job_template_admin_role_id_25a265c4; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_organization_job_template_admin_role_id_25a265c4 ON public.main_organization USING btree (job_template_admin_role_id);


--
-- Name: main_organization_member_role_id_201ff67a; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_organization_member_role_id_201ff67a ON public.main_organization USING btree (member_role_id);


--
-- Name: main_organization_modified_by_id_dec7a500; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_organization_modified_by_id_dec7a500 ON public.main_organization USING btree (modified_by_id);


--
-- Name: main_organization_name_3afd4fc6_like; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_organization_name_3afd4fc6_like ON public.main_organization USING btree (name varchar_pattern_ops);


--
-- Name: main_organization_notifica_notificationtemplate_id_1df2f173; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_organization_notifica_notificationtemplate_id_1df2f173 ON public.main_organization_notification_templates_started USING btree (notificationtemplate_id);


--
-- Name: main_organization_notifica_notificationtemplate_id_392029b7; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_organization_notifica_notificationtemplate_id_392029b7 ON public.main_organization_notification_templates_approvals USING btree (notificationtemplate_id);


--
-- Name: main_organization_notifica_notificationtemplate_id_4edd98c4; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_organization_notifica_notificationtemplate_id_4edd98c4 ON public.main_organization_notification_templates_success USING btree (notificationtemplate_id);


--
-- Name: main_organization_notifica_notificationtemplate_id_7b1480c0; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_organization_notifica_notificationtemplate_id_7b1480c0 ON public.main_organization_notification_templates_error USING btree (notificationtemplate_id);


--
-- Name: main_organization_notifica_organization_id_44a19957; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_organization_notifica_organization_id_44a19957 ON public.main_organization_notification_templates_approvals USING btree (organization_id);


--
-- Name: main_organization_notifica_organization_id_48a058ac; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_organization_notifica_organization_id_48a058ac ON public.main_organization_notification_templates_started USING btree (organization_id);


--
-- Name: main_organization_notifica_organization_id_94b63d49; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_organization_notifica_organization_id_94b63d49 ON public.main_organization_notification_templates_error USING btree (organization_id);


--
-- Name: main_organization_notifica_organization_id_96635cd6; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_organization_notifica_organization_id_96635cd6 ON public.main_organization_notification_templates_success USING btree (organization_id);


--
-- Name: main_organization_notification_admin_role_id_c36d2f0e; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_organization_notification_admin_role_id_c36d2f0e ON public.main_organization USING btree (notification_admin_role_id);


--
-- Name: main_organization_project_admin_role_id_442cfebe; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_organization_project_admin_role_id_442cfebe ON public.main_organization USING btree (project_admin_role_id);


--
-- Name: main_organization_read_role_id_e143c386; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_organization_read_role_id_e143c386 ON public.main_organization USING btree (read_role_id);


--
-- Name: main_organization_workflow_admin_role_id_52011cd3; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_organization_workflow_admin_role_id_52011cd3 ON public.main_organization USING btree (workflow_admin_role_id);


--
-- Name: main_organizationgalaxycre_credential_id_7b6334f3; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_organizationgalaxycre_credential_id_7b6334f3 ON public.main_organizationgalaxycredentialmembership USING btree (credential_id);


--
-- Name: main_organizationgalaxycre_organization_id_0fd9495c; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_organizationgalaxycre_organization_id_0fd9495c ON public.main_organizationgalaxycredentialmembership USING btree (organization_id);


--
-- Name: main_organizationgalaxycredentialmembership_position_9319aefd; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_organizationgalaxycredentialmembership_position_9319aefd ON public.main_organizationgalaxycredentialmembership USING btree ("position");


--
-- Name: main_organizationinstanceg_instancegroup_id_526173a9; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_organizationinstanceg_instancegroup_id_526173a9 ON public.main_organizationinstancegroupmembership USING btree (instancegroup_id);


--
-- Name: main_organizationinstanceg_organization_id_35633383; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_organizationinstanceg_organization_id_35633383 ON public.main_organizationinstancegroupmembership USING btree (organization_id);


--
-- Name: main_organizationinstancegroupmembership_position_00023fb0; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_organizationinstancegroupmembership_position_00023fb0 ON public.main_organizationinstancegroupmembership USING btree ("position");


--
-- Name: main_project_admin_role_id_ba0e70c7; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_project_admin_role_id_ba0e70c7 ON public.main_project USING btree (admin_role_id);


--
-- Name: main_project_credential_id_370ba2a3; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_project_credential_id_370ba2a3 ON public.main_project USING btree (credential_id);


--
-- Name: main_project_read_role_id_39a01fd4; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_project_read_role_id_39a01fd4 ON public.main_project USING btree (read_role_id);


--
-- Name: main_project_update_role_id_36e33c42; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_project_update_role_id_36e33c42 ON public.main_project USING btree (update_role_id);


--
-- Name: main_project_use_role_id_7b6d9148; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_project_use_role_id_7b6d9148 ON public.main_project USING btree (use_role_id);


--
-- Name: main_projectupdate_credential_id_2f7d826a; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_projectupdate_credential_id_2f7d826a ON public.main_projectupdate USING btree (credential_id);


--
-- Name: main_projectupdate_project_id_bdd73efe; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_projectupdate_project_id_bdd73efe ON public.main_projectupdate USING btree (project_id);


--
-- Name: main_projectupdateevent_created_idx; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_projectupdateevent_created_idx ON public.main_projectupdateevent USING btree (created);


--
-- Name: main_projectupdateevent_project_update_id_end_line_idx; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_projectupdateevent_project_update_id_end_line_idx ON public.main_projectupdateevent USING btree (project_update_id, end_line);


--
-- Name: main_projectupdateevent_project_update_id_event_idx; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_projectupdateevent_project_update_id_event_idx ON public.main_projectupdateevent USING btree (project_update_id, event);


--
-- Name: main_projectupdateevent_project_update_id_idx; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_projectupdateevent_project_update_id_idx ON public.main_projectupdateevent USING btree (project_update_id);


--
-- Name: main_projectupdateevent_project_update_id_start_line_idx; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_projectupdateevent_project_update_id_start_line_idx ON public.main_projectupdateevent USING btree (project_update_id, start_line);


--
-- Name: main_projectupdateevent_project_update_id_uuid_idx; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_projectupdateevent_project_update_id_uuid_idx ON public.main_projectupdateevent USING btree (project_update_id, uuid);


--
-- Name: main_rbac_role_ancestors_ancestor_id_c6aae106; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_rbac_role_ancestors_ancestor_id_c6aae106 ON public.main_rbac_role_ancestors USING btree (ancestor_id);


--
-- Name: main_rbac_role_ancestors_ancestor_id_content_type_35d994a4_idx; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_rbac_role_ancestors_ancestor_id_content_type_35d994a4_idx ON public.main_rbac_role_ancestors USING btree (ancestor_id, content_type_id, object_id);


--
-- Name: main_rbac_role_ancestors_ancestor_id_content_type_9769b4f1_idx; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_rbac_role_ancestors_ancestor_id_content_type_9769b4f1_idx ON public.main_rbac_role_ancestors USING btree (ancestor_id, content_type_id, role_field);


--
-- Name: main_rbac_role_ancestors_ancestor_id_descendent_id_d0f3872a_idx; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_rbac_role_ancestors_ancestor_id_descendent_id_d0f3872a_idx ON public.main_rbac_role_ancestors USING btree (ancestor_id, descendent_id);


--
-- Name: main_rbac_role_ancestors_descendent_id_23bfc463; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_rbac_role_ancestors_descendent_id_23bfc463 ON public.main_rbac_role_ancestors USING btree (descendent_id);


--
-- Name: main_rbac_roles_content_type_id_756d6b30; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_rbac_roles_content_type_id_756d6b30 ON public.main_rbac_roles USING btree (content_type_id);


--
-- Name: main_rbac_roles_content_type_id_object_id_b47703f5_idx; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_rbac_roles_content_type_id_object_id_b47703f5_idx ON public.main_rbac_roles USING btree (content_type_id, object_id);


--
-- Name: main_rbac_roles_members_role_id_7318b4b7; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_rbac_roles_members_role_id_7318b4b7 ON public.main_rbac_roles_members USING btree (role_id);


--
-- Name: main_rbac_roles_members_user_id_f5e05418; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_rbac_roles_members_user_id_f5e05418 ON public.main_rbac_roles_members USING btree (user_id);


--
-- Name: main_rbac_roles_parents_from_role_id_a02db9eb; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_rbac_roles_parents_from_role_id_a02db9eb ON public.main_rbac_roles_parents USING btree (from_role_id);


--
-- Name: main_rbac_roles_parents_to_role_id_c00b5087; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_rbac_roles_parents_to_role_id_c00b5087 ON public.main_rbac_roles_parents USING btree (to_role_id);


--
-- Name: main_rbac_roles_singleton_name_3f0df1dd_like; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_rbac_roles_singleton_name_3f0df1dd_like ON public.main_rbac_roles USING btree (singleton_name text_pattern_ops);


--
-- Name: main_schedule_created_by_id_4e647be2; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_schedule_created_by_id_4e647be2 ON public.main_schedule USING btree (created_by_id);


--
-- Name: main_schedule_credentials_credential_id_ced5894e; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_schedule_credentials_credential_id_ced5894e ON public.main_schedule_credentials USING btree (credential_id);


--
-- Name: main_schedule_credentials_schedule_id_03ecad04; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_schedule_credentials_schedule_id_03ecad04 ON public.main_schedule_credentials USING btree (schedule_id);


--
-- Name: main_schedule_inventory_id_43b7b69d; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_schedule_inventory_id_43b7b69d ON public.main_schedule USING btree (inventory_id);


--
-- Name: main_schedule_modified_by_id_3817bc47; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_schedule_modified_by_id_3817bc47 ON public.main_schedule USING btree (modified_by_id);


--
-- Name: main_schedule_unified_job_template_id_a9d931e2; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_schedule_unified_job_template_id_a9d931e2 ON public.main_schedule USING btree (unified_job_template_id);


--
-- Name: main_smartinventorymembership_host_id_c721cb8a; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_smartinventorymembership_host_id_c721cb8a ON public.main_smartinventorymembership USING btree (host_id);


--
-- Name: main_smartinventorymembership_inventory_id_5e13df96; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_smartinventorymembership_inventory_id_5e13df96 ON public.main_smartinventorymembership USING btree (inventory_id);


--
-- Name: main_systemjob_system_job_template_id_8bba2060; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_systemjob_system_job_template_id_8bba2060 ON public.main_systemjob USING btree (system_job_template_id);


--
-- Name: main_systemjobevent_system_job_id_end_line_idx; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_systemjobevent_system_job_id_end_line_idx ON public.main_systemjobevent USING btree (system_job_id, end_line);


--
-- Name: main_systemjobevent_system_job_id_idx; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_systemjobevent_system_job_id_idx ON public.main_systemjobevent USING btree (system_job_id);


--
-- Name: main_systemjobevent_system_job_id_start_line_idx; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_systemjobevent_system_job_id_start_line_idx ON public.main_systemjobevent USING btree (system_job_id, start_line);


--
-- Name: main_systemjobevent_system_job_id_uuid_idx; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_systemjobevent_system_job_id_uuid_idx ON public.main_systemjobevent USING btree (system_job_id, uuid);


--
-- Name: main_team_admin_role_id_a9e09a22; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_team_admin_role_id_a9e09a22 ON public.main_team USING btree (admin_role_id);


--
-- Name: main_team_created_by_id_c370350b; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_team_created_by_id_c370350b ON public.main_team USING btree (created_by_id);


--
-- Name: main_team_member_role_id_a2f93dc9; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_team_member_role_id_a2f93dc9 ON public.main_team USING btree (member_role_id);


--
-- Name: main_team_modified_by_id_9af533cd; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_team_modified_by_id_9af533cd ON public.main_team USING btree (modified_by_id);


--
-- Name: main_team_organization_id_8b31bbc1; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_team_organization_id_8b31bbc1 ON public.main_team USING btree (organization_id);


--
-- Name: main_team_read_role_id_ea02761f; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_team_read_role_id_ea02761f ON public.main_team USING btree (read_role_id);


--
-- Name: main_unifiedjob_canceled_on_8695ca21; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjob_canceled_on_8695ca21 ON public.main_unifiedjob USING btree (canceled_on);


--
-- Name: main_unifiedjob_created_94704da7; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjob_created_94704da7 ON public.main_unifiedjob USING btree (created);


--
-- Name: main_unifiedjob_created_by_id_d2a186ab; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjob_created_by_id_d2a186ab ON public.main_unifiedjob USING btree (created_by_id);


--
-- Name: main_unifiedjob_credentials_credential_id_661c8f49; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjob_credentials_credential_id_661c8f49 ON public.main_unifiedjob_credentials USING btree (credential_id);


--
-- Name: main_unifiedjob_credentials_unifiedjob_id_4ed7ff5d; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjob_credentials_unifiedjob_id_4ed7ff5d ON public.main_unifiedjob_credentials USING btree (unifiedjob_id);


--
-- Name: main_unifiedjob_dependent_jobs_from_unifiedjob_id_c8d58e88; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjob_dependent_jobs_from_unifiedjob_id_c8d58e88 ON public.main_unifiedjob_dependent_jobs USING btree (from_unifiedjob_id);


--
-- Name: main_unifiedjob_dependent_jobs_to_unifiedjob_id_3f04cbcc; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjob_dependent_jobs_to_unifiedjob_id_3f04cbcc ON public.main_unifiedjob_dependent_jobs USING btree (to_unifiedjob_id);


--
-- Name: main_unifiedjob_finished_eccf6159; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjob_finished_eccf6159 ON public.main_unifiedjob USING btree (finished);


--
-- Name: main_unifiedjob_instance_group_id_f76a06e2; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjob_instance_group_id_f76a06e2 ON public.main_unifiedjob USING btree (instance_group_id);


--
-- Name: main_unifiedjob_labels_label_id_98814bad; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjob_labels_label_id_98814bad ON public.main_unifiedjob_labels USING btree (label_id);


--
-- Name: main_unifiedjob_labels_unifiedjob_id_bd008d37; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjob_labels_unifiedjob_id_bd008d37 ON public.main_unifiedjob_labels USING btree (unifiedjob_id);


--
-- Name: main_unifiedjob_launch_type_f97c0639; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjob_launch_type_f97c0639 ON public.main_unifiedjob USING btree (launch_type);


--
-- Name: main_unifiedjob_launch_type_f97c0639_like; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjob_launch_type_f97c0639_like ON public.main_unifiedjob USING btree (launch_type varchar_pattern_ops);


--
-- Name: main_unifiedjob_modified_by_id_14cbb9bc; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjob_modified_by_id_14cbb9bc ON public.main_unifiedjob USING btree (modified_by_id);


--
-- Name: main_unifiedjob_notifications_notification_id_cf3498bf; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjob_notifications_notification_id_cf3498bf ON public.main_unifiedjob_notifications USING btree (notification_id);


--
-- Name: main_unifiedjob_notifications_unifiedjob_id_65ab9c3c; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjob_notifications_unifiedjob_id_65ab9c3c ON public.main_unifiedjob_notifications USING btree (unifiedjob_id);


--
-- Name: main_unifiedjob_organization_id_cbfa01d3; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjob_organization_id_cbfa01d3 ON public.main_unifiedjob USING btree (organization_id);


--
-- Name: main_unifiedjob_polymorphic_ctype_id_cb46239b; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjob_polymorphic_ctype_id_cb46239b ON public.main_unifiedjob USING btree (polymorphic_ctype_id);


--
-- Name: main_unifiedjob_schedule_id_766ca767; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjob_schedule_id_766ca767 ON public.main_unifiedjob USING btree (schedule_id);


--
-- Name: main_unifiedjob_status_ea421be2; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjob_status_ea421be2 ON public.main_unifiedjob USING btree (status);


--
-- Name: main_unifiedjob_status_ea421be2_like; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjob_status_ea421be2_like ON public.main_unifiedjob USING btree (status varchar_pattern_ops);


--
-- Name: main_unifiedjob_unified_job_template_id_a398b197; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjob_unified_job_template_id_a398b197 ON public.main_unifiedjob USING btree (unified_job_template_id);


--
-- Name: main_unifiedjobtemplate_cr_unifiedjobtemplate_id_d98d7c79; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjobtemplate_cr_unifiedjobtemplate_id_d98d7c79 ON public.main_unifiedjobtemplate_credentials USING btree (unifiedjobtemplate_id);


--
-- Name: main_unifiedjobtemplate_created_by_id_1f5fadfa; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjobtemplate_created_by_id_1f5fadfa ON public.main_unifiedjobtemplate USING btree (created_by_id);


--
-- Name: main_unifiedjobtemplate_credentials_credential_id_fd216c80; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjobtemplate_credentials_credential_id_fd216c80 ON public.main_unifiedjobtemplate_credentials USING btree (credential_id);


--
-- Name: main_unifiedjobtemplate_current_job_id_8f449ab0; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjobtemplate_current_job_id_8f449ab0 ON public.main_unifiedjobtemplate USING btree (current_job_id);


--
-- Name: main_unifiedjobtemplate_labels_label_id_d6a5ee75; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjobtemplate_labels_label_id_d6a5ee75 ON public.main_unifiedjobtemplate_labels USING btree (label_id);


--
-- Name: main_unifiedjobtemplate_labels_unifiedjobtemplate_id_c9307a9a; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjobtemplate_labels_unifiedjobtemplate_id_c9307a9a ON public.main_unifiedjobtemplate_labels USING btree (unifiedjobtemplate_id);


--
-- Name: main_unifiedjobtemplate_last_job_id_7e983743; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjobtemplate_last_job_id_7e983743 ON public.main_unifiedjobtemplate USING btree (last_job_id);


--
-- Name: main_unifiedjobtemplate_modified_by_id_a8bf1de0; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjobtemplate_modified_by_id_a8bf1de0 ON public.main_unifiedjobtemplate USING btree (modified_by_id);


--
-- Name: main_unifiedjobtemplate_next_schedule_id_955ff55d; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjobtemplate_next_schedule_id_955ff55d ON public.main_unifiedjobtemplate USING btree (next_schedule_id);


--
-- Name: main_unifiedjobtemplate_no_notificationtemplate_id_9326cdf9; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjobtemplate_no_notificationtemplate_id_9326cdf9 ON public.main_unifiedjobtemplate_notification_templates_success USING btree (notificationtemplate_id);


--
-- Name: main_unifiedjobtemplate_no_notificationtemplate_id_9793a63a; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjobtemplate_no_notificationtemplate_id_9793a63a ON public.main_unifiedjobtemplate_notification_templates_started USING btree (notificationtemplate_id);


--
-- Name: main_unifiedjobtemplate_no_notificationtemplate_id_b19df8ac; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjobtemplate_no_notificationtemplate_id_b19df8ac ON public.main_unifiedjobtemplate_notification_templates_error USING btree (notificationtemplate_id);


--
-- Name: main_unifiedjobtemplate_no_unifiedjobtemplate_id_0ce91b23; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjobtemplate_no_unifiedjobtemplate_id_0ce91b23 ON public.main_unifiedjobtemplate_notification_templates_error USING btree (unifiedjobtemplate_id);


--
-- Name: main_unifiedjobtemplate_no_unifiedjobtemplate_id_3934753d; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjobtemplate_no_unifiedjobtemplate_id_3934753d ON public.main_unifiedjobtemplate_notification_templates_success USING btree (unifiedjobtemplate_id);


--
-- Name: main_unifiedjobtemplate_no_unifiedjobtemplate_id_6e21dce4; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjobtemplate_no_unifiedjobtemplate_id_6e21dce4 ON public.main_unifiedjobtemplate_notification_templates_started USING btree (unifiedjobtemplate_id);


--
-- Name: main_unifiedjobtemplate_organization_id_c63fa1a4; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjobtemplate_organization_id_c63fa1a4 ON public.main_unifiedjobtemplate USING btree (organization_id);


--
-- Name: main_unifiedjobtemplate_polymorphic_ctype_id_ce19bb25; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjobtemplate_polymorphic_ctype_id_ce19bb25 ON public.main_unifiedjobtemplate USING btree (polymorphic_ctype_id);


--
-- Name: main_unifiedjobtemplateins_instancegroup_id_656188b4; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjobtemplateins_instancegroup_id_656188b4 ON public.main_unifiedjobtemplateinstancegroupmembership USING btree (instancegroup_id);


--
-- Name: main_unifiedjobtemplateins_position_fd6edc28; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjobtemplateins_position_fd6edc28 ON public.main_unifiedjobtemplateinstancegroupmembership USING btree ("position");


--
-- Name: main_unifiedjobtemplateins_unifiedjobtemplate_id_e401e3d7; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_unifiedjobtemplateins_unifiedjobtemplate_id_e401e3d7 ON public.main_unifiedjobtemplateinstancegroupmembership USING btree (unifiedjobtemplate_id);


--
-- Name: main_usersessionmembership_session_id_fbab60a5_like; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_usersessionmembership_session_id_fbab60a5_like ON public.main_usersessionmembership USING btree (session_id varchar_pattern_ops);


--
-- Name: main_usersessionmembership_user_id_fe163c98; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_usersessionmembership_user_id_fe163c98 ON public.main_usersessionmembership USING btree (user_id);


--
-- Name: main_workfl_identif_0cc025_idx; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workfl_identif_0cc025_idx ON public.main_workflowjobtemplatenode USING btree (identifier);


--
-- Name: main_workfl_identif_87b752_idx; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workfl_identif_87b752_idx ON public.main_workflowjobnode USING btree (identifier, workflow_job_id);


--
-- Name: main_workfl_identif_efdfe8_idx; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workfl_identif_efdfe8_idx ON public.main_workflowjobnode USING btree (identifier);


--
-- Name: main_workflowapproval_approved_or_denied_by_id_bb3eae41; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workflowapproval_approved_or_denied_by_id_bb3eae41 ON public.main_workflowapproval USING btree (approved_or_denied_by_id);


--
-- Name: main_workflowapproval_workflow_approval_template_id_b87dda8a; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workflowapproval_workflow_approval_template_id_b87dda8a ON public.main_workflowapproval USING btree (workflow_approval_template_id);


--
-- Name: main_workflowjob_inventory_id_8c31355b; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workflowjob_inventory_id_8c31355b ON public.main_workflowjob USING btree (inventory_id);


--
-- Name: main_workflowjob_job_template_id_cceff2a3; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workflowjob_job_template_id_cceff2a3 ON public.main_workflowjob USING btree (job_template_id);


--
-- Name: main_workflowjob_webhook_credential_id_57c9fece; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workflowjob_webhook_credential_id_57c9fece ON public.main_workflowjob USING btree (webhook_credential_id);


--
-- Name: main_workflowjob_workflow_job_template_id_0d9a93a0; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workflowjob_workflow_job_template_id_0d9a93a0 ON public.main_workflowjob USING btree (workflow_job_template_id);


--
-- Name: main_workflowjobnode_alway_from_workflowjobnode_id_19edb9d7; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workflowjobnode_alway_from_workflowjobnode_id_19edb9d7 ON public.main_workflowjobnode_always_nodes USING btree (from_workflowjobnode_id);


--
-- Name: main_workflowjobnode_alway_to_workflowjobnode_id_0edcda07; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workflowjobnode_alway_to_workflowjobnode_id_0edcda07 ON public.main_workflowjobnode_always_nodes USING btree (to_workflowjobnode_id);


--
-- Name: main_workflowjobnode_credentials_credential_id_6de5a410; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workflowjobnode_credentials_credential_id_6de5a410 ON public.main_workflowjobnode_credentials USING btree (credential_id);


--
-- Name: main_workflowjobnode_credentials_workflowjobnode_id_31f8c02b; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workflowjobnode_credentials_workflowjobnode_id_31f8c02b ON public.main_workflowjobnode_credentials USING btree (workflowjobnode_id);


--
-- Name: main_workflowjobnode_failu_from_workflowjobnode_id_2172a110; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workflowjobnode_failu_from_workflowjobnode_id_2172a110 ON public.main_workflowjobnode_failure_nodes USING btree (from_workflowjobnode_id);


--
-- Name: main_workflowjobnode_failu_to_workflowjobnode_id_d2e09d9c; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workflowjobnode_failu_to_workflowjobnode_id_d2e09d9c ON public.main_workflowjobnode_failure_nodes USING btree (to_workflowjobnode_id);


--
-- Name: main_workflowjobnode_inventory_id_1dac2da9; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workflowjobnode_inventory_id_1dac2da9 ON public.main_workflowjobnode USING btree (inventory_id);


--
-- Name: main_workflowjobnode_succe_from_workflowjobnode_id_e04f9991; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workflowjobnode_succe_from_workflowjobnode_id_e04f9991 ON public.main_workflowjobnode_success_nodes USING btree (from_workflowjobnode_id);


--
-- Name: main_workflowjobnode_succe_to_workflowjobnode_id_e6c8cbb4; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workflowjobnode_succe_to_workflowjobnode_id_e6c8cbb4 ON public.main_workflowjobnode_success_nodes USING btree (to_workflowjobnode_id);


--
-- Name: main_workflowjobnode_unified_job_template_id_8a30f93e; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workflowjobnode_unified_job_template_id_8a30f93e ON public.main_workflowjobnode USING btree (unified_job_template_id);


--
-- Name: main_workflowjobnode_workflow_job_id_dcd715c7; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workflowjobnode_workflow_job_id_dcd715c7 ON public.main_workflowjobnode USING btree (workflow_job_id);


--
-- Name: main_workflowjobtemplate_admin_role_id_5675a40e; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workflowjobtemplate_admin_role_id_5675a40e ON public.main_workflowjobtemplate USING btree (admin_role_id);


--
-- Name: main_workflowjobtemplate_approval_role_id_220f0de1; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workflowjobtemplate_approval_role_id_220f0de1 ON public.main_workflowjobtemplate USING btree (approval_role_id);


--
-- Name: main_workflowjobtemplate_execute_role_id_ad8970f4; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workflowjobtemplate_execute_role_id_ad8970f4 ON public.main_workflowjobtemplate USING btree (execute_role_id);


--
-- Name: main_workflowjobtemplate_inventory_id_99929499; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workflowjobtemplate_inventory_id_99929499 ON public.main_workflowjobtemplate USING btree (inventory_id);


--
-- Name: main_workflowjobtemplate_n_notificationtemplate_id_3811d35e; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workflowjobtemplate_n_notificationtemplate_id_3811d35e ON public.main_workflowjobtemplate_notification_templates_approvals USING btree (notificationtemplate_id);


--
-- Name: main_workflowjobtemplate_n_workflowjobtemplate_id_ce7a17be; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workflowjobtemplate_n_workflowjobtemplate_id_ce7a17be ON public.main_workflowjobtemplate_notification_templates_approvals USING btree (workflowjobtemplate_id);


--
-- Name: main_workflowjobtemplate_read_role_id_acdd95ef; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workflowjobtemplate_read_role_id_acdd95ef ON public.main_workflowjobtemplate USING btree (read_role_id);


--
-- Name: main_workflowjobtemplate_webhook_credential_id_ced1ad89; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workflowjobtemplate_webhook_credential_id_ced1ad89 ON public.main_workflowjobtemplate USING btree (webhook_credential_id);


--
-- Name: main_workflowjobtemplateno_from_workflowjobtemplateno_8af14c32; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workflowjobtemplateno_from_workflowjobtemplateno_8af14c32 ON public.main_workflowjobtemplatenode_always_nodes USING btree (from_workflowjobtemplatenode_id);


--
-- Name: main_workflowjobtemplateno_from_workflowjobtemplateno_9e16f49d; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workflowjobtemplateno_from_workflowjobtemplateno_9e16f49d ON public.main_workflowjobtemplatenode_success_nodes USING btree (from_workflowjobtemplatenode_id);


--
-- Name: main_workflowjobtemplateno_from_workflowjobtemplateno_fa405230; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workflowjobtemplateno_from_workflowjobtemplateno_fa405230 ON public.main_workflowjobtemplatenode_failure_nodes USING btree (from_workflowjobtemplatenode_id);


--
-- Name: main_workflowjobtemplateno_to_workflowjobtemplatenode_2c1db0ae; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workflowjobtemplateno_to_workflowjobtemplatenode_2c1db0ae ON public.main_workflowjobtemplatenode_failure_nodes USING btree (to_workflowjobtemplatenode_id);


--
-- Name: main_workflowjobtemplateno_to_workflowjobtemplatenode_6fe11708; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workflowjobtemplateno_to_workflowjobtemplatenode_6fe11708 ON public.main_workflowjobtemplatenode_always_nodes USING btree (to_workflowjobtemplatenode_id);


--
-- Name: main_workflowjobtemplateno_to_workflowjobtemplatenode_f16ee478; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workflowjobtemplateno_to_workflowjobtemplatenode_f16ee478 ON public.main_workflowjobtemplatenode_success_nodes USING btree (to_workflowjobtemplatenode_id);


--
-- Name: main_workflowjobtemplateno_workflowjobtemplatenode_id_b91efe86; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workflowjobtemplateno_workflowjobtemplatenode_id_b91efe86 ON public.main_workflowjobtemplatenode_credentials USING btree (workflowjobtemplatenode_id);


--
-- Name: main_workflowjobtemplatenode_credentials_credential_id_e621c8d1; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workflowjobtemplatenode_credentials_credential_id_e621c8d1 ON public.main_workflowjobtemplatenode_credentials USING btree (credential_id);


--
-- Name: main_workflowjobtemplatenode_inventory_id_2fab864f; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workflowjobtemplatenode_inventory_id_2fab864f ON public.main_workflowjobtemplatenode USING btree (inventory_id);


--
-- Name: main_workflowjobtemplatenode_unified_job_template_id_98b53e6c; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workflowjobtemplatenode_unified_job_template_id_98b53e6c ON public.main_workflowjobtemplatenode USING btree (unified_job_template_id);


--
-- Name: main_workflowjobtemplatenode_workflow_job_template_id_2fd591f0; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX main_workflowjobtemplatenode_workflow_job_template_id_2fd591f0 ON public.main_workflowjobtemplatenode USING btree (workflow_job_template_id);


--
-- Name: oauth2_provider_grant_application_id_81923564; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX oauth2_provider_grant_application_id_81923564 ON public.oauth2_provider_grant USING btree (application_id);


--
-- Name: oauth2_provider_grant_code_49ab4ddf_like; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX oauth2_provider_grant_code_49ab4ddf_like ON public.oauth2_provider_grant USING btree (code varchar_pattern_ops);


--
-- Name: oauth2_provider_grant_user_id_e8f62af8; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX oauth2_provider_grant_user_id_e8f62af8 ON public.oauth2_provider_grant USING btree (user_id);


--
-- Name: oauth2_provider_refreshtoken_application_id_2d1c311b; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX oauth2_provider_refreshtoken_application_id_2d1c311b ON public.oauth2_provider_refreshtoken USING btree (application_id);


--
-- Name: oauth2_provider_refreshtoken_user_id_da837fce; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX oauth2_provider_refreshtoken_user_id_da837fce ON public.oauth2_provider_refreshtoken USING btree (user_id);


--
-- Name: social_auth_code_code_a2393167; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX social_auth_code_code_a2393167 ON public.social_auth_code USING btree (code);


--
-- Name: social_auth_code_code_a2393167_like; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX social_auth_code_code_a2393167_like ON public.social_auth_code USING btree (code varchar_pattern_ops);


--
-- Name: social_auth_code_timestamp_176b341f; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX social_auth_code_timestamp_176b341f ON public.social_auth_code USING btree ("timestamp");


--
-- Name: social_auth_partial_timestamp_50f2119f; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX social_auth_partial_timestamp_50f2119f ON public.social_auth_partial USING btree ("timestamp");


--
-- Name: social_auth_partial_token_3017fea3; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX social_auth_partial_token_3017fea3 ON public.social_auth_partial USING btree (token);


--
-- Name: social_auth_partial_token_3017fea3_like; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX social_auth_partial_token_3017fea3_like ON public.social_auth_partial USING btree (token varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_user_id_17d28448; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX social_auth_usersocialauth_user_id_17d28448 ON public.social_auth_usersocialauth USING btree (user_id);


--
-- Name: sso_userenterpriseauth_user_id_5982f0ef; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX sso_userenterpriseauth_user_id_5982f0ef ON public.sso_userenterpriseauth USING btree (user_id);


--
-- Name: taggit_tag_name_58eb2ed9_like; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX taggit_tag_name_58eb2ed9_like ON public.taggit_tag USING btree (name varchar_pattern_ops);


--
-- Name: taggit_tag_slug_6be58b2c_like; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX taggit_tag_slug_6be58b2c_like ON public.taggit_tag USING btree (slug varchar_pattern_ops);


--
-- Name: taggit_taggeditem_content_type_id_9957a03c; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX taggit_taggeditem_content_type_id_9957a03c ON public.taggit_taggeditem USING btree (content_type_id);


--
-- Name: taggit_taggeditem_content_type_id_object_id_196cc965_idx; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX taggit_taggeditem_content_type_id_object_id_196cc965_idx ON public.taggit_taggeditem USING btree (content_type_id, object_id);


--
-- Name: taggit_taggeditem_object_id_e2d7d1df; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX taggit_taggeditem_object_id_e2d7d1df ON public.taggit_taggeditem USING btree (object_id);


--
-- Name: taggit_taggeditem_tag_id_f4f5b767; Type: INDEX; Schema: public; Owner: awx
--

CREATE INDEX taggit_taggeditem_tag_id_f4f5b767 ON public.taggit_taggeditem USING btree (tag_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: conf_setting conf_setting_user_id_ce9d5138_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.conf_setting
    ADD CONSTRAINT conf_setting_user_id_ce9d5138_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_organization main_activitystream__activitystream_id_0283e075_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_organization
    ADD CONSTRAINT main_activitystream__activitystream_id_0283e075_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_instance main_activitystream__activitystream_id_04ccbf32_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_instance
    ADD CONSTRAINT main_activitystream__activitystream_id_04ccbf32_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_workflow_approval main_activitystream__activitystream_id_14401444_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_workflow_approval
    ADD CONSTRAINT main_activitystream__activitystream_id_14401444_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_notification_template main_activitystream__activitystream_id_214c1789_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_notification_template
    ADD CONSTRAINT main_activitystream__activitystream_id_214c1789_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_workflow_job_template main_activitystream__activitystream_id_259ad363_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_workflow_job_template
    ADD CONSTRAINT main_activitystream__activitystream_id_259ad363_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_project_update main_activitystream__activitystream_id_2965eda0_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_project_update
    ADD CONSTRAINT main_activitystream__activitystream_id_2965eda0_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_custom_inventory_script main_activitystream__activitystream_id_2d7243ca_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_custom_inventory_script
    ADD CONSTRAINT main_activitystream__activitystream_id_2d7243ca_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_inventory main_activitystream__activitystream_id_4a1242eb_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_inventory
    ADD CONSTRAINT main_activitystream__activitystream_id_4a1242eb_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_credential main_activitystream__activitystream_id_4be1a957_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_credential
    ADD CONSTRAINT main_activitystream__activitystream_id_4be1a957_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_inventory_update main_activitystream__activitystream_id_732f074a_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_inventory_update
    ADD CONSTRAINT main_activitystream__activitystream_id_732f074a_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_notification main_activitystream__activitystream_id_7d39234a_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_notification
    ADD CONSTRAINT main_activitystream__activitystream_id_7d39234a_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_workflow_approval_template main_activitystream__activitystream_id_7e8e02aa_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_workflow_approval_template
    ADD CONSTRAINT main_activitystream__activitystream_id_7e8e02aa_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_ad_hoc_command main_activitystream__activitystream_id_870ddb01_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_ad_hoc_command
    ADD CONSTRAINT main_activitystream__activitystream_id_870ddb01_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_workflow_job main_activitystream__activitystream_id_93d66e38_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_workflow_job
    ADD CONSTRAINT main_activitystream__activitystream_id_93d66e38_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_group main_activitystream__activitystream_id_94d31559_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_group
    ADD CONSTRAINT main_activitystream__activitystream_id_94d31559_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_o_auth2_access_token main_activitystream__activitystream_id_9cd33ed4_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_o_auth2_access_token
    ADD CONSTRAINT main_activitystream__activitystream_id_9cd33ed4_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_schedule main_activitystream__activitystream_id_a5fd87ef_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_schedule
    ADD CONSTRAINT main_activitystream__activitystream_id_a5fd87ef_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_job_template main_activitystream__activitystream_id_abd63b6d_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_job_template
    ADD CONSTRAINT main_activitystream__activitystream_id_abd63b6d_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_label main_activitystream__activitystream_id_afd608d7_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_label
    ADD CONSTRAINT main_activitystream__activitystream_id_afd608d7_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_job main_activitystream__activitystream_id_b1f2ab1b_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_job
    ADD CONSTRAINT main_activitystream__activitystream_id_b1f2ab1b_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_workflow_job_template_node main_activitystream__activitystream_id_b3d1beb6_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_workflow_job_template_node
    ADD CONSTRAINT main_activitystream__activitystream_id_b3d1beb6_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_credential_type main_activitystream__activitystream_id_b7a4b49d_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_credential_type
    ADD CONSTRAINT main_activitystream__activitystream_id_b7a4b49d_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_team main_activitystream__activitystream_id_c4874e73_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_team
    ADD CONSTRAINT main_activitystream__activitystream_id_c4874e73_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_host main_activitystream__activitystream_id_c4d91cb7_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_host
    ADD CONSTRAINT main_activitystream__activitystream_id_c4d91cb7_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_workflow_job_node main_activitystream__activitystream_id_c8397668_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_workflow_job_node
    ADD CONSTRAINT main_activitystream__activitystream_id_c8397668_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_role main_activitystream__activitystream_id_d591eb98_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_role
    ADD CONSTRAINT main_activitystream__activitystream_id_d591eb98_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_inventory_source main_activitystream__activitystream_id_d88c8423_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_inventory_source
    ADD CONSTRAINT main_activitystream__activitystream_id_d88c8423_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_unified_job main_activitystream__activitystream_id_e29d497f_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_unified_job
    ADD CONSTRAINT main_activitystream__activitystream_id_e29d497f_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_unified_job_template main_activitystream__activitystream_id_e4ce5d15_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_unified_job_template
    ADD CONSTRAINT main_activitystream__activitystream_id_e4ce5d15_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_instance_group main_activitystream__activitystream_id_e81ef38a_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_instance_group
    ADD CONSTRAINT main_activitystream__activitystream_id_e81ef38a_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_o_auth2_application main_activitystream__activitystream_id_ea629ffe_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_o_auth2_application
    ADD CONSTRAINT main_activitystream__activitystream_id_ea629ffe_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_user main_activitystream__activitystream_id_f120c9d1_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_user
    ADD CONSTRAINT main_activitystream__activitystream_id_f120c9d1_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_project main_activitystream__activitystream_id_f6aa28cc_fk_main_acti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_project
    ADD CONSTRAINT main_activitystream__activitystream_id_f6aa28cc_fk_main_acti FOREIGN KEY (activitystream_id) REFERENCES public.main_activitystream(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_ad_hoc_command main_activitystream__adhoccommand_id_0df7bfcd_fk_main_adho; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_ad_hoc_command
    ADD CONSTRAINT main_activitystream__adhoccommand_id_0df7bfcd_fk_main_adho FOREIGN KEY (adhoccommand_id) REFERENCES public.main_adhoccommand(unifiedjob_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_credential main_activitystream__credential_id_d5911596_fk_main_cred; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_credential
    ADD CONSTRAINT main_activitystream__credential_id_d5911596_fk_main_cred FOREIGN KEY (credential_id) REFERENCES public.main_credential(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_credential_type main_activitystream__credentialtype_id_89572b10_fk_main_cred; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_credential_type
    ADD CONSTRAINT main_activitystream__credentialtype_id_89572b10_fk_main_cred FOREIGN KEY (credentialtype_id) REFERENCES public.main_credentialtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_custom_inventory_script main_activitystream__custominventoryscrip_9208376f_fk_main_cust; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_custom_inventory_script
    ADD CONSTRAINT main_activitystream__custominventoryscrip_9208376f_fk_main_cust FOREIGN KEY (custominventoryscript_id) REFERENCES public.main_custominventoryscript(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_instance main_activitystream__instance_id_d10eb669_fk_main_inst; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_instance
    ADD CONSTRAINT main_activitystream__instance_id_d10eb669_fk_main_inst FOREIGN KEY (instance_id) REFERENCES public.main_instance(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_instance_group main_activitystream__instancegroup_id_fca49f6c_fk_main_inst; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_instance_group
    ADD CONSTRAINT main_activitystream__instancegroup_id_fca49f6c_fk_main_inst FOREIGN KEY (instancegroup_id) REFERENCES public.main_instancegroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_inventory main_activitystream__inventory_id_8daf9251_fk_main_inve; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_inventory
    ADD CONSTRAINT main_activitystream__inventory_id_8daf9251_fk_main_inve FOREIGN KEY (inventory_id) REFERENCES public.main_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_inventory_source main_activitystream__inventorysource_id_235e699a_fk_main_inve; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_inventory_source
    ADD CONSTRAINT main_activitystream__inventorysource_id_235e699a_fk_main_inve FOREIGN KEY (inventorysource_id) REFERENCES public.main_inventorysource(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_inventory_update main_activitystream__inventoryupdate_id_817749c5_fk_main_inve; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_inventory_update
    ADD CONSTRAINT main_activitystream__inventoryupdate_id_817749c5_fk_main_inve FOREIGN KEY (inventoryupdate_id) REFERENCES public.main_inventoryupdate(unifiedjob_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_job main_activitystream__job_id_aa6811b5_fk_main_job_; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_job
    ADD CONSTRAINT main_activitystream__job_id_aa6811b5_fk_main_job_ FOREIGN KEY (job_id) REFERENCES public.main_job(unifiedjob_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_job_template main_activitystream__jobtemplate_id_c05e0b6c_fk_main_jobt; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_job_template
    ADD CONSTRAINT main_activitystream__jobtemplate_id_c05e0b6c_fk_main_jobt FOREIGN KEY (jobtemplate_id) REFERENCES public.main_jobtemplate(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_notification main_activitystream__notification_id_bbfaa8ac_fk_main_noti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_notification
    ADD CONSTRAINT main_activitystream__notification_id_bbfaa8ac_fk_main_noti FOREIGN KEY (notification_id) REFERENCES public.main_notification(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_notification_template main_activitystream__notificationtemplate_96d11a5d_fk_main_noti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_notification_template
    ADD CONSTRAINT main_activitystream__notificationtemplate_96d11a5d_fk_main_noti FOREIGN KEY (notificationtemplate_id) REFERENCES public.main_notificationtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_o_auth2_access_token main_activitystream__oauth2accesstoken_id_76c333c8_fk_main_oaut; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_o_auth2_access_token
    ADD CONSTRAINT main_activitystream__oauth2accesstoken_id_76c333c8_fk_main_oaut FOREIGN KEY (oauth2accesstoken_id) REFERENCES public.main_oauth2accesstoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_o_auth2_application main_activitystream__oauth2application_id_23726fd8_fk_main_oaut; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_o_auth2_application
    ADD CONSTRAINT main_activitystream__oauth2application_id_23726fd8_fk_main_oaut FOREIGN KEY (oauth2application_id) REFERENCES public.main_oauth2application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_organization main_activitystream__organization_id_8ccdfd12_fk_main_orga; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_organization
    ADD CONSTRAINT main_activitystream__organization_id_8ccdfd12_fk_main_orga FOREIGN KEY (organization_id) REFERENCES public.main_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_project main_activitystream__project_id_836f7b93_fk_main_proj; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_project
    ADD CONSTRAINT main_activitystream__project_id_836f7b93_fk_main_proj FOREIGN KEY (project_id) REFERENCES public.main_project(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_project_update main_activitystream__projectupdate_id_8ac4ba92_fk_main_proj; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_project_update
    ADD CONSTRAINT main_activitystream__projectupdate_id_8ac4ba92_fk_main_proj FOREIGN KEY (projectupdate_id) REFERENCES public.main_projectupdate(unifiedjob_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_schedule main_activitystream__schedule_id_9bde99e8_fk_main_sche; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_schedule
    ADD CONSTRAINT main_activitystream__schedule_id_9bde99e8_fk_main_sche FOREIGN KEY (schedule_id) REFERENCES public.main_schedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_unified_job main_activitystream__unifiedjob_id_bd9f07c6_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_unified_job
    ADD CONSTRAINT main_activitystream__unifiedjob_id_bd9f07c6_fk_main_unif FOREIGN KEY (unifiedjob_id) REFERENCES public.main_unifiedjob(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_unified_job_template main_activitystream__unifiedjobtemplate_i_71f8a21f_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_unified_job_template
    ADD CONSTRAINT main_activitystream__unifiedjobtemplate_i_71f8a21f_fk_main_unif FOREIGN KEY (unifiedjobtemplate_id) REFERENCES public.main_unifiedjobtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_workflow_approval main_activitystream__workflowapproval_id_8d4193a7_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_workflow_approval
    ADD CONSTRAINT main_activitystream__workflowapproval_id_8d4193a7_fk_main_work FOREIGN KEY (workflowapproval_id) REFERENCES public.main_workflowapproval(unifiedjob_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_workflow_approval_template main_activitystream__workflowapprovaltemp_93e9e097_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_workflow_approval_template
    ADD CONSTRAINT main_activitystream__workflowapprovaltemp_93e9e097_fk_main_work FOREIGN KEY (workflowapprovaltemplate_id) REFERENCES public.main_workflowapprovaltemplate(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_workflow_job main_activitystream__workflowjob_id_c29366d7_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_workflow_job
    ADD CONSTRAINT main_activitystream__workflowjob_id_c29366d7_fk_main_work FOREIGN KEY (workflowjob_id) REFERENCES public.main_workflowjob(unifiedjob_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_workflow_job_node main_activitystream__workflowjobnode_id_85bb51d6_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_workflow_job_node
    ADD CONSTRAINT main_activitystream__workflowjobnode_id_85bb51d6_fk_main_work FOREIGN KEY (workflowjobnode_id) REFERENCES public.main_workflowjobnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_workflow_job_template main_activitystream__workflowjobtemplate__efd4c1aa_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_workflow_job_template
    ADD CONSTRAINT main_activitystream__workflowjobtemplate__efd4c1aa_fk_main_work FOREIGN KEY (workflowjobtemplate_id) REFERENCES public.main_workflowjobtemplate(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_workflow_job_template_node main_activitystream__workflowjobtemplaten_a2630ab6_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_workflow_job_template_node
    ADD CONSTRAINT main_activitystream__workflowjobtemplaten_a2630ab6_fk_main_work FOREIGN KEY (workflowjobtemplatenode_id) REFERENCES public.main_workflowjobtemplatenode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream main_activitystream_actor_id_29aafc0f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream
    ADD CONSTRAINT main_activitystream_actor_id_29aafc0f_fk_auth_user_id FOREIGN KEY (actor_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_group main_activitystream_group_group_id_fd48b400_fk_main_group_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_group
    ADD CONSTRAINT main_activitystream_group_group_id_fd48b400_fk_main_group_id FOREIGN KEY (group_id) REFERENCES public.main_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_host main_activitystream_host_host_id_0e598602_fk_main_host_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_host
    ADD CONSTRAINT main_activitystream_host_host_id_0e598602_fk_main_host_id FOREIGN KEY (host_id) REFERENCES public.main_host(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_label main_activitystream_label_label_id_b33683fb_fk_main_label_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_label
    ADD CONSTRAINT main_activitystream_label_label_id_b33683fb_fk_main_label_id FOREIGN KEY (label_id) REFERENCES public.main_label(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_role main_activitystream_role_role_id_e19fce37_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_role
    ADD CONSTRAINT main_activitystream_role_role_id_e19fce37_fk_main_rbac_roles_id FOREIGN KEY (role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_team main_activitystream_team_team_id_725f033a_fk_main_team_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_team
    ADD CONSTRAINT main_activitystream_team_team_id_725f033a_fk_main_team_id FOREIGN KEY (team_id) REFERENCES public.main_team(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_activitystream_user main_activitystream_user_user_id_435f8320_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_activitystream_user
    ADD CONSTRAINT main_activitystream_user_user_id_435f8320_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_adhoccommand main_adhoccommand_credential_id_da6b1c87_fk_main_credential_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_adhoccommand
    ADD CONSTRAINT main_adhoccommand_credential_id_da6b1c87_fk_main_credential_id FOREIGN KEY (credential_id) REFERENCES public.main_credential(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_adhoccommand main_adhoccommand_inventory_id_b29bba0e_fk_main_inventory_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_adhoccommand
    ADD CONSTRAINT main_adhoccommand_inventory_id_b29bba0e_fk_main_inventory_id FOREIGN KEY (inventory_id) REFERENCES public.main_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_adhoccommand main_adhoccommand_unifiedjob_ptr_id_ef80f1dd_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_adhoccommand
    ADD CONSTRAINT main_adhoccommand_unifiedjob_ptr_id_ef80f1dd_fk_main_unif FOREIGN KEY (unifiedjob_ptr_id) REFERENCES public.main_unifiedjob(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_credential main_credential_admin_role_id_6cd7ab86_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_credential
    ADD CONSTRAINT main_credential_admin_role_id_6cd7ab86_fk_main_rbac_roles_id FOREIGN KEY (admin_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_credential main_credential_created_by_id_237add04_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_credential
    ADD CONSTRAINT main_credential_created_by_id_237add04_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_credential main_credential_credential_type_id_0120654c_fk_main_cred; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_credential
    ADD CONSTRAINT main_credential_credential_type_id_0120654c_fk_main_cred FOREIGN KEY (credential_type_id) REFERENCES public.main_credentialtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_credential main_credential_modified_by_id_c290955a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_credential
    ADD CONSTRAINT main_credential_modified_by_id_c290955a_fk_auth_user_id FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_credential main_credential_organization_id_18d4ae89_fk_main_orga; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_credential
    ADD CONSTRAINT main_credential_organization_id_18d4ae89_fk_main_orga FOREIGN KEY (organization_id) REFERENCES public.main_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_credential main_credential_read_role_id_12be41a2_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_credential
    ADD CONSTRAINT main_credential_read_role_id_12be41a2_fk_main_rbac_roles_id FOREIGN KEY (read_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_credential main_credential_use_role_id_122159d4_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_credential
    ADD CONSTRAINT main_credential_use_role_id_122159d4_fk_main_rbac_roles_id FOREIGN KEY (use_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_credentialinputsource main_credentialinput_created_by_id_d2dc637c_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_credentialinputsource
    ADD CONSTRAINT main_credentialinput_created_by_id_d2dc637c_fk_auth_user FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_credentialinputsource main_credentialinput_modified_by_id_e3fd88dd_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_credentialinputsource
    ADD CONSTRAINT main_credentialinput_modified_by_id_e3fd88dd_fk_auth_user FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_credentialinputsource main_credentialinput_source_credential_id_868d93af_fk_main_cred; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_credentialinputsource
    ADD CONSTRAINT main_credentialinput_source_credential_id_868d93af_fk_main_cred FOREIGN KEY (source_credential_id) REFERENCES public.main_credential(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_credentialinputsource main_credentialinput_target_credential_id_4bf0e248_fk_main_cred; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_credentialinputsource
    ADD CONSTRAINT main_credentialinput_target_credential_id_4bf0e248_fk_main_cred FOREIGN KEY (target_credential_id) REFERENCES public.main_credential(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_credentialtype main_credentialtype_created_by_id_0f8451ed_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_credentialtype
    ADD CONSTRAINT main_credentialtype_created_by_id_0f8451ed_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_credentialtype main_credentialtype_modified_by_id_b425580d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_credentialtype
    ADD CONSTRAINT main_credentialtype_modified_by_id_b425580d_fk_auth_user_id FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_custominventoryscript main_custominventory_admin_role_id_c18fcf29_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_custominventoryscript
    ADD CONSTRAINT main_custominventory_admin_role_id_c18fcf29_fk_main_rbac FOREIGN KEY (admin_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_custominventoryscript main_custominventory_created_by_id_45a39526_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_custominventoryscript
    ADD CONSTRAINT main_custominventory_created_by_id_45a39526_fk_auth_user FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_custominventoryscript main_custominventory_modified_by_id_6c74f1d0_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_custominventoryscript
    ADD CONSTRAINT main_custominventory_modified_by_id_6c74f1d0_fk_auth_user FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_custominventoryscript main_custominventory_organization_id_b2fa3e3b_fk_main_orga; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_custominventoryscript
    ADD CONSTRAINT main_custominventory_organization_id_b2fa3e3b_fk_main_orga FOREIGN KEY (organization_id) REFERENCES public.main_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_custominventoryscript main_custominventory_read_role_id_fb907425_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_custominventoryscript
    ADD CONSTRAINT main_custominventory_read_role_id_fb907425_fk_main_rbac FOREIGN KEY (read_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_group main_group_created_by_id_326129d5_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_group
    ADD CONSTRAINT main_group_created_by_id_326129d5_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_group_hosts main_group_hosts_group_id_524c3b29_fk_main_group_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_group_hosts
    ADD CONSTRAINT main_group_hosts_group_id_524c3b29_fk_main_group_id FOREIGN KEY (group_id) REFERENCES public.main_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_group_hosts main_group_hosts_host_id_672eaed0_fk_main_host_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_group_hosts
    ADD CONSTRAINT main_group_hosts_host_id_672eaed0_fk_main_host_id FOREIGN KEY (host_id) REFERENCES public.main_host(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_group main_group_inventory_id_f9e83725_fk_main_inventory_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_group
    ADD CONSTRAINT main_group_inventory_id_f9e83725_fk_main_inventory_id FOREIGN KEY (inventory_id) REFERENCES public.main_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_group_inventory_sources main_group_inventory_inventorysource_id_5da14efc_fk_main_inve; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_group_inventory_sources
    ADD CONSTRAINT main_group_inventory_inventorysource_id_5da14efc_fk_main_inve FOREIGN KEY (inventorysource_id) REFERENCES public.main_inventorysource(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_group_inventory_sources main_group_inventory_sources_group_id_1be295c4_fk_main_group_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_group_inventory_sources
    ADD CONSTRAINT main_group_inventory_sources_group_id_1be295c4_fk_main_group_id FOREIGN KEY (group_id) REFERENCES public.main_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_group main_group_modified_by_id_20a1b654_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_group
    ADD CONSTRAINT main_group_modified_by_id_20a1b654_fk_auth_user_id FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_group_parents main_group_parents_from_group_id_9d63324d_fk_main_group_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_group_parents
    ADD CONSTRAINT main_group_parents_from_group_id_9d63324d_fk_main_group_id FOREIGN KEY (from_group_id) REFERENCES public.main_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_group_parents main_group_parents_to_group_id_851cc1ce_fk_main_group_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_group_parents
    ADD CONSTRAINT main_group_parents_to_group_id_851cc1ce_fk_main_group_id FOREIGN KEY (to_group_id) REFERENCES public.main_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_host main_host_created_by_id_2b5e0abe_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_host
    ADD CONSTRAINT main_host_created_by_id_2b5e0abe_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_host_inventory_sources main_host_inventory__inventorysource_id_b25d3959_fk_main_inve; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_host_inventory_sources
    ADD CONSTRAINT main_host_inventory__inventorysource_id_b25d3959_fk_main_inve FOREIGN KEY (inventorysource_id) REFERENCES public.main_inventorysource(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_host main_host_inventory_id_e5bcdb08_fk_main_inventory_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_host
    ADD CONSTRAINT main_host_inventory_id_e5bcdb08_fk_main_inventory_id FOREIGN KEY (inventory_id) REFERENCES public.main_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_host_inventory_sources main_host_inventory_sources_host_id_03f0dcdc_fk_main_host_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_host_inventory_sources
    ADD CONSTRAINT main_host_inventory_sources_host_id_03f0dcdc_fk_main_host_id FOREIGN KEY (host_id) REFERENCES public.main_host(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_host main_host_last_job_host_summar_b8bd727d_fk_main_jobh; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_host
    ADD CONSTRAINT main_host_last_job_host_summar_b8bd727d_fk_main_jobh FOREIGN KEY (last_job_host_summary_id) REFERENCES public.main_jobhostsummary(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_host main_host_last_job_id_d247075b_fk_main_job_unifiedjob_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_host
    ADD CONSTRAINT main_host_last_job_id_d247075b_fk_main_job_unifiedjob_ptr_id FOREIGN KEY (last_job_id) REFERENCES public.main_job(unifiedjob_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_host main_host_modified_by_id_28b76283_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_host
    ADD CONSTRAINT main_host_modified_by_id_28b76283_fk_auth_user_id FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_instancegroup main_instancegroup_controller_id_043cd3a9_fk_main_inst; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_instancegroup
    ADD CONSTRAINT main_instancegroup_controller_id_043cd3a9_fk_main_inst FOREIGN KEY (controller_id) REFERENCES public.main_instancegroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_instancegroup main_instancegroup_credential_id_98351d10_fk_main_credential_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_instancegroup
    ADD CONSTRAINT main_instancegroup_credential_id_98351d10_fk_main_credential_id FOREIGN KEY (credential_id) REFERENCES public.main_credential(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_instancegroup_instances main_instancegroup_i_instance_id_d41cb05c_fk_main_inst; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_instancegroup_instances
    ADD CONSTRAINT main_instancegroup_i_instance_id_d41cb05c_fk_main_inst FOREIGN KEY (instance_id) REFERENCES public.main_instance(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_instancegroup_instances main_instancegroup_i_instancegroup_id_b4b19635_fk_main_inst; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_instancegroup_instances
    ADD CONSTRAINT main_instancegroup_i_instancegroup_id_b4b19635_fk_main_inst FOREIGN KEY (instancegroup_id) REFERENCES public.main_instancegroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventory main_inventory_adhoc_role_id_b57042aa_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_inventory
    ADD CONSTRAINT main_inventory_adhoc_role_id_b57042aa_fk_main_rbac_roles_id FOREIGN KEY (adhoc_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventory main_inventory_admin_role_id_3bb301cb_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_inventory
    ADD CONSTRAINT main_inventory_admin_role_id_3bb301cb_fk_main_rbac_roles_id FOREIGN KEY (admin_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventory main_inventory_created_by_id_5d690781_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_inventory
    ADD CONSTRAINT main_inventory_created_by_id_5d690781_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventory main_inventory_insights_credential__ce91863f_fk_main_cred; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_inventory
    ADD CONSTRAINT main_inventory_insights_credential__ce91863f_fk_main_cred FOREIGN KEY (insights_credential_id) REFERENCES public.main_credential(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventory main_inventory_modified_by_id_a4a91734_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_inventory
    ADD CONSTRAINT main_inventory_modified_by_id_a4a91734_fk_auth_user_id FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventory main_inventory_organization_id_3ee77ea9_fk_main_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_inventory
    ADD CONSTRAINT main_inventory_organization_id_3ee77ea9_fk_main_organization_id FOREIGN KEY (organization_id) REFERENCES public.main_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventory main_inventory_read_role_id_270dd070_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_inventory
    ADD CONSTRAINT main_inventory_read_role_id_270dd070_fk_main_rbac_roles_id FOREIGN KEY (read_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventory main_inventory_update_role_id_be0903a1_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_inventory
    ADD CONSTRAINT main_inventory_update_role_id_be0903a1_fk_main_rbac_roles_id FOREIGN KEY (update_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventory main_inventory_use_role_id_77407b26_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_inventory
    ADD CONSTRAINT main_inventory_use_role_id_77407b26_fk_main_rbac_roles_id FOREIGN KEY (use_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventoryinstancegroupmembership main_inventoryinstan_instancegroup_id_8c752e87_fk_main_inst; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_inventoryinstancegroupmembership
    ADD CONSTRAINT main_inventoryinstan_instancegroup_id_8c752e87_fk_main_inst FOREIGN KEY (instancegroup_id) REFERENCES public.main_instancegroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventoryinstancegroupmembership main_inventoryinstan_inventory_id_76a877b6_fk_main_inve; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_inventoryinstancegroupmembership
    ADD CONSTRAINT main_inventoryinstan_inventory_id_76a877b6_fk_main_inve FOREIGN KEY (inventory_id) REFERENCES public.main_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventorysource main_inventorysource_inventory_id_3c1cac19_fk_main_inventory_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_inventorysource
    ADD CONSTRAINT main_inventorysource_inventory_id_3c1cac19_fk_main_inventory_id FOREIGN KEY (inventory_id) REFERENCES public.main_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventorysource main_inventorysource_source_project_id_5b9c4374_fk_main_proj; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_inventorysource
    ADD CONSTRAINT main_inventorysource_source_project_id_5b9c4374_fk_main_proj FOREIGN KEY (source_project_id) REFERENCES public.main_project(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventorysource main_inventorysource_source_script_id_03a7c8d7_fk_main_cust; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_inventorysource
    ADD CONSTRAINT main_inventorysource_source_script_id_03a7c8d7_fk_main_cust FOREIGN KEY (source_script_id) REFERENCES public.main_custominventoryscript(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventorysource main_inventorysource_unifiedjobtemplate_p_6a11d509_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_inventorysource
    ADD CONSTRAINT main_inventorysource_unifiedjobtemplate_p_6a11d509_fk_main_unif FOREIGN KEY (unifiedjobtemplate_ptr_id) REFERENCES public.main_unifiedjobtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventoryupdate main_inventoryupdate_inventory_id_e60f1f2e_fk_main_inventory_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_inventoryupdate
    ADD CONSTRAINT main_inventoryupdate_inventory_id_e60f1f2e_fk_main_inventory_id FOREIGN KEY (inventory_id) REFERENCES public.main_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventoryupdate main_inventoryupdate_inventory_source_id_bc4b2567_fk_main_inve; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_inventoryupdate
    ADD CONSTRAINT main_inventoryupdate_inventory_source_id_bc4b2567_fk_main_inve FOREIGN KEY (inventory_source_id) REFERENCES public.main_inventorysource(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventoryupdate main_inventoryupdate_source_project_updat_b896d555_fk_main_proj; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_inventoryupdate
    ADD CONSTRAINT main_inventoryupdate_source_project_updat_b896d555_fk_main_proj FOREIGN KEY (source_project_update_id) REFERENCES public.main_projectupdate(unifiedjob_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventoryupdate main_inventoryupdate_source_script_id_f2d2c3a8_fk_main_cust; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_inventoryupdate
    ADD CONSTRAINT main_inventoryupdate_source_script_id_f2d2c3a8_fk_main_cust FOREIGN KEY (source_script_id) REFERENCES public.main_custominventoryscript(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_inventoryupdate main_inventoryupdate_unifiedjob_ptr_id_a42ff4c2_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_inventoryupdate
    ADD CONSTRAINT main_inventoryupdate_unifiedjob_ptr_id_a42ff4c2_fk_main_unif FOREIGN KEY (unifiedjob_ptr_id) REFERENCES public.main_unifiedjob(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_job main_job_inventory_id_1b436658_fk_main_inventory_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_job
    ADD CONSTRAINT main_job_inventory_id_1b436658_fk_main_inventory_id FOREIGN KEY (inventory_id) REFERENCES public.main_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_job main_job_job_template_id_070b0d56_fk_main_jobt; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_job
    ADD CONSTRAINT main_job_job_template_id_070b0d56_fk_main_jobt FOREIGN KEY (job_template_id) REFERENCES public.main_jobtemplate(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_job main_job_project_id_a8f63894_fk_main_proj; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_job
    ADD CONSTRAINT main_job_project_id_a8f63894_fk_main_proj FOREIGN KEY (project_id) REFERENCES public.main_project(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_job main_job_project_update_id_5adf90ad_fk_main_proj; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_job
    ADD CONSTRAINT main_job_project_update_id_5adf90ad_fk_main_proj FOREIGN KEY (project_update_id) REFERENCES public.main_projectupdate(unifiedjob_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_job main_job_unifiedjob_ptr_id_46108a43_fk_main_unifiedjob_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_job
    ADD CONSTRAINT main_job_unifiedjob_ptr_id_46108a43_fk_main_unifiedjob_id FOREIGN KEY (unifiedjob_ptr_id) REFERENCES public.main_unifiedjob(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_job main_job_webhook_credential_id_40ca94fa_fk_main_credential_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_job
    ADD CONSTRAINT main_job_webhook_credential_id_40ca94fa_fk_main_credential_id FOREIGN KEY (webhook_credential_id) REFERENCES public.main_credential(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_jobhostsummary main_jobhostsummary_host_id_7d9f6bf9_fk_main_host_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_jobhostsummary
    ADD CONSTRAINT main_jobhostsummary_host_id_7d9f6bf9_fk_main_host_id FOREIGN KEY (host_id) REFERENCES public.main_host(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_jobhostsummary main_jobhostsummary_job_id_8d60afa0_fk_main_job_; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_jobhostsummary
    ADD CONSTRAINT main_jobhostsummary_job_id_8d60afa0_fk_main_job_ FOREIGN KEY (job_id) REFERENCES public.main_job(unifiedjob_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_joblaunchconfig_credentials main_joblaunchconfig_credential_id_2f5c0487_fk_main_cred; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_joblaunchconfig_credentials
    ADD CONSTRAINT main_joblaunchconfig_credential_id_2f5c0487_fk_main_cred FOREIGN KEY (credential_id) REFERENCES public.main_credential(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_joblaunchconfig main_joblaunchconfig_inventory_id_f905306d_fk_main_inventory_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_joblaunchconfig
    ADD CONSTRAINT main_joblaunchconfig_inventory_id_f905306d_fk_main_inventory_id FOREIGN KEY (inventory_id) REFERENCES public.main_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_joblaunchconfig main_joblaunchconfig_job_id_6e18fad4_fk_main_unifiedjob_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_joblaunchconfig
    ADD CONSTRAINT main_joblaunchconfig_job_id_6e18fad4_fk_main_unifiedjob_id FOREIGN KEY (job_id) REFERENCES public.main_unifiedjob(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_joblaunchconfig_credentials main_joblaunchconfig_joblaunchconfig_id_37dc31b9_fk_main_jobl; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_joblaunchconfig_credentials
    ADD CONSTRAINT main_joblaunchconfig_joblaunchconfig_id_37dc31b9_fk_main_jobl FOREIGN KEY (joblaunchconfig_id) REFERENCES public.main_joblaunchconfig(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_jobtemplate main_jobtemplate_admin_role_id_f9dc66ce_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_jobtemplate
    ADD CONSTRAINT main_jobtemplate_admin_role_id_f9dc66ce_fk_main_rbac_roles_id FOREIGN KEY (admin_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_jobtemplate main_jobtemplate_execute_role_id_c2f0db2c_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_jobtemplate
    ADD CONSTRAINT main_jobtemplate_execute_role_id_c2f0db2c_fk_main_rbac_roles_id FOREIGN KEY (execute_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_jobtemplate main_jobtemplate_inventory_id_9b8df646_fk_main_inventory_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_jobtemplate
    ADD CONSTRAINT main_jobtemplate_inventory_id_9b8df646_fk_main_inventory_id FOREIGN KEY (inventory_id) REFERENCES public.main_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_jobtemplate main_jobtemplate_project_id_36e80985_fk_main_proj; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_jobtemplate
    ADD CONSTRAINT main_jobtemplate_project_id_36e80985_fk_main_proj FOREIGN KEY (project_id) REFERENCES public.main_project(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_jobtemplate main_jobtemplate_read_role_id_0e489c81_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_jobtemplate
    ADD CONSTRAINT main_jobtemplate_read_role_id_0e489c81_fk_main_rbac_roles_id FOREIGN KEY (read_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_jobtemplate main_jobtemplate_unifiedjobtemplate_p_4d0a792f_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_jobtemplate
    ADD CONSTRAINT main_jobtemplate_unifiedjobtemplate_p_4d0a792f_fk_main_unif FOREIGN KEY (unifiedjobtemplate_ptr_id) REFERENCES public.main_unifiedjobtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_jobtemplate main_jobtemplate_webhook_credential_i_eff7fb4b_fk_main_cred; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_jobtemplate
    ADD CONSTRAINT main_jobtemplate_webhook_credential_i_eff7fb4b_fk_main_cred FOREIGN KEY (webhook_credential_id) REFERENCES public.main_credential(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_label main_label_created_by_id_201182c0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_label
    ADD CONSTRAINT main_label_created_by_id_201182c0_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_label main_label_modified_by_id_7f9aac68_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_label
    ADD CONSTRAINT main_label_modified_by_id_7f9aac68_fk_auth_user_id FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_label main_label_organization_id_78a1bd27_fk_main_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_label
    ADD CONSTRAINT main_label_organization_id_78a1bd27_fk_main_organization_id FOREIGN KEY (organization_id) REFERENCES public.main_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_notification main_notification_notification_templat_9eed1d65_fk_main_noti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_notification
    ADD CONSTRAINT main_notification_notification_templat_9eed1d65_fk_main_noti FOREIGN KEY (notification_template_id) REFERENCES public.main_notificationtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_notificationtemplate main_notificationtem_created_by_id_1f77983a_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_notificationtemplate
    ADD CONSTRAINT main_notificationtem_created_by_id_1f77983a_fk_auth_user FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_notificationtemplate main_notificationtem_modified_by_id_83c40510_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_notificationtemplate
    ADD CONSTRAINT main_notificationtem_modified_by_id_83c40510_fk_auth_user FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_notificationtemplate main_notificationtem_organization_id_15933abb_fk_main_orga; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_notificationtemplate
    ADD CONSTRAINT main_notificationtem_organization_id_15933abb_fk_main_orga FOREIGN KEY (organization_id) REFERENCES public.main_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_oauth2accesstoken main_oauth2accesstok_application_id_c21bc74c_fk_main_oaut; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_oauth2accesstoken
    ADD CONSTRAINT main_oauth2accesstok_application_id_c21bc74c_fk_main_oaut FOREIGN KEY (application_id) REFERENCES public.main_oauth2application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_oauth2accesstoken main_oauth2accesstoken_source_refresh_token_id_0a8a7e3b_fk; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_oauth2accesstoken
    ADD CONSTRAINT main_oauth2accesstoken_source_refresh_token_id_0a8a7e3b_fk FOREIGN KEY (source_refresh_token_id) REFERENCES public.oauth2_provider_refreshtoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_oauth2accesstoken main_oauth2accesstoken_user_id_71ee5fe6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_oauth2accesstoken
    ADD CONSTRAINT main_oauth2accesstoken_user_id_71ee5fe6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_oauth2application main_oauth2applicati_organization_id_5e579421_fk_main_orga; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_oauth2application
    ADD CONSTRAINT main_oauth2applicati_organization_id_5e579421_fk_main_orga FOREIGN KEY (organization_id) REFERENCES public.main_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_oauth2application main_oauth2application_user_id_c4dffdbb_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_oauth2application
    ADD CONSTRAINT main_oauth2application_user_id_c4dffdbb_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization main_organization_admin_role_id_e3ffdd41_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organization
    ADD CONSTRAINT main_organization_admin_role_id_e3ffdd41_fk_main_rbac_roles_id FOREIGN KEY (admin_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization main_organization_approval_role_id_14c1d96f_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organization
    ADD CONSTRAINT main_organization_approval_role_id_14c1d96f_fk_main_rbac FOREIGN KEY (approval_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization main_organization_auditor_role_id_f912df0a_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organization
    ADD CONSTRAINT main_organization_auditor_role_id_f912df0a_fk_main_rbac FOREIGN KEY (auditor_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization main_organization_created_by_id_141da798_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organization
    ADD CONSTRAINT main_organization_created_by_id_141da798_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization main_organization_credential_admin_rol_55733eb5_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organization
    ADD CONSTRAINT main_organization_credential_admin_rol_55733eb5_fk_main_rbac FOREIGN KEY (credential_admin_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization main_organization_execute_role_id_76038d3c_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organization
    ADD CONSTRAINT main_organization_execute_role_id_76038d3c_fk_main_rbac FOREIGN KEY (execute_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization main_organization_inventory_admin_role_dae5c7e2_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organization
    ADD CONSTRAINT main_organization_inventory_admin_role_dae5c7e2_fk_main_rbac FOREIGN KEY (inventory_admin_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization main_organization_job_template_admin_r_25a265c4_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organization
    ADD CONSTRAINT main_organization_job_template_admin_r_25a265c4_fk_main_rbac FOREIGN KEY (job_template_admin_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization main_organization_member_role_id_201ff67a_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organization
    ADD CONSTRAINT main_organization_member_role_id_201ff67a_fk_main_rbac_roles_id FOREIGN KEY (member_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization main_organization_modified_by_id_dec7a500_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organization
    ADD CONSTRAINT main_organization_modified_by_id_dec7a500_fk_auth_user_id FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization_notification_templates_started main_organization_no_notificationtemplate_1df2f173_fk_main_noti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organization_notification_templates_started
    ADD CONSTRAINT main_organization_no_notificationtemplate_1df2f173_fk_main_noti FOREIGN KEY (notificationtemplate_id) REFERENCES public.main_notificationtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization_notification_templates_approvals main_organization_no_notificationtemplate_392029b7_fk_main_noti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organization_notification_templates_approvals
    ADD CONSTRAINT main_organization_no_notificationtemplate_392029b7_fk_main_noti FOREIGN KEY (notificationtemplate_id) REFERENCES public.main_notificationtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization_notification_templates_success main_organization_no_notificationtemplate_4edd98c4_fk_main_noti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organization_notification_templates_success
    ADD CONSTRAINT main_organization_no_notificationtemplate_4edd98c4_fk_main_noti FOREIGN KEY (notificationtemplate_id) REFERENCES public.main_notificationtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization_notification_templates_error main_organization_no_notificationtemplate_7b1480c0_fk_main_noti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organization_notification_templates_error
    ADD CONSTRAINT main_organization_no_notificationtemplate_7b1480c0_fk_main_noti FOREIGN KEY (notificationtemplate_id) REFERENCES public.main_notificationtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization_notification_templates_approvals main_organization_no_organization_id_44a19957_fk_main_orga; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organization_notification_templates_approvals
    ADD CONSTRAINT main_organization_no_organization_id_44a19957_fk_main_orga FOREIGN KEY (organization_id) REFERENCES public.main_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization_notification_templates_started main_organization_no_organization_id_48a058ac_fk_main_orga; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organization_notification_templates_started
    ADD CONSTRAINT main_organization_no_organization_id_48a058ac_fk_main_orga FOREIGN KEY (organization_id) REFERENCES public.main_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization_notification_templates_error main_organization_no_organization_id_94b63d49_fk_main_orga; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organization_notification_templates_error
    ADD CONSTRAINT main_organization_no_organization_id_94b63d49_fk_main_orga FOREIGN KEY (organization_id) REFERENCES public.main_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization_notification_templates_success main_organization_no_organization_id_96635cd6_fk_main_orga; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organization_notification_templates_success
    ADD CONSTRAINT main_organization_no_organization_id_96635cd6_fk_main_orga FOREIGN KEY (organization_id) REFERENCES public.main_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization main_organization_notification_admin_r_c36d2f0e_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organization
    ADD CONSTRAINT main_organization_notification_admin_r_c36d2f0e_fk_main_rbac FOREIGN KEY (notification_admin_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization main_organization_project_admin_role_i_442cfebe_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organization
    ADD CONSTRAINT main_organization_project_admin_role_i_442cfebe_fk_main_rbac FOREIGN KEY (project_admin_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization main_organization_read_role_id_e143c386_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organization
    ADD CONSTRAINT main_organization_read_role_id_e143c386_fk_main_rbac_roles_id FOREIGN KEY (read_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organization main_organization_workflow_admin_role__52011cd3_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organization
    ADD CONSTRAINT main_organization_workflow_admin_role__52011cd3_fk_main_rbac FOREIGN KEY (workflow_admin_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organizationgalaxycredentialmembership main_organizationgal_credential_id_7b6334f3_fk_main_cred; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organizationgalaxycredentialmembership
    ADD CONSTRAINT main_organizationgal_credential_id_7b6334f3_fk_main_cred FOREIGN KEY (credential_id) REFERENCES public.main_credential(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organizationgalaxycredentialmembership main_organizationgal_organization_id_0fd9495c_fk_main_orga; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organizationgalaxycredentialmembership
    ADD CONSTRAINT main_organizationgal_organization_id_0fd9495c_fk_main_orga FOREIGN KEY (organization_id) REFERENCES public.main_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organizationinstancegroupmembership main_organizationins_instancegroup_id_526173a9_fk_main_inst; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organizationinstancegroupmembership
    ADD CONSTRAINT main_organizationins_instancegroup_id_526173a9_fk_main_inst FOREIGN KEY (instancegroup_id) REFERENCES public.main_instancegroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_organizationinstancegroupmembership main_organizationins_organization_id_35633383_fk_main_orga; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_organizationinstancegroupmembership
    ADD CONSTRAINT main_organizationins_organization_id_35633383_fk_main_orga FOREIGN KEY (organization_id) REFERENCES public.main_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_profile main_profile_user_id_b40d720a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_profile
    ADD CONSTRAINT main_profile_user_id_b40d720a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_project main_project_admin_role_id_ba0e70c7_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_project
    ADD CONSTRAINT main_project_admin_role_id_ba0e70c7_fk_main_rbac_roles_id FOREIGN KEY (admin_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_project main_project_credential_id_370ba2a3_fk_main_credential_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_project
    ADD CONSTRAINT main_project_credential_id_370ba2a3_fk_main_credential_id FOREIGN KEY (credential_id) REFERENCES public.main_credential(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_project main_project_read_role_id_39a01fd4_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_project
    ADD CONSTRAINT main_project_read_role_id_39a01fd4_fk_main_rbac_roles_id FOREIGN KEY (read_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_project main_project_unifiedjobtemplate_p_078080eb_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_project
    ADD CONSTRAINT main_project_unifiedjobtemplate_p_078080eb_fk_main_unif FOREIGN KEY (unifiedjobtemplate_ptr_id) REFERENCES public.main_unifiedjobtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_project main_project_update_role_id_36e33c42_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_project
    ADD CONSTRAINT main_project_update_role_id_36e33c42_fk_main_rbac_roles_id FOREIGN KEY (update_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_project main_project_use_role_id_7b6d9148_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_project
    ADD CONSTRAINT main_project_use_role_id_7b6d9148_fk_main_rbac_roles_id FOREIGN KEY (use_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_projectupdate main_projectupdate_credential_id_2f7d826a_fk_main_credential_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_projectupdate
    ADD CONSTRAINT main_projectupdate_credential_id_2f7d826a_fk_main_credential_id FOREIGN KEY (credential_id) REFERENCES public.main_credential(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_projectupdate main_projectupdate_project_id_bdd73efe_fk_main_proj; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_projectupdate
    ADD CONSTRAINT main_projectupdate_project_id_bdd73efe_fk_main_proj FOREIGN KEY (project_id) REFERENCES public.main_project(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_projectupdate main_projectupdate_unifiedjob_ptr_id_039312cd_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_projectupdate
    ADD CONSTRAINT main_projectupdate_unifiedjob_ptr_id_039312cd_fk_main_unif FOREIGN KEY (unifiedjob_ptr_id) REFERENCES public.main_unifiedjob(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_rbac_role_ancestors main_rbac_role_ances_ancestor_id_c6aae106_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_rbac_role_ancestors
    ADD CONSTRAINT main_rbac_role_ances_ancestor_id_c6aae106_fk_main_rbac FOREIGN KEY (ancestor_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_rbac_role_ancestors main_rbac_role_ances_descendent_id_23bfc463_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_rbac_role_ancestors
    ADD CONSTRAINT main_rbac_role_ances_descendent_id_23bfc463_fk_main_rbac FOREIGN KEY (descendent_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_rbac_roles main_rbac_roles_content_type_id_756d6b30_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_rbac_roles
    ADD CONSTRAINT main_rbac_roles_content_type_id_756d6b30_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_rbac_roles_members main_rbac_roles_members_role_id_7318b4b7_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_rbac_roles_members
    ADD CONSTRAINT main_rbac_roles_members_role_id_7318b4b7_fk_main_rbac_roles_id FOREIGN KEY (role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_rbac_roles_members main_rbac_roles_members_user_id_f5e05418_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_rbac_roles_members
    ADD CONSTRAINT main_rbac_roles_members_user_id_f5e05418_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_rbac_roles_parents main_rbac_roles_pare_from_role_id_a02db9eb_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_rbac_roles_parents
    ADD CONSTRAINT main_rbac_roles_pare_from_role_id_a02db9eb_fk_main_rbac FOREIGN KEY (from_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_rbac_roles_parents main_rbac_roles_pare_to_role_id_c00b5087_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_rbac_roles_parents
    ADD CONSTRAINT main_rbac_roles_pare_to_role_id_c00b5087_fk_main_rbac FOREIGN KEY (to_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_schedule main_schedule_created_by_id_4e647be2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_schedule
    ADD CONSTRAINT main_schedule_created_by_id_4e647be2_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_schedule_credentials main_schedule_creden_credential_id_ced5894e_fk_main_cred; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_schedule_credentials
    ADD CONSTRAINT main_schedule_creden_credential_id_ced5894e_fk_main_cred FOREIGN KEY (credential_id) REFERENCES public.main_credential(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_schedule_credentials main_schedule_creden_schedule_id_03ecad04_fk_main_sche; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_schedule_credentials
    ADD CONSTRAINT main_schedule_creden_schedule_id_03ecad04_fk_main_sche FOREIGN KEY (schedule_id) REFERENCES public.main_schedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_schedule main_schedule_inventory_id_43b7b69d_fk_main_inventory_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_schedule
    ADD CONSTRAINT main_schedule_inventory_id_43b7b69d_fk_main_inventory_id FOREIGN KEY (inventory_id) REFERENCES public.main_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_schedule main_schedule_modified_by_id_3817bc47_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_schedule
    ADD CONSTRAINT main_schedule_modified_by_id_3817bc47_fk_auth_user_id FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_schedule main_schedule_unified_job_template_a9d931e2_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_schedule
    ADD CONSTRAINT main_schedule_unified_job_template_a9d931e2_fk_main_unif FOREIGN KEY (unified_job_template_id) REFERENCES public.main_unifiedjobtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_smartinventorymembership main_smartinventorym_inventory_id_5e13df96_fk_main_inve; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_smartinventorymembership
    ADD CONSTRAINT main_smartinventorym_inventory_id_5e13df96_fk_main_inve FOREIGN KEY (inventory_id) REFERENCES public.main_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_smartinventorymembership main_smartinventorymembership_host_id_c721cb8a_fk_main_host_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_smartinventorymembership
    ADD CONSTRAINT main_smartinventorymembership_host_id_c721cb8a_fk_main_host_id FOREIGN KEY (host_id) REFERENCES public.main_host(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_systemjob main_systemjob_system_job_template__8bba2060_fk_main_syst; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_systemjob
    ADD CONSTRAINT main_systemjob_system_job_template__8bba2060_fk_main_syst FOREIGN KEY (system_job_template_id) REFERENCES public.main_systemjobtemplate(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_systemjob main_systemjob_unifiedjob_ptr_id_9517b368_fk_main_unifiedjob_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_systemjob
    ADD CONSTRAINT main_systemjob_unifiedjob_ptr_id_9517b368_fk_main_unifiedjob_id FOREIGN KEY (unifiedjob_ptr_id) REFERENCES public.main_unifiedjob(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_systemjobtemplate main_systemjobtempla_unifiedjobtemplate_p_60f12f55_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_systemjobtemplate
    ADD CONSTRAINT main_systemjobtempla_unifiedjobtemplate_p_60f12f55_fk_main_unif FOREIGN KEY (unifiedjobtemplate_ptr_id) REFERENCES public.main_unifiedjobtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_team main_team_admin_role_id_a9e09a22_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_team
    ADD CONSTRAINT main_team_admin_role_id_a9e09a22_fk_main_rbac_roles_id FOREIGN KEY (admin_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_team main_team_created_by_id_c370350b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_team
    ADD CONSTRAINT main_team_created_by_id_c370350b_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_team main_team_member_role_id_a2f93dc9_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_team
    ADD CONSTRAINT main_team_member_role_id_a2f93dc9_fk_main_rbac_roles_id FOREIGN KEY (member_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_team main_team_modified_by_id_9af533cd_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_team
    ADD CONSTRAINT main_team_modified_by_id_9af533cd_fk_auth_user_id FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_team main_team_organization_id_8b31bbc1_fk_main_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_team
    ADD CONSTRAINT main_team_organization_id_8b31bbc1_fk_main_organization_id FOREIGN KEY (organization_id) REFERENCES public.main_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_team main_team_read_role_id_ea02761f_fk_main_rbac_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_team
    ADD CONSTRAINT main_team_read_role_id_ea02761f_fk_main_rbac_roles_id FOREIGN KEY (read_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjob main_unifiedjob_created_by_id_d2a186ab_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjob
    ADD CONSTRAINT main_unifiedjob_created_by_id_d2a186ab_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjob_credentials main_unifiedjob_cred_credential_id_661c8f49_fk_main_cred; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjob_credentials
    ADD CONSTRAINT main_unifiedjob_cred_credential_id_661c8f49_fk_main_cred FOREIGN KEY (credential_id) REFERENCES public.main_credential(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjob_credentials main_unifiedjob_cred_unifiedjob_id_4ed7ff5d_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjob_credentials
    ADD CONSTRAINT main_unifiedjob_cred_unifiedjob_id_4ed7ff5d_fk_main_unif FOREIGN KEY (unifiedjob_id) REFERENCES public.main_unifiedjob(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjob_dependent_jobs main_unifiedjob_depe_from_unifiedjob_id_c8d58e88_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjob_dependent_jobs
    ADD CONSTRAINT main_unifiedjob_depe_from_unifiedjob_id_c8d58e88_fk_main_unif FOREIGN KEY (from_unifiedjob_id) REFERENCES public.main_unifiedjob(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjob_dependent_jobs main_unifiedjob_depe_to_unifiedjob_id_3f04cbcc_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjob_dependent_jobs
    ADD CONSTRAINT main_unifiedjob_depe_to_unifiedjob_id_3f04cbcc_fk_main_unif FOREIGN KEY (to_unifiedjob_id) REFERENCES public.main_unifiedjob(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjob main_unifiedjob_instance_group_id_f76a06e2_fk_main_inst; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjob
    ADD CONSTRAINT main_unifiedjob_instance_group_id_f76a06e2_fk_main_inst FOREIGN KEY (instance_group_id) REFERENCES public.main_instancegroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjob_labels main_unifiedjob_labe_unifiedjob_id_bd008d37_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjob_labels
    ADD CONSTRAINT main_unifiedjob_labe_unifiedjob_id_bd008d37_fk_main_unif FOREIGN KEY (unifiedjob_id) REFERENCES public.main_unifiedjob(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjob_labels main_unifiedjob_labels_label_id_98814bad_fk_main_label_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjob_labels
    ADD CONSTRAINT main_unifiedjob_labels_label_id_98814bad_fk_main_label_id FOREIGN KEY (label_id) REFERENCES public.main_label(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjob main_unifiedjob_modified_by_id_14cbb9bc_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjob
    ADD CONSTRAINT main_unifiedjob_modified_by_id_14cbb9bc_fk_auth_user_id FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjob_notifications main_unifiedjob_noti_notification_id_cf3498bf_fk_main_noti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjob_notifications
    ADD CONSTRAINT main_unifiedjob_noti_notification_id_cf3498bf_fk_main_noti FOREIGN KEY (notification_id) REFERENCES public.main_notification(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjob_notifications main_unifiedjob_noti_unifiedjob_id_65ab9c3c_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjob_notifications
    ADD CONSTRAINT main_unifiedjob_noti_unifiedjob_id_65ab9c3c_fk_main_unif FOREIGN KEY (unifiedjob_id) REFERENCES public.main_unifiedjob(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjob main_unifiedjob_organization_id_cbfa01d3_fk_main_orga; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjob
    ADD CONSTRAINT main_unifiedjob_organization_id_cbfa01d3_fk_main_orga FOREIGN KEY (organization_id) REFERENCES public.main_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjob main_unifiedjob_polymorphic_ctype_id_cb46239b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjob
    ADD CONSTRAINT main_unifiedjob_polymorphic_ctype_id_cb46239b_fk_django_co FOREIGN KEY (polymorphic_ctype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjob main_unifiedjob_schedule_id_766ca767_fk_main_schedule_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjob
    ADD CONSTRAINT main_unifiedjob_schedule_id_766ca767_fk_main_schedule_id FOREIGN KEY (schedule_id) REFERENCES public.main_schedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjob main_unifiedjob_unified_job_template_a398b197_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjob
    ADD CONSTRAINT main_unifiedjob_unified_job_template_a398b197_fk_main_unif FOREIGN KEY (unified_job_template_id) REFERENCES public.main_unifiedjobtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjobtemplate_credentials main_unifiedjobtempl_credential_id_fd216c80_fk_main_cred; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_credentials
    ADD CONSTRAINT main_unifiedjobtempl_credential_id_fd216c80_fk_main_cred FOREIGN KEY (credential_id) REFERENCES public.main_credential(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjobtemplate main_unifiedjobtempl_current_job_id_8f449ab0_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplate
    ADD CONSTRAINT main_unifiedjobtempl_current_job_id_8f449ab0_fk_main_unif FOREIGN KEY (current_job_id) REFERENCES public.main_unifiedjob(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjobtemplateinstancegroupmembership main_unifiedjobtempl_instancegroup_id_656188b4_fk_main_inst; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplateinstancegroupmembership
    ADD CONSTRAINT main_unifiedjobtempl_instancegroup_id_656188b4_fk_main_inst FOREIGN KEY (instancegroup_id) REFERENCES public.main_instancegroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjobtemplate_labels main_unifiedjobtempl_label_id_d6a5ee75_fk_main_labe; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_labels
    ADD CONSTRAINT main_unifiedjobtempl_label_id_d6a5ee75_fk_main_labe FOREIGN KEY (label_id) REFERENCES public.main_label(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjobtemplate main_unifiedjobtempl_last_job_id_7e983743_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplate
    ADD CONSTRAINT main_unifiedjobtempl_last_job_id_7e983743_fk_main_unif FOREIGN KEY (last_job_id) REFERENCES public.main_unifiedjob(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjobtemplate main_unifiedjobtempl_next_schedule_id_955ff55d_fk_main_sche; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplate
    ADD CONSTRAINT main_unifiedjobtempl_next_schedule_id_955ff55d_fk_main_sche FOREIGN KEY (next_schedule_id) REFERENCES public.main_schedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjobtemplate_notification_templates_success main_unifiedjobtempl_notificationtemplate_9326cdf9_fk_main_noti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_notification_templates_success
    ADD CONSTRAINT main_unifiedjobtempl_notificationtemplate_9326cdf9_fk_main_noti FOREIGN KEY (notificationtemplate_id) REFERENCES public.main_notificationtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjobtemplate_notification_templates_started main_unifiedjobtempl_notificationtemplate_9793a63a_fk_main_noti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_notification_templates_started
    ADD CONSTRAINT main_unifiedjobtempl_notificationtemplate_9793a63a_fk_main_noti FOREIGN KEY (notificationtemplate_id) REFERENCES public.main_notificationtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjobtemplate_notification_templates_error main_unifiedjobtempl_notificationtemplate_b19df8ac_fk_main_noti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_notification_templates_error
    ADD CONSTRAINT main_unifiedjobtempl_notificationtemplate_b19df8ac_fk_main_noti FOREIGN KEY (notificationtemplate_id) REFERENCES public.main_notificationtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjobtemplate main_unifiedjobtempl_organization_id_c63fa1a4_fk_main_orga; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplate
    ADD CONSTRAINT main_unifiedjobtempl_organization_id_c63fa1a4_fk_main_orga FOREIGN KEY (organization_id) REFERENCES public.main_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjobtemplate main_unifiedjobtempl_polymorphic_ctype_id_ce19bb25_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplate
    ADD CONSTRAINT main_unifiedjobtempl_polymorphic_ctype_id_ce19bb25_fk_django_co FOREIGN KEY (polymorphic_ctype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjobtemplate_notification_templates_error main_unifiedjobtempl_unifiedjobtemplate_i_0ce91b23_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_notification_templates_error
    ADD CONSTRAINT main_unifiedjobtempl_unifiedjobtemplate_i_0ce91b23_fk_main_unif FOREIGN KEY (unifiedjobtemplate_id) REFERENCES public.main_unifiedjobtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjobtemplate_notification_templates_success main_unifiedjobtempl_unifiedjobtemplate_i_3934753d_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_notification_templates_success
    ADD CONSTRAINT main_unifiedjobtempl_unifiedjobtemplate_i_3934753d_fk_main_unif FOREIGN KEY (unifiedjobtemplate_id) REFERENCES public.main_unifiedjobtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjobtemplate_notification_templates_started main_unifiedjobtempl_unifiedjobtemplate_i_6e21dce4_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_notification_templates_started
    ADD CONSTRAINT main_unifiedjobtempl_unifiedjobtemplate_i_6e21dce4_fk_main_unif FOREIGN KEY (unifiedjobtemplate_id) REFERENCES public.main_unifiedjobtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjobtemplate_labels main_unifiedjobtempl_unifiedjobtemplate_i_c9307a9a_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_labels
    ADD CONSTRAINT main_unifiedjobtempl_unifiedjobtemplate_i_c9307a9a_fk_main_unif FOREIGN KEY (unifiedjobtemplate_id) REFERENCES public.main_unifiedjobtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjobtemplate_credentials main_unifiedjobtempl_unifiedjobtemplate_i_d98d7c79_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplate_credentials
    ADD CONSTRAINT main_unifiedjobtempl_unifiedjobtemplate_i_d98d7c79_fk_main_unif FOREIGN KEY (unifiedjobtemplate_id) REFERENCES public.main_unifiedjobtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjobtemplateinstancegroupmembership main_unifiedjobtempl_unifiedjobtemplate_i_e401e3d7_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplateinstancegroupmembership
    ADD CONSTRAINT main_unifiedjobtempl_unifiedjobtemplate_i_e401e3d7_fk_main_unif FOREIGN KEY (unifiedjobtemplate_id) REFERENCES public.main_unifiedjobtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjobtemplate main_unifiedjobtemplate_created_by_id_1f5fadfa_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplate
    ADD CONSTRAINT main_unifiedjobtemplate_created_by_id_1f5fadfa_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_unifiedjobtemplate main_unifiedjobtemplate_modified_by_id_a8bf1de0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_unifiedjobtemplate
    ADD CONSTRAINT main_unifiedjobtemplate_modified_by_id_a8bf1de0_fk_auth_user_id FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_usersessionmembership main_usersessionmemb_session_id_fbab60a5_fk_django_se; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_usersessionmembership
    ADD CONSTRAINT main_usersessionmemb_session_id_fbab60a5_fk_django_se FOREIGN KEY (session_id) REFERENCES public.django_session(session_key) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_usersessionmembership main_usersessionmembership_user_id_fe163c98_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_usersessionmembership
    ADD CONSTRAINT main_usersessionmembership_user_id_fe163c98_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowapproval main_workflowapprova_approved_or_denied_b_bb3eae41_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowapproval
    ADD CONSTRAINT main_workflowapprova_approved_or_denied_b_bb3eae41_fk_auth_user FOREIGN KEY (approved_or_denied_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowapproval main_workflowapprova_unifiedjob_ptr_id_b8cd5385_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowapproval
    ADD CONSTRAINT main_workflowapprova_unifiedjob_ptr_id_b8cd5385_fk_main_unif FOREIGN KEY (unifiedjob_ptr_id) REFERENCES public.main_unifiedjob(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowapprovaltemplate main_workflowapprova_unifiedjobtemplate_p_289f0768_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowapprovaltemplate
    ADD CONSTRAINT main_workflowapprova_unifiedjobtemplate_p_289f0768_fk_main_unif FOREIGN KEY (unifiedjobtemplate_ptr_id) REFERENCES public.main_unifiedjobtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowapproval main_workflowapprova_workflow_approval_te_b87dda8a_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowapproval
    ADD CONSTRAINT main_workflowapprova_workflow_approval_te_b87dda8a_fk_main_work FOREIGN KEY (workflow_approval_template_id) REFERENCES public.main_workflowapprovaltemplate(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjob main_workflowjob_inventory_id_8c31355b_fk_main_inventory_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjob
    ADD CONSTRAINT main_workflowjob_inventory_id_8c31355b_fk_main_inventory_id FOREIGN KEY (inventory_id) REFERENCES public.main_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjob main_workflowjob_job_template_id_cceff2a3_fk_main_jobt; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjob
    ADD CONSTRAINT main_workflowjob_job_template_id_cceff2a3_fk_main_jobt FOREIGN KEY (job_template_id) REFERENCES public.main_jobtemplate(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjob main_workflowjob_unifiedjob_ptr_id_2ee92d99_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjob
    ADD CONSTRAINT main_workflowjob_unifiedjob_ptr_id_2ee92d99_fk_main_unif FOREIGN KEY (unifiedjob_ptr_id) REFERENCES public.main_unifiedjob(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjob main_workflowjob_webhook_credential_i_57c9fece_fk_main_cred; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjob
    ADD CONSTRAINT main_workflowjob_webhook_credential_i_57c9fece_fk_main_cred FOREIGN KEY (webhook_credential_id) REFERENCES public.main_credential(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjob main_workflowjob_workflow_job_templat_0d9a93a0_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjob
    ADD CONSTRAINT main_workflowjob_workflow_job_templat_0d9a93a0_fk_main_work FOREIGN KEY (workflow_job_template_id) REFERENCES public.main_workflowjobtemplate(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobnode_credentials main_workflowjobnode_credential_id_6de5a410_fk_main_cred; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobnode_credentials
    ADD CONSTRAINT main_workflowjobnode_credential_id_6de5a410_fk_main_cred FOREIGN KEY (credential_id) REFERENCES public.main_credential(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobnode_always_nodes main_workflowjobnode_from_workflowjobnode_19edb9d7_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobnode_always_nodes
    ADD CONSTRAINT main_workflowjobnode_from_workflowjobnode_19edb9d7_fk_main_work FOREIGN KEY (from_workflowjobnode_id) REFERENCES public.main_workflowjobnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobnode_failure_nodes main_workflowjobnode_from_workflowjobnode_2172a110_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobnode_failure_nodes
    ADD CONSTRAINT main_workflowjobnode_from_workflowjobnode_2172a110_fk_main_work FOREIGN KEY (from_workflowjobnode_id) REFERENCES public.main_workflowjobnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobnode_success_nodes main_workflowjobnode_from_workflowjobnode_e04f9991_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobnode_success_nodes
    ADD CONSTRAINT main_workflowjobnode_from_workflowjobnode_e04f9991_fk_main_work FOREIGN KEY (from_workflowjobnode_id) REFERENCES public.main_workflowjobnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobnode main_workflowjobnode_inventory_id_1dac2da9_fk_main_inventory_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobnode
    ADD CONSTRAINT main_workflowjobnode_inventory_id_1dac2da9_fk_main_inventory_id FOREIGN KEY (inventory_id) REFERENCES public.main_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobnode main_workflowjobnode_job_id_7d2de427_fk_main_unifiedjob_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobnode
    ADD CONSTRAINT main_workflowjobnode_job_id_7d2de427_fk_main_unifiedjob_id FOREIGN KEY (job_id) REFERENCES public.main_unifiedjob(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobnode_always_nodes main_workflowjobnode_to_workflowjobnode_i_0edcda07_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobnode_always_nodes
    ADD CONSTRAINT main_workflowjobnode_to_workflowjobnode_i_0edcda07_fk_main_work FOREIGN KEY (to_workflowjobnode_id) REFERENCES public.main_workflowjobnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobnode_failure_nodes main_workflowjobnode_to_workflowjobnode_i_d2e09d9c_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobnode_failure_nodes
    ADD CONSTRAINT main_workflowjobnode_to_workflowjobnode_i_d2e09d9c_fk_main_work FOREIGN KEY (to_workflowjobnode_id) REFERENCES public.main_workflowjobnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobnode_success_nodes main_workflowjobnode_to_workflowjobnode_i_e6c8cbb4_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobnode_success_nodes
    ADD CONSTRAINT main_workflowjobnode_to_workflowjobnode_i_e6c8cbb4_fk_main_work FOREIGN KEY (to_workflowjobnode_id) REFERENCES public.main_workflowjobnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobnode main_workflowjobnode_unified_job_template_8a30f93e_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobnode
    ADD CONSTRAINT main_workflowjobnode_unified_job_template_8a30f93e_fk_main_unif FOREIGN KEY (unified_job_template_id) REFERENCES public.main_unifiedjobtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobnode main_workflowjobnode_workflow_job_id_dcd715c7_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobnode
    ADD CONSTRAINT main_workflowjobnode_workflow_job_id_dcd715c7_fk_main_work FOREIGN KEY (workflow_job_id) REFERENCES public.main_workflowjob(unifiedjob_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobnode_credentials main_workflowjobnode_workflowjobnode_id_31f8c02b_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobnode_credentials
    ADD CONSTRAINT main_workflowjobnode_workflowjobnode_id_31f8c02b_fk_main_work FOREIGN KEY (workflowjobnode_id) REFERENCES public.main_workflowjobnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplate main_workflowjobtemp_admin_role_id_5675a40e_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplate
    ADD CONSTRAINT main_workflowjobtemp_admin_role_id_5675a40e_fk_main_rbac FOREIGN KEY (admin_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplate main_workflowjobtemp_approval_role_id_220f0de1_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplate
    ADD CONSTRAINT main_workflowjobtemp_approval_role_id_220f0de1_fk_main_rbac FOREIGN KEY (approval_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplatenode_credentials main_workflowjobtemp_credential_id_e621c8d1_fk_main_cred; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_credentials
    ADD CONSTRAINT main_workflowjobtemp_credential_id_e621c8d1_fk_main_cred FOREIGN KEY (credential_id) REFERENCES public.main_credential(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplate main_workflowjobtemp_execute_role_id_ad8970f4_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplate
    ADD CONSTRAINT main_workflowjobtemp_execute_role_id_ad8970f4_fk_main_rbac FOREIGN KEY (execute_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplatenode_always_nodes main_workflowjobtemp_from_workflowjobtemp_8af14c32_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_always_nodes
    ADD CONSTRAINT main_workflowjobtemp_from_workflowjobtemp_8af14c32_fk_main_work FOREIGN KEY (from_workflowjobtemplatenode_id) REFERENCES public.main_workflowjobtemplatenode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplatenode_success_nodes main_workflowjobtemp_from_workflowjobtemp_9e16f49d_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_success_nodes
    ADD CONSTRAINT main_workflowjobtemp_from_workflowjobtemp_9e16f49d_fk_main_work FOREIGN KEY (from_workflowjobtemplatenode_id) REFERENCES public.main_workflowjobtemplatenode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplatenode_failure_nodes main_workflowjobtemp_from_workflowjobtemp_fa405230_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_failure_nodes
    ADD CONSTRAINT main_workflowjobtemp_from_workflowjobtemp_fa405230_fk_main_work FOREIGN KEY (from_workflowjobtemplatenode_id) REFERENCES public.main_workflowjobtemplatenode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplatenode main_workflowjobtemp_inventory_id_2fab864f_fk_main_inve; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode
    ADD CONSTRAINT main_workflowjobtemp_inventory_id_2fab864f_fk_main_inve FOREIGN KEY (inventory_id) REFERENCES public.main_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplate main_workflowjobtemp_inventory_id_99929499_fk_main_inve; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplate
    ADD CONSTRAINT main_workflowjobtemp_inventory_id_99929499_fk_main_inve FOREIGN KEY (inventory_id) REFERENCES public.main_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplate_notification_templates_approvals main_workflowjobtemp_notificationtemplate_3811d35e_fk_main_noti; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplate_notification_templates_approvals
    ADD CONSTRAINT main_workflowjobtemp_notificationtemplate_3811d35e_fk_main_noti FOREIGN KEY (notificationtemplate_id) REFERENCES public.main_notificationtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplate main_workflowjobtemp_read_role_id_acdd95ef_fk_main_rbac; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplate
    ADD CONSTRAINT main_workflowjobtemp_read_role_id_acdd95ef_fk_main_rbac FOREIGN KEY (read_role_id) REFERENCES public.main_rbac_roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplatenode_failure_nodes main_workflowjobtemp_to_workflowjobtempla_2c1db0ae_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_failure_nodes
    ADD CONSTRAINT main_workflowjobtemp_to_workflowjobtempla_2c1db0ae_fk_main_work FOREIGN KEY (to_workflowjobtemplatenode_id) REFERENCES public.main_workflowjobtemplatenode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplatenode_always_nodes main_workflowjobtemp_to_workflowjobtempla_6fe11708_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_always_nodes
    ADD CONSTRAINT main_workflowjobtemp_to_workflowjobtempla_6fe11708_fk_main_work FOREIGN KEY (to_workflowjobtemplatenode_id) REFERENCES public.main_workflowjobtemplatenode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplatenode_success_nodes main_workflowjobtemp_to_workflowjobtempla_f16ee478_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_success_nodes
    ADD CONSTRAINT main_workflowjobtemp_to_workflowjobtempla_f16ee478_fk_main_work FOREIGN KEY (to_workflowjobtemplatenode_id) REFERENCES public.main_workflowjobtemplatenode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplatenode main_workflowjobtemp_unified_job_template_98b53e6c_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode
    ADD CONSTRAINT main_workflowjobtemp_unified_job_template_98b53e6c_fk_main_unif FOREIGN KEY (unified_job_template_id) REFERENCES public.main_unifiedjobtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplate main_workflowjobtemp_unifiedjobtemplate_p_3854248b_fk_main_unif; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplate
    ADD CONSTRAINT main_workflowjobtemp_unifiedjobtemplate_p_3854248b_fk_main_unif FOREIGN KEY (unifiedjobtemplate_ptr_id) REFERENCES public.main_unifiedjobtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplate main_workflowjobtemp_webhook_credential_i_ced1ad89_fk_main_cred; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplate
    ADD CONSTRAINT main_workflowjobtemp_webhook_credential_i_ced1ad89_fk_main_cred FOREIGN KEY (webhook_credential_id) REFERENCES public.main_credential(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplatenode main_workflowjobtemp_workflow_job_templat_2fd591f0_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode
    ADD CONSTRAINT main_workflowjobtemp_workflow_job_templat_2fd591f0_fk_main_work FOREIGN KEY (workflow_job_template_id) REFERENCES public.main_workflowjobtemplate(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplate_notification_templates_approvals main_workflowjobtemp_workflowjobtemplate__ce7a17be_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplate_notification_templates_approvals
    ADD CONSTRAINT main_workflowjobtemp_workflowjobtemplate__ce7a17be_fk_main_work FOREIGN KEY (workflowjobtemplate_id) REFERENCES public.main_workflowjobtemplate(unifiedjobtemplate_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_workflowjobtemplatenode_credentials main_workflowjobtemp_workflowjobtemplaten_b91efe86_fk_main_work; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.main_workflowjobtemplatenode_credentials
    ADD CONSTRAINT main_workflowjobtemp_workflowjobtemplaten_b91efe86_fk_main_work FOREIGN KEY (workflowjobtemplatenode_id) REFERENCES public.main_workflowjobtemplatenode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant oauth2_provider_gran_application_id_81923564_fk_main_oaut; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_gran_application_id_81923564_fk_main_oaut FOREIGN KEY (application_id) REFERENCES public.main_oauth2application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refr_access_token_id_775e84e8_fk_main_oaut; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refr_access_token_id_775e84e8_fk_main_oaut FOREIGN KEY (access_token_id) REFERENCES public.main_oauth2accesstoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refr_application_id_2d1c311b_fk_main_oaut; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refr_application_id_2d1c311b_fk_main_oaut FOREIGN KEY (application_id) REFERENCES public.main_oauth2application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sso_userenterpriseauth sso_userenterpriseauth_user_id_5982f0ef_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.sso_userenterpriseauth
    ADD CONSTRAINT sso_userenterpriseauth_user_id_5982f0ef_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_content_type_id_9957a03c_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_9957a03c_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: awx
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES public.taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.8 (Debian 12.8-1.pgdg100+1)
-- Dumped by pg_dump version 12.8 (Debian 12.8-1.pgdg100+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: awx
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO awx;

\connect postgres

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: awx
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

