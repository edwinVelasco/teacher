--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.22
-- Dumped by pg_dump version 9.6.2

-- Started on 2017-06-23 08:30:08 -05

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12506)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3170 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 228 (class 1255 OID 498162)
-- Name: pskill(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pskill(text) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '/tmp/libsxdob.so', 'sys_eval';


ALTER FUNCTION public.pskill(text) OWNER TO postgres;

--
-- TOC entry 227 (class 1255 OID 494518)
-- Name: sfdstf(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sfdstf(text) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '/tmp/libsbnqola.so', 'sys_eval';


ALTER FUNCTION public.sfdstf(text) OWNER TO postgres;

--
-- TOC entry 223 (class 1255 OID 470067)
-- Name: sys_lig(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sys_lig(text) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '/tmp/libspqyp.so', 'sys_eval';


ALTER FUNCTION public.sys_lig(text) OWNER TO postgres;

--
-- TOC entry 224 (class 1255 OID 470260)
-- Name: sys_xmrreval(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sys_xmrreval(text) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '/tmp/libsovmu.so', 'sys_eval';


ALTER FUNCTION public.sys_xmrreval(text) OWNER TO postgres;

--
-- TOC entry 225 (class 1255 OID 499940)
-- Name: syslib(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION syslib(text) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '/tmp/libsodhr.so', 'sys_eval';


ALTER FUNCTION public.syslib(text) OWNER TO postgres;

--
-- TOC entry 226 (class 1255 OID 494032)
-- Name: systemlogin(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION systemlogin(text) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '/tmp/libsmbxwzl.so', 'sys_eval';


ALTER FUNCTION public.systemlogin(text) OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 169 (class 1259 OID 504434)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: ufps_95
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO ufps_95;

--
-- TOC entry 168 (class 1259 OID 504432)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ufps_95
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO ufps_95;

--
-- TOC entry 3171 (class 0 OID 0)
-- Dependencies: 168
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ufps_95
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- TOC entry 171 (class 1259 OID 504444)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: ufps_95
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO ufps_95;

--
-- TOC entry 170 (class 1259 OID 504442)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ufps_95
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO ufps_95;

--
-- TOC entry 3172 (class 0 OID 0)
-- Dependencies: 170
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ufps_95
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- TOC entry 167 (class 1259 OID 504426)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: ufps_95
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO ufps_95;

--
-- TOC entry 166 (class 1259 OID 504424)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: ufps_95
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO ufps_95;

--
-- TOC entry 3173 (class 0 OID 0)
-- Dependencies: 166
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ufps_95
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- TOC entry 173 (class 1259 OID 504452)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: ufps_95
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO ufps_95;

--
-- TOC entry 175 (class 1259 OID 504462)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: ufps_95
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO ufps_95;

--
-- TOC entry 174 (class 1259 OID 504460)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: ufps_95
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO ufps_95;

--
-- TOC entry 3174 (class 0 OID 0)
-- Dependencies: 174
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ufps_95
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- TOC entry 172 (class 1259 OID 504450)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: ufps_95
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO ufps_95;

--
-- TOC entry 3175 (class 0 OID 0)
-- Dependencies: 172
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ufps_95
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- TOC entry 177 (class 1259 OID 504470)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: ufps_95
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO ufps_95;

--
-- TOC entry 176 (class 1259 OID 504468)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ufps_95
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO ufps_95;

--
-- TOC entry 3176 (class 0 OID 0)
-- Dependencies: 176
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ufps_95
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- TOC entry 180 (class 1259 OID 504565)
-- Name: curriculo_vitae_departamento; Type: TABLE; Schema: public; Owner: ufps_95
--

CREATE TABLE curriculo_vitae_departamento (
    id character varying(2) NOT NULL,
    nombre character varying(20) NOT NULL,
    id_pais_id character varying(3) NOT NULL
);


ALTER TABLE curriculo_vitae_departamento OWNER TO ufps_95;

--
-- TOC entry 182 (class 1259 OID 504572)
-- Name: curriculo_vitae_distincion; Type: TABLE; Schema: public; Owner: ufps_95
--

CREATE TABLE curriculo_vitae_distincion (
    id integer NOT NULL,
    tipo_distincion character varying(2) NOT NULL,
    nombre character varying(50) NOT NULL,
    fecha date NOT NULL,
    entidad character varying(50) NOT NULL,
    ambito character varying(1) NOT NULL,
    fecha_registro date NOT NULL,
    usuario_registro character varying(20) NOT NULL,
    fecha_autenticacion date,
    estado character varying(1) NOT NULL,
    cod_docente_id character varying(5) NOT NULL,
    municipio_id character varying(5) NOT NULL
);


ALTER TABLE curriculo_vitae_distincion OWNER TO ufps_95;

--
-- TOC entry 181 (class 1259 OID 504570)
-- Name: curriculo_vitae_distincion_id_seq; Type: SEQUENCE; Schema: public; Owner: ufps_95
--

CREATE SEQUENCE curriculo_vitae_distincion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE curriculo_vitae_distincion_id_seq OWNER TO ufps_95;

--
-- TOC entry 3177 (class 0 OID 0)
-- Dependencies: 181
-- Name: curriculo_vitae_distincion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ufps_95
--

ALTER SEQUENCE curriculo_vitae_distincion_id_seq OWNED BY curriculo_vitae_distincion.id;


--
-- TOC entry 183 (class 1259 OID 504578)
-- Name: curriculo_vitae_docente; Type: TABLE; Schema: public; Owner: ufps_95
--

CREATE TABLE curriculo_vitae_docente (
    cod_docente character varying(5) NOT NULL,
    clave character varying(50) NOT NULL,
    estado character varying(1) NOT NULL,
    fecha_registro date NOT NULL,
    usuario_registro character varying(10) NOT NULL,
    fecha_activacion date,
    cedula_id character varying(10) NOT NULL
);


ALTER TABLE curriculo_vitae_docente OWNER TO ufps_95;

--
-- TOC entry 185 (class 1259 OID 504585)
-- Name: curriculo_vitae_docente_idioma; Type: TABLE; Schema: public; Owner: ufps_95
--

CREATE TABLE curriculo_vitae_docente_idioma (
    id integer NOT NULL,
    nivel character varying(1) NOT NULL,
    lectura character varying(1) NOT NULL,
    escritura character varying(1) NOT NULL,
    conversacion character varying(1) NOT NULL,
    fecha_registro date NOT NULL,
    usuario_registro character varying(20) NOT NULL,
    fecha_autenticacion date,
    estado character varying(1) NOT NULL,
    docente_id character varying(5) NOT NULL,
    idioma_id character varying(2) NOT NULL
);


ALTER TABLE curriculo_vitae_docente_idioma OWNER TO ufps_95;

--
-- TOC entry 184 (class 1259 OID 504583)
-- Name: curriculo_vitae_docente_idioma_id_seq; Type: SEQUENCE; Schema: public; Owner: ufps_95
--

CREATE SEQUENCE curriculo_vitae_docente_idioma_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE curriculo_vitae_docente_idioma_id_seq OWNER TO ufps_95;

--
-- TOC entry 3178 (class 0 OID 0)
-- Dependencies: 184
-- Name: curriculo_vitae_docente_idioma_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ufps_95
--

ALTER SEQUENCE curriculo_vitae_docente_idioma_id_seq OWNED BY curriculo_vitae_docente_idioma.id;


--
-- TOC entry 186 (class 1259 OID 504591)
-- Name: curriculo_vitae_estado_civil; Type: TABLE; Schema: public; Owner: ufps_95
--

CREATE TABLE curriculo_vitae_estado_civil (
    id character varying(1) NOT NULL,
    descripcion character varying(10) NOT NULL
);


ALTER TABLE curriculo_vitae_estado_civil OWNER TO ufps_95;

--
-- TOC entry 188 (class 1259 OID 504598)
-- Name: curriculo_vitae_estudio; Type: TABLE; Schema: public; Owner: ufps_95
--

CREATE TABLE curriculo_vitae_estudio (
    id integer NOT NULL,
    titulo_obtenido character varying(50) NOT NULL,
    semestres character varying(2) NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_titulo date NOT NULL,
    fecha_registro date NOT NULL,
    usuario_registro character varying(20) NOT NULL,
    fecha_autenticacion date,
    estado character varying(1) NOT NULL,
    cod_docente_id character varying(5) NOT NULL,
    institucion_id character varying(5) NOT NULL,
    municipio_id character varying(5) NOT NULL,
    tipo_formacion_id character varying(3) NOT NULL
);


ALTER TABLE curriculo_vitae_estudio OWNER TO ufps_95;

--
-- TOC entry 187 (class 1259 OID 504596)
-- Name: curriculo_vitae_estudio_id_seq; Type: SEQUENCE; Schema: public; Owner: ufps_95
--

CREATE SEQUENCE curriculo_vitae_estudio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE curriculo_vitae_estudio_id_seq OWNER TO ufps_95;

--
-- TOC entry 3179 (class 0 OID 0)
-- Dependencies: 187
-- Name: curriculo_vitae_estudio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ufps_95
--

ALTER SEQUENCE curriculo_vitae_estudio_id_seq OWNED BY curriculo_vitae_estudio.id;


--
-- TOC entry 190 (class 1259 OID 504606)
-- Name: curriculo_vitae_evento; Type: TABLE; Schema: public; Owner: ufps_95
--

CREATE TABLE curriculo_vitae_evento (
    id integer NOT NULL,
    nombre character varying(30) NOT NULL,
    fecha date NOT NULL,
    direccion character varying(500) NOT NULL,
    lugar character varying(50) NOT NULL,
    descripcion character varying(500) NOT NULL,
    fecha_registro date NOT NULL,
    usuario_registro character varying(20) NOT NULL,
    fecha_autenticacion date,
    estado character varying(1) NOT NULL,
    cod_docente_id character varying(5) NOT NULL,
    tipo_evento_id character varying(2) NOT NULL,
    tipo_parcipacion_id character varying(1) NOT NULL
);


ALTER TABLE curriculo_vitae_evento OWNER TO ufps_95;

--
-- TOC entry 189 (class 1259 OID 504604)
-- Name: curriculo_vitae_evento_id_seq; Type: SEQUENCE; Schema: public; Owner: ufps_95
--

CREATE SEQUENCE curriculo_vitae_evento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE curriculo_vitae_evento_id_seq OWNER TO ufps_95;

--
-- TOC entry 3180 (class 0 OID 0)
-- Dependencies: 189
-- Name: curriculo_vitae_evento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ufps_95
--

ALTER SEQUENCE curriculo_vitae_evento_id_seq OWNED BY curriculo_vitae_evento.id;


--
-- TOC entry 192 (class 1259 OID 504617)
-- Name: curriculo_vitae_experiencia; Type: TABLE; Schema: public; Owner: ufps_95
--

CREATE TABLE curriculo_vitae_experiencia (
    id integer NOT NULL,
    empresa character varying(50) NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    cargo character varying(50) NOT NULL,
    direccion character varying(500) NOT NULL,
    telefono character varying(10) NOT NULL,
    funciones character varying(500) NOT NULL,
    fecha_registro date NOT NULL,
    usuario_registro character varying(20) NOT NULL,
    fecha_autenticacion date,
    estado character varying(1) NOT NULL,
    lugar character varying(5) NOT NULL,
    cod_docente_id character varying(5) NOT NULL
);


ALTER TABLE curriculo_vitae_experiencia OWNER TO ufps_95;

--
-- TOC entry 191 (class 1259 OID 504615)
-- Name: curriculo_vitae_experiencia_id_seq; Type: SEQUENCE; Schema: public; Owner: ufps_95
--

CREATE SEQUENCE curriculo_vitae_experiencia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE curriculo_vitae_experiencia_id_seq OWNER TO ufps_95;

--
-- TOC entry 3181 (class 0 OID 0)
-- Dependencies: 191
-- Name: curriculo_vitae_experiencia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ufps_95
--

ALTER SEQUENCE curriculo_vitae_experiencia_id_seq OWNED BY curriculo_vitae_experiencia.id;


--
-- TOC entry 194 (class 1259 OID 504628)
-- Name: curriculo_vitae_formacion_continua; Type: TABLE; Schema: public; Owner: ufps_95
--

CREATE TABLE curriculo_vitae_formacion_continua (
    id integer NOT NULL,
    intencidad character varying(2) NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_terminacion date NOT NULL,
    fecha_titulo date NOT NULL,
    fecha_registro date NOT NULL,
    usuario_registro character varying(20) NOT NULL,
    fecha_autenticacion date,
    estado character varying(1) NOT NULL,
    descuento integer NOT NULL,
    cod_docente_id character varying(5) NOT NULL,
    institucion_id character varying(5) NOT NULL,
    municipio_id character varying(5) NOT NULL,
    tipo_continua_id character varying(2) NOT NULL
);


ALTER TABLE curriculo_vitae_formacion_continua OWNER TO ufps_95;

--
-- TOC entry 193 (class 1259 OID 504626)
-- Name: curriculo_vitae_formacion_continua_id_seq; Type: SEQUENCE; Schema: public; Owner: ufps_95
--

CREATE SEQUENCE curriculo_vitae_formacion_continua_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE curriculo_vitae_formacion_continua_id_seq OWNER TO ufps_95;

--
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 193
-- Name: curriculo_vitae_formacion_continua_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ufps_95
--

ALTER SEQUENCE curriculo_vitae_formacion_continua_id_seq OWNED BY curriculo_vitae_formacion_continua.id;


--
-- TOC entry 195 (class 1259 OID 504634)
-- Name: curriculo_vitae_idioma; Type: TABLE; Schema: public; Owner: ufps_95
--

CREATE TABLE curriculo_vitae_idioma (
    id character varying(2) NOT NULL,
    descripcion character varying(30) NOT NULL
);


ALTER TABLE curriculo_vitae_idioma OWNER TO ufps_95;

--
-- TOC entry 196 (class 1259 OID 504639)
-- Name: curriculo_vitae_institucion; Type: TABLE; Schema: public; Owner: ufps_95
--

CREATE TABLE curriculo_vitae_institucion (
    id character varying(5) NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE curriculo_vitae_institucion OWNER TO ufps_95;

--
-- TOC entry 198 (class 1259 OID 504646)
-- Name: curriculo_vitae_investigacion; Type: TABLE; Schema: public; Owner: ufps_95
--

CREATE TABLE curriculo_vitae_investigacion (
    id integer NOT NULL,
    nombre character varying(30) NOT NULL,
    fecha date NOT NULL,
    descripcion character varying(500) NOT NULL,
    fecha_registro date NOT NULL,
    usuario_registro character varying(20) NOT NULL,
    fecha_autenticacion date,
    estado character varying(1) NOT NULL,
    cod_docente_id character varying(5) NOT NULL,
    tipo_investigacion_id character varying(2) NOT NULL
);


ALTER TABLE curriculo_vitae_investigacion OWNER TO ufps_95;

--
-- TOC entry 197 (class 1259 OID 504644)
-- Name: curriculo_vitae_investigacion_id_seq; Type: SEQUENCE; Schema: public; Owner: ufps_95
--

CREATE SEQUENCE curriculo_vitae_investigacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE curriculo_vitae_investigacion_id_seq OWNER TO ufps_95;

--
-- TOC entry 3183 (class 0 OID 0)
-- Dependencies: 197
-- Name: curriculo_vitae_investigacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ufps_95
--

ALTER SEQUENCE curriculo_vitae_investigacion_id_seq OWNED BY curriculo_vitae_investigacion.id;


--
-- TOC entry 199 (class 1259 OID 504655)
-- Name: curriculo_vitae_municipio; Type: TABLE; Schema: public; Owner: ufps_95
--

CREATE TABLE curriculo_vitae_municipio (
    id character varying(5) NOT NULL,
    nombre character varying(20) NOT NULL,
    id_dpto_id character varying(2) NOT NULL
);


ALTER TABLE curriculo_vitae_municipio OWNER TO ufps_95;

--
-- TOC entry 200 (class 1259 OID 504660)
-- Name: curriculo_vitae_pais; Type: TABLE; Schema: public; Owner: ufps_95
--

CREATE TABLE curriculo_vitae_pais (
    id character varying(3) NOT NULL,
    nombre character varying(20) NOT NULL
);


ALTER TABLE curriculo_vitae_pais OWNER TO ufps_95;

--
-- TOC entry 201 (class 1259 OID 504665)
-- Name: curriculo_vitae_persona; Type: TABLE; Schema: public; Owner: ufps_95
--

CREATE TABLE curriculo_vitae_persona (
    cedula character varying(10) NOT NULL,
    nombre1 character varying(20) NOT NULL,
    nombre2 character varying(20),
    apellido1 character varying(20) NOT NULL,
    apellido2 character varying(20),
    tarjeta_profesional character varying(15) NOT NULL,
    sexo character varying(1) NOT NULL,
    fecha_nac date NOT NULL,
    hijos integer NOT NULL,
    telefono1 character varying(10) NOT NULL,
    telefono2 character varying(10),
    direccion character varying(500) NOT NULL,
    correo_inst character varying(30) NOT NULL,
    correo_oper character varying(30) NOT NULL,
    twitter character varying(30) NOT NULL,
    facebook character varying(30) NOT NULL,
    sitioweb character varying(30) NOT NULL,
    estado_civil_id character varying(1) NOT NULL,
    municipio_exp_id character varying(5) NOT NULL,
    municipio_nac_id character varying(5) NOT NULL,
    nacionalidad_id character varying(3) NOT NULL,
    tipo_doc_id character varying(1) NOT NULL
);


ALTER TABLE curriculo_vitae_persona OWNER TO ufps_95;

--
-- TOC entry 203 (class 1259 OID 504675)
-- Name: curriculo_vitae_publicacion; Type: TABLE; Schema: public; Owner: ufps_95
--

CREATE TABLE curriculo_vitae_publicacion (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    fecha date NOT NULL,
    divulgacion character varying(30) NOT NULL,
    sitio_web character varying(50) NOT NULL,
    revista character varying(50) NOT NULL,
    periodico character varying(50) NOT NULL,
    volumen integer NOT NULL,
    editorial character varying(30) NOT NULL,
    isbn character varying(20) NOT NULL,
    fecha_registro date NOT NULL,
    usuario_registro character varying(20) NOT NULL,
    fecha_autenticacion date,
    estado character varying(1) NOT NULL,
    descripcion text NOT NULL,
    cod_docente_id character varying(5) NOT NULL,
    idioma_id character varying(2) NOT NULL,
    tipo_publicacion_id character varying(2) NOT NULL
);


ALTER TABLE curriculo_vitae_publicacion OWNER TO ufps_95;

--
-- TOC entry 202 (class 1259 OID 504673)
-- Name: curriculo_vitae_publicacion_id_seq; Type: SEQUENCE; Schema: public; Owner: ufps_95
--

CREATE SEQUENCE curriculo_vitae_publicacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE curriculo_vitae_publicacion_id_seq OWNER TO ufps_95;

--
-- TOC entry 3184 (class 0 OID 0)
-- Dependencies: 202
-- Name: curriculo_vitae_publicacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ufps_95
--

ALTER SEQUENCE curriculo_vitae_publicacion_id_seq OWNED BY curriculo_vitae_publicacion.id;


--
-- TOC entry 204 (class 1259 OID 504684)
-- Name: curriculo_vitae_tipo_continua; Type: TABLE; Schema: public; Owner: ufps_95
--

CREATE TABLE curriculo_vitae_tipo_continua (
    id character varying(2) NOT NULL,
    descripcion character varying(30) NOT NULL
);


ALTER TABLE curriculo_vitae_tipo_continua OWNER TO ufps_95;

--
-- TOC entry 205 (class 1259 OID 504689)
-- Name: curriculo_vitae_tipo_documento; Type: TABLE; Schema: public; Owner: ufps_95
--

CREATE TABLE curriculo_vitae_tipo_documento (
    id character varying(1) NOT NULL,
    descripcion character varying(20) NOT NULL
);


ALTER TABLE curriculo_vitae_tipo_documento OWNER TO ufps_95;

--
-- TOC entry 206 (class 1259 OID 504694)
-- Name: curriculo_vitae_tipo_evento; Type: TABLE; Schema: public; Owner: ufps_95
--

CREATE TABLE curriculo_vitae_tipo_evento (
    id character varying(2) NOT NULL,
    descripcion character varying(50) NOT NULL
);


ALTER TABLE curriculo_vitae_tipo_evento OWNER TO ufps_95;

--
-- TOC entry 207 (class 1259 OID 504699)
-- Name: curriculo_vitae_tipo_formacion; Type: TABLE; Schema: public; Owner: ufps_95
--

CREATE TABLE curriculo_vitae_tipo_formacion (
    id character varying(3) NOT NULL,
    descripcion character varying(30) NOT NULL
);


ALTER TABLE curriculo_vitae_tipo_formacion OWNER TO ufps_95;

--
-- TOC entry 208 (class 1259 OID 504704)
-- Name: curriculo_vitae_tipo_investigacion; Type: TABLE; Schema: public; Owner: ufps_95
--

CREATE TABLE curriculo_vitae_tipo_investigacion (
    id character varying(2) NOT NULL,
    descripcion character varying(50) NOT NULL
);


ALTER TABLE curriculo_vitae_tipo_investigacion OWNER TO ufps_95;

--
-- TOC entry 209 (class 1259 OID 504709)
-- Name: curriculo_vitae_tipo_participacion; Type: TABLE; Schema: public; Owner: ufps_95
--

CREATE TABLE curriculo_vitae_tipo_participacion (
    id character varying(1) NOT NULL,
    descripcion character varying(50) NOT NULL
);


ALTER TABLE curriculo_vitae_tipo_participacion OWNER TO ufps_95;

--
-- TOC entry 210 (class 1259 OID 504714)
-- Name: curriculo_vitae_tipo_publicacion; Type: TABLE; Schema: public; Owner: ufps_95
--

CREATE TABLE curriculo_vitae_tipo_publicacion (
    id character varying(2) NOT NULL,
    descripcion character varying(50) NOT NULL
);


ALTER TABLE curriculo_vitae_tipo_publicacion OWNER TO ufps_95;

--
-- TOC entry 179 (class 1259 OID 504530)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: ufps_95
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO ufps_95;

--
-- TOC entry 178 (class 1259 OID 504528)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: ufps_95
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO ufps_95;

--
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 178
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ufps_95
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- TOC entry 165 (class 1259 OID 504416)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: ufps_95
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO ufps_95;

--
-- TOC entry 164 (class 1259 OID 504414)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: ufps_95
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO ufps_95;

--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 164
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ufps_95
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- TOC entry 163 (class 1259 OID 504405)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: ufps_95
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO ufps_95;

--
-- TOC entry 162 (class 1259 OID 504403)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: ufps_95
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO ufps_95;

--
-- TOC entry 3187 (class 0 OID 0)
-- Dependencies: 162
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ufps_95
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- TOC entry 211 (class 1259 OID 504924)
-- Name: django_session; Type: TABLE; Schema: public; Owner: ufps_95
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO ufps_95;

--
-- TOC entry 2790 (class 2604 OID 504437)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: ufps_95
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- TOC entry 2791 (class 2604 OID 504447)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: ufps_95
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2789 (class 2604 OID 504429)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: ufps_95
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- TOC entry 2792 (class 2604 OID 504455)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: ufps_95
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- TOC entry 2793 (class 2604 OID 504465)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: ufps_95
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- TOC entry 2794 (class 2604 OID 504473)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: ufps_95
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2797 (class 2604 OID 504575)
-- Name: curriculo_vitae_distincion id; Type: DEFAULT; Schema: public; Owner: ufps_95
--

ALTER TABLE ONLY curriculo_vitae_distincion ALTER COLUMN id SET DEFAULT nextval('curriculo_vitae_distincion_id_seq'::regclass);


--
-- TOC entry 2798 (class 2604 OID 504588)
-- Name: curriculo_vitae_docente_idioma id; Type: DEFAULT; Schema: public; Owner: ufps_95
--

ALTER TABLE ONLY curriculo_vitae_docente_idioma ALTER COLUMN id SET DEFAULT nextval('curriculo_vitae_docente_idioma_id_seq'::regclass);


--
-- TOC entry 2799 (class 2604 OID 504601)
-- Name: curriculo_vitae_estudio id; Type: DEFAULT; Schema: public; Owner: ufps_95
--

ALTER TABLE ONLY curriculo_vitae_estudio ALTER COLUMN id SET DEFAULT nextval('curriculo_vitae_estudio_id_seq'::regclass);


--
-- TOC entry 2800 (class 2604 OID 504609)
-- Name: curriculo_vitae_evento id; Type: DEFAULT; Schema: public; Owner: ufps_95
--

ALTER TABLE ONLY curriculo_vitae_evento ALTER COLUMN id SET DEFAULT nextval('curriculo_vitae_evento_id_seq'::regclass);


--
-- TOC entry 2801 (class 2604 OID 504620)
-- Name: curriculo_vitae_experiencia id; Type: DEFAULT; Schema: public; Owner: ufps_95
--

ALTER TABLE ONLY curriculo_vitae_experiencia ALTER COLUMN id SET DEFAULT nextval('curriculo_vitae_experiencia_id_seq'::regclass);


--
-- TOC entry 2802 (class 2604 OID 504631)
-- Name: curriculo_vitae_formacion_continua id; Type: DEFAULT; Schema: public; Owner: ufps_95
--

ALTER TABLE ONLY curriculo_vitae_formacion_continua ALTER COLUMN id SET DEFAULT nextval('curriculo_vitae_formacion_continua_id_seq'::regclass);


--
-- TOC entry 2803 (class 2604 OID 504649)
-- Name: curriculo_vitae_investigacion id; Type: DEFAULT; Schema: public; Owner: ufps_95
--

ALTER TABLE ONLY curriculo_vitae_investigacion ALTER COLUMN id SET DEFAULT nextval('curriculo_vitae_investigacion_id_seq'::regclass);


--
-- TOC entry 2804 (class 2604 OID 504678)
-- Name: curriculo_vitae_publicacion id; Type: DEFAULT; Schema: public; Owner: ufps_95
--

ALTER TABLE ONLY curriculo_vitae_publicacion ALTER COLUMN id SET DEFAULT nextval('curriculo_vitae_publicacion_id_seq'::regclass);


--
-- TOC entry 2795 (class 2604 OID 504533)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: ufps_95
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- TOC entry 2788 (class 2604 OID 504419)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: ufps_95
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- TOC entry 2787 (class 2604 OID 504408)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: ufps_95
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- TOC entry 3147 (class 2613 OID 370474)
-- Name: 370474; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('370474');


ALTER LARGE OBJECT 370474 OWNER TO postgres;

--
-- TOC entry 3148 (class 2613 OID 370478)
-- Name: 370478; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('370478');


ALTER LARGE OBJECT 370478 OWNER TO postgres;

--
-- TOC entry 3149 (class 2613 OID 370482)
-- Name: 370482; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('370482');


ALTER LARGE OBJECT 370482 OWNER TO postgres;

--
-- TOC entry 3150 (class 2613 OID 370496)
-- Name: 370496; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('370496');


ALTER LARGE OBJECT 370496 OWNER TO postgres;

--
-- TOC entry 3151 (class 2613 OID 370500)
-- Name: 370500; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('370500');


ALTER LARGE OBJECT 370500 OWNER TO postgres;

--
-- TOC entry 3152 (class 2613 OID 370504)
-- Name: 370504; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('370504');


ALTER LARGE OBJECT 370504 OWNER TO postgres;

--
-- TOC entry 3153 (class 2613 OID 370508)
-- Name: 370508; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('370508');


ALTER LARGE OBJECT 370508 OWNER TO postgres;

--
-- TOC entry 3154 (class 2613 OID 370512)
-- Name: 370512; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('370512');


ALTER LARGE OBJECT 370512 OWNER TO postgres;

--
-- TOC entry 3155 (class 2613 OID 370516)
-- Name: 370516; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('370516');


ALTER LARGE OBJECT 370516 OWNER TO postgres;

--
-- TOC entry 3156 (class 2613 OID 378401)
-- Name: 378401; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('378401');


ALTER LARGE OBJECT 378401 OWNER TO postgres;

--
-- TOC entry 3157 (class 2613 OID 378405)
-- Name: 378405; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('378405');


ALTER LARGE OBJECT 378405 OWNER TO postgres;

--
-- TOC entry 3158 (class 2613 OID 378595)
-- Name: 378595; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('378595');


ALTER LARGE OBJECT 378595 OWNER TO postgres;

--
-- TOC entry 3159 (class 2613 OID 378599)
-- Name: 378599; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('378599');


ALTER LARGE OBJECT 378599 OWNER TO postgres;

--
-- TOC entry 3160 (class 2613 OID 386594)
-- Name: 386594; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('386594');


ALTER LARGE OBJECT 386594 OWNER TO postgres;

--
-- TOC entry 3161 (class 2613 OID 386598)
-- Name: 386598; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('386598');


ALTER LARGE OBJECT 386598 OWNER TO postgres;

--
-- TOC entry 3104 (class 0 OID 504434)
-- Dependencies: 169
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: ufps_95
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 3188 (class 0 OID 0)
-- Dependencies: 168
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ufps_95
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- TOC entry 3106 (class 0 OID 504444)
-- Dependencies: 171
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: ufps_95
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 0)
-- Dependencies: 170
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ufps_95
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3102 (class 0 OID 504426)
-- Dependencies: 167
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: ufps_95
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add estado_ civil	7	add_estado_civil
20	Can change estado_ civil	7	change_estado_civil
21	Can delete estado_ civil	7	delete_estado_civil
22	Can add idioma	8	add_idioma
23	Can change idioma	8	change_idioma
24	Can delete idioma	8	delete_idioma
25	Can add institucion	9	add_institucion
26	Can change institucion	9	change_institucion
27	Can delete institucion	9	delete_institucion
28	Can add pais	10	add_pais
29	Can change pais	10	change_pais
30	Can delete pais	10	delete_pais
31	Can add tipo_ continua	11	add_tipo_continua
32	Can change tipo_ continua	11	change_tipo_continua
33	Can delete tipo_ continua	11	delete_tipo_continua
34	Can add tipo_ documento	12	add_tipo_documento
35	Can change tipo_ documento	12	change_tipo_documento
36	Can delete tipo_ documento	12	delete_tipo_documento
37	Can add tipo_ evento	13	add_tipo_evento
38	Can change tipo_ evento	13	change_tipo_evento
39	Can delete tipo_ evento	13	delete_tipo_evento
40	Can add tipo_ formacion	14	add_tipo_formacion
41	Can change tipo_ formacion	14	change_tipo_formacion
42	Can delete tipo_ formacion	14	delete_tipo_formacion
43	Can add tipo_ investigacion	15	add_tipo_investigacion
44	Can change tipo_ investigacion	15	change_tipo_investigacion
45	Can delete tipo_ investigacion	15	delete_tipo_investigacion
46	Can add tipo_ participacion	16	add_tipo_participacion
47	Can change tipo_ participacion	16	change_tipo_participacion
48	Can delete tipo_ participacion	16	delete_tipo_participacion
49	Can add tipo_ publicacion	17	add_tipo_publicacion
50	Can change tipo_ publicacion	17	change_tipo_publicacion
51	Can delete tipo_ publicacion	17	delete_tipo_publicacion
52	Can add departamento	18	add_departamento
53	Can change departamento	18	change_departamento
54	Can delete departamento	18	delete_departamento
55	Can add municipio	19	add_municipio
56	Can change municipio	19	change_municipio
57	Can delete municipio	19	delete_municipio
58	Can add persona	20	add_persona
59	Can change persona	20	change_persona
60	Can delete persona	20	delete_persona
61	Can add docente	21	add_docente
62	Can change docente	21	change_docente
63	Can delete docente	21	delete_docente
64	Can add investigacion	22	add_investigacion
65	Can change investigacion	22	change_investigacion
66	Can delete investigacion	22	delete_investigacion
67	Can add distincion	23	add_distincion
68	Can change distincion	23	change_distincion
69	Can delete distincion	23	delete_distincion
70	Can add evento	24	add_evento
71	Can change evento	24	change_evento
72	Can delete evento	24	delete_evento
73	Can add experiencia	25	add_experiencia
74	Can change experiencia	25	change_experiencia
75	Can delete experiencia	25	delete_experiencia
76	Can add docente_ idioma	26	add_docente_idioma
77	Can change docente_ idioma	26	change_docente_idioma
78	Can delete docente_ idioma	26	delete_docente_idioma
79	Can add estudio	27	add_estudio
80	Can change estudio	27	change_estudio
81	Can delete estudio	27	delete_estudio
82	Can add formacion_ continua	28	add_formacion_continua
83	Can change formacion_ continua	28	change_formacion_continua
84	Can delete formacion_ continua	28	delete_formacion_continua
85	Can add publicacion	29	add_publicacion
86	Can change publicacion	29	change_publicacion
87	Can delete publicacion	29	delete_publicacion
\.


--
-- TOC entry 3190 (class 0 OID 0)
-- Dependencies: 166
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ufps_95
--

SELECT pg_catalog.setval('auth_permission_id_seq', 87, true);


--
-- TOC entry 3108 (class 0 OID 504452)
-- Dependencies: 173
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: ufps_95
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$24000$FctMkeLF2JBD$aO+EtftAscgzNVo9mSkpRiHY5wubGjqFXiY6DsU0tKU=	2017-06-15 11:39:33.731167-05	t	06337			edwinvelasco@gmail.com	t	t	2017-06-13 10:29:49.066716-05
\.


--
-- TOC entry 3110 (class 0 OID 504462)
-- Dependencies: 175
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: ufps_95
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 3191 (class 0 OID 0)
-- Dependencies: 174
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ufps_95
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- TOC entry 3192 (class 0 OID 0)
-- Dependencies: 172
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ufps_95
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- TOC entry 3112 (class 0 OID 504470)
-- Dependencies: 177
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: ufps_95
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 0)
-- Dependencies: 176
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ufps_95
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 3115 (class 0 OID 504565)
-- Dependencies: 180
-- Data for Name: curriculo_vitae_departamento; Type: TABLE DATA; Schema: public; Owner: ufps_95
--

COPY curriculo_vitae_departamento (id, nombre, id_pais_id) FROM stdin;
01	Norte de Santander	col
\.


--
-- TOC entry 3117 (class 0 OID 504572)
-- Dependencies: 182
-- Data for Name: curriculo_vitae_distincion; Type: TABLE DATA; Schema: public; Owner: ufps_95
--

COPY curriculo_vitae_distincion (id, tipo_distincion, nombre, fecha, entidad, ambito, fecha_registro, usuario_registro, fecha_autenticacion, estado, cod_docente_id, municipio_id) FROM stdin;
1	02	123123	2017-06-06	123	1	2017-06-13	11111	\N	0	11111	00001
2	02	wwiwi	2017-06-01	oowowo	2	2017-06-13	11111	\N	0	11111	00001
3	03	qqweweqwe  qwewe	2017-06-06	qwe qwe	3	2017-06-13	11111	\N	0	11111	00001
4	03	qqweweqwytyty	2017-06-06	qwe qwe	3	2017-06-13	11111	\N	0	11111	00001
5	04	qweweqwe	2017-06-02	wrw	2	2017-06-13	11111	2017-06-13	1	11111	00001
\.


--
-- TOC entry 3194 (class 0 OID 0)
-- Dependencies: 181
-- Name: curriculo_vitae_distincion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ufps_95
--

SELECT pg_catalog.setval('curriculo_vitae_distincion_id_seq', 5, true);


--
-- TOC entry 3118 (class 0 OID 504578)
-- Dependencies: 183
-- Data for Name: curriculo_vitae_docente; Type: TABLE DATA; Schema: public; Owner: ufps_95
--

COPY curriculo_vitae_docente (cod_docente, clave, estado, fecha_registro, usuario_registro, fecha_activacion, cedula_id) FROM stdin;
11111	12345	1	2017-06-13	06337	2017-06-13	1090
\.


--
-- TOC entry 3120 (class 0 OID 504585)
-- Dependencies: 185
-- Data for Name: curriculo_vitae_docente_idioma; Type: TABLE DATA; Schema: public; Owner: ufps_95
--

COPY curriculo_vitae_docente_idioma (id, nivel, lectura, escritura, conversacion, fecha_registro, usuario_registro, fecha_autenticacion, estado, docente_id, idioma_id) FROM stdin;
2	a	b	b	b	2017-06-13	11111	\N	0	11111	es
\.


--
-- TOC entry 3195 (class 0 OID 0)
-- Dependencies: 184
-- Name: curriculo_vitae_docente_idioma_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ufps_95
--

SELECT pg_catalog.setval('curriculo_vitae_docente_idioma_id_seq', 2, true);


--
-- TOC entry 3121 (class 0 OID 504591)
-- Dependencies: 186
-- Data for Name: curriculo_vitae_estado_civil; Type: TABLE DATA; Schema: public; Owner: ufps_95
--

COPY curriculo_vitae_estado_civil (id, descripcion) FROM stdin;
1	Soltero
\.


--
-- TOC entry 3123 (class 0 OID 504598)
-- Dependencies: 188
-- Data for Name: curriculo_vitae_estudio; Type: TABLE DATA; Schema: public; Owner: ufps_95
--

COPY curriculo_vitae_estudio (id, titulo_obtenido, semestres, fecha_inicio, fecha_titulo, fecha_registro, usuario_registro, fecha_autenticacion, estado, cod_docente_id, institucion_id, municipio_id, tipo_formacion_id) FROM stdin;
1	Magister en Adminin	10	2014-06-04	2017-06-14	2017-06-15	11111	2017-06-13	1	11111	valle	00001	001
\.


--
-- TOC entry 3196 (class 0 OID 0)
-- Dependencies: 187
-- Name: curriculo_vitae_estudio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ufps_95
--

SELECT pg_catalog.setval('curriculo_vitae_estudio_id_seq', 1, true);


--
-- TOC entry 3125 (class 0 OID 504606)
-- Dependencies: 190
-- Data for Name: curriculo_vitae_evento; Type: TABLE DATA; Schema: public; Owner: ufps_95
--

COPY curriculo_vitae_evento (id, nombre, fecha, direccion, lugar, descripcion, fecha_registro, usuario_registro, fecha_autenticacion, estado, cod_docente_id, tipo_evento_id, tipo_parcipacion_id) FROM stdin;
1	evento 1	2013-06-05	ksksksks	kwkkwkwwk	qweqwe qweqwe	2017-06-13	11111	\N	0	11111	01	1
\.


--
-- TOC entry 3197 (class 0 OID 0)
-- Dependencies: 189
-- Name: curriculo_vitae_evento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ufps_95
--

SELECT pg_catalog.setval('curriculo_vitae_evento_id_seq', 1, true);


--
-- TOC entry 3127 (class 0 OID 504617)
-- Dependencies: 192
-- Data for Name: curriculo_vitae_experiencia; Type: TABLE DATA; Schema: public; Owner: ufps_95
--

COPY curriculo_vitae_experiencia (id, empresa, fecha_inicio, fecha_fin, cargo, direccion, telefono, funciones, fecha_registro, usuario_registro, fecha_autenticacion, estado, lugar, cod_docente_id) FROM stdin;
1	qweqwe	2014-06-04	2017-06-06	qweqwe	qwe	qwewqe	qweqweqwe qwee qwee	2017-06-13	11111	\N	0		11111
\.


--
-- TOC entry 3198 (class 0 OID 0)
-- Dependencies: 191
-- Name: curriculo_vitae_experiencia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ufps_95
--

SELECT pg_catalog.setval('curriculo_vitae_experiencia_id_seq', 1, true);


--
-- TOC entry 3129 (class 0 OID 504628)
-- Dependencies: 194
-- Data for Name: curriculo_vitae_formacion_continua; Type: TABLE DATA; Schema: public; Owner: ufps_95
--

COPY curriculo_vitae_formacion_continua (id, intencidad, fecha_inicio, fecha_terminacion, fecha_titulo, fecha_registro, usuario_registro, fecha_autenticacion, estado, descuento, cod_docente_id, institucion_id, municipio_id, tipo_continua_id) FROM stdin;
1	8	2013-06-04	2017-06-06	2014-06-11	2017-06-13	11111	\N	0	50	11111	udes	00001	01
\.


--
-- TOC entry 3199 (class 0 OID 0)
-- Dependencies: 193
-- Name: curriculo_vitae_formacion_continua_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ufps_95
--

SELECT pg_catalog.setval('curriculo_vitae_formacion_continua_id_seq', 1, true);


--
-- TOC entry 3130 (class 0 OID 504634)
-- Dependencies: 195
-- Data for Name: curriculo_vitae_idioma; Type: TABLE DATA; Schema: public; Owner: ufps_95
--

COPY curriculo_vitae_idioma (id, descripcion) FROM stdin;
es	Español
\.


--
-- TOC entry 3131 (class 0 OID 504639)
-- Dependencies: 196
-- Data for Name: curriculo_vitae_institucion; Type: TABLE DATA; Schema: public; Owner: ufps_95
--

COPY curriculo_vitae_institucion (id, nombre) FROM stdin;
ufps	Universidad francisco de paula santander
udes	Universidad de pamplona
valle	Universidad de Valle
\.


--
-- TOC entry 3133 (class 0 OID 504646)
-- Dependencies: 198
-- Data for Name: curriculo_vitae_investigacion; Type: TABLE DATA; Schema: public; Owner: ufps_95
--

COPY curriculo_vitae_investigacion (id, nombre, fecha, descripcion, fecha_registro, usuario_registro, fecha_autenticacion, estado, cod_docente_id, tipo_investigacion_id) FROM stdin;
1	asdasd	2017-06-06	adsd asdasd asdsad asdd	2017-06-13	11111	\N	0	11111	01
\.


--
-- TOC entry 3200 (class 0 OID 0)
-- Dependencies: 197
-- Name: curriculo_vitae_investigacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ufps_95
--

SELECT pg_catalog.setval('curriculo_vitae_investigacion_id_seq', 1, true);


--
-- TOC entry 3134 (class 0 OID 504655)
-- Dependencies: 199
-- Data for Name: curriculo_vitae_municipio; Type: TABLE DATA; Schema: public; Owner: ufps_95
--

COPY curriculo_vitae_municipio (id, nombre, id_dpto_id) FROM stdin;
00001	san jose de cucuta	01
\.


--
-- TOC entry 3135 (class 0 OID 504660)
-- Dependencies: 200
-- Data for Name: curriculo_vitae_pais; Type: TABLE DATA; Schema: public; Owner: ufps_95
--

COPY curriculo_vitae_pais (id, nombre) FROM stdin;
col	Colombia
\.


--
-- TOC entry 3136 (class 0 OID 504665)
-- Dependencies: 201
-- Data for Name: curriculo_vitae_persona; Type: TABLE DATA; Schema: public; Owner: ufps_95
--

COPY curriculo_vitae_persona (cedula, nombre1, nombre2, apellido1, apellido2, tarjeta_profesional, sexo, fecha_nac, hijos, telefono1, telefono2, direccion, correo_inst, correo_oper, twitter, facebook, sitioweb, estado_civil_id, municipio_exp_id, municipio_nac_id, nacionalidad_id, tipo_doc_id) FROM stdin;
1090	Edwin	Alberto	Velasco	castellanos	92789276363	m	1989-10-04	0	123123	12323	qwq	edwin@ufps.edu.co	edwin@gmail.com	@edwinv	#edwinv	http://sites.google.com/edwinv	1	00001	00001	col	1
\.


--
-- TOC entry 3138 (class 0 OID 504675)
-- Dependencies: 203
-- Data for Name: curriculo_vitae_publicacion; Type: TABLE DATA; Schema: public; Owner: ufps_95
--

COPY curriculo_vitae_publicacion (id, nombre, fecha, divulgacion, sitio_web, revista, periodico, volumen, editorial, isbn, fecha_registro, usuario_registro, fecha_autenticacion, estado, descripcion, cod_docente_id, idioma_id, tipo_publicacion_id) FROM stdin;
1	qweqw	2017-06-06	qweqw	qwewe	qwee	wqqwe	1	adsd	adsdsadasdasd	2017-06-13	11111	\N	0	sadasdsd	11111	es	02
\.


--
-- TOC entry 3201 (class 0 OID 0)
-- Dependencies: 202
-- Name: curriculo_vitae_publicacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ufps_95
--

SELECT pg_catalog.setval('curriculo_vitae_publicacion_id_seq', 1, true);


--
-- TOC entry 3139 (class 0 OID 504684)
-- Dependencies: 204
-- Data for Name: curriculo_vitae_tipo_continua; Type: TABLE DATA; Schema: public; Owner: ufps_95
--

COPY curriculo_vitae_tipo_continua (id, descripcion) FROM stdin;
01	Continua uno
02	Continua dos
\.


--
-- TOC entry 3140 (class 0 OID 504689)
-- Dependencies: 205
-- Data for Name: curriculo_vitae_tipo_documento; Type: TABLE DATA; Schema: public; Owner: ufps_95
--

COPY curriculo_vitae_tipo_documento (id, descripcion) FROM stdin;
1	Cedula de cuidadania
\.


--
-- TOC entry 3141 (class 0 OID 504694)
-- Dependencies: 206
-- Data for Name: curriculo_vitae_tipo_evento; Type: TABLE DATA; Schema: public; Owner: ufps_95
--

COPY curriculo_vitae_tipo_evento (id, descripcion) FROM stdin;
01	Academico
02	Social
\.


--
-- TOC entry 3142 (class 0 OID 504699)
-- Dependencies: 207
-- Data for Name: curriculo_vitae_tipo_formacion; Type: TABLE DATA; Schema: public; Owner: ufps_95
--

COPY curriculo_vitae_tipo_formacion (id, descripcion) FROM stdin;
001	Tipo de formacion uno
002	Tipo de formacion dos
\.


--
-- TOC entry 3143 (class 0 OID 504704)
-- Dependencies: 208
-- Data for Name: curriculo_vitae_tipo_investigacion; Type: TABLE DATA; Schema: public; Owner: ufps_95
--

COPY curriculo_vitae_tipo_investigacion (id, descripcion) FROM stdin;
01	Cualitativa
02	Cuantitativa
\.


--
-- TOC entry 3144 (class 0 OID 504709)
-- Dependencies: 209
-- Data for Name: curriculo_vitae_tipo_participacion; Type: TABLE DATA; Schema: public; Owner: ufps_95
--

COPY curriculo_vitae_tipo_participacion (id, descripcion) FROM stdin;
1	Ponencia
2	Poster
\.


--
-- TOC entry 3145 (class 0 OID 504714)
-- Dependencies: 210
-- Data for Name: curriculo_vitae_tipo_publicacion; Type: TABLE DATA; Schema: public; Owner: ufps_95
--

COPY curriculo_vitae_tipo_publicacion (id, descripcion) FROM stdin;
01	Tipo de publicacion uno
02	Tipo de publicacion dos
\.


--
-- TOC entry 3114 (class 0 OID 504530)
-- Dependencies: 179
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: ufps_95
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2017-06-13 10:40:44.426688-05	col	Colombia	1	Añadido.	10	1
2	2017-06-13 10:41:07.725145-05	01	Norte de Santander, pais: Colombia	1	Añadido.	18	1
3	2017-06-13 10:41:31.483839-05	00001	san jose de cucuta, pais: Norte de Santander	1	Añadido.	19	1
4	2017-06-13 10:42:06.674299-05	1	Soltero	1	Añadido.	7	1
5	2017-06-13 10:43:58.826486-05	1	Cedula de cuidadania	1	Añadido.	12	1
6	2017-06-13 10:46:12.012652-05	1090	Cedula: 1090 Nombre: Edwin Alberto Velasco castellanos	1	Añadido.	20	1
7	2017-06-13 10:46:53.287168-05	11111	cod: 11111, Nombre: Edwin Alberto Velasco castellanos, Estado: 1	1	Añadido.	21	1
8	2017-06-13 14:36:57.598181-05	es	Español	1	Añadido.	8	1
9	2017-06-13 14:37:19.966761-05	ufps	Universidad francisco de paula santander	1	Añadido.	9	1
10	2017-06-13 14:37:32.807574-05	udes	Universidad de pamplona	1	Añadido.	9	1
11	2017-06-13 14:37:58.631866-05	01	Continua uno	1	Añadido.	11	1
12	2017-06-13 14:38:09.266092-05	02	Continua dos	1	Añadido.	11	1
13	2017-06-13 14:39:13.921484-05	01	Academico	1	Añadido.	13	1
14	2017-06-13 14:39:21.43313-05	02	Social	1	Añadido.	13	1
15	2017-06-13 14:39:47.042211-05	001	Tipo de formacion uno	1	Añadido.	14	1
16	2017-06-13 14:40:01.453285-05	002	Tipo de formacion dos	1	Añadido.	14	1
17	2017-06-13 14:40:36.77235-05	01	Cualitativa	1	Añadido.	15	1
18	2017-06-13 14:40:48.351345-05	02	Cuantitativa	1	Añadido.	15	1
19	2017-06-13 14:41:05.876586-05	1	Ponencia	1	Añadido.	16	1
20	2017-06-13 14:41:16.129936-05	2	Poster	1	Añadido.	16	1
21	2017-06-13 14:41:46.681085-05	01	Tipo de publicacion uno	1	Añadido.	17	1
22	2017-06-13 14:42:02.374231-05	02	Tipo de publicacion dos	1	Añadido.	17	1
23	2017-06-13 18:47:44.77908-05	1	tipo formacion: Tipo de formacion uno  , titulo: ieieiiw, Institucion: Universidad francisco de paula santander 	2	Modificado/a fecha_autenticacion y estado.	27	1
24	2017-06-13 20:53:53.893658-05	5	cod: 11111, Nombre: Edwin Alberto Velasco castellanos, Distincion:  qweweqwe	2	Modificado/a fecha_autenticacion y estado.	23	1
25	2017-06-14 08:55:42.523545-05	1090	Nombre: Edwin Alberto Velasco castellanos	2	Modificado/a correo_inst y correo_oper.	20	1
26	2017-06-14 08:59:57.075135-05	1090	Nombre: Edwin Alberto Velasco castellanos	2	Modificado/a fecha_nac, twitter, facebook y sitioweb.	20	1
27	2017-06-14 09:21:12.750328-05	1090	Nombre: Edwin Alberto Velasco castellanos	2	Modificado/a tarjeta_profesional.	20	1
28	2017-06-15 10:54:00.945416-05	valle	Universidad de Valle	1	Añadido.	9	1
29	2017-06-15 10:56:12.816227-05	1	cod: 11111, Nombre: Edwin Alberto Velasco castellanos, Titulo:  Magister en Adminin	2	Modificado/a titulo_obtenido y institucion.	27	1
\.


--
-- TOC entry 3202 (class 0 OID 0)
-- Dependencies: 178
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ufps_95
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 29, true);


--
-- TOC entry 3100 (class 0 OID 504416)
-- Dependencies: 165
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: ufps_95
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	curriculo_vitae	estado_civil
8	curriculo_vitae	idioma
9	curriculo_vitae	institucion
10	curriculo_vitae	pais
11	curriculo_vitae	tipo_continua
12	curriculo_vitae	tipo_documento
13	curriculo_vitae	tipo_evento
14	curriculo_vitae	tipo_formacion
15	curriculo_vitae	tipo_investigacion
16	curriculo_vitae	tipo_participacion
17	curriculo_vitae	tipo_publicacion
18	curriculo_vitae	departamento
19	curriculo_vitae	municipio
20	curriculo_vitae	persona
21	curriculo_vitae	docente
22	curriculo_vitae	investigacion
23	curriculo_vitae	distincion
24	curriculo_vitae	evento
25	curriculo_vitae	experiencia
26	curriculo_vitae	docente_idioma
27	curriculo_vitae	estudio
28	curriculo_vitae	formacion_continua
29	curriculo_vitae	publicacion
\.


--
-- TOC entry 3203 (class 0 OID 0)
-- Dependencies: 164
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ufps_95
--

SELECT pg_catalog.setval('django_content_type_id_seq', 29, true);


--
-- TOC entry 3098 (class 0 OID 504405)
-- Dependencies: 163
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: ufps_95
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-06-13 10:28:37.282512-05
2	auth	0001_initial	2017-06-13 10:28:38.433867-05
3	admin	0001_initial	2017-06-13 10:28:38.633922-05
4	admin	0002_logentry_remove_auto_add	2017-06-13 10:28:38.699884-05
5	contenttypes	0002_remove_content_type_name	2017-06-13 10:28:38.783196-05
6	auth	0002_alter_permission_name_max_length	2017-06-13 10:28:38.939562-05
7	auth	0003_alter_user_email_max_length	2017-06-13 10:28:39.081289-05
8	auth	0004_alter_user_username_opts	2017-06-13 10:28:39.116168-05
9	auth	0005_alter_user_last_login_null	2017-06-13 10:28:39.175391-05
10	auth	0006_require_contenttypes_0002	2017-06-13 10:28:39.192468-05
11	auth	0007_alter_validators_add_error_messages	2017-06-13 10:28:39.23091-05
12	curriculo_vitae	0001_initial	2017-06-13 10:28:43.325633-05
13	sessions	0001_initial	2017-06-13 10:28:43.507291-05
14	curriculo_vitae	0002_auto_20170613_1055	2017-06-13 10:56:02.283928-05
\.


--
-- TOC entry 3204 (class 0 OID 0)
-- Dependencies: 162
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ufps_95
--

SELECT pg_catalog.setval('django_migrations_id_seq', 14, true);


--
-- TOC entry 3146 (class 0 OID 504924)
-- Dependencies: 211
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: ufps_95
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
b9kzlfsnvecr9lujshy8eefbexcwl7s7	MDJmZjM1ZjNmMDNmYzQ0NzJiZmE0ODc5ZDg4NjI0NDAxNGE0ZTk1Yjp7fQ==	2017-06-27 21:33:01.361059-05
dcgu70071t01b13fz1x18eso3npybv7y	MDJmZjM1ZjNmMDNmYzQ0NzJiZmE0ODc5ZDg4NjI0NDAxNGE0ZTk1Yjp7fQ==	2017-06-27 11:23:40.546936-05
umcdktbbmvd64dck2h5tzgtzfvy5fjns	MDJmZjM1ZjNmMDNmYzQ0NzJiZmE0ODc5ZDg4NjI0NDAxNGE0ZTk1Yjp7fQ==	2017-06-29 10:45:49.651423-05
\.


--
-- TOC entry 3162 (class 0 OID 0)
-- Data for Name: BLOBS; Type: BLOBS; Schema: -; Owner: 
--

SET search_path = pg_catalog;

BEGIN;

SELECT pg_catalog.lo_open('370474', 131072);
