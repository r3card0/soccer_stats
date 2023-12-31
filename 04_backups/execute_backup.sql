PGDMP     /    6                {            soccer    13.6    13.6 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    174037    soccer    DATABASE     Q   CREATE DATABASE soccer WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';
    DROP DATABASE soccer;
                tomate    false                        2615    182238    geodata    SCHEMA        CREATE SCHEMA geodata;
    DROP SCHEMA geodata;
                tomate    false            �           0    0    SCHEMA geodata    COMMENT     I   COMMENT ON SCHEMA geodata IS 'countries,  continents, cities, zip code';
                   tomate    false    6                        2615    232541    reports    SCHEMA        CREATE SCHEMA reports;
    DROP SCHEMA reports;
                tomate    false            �           0    0    SCHEMA reports    COMMENT     /   COMMENT ON SCHEMA reports IS 'Soccer reports';
                   tomate    false    5                        3079    198613    postgis 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;
    DROP EXTENSION postgis;
                   false            �           0    0    EXTENSION postgis    COMMENT     g   COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';
                        false    2            �            1259    182268    admin_level    TABLE     �   CREATE TABLE geodata.admin_level (
    admin_lvl_id integer NOT NULL,
    admin_type character varying(30),
    insert_date timestamp without time zone DEFAULT now()
);
     DROP TABLE geodata.admin_level;
       geodata         heap    tomate    false    6            �            1259    182266    admin_level_admin_lvl_id_seq    SEQUENCE     �   CREATE SEQUENCE geodata.admin_level_admin_lvl_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE geodata.admin_level_admin_lvl_id_seq;
       geodata          tomate    false    6    218            �           0    0    admin_level_admin_lvl_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE geodata.admin_level_admin_lvl_id_seq OWNED BY geodata.admin_level.admin_lvl_id;
          geodata          tomate    false    217            �            1259    182277    admin_lvl_2    TABLE     �   CREATE TABLE geodata.admin_lvl_2 (
    alvl2_id integer NOT NULL,
    country_id integer,
    admin_lvl_id integer,
    admin_name character varying(30),
    insert_date timestamp without time zone DEFAULT now()
);
     DROP TABLE geodata.admin_lvl_2;
       geodata         heap    tomate    false    6            �            1259    182275    admin_lvl_2_alvl2_id_seq    SEQUENCE     �   CREATE SEQUENCE geodata.admin_lvl_2_alvl2_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE geodata.admin_lvl_2_alvl2_id_seq;
       geodata          tomate    false    6    220            �           0    0    admin_lvl_2_alvl2_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE geodata.admin_lvl_2_alvl2_id_seq OWNED BY geodata.admin_lvl_2.alvl2_id;
          geodata          tomate    false    219            �            1259    182286    cities    TABLE     �   CREATE TABLE geodata.cities (
    city_id integer NOT NULL,
    alvl2_id integer,
    city_name character varying(30),
    insert_date timestamp without time zone DEFAULT now()
);
    DROP TABLE geodata.cities;
       geodata         heap    tomate    false    6            �            1259    182284    cities_city_id_seq    SEQUENCE     �   CREATE SEQUENCE geodata.cities_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE geodata.cities_city_id_seq;
       geodata          tomate    false    222    6            �           0    0    cities_city_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE geodata.cities_city_id_seq OWNED BY geodata.cities.city_id;
          geodata          tomate    false    221            �            1259    182250    continent_zones    TABLE     �   CREATE TABLE geodata.continent_zones (
    continent_zone_id integer NOT NULL,
    continent_id integer,
    zone_name character varying(30),
    insert_date timestamp without time zone DEFAULT now()
);
 $   DROP TABLE geodata.continent_zones;
       geodata         heap    tomate    false    6            �            1259    182248 %   continent_zones_continent_zone_id_seq    SEQUENCE     �   CREATE SEQUENCE geodata.continent_zones_continent_zone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE geodata.continent_zones_continent_zone_id_seq;
       geodata          tomate    false    6    214            �           0    0 %   continent_zones_continent_zone_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE geodata.continent_zones_continent_zone_id_seq OWNED BY geodata.continent_zones.continent_zone_id;
          geodata          tomate    false    213            �            1259    182241 
   continents    TABLE     �   CREATE TABLE geodata.continents (
    continent_id integer NOT NULL,
    continent_name character varying(30),
    insert_date timestamp without time zone DEFAULT now()
);
    DROP TABLE geodata.continents;
       geodata         heap    tomate    false    6            �            1259    182239    continents_continent_id_seq    SEQUENCE     �   CREATE SEQUENCE geodata.continents_continent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE geodata.continents_continent_id_seq;
       geodata          tomate    false    212    6            �           0    0    continents_continent_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE geodata.continents_continent_id_seq OWNED BY geodata.continents.continent_id;
          geodata          tomate    false    211            �            1259    182259 	   countries    TABLE     �   CREATE TABLE geodata.countries (
    country_id integer NOT NULL,
    continent_id integer NOT NULL,
    continent_zone_id integer,
    country_name character varying(30),
    insert_date timestamp without time zone DEFAULT now()
);
    DROP TABLE geodata.countries;
       geodata         heap    tomate    false    6            �            1259    182257    countries_country_id_seq    SEQUENCE     �   CREATE SEQUENCE geodata.countries_country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE geodata.countries_country_id_seq;
       geodata          tomate    false    216    6            �           0    0    countries_country_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE geodata.countries_country_id_seq OWNED BY geodata.countries.country_id;
          geodata          tomate    false    215            �            1259    174049    leagues    TABLE     �   CREATE TABLE public.leagues (
    league_id integer NOT NULL,
    league_lvl integer,
    country_id integer,
    league_name character varying(30),
    insert_date timestamp without time zone DEFAULT now()
);
    DROP TABLE public.leagues;
       public         heap    tomate    false            �            1259    174047    leagues_league_id_seq    SEQUENCE     �   CREATE SEQUENCE public.leagues_league_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.leagues_league_id_seq;
       public          tomate    false    204            �           0    0    leagues_league_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.leagues_league_id_seq OWNED BY public.leagues.league_id;
          public          tomate    false    203            �            1259    216124    match_details    TABLE       CREATE TABLE public.match_details (
    match_detial_id integer NOT NULL,
    match_id integer NOT NULL,
    half integer NOT NULL,
    minute integer NOT NULL,
    action_id integer NOT NULL,
    player_id integer NOT NULL,
    insert_date timestamp without time zone DEFAULT now()
);
 !   DROP TABLE public.match_details;
       public         heap    tomate    false            �            1259    216122 !   match_details_match_detial_id_seq    SEQUENCE     �   CREATE SEQUENCE public.match_details_match_detial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.match_details_match_detial_id_seq;
       public          tomate    false    241            �           0    0 !   match_details_match_detial_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.match_details_match_detial_id_seq OWNED BY public.match_details.match_detial_id;
          public          tomate    false    240            �            1259    207932    match_players    TABLE     �   CREATE TABLE public.match_players (
    id integer NOT NULL,
    match_id integer,
    player_id integer,
    is_beginner boolean,
    insert_date timestamp without time zone DEFAULT now()
);
 !   DROP TABLE public.match_players;
       public         heap    tomate    false            �            1259    207930    match_players_id_seq    SEQUENCE     �   CREATE SEQUENCE public.match_players_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.match_players_id_seq;
       public          tomate    false    239            �           0    0    match_players_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.match_players_id_seq OWNED BY public.match_players.id;
          public          tomate    false    238            �            1259    199701    matches    TABLE     K  CREATE TABLE public.matches (
    match_id integer NOT NULL,
    season_id integer,
    stadium_id integer,
    match_no integer,
    week_no integer,
    round integer,
    local_team_id integer,
    visitor_team_id integer,
    match_date timestamp without time zone,
    insert_date timestamp without time zone DEFAULT now()
);
    DROP TABLE public.matches;
       public         heap    tomate    false            �            1259    199699    matches_match_id_seq    SEQUENCE     �   CREATE SEQUENCE public.matches_match_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.matches_match_id_seq;
       public          tomate    false    233            �           0    0    matches_match_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.matches_match_id_seq OWNED BY public.matches.match_id;
          public          tomate    false    232            �            1259    199710    players    TABLE     B  CREATE TABLE public.players (
    player_id integer NOT NULL,
    player_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    nick_name character varying(30),
    birthday date,
    nationality integer,
    insert_date timestamp without time zone DEFAULT now(),
    "position" integer
);
    DROP TABLE public.players;
       public         heap    tomate    false            �            1259    207923    players_by_team_by_season    TABLE        CREATE TABLE public.players_by_team_by_season (
    id integer NOT NULL,
    season_id integer NOT NULL,
    team_id integer NOT NULL,
    player_id integer NOT NULL,
    tshirt integer,
    start_date date,
    end_date date,
    insert_date timestamp without time zone DEFAULT now()
);
 -   DROP TABLE public.players_by_team_by_season;
       public         heap    tomate    false            �            1259    207921     players_by_team_by_season_id_seq    SEQUENCE     �   CREATE SEQUENCE public.players_by_team_by_season_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.players_by_team_by_season_id_seq;
       public          tomate    false    237            �           0    0     players_by_team_by_season_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.players_by_team_by_season_id_seq OWNED BY public.players_by_team_by_season.id;
          public          tomate    false    236            �            1259    199708    players_player_id_seq    SEQUENCE     �   CREATE SEQUENCE public.players_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.players_player_id_seq;
       public          tomate    false    235            �           0    0    players_player_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.players_player_id_seq OWNED BY public.players.player_id;
          public          tomate    false    234            �            1259    174058    seasons    TABLE     �   CREATE TABLE public.seasons (
    season_id integer NOT NULL,
    league_id integer,
    season character varying(30),
    start_date date,
    end_date date,
    insert_date timestamp without time zone DEFAULT now()
);
    DROP TABLE public.seasons;
       public         heap    tomate    false            �            1259    174056    seasons_season_id_seq    SEQUENCE     �   CREATE SEQUENCE public.seasons_season_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.seasons_season_id_seq;
       public          tomate    false    206            �           0    0    seasons_season_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.seasons_season_id_seq OWNED BY public.seasons.season_id;
          public          tomate    false    205            �            1259    199692    stadiums_by_team    TABLE     �   CREATE TABLE public.stadiums_by_team (
    id integer NOT NULL,
    stadium_id integer,
    team_id integer,
    insert_date timestamp without time zone DEFAULT now()
);
 $   DROP TABLE public.stadiums_by_team;
       public         heap    tomate    false            �            1259    199690    stadiums_by_team_id_seq    SEQUENCE     �   CREATE SEQUENCE public.stadiums_by_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.stadiums_by_team_id_seq;
       public          tomate    false    231            �           0    0    stadiums_by_team_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.stadiums_by_team_id_seq OWNED BY public.stadiums_by_team.id;
          public          tomate    false    230            �            1259    199673    stadiums_mx    TABLE     �   CREATE TABLE public.stadiums_mx (
    id integer NOT NULL,
    geom public.geometry(Point,4326),
    stadium character varying(254),
    city_id bigint,
    lat numeric,
    lon numeric,
    coordinate character varying(254)
);
    DROP TABLE public.stadiums_mx;
       public         heap    tomate    false    2    2    2    2    2    2    2    2            �            1259    199671    stadiums_mx_id_seq    SEQUENCE     �   CREATE SEQUENCE public.stadiums_mx_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.stadiums_mx_id_seq;
       public          tomate    false    229            �           0    0    stadiums_mx_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.stadiums_mx_id_seq OWNED BY public.stadiums_mx.id;
          public          tomate    false    228            �            1259    174085    teams    TABLE     B  CREATE TABLE public.teams (
    team_id integer NOT NULL,
    team character varying(50) NOT NULL,
    country_id integer NOT NULL,
    team_type integer NOT NULL,
    since_date date,
    common_name character varying(30),
    nick_name character varying(30),
    insert_date timestamp without time zone DEFAULT now()
);
    DROP TABLE public.teams;
       public         heap    tomate    false            �            1259    182231    teams_by_season    TABLE     �   CREATE TABLE public.teams_by_season (
    id integer NOT NULL,
    season_id integer NOT NULL,
    team_id integer NOT NULL,
    insert_date timestamp without time zone DEFAULT now()
);
 #   DROP TABLE public.teams_by_season;
       public         heap    tomate    false            �            1259    182229    teams_by_season_id_seq    SEQUENCE     �   CREATE SEQUENCE public.teams_by_season_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.teams_by_season_id_seq;
       public          tomate    false    210            �           0    0    teams_by_season_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.teams_by_season_id_seq OWNED BY public.teams_by_season.id;
          public          tomate    false    209            �            1259    174083    teams_team_id_seq    SEQUENCE     �   CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.teams_team_id_seq;
       public          tomate    false    208            �           0    0    teams_team_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;
          public          tomate    false    207            �            1259    232514    view_details    VIEW     j  CREATE VIEW public.view_details AS
 SELECT s.league_id,
    pts.season_id,
    m.round,
    m.week_no,
    m.stadium_id,
    m.match_id,
    m.match_date,
    pts.team_id,
    pts.player_id,
    md.action_id,
    md.half,
    md.minute
   FROM ((((public.players_by_team_by_season pts
     JOIN public.match_players mp ON ((mp.player_id = pts.player_id)))
     JOIN public.match_details md ON (((md.match_id = mp.match_id) AND (md.player_id = mp.player_id))))
     JOIN public.matches m ON (((m.match_id = md.match_id) AND (m.season_id = pts.season_id))))
     JOIN public.seasons s ON ((s.season_id = m.season_id)));
    DROP VIEW public.view_details;
       public          tomate    false    241    241    241    241    241    239    239    237    237    237    233    233    233    233    233    233    206    206            �            1259    232523 
   view_goals    VIEW     O  CREATE VIEW public.view_goals AS
 SELECT view_details.league_id,
    view_details.season_id,
    view_details.match_id,
    view_details.team_id,
        CASE
            WHEN (view_details.action_id = 1) THEN 1
            WHEN (view_details.action_id = 13) THEN 1
            ELSE 0
        END AS goals
   FROM public.view_details;
    DROP VIEW public.view_goals;
       public          tomate    false    243    243    243    243    243            �            1259    232531    view_goals_by_team_acum    VIEW     �  CREATE VIEW public.view_goals_by_team_acum AS
 SELECT l.league_name AS liga,
    s.season AS temporada,
    t.team AS equipo,
    sum(vg.goals) AS goles
   FROM (((public.view_goals vg
     JOIN public.leagues l ON ((l.league_id = vg.league_id)))
     JOIN public.seasons s ON ((s.season_id = vg.season_id)))
     JOIN public.teams t ON ((t.team_id = vg.team_id)))
  GROUP BY l.league_name, s.season, t.team
  ORDER BY s.season, (sum(vg.goals)) DESC;
 *   DROP VIEW public.view_goals_by_team_acum;
       public          tomate    false    245    204    204    206    206    208    208    245    245    245            �            1259    232527    view_goals_by_team_acum_ids    VIEW     
  CREATE VIEW public.view_goals_by_team_acum_ids AS
 SELECT view_goals.league_id,
    view_goals.season_id,
    view_goals.team_id,
    sum(view_goals.goals) AS goles
   FROM public.view_goals
  GROUP BY view_goals.league_id, view_goals.season_id, view_goals.team_id;
 .   DROP VIEW public.view_goals_by_team_acum_ids;
       public          tomate    false    245    245    245    245            �            1259    232519    view_goals_by_team_by_match    VIEW     �  CREATE VIEW public.view_goals_by_team_by_match AS
 SELECT view_details.league_id,
    view_details.season_id,
    view_details.round,
    view_details.match_id,
    view_details.team_id,
    count(view_details.action_id) AS goles
   FROM public.view_details
  WHERE (view_details.action_id = ANY (ARRAY[1, 13]))
  GROUP BY view_details.league_id, view_details.season_id, view_details.round, view_details.match_id, view_details.team_id;
 .   DROP VIEW public.view_goals_by_team_by_match;
       public          tomate    false    243    243    243    243    243    243            �            1259    224327    view_scores    VIEW     %  CREATE VIEW public.view_scores AS
 WITH report1 AS (
         SELECT pts.season_id,
            pts.team_id,
            pts.player_id,
            mp.match_id,
            md.action_id,
            md.half,
            md.minute
           FROM (((public.players_by_team_by_season pts
             JOIN public.match_players mp ON ((mp.player_id = pts.player_id)))
             JOIN public.match_details md ON (((md.match_id = mp.match_id) AND (md.player_id = mp.player_id))))
             JOIN public.matches m ON (((m.match_id = md.match_id) AND (m.season_id = pts.season_id))))
        ), report2 AS (
         SELECT report1.match_id,
            report1.team_id,
                CASE
                    WHEN (report1.action_id = 1) THEN 1
                    WHEN (report1.action_id = 13) THEN 1
                    ELSE 0
                END AS goles
           FROM report1
        )
 SELECT report2.match_id,
    report2.team_id,
    sum(report2.goles) AS goles
   FROM report2
  GROUP BY report2.match_id, report2.team_id
  ORDER BY report2.match_id;
    DROP VIEW public.view_scores;
       public          tomate    false    237    237    239    239    241    241    241    241    241    233    233    237            �            1259    232536    view_report4_marcadores    VIEW     �  CREATE VIEW public.view_report4_marcadores AS
 SELECT l.league_name AS liga,
    s.season AS temporada,
    m.week_no AS jornada,
    m.match_no AS no_partido,
    m.match_id,
        CASE
            WHEN (m.round = 0) THEN 'regular'::text
            WHEN (m.round = 1) THEN 'liguilla'::text
            WHEN (m.round = 2) THEN 'repechaje'::text
            ELSE NULL::text
        END AS fase,
    to_char(m.match_date, 'YYYY-MM-DD'::text) AS fecha,
    to_char(m.match_date, 'HH24:MM'::text) AS horario,
    st.stadium AS estadio,
    concat(lt.team, ' ', lvs.goles, ' - ', vvs.goles, ' ', vt.team) AS marcador,
    st.geom
   FROM (((((((public.matches m
     JOIN public.view_scores lvs ON (((lvs.team_id = m.local_team_id) AND (lvs.match_id = m.match_id))))
     JOIN public.teams lt ON ((lt.team_id = lvs.team_id)))
     JOIN public.view_scores vvs ON (((vvs.team_id = m.visitor_team_id) AND (vvs.match_id = m.match_id))))
     JOIN public.teams vt ON ((vt.team_id = vvs.team_id)))
     JOIN public.stadiums_mx st ON ((st.id = m.stadium_id)))
     JOIN public.seasons s ON ((s.season_id = m.season_id)))
     JOIN public.leagues l ON ((l.league_id = s.league_id)));
 *   DROP VIEW public.view_report4_marcadores;
       public          tomate    false    229    229    208    208    206    204    204    242    206    242    206    242    233    233    233    233    233    233    233    233    233    229    2    2    2    2    2    2    2    2            �           2604    182271    admin_level admin_lvl_id    DEFAULT     �   ALTER TABLE ONLY geodata.admin_level ALTER COLUMN admin_lvl_id SET DEFAULT nextval('geodata.admin_level_admin_lvl_id_seq'::regclass);
 H   ALTER TABLE geodata.admin_level ALTER COLUMN admin_lvl_id DROP DEFAULT;
       geodata          tomate    false    217    218    218            �           2604    182280    admin_lvl_2 alvl2_id    DEFAULT     ~   ALTER TABLE ONLY geodata.admin_lvl_2 ALTER COLUMN alvl2_id SET DEFAULT nextval('geodata.admin_lvl_2_alvl2_id_seq'::regclass);
 D   ALTER TABLE geodata.admin_lvl_2 ALTER COLUMN alvl2_id DROP DEFAULT;
       geodata          tomate    false    219    220    220            �           2604    182289    cities city_id    DEFAULT     r   ALTER TABLE ONLY geodata.cities ALTER COLUMN city_id SET DEFAULT nextval('geodata.cities_city_id_seq'::regclass);
 >   ALTER TABLE geodata.cities ALTER COLUMN city_id DROP DEFAULT;
       geodata          tomate    false    221    222    222            �           2604    182253 !   continent_zones continent_zone_id    DEFAULT     �   ALTER TABLE ONLY geodata.continent_zones ALTER COLUMN continent_zone_id SET DEFAULT nextval('geodata.continent_zones_continent_zone_id_seq'::regclass);
 Q   ALTER TABLE geodata.continent_zones ALTER COLUMN continent_zone_id DROP DEFAULT;
       geodata          tomate    false    213    214    214            �           2604    182244    continents continent_id    DEFAULT     �   ALTER TABLE ONLY geodata.continents ALTER COLUMN continent_id SET DEFAULT nextval('geodata.continents_continent_id_seq'::regclass);
 G   ALTER TABLE geodata.continents ALTER COLUMN continent_id DROP DEFAULT;
       geodata          tomate    false    211    212    212            �           2604    182262    countries country_id    DEFAULT     ~   ALTER TABLE ONLY geodata.countries ALTER COLUMN country_id SET DEFAULT nextval('geodata.countries_country_id_seq'::regclass);
 D   ALTER TABLE geodata.countries ALTER COLUMN country_id DROP DEFAULT;
       geodata          tomate    false    215    216    216            �           2604    174052    leagues league_id    DEFAULT     v   ALTER TABLE ONLY public.leagues ALTER COLUMN league_id SET DEFAULT nextval('public.leagues_league_id_seq'::regclass);
 @   ALTER TABLE public.leagues ALTER COLUMN league_id DROP DEFAULT;
       public          tomate    false    204    203    204            �           2604    216127    match_details match_detial_id    DEFAULT     �   ALTER TABLE ONLY public.match_details ALTER COLUMN match_detial_id SET DEFAULT nextval('public.match_details_match_detial_id_seq'::regclass);
 L   ALTER TABLE public.match_details ALTER COLUMN match_detial_id DROP DEFAULT;
       public          tomate    false    240    241    241            �           2604    207935    match_players id    DEFAULT     t   ALTER TABLE ONLY public.match_players ALTER COLUMN id SET DEFAULT nextval('public.match_players_id_seq'::regclass);
 ?   ALTER TABLE public.match_players ALTER COLUMN id DROP DEFAULT;
       public          tomate    false    239    238    239            �           2604    199704    matches match_id    DEFAULT     t   ALTER TABLE ONLY public.matches ALTER COLUMN match_id SET DEFAULT nextval('public.matches_match_id_seq'::regclass);
 ?   ALTER TABLE public.matches ALTER COLUMN match_id DROP DEFAULT;
       public          tomate    false    232    233    233            �           2604    199713    players player_id    DEFAULT     v   ALTER TABLE ONLY public.players ALTER COLUMN player_id SET DEFAULT nextval('public.players_player_id_seq'::regclass);
 @   ALTER TABLE public.players ALTER COLUMN player_id DROP DEFAULT;
       public          tomate    false    235    234    235            �           2604    207926    players_by_team_by_season id    DEFAULT     �   ALTER TABLE ONLY public.players_by_team_by_season ALTER COLUMN id SET DEFAULT nextval('public.players_by_team_by_season_id_seq'::regclass);
 K   ALTER TABLE public.players_by_team_by_season ALTER COLUMN id DROP DEFAULT;
       public          tomate    false    237    236    237            �           2604    174061    seasons season_id    DEFAULT     v   ALTER TABLE ONLY public.seasons ALTER COLUMN season_id SET DEFAULT nextval('public.seasons_season_id_seq'::regclass);
 @   ALTER TABLE public.seasons ALTER COLUMN season_id DROP DEFAULT;
       public          tomate    false    206    205    206            �           2604    199695    stadiums_by_team id    DEFAULT     z   ALTER TABLE ONLY public.stadiums_by_team ALTER COLUMN id SET DEFAULT nextval('public.stadiums_by_team_id_seq'::regclass);
 B   ALTER TABLE public.stadiums_by_team ALTER COLUMN id DROP DEFAULT;
       public          tomate    false    231    230    231            �           2604    199676    stadiums_mx id    DEFAULT     p   ALTER TABLE ONLY public.stadiums_mx ALTER COLUMN id SET DEFAULT nextval('public.stadiums_mx_id_seq'::regclass);
 =   ALTER TABLE public.stadiums_mx ALTER COLUMN id DROP DEFAULT;
       public          tomate    false    229    228    229            �           2604    174088    teams team_id    DEFAULT     n   ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);
 <   ALTER TABLE public.teams ALTER COLUMN team_id DROP DEFAULT;
       public          tomate    false    207    208    208            �           2604    182234    teams_by_season id    DEFAULT     x   ALTER TABLE ONLY public.teams_by_season ALTER COLUMN id SET DEFAULT nextval('public.teams_by_season_id_seq'::regclass);
 A   ALTER TABLE public.teams_by_season ALTER COLUMN id DROP DEFAULT;
       public          tomate    false    209    210    210            �          0    182268    admin_level 
   TABLE DATA           M   COPY geodata.admin_level (admin_lvl_id, admin_type, insert_date) FROM stdin;
    geodata          tomate    false    218   ��       �          0    182277    admin_lvl_2 
   TABLE DATA           c   COPY geodata.admin_lvl_2 (alvl2_id, country_id, admin_lvl_id, admin_name, insert_date) FROM stdin;
    geodata          tomate    false    220   ׼       �          0    182286    cities 
   TABLE DATA           L   COPY geodata.cities (city_id, alvl2_id, city_name, insert_date) FROM stdin;
    geodata          tomate    false    222   K�       �          0    182250    continent_zones 
   TABLE DATA           c   COPY geodata.continent_zones (continent_zone_id, continent_id, zone_name, insert_date) FROM stdin;
    geodata          tomate    false    214   N�       �          0    182241 
   continents 
   TABLE DATA           P   COPY geodata.continents (continent_id, continent_name, insert_date) FROM stdin;
    geodata          tomate    false    212   ��       �          0    182259 	   countries 
   TABLE DATA           l   COPY geodata.countries (country_id, continent_id, continent_zone_id, country_name, insert_date) FROM stdin;
    geodata          tomate    false    216   �       ~          0    174049    leagues 
   TABLE DATA           ^   COPY public.leagues (league_id, league_lvl, country_id, league_name, insert_date) FROM stdin;
    public          tomate    false    204   >�       �          0    216124    match_details 
   TABLE DATA           s   COPY public.match_details (match_detial_id, match_id, half, minute, action_id, player_id, insert_date) FROM stdin;
    public          tomate    false    241   ��       �          0    207932    match_players 
   TABLE DATA           Z   COPY public.match_players (id, match_id, player_id, is_beginner, insert_date) FROM stdin;
    public          tomate    false    239    �       �          0    199701    matches 
   TABLE DATA           �   COPY public.matches (match_id, season_id, stadium_id, match_no, week_no, round, local_team_id, visitor_team_id, match_date, insert_date) FROM stdin;
    public          tomate    false    233   �       �          0    199710    players 
   TABLE DATA              COPY public.players (player_id, player_name, last_name, nick_name, birthday, nationality, insert_date, "position") FROM stdin;
    public          tomate    false    235   �       �          0    207923    players_by_team_by_season 
   TABLE DATA           �   COPY public.players_by_team_by_season (id, season_id, team_id, player_id, tshirt, start_date, end_date, insert_date) FROM stdin;
    public          tomate    false    237   ��       �          0    174058    seasons 
   TABLE DATA           b   COPY public.seasons (season_id, league_id, season, start_date, end_date, insert_date) FROM stdin;
    public          tomate    false    206   ��       �          0    198918    spatial_ref_sys 
   TABLE DATA           X   COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
    public          tomate    false    224   '�       �          0    199692    stadiums_by_team 
   TABLE DATA           P   COPY public.stadiums_by_team (id, stadium_id, team_id, insert_date) FROM stdin;
    public          tomate    false    231   D�       �          0    199673    stadiums_mx 
   TABLE DATA           W   COPY public.stadiums_mx (id, geom, stadium, city_id, lat, lon, coordinate) FROM stdin;
    public          tomate    false    229   ��       �          0    174085    teams 
   TABLE DATA           v   COPY public.teams (team_id, team, country_id, team_type, since_date, common_name, nick_name, insert_date) FROM stdin;
    public          tomate    false    208   V�       �          0    182231    teams_by_season 
   TABLE DATA           N   COPY public.teams_by_season (id, season_id, team_id, insert_date) FROM stdin;
    public          tomate    false    210   D�       �           0    0    admin_level_admin_lvl_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('geodata.admin_level_admin_lvl_id_seq', 2, true);
          geodata          tomate    false    217            �           0    0    admin_lvl_2_alvl2_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('geodata.admin_lvl_2_alvl2_id_seq', 32, true);
          geodata          tomate    false    219            �           0    0    cities_city_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('geodata.cities_city_id_seq', 17, false);
          geodata          tomate    false    221            �           0    0 %   continent_zones_continent_zone_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('geodata.continent_zones_continent_zone_id_seq', 3, true);
          geodata          tomate    false    213            �           0    0    continents_continent_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('geodata.continents_continent_id_seq', 6, true);
          geodata          tomate    false    211            �           0    0    countries_country_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('geodata.countries_country_id_seq', 46, true);
          geodata          tomate    false    215            �           0    0    leagues_league_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.leagues_league_id_seq', 1, true);
          public          tomate    false    203            �           0    0 !   match_details_match_detial_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.match_details_match_detial_id_seq', 127, true);
          public          tomate    false    240            �           0    0    match_players_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.match_players_id_seq', 135, true);
          public          tomate    false    238            �           0    0    matches_match_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.matches_match_id_seq', 36, true);
          public          tomate    false    232            �           0    0     players_by_team_by_season_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.players_by_team_by_season_id_seq', 208, true);
          public          tomate    false    236            �           0    0    players_player_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.players_player_id_seq', 293, true);
          public          tomate    false    234            �           0    0    seasons_season_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.seasons_season_id_seq', 2, true);
          public          tomate    false    205            �           0    0    stadiums_by_team_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.stadiums_by_team_id_seq', 18, true);
          public          tomate    false    230            �           0    0    stadiums_mx_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.stadiums_mx_id_seq', 17, true);
          public          tomate    false    228            �           0    0    teams_by_season_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.teams_by_season_id_seq', 36, true);
          public          tomate    false    209            �           0    0    teams_team_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.teams_team_id_seq', 18, true);
          public          tomate    false    207            �           2606    182274    admin_level admin_lvl_id_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY geodata.admin_level
    ADD CONSTRAINT admin_lvl_id_pkey PRIMARY KEY (admin_lvl_id);
 H   ALTER TABLE ONLY geodata.admin_level DROP CONSTRAINT admin_lvl_id_pkey;
       geodata            tomate    false    218            �           2606    182283    admin_lvl_2 alvl2_id_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY geodata.admin_lvl_2
    ADD CONSTRAINT alvl2_id_pkey PRIMARY KEY (alvl2_id);
 D   ALTER TABLE ONLY geodata.admin_lvl_2 DROP CONSTRAINT alvl2_id_pkey;
       geodata            tomate    false    220            �           2606    182292    cities city_id_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY geodata.cities
    ADD CONSTRAINT city_id_pkey PRIMARY KEY (city_id);
 >   ALTER TABLE ONLY geodata.cities DROP CONSTRAINT city_id_pkey;
       geodata            tomate    false    222            �           2606    182247    continents contid_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY geodata.continents
    ADD CONSTRAINT contid_pkey PRIMARY KEY (continent_id);
 A   ALTER TABLE ONLY geodata.continents DROP CONSTRAINT contid_pkey;
       geodata            tomate    false    212            �           2606    182256 &   continent_zones continent_zone_id_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY geodata.continent_zones
    ADD CONSTRAINT continent_zone_id_pkey PRIMARY KEY (continent_zone_id);
 Q   ALTER TABLE ONLY geodata.continent_zones DROP CONSTRAINT continent_zone_id_pkey;
       geodata            tomate    false    214            �           2606    182265    countries country_id_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY geodata.countries
    ADD CONSTRAINT country_id_pkey PRIMARY KEY (country_id);
 D   ALTER TABLE ONLY geodata.countries DROP CONSTRAINT country_id_pkey;
       geodata            tomate    false    216            �           2606    199698    stadiums_by_team id2_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.stadiums_by_team
    ADD CONSTRAINT id2_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.stadiums_by_team DROP CONSTRAINT id2_pkey;
       public            tomate    false    231            �           2606    207929 "   players_by_team_by_season id3_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.players_by_team_by_season
    ADD CONSTRAINT id3_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.players_by_team_by_season DROP CONSTRAINT id3_pkey;
       public            tomate    false    237            �           2606    207938    match_players id4_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.match_players
    ADD CONSTRAINT id4_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.match_players DROP CONSTRAINT id4_pkey;
       public            tomate    false    239            �           2606    182237    teams_by_season id_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.teams_by_season
    ADD CONSTRAINT id_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY public.teams_by_season DROP CONSTRAINT id_pkey;
       public            tomate    false    210            �           2606    174055    leagues league_id_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.leagues
    ADD CONSTRAINT league_id_pkey PRIMARY KEY (league_id);
 @   ALTER TABLE ONLY public.leagues DROP CONSTRAINT league_id_pkey;
       public            tomate    false    204            �           2606    216130 "   match_details match_detial_id_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.match_details
    ADD CONSTRAINT match_detial_id_pkey PRIMARY KEY (match_detial_id);
 L   ALTER TABLE ONLY public.match_details DROP CONSTRAINT match_detial_id_pkey;
       public            tomate    false    241            �           2606    199707    matches match_id_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.matches
    ADD CONSTRAINT match_id_pkey PRIMARY KEY (match_id);
 ?   ALTER TABLE ONLY public.matches DROP CONSTRAINT match_id_pkey;
       public            tomate    false    233            �           2606    199716    players player_id_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.players
    ADD CONSTRAINT player_id_pkey PRIMARY KEY (player_id);
 @   ALTER TABLE ONLY public.players DROP CONSTRAINT player_id_pkey;
       public            tomate    false    235            �           2606    174064    seasons season_id_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.seasons
    ADD CONSTRAINT season_id_pkey PRIMARY KEY (season_id);
 @   ALTER TABLE ONLY public.seasons DROP CONSTRAINT season_id_pkey;
       public            tomate    false    206            �           2606    199678    stadiums_mx stadiums_mx_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.stadiums_mx
    ADD CONSTRAINT stadiums_mx_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.stadiums_mx DROP CONSTRAINT stadiums_mx_pkey;
       public            tomate    false    229            �           2606    174091    teams team_id_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.teams
    ADD CONSTRAINT team_id_pkey PRIMARY KEY (team_id);
 <   ALTER TABLE ONLY public.teams DROP CONSTRAINT team_id_pkey;
       public            tomate    false    208            �           1259    199682    sidx_stadiums_mx_geom    INDEX     L   CREATE INDEX sidx_stadiums_mx_geom ON public.stadiums_mx USING gist (geom);
 )   DROP INDEX public.sidx_stadiums_mx_geom;
       public            tomate    false    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    229            �   9   x�3�,.I,I�4202�50�54V04�2��2��2��-��L�,H��,�Ī$F��� F��      �   d  x����J�0����)�K�/w�(��i��xs㚑%#Md��zꕜB/N���e�e,�>Dh$�lPM�G\F��-��C1�b2�y;pG(�i��y����NU��Ը�Z��d�(:A�*_(6EVk8���?YGHe�h]�ڐ���F�H�F�\E��H�Zz��1B�5��^y�b�;��g	�u��6���T�#�W�e�@�%1&+�WƑq��7xH��6Q}�b���jpI��m���'�1�c
��Ÿ谶!�C��h��*��:�غ�M�`�J[0�^�U�:OK���=���w����c���K���)���<HH��^��@���o�$������<���3�      �   �   x����N�0Dϓ�����N��Vq��

�'�eI,He�Ȏ��IA\���ٙ�*܅���Х6��ސQ������Xm�-4h�S�}��D�p	1� Z�A��G�X���g����I�N��ԉ�"
kP����7Є6�7/b;��Oa�wڃ��_Σ��S���3G���p|Ϝ:��g�D\C۟��yH�sH�(0�x����%4.�5�(�n��>_9�p��]t3� ��ۢ(�+��      �   S   x�3�4���/*�Pp�M-�LN�4202�50�54V04�2��20�307500�2*�/%N�1�1�ofJJN��kbq	>�1z\\\ ��=      �   V   x�3�t�M-�LN�4202�50�54V04�24�2��2�tL�)i��X��]ʄ�1�$���VSN����<��8]K��R�J��qqq ��'�      �     x���Mr�0���)t{���;�Bfd��L�Ʌ�춫���Xi���
����R������R�����4j8����C'�n8��PB�����J�����O�\�Ќ���2�����D��}n�\3a�<��7%b ^�1�z�����Ќ~s�RUɬFM�8���L�,��?�]YPw�e����d�%9e�lImJ�]�l���8l��B��{8�F�TUY�+|��+���.��`�S�����LHaװACβe��
F\fW�K��_��Y��"&��%4K+T�]�� ���\4 ���������>�,\�b-��s�i�i-ٛ$s��j�hTn>R�#�*��U	�q\R��ccWB�c�6���m�o�9+}n���[i�δ}u�\	욎�C4��E���rC�>��G\x��2/��>*��8�[ʁ[���qeXR}+��������9�<W�ڒ7��ܚma^�7��"�x�df�܈�G����3������?�N����/�wt�K���x6��˶����������      ~   7   x�3�4�44���LOT���4202�50�54R0��22�20�315334����� ��      �   �  x���ۭ#1C�'U��,?d)�l�u�d+� �����H?2te����tQ�r��O�?�=����3�Tji�Ȏ��eXAdYd�2ԬA�i*!�-�^*��MS�}ӤT*e1Q��.�0H��7�Q�T�!9����hY� C6��>V\j�a���NQ�D	�d�ꮚ`s�d+�&�p9Ⲥ�%�/9��d衯9�R�U8Yߡ�۠y�{�I�N��ˋ�������+g���n��캞5`5X��CI�u�Y
V�x�yc�e�����AtN�A�-�WV �7]��taJ�f��	D#4 ������TZh�݆Ј���8T�FfB� �u�� ��]���*0���OW��B��ث�p�-m�n�qI[�F^��<�qi傍i��C��F��l)�gN�$�^�f����h�6)C;Dy���X�d��5�/�
YY�_������&[�MR�_�`�/ts�|�� �la����b��nyg+답>V����p*G�H��Q��z�f�?�q!���zã��:=;̐-���=����[�<t�_^�Y�O�ǖo��]kۭ)d��=H�u�@6r�q<�9H^��V��Dn<��
�&���~�G��ź�6�����.�C�f:nd������uHN�S#�>���G�b��-7]��֛.�Fn~��U��,?{Ɵ�N�0.��b�aDp�φ)���oߦ�����P.�x�V��tKz���J{)�b��;稽RMr{�~e���q���_Qh����O�7�с|X?���&�R�t�OG_Y,��Q��j�t�-?�R0Z7�t���ٕhAB�Z+;�����v�G��@w�
�<3�C��"Ӈ5͂��gh�߱Hʇ��<��d�}�������1���y�+:3�����z<� ���      �   �  x���A�� D��)��		$�%� ��@+�q��^�+��I|949�ڴ����ri��?�s�<u3�����w�6�rl��66����ab3��$v�ޡ��M��D@���@y�Z� R�O{��{$��|�T�}��D���B�I)�O��"{���+��3Uߌ`��B�K�;���+)֫��W���&��ْ+�X�n�?��/�K��a��V�$���D6����'d�m�c�
�I-���)�����~�ʂ��k��D���d��`Q�$���B���t�?�7:ҟđ#�I�{M��΃��L����&`��XM�:�_�3	�|��� �0X�`��c�����_��%�sv�su�$����0!X����1`�`R�Ls������I��Љ�Y�U+ƪ�#NgYp�4ʂ�Q�8����i�'N�,8qe���(N,DY���V<	VFǲ,� XY0V�,��,C	VF#��W��.��K��~�������uM���鉙��ۍ�Z'�1�ߩ����ɾ�-T��GJw-cT�����˾Ij�~�x�"������;�v���ĂJ0A�������3�u`�B��C��^��X��ZQv����$P�I�r�:H���zV[�X9`y((qQHP6��Pe$(k#�񣬍�5�U�������I��,4�hYH��Bo��� ��<?&���_��<����v      �   �  x����m�0�3Sx�"���Y���ò夀Y���"�Y�N� ����@��3�gN�wJ�{�y����F|1r*� U T���	Y	�
�������?�τ�=@v��+�<Ђ��o����"�(�雖r�iC��wQf覗6��>P����O�ǡ��{=�uX�$�.{8 � ���l�+"�CTvkh	�l��\��@ri%�B���W�����P�A}T�C3�d����=֋�2��B��v�ZkEDz��TjFw�Y�����Z��>�s,��y���z��9B'BC�����LHrD]�A�]dO8ʎ��q��#%��,��+ R���,�b�J��,�d�t�����M�Ki%����	�*ԏx<:sE񍠢�"~�ѐ1l������Q�Ț.�<:����[���΁�4-�>��7P��Q/�@�����ͱ���"�*�}�X�8bMЈ������
dSW����<����q8:��#������,ɔ�      �   �  x��[�RI]��B?`��v�166�ћDJ ۥ*O�Jݰ��|K,:zV�^M�؜[/	��JM��p`e�}�{��T��
���i��4_e����_>5�q?X�;;���z�Nlّ��_G�����*�����O�И�ĕH��}όWt,vœ���W!Sc��.$�� =+_��>���]p����Ȑ�sq�gO<͌��������f�βy��N�J�	Ss�k�+d���G\���y�ʌ]c���K:�	�'��r]�q*������k�Mܹ;�	��݊$��8ǜ
5�Rv�Ӝ�8"� ^��r�O�gc`�N�t*��}!�Ƹ��rήģy>�1;��>c�\�fs��y;*Ao�b'��t�2vR�53������{���<������T�'��Lm�]��'���:1=��	%f��|um�@Ώ\��H/��^	a�i�L�AQC��q�Gģ�;)�*�2����T����2ާo�p% ��BM�Q�8��g��I�w���`�(d�g��G�ﱏs�q�s��y��}x�?�_����~�yJ�*��*����O�sb��[ځ*�1Q-<.�T��^}x.�)���791^/�Ob!+�f�!0rj"=)rY��-���p�BN���C�9��m`���	�M�����P2I���"���n�苋��pײv�p']��ٖ�N���=F���k�;��A��;�QO�V@�l^�ω\����M�g\����j`;�JN�-2�#��փn%���s!4���!Ť.�7<_���N���#?�K95>�m�c�?
s$��.�5X�Ղ���T�8z�N�ћ4Y�m�TN̎J@��+}�ACQ���dמ��Gˁ}d��\��/��AzX�̪���s�$2��X�]�&�ܙ�Jz��^ջP�<� X^����ҥ@(<�y��A5��|�f Āv	�jBN��̈L��qg����ya��;
�n�Q0繡�pG�]��*�l��B�b�v(js� 7`xt�U�bݮLf���~�|�m������ו6U���@ڰ˭�
����D A�y���j4gXM���-=�f_S.پLn��.� ���v�����٪{ .`_+���r6�<G^��^��fb�w.x��˿̔�=rk�q!��Pu:�N�KUg�kq��yŦ��D��p�$��t�3E�_�jg�lx��f&qF�ߤ52���>�j�e{4�2Mn��3�뇪���4�0l4 F;�G�Ć:��H�Wm��QË�z�g�f��z#�8�z�G�0�h
"�`� CV�F��*�׵*Zm��V
��W�z�3��VXo���A;�������a<j���E����B��iE��Mci�$�Cd4S�M�M�E!ā�`�:j;�v�b�����_ߍW���F@�=��6��>8͍ak��a��Щv̶�f�#Ԋ��ND��PiI\���d!��:ʠ��~.�?�n����:��Z�'EzX\�%ėLik�h[;�s�����P���_�:Q�o���Z�
�g� ����%a7�>)�._L�� ��NPMuj[�����(2���)%$܁���!ڲ?X��<hw�ۋ'���B��a�UZ��#��/[�Xu�Hث���R773EE¨�S�s��:�s��%�\���	��"S�dcu�a���!ث5�H'�n�j�"�%0$�����x'�۾���/�d��䁤��! \�mN�NWF2�/����ѣ��hr��l�G��䀤�\v������m�C9N�����ց�?�
�[�lfd��ݐ�H�|7H,����P���GЀ�g��*���B���H��ݸ"�ųV���X^T�`�����r~(\<��8'�BpC�z�p�TVS�d�	�Т.S��R>������_�������]w8耈�5E�U�Ac�m�~V���4e�.׷t�o���?B8���w@�4�,_��j���.��"��R�B=S�S��H�|pr��f���}@DXuc#���~�s�w���^�J3�Ś�Qgf9�V�ar��i���A8�q�Zj�A��n�ת�������㜗�����L�^��m�B�� �ʋ�j��у��}d�ji��B���{�]�η߬�}۸�$M��`w`A�������>��񵄢�|LDr̉w�x' W�4�����\D���H�be�Ȣ��fҘ�mp6���)����Nw�Nc���c�vZ��l�o���פ|�#�Зk���� $��d��=0h�d
wm��^餘�|��C��/WL:m�o��A��˺1�*}R�<zؔ�����mC�z6���{�%R+M�8��|�/v�������&�}2�X4"�HwU�8��0�z���U��Ʉߚ�H�(�5�SC��(3����\v�m�nX52��FOD��N	�����`���/��D��P��BY)y���p���_pc�۶B[ى��<�5'�jT���F��I$�ow��a����|�|��R�FWs|� �j�E?q܍�׆ӛk�7r�6����5����{E�.kY�Ъ���^��O߼�-'"{�lnXf�A��(� v��I�X~�J�K}g��c�X�t"���ObFr��jY�: �l4���BA�</�c��Ԭ�Æ�˱�fR�϶�5v,H�]/�q� �.��n�v��K��Ԁm�S=qB+p�f7��۶t y��+�S�0,d{�c�����p��y��E��7�L��lz}a�;q8A�v���o5W�o_ll���P�2����B�˜Z�w�Λ��5/�U�ʑUw����s��
�^/S/�w���*tĨ"T]�cu�:[�����B��x|��
,��y�zz��-�|�:z���C�W3��L�r-�7�>�uW�������>��S%׀�ˮ:Hk�vw,�e�qݪ�(v�¾� ��IA��^2[���� 8Ȓb}���΍�V݋�Nhad��[��,͹f��%�rwW��c�+ɻW�6b��$K��9��b*�Ww,����3�@��uvc�>�guo���o>-�<��]Wi}^񜕔��Xuc��-a�S�S´��\�k/bzQ>�Tt�v\/�@�7�γ���o�Ѝ��y:�MJ{�QSܾB�u3�\�E��t��O��[l�Qe����3��M8��2@jwO=�s�?z1Dj���wX�U�'|����F�����Y{�1���wN��?��I\d¡�3SkS�>��t�U���@W�����o�6��ظ휷�*D=g�=;�ܰ�EB`7Ì}�Ѝf#��#�j�Y�k(�N%]F���L�t�����1Ye��@�)�C����O���`9��I��u�%��B�r^�=���z����,c�|AM�4��q�t��(��x
�e�\#ݵi�wC[�����FCr�Psv
�&�ײm�51��G$����h�o,'�G��ls��P0�|䞰{ev���T������MՅ�U3<��u7����>TԶ�T� �Ly	����u"O�J5��s���rj�6㞾iA/Уw��;���W{�0�}���TE��+���{��}�)�o��5Ms;��RpI=����A���2����}���7��C(pS�r�����Vc{hPߋt�/mWm��2���eG���F�f5���3����|      �   �  x����q&+��g�p�I\'���� �wMW��.?}��F��"��v��o�rb�N����'ɓ�'g�Tn^l�������;���E�.f�����9�W�-���^Ѿ盔~e�f��﬎��rQ�]�ډKvж�ύ{��y��0��>�h�OE�hX��x���4�w�LTM�E�6�%p�x��s`ڼ}�rE"p�د������lxl���B����}��w�>B9���G�D0�)�钌���/d�\X���#Ͽ�y:�%�# �騡�m��XX�Y:z(�Y:�pT�QJ)��e8����H��n�����PZ��U�M���E�����[&���W��� ��w�	 ߜ�j���x�x�f|8�*�+_��*)��y!xv^Cv�[�]M|����;�_d>�︻�k=�>��\MÑ���Z)27�Qz���e�"��\�Q��\��$�ݯn)`o]��Q��Y��� �H���J⻖�υ��xݸ�+0��ۦ�@<�n��8<�axG��7ݒM���v�d��ˍΆ�3|�bgP� n��
�>h�s�!ȭn~VTH n���g{ pw4��}��hO0��ƻY�1��ȁ����7O�z����<�9��'�˾0����D���ѓ�#�SK����ۙ9������G(���dܳ�^�B��n��o|��.�'>��(D N�8	 g�ѱ�^�����
*����o@�������>����{=j���L��v�Ӟ<�n�j�z���Um^k`���^|���kF5��X���.���ƃ
��f� ��}�%߳��<JQ�_�K��"���Y���4��,ċ�Aw�;��+h�o�j�:md��6��d��6���<P �̭�>��̭��e3��wTě���L��\X�o��v�f��9!|5Qzp*z��_��r��)�oگOS �E|7^{�#�?�'P�`�AM��$ �/$`d�0 �����G��z����|u	���֖��}�ma�w�;cĻϰ���>kwێ4��6�����fmU��D���-�������nSdS���A��x�y��)��e��H�y?PM�b�_�&O�c�_�&ϱX�OTS����]�C�b?QM}}B��KH��j
��HP]�����]��ͬ��y�A��
����e����Tedp�GqAmd�X����F���#��`��P���ۧ�-i�I�Ӛ^��=k>]?_�^h���?_��=	Ҽ��e�=H�=���ƣ�ׅGo{�Cm���ѷ�=��};�QK;������A<<5��ꧬ��ՆOA��A���H��O�TJg�wM_��	FrA?o�P@.��
��Z�������W@Q\!�[T�U���r���w���� (p���߉����g���z�Ў�*�k�]G��5zч�Y��WțѰW��ꂳW��یZ(�t��k���I���[n������4��      �   j   x�]�=
�0�g�S�6Oz����^#��l��ܿ�!��>8��g�}�Js�y��ԡ�x��Ղsլ6�P�N�����1����q!�im��h*Ȳ�	      �      x������ � �      �   |   x�}л1ј���AC�����νX@	_���y�v�y�>���y�u|{q��?h��[N�a9��X����V���(@�{<�� �O�,JK��JO���H�L�L���J��N�l�ޥ�/�p=      �   v  x�m�I��8E��)�,/J`p���T�j�J�v.}�st�N[Հ�������	B_�Ӫ�Q�Q.�#A�.d�aD*�c���{�$@@��2ֈ�1����c]��/A��ӤP�5�L5�Ts1+۠"�B�DF��I2�5���	'��#8�?0kk�7�%ȷp����ɩ8]B'��@�I�n�r_�e�7��כ����Wa\� nf�����+���[`�F[��u5�62��B�_��B��3��fP��[�o�4��>V�S��[U9Wkk5�a�q]>�v[��n�����۳�������]9Mx�l�C_�V���E��*&��\�޸�e�_���#0&��� �����4�#4k�ŀa���y#�<p�A���zY���| ܇�%ȷp��.���L������m�������Wz�0@��I����E��i�,�2d��j@ҩa�P��\2��CD�ap�i0����hOA��iu@Co-�xk*G�7mI�9ee���r�X�*S��z�?ڸ��137
�V ;�x	�-0��ZBF�"��n5��jI[aX�\r�H��^CP�t���w��f�"w��G�C�X�+��|FN3�jc������m�g��7�ɍ.˰���3�<w$:�;��.0�(�J��9�<��k��X����~�/���*�um�	>�"'����~+rWx:}\�1T�\�<�)�P[���t^��^�n����N�9F�^_��%�˕�E�s)�����Z�����<Q��<Q���D�|�>J ��`��P�8R
(�z�&;v���e����^9�]��E�
�"����L�<L6����x�;����_KY7a�X��9�����ܕ���<M��9�<      �   �   x���Mj�@���)|��'NwC�b�:�lTW�L,h}���D���{B2pW��D0��ln�,�3cSk���T;[�Cc�.,+��?��ﴬᖶt�E�Vb��K4k�����Q��m�G���9�E�<](*���rX��U(� =O����wӴ���@%:�h��٧�8_�4c�p�M�oW�A�j{�e�\5a��o�q>GV��.I�_G�ˋ      �   �   x�}һ�0��:���'��^�d�9B�R�ù�O��g����_���[4/��*�\�A����UAˠ��g�U02*�L�R�ʄ��� '�'
)
�B����� +�+)�B�"a��Y\�����f�b��W��!��߆v*�~[ک��mj�"﷭�����v*ŪL��Rթ
��d�tu�B�:a!e����NZH[�-$��)�� w;�V     