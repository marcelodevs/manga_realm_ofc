toc.dat                                                                                             0000600 0004000 0002000 00000070067 14621475613 0014462 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       8                     |         
   MangaRealm    15.2    15.2 ^    ~
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         
           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         Ç
           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         ü
           1262    33391 
   MangaRealm    DATABASE     â   CREATE DATABASE "MangaRealm" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE "MangaRealm";
                postgres    false         ▄            1259    33568    cache    TABLE     ü   CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);
    DROP TABLE public.cache;
       public         heap    postgres    false         ¦            1259    33575    cache_locks    TABLE     Ö   CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);
    DROP TABLE public.cache_locks;
       public         heap    postgres    false         Û            1259    33652 
   categories    TABLE     ╠   CREATE TABLE public.categories (
    id bigint NOT NULL,
    category_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.categories;
       public         heap    postgres    false         Ú            1259    33651    categories_id_seq    SEQUENCE     z   CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categories_id_seq;
       public          postgres    false    234         é
           0    0    categories_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;
          public          postgres    false    233         Þ            1259    33640    chapters    TABLE     4  CREATE TABLE public.chapters (
    id bigint NOT NULL,
    manga_id bigint NOT NULL,
    index integer NOT NULL,
    title character varying(255) NOT NULL,
    sketch boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    content text NOT NULL
);
    DROP TABLE public.chapters;
       public         heap    postgres    false         þ            1259    33639    chapters_id_seq    SEQUENCE     x   CREATE SEQUENCE public.chapters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.chapters_id_seq;
       public          postgres    false    232         â
           0    0    chapters_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.chapters_id_seq OWNED BY public.chapters.id;
          public          postgres    false    231         Ô            1259    33600    failed_jobs    TABLE     &  CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.failed_jobs;
       public         heap    postgres    false         ß            1259    33599    failed_jobs_id_seq    SEQUENCE     {   CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.failed_jobs_id_seq;
       public          postgres    false    226         ä
           0    0    failed_jobs_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;
          public          postgres    false    225         Ó            1259    33592    job_batches    TABLE     d  CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);
    DROP TABLE public.job_batches;
       public         heap    postgres    false         ▀            1259    33583    jobs    TABLE     °   CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);
    DROP TABLE public.jobs;
       public         heap    postgres    false         Ì            1259    33582    jobs_id_seq    SEQUENCE     t   CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.jobs_id_seq;
       public          postgres    false    223         à
           0    0    jobs_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;
          public          postgres    false    222         ý            1259    33659    manga_categories    TABLE     Ì   CREATE TABLE public.manga_categories (
    id bigint NOT NULL,
    manga_id bigint NOT NULL,
    category_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 $   DROP TABLE public.manga_categories;
       public         heap    postgres    false         Ù            1259    33658    manga_categories_id_seq    SEQUENCE     Ç   CREATE SEQUENCE public.manga_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.manga_categories_id_seq;
       public          postgres    false    236         å
           0    0    manga_categories_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.manga_categories_id_seq OWNED BY public.manga_categories.id;
          public          postgres    false    235         µ            1259    33624    mangas    TABLE     t  CREATE TABLE public.mangas (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    image character varying(255) NOT NULL,
    synopsis character varying(500) NOT NULL,
    qtd_chapter integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    categorys json NOT NULL
);
    DROP TABLE public.mangas;
       public         heap    postgres    false         Õ            1259    33623 
   mangas_id_seq    SEQUENCE     v   CREATE SEQUENCE public.mangas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.mangas_id_seq;
       public          postgres    false    230         ç
           0    0 
   mangas_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.mangas_id_seq OWNED BY public.mangas.id;
          public          postgres    false    229         Î            1259    33535 
   migrations    TABLE     ç   CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);
    DROP TABLE public.migrations;
       public         heap    postgres    false         Í            1259    33534    migrations_id_seq    SEQUENCE     ë   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public          postgres    false    215         ê
           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public          postgres    false    214         ┌            1259    33552    password_reset_tokens    TABLE     │   CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);
 )   DROP TABLE public.password_reset_tokens;
       public         heap    postgres    false         õ            1259    33612    personal_access_tokens    TABLE     ├  CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 *   DROP TABLE public.personal_access_tokens;
       public         heap    postgres    false         Ò            1259    33611    personal_access_tokens_id_seq    SEQUENCE     å   CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.personal_access_tokens_id_seq;
       public          postgres    false    228         ë
           0    0    personal_access_tokens_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;
          public          postgres    false    227         █            1259    33559    sessions    TABLE     Î   CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);
    DROP TABLE public.sessions;
       public         heap    postgres    false         ┘            1259    33542    users    TABLE     @  CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    current_team_id bigint,
    profile_photo_path character varying(2048),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    two_factor_secret text,
    two_factor_recovery_codes text,
    two_factor_confirmed_at timestamp(0) without time zone
);
    DROP TABLE public.users;
       public         heap    postgres    false         Ï            1259    33541    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    217         è
           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    216         ®           2604    33655 
   categories id    DEFAULT     n   ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);
 <   ALTER TABLE public.categories ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    233    234         ¿           2604    33643    chapters id    DEFAULT     j   ALTER TABLE ONLY public.chapters ALTER COLUMN id SET DEFAULT nextval('public.chapters_id_seq'::regclass);
 :   ALTER TABLE public.chapters ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    231    232         ñ           2604    33603    failed_jobs id    DEFAULT     p   ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);
 =   ALTER TABLE public.failed_jobs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    226    226         ú           2604    33586    jobs id    DEFAULT     b   ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);
 6   ALTER TABLE public.jobs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223         ¬           2604    33662    manga_categories id    DEFAULT     z   ALTER TABLE ONLY public.manga_categories ALTER COLUMN id SET DEFAULT nextval('public.manga_categories_id_seq'::regclass);
 B   ALTER TABLE public.manga_categories ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    236    236         º           2604    33627 	   mangas id    DEFAULT     f   ALTER TABLE ONLY public.mangas ALTER COLUMN id SET DEFAULT nextval('public.mangas_id_seq'::regclass);
 8   ALTER TABLE public.mangas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    230    230         í           2604    33538 
   migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215         ª           2604    33615    personal_access_tokens id    DEFAULT     å   ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);
 H   ALTER TABLE public.personal_access_tokens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    228    228         ó           2604    33545    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217         k
          0    33568    cache 
   TABLE DATA           7   COPY public.cache (key, value, expiration) FROM stdin;
    public          postgres    false    220       3435.dat l
          0    33575    cache_locks 
   TABLE DATA           =   COPY public.cache_locks (key, owner, expiration) FROM stdin;
    public          postgres    false    221       3436.dat y
          0    33652 
   categories 
   TABLE DATA           O   COPY public.categories (id, category_name, created_at, updated_at) FROM stdin;
    public          postgres    false    234       3449.dat w
          0    33640    chapters 
   TABLE DATA           g   COPY public.chapters (id, manga_id, index, title, sketch, created_at, updated_at, content) FROM stdin;
    public          postgres    false    232       3447.dat q
          0    33600    failed_jobs 
   TABLE DATA           a   COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
    public          postgres    false    226       3441.dat o
          0    33592    job_batches 
   TABLE DATA           û   COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
    public          postgres    false    224       3439.dat n
          0    33583    jobs 
   TABLE DATA           c   COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
    public          postgres    false    223       3438.dat {
          0    33659    manga_categories 
   TABLE DATA           ]   COPY public.manga_categories (id, manga_id, category_id, created_at, updated_at) FROM stdin;
    public          postgres    false    236       3451.dat u
          0    33624    mangas 
   TABLE DATA           t   COPY public.mangas (id, user_id, name, image, synopsis, qtd_chapter, created_at, updated_at, categorys) FROM stdin;
    public          postgres    false    230       3445.dat f
          0    33535 
   migrations 
   TABLE DATA           :   COPY public.migrations (id, migration, batch) FROM stdin;
    public          postgres    false    215       3430.dat i
          0    33552    password_reset_tokens 
   TABLE DATA           I   COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
    public          postgres    false    218       3433.dat s
          0    33612    personal_access_tokens 
   TABLE DATA           £   COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
    public          postgres    false    228       3443.dat j
          0    33559    sessions 
   TABLE DATA           _   COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
    public          postgres    false    219       3434.dat h
          0    33542    users 
   TABLE DATA           ß   COPY public.users (id, name, email, email_verified_at, password, remember_token, current_team_id, profile_photo_path, created_at, updated_at, two_factor_secret, two_factor_recovery_codes, two_factor_confirmed_at) FROM stdin;
    public          postgres    false    217       3432.dat ï
           0    0    categories_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.categories_id_seq', 15, true);
          public          postgres    false    233         î
           0    0    chapters_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.chapters_id_seq', 10, true);
          public          postgres    false    231         ì
           0    0    failed_jobs_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);
          public          postgres    false    225         Ä
           0    0    jobs_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);
          public          postgres    false    222         Å
           0    0    manga_categories_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.manga_categories_id_seq', 70, true);
          public          postgres    false    235         É
           0    0 
   mangas_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.mangas_id_seq', 13, true);
          public          postgres    false    229         æ
           0    0    migrations_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.migrations_id_seq', 11, true);
          public          postgres    false    214         Æ
           0    0    personal_access_tokens_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);
          public          postgres    false    227         ô
           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 1, true);
          public          postgres    false    216         ║           2606    33581    cache_locks cache_locks_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);
 F   ALTER TABLE ONLY public.cache_locks DROP CONSTRAINT cache_locks_pkey;
       public            postgres    false    221         ©           2606    33574    cache cache_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);
 :   ALTER TABLE ONLY public.cache DROP CONSTRAINT cache_pkey;
       public            postgres    false    220         ð           2606    33657    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            postgres    false    234         ╬           2606    33645    chapters chapters_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.chapters
    ADD CONSTRAINT chapters_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.chapters DROP CONSTRAINT chapters_pkey;
       public            postgres    false    232         ┴           2606    33608    failed_jobs failed_jobs_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_pkey;
       public            postgres    false    226         ├           2606    33610 #   failed_jobs failed_jobs_uuid_unique 
   CONSTRAINT     ^   ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);
 M   ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_uuid_unique;
       public            postgres    false    226         ┐           2606    33598    job_batches job_batches_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.job_batches DROP CONSTRAINT job_batches_pkey;
       public            postgres    false    224         ╝           2606    33590    jobs jobs_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_pkey;
       public            postgres    false    223         Ê           2606    33664 &   manga_categories manga_categories_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.manga_categories
    ADD CONSTRAINT manga_categories_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.manga_categories DROP CONSTRAINT manga_categories_pkey;
       public            postgres    false    236         ╩           2606    33638    mangas mangas_name_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.mangas
    ADD CONSTRAINT mangas_name_unique UNIQUE (name);
 C   ALTER TABLE ONLY public.mangas DROP CONSTRAINT mangas_name_unique;
       public            postgres    false    230         ╠           2606    33631    mangas mangas_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.mangas
    ADD CONSTRAINT mangas_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.mangas DROP CONSTRAINT mangas_pkey;
       public            postgres    false    230         ¼           2606    33540    migrations migrations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
       public            postgres    false    215         ▓           2606    33558 0   password_reset_tokens password_reset_tokens_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);
 Z   ALTER TABLE ONLY public.password_reset_tokens DROP CONSTRAINT password_reset_tokens_pkey;
       public            postgres    false    218         ┼           2606    33619 2   personal_access_tokens personal_access_tokens_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.personal_access_tokens DROP CONSTRAINT personal_access_tokens_pkey;
       public            postgres    false    228         Ã           2606    33622 :   personal_access_tokens personal_access_tokens_token_unique 
   CONSTRAINT     v   ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);
 d   ALTER TABLE ONLY public.personal_access_tokens DROP CONSTRAINT personal_access_tokens_token_unique;
       public            postgres    false    228         Á           2606    33565    sessions sessions_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_pkey;
       public            postgres    false    219         «           2606    33551    users users_email_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_unique;
       public            postgres    false    217         ░           2606    33549    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    217         ¢           1259    33591    jobs_queue_index    INDEX     B   CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);
 $   DROP INDEX public.jobs_queue_index;
       public            postgres    false    223         ╚           1259    33620 8   personal_access_tokens_tokenable_type_tokenable_id_index    INDEX     ô   CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);
 L   DROP INDEX public.personal_access_tokens_tokenable_type_tokenable_id_index;
       public            postgres    false    228    228         │           1259    33567    sessions_last_activity_index    INDEX     Z   CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);
 0   DROP INDEX public.sessions_last_activity_index;
       public            postgres    false    219         Â           1259    33566    sessions_user_id_index    INDEX     N   CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);
 *   DROP INDEX public.sessions_user_id_index;
       public            postgres    false    219         È           2606    33646 "   chapters chapters_manga_id_foreign 
   FK CONSTRAINT     â   ALTER TABLE ONLY public.chapters
    ADD CONSTRAINT chapters_manga_id_foreign FOREIGN KEY (manga_id) REFERENCES public.mangas(id);
 L   ALTER TABLE ONLY public.chapters DROP CONSTRAINT chapters_manga_id_foreign;
       public          postgres    false    232    230    3276         ı           2606    33670 5   manga_categories manga_categories_category_id_foreign 
   FK CONSTRAINT     Ø   ALTER TABLE ONLY public.manga_categories
    ADD CONSTRAINT manga_categories_category_id_foreign FOREIGN KEY (category_id) REFERENCES public.categories(id);
 _   ALTER TABLE ONLY public.manga_categories DROP CONSTRAINT manga_categories_category_id_foreign;
       public          postgres    false    236    3280    234         Í           2606    33665 2   manga_categories manga_categories_manga_id_foreign 
   FK CONSTRAINT     ô   ALTER TABLE ONLY public.manga_categories
    ADD CONSTRAINT manga_categories_manga_id_foreign FOREIGN KEY (manga_id) REFERENCES public.mangas(id);
 \   ALTER TABLE ONLY public.manga_categories DROP CONSTRAINT manga_categories_manga_id_foreign;
       public          postgres    false    3276    236    230         Ë           2606    33632    mangas mangas_user_id_foreign 
   FK CONSTRAINT     |   ALTER TABLE ONLY public.mangas
    ADD CONSTRAINT mangas_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);
 G   ALTER TABLE ONLY public.mangas DROP CONSTRAINT mangas_user_id_foreign;
       public          postgres    false    217    230    3248                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 3435.dat                                                                                            0000600 0004000 0002000 00000000367 14621475613 0014267 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        356a192b7913b04c54574d18c28d46e6395428ab:timer	i:1713810299;	1713810299
356a192b7913b04c54574d18c28d46e6395428ab	i:1;	1713810299
3d47703dd72bc65ac3964c885a07c710:timer	i:1714044351;	1714044351
3d47703dd72bc65ac3964c885a07c710	i:1;	1714044351
\.


                                                                                                                                                                                                                                                                         3436.dat                                                                                            0000600 0004000 0002000 00000000005 14621475613 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3449.dat                                                                                            0000600 0004000 0002000 00000000347 14621475613 0014272 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Romance	\N	\N
2	Drama	\N	\N
3	Acao	\N	\N
4	Comedia	\N	\N
5	Escolar	\N	\N
6	Shounen	\N	\N
7	Shoujo	\N	\N
8	Yuri	\N	\N
9	Yaoi	\N	\N
10	Harem	\N	\N
11	Hentai	\N	\N
12	Mecha	\N	\N
13	Seinen	\N	\N
14	Poderes	\N	\N
15	Magia	\N	\N
\.


                                                                                                                                                                                                                                                                                         3447.dat                                                                                            0000600 0004000 0002000 00000146477 14621475613 0014307 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	2	58	Shiraii Shiranui	f	2024-04-25 12:54:53	2024-04-25 12:54:53	*um m├¬s depois da luta do Iska contra os Arcanjos*\r\n\r\nMiraii= e ent├úo, como que t├í a sua Alma?\r\nIska= eu diria que est├í quase 100%, mas tem algumas brechas ainda\r\nMiraii= burro\r\nIska= ei\r\nMiraii= *sai da sala*\r\nIska= ei Miraii\r\nMiraii= ?\r\nIska= voc├¬ tem feito contato com o submundo?\r\nMiraii= n├úo, ├║ltima vez que pisei l├í foi quando a gente veio para c├í\r\nIska= hmmmm entendoÔÇª\r\nMiraii= mas a Raissa-neesan tem ido l├í ultimamente, por que a pergunta?\r\nIska= oh, ├® que eu ouvi do Roiunu que tem um dem├┤nio conhecido vindo para c├í\r\nMiraii= um dem├┤nio conhecido emÔÇª a prop├│sito, voc├¬ t├í falando bastante com o Roiunu ultimamente n├®\r\nIska= *olha para a Miraii* *sorriso* ci├║mes?\r\nMiraii= *olha para o Iska com um olhar de desprezo*\r\nIska= de-desculpaÔÇª *volta a assistir*\r\nMiraii= *se encosta no sof├í* t├í vendo o que de bom?\r\nIska= oooh interessada?\r\nMiraii= bom, n├úo tem nada pra fazer mesmo\r\nIska= *fica animado* bom, como voc├¬ sabe, eu vim para c├í pra tentar entender o que os humanos pensam e agem\r\nMiraii= sim, voc├¬ me falou isso mesmo\r\nIska= exatamente, nessas pesquisas eu descobri uma coisa *muda de canal* olha, parece que os humanos gostam desses neg├│cios chamados de ÔÇ£animeÔÇØ\r\nMiraii= hmmmm e esse a├¡ seria sobre o que?\r\nIska= ah, esse ├® sobre um cara extremamente frio e calculista, que s├│ quer viver uma vida escolar de boas, mas enfrenta diversos desaÔÇªfiosÔÇª\r\nMiraii= *olhar de entendiada*\r\nIska= b-bom *passa de canal* temos esse aqui, em que um polvo esquisito da aula para uma turma, e essa mesma turma tem que matar esse polvo para salvar a TerraÔÇª\r\nMiraii= um polvo? ├ë s├®rio?\r\nIska= voc├¬ tamb├®m n├úo t├í ajudando MiraiiÔÇª *passa de canal de novo* o-olha esse, um anime que o cara n├úo tem um pingo de magia em um mundo onde magia ├® tudo, mas ele desce a porrada em todo mundo\r\nMiraii= oooh\r\nIska= *fica animado de novo* sim, o ruim ├® que come├ºa a ficar gen├®rico e chato com o decorrer da hist├│riaÔÇª\r\nMiraii= a *fica com cara de t├®dio de novo*\r\nIska= drogaÔÇª *passa de canal* olha esse, ├® sobre dem├┤nios\r\nMiraii= *fica interessada*\r\nIska= s├│ tem um problemaÔÇª\r\nMiraii= o que ├® agora?\r\nIska= bemÔÇª ├® que n├│s somos ca├ºados por uns tals de hashiras e mortos pelo SolÔÇª\r\nMiraii= que merda emÔÇª Tem nada de interessante n├úo?\r\nIska= j├í sei *pega uma caixa cheia de blu-ray (ÔÇ£DVDÔÇØ para animes)* *joga no ch├úo* *fica empolgado* veja veja, eu colecionei v├írios quando tava estudando\r\nMiraii= *vai at├® onde est├úo os blu-rayÔÇÖs no ch├úo* *senta no ch├úo e come├ºa a observar*\r\nIska= *mostrando e explicando para a Miraii*\r\nMiraii= *prestando aten├º├úo*\r\nRaissa= *observando de longe* *fica feliz* tomara que esses dias durem bastanteÔÇª\r\n\r\n*enquanto isso na praia*\r\n\r\nMarcos= *bocejo* *percebe algu├®m chegando na praia pelo portal*\r\nMente do Marcos= n├úo pode serÔÇª ALGU├ëM FINALMENTE CHEGOU AQUI NA TERRA??!!\r\nMarcos= *se levanta todo desajeitado e vai na dire├º├úo da pessoa* bo-bom dia, em que posso ajudar?\r\n?= ooooh, ent├úo ├® assim que um terrestre ├®ÔÇª desculpa a pergunta, mas aqui ├® a Terra certo?\r\nMarcos= sim! *olha direito* *percebe os chifres e as asas* u├®ÔÇª *reconhece a pessoa de algum lugar* Miraii-chan? Desde quando voc├¬ cortou o cabelo e pintou?\r\nShiraii= voc├¬ pode me ver? Ou melhorÔÇª VOC├è CONHECE A MIRAII? S├ëRIO?? EU ME CHAMO SHIRAII SHIRANUI, IRM├â MAIS VELHA DA MIRAII-CHAN, COMO VOC├è CONHECEU ELA??\r\nMarcos= u-uma coisa de cada vez por favor\r\nShiraii= ah, desculpa, eu acabei me empolgando *risada*\r\nMarcos= *ri junto* sem problemas, ent├úo voc├¬ ├® irm├ú mais nova da Miraii-chan n├®\r\nShiraii= sou a irm├ú mais velha na realÔÇª\r\nMarcos= s├®rio?\r\nShiraii= *suspiro* sempre acham que eu sou mais nova que a Miraii, mas eu sou uns 5 anos mais velha que elaÔÇª\r\nMarcos= oooh, ent├úo voc├¬ tem mais ou menos a mesma idade da Raissa-chan emÔÇª\r\nShiraii= VOC├è CONHECE A RAISSA-CHAN TAMB├ëM??\r\nMarcos= si-simÔÇª\r\nShiraii= que estranho, originalmente era para voc├¬s, humanos, n├úo serem nem capazes de nos ver, mas voc├¬ fala que conheceu a Miraii-chan e a Raissa-chan, al├®m disso tamb├®m pode me verÔÇª\r\nMarcos= bom, eu meio que n├úo me apresentei ainda, eu me chamo Marcos Hanani, sou meio que um guia para outras ra├ºas que vem para a Terra pela primeira vez, e sim, eu n├úo sou humano como voc├¬ imagina, eu sou de uma esp├®cie que n├úo vou contarÔÇª\r\n\r\nRaissa= a prop├│sito, Miraii-chan\r\nMiraii= sim?\r\nRaissa= eu ouvi dizer que sua irm├ú vem aqui nos visitar\r\nMiraii= nem fudendo\r\nRaissa= tudo fudendo Miraii-chan, tudo fudendoÔÇª\r\nIska= oh, a Shiraii-senpai?\r\nMiraii= *olha para o Iska com um olhar amea├ºador* n├úo ouse chegar perto daquela mulher ouviu? Quando ela chegar eu farei quest├úo de te esconder dela at├® ela vazar daqui, est├í entendendo?\r\nIska= si-simÔÇª\r\nRaissa= que tipo de Habilidade ela vai ganhar?\r\nMiraii= certeza que vai ser algo relacionado a ver por tr├ís das roupas das pessoas\r\nIska= queriaÔÇª\r\nMiraii= como ├® que ├®?\r\n\r\nShiraii= entendiÔÇª Marcos Hanani certo?\r\nMarcos= sim\r\nShiraii= voc├¬ disse que ├® de outra esp├®cie diferente da Humana certo?\r\nMarcos= sim\r\nShiraii= entendoÔÇª Voc├¬ ├® um Anjo n├®\r\nMarcos= *fica levemente surpreso* ora ora, o que te faz pensar nisso?\r\nShiraii= ao julgar pela sua rea├º├úo eu dei um tiro certeiro, certo? Bom, essa ├® a minha Habilidade, olhar atrav├®s da brecha da Alma o n├¡vel de pureza dela, e a sua Alma era 100% pura, o que pode significar al├®m de que voc├¬ ├® um Anjo?\r\nMente do Marcos= ei ei, s├®rio isso? Ela mal chegou na Terra e j├í consegue usar sua Habilidade?\r\nShiraii= n├úo ├® querendo me gabar, mas eu era conhecida como a Dem├┤nia Prod├¡gio, ent├úo isso foi como tirar doce de crian├ºaÔÇª\r\nMarcos= *sorriso* bem, de fatoÔÇª Eu sou um Anjo mesmo, e ent├úo, vai me matar?\r\nShiraii= ÔÇª *suspiro* n├│s, dem├┤nios, possu├¡mos uma ├®tica de poupar aquele que achamos vantajoso, e voc├¬ parece ter ajudado todos os dem├┤nios que vieram aqui, por qu├¬?\r\nMarcos= falta do que fazerÔÇª\r\nShiraii= *usa sua Habilidade* n├úo parece ter sido picado, sua Alma permanece pura, ent├úo voc├¬ realmente ajudou um Dem├┤nio por livre arb├¡trio? Mesmo sendo um Anjo?\r\nMarcos= *sorriso* como eu disse, ├® mais por falta do que fazerÔÇª e tamb├®m eu estou cansado dessa indiferen├ºa de ra├ºas, eu s├│ queria encontrar uma forma de unir as ra├ºas e evitar conflitos que prejudiquem a todos, e a melhor maneira que eu encontrei foi tentar entender como as ra├ºas pensam e agem, por isso que eu fico de vigil├óncia nos portais\r\nShiraii= *fica surpresa* *sorriso* entendo, bem nobre de sua parteÔÇª\r\nMarcos= oh, obrigadoÔÇª\r\nShiraii= acho que vou ficar te devendo essa, voc├¬ ajudou os meus amigos tamb├®m, ent├úo voc├¬ tem meu respeito, mesmo eu odiando profundamente os AnjosÔÇª acho que sua ideia at├® pode funcionar em alguns de n├│sÔÇª bom, de qualquer forma, eu j├í vou indo encontrar minha irm├ú-\r\nMarcos= indo aonde?\r\nShiraii= como eu acabei de dizer, eu vou-\r\nMarcos= *sorriso de olhos fechados* voc├¬ n├úo vai a lugar nenhumÔÇª n├®?\r\nShiraii= co-como eu venho tentando dizer, eu-\r\nMarcos= n├®?\r\nShiraii= *fica confusa* *suspiro* o que voc├¬ quer?\r\nMarcos= oh, ├® uma tradi├º├úo minha fazer isso sabeÔÇª *sorriso mal├®fico* e como voc├¬ ├® prod├¡gio, tenho certeza que aprender├í tudo em uma semana\r\nShiraii= *se assusta* voc├¬ realmente ├® um Anjo?\r\nMarcos= ah, esqueci de avisar a Raissa-chan sobre issoÔÇª *liga para a Raissa*\r\nRaissa= *telefone toca* *atende* oh, Marcos-sensei, como vai?\r\nMarcos= ol├í Raissa-chan, eu estou ├│timo, mas adivinha quem apareceu aqui?\r\nRaissa= algu├®m de outra ra├ºa apareceu por a├¡, fico feliz por voc├¬\r\nShiraii= n├úo abuse de minha bondade ouviu?\r\nRaissa= *escuta a voz da Shiraii* essa voz pode ser\r\nShiraii= RAISSA-CHAAAAAN POR FAVOR ME TIRE DAQUI, ESSE DEM├öNIO VAI ABUSAR DA MINHA BONDADE POR UMA SEMANA INTEIRA, EU N├âO VOU AGUENTARRRRRR-\r\nMarcos= bem bem, parece que a irm├ú da Miraii-chan apareceu por aqui, e como ela ├® novata, eu ensinarei a ela tudo o que eu sei daqui da Terra\r\nRaissa= *fica surpresa* mas uma semana ├® o suficiente?\r\nMarcos= t├í tudo bem, afinalÔÇª *sorriso mal├®fico* ela mesma disse que era um prod├¡gio hehehehe\r\nRaissa= as vezes voc├¬ me d├í medo, Marcos-senseiÔÇª\r\nMarcos= de qualquer forma, daqui a uma semana ela vai onde voc├¬s est├úo, at├® mais\r\nRaissa= sim, at├® mais *desliga a liga├º├úo*\r\nMarcos= *olha para a Shiraii* bom, vamos entrar?\r\nShiraii= simÔÇª *entra junto com o Marcos*\r\nMarcos= vou te apresentar primeiro a Culin├íria Humana, ├® bem intrigante eu diriaÔÇª *abre a geladeira*\r\nShiraii= u├®, eu tinha visto em alguns livros sobre a Culin├íria Humana, mas n├úo lembrava que era dessa formaÔÇª\r\nMarcos= voc├¬ viu de outros dem├┤nios que j├í vieram para c├í, certo?\r\nShiraii= sim\r\nMarcos= entendi, ent├úo as comidas que voc├¬ viu provavelmente eram japonesas, *fica animado* mas eu viajei para outro pa├¡s esses dias, e descobri que a comida brasileira ├® simplesmente maravilhosa, ela pega um prato t├¡pico de outros pa├¡ses e melhora em 100%\r\nShiraii= errrr oi?\r\nMarcos= ah, foi mal, acabei me empolgando *risada* bom, come├ºarei do b├ísico para voc├¬\r\nShiraii= agrade├ºoÔÇª\r\nMarcos= *sorriso* basicamente, os Humanos usam os mesmos tipos de nomenclatura para os territ├│rios que voc├¬s, dem├┤nios, usam para: Reino, Prov├¡ncia Sombria, Territ├│rio, Metr├│pole Infernal e Distritos, no caso, seriam Continentes, Pa├¡ses, Estados, Cidades e Bairros, respectivamente\r\nShiraii= *fica um pouco confusa* ca-calma a├¡, deixa eu anotar em algum lugarÔÇª Isso ├® mesmo importante?\r\nMarcos= bom, os que voc├¬ vai mais ouvi falar ├®: Estados, Cidades e Bairros\r\nShiraii= que seriam Territ├│rio, Metr├│pole Infernal e Distritos, certo?\r\nMarcos= ora ora, n├úo ├® que voc├¬ ├® um prod├¡gio mesmo hehehehe\r\nShiraii= hmp\r\nMarcos= bom, irei explicar mais uma coisa\r\nShiraii= ?\r\nMarcos= acredito que voc├¬ entenda o conceito de Alma, correto?\r\nShiraii= sim\r\nMarcos= ├│timo, aqui na Terra, h├í uma subst├óncia rara chamada ÔÇ£G├ís da HabilidadeÔÇØ, que ├® liberada por eventos naturais raros ou locais espec├¡ficos, como fissuras na terra. Esse g├ís ├® invis├¡vel e indetect├ível aos sentidos normais, mas quando inalado, se funde com o sistema respirat├│rio das pessoas. Dentro do corpo humano, esse g├ís se liga ├ás mol├®culas de oxig├¬nio, tornando-se parte da respira├º├úo normal. No entanto, apenas uma pequena porcentagem das pessoas tem a capacidade gen├®tica de processar esse g├ís de forma eficiente e absorver suas propriedades, o que resulta na manifesta├º├úo das Habilidades.\r\nShiraii= e ├® instant├óneo isso? Por que assim que eu inalei o ar daqui da Terra, eu j├í senti um poder em mimÔÇª\r\nMarcos= sobre isso, quando outras ra├ºas chegam na Terra, elas entram em contato com a atmosfera carregada do G├ís da Habilidade, devido ├ás suas fisiologias ├║nicas e adapt├íveis, essas ra├ºas s├úo capazes de absorver e incorporar rapidamente o g├ís em seus sistemas biol├│gicos, isso desencadeia uma rea├º├úo dentro de suas Almas e ├│rg├úos sensoriais, ativando potenciais latentes e desbloqueando Habilidades espec├¡ficas associadas ├á sua pr├│pria biologia, essa assimila├º├úo ├® facilitada pelo fato de que as Almas dessas ra├ºas possuem caracter├¡sticas semelhantes ├ás dos humanos, incluindo a brecha nos olhos que permite a manipula├º├úo direta das Habilidades oculares, assim, ao chegarem ├á Terra, essas ra├ºas experimentam uma r├ípida evolu├º├úo de poderes, adaptando-se ao ambiente carregado com o G├ís da Habilidade.\r\nShiraii= confesso que isso foi mais complexo do que eu imagineiÔÇª\r\nMarcos= mas voc├¬ vai aprender logo, afinal, ├® um prod├¡gio n├®? *risada*\r\nShiraii= *suspiro* eu preciso mesmo saber disso?\r\nMarcos= hmmm na verdade n├úo\r\nShiraii= como ├® que ├®?\r\nMarcos= como posso dizerÔÇª S├│ queria saber se voc├¬ realmente era prod├¡gio ou se era s├│ blefe sabeÔÇª\r\nShiraii= *fica irritada* OLHA SEU!!!\r\nMarcos= foi engra├ºado vaiÔÇª\r\nShiraii= *se acalma* eu estou em d├®bito por voc├¬ ter ficado aqui guiando outros Dem├┤nios como a minha irm├úzinha, ent├úo n├úo vou te machucar\r\nMarcos= oooh ent├úo voc├¬ realmente colhe o que planta emÔÇª\r\nShiraii= isso por acaso foi uma indireta?\r\nMarcos= n├úo sei de nadaÔÇª\r\nShiraii= *suspiro* essa semana n├úo vai ser f├ícilÔÇª\r\n\r\n*uma semana depois*\r\n\r\nShiraii= *saindo fuma├ºa da cabe├ºa* n├úo foi nada bom te conhecer, Marcos-senseiÔÇª\r\nMarcos= oho! O prazer foi todo meu *risada*\r\nRaissa= *chega voando* SHIRAII-CHAAAAAAAN\r\nShiraii= *faz cara de choro* RAISSA-CHAAAAAN, ├ë T├âO BOM VER UMA CONHECIDA AQUI NESSE INFERNO DE TERRA!!!\r\nMarcos= perd├úo, mas voc├¬s vem de onde mesmo?\r\nShiraii= cala a boca, Dem├┤nio!\r\nMarcos= acho que os pap├®is est├úo invertidosÔÇª\r\nShiraii= sinceramente, por que caralhos Humanos precisam de explica├º├Áes t├úo complexas para coisas simples? Essa tal de Geografia foi a pior parteÔÇª\r\nRaissa= bom, com o tempo voc├¬ se acostuma, eu mesma s├│ aceitei sabeÔÇª\r\nMarcos= *sorriso* mas fico feliz por passar uma semana acompanhado, agora ├® s├│ esperar mais 3 anos at├® aparecer algu├®m novo *fica triste*\r\nRaissa= tudo bem, Marcos-sensei, eu irei te visitar toda semana agora, quem sabe eu n├úo traga o Iska-kun e a Miraii-chan tamb├®m *sorriso*\r\nMarcos= Raissa-chan, voc├¬ÔÇª *faz cara de choro* voc├¬ ├® um AnjoÔÇª\r\nShiraii= agora ├® voc├¬ que est├í invertendo os pap├®is, idiota, chupa\r\nMarcos= *olha para a Shiraii* n├úo lembro de ter te criado assim, Shiraii-chan\r\nShiraii= VOC├è ├ë MEU PAI AGORA PORRA??!!\r\nRaissa= pe-pega leve, Shiraii-chan\r\nShiraii= s├│ porque eu estou em d├®bito com eleÔÇª\r\nRaissa= acho que no fim todos estamos em d├®bito com voc├¬ em, Marcos-sensei\r\nMarcos= *fica sem jeito* bom bom, acho que sim *risada*\r\nRaissa= de qualquer forma, eu irei visit├í-lo em breve, se cuida, Marcos-sensei\r\nMarcos= obrigado, Raissa-chan\r\nRaissa= *sorriso* *voa*\r\nMarcos= *cara de choro* voc├¬ ├® um Anjo que nasceu no lugar errado, Raissa-chanÔÇª Eu com certeza farei o c├®u lembrar de voc├¬ÔÇª\r\nShiraii= eiii me esperaÔÇª *sorriso* caramba *olha para o Marcos* *sorriso* acho que ├® isso\r\nMarcos= *fica um pouco surpreso* *olha para a Shiraii* *sorriso* acho que simÔÇª\r\nShiraii= *caminha at├® o Marcos* obrigada por cuidar de mim, Marcos-sensei\r\nMarcos= *percebe algo estranho*\r\nShiraii= acho que devo prestar mais respeito agora, *passa pelo Marcos* 3 Arcanjo Superior-sensei?\r\nMarcos= *fica em choque* *sorriso* acho que subestimei voc├¬ demaisÔÇª\r\nShiraii= *vira para o Marcos* n├úo se preocupe, seu segredinho est├í seguro comigo *risada*\r\nMarcos= *come├ºa a suar* agrade├ºoÔÇª\r\nMente do Marcos= minha nossa, que mulher perigosa, em apenas 1 semana ela foi capaz de revelar minha identidade, me pergunto a quanto tempo ela descobriu issoÔÇª Acho que terei que vigiar ela por um tempinho para confirmar se ela realmente vai guardar esse segredo, mas tenho que ser cauteloso-\r\nShiraii= calma calma, eu disse que seu segredo est├í seguro comigo, ent├úo se preocupe tudo bem? Lembra de quando eu falei que temos uma ├®tica? Eu deixei um Arcanjo Superior cuidar de mim por uma semana, mesmo eu odiando com todas as minhas for├ºas os Arcanjos, por que voc├¬ n├úo acreditaria em mim?\r\nMarcos= *se acalma um pouco* bom, voc├¬ est├í certaÔÇª ah, se eu fosse voc├¬ eu apressava logo, sen├úo vai perder a Raissa-chan de vista, e nem eu sei onde ela mora pra te ajudar tamb├®mÔÇª\r\nShiraii= ai caralho, ├® mesmo *come├ºa a correr* *para* *vira para o Marcos* haja o que houver, eu s├│ tenho um pedido a fazer\r\nMarcos= ?\r\nShiraii= *sorriso* n├úo mude sua ├®tica t├í bom? Isso beneficiar├í todas as ra├ºas futuramente, ent├úo continue assim, t├í bom *voa*\r\nMarcos= ShiraiiÔÇª *sorriso* acho queÔÇª minha influ├¬ncia finalmente t├í fazendo efeito emÔÇª\r\nMente da Shiraii= eu realmente odeio todos os Anjos, com todas as minhas for├ºas, mas eleÔÇª Acho que posso deixar ele em paz, afinal, ele tem um objetivo que eu nunca imaginei ver em um Anjo, ainda mais em um Arcanjo renomado como eleÔÇª\r\n\r\n*na casa da Raissa*\r\n\r\nMente do Iska= por que ├® ÔÇ£Casa da RaissaÔÇØ sendo que originalmente foi eu que aluguei essa casa?\r\nShiraii= MIRAII-CHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAN *corre at├® a Miraii para abra├º├í-la*\r\nMiraii= *olha com desprezo para a Shiraii* vaza daqui *da um chute na cara da Shiraii*\r\nIska= *fica surpreso* qual foi MiraiiÔÇª\r\nMiraii= hmp\r\nShiraii= a quantoÔÇª tempoÔÇª\r\n\r\nto be continued\r\n\r\n*N├úo perca, no pr├│ximo cap├¡tulo de Life School: O Reencontro*\r\n\r\nAt├® breve
2	2	57	Eu n├úo suporto, mas me importo	f	2024-04-25 14:07:38	2024-04-25 14:07:38	Marcos= *Letreiro: Primeira apari├º├úo no cap├¡tulo 25, mestre do Iska e de todas as ra├ºas que vem para a Terra* *se alonga* aaaaaaaah cara que t├®dio, o que houve com as ra├ºas, elas nunca mais vieram pra Terra..\r\nRaissa= *sai do portal* ufa, finalmente cheguei *olha para o lado* ooooooh, voc├¬ ├® \r\nMarcos= hm? *olha para a Raissa* *olhos come├ºam a brilhar* RAISSAAAAAAAAA\r\nRaissa= MARCOS-SENSEEEEEEEI\r\n\r\n*os dois se abra├ºam*\r\n\r\nMarcos= faz tanto tempo que n├úo aparece ningu├®m nessa praia que eu tava come├ºando a ficar com t├®dio *risada* bem, como vem passado?\r\nRaissa= bom, aconteceu algumas coisas desde a ├║ltima vez que viemos aqui, desde uma transfer├¬ncia at├® uma batalha contra Anjos *risadas*\r\nMarcos= *sorriso* entendi, ent├úo o Iska-kun finalmente agiu emÔÇª bom, desejo boa a sorte a ele, vai ser uma baita jornada\r\nRaissa= *fica emburrada* mas ├® bom ele me visitar de vez em quando sabia? Desde que ele foi arrastado pela Miraii ele nunca mais falou comigo, eu t├┤ ficando irritada com isso j├í\r\nMarcos= ooh ent├úo ele se reencontrou com a Miraii-chan em, bom bom, Iska-kun ├® uma pessoa objetiva n├úo? Ele sempre vai atr├ís do que ele quer e acaba voltando pro ponto de origem quando conclui ou d├í erradoÔÇª\r\nRaissa= mesmo assim, eu sou irm├ú dele sabia? Merecia um pouco mais de aten├º├úoÔÇª\r\nMarcos= *sorriso*\r\nRaissa= ei Marcos-sensei, me responde uma coisa\r\nMarcos= pode dizer\r\nRaissa= voc├¬ÔÇª n├úo ├® humano n├®?\r\nMarcos= *se senta em uma cadeira de praia, fica s├®rio e em sil├¬ncio* ÔÇªisso mesmo, eu n├úo sou humanoÔÇª\r\nRaissa= *sorriso* imaginei\r\nMarcos= vai fazer o que, me matar?\r\nRaissa= fique tranquilo, eu devo uma a voc├¬ por cuidar de mim, do Iska e da Miraii\r\nMarcos= *sorriso* entendiÔÇª\r\nRaissa= eu tenho bastante experi├¬ncia sabe, ent├úo ├® ├│bvio que eu seiÔÇª que voc├¬ ├® inimaginavelmente mais forte do que eu, ent├úo mesmo se eu tentasse te matar voc├¬ me mataria antes\r\nMarcos= *risada* ah vamos, eu realmente sou mais forte que voc├¬, mas a diferen├ºa n├úo ├® t├úo grande assimÔÇª Eu achoÔÇª Mas enfim, n├úo t├í curiosa para saber que ra├ºa eu sou n├úo?\r\nRaissa= de fato, mas eu sei que voc├¬ n├úo contaria ou mentiria para mim\r\nMarcos= ├® aquela hist├│ria, um m├ígico nunca revela seus truquesÔÇª\r\nRaissa= de fato *telefone toca* s├│ um minuto *atende o telefone* sim? O QU├è?!!\r\nMarcos= o que aconteceu?\r\nRaissa= certo, j├í estou indo a├¡ *desliga o telefone* *olha para o Marcos* *abra├ºa ele*\r\nMarcos= *fica surpreso* Raissa-chan?\r\nRaissa= *sorriso* eu n├úo sei quando vou te ver novamente, independente da ra├ºa que voc├¬ seja, voc├¬ ajudou a gente mesmo sabendo que somos dem├┤nios, ent├úo se precisar pode chamar a gente viu?\r\nMarcos= *continua surpreso* *sorriso* tudo bem, eu irei cham├í-la, agora v├í l├í, o Iska est├í precisando de voc├¬ certo?\r\nRaissa= *se afasta de Marcos* sim, at├® mais *voa*\r\nMarcos= *acena para a Raissa* talvez essa seja a nossa ├║ltima visita, Raissa-chanÔÇª Mas foi bom v├¬-la novamenteÔÇª\r\n\r\n*enquanto isso no c├®u*\r\n\r\nYakumo= Luni\r\nLuni= oh, Yakumo\r\nYakumo= voc├¬ poderia me explicar agora sobre ÔÇ£aquiloÔÇØ?\r\nLuni= *fica confuso* ÔÇ£aquiloÔÇØ?\r\nYakumo= sim, na batalha de Jacine contra o Iska, por que ordenou que eu n├úo matasse o Iska\r\nLuni= ah, sobre issoÔÇª Eu realmente n├úo sei do que voc├¬ est├í falando, eu lembro sim dessa batalha, mas eu nem sequer sabia que tinha te enviado para l├í buscar elesÔÇª\r\nMente da Yakumo= ele n├úo parece estar mentido, mas ├® dif├¡cil acreditar nessa hist├│ria, considerando que ele n├úo ├® um anjo puro, ele n├úo deve sentir as PicadasÔÇª\r\n\r\nLel= Picadas?\r\nTomiko= sim, eu te falei sobre a Corrup├º├úo de Alma certo, aquela hist├│ria de almas puras, impuras e tals\r\nLel= sim\r\nTomiko= quando voc├¬ ├® uma Alma Pura, ao decorrer do tempo, inevitavelmente voc├¬ ir├í fazer alguma cagada, e ent├úo voc├¬ vai sentir uma pequena dor semelhante ao uma picada, chamamos isso de Picadas, ela ├® um ind├¡cio de sua alma se corrompendo, ou seja, quanto mais Picadas, mais perto de se torna um Anjo Ca├¡do voc├¬ estar├í\r\nLel= entendi, voc├¬ j├í foi picada?\r\nTomiko= sim, v├írias vezes, mas eu consegui me purificar de novo, ├® bem simples, basta mostrar arrependimento que sua Alma vai se purificando novamente\r\nLel= ei Tomiko-san, matar dem├┤nios ├® considerado errado?\r\nTomiko= ├│tima pergunta, e a resposta ├® que depende, n├│s Anjos temos um ├®tica de que n├úo matamos desnecessariamente, e isso inclui Ra├ºas Impuras como Dem├┤nios, Anjos Ca├¡dos e Vampiros. Mas cada Anjo tem sua pr├│pria ├®tica, e a Picada funciona com consci├¬ncia, se voc├¬ tiver uma ├®tica de matar todo Dem├┤nio que ver pela frente e acreditar fielmente nisso, voc├¬ n├úo ser├í afetado pela Picada, esse ├® o caso do 3┬║ Arcanjo Superior, por isso ele ÔÇ£faz o que querÔÇØ, j├í que isso faz parte de sua ├®tica\r\nLel= como tudo que voc├¬ me explica, ├® bem complexo esse ÔÇ£sistemaÔÇØ\r\nTomiko= sim, voc├¬ tamb├®m pode ser picado, ent├úo cuidado em\r\nLel= entendi!\r\nTomiko= eu ia me esquecendo, mas se por acaso uma outra ra├ºa tiver sangue Arcano como na Hibrida├º├úo, ela tamb├®m ser├í picada, mas as condi├º├Áes s├úo bem menos r├¡gidas, j├í que ela n├úo ├® uma Alma Pura, diferente de voc├¬, que ├® um Anjo que recebeu sangue Humano, sua Alma est├í parcialmente Impura, ent├úo o efeito vai ser reduzido um pouco\r\nLel= e tem algu├®m al├®m de mim que ├® h├¡brido?\r\nTomiko= sim, o Luni-sama\r\nLel= *fica surpreso* o Luni-sama? Ele ├® o qu├¬?\r\nTomiko= a Ra├ºa original dele ├® Fada, mas ele recebeu a Gra├ºa de Deus e sua Alma purificou parcialmente, tornando ele Fada e Anjo ao mesmo tempo\r\nLel= ent├úo ele n├úo fez parte do Experimento?\r\nTomiko= n├úo, mas eu n├úo sei os motivos por tr├ís disso, mas ele ├® bem fiel\r\nLel= entendiÔÇª\r\n\r\nYakumo= deixa eu ver, se algu├®m realmente te manipulou, essa pessoa deve ser bem forte, e tinha que estar em uma dist├óncia consider├ível para n├úo notarmos a sua presen├ºa\r\nLuni= voc├¬ est├í supondo que algum usu├írio de magia est├í envolvido nisso?\r\nYakumo= sim, principalmente pelo fato de que ele deveria estar bem longe para n├úo percebemos\r\nLuni= sim, o que nos leva a Vampiros ou Fadas, mas Vampiros n├úo podem vir para c├í, nem se quisessem\r\nYakumo= o que significa que foi alguma fada que fez isso\r\nLuni= e essa fada deve estar do lado dos dem├┤nios\r\nYakumo= consegue imaginar algu├®m?\r\nLuni= n├úo, j├í faz muitos anos que eu vim para c├í, n├úo lembro de quase ningu├®mÔÇª\r\nYakumo= *express├úo de desprezo* que fada mais in├║til\r\nLuni= eu sou seu superior sabia?\r\nYakumo= sim sim, alguma ideia de como encontrar o culpado?\r\nLuni= me d├¬ uma semana para eu saber o que aconteceu, pode ser?\r\nYakumo= sim, eu sei que voc├¬ n├úo vai querer, mas estou aqui para ajudar\r\nLuni= pode deixar\r\n\r\n*enquanto isso na Terra*\r\n\r\nRaissa= *chega em casa* MIRAII-CHAAAAAAAAAN *vai na dire├º├úo da Miraii para abra├º├í-la*\r\nMiraii= *desvia*\r\nRaissa= *cai no ch├úo* *se levanta* qual foi, s├│ queria matar a saudadeÔÇª\r\nMiraii= *suspiro* a quanto tempo, Raissa-neesan\r\nRaissa= yo, e o Iska, como ele t├í?\r\nMiraii= eu botei ele em um quarto, ent├úo ele t├í repousando\r\nRaissa= desde quando voc├¬s chegaram *senta no sof├í*\r\nMiraii= 3 dias mais ou menos, foi logo que os refor├ºos dos Anjos chegaram, eu peguei o Iska e vim para c├í, que era mais perto e mais seguro\r\nRaissa= seguro?\r\nMiraii= sim, diferente da escola l├í, em que os Anjos j├í sabem de sua localidade, aqui ningu├®m sabe\r\nRaissa= entendiÔÇª Bom, irei ver o Iska\r\nMiraii= certo, j├í que voc├¬ est├í aqui, vou tomar um baita de um banho, por que eu t├┤ horr├¡vel de sujaÔÇª *vai andando na dire├º├úo do banheiro*\r\nRaissa= MiraiiÔÇª quer dizer que voc├¬ passou todo esse tempo vigiando ele?\r\nMiraii= ÔÇª *continua andando em sil├¬ncio*\r\nRaissa= *sorriso* complicado isso a├¡ÔÇª enfim *vai para o quarto do Iska* IskaÔÇª\r\nIska= *deitado na cama* *abre os olhos* queeeeeeee?\r\nRaissa= *fica sem rea├º├úo* EEEEEEEEEH?!! N├âO ERA PRA VOC├è T├ü REPOUSANDO N├âO?!!\r\nIska= *se senta* *sente dores no corpo* o queÔÇª aconteceu?\r\nRaissa= a Miraii-chan salvou voc├¬ de uma emboscada dos Anjos e trouxe para a minha casa\r\nIska= os Anjos n├®ÔÇª *se levanta*\r\nRaissa= consegue andar?\r\nIska= sim, a ├║ltima coisa que eu me lembro ├® de eu ter queimado devido ├á incompatibilidade da minha Alma com a Gra├ºa daquela Arcanja\r\nRaissa= voc├¬ queimou por completo?\r\nIska= n├úo t├┤ falando no sentido literal, ├® como se meu corpo fosse pego por um fogo invis├¡vel sabe, uma dor interna, n├úo externa, foi um dano direto na minha Alma, vai levar um tempo para eu me recuperar por completo, mas pelo menos coisas b├ísicas como andar eu t├┤ conseguindo, eu achoÔÇª\r\nRaissa= IskaÔÇª\r\nMente da Raissa= impress├úo minha ou o Iska t├í um pouco diferente?\r\nIska= de qualquer forma, *sai do quarto* vou tomar um banho pra esfriar o corpo\r\nRaissa= siiim, vou preparar o almo├ºo\r\nIska= certo *vai pro banheiro*\r\nRaissa= eu t├┤ esquecendo de alguma coisa? Acho que n├úoÔÇª *vai para a cozinha*\r\nIska= *abre a porta do banheiro*\r\nMiraii= *sai do chuveiro toda molhada*\r\nIska= *v├¬ a Miraii* ah, n├úo sabia que tava aquiÔÇª\r\nMiraii= ? *olha pro Iska* ah, ├® a Bela Adormecida\r\nIska= como ├® que ├® que ├®? *olha para os peitos da Miraii* *junta as duas m├úos* *olha para cima chorando* eles crescem t├úo r├ípidosÔÇª\r\nMiraii= *joga uma toalha na cara do Iska* qual foi, n├úo foi t├úo grande o aumentoÔÇª\r\nIska= *pega a toalha* bom, faz tempo que n├úo os vejo, ent├úo tive a impress├úo que simÔÇª\r\nMiraii= a prop├│sito, o que voc├¬ t├í fazendo aqui mesmo?\r\nIska= ah, eu ia tomar banho\r\nMiraii= entra a├¡, eu j├í t├┤ saindo\r\nIska= beleza *joga a toalha de volta para a Miraii* *tira a roupa*\r\nMiraii= *olha para o bilau do Iska* *sorrio mal├®fico* he, eles regredem t├úo r├ípidosÔÇª\r\nIska= isso foi de prop├│sito n├úo foi, al├®m disso, ├® inverno sabia\r\nMiraii= desculpa esfarrapada, enfim *se enxuga* n├úo esquece de se lavar bem, *sorriso* ou a princesinha precisa de ajuda?\r\nIska= duas coisas, primeiro que eu n├úo sou mais crian├ºa, e segundo que o que tu quer t├í mole\r\nMiraii= isso me lembra os velhos tempos, voc├¬ nunca deixou eu te lavar\r\nIska= credo, s├│ Satan sabe o que voc├¬ faria com o meu corpo enquanto me lavava\r\nMiraii= assim vai ficar virgem at├® morrer sabia\r\nIska= isso se eu fosse virgem hehehehe\r\nMiraii= *se vira para o Iska* como ├® a hist├│ria?\r\nIska= enfim, ├® melhor c├¬ ir logo, sen├úo vai pegar um resfriado\r\nMiraii= -_- hmp *se veste e sai do banheiro*\r\nIska= eu em, faz tempo que ela n├úo fazia isso, achei que ela fazia isso por que ├®ramos crian├ºasÔÇª Porra Miraii\r\n\r\n*na cozinha*\r\n\r\nRaissa= *preparando a comida* isso isso, desse jeito mesmo hehehe vai ficar ├│timo\r\nMiraii= *aparece na cozinha enxugando os cabelos* oh, t├í fazendo o que para o almo├ºo Raissa-neesan?\r\nRaissa= oh, Hirugohan, por qu├¬?\r\nMiraii= bom, pelo menos n├úo ├® s├│ peixeÔÇª Eu n├úo entendo como esses Humanos conseguem comer tanto peixe e n├úo enjoarÔÇª\r\nRaissa= eu entendo, eu passei uma temporada l├í no Brasil e l├í eles comem arroz e feij├úo em todo santo almo├ºo e janta, eles n├úo enjoam n├úo ├®?\r\nMiraii= santo?\r\nRaissa= ops, foi mal, costume brasileiro heheheheÔÇª\r\nMiraii= hmp, cuidado onde anda para n├úo se influenciar viu\r\nRaissa= sim sim, *falando baixinho* mas era que era pra t├í falando isso poxaÔÇª *lembra do que estava esquecendo* MIRAII\r\nMiraii= *se surpreende* si-sim\r\nRaissa= O QUE O ISKA FEZ COM VOC├è, ELE TE ATACOU, TE ASSEDIOU?!!\r\nIska= *aparece* na verdade era essa doida a├¡ que quase me assediouÔÇª\r\nMiraii= a primeira coisa que voc├¬ fez foi olhar pros meus peitos, ent├úo seu argumento ├® automaticamente anulado\r\nRaissa= muitasÔÇª revela├º├ÁesÔÇª ISKA!!!\r\nIska= *se surpreende* si-sim\r\nRaissa= *olha s├®rio para o Iska* nunca pergunte a idade para uma mulher, e nunca, jamais *d├í um soco na cara do Iska* olhe para os nossos peitos com esse olhar tarado\r\nIska= *se levanta* veja bemÔÇª eu estava tentando olhar no cora├º├úo da Miraii, para ver se ela tinha salva├º├úo ainda, eu j├í n├úo tenho culpa se os peitos dela estavam na frenteÔÇª\r\nMiraii= cara, voc├¬ literalmente falou que eles tinham crescido\r\nIska= eu estava me referindo aos seus m├║sculos do peitoral e abd├┤men, ao contr├írio de voc├¬, que literalmente olhou pra minha ÔÇ£Lingui├ºa DestruidoraÔÇØ (Autor: sim, eu pesquisei por nomes de acordo com o anivers├írio) e chamou de pequeno, sendo que ├® 17cmÔÇª\r\nRaissa= isso n├úo se faz Miraii-chan\r\nIska= ├® s├│ isso?\r\nRaissa= hmp\r\nIska= *suspiro*\r\n\r\n*de tarde*\r\n\r\nMiraii= *deitada no sof├í assistindo televis├úo comendo pipoca*\r\nIska= muito folgada n├úo acha?\r\nMiraii= *ignora*\r\nIska= *suspiro* e o Ichi com o Roiunu, j├í avisou pra eles que est├í?\r\nMiraii= *deixa cair uma pipoca da boca* Iskaaaaaaa\r\nIska= *suspiro* t├í t├í, eu vou\r\nMiraii= nunca critiquei\r\nIska= -_- *voa at├® a escola da Miraii*\r\nRaissa= onde est├í o Iska?\r\nMiraii= foi l├í na minha escola avisar ao Ichi e o Roiunu sobre eu estar aquiÔÇª *continua comendo a pipoca*\r\nRaissa= voc├¬ sabe que ele n├úo podia voar n├®, que ele devia t├í era repousandoÔÇª\r\nMiraii= *deixa outra pipoca cair da boca* ah\r\nRaissa= *suspiro* eu pare├ºo uma m├úe cuidando de duas crian├ºasÔÇª\r\nNarrador= ap├│s isso, Iska consegue d├í o recado para Ichi e Roiunu, por├®m, devido a exaust├úo de sua Alma, ele precisou passar 1 h recuperando as energias para ent├úo voltar para casa. Ao retornar, a Raissa for├ºou a Miraii a pedir desculpas ao Iska por mand├í-lo entregar o recado\r\n\r\n*mais tarde, na varanda da casa*\r\n\r\nRaissa= est├í sozinha?\r\nMiraii= sim\r\nRaissa= vem c├í, por que voc├¬ ├® t├úo insens├¡vel com o Iska\r\nMiraii= *fica em sil├¬ncio* n├úo sei, desde que a gente era crian├ºa que eu o trato assim\r\nRaissa= voc├¬ se importa com ele?\r\nMiraii= ├® claro que eu me importoÔÇª eu s├│ n├úo consigo suport├í-lo\r\nRaissa= *fica surpresa* *sorriso* ent├úo ├® isso\r\nMiraii= o que foi?\r\nRaissa= nada n├úo\r\nMiraii= ├® s├®rio isso?\r\nRaissa= *risada* voc├¬ gosta do Iska?\r\nMiraii= em que sentido?\r\nRaissa= oh, romanticamente cla-\r\nMiraii= nem pensar, me arrepio s├│ de imaginar\r\nRaissa= voc├¬ gosta dele em outro sentido ent├úo?\r\nMiraii= o que levou voc├¬ a chegar nessa conclus├úo?\r\nRaissa= bom, quando eu perguntei de forma gen├®rica voc├¬ perguntou em qual sentido especificamente, ent├úo imaginei que voc├¬ gostasse dele em outro sentido e tals\r\nMiraii= bom, se eu falar que n├úo eu mentiria, mas n├úo ├® nada rom├óntico como voc├¬ t├í pensando, ├® maisÔÇª rivalidade talvez?\r\nRaissa= que broxanteÔÇª\r\nMiraii= *suspiro*\r\nRaissa= *sorriso* bom, voc├¬ se importando e cuidando dele para mim j├í mais que o suficiente\r\nMiraii= s├®rio?\r\nRaissa= sim, ├® dif├¡cil algu├®m entender o Iska, principalmente devido a sua linhagem, mas voc├¬ n├úo parece se importar com isso\r\nMiraii= se voc├¬ dizÔÇª *olha para o c├®u pensativa*\r\nMente da Miraii= em outros sentidos emÔÇª\r\n\r\nto be continued\r\n\r\nN├úo perca, no pr├│ximo cap├¡tulo de Life School: Shiraii Shiranui\r\n\r\nAt├® breve
53	13	21	Uda e a Yakuza	f	2024-04-29 17:16:57	2024-05-03 14:13:05	*enquanto isso, em algum lugar da cidade*\r\n\r\nUda= *anda em um beco*\r\nBandido 1= olha isso gente, um forasteiro nessas ├íreas, aqui n├úo ├® lugar para estrangeiro n├úo t├í bom, vaza!\r\nUda= eu quero informa├º├Áes\r\nBandido 1= informa├º├Áes? S├│ se voc├¬ for pedir no inferno *aponta uma arma na cabe├ºa do Uda*\r\nBandido 2= espera, vamos ouvir o que ele quer\r\nBandido 1= tsk *recua*\r\nUda= voc├¬s alguma coisa sobreÔÇª a Or├ículo de Serenidade?\r\nBandido 2= Or├ículo de Serenidade emÔÇª\r\nBandido 1= n├úo me ├® estranho esse nome\r\nBandido 2= sim-\r\nUda= *segura o Bandido 2 pelo pesco├ºo e o coloca contra a parede* me conte tudo o que sabe sobre ela\r\nBandido 1= ora seu *puxa sua arma*\r\nUda= *tira a katana da bainha e aponta para a cabe├ºa do Bandido 2* n├úo se atreva *olha para o Bandido 1* ou algu├®m aqui morrer├íÔÇª\r\nBandido 2= TUDO BEM Bandido 1, EU VOU CONTAR\r\nUda= ooh, voc├¬ se rendeu mais f├ícil do que eu esperavaÔÇª\r\nBandido 2= hehehe eu prezo por algo chamado ÔÇ£vidaÔÇØ sabia?\r\nUda= hmp *solta o Bandido 2* e ent├úo, fale logo *aponta a ponta da katana na dire├º├úo do pesco├ºo do Bandido 2*\r\nBandido 2= voc├¬ tem uma caneta e um papel?\r\nUda= se ├® para anotar o endere├ºo eu anoto no meu celular\r\nBandido 2= certo, o endere├ºo ├® *fala o endere├ºo*\r\nUda= hmmmm ├® um pouco longe daqui\r\nBandido 2= bom, os caras de l├í v├úo saber te dar uma resposta melhor que a minha\r\nUda= ent├úo voc├¬ n├úo sabe em\r\nBandido 2= fo-foi mal t├í, eu n├úo sei muito al├®m desse bairroÔÇª\r\nUda= hmp *sai*\r\nBandido 1= aquele cara ├® um covarde\r\nBandido 2= voc├¬ percebeu?\r\nBandido 1= mas ├® claro, a m├úo dele tava tremendo enquanto apontava para voc├¬\r\nBandido 2= *sorriso* ele vai se fuder todo nas m├úos da Yakuza *risada*\r\nBandido 1= *risada*\r\n\r\n*alguns minutos depois, embaixo de um viaduto em Nishinomiya*\r\n\r\nUda= *entra em um beco* *encontra uma pessoa* preciso de informa├º├Áes\r\nPessoa= oh, ├® mesmo?\r\nUda= sim *mostra o celular com o endere├ºo que o Bandido 2 passou*\r\nPessoa= Osaka emÔÇª O que voc├¬ quer com ÔÇ£elesÔÇØ?\r\nUda= depende de quem seria esse ÔÇ£eleÔÇØ\r\nPessoa= uma pessoa completamente suspeita como voc├¬ querendo confirmar especificamente esse endere├ºo, eu poderia deduzir o que mais se n├úo for a Yakuza?\r\nUda= *aponta a katana no rosto da Pessoa* o fato de voc├¬ n├úo ter negado e sim questionado quer dizer que ├® l├í mesmo certo?\r\nPessoa= *olha seriamente para o Uda* ÔÇª o que uma pessoa que treme a arma diante de um inimigo far├í frente a Yakuza, o maior grupo de crime organizado do Jap├úo?\r\nUda= *fica com raiva* *guarda a katana* eu tenho meus pr├│prios m├®todos para lidar com isso\r\nPessoa= *fica em sil├¬ncio*\r\nUda= *pega o celular de volta* hmp *sai do beco*\r\nPessoa= t├úo jovem e j├í se envolvendo com essas pessoasÔÇª que Deus tenha piedade dele...\r\n\r\nUda= *chega na fronteira entre Nishinomiya e Amagasaki ao entardecer* *entra em uma loja de conveni├¬ncia*\r\nAtendente= oh, boa noite, em que posso ajud├í-lo?\r\nUda= essa cidade tem alguma gangue?\r\nAtendente= hmmmm n├úo grande, s├│ algumas gangues pequenas aqui e ali, mas no geral ├® bem seguro aqui, pode ficar tranquilo\r\nUda= entendi, obrigadoÔÇª me d├¬ uma garrafa de ├ígua, por favor\r\nAtendente= claro *pega uma garrafa e d├í ao Uda*\r\nUda= obrigado *paga e sai da loja* bem seguro emÔÇª *anda mais 500 metros e vai em outra loja de conveni├¬ncia*\r\nAtendente= oh, boa noite\r\nUda= boa noite, como ├® a seguran├ºa desse lugar?\r\nAtendente= n├úo precisa se preocupar tanto, aqui ├® bem seguro comparado aos nossos vizinhos\r\nUda= Osaka?\r\nAtendente= sim\r\nUda= entendi, obrigado *sai da loja* t├í ficando tarde, preciso encontrar um local para dormir o quanto antesÔÇª onde ser├í que tem uma pra├ºa aqui? *entra na loja novamente*\r\nAtendente= oh, boa noite novamente\r\nUda= voc├¬ sabe onde fica a pra├ºa mais pr├│xima daqui?\r\nAtendente= hmmm s├│ conhe├ºo em OsakaÔÇª\r\nUda= t├í muto longeÔÇª\r\nAtendente= voc├¬ quer um local para dormir?\r\nUda= sim, eu estou a caminho de Osaka, mas n├úo posso gastar muito e n├úo tenho casa pra voltarÔÇª\r\nAtendente= n├úo ├® muito, mas que tal ficar aqui dentro da loja? Posso manter o ar-condicionado ligado\r\nUda= mas eu n├úo tenho muito dinheiro sabe...\r\nAtendente= n├úo precisa se preocupar com isso, voc├¬ precisa descansar o corpo e a mente, ent├úo pode ficar aqui\r\nUda= obrigado....\r\n\r\n*no dia seguinte*\r\n\r\nUda= mas uma vez, obrigado por tudo\r\nAtendente= por nada, ├® bom ajudar os outros\r\nUda= simÔÇª j├í vou indo, at├® *vai embora*\r\nAtendente= ele ├® um bom rapazÔÇª\r\nUda= o bom dessa rota que eu peguei ├® que ├® s├│ andar em linha reta que eu chego l├í, o problema ├® que ├® bem longeÔÇª\r\n\r\n*de noite, na ponte que leva ao centro de Osaka*\r\n\r\nUda= que droga, s├®rio que n├úo tem nenhum hotel por aqui? Ah, que se foda, vou passar a noite ao lado da ponte mesmo, vou deixar para atravessar ela bem cedinhoÔÇª Provavelmente de noite deve ser bem perigoso por l├íÔÇª *se encosta em uma ÔÇ£cabineÔÇØ ao lado da ponte* *se concentra* *vai para a Dimens├úo do Tempo*\r\nKami= oh, n├úo esperava visitas t├úo cedoÔÇª\r\nUda= hmp, ei Kami\r\nKami= sim?\r\nUda= eu me infiltrei na Or├ículo de Serenidade esses dias, e reencontrei com Nobutaka e descobri uma coisa interessante\r\nKami= oh, e o que seria?\r\nUda= ele conseguiu parar o tempo sem precisar vim pra c├í, como ele fez isso?\r\nKami= n├úo sei ao certo se voc├¬ j├í est├í forte o suficiente para isso, apesar de n├úo requirir muito de siÔÇª\r\nUda= desembucha\r\nUda= voc├¬ est├í muito esquentadinho ultimamente Uda Katsuki, mas vou te ensinar a teoria, o resto vai ser com voc├¬\r\nUda= pode falar\r\nKami= muito bem, a capacidade de ÔÇ£invocarÔÇØ p├¬ndulos que representam Linhas Temporais espec├¡ficas ├® uma Extens├úo do dom├¡nio do controle temporal na Dimens├úo do Tempo, concedendo ao usu├írio acesso a propriedades e habilidades normalmente associadas a essa Dimens├úo, dominar o controle temporal implica uma conex├úo profunda com o Tecido do Tempo, uma rede complexa que abrange todas as Linhas Temporais e Eventos, imagine essa rede como um conjunto interligado de p├¬ndulos, cada um representando uma Linha Temporal espec├¡fica, ao adquirir habilidades avan├ºadas de manipula├º├úo temporal, o usu├írio pode visualizar e interagir com esses p├¬ndulos. Cada p├¬ndulo representa uma Linha Temporal, com todas as suas ramifica├º├Áes e possibilidades. Invocar um p├¬ndulo significa trazer ├á mente do usu├írio uma representa├º├úo v├¡vida e detalhada de uma Linha Temporal espec├¡fica, uma vez que o usu├írio ÔÇ£invocaÔÇØ o p├¬ndulo representando sua Linha Temporal desejada, ele adquire temporariamente as propriedades e caracter├¡sticas daquela linha, isso inclui habilidades que normalmente seriam exclusivas da Dimens├úo do Tempo, como Viagens Temporais, Manipula├º├úo do Tempo, Visualiza├º├úo de Eventos passados ou futuros, entre outras. ├ë crucial destacar que esse poder n├úo ├® ilimitado e requer controle preciso, o usu├írio precisa aprender a navegar pelos p├¬ndulos de forma cuidadosa, pois cada Linha Temporal possui suas pr├│prias Ramifica├º├Áes e implica├º├Áes, al├®m disso, invocar um p├¬ndulo por muito tempo ou com frequ├¬ncia excessiva pode gerar Instabilidade Temporal, levando a consequ├¬ncias imprevis├¡veis, ao dominar esse tipo de Controle Temporal, o usu├írio ganha n├úo apenas poder, mas tamb├®m responsabilidade, ele deve usar seu conhecimento com sabedoria, evitando interfer├¬ncias dr├ísticas que possam desestabilizar o Tecido Temporal e causar rupturas na Continuidade do Tempo, entendido?\r\nUda= sim, mas eu tenho essa capacidade?\r\nKami= voc├¬ j├í domina todas as propriedades dos p├¬ndulos aqui na Dimens├úo do Tempo, ent├úo creio que voc├¬ j├í tenha capacidade sim de tal ato\r\nUda= ent├ú-\r\nKami= POR├ëM, como eu disse, voc├¬ n├úo deve abusar dessa Extens├úo de voc├¬, ela causar├í instabilidade temporal, vou p├┤r uma regra ├®tica para voc├¬\r\nUda= l├í vem\r\nKami= voc├¬ s├│ poder├í usar essa Extens├úo 5 vezes por dia, se por acaso passar disso, eu irei pessoalmente te bater e d├í uns serm├Áes que voc├¬ tanto odeia, lembre-se, eu posso estar preso a essa dimens├úo, mas eu continuo sendo uma divindade, ent├úo ├® melhor n├úo me subestimar!\r\nUda= *sente um pouco de medo* t├í bom t├í bom, eu entendiÔÇª\r\nKami= *sorriso* agora volte e tente praticar tudo isso\r\nUda= entendidoÔÇª *falando baixo* ainda bem que eu gravei com meu celularÔÇª\r\nKami= como ├®?\r\nUda= *sai da Dimens├úo do Tempo*\r\nKami= ele n├úo entendeu nada n├®ÔÇª *suspiro* esses jovens\r\n\r\n*no mundo real*\r\n\r\nUda= *pratica durante o resto do dia* j├í est├í escuro? Que droga\r\n?= olha s├│ o que temos aqui\r\nMente do Uda= um grupo de desconhecidos, s├úo de alguma gangue?\r\nUda= quem s├úo voc├¬s?\r\n?= *levanta um pouco a blusa, mostrando suas tatuagens* familiarizado agora?\r\nUda= Yakuza emÔÇª parece ser o destinoÔÇª\r\n?= destino?\r\nUda= sim, ei voc├¬s, me levem pro seu chefe, l├¡der, sei l├í, eu preciso ter uma conversinha com eleÔÇª\r\n?= *risada* voc├¬? Querer ver nosso chefe? Isso ├® algum tipo de piada?\r\nUda= *coloca a m├úo atr├ís das costas* *invoca um p├¬ndulo e para o tempo* *saca a katana e corta as cal├ºas dos membros da Yakuza e elas caem* *roda o p├¬ndulo novamente* *aponta para as cal├ºas ca├¡das* isso ├® o suficiente para convec├¬-los, cavalheiros?\r\n?= QUANDO QUE ELE-\r\nUda= *aponta a katana no rosto do membro da Yakuza* n├úo ├® suficiente ainda?\r\n?= o que voc├¬ quer com o nosso Oyabun (l├¡der da Yakuza)?\r\nUda= s├│ quero uma informa├º├úo que, com certeza, ele tem\r\n?= e o que te garante que ele tem essa informa├º├úo?\r\nUda= Or├ículo de Serenidade\r\n?= *se surpreendem*\r\nUda= familiarizados? Eu preciso do m├íximo de informa├º├Áes poss├¡vel sobre ela, eu estou atr├ís da cabe├ºa do l├¡der deles\r\n?= e voc├¬ acha mesmo que consegue bater de frente com aqueles desgra├ºados?\r\nUda= n├úo sei, eu j├í enfrentei o l├¡der deles uma vez, e compreendo muito bem a sua for├ºa, por isso estou atr├ís da Yakuza para reunir o m├íximo de informa├º├Áes para que eu possa me preparar\r\n?= *risada* voc├¬ acha mesmo que acreditar├¡amos nessas besteiras que voc├¬ falou? Olha aqui seu emo albino, n├úo ache que s├│ por que falou um monte de besteira sobre a Or├ículo de Serenidade que a gente v├í levar voc├¬ ao nosso Oyabun, ent├úo cai fora\r\nUda= voc├¬s falam como se n├úo tivessem com as cal├ºas ca├¡das\r\n?= OLHA AQUI SEU-\r\nUda= *suspiro* o que eu preciso fazer para voc├¬s me levarem a esse tal de Oyabun?\r\n?= provas\r\nUda= provas?\r\n?= sim, n├│s somos muitos cautelosos em rela├º├úo a outras gangues, principalmente rivais, n├úo podemos simplesmente acreditar que voc├¬ fez tudo isso e te levar ao nosso Oyabun, n├│s sabemos muito bem da sua for├ºa, e justamente por isso estamos sendo muito cautelosos, ningu├®m sabe o que voc├¬ pode fazer l├í dentro\r\nUda= provas emÔÇª me esperem aqui um instante, j├í que eu trago prov-\r\n?= n├│s vamos com voc├¬\r\nUda= *fica surpreso* o- como assim?\r\n?= acha mesmo que deixaremos voc├¬ ir sozinho? E se voc├¬ falsificar as coisas? Por garantia todos acompanharemos voc├¬\r\nMente do Uda= droga, esses caras realmente n├úo v├úo sair do meu p├®... bom, acho que o Kami n├úo vai achar ruim... n├úo, ele certamente ir├í, mas, se eu deixar eles aqui e meter o p├®, eu jamais poderei me aproximar da Yakuza de forma pac├¡fica novamente...\r\nUda= muito bem *se senta no ch├úo* se segurem em mim\r\nTodos os ?= *coloca suas m├úos nas costas do Uda*\r\nUda= *vai para a Dimens├úo do Tempo*\r\n?= MAS O QU-\r\n?= EI, O QUE EST├ü ACONTECENDO??\r\nUda= j├í que voc├¬s v├úo sabe-\r\nKami= *d├í um tapa na cabe├ºa do Uda* QUE QUE TU ACHA QUE T├ü FAZENDO MOLEQUE??!!\r\nUda= aiaiaiaiai, olha eu explico isso depois, ├® uma emerg├¬ncia\r\n?= quem ├® o velho?\r\nKami= espero que tenha um motivo bastante plaus├¡vel para isso, pois voc├¬ est├í quebrando nossas regras e-\r\nUda= t├í bom t├í bom, os serm├Áes ficam pra depois, voc├¬ levar a gente pro passado?\r\n?= EI, DO QUE VOC├è T├ü FALANDO??\r\nUda= voc├¬s querem provas, n├úo querem? Pois bem, mostrarei as provas para voc├¬s\r\nKami= *suspiro* o que voc├¬ quer mostrar para eles?\r\nUda= a minha luta contra o Nobutaka\r\nKami= muito bem *volta os 5 para o passado* o que ele tem na cabe├ºa, sinceramente...\r\n\r\n*no passado*\r\n\r\nNobutaka= *come├ºa a bater palmas* meus parab├®ns, parece que voc├¬ pulou algumas fases e foi enfrentar logo o boss final em\r\nUda do passado= n├úo estou aqui para brincadeiras\r\nUda do presente= *esconde os 4 membros da Yakuza atr├ís de umas caixas* *fala sussurrando* fa├ºam sil├¬ncio\r\n?= *fala susurrando* esse local bate com a descri├º├úo que temos, e por que caralhos tem dois emos albinos?\r\nUda do presente= como eu disse, estamos vendo o passado, a prova viva que eu enfrentei o l├¡der da Or├ículo de Serenidade\r\n?= olhem, aquele ├® o Yu Sora, o bra├ºo direito do Nobutaka\r\nNobutaka= voc├¬ sabe que todas as vezes que voc├¬ usa o poder do tempo ├® sempre criado uma nova linha temporal, certo, sabendo disso, tive a curiosidade para saber como eram os futuros de outras linhas alternativas, e em todas elas, sem exce├º├úo, voc├¬ sempre morria para mim, ent├úo v├¬ se n├úo morre nessa linha temporal, t├í bom?\r\n?= do que ele t├í falando, emo albino\r\nUda do presente= meu nome ├® Uda, e ele tem os mesmos poderes que eu, o Olho do Tempo\r\n?= poderes em, se eu n├úo tivesse aqui eu dificilmente acreditaria, mas a prova est├í bem na minha frente\r\nUda= j├í ├® o suficiente?\r\n?= acho que simÔÇª\r\nUda do presente= j├í que estamos em outra Linha TemporalÔÇª *se levanta* EI NOBUTAKA\r\nNobutaka= *fica surpreso*\r\nUda do presente= VAI TOMAR NO CU *volta para a Dimens├úo do Tempo*\r\nNobutaka= voc├¬ ├® bem ousado em\r\nUda do passado= o que foi isso?\r\nNobutaka= *corta a cabe├ºa do Uda do passado* *sorriso* parece que um dos Uda's sobreviveu emÔÇª\r\n\r\n*na Dimens├úo do Tempo*\r\n\r\n?= O QUE VOC├è PENSA QUE EST├ü FAZENDO??!! PROVOCANDO-O DAQUELE JEITO, QUERIA MORRER??!!\r\nUda= aquilo ├® outra Linha Temporal, n├úo ├® a nossa, relaxa\r\n?= tsk\r\nUda= vamos voltar, ah, Kami\r\nKami= sim, sou Kami\r\nUda= depois eu explico com detalhes essa situa├º├úo toda, mas por enquanto voc├¬ pode ficar com o meu obrigado por mandar a gente pro passado a custo de nada, falou volta ao Mundo Real\r\nKami= *fica irritado* aquele pestinhaÔÇª achando que aqui ├® festa, quando ele vier novamente vou faz├¬-lo pagar por issoÔÇª\r\n\r\n*no Mundo Real*\r\n\r\nUda= e ent├úo, convencidos?\r\n?= *olha para os seus companheiros* *ascena a cabe├ºa* venha comigo\r\nUda= *segue eles* se tentarem alguma gracinha, levarei somente a cabe├ºa de voc├¬s para o seu chefe, t├í entendendo?\r\n?= entendido\r\nUda= ├│timoÔÇª\r\n\r\n*ao passar na ponte*\r\n\r\n?= ei, venda os olhos deles\r\n?= certo *coloca sua blusa nos olhos do Uda*\r\nUda= s├®rio, qual a necessidade disso?\r\n?= para garantir que voc├¬ n├úo saiba do nosso esconderijo e nos entregar para a pol├¡cia\r\nUda= hmp\r\n\r\n*dentro do esconderijo*\r\n\r\n?= eu pedi para o "?" ir na frente para avisar ao nosso Oyabun sobre esse caso\r\n?= boa, ├® bom que j├í adianta a apresenta├º├úo *tira a venda do rosto do Uda*\r\nUda= at├® que enfim\r\n?= vamos\r\nUda= *segue*\r\n?= Oyabun, aqui est├í ele\r\nMente do Uda= ent├úo esse ├® o l├¡der da Yakuza emÔÇª\r\nKenichi= ent├úo esse ├® o tal do ÔÇ£Emo AlbinoÔÇØ em\r\nUda= desculpa interromper sua fala, mas meu nome ├® Uda Katsuki, Oyabun\r\nMente do Uda= demonstrar respeito ├á Yakuza ├® a melhor forma de conseguir informa├º├Áes deles, quem sabe eu posso at├® me juntar a eles futuramente e usar eles para meus pr├│prios interesses, mas por enquanto nosso relacionamento ser├í apenas de troca de informa├º├ÁesÔÇª\r\nKenichi= ent├úo voc├¬ quer informa├º├Áes sobre a Or├ículo de Serenidade, correto?\r\nUda= sim, eu j├í mostrei provas vivas para os seus membros sobre a minha intera├º├úo com a Or├ículo de Serenidade\r\nKenichi= por qu├¬?\r\nUda= ?\r\nKenichi= por que voc├¬ est├í atr├ís especificamente da Or├ículo de Serenidade? Voc├¬ sabe que ela ├® bem perigosa, certo?\r\nUda= sim, minha maior motiva├º├úo ├® acabar com o l├¡der deles, Nobutaka Marakami\r\nKenichi= para?\r\nUda= vingan├ºa, ├│dio, todo tipo de pensamento negativo sobre ele, ele usa seus pr├│prios aliados para evitar sujar suas m├úos de sangue, e foi com isso que ele tirou a pessoa mais importante para mim\r\nKenichi= Uda Katsuki, entendo sua busca por vingan├ºa e compreendo a intensidade de seus sentimentos. No entanto, saiba que a Yakuza n├úo se envolve em disputas pessoais movidas por ├│dio ou rancor. Nossa organiza├º├úo opera com base em lealdade, respeito e interesses m├║tuos. Se deseja nossa colabora├º├úo, precisar├í demonstrar que suas inten├º├Áes v├úo al├®m de meros desejos de vingan├ºa e que h├í um benef├¡cio claro para ambas as partes em sua busca pela Or├ículo de Serenidade e seu l├¡der, Nobutaka Marakami\r\nMente do Uda= droga, a Yakuza ├® mais dif├¡cil do que eu imagineiÔÇª Nesse caso, vou improsivar alguma coisa\r\nUda= Oyabun, entendo a import├óncia dos valores da Yakuza e estou disposto a me alinhar com eles, minha busca pela Or├ículo de Serenidade n├úo ├® apenas sobre vingan├ºa pessoal, mas tamb├®m sobre restaurar a ordem e a justi├ºa neste mundo onde gangues rivais como a Or├ículo representam uma amea├ºa, sei que a Yakuza valoriza lealdade, respeito e a busca por interesses comuns. Estou pronto para oferecer minha for├ºa, habilidades e informa├º├Áes em troca do apoio da Yakuza nesta miss├úo, juntos, podemos combater uma amea├ºa em comum e fortalecer nossas posi├º├Áes\r\nKenichi= *sorriso* interessante, muito ent├úo *se levanta* onde voc├¬ mora atualmente?\r\nUda= eu n├úo tenho casaÔÇª\r\nKenichi= entendo, voc├¬ ficar├í temporariamente na casa daqueles que lhe trouxeram, entendeu?\r\nUda= sim\r\nTodos os ?= sim!\r\nKenichi= a vota├º├úo ├® amanh├ú, ent├úo n├úo se atrasem\r\nTodos os ?= entendido!\r\n?= vamos\r\nUda= sim!\r\nMente do Uda= acho que isso ├® o que dizem sobre um novo ciclo se abrindo em nossas vidas emÔÇª Me aguarde, Nobutaka\r\n\r\nto be continued\r\n\r\nN├úo percam, no pr├│ximo cap├¡tulo de Jikan no Me: Antigos Rivais\r\n\r\nAt├® breve
10	2	59	O Reencontro	t	2024-04-30 18:20:48	2024-05-11 22:46:02	*Shiraii=* ISKA-KUUUUUUN `*corre para abra├ºar o Iska*`\r\n*Miraii=* `*segura a Shiraii*` voc├¬ n├úo vai encostar um dedo nele sua cadela\r\n*Iska=* calma meninas, calma\r\n*Miraii=* `*olha com desprezo para o Iska*` voc├¬ claramente t├í gostando dessa situa├º├úo, seu vagabundo\r\n*Iska=* qual foi Miraii, t├í de TPM por acaso?\r\n*Miraii=* hmp `*solta a Shiraii*`\r\n*Shiraii=* `*abra├ºa o Iska*` aaaaaaah Iska-kun, faz tanto tempo que eu n├úo te vejo, tava com saudades j├í\r\n*Iska=* `*fica sem jeito*`\r\n*Miraii=* nojento\r\n\r\n`*mais tarde na janta*`\r\n\r\n*Shiraii=* o que tem feito, Iska-kun?\r\n*Iska=* nada de muito especial\r\n*Shiraii=* e voc├¬ Miraii-chan?\r\n*Miraii=* mesma coisa\r\n*Shiraii=* aaaaah...\r\n*Iska=* e voc├¬ Shiraii-senpai?\r\n*Shiraii=* eu estava estudando sobre a Terra at├® vim aqui, eu soube dos outros Pecados que voc├¬s vieram pra c├í para tirarem vantagens dos Humanos sobre os Arcanjos e atacarem eles\r\n*Iska=* aaaaaaaaaah `*fala baixinho para a Miraii*` a gente veio fazer isso?\r\n*Miraii=* `*fala baixinho com o Iska*` n├úo que eu lembre...\r\n*Shiraii=* o que voc├¬s est├úo cochichando a├¡ em?\r\n*Raissa=* a prop├│sito Shiraii-chan, como est├úo os outros Pecados?\r\n*Shiraii=* eles ainda tem aquela ├®tica de n├úo revelar os nomes, ainda n├úo entendo o porqu├¬ disso, mas fora isso est├í tudo como era antes\r\n*Iska=* o neg├│cio dos nomes ├® para evitar que sejamos revelados e o C├®u nos matar com mais facilidade\r\n*Shiraii=* mas voc├¬s s├úo fortes pra caramba n├®\r\n*Iska=* teoricamente sim\r\n*Shiraii=* ent├úo n├úo tem sentido manter essa "├®tica" se os Anjos sabem quem ├® forte e quem ├® fraco...\r\n*Iska=* a├¡ c├¬ tem um ponto...\r\n*Miraii=* apenas siga o roteiro Shiraii...\r\n*Shiraii=* ?
\.


                                                                                                                                                                                                 3441.dat                                                                                            0000600 0004000 0002000 00000000005 14621475613 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3439.dat                                                                                            0000600 0004000 0002000 00000000005 14621475613 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3438.dat                                                                                            0000600 0004000 0002000 00000000005 14621475613 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3451.dat                                                                                            0000600 0004000 0002000 00000002115 14621475613 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        21	2	1	2024-04-30 13:03:05	2024-04-30 13:03:05
22	2	2	2024-04-30 13:03:05	2024-04-30 13:03:05
23	2	3	2024-04-30 13:03:05	2024-04-30 13:03:05
24	2	4	2024-04-30 13:03:05	2024-04-30 13:03:05
25	2	5	2024-04-30 13:03:05	2024-04-30 13:03:05
26	2	6	2024-04-30 13:03:05	2024-04-30 13:03:05
27	2	14	2024-04-30 13:03:05	2024-04-30 13:03:05
28	1	2	2024-04-30 13:47:56	2024-04-30 13:47:56
29	1	3	2024-04-30 13:47:56	2024-04-30 13:47:56
30	1	4	2024-04-30 13:47:56	2024-04-30 13:47:56
31	1	5	2024-04-30 13:47:56	2024-04-30 13:47:56
32	1	6	2024-04-30 13:47:56	2024-04-30 13:47:56
33	1	14	2024-04-30 13:47:56	2024-04-30 13:47:56
34	1	15	2024-04-30 13:47:56	2024-04-30 13:47:56
62	13	1	2024-05-03 14:52:18	2024-05-03 14:52:18
63	13	2	2024-05-03 14:52:18	2024-05-03 14:52:18
64	13	3	2024-05-03 14:52:18	2024-05-03 14:52:18
65	13	4	2024-05-03 14:52:18	2024-05-03 14:52:18
66	13	5	2024-05-03 14:52:18	2024-05-03 14:52:18
67	13	6	2024-05-03 14:52:18	2024-05-03 14:52:18
68	13	13	2024-05-03 14:52:18	2024-05-03 14:52:18
69	13	14	2024-05-03 14:52:18	2024-05-03 14:52:18
70	13	15	2024-05-03 14:52:18	2024-05-03 14:52:18
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                   3445.dat                                                                                            0000600 0004000 0002000 00000003644 14621475613 0014271 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	Akuma to keiyaku shita hi	73c930d47d0131c9eb27a98dbe5af4f0.jpg	Nesse mundo onde Magia ├® tudo, existe um N├║cleo na Alma da pessoa, onde fica armazenada a Mana, por├®m, o {protagonist_name} n├úo tem tanta afinidade com ela, apesar de poder utiliz├í-la. Outro dia, de repente, um Dem├┤nio aparece no quarto de {protagonist_name}, prometendo melhorar seus atributos m├ígicos em troca de um "simples" acordo. Ao aceitar tal acordo, seu N├║cleo ├® modificado e ele ganha Magia de Escurid├úo, mas ele n├úo sabia que o acordo proposto consistia em transform├í-lo em um Dem├┤nio...	0	2024-04-23 12:24:51	2024-04-30 13:47:56	["Drama","A\\u00e7\\u00e3o","Com\\u00e9dia","Escolar","Shounen","Poderes","Magia"]
2	1	Life School	866ffb63f7d3eb64eceaf3b48f5a54ae.jpg	Life School ├® um mang├í que se passa no Jap├úo no ano 2114. Ap├│s uma cratera se abrir na Austr├ília, um g├ís misterioso, impercept├¡vel para os humanos, se misturou com o oxig├¬nio, gerando um novo g├ís e dando poderes aos Humanos, chamado de "Habilidade". Iska Aleyaro tem a Habilidade do "Roubo", que permite que ele roube as Habilidades dos outros para si pr├│prio. Assim, ele parte em uma jornada, em busca de viver uma vida escolar tranquila... Ou ser├í que n├úo?	3	2024-04-22 12:24:51	2024-04-30 18:20:48	["Drama","A\\u00e7\\u00e3o","Com\\u00e9dia","Escolar","Shounen","Poderes"]
13	1	Jikan no Me	e4a43403719de80b703248e6b8071629.jpg	Uda Katsuki ├® um ex-aluno de um pequeno Doj├┤ de Nishinomiya, onde aprendeu todas as t├®cnicas de Artes Macias e habilidades com uma Katana. Ap├│s um tempo, Uda enfrenta seu rival, Nero Nosuwa, com espadas de verdade, a consequ├¬ncia foi a perda do seu olho esquerdo, restando apenas uma cicatriz. Agora, na faculdade, Uda reencontra sua antiga paix├úo, Aone Nosuwa. O que ser├í que ele ir├í fazer para se aproximar dela novamente? E o que isso ir├í afetar em seu futuro? Encontre a resposta nesse Mang├í.	1	2024-04-28 15:08:44	2024-05-03 14:52:18	{}
\.


                                                                                            3430.dat                                                                                            0000600 0004000 0002000 00000001027 14621475613 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	0001_01_01_000000_create_users_table	1
2	0001_01_01_000001_create_cache_table	1
3	0001_01_01_000002_create_jobs_table	1
4	2024_04_14_142619_add_two_factor_columns_to_users_table	1
5	2024_04_14_142956_create_personal_access_tokens_table	1
6	2024_04_14_173859_create_mangas_table	1
7	2024_04_14_175044_create_chapters_table	1
8	2024_04_14_183939_add_categorys_to_mangas_table	1
9	2024_04_15_185419_create_categories_table	1
10	2024_04_15_185736_create_manga_categories_table	1
11	2024_04_22_172149_add_content_to_chapters_table	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         3433.dat                                                                                            0000600 0004000 0002000 00000000005 14621475613 0014252 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3443.dat                                                                                            0000600 0004000 0002000 00000000005 14621475613 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3434.dat                                                                                            0000600 0004000 0002000 00000023434 14621475613 0014266 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        WgbPWD4cV2yujN8baUSdkzufVrKfxegWDAmGbKw3	1	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	YTo0OntzOjY6Il90b2tlbiI7czo0MDoibDFFM2wyQTlUcjYzWlFWRnRZY1hBdms2RVp0WlZxd0hyMlpPVWd5MCI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozOToiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2NhdGVnb3J5cy9Db21lZGlhIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1714917730
rljhTDdoYUOpD6N6MegvcxYH5gG0PVaGhsR9bxRZ	1	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiYmwzN3ZUR2t0c1VPNVNSYU9uQmsyT0pGYWl5a2NPZmlEUjRuNlVESSI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMiRER3ZiR2JuZGRCaHBrWXRzaUlSdVVPRkljMEZaVDM1UjJZVTFJdnhaNkxHbUdSeW1STGMxeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jaGFwdGVyL2VkaXQvMTAiO319	1714925731
bYSznBuirr0dEbd0cCzEoazofc7kPYqL3K51ue57	1	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWW1GRTdjeGhBeE1rbTl5M1V1RG5vbnA1MzhLYXl6RTZqSkVsWmNmZCI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozNzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2NoYXB0ZXIvZWRpdC8xMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1714933951
ESSEKY0h8VirjaskArhaDrb7ZRkF9SqrOpvYJrvu	1	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	YToyOntzOjY6Il90b2tlbiI7czo0MDoiWG9TdXVvNUNMdFZJZHVuT3c4NXdmTGFza05Uc0VsTGFJMDlEWVU0bSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1714943321
V5hF4vMLwqqTtMbi76KMsO1vBjqJZS91YY4AiCaG	1	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiWnNlYkl6MWZmQmlGMG52RTNTaVJtYnUybkdMWDQwY2hmZ1VxY0VTNCI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2Rhc2hib2FyZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEyJERHdmJHYm5kZEJocGtZdHNpSVJ1VU9GSWMwRlpUMzVSMllVMUl2eFo2TEdtR1J5bVJMYzF5Ijt9	1714943560
UNn63wwc6ygCqDe7QHr79cjY87H7NaYUjeRS4i8j	1	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	YTo1OntzOjY6Il90b2tlbiI7czo0MDoidnd0MjdyMWZhM0JqV2dYUklybk1mMlpYS0szS1RKd1RSY0lSNmRMcyI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMiRER3ZiR2JuZGRCaHBrWXRzaUlSdVVPRkljMEZaVDM1UjJZVTFJdnhaNkxHbUdSeW1STGMxeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1714995230
SNLE3jJdFssynyE4oSDPVZPfOhB5HROKWLzCpaAi	1	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiWWIwc05BdVZEQUpTZjJxNDE4Nm4zNW9LMTRpemtnVnM1R0xoV2pPQiI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMiRER3ZiR2JuZGRCaHBrWXRzaUlSdVVPRkljMEZaVDM1UjJZVTFJdnhaNkxHbUdSeW1STGMxeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jaGFwdGVyL2VkaXQvMTAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1715046124
KoeYFHLqBbaGFfItJbY5wMTAjzl0u95XbTu7v7E1	1	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiMTFwbmVWQjlkVm1nSzYzNFUxZkYxWUV1Tk10VXV2V1B6V0h2RUo3MSI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTIkREd2YkdibmRkQmhwa1l0c2lJUnVVT0ZJYzBGWlQzNVIyWVUxSXZ4WjZMR21HUnltUkxjMXkiO30=	1715468532
XoaZtKxn3JmELbhyEsYO7VVFWUqo7IxEYgrG7pOr	1	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSkdHU0ZENkdtbTVuMFlEY2tnMU55dTdZQ0doNzhISU42RWFadTlYYSI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1715539666
3f9KVpHHbMIZMHzZS1QwFSEoHhxqMd28EnxvcAhZ	1	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	YTo0OntzOjY6Il90b2tlbiI7czo0MDoic1NmWTUyUUJMQUJkMmE5YjR3N3B5RlZiaE1NVGhIdHkyWDkzNWE3biI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1715871544
oZN6uxTfXPEktaziW32htaQcgu4adin2m695To1u	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	YToyOntzOjY6Il90b2tlbiI7czo0MDoiS0VIbnZJblprelo2ZWFKeXpGUlpSUTVOcWFyTG01TEcxR1kweEI5WCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1714775575
g3MvS93hWMm5Mg8fvcuWe3Qxb7CXzLbrKzheLE2M	1	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	YTo1OntzOjY6Il90b2tlbiI7czo0MDoic3B3eU5pSm9ZdEhza3Nzd0ZiWlNLY1F0WGI0WEc1REk4NXZKak5jcSI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2NoYXB0ZXIvMSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEyJERHdmJHYm5kZEJocGtZdHNpSVJ1VU9GSWMwRlpUMzVSMllVMUl2eFo2TEdtR1J5bVJMYzF5Ijt9	1714775799
ZJGOn5X5Rpr7kaO36uwRjtZ8EWAFDNMZ2wFoKMak	1	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRGM3aGZUR0xwN3ViSm43c2NLYXlyVDFlMnM4UzBwWnpnaUdwMUI3eCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwIjt9czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTIkREd2YkdibmRkQmhwa1l0c2lJUnVVT0ZJYzBGWlQzNVIyWVUxSXZ4WjZMR21HUnltUkxjMXkiO30=	1714828050
MJmsmr2JYrcTX5oNa81iOVcDxQOozByum81P0ooR	1	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTk5QcXYyT29HN1VXOUdpSUlyOVRxTUJvanZTNGIxeWgwZ0o4NFJ4aCI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1715871545
pvAwGeQx9EvOVU8nQ9FRH2Yy6xRv2bFJ0KihJEFB	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	YToyOntzOjY6Il90b2tlbiI7czo0MDoidldJREs4MW9EM2ZSd2pwOTlySDJoOHQxWXZhZ1Bkc2J1ZUt4RFh4TCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1715877265
yJuJxr9Wy0mfOcHevV5hGWcazjTmRqogFW4xJkci	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiVGQ5OXhrY2ZjZzcwQjVrQmFQZXd3Ym0xWUMwZnFsU1ZkY05ZU2VYdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1715877266
N7zh4XzEMBSGAi1hgC4s1y27XuOjOdzjI8Kv00Z4	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoianFaNHlzaGdQbHdCdkhRcnZ3aHR4T0c2cXlWSndzQTk1ZnZ1QmRLbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1715877431
AJWIGkdocX577JPPtB03fIbmDDaEu4GGyudtt1Jz	1	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRWhEWkRDNkFkSHNiVlR1U2IzSGwxTEtPSTN0RTkxb0tSV1h0aWxZayI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTIkREd2YkdibmRkQmhwa1l0c2lJUnVVT0ZJYzBGWlQzNVIyWVUxSXZ4WjZMR21HUnltUkxjMXkiO30=	1715877722
EanKofNN4kFzcibdJkqDrtyQxiMQxqwEOAYNW72Z	1	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRXVPRzM2dzNBNVdibUNNejJkYjZVQlNWejJQRGJqUjNQTEdFRXl2MSI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1715889112
\.


                                                                                                                                                                                                                                    3432.dat                                                                                            0000600 0004000 0002000 00000000410 14621475613 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Luck	luck@gmail.com	\N	$2y$12$DGvbGbnddBhpkYtsiIRuUOFIc0FZT35R2YU1IvxZ6LGmGRymRLc1y	sKvyOpObrHkBFtpSKep2ZHZteHqGDXiWhilj8YcLbOICNRqhk05XiJvPJcm4	\N	profile-photos/7HqDVqF4xLqGs09uflAappb1pZ56d1DR7l58baw0.jpg	2024-04-22 17:47:54	2024-04-22 18:24:01	\N	\N	\N
\.


                                                                                                                                                                                                                                                        restore.sql                                                                                         0000600 0004000 0002000 00000055772 14621475613 0015415 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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

DROP DATABASE "MangaRealm";
--
-- Name: MangaRealm; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "MangaRealm" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';


ALTER DATABASE "MangaRealm" OWNER TO postgres;

\connect "MangaRealm"

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
-- Name: cache; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO postgres;

--
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO postgres;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    category_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: chapters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chapters (
    id bigint NOT NULL,
    manga_id bigint NOT NULL,
    index integer NOT NULL,
    title character varying(255) NOT NULL,
    sketch boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    content text NOT NULL
);


ALTER TABLE public.chapters OWNER TO postgres;

--
-- Name: chapters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chapters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chapters_id_seq OWNER TO postgres;

--
-- Name: chapters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chapters_id_seq OWNED BY public.chapters.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: job_batches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO postgres;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobs_id_seq OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: manga_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.manga_categories (
    id bigint NOT NULL,
    manga_id bigint NOT NULL,
    category_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.manga_categories OWNER TO postgres;

--
-- Name: manga_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.manga_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.manga_categories_id_seq OWNER TO postgres;

--
-- Name: manga_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.manga_categories_id_seq OWNED BY public.manga_categories.id;


--
-- Name: mangas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mangas (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    image character varying(255) NOT NULL,
    synopsis character varying(500) NOT NULL,
    qtd_chapter integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    categorys json NOT NULL
);


ALTER TABLE public.mangas OWNER TO postgres;

--
-- Name: mangas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mangas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mangas_id_seq OWNER TO postgres;

--
-- Name: mangas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mangas_id_seq OWNED BY public.mangas.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO postgres;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_access_tokens_id_seq OWNER TO postgres;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    current_team_id bigint,
    profile_photo_path character varying(2048),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    two_factor_secret text,
    two_factor_recovery_codes text,
    two_factor_confirmed_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: chapters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chapters ALTER COLUMN id SET DEFAULT nextval('public.chapters_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: manga_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manga_categories ALTER COLUMN id SET DEFAULT nextval('public.manga_categories_id_seq'::regclass);


--
-- Name: mangas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mangas ALTER COLUMN id SET DEFAULT nextval('public.mangas_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache (key, value, expiration) FROM stdin;
\.
COPY public.cache (key, value, expiration) FROM '$$PATH$$/3435.dat';

--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.
COPY public.cache_locks (key, owner, expiration) FROM '$$PATH$$/3436.dat';

--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, category_name, created_at, updated_at) FROM stdin;
\.
COPY public.categories (id, category_name, created_at, updated_at) FROM '$$PATH$$/3449.dat';

--
-- Data for Name: chapters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chapters (id, manga_id, index, title, sketch, created_at, updated_at, content) FROM stdin;
\.
COPY public.chapters (id, manga_id, index, title, sketch, created_at, updated_at, content) FROM '$$PATH$$/3447.dat';

--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.
COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM '$$PATH$$/3441.dat';

--
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.
COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM '$$PATH$$/3439.dat';

--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.
COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM '$$PATH$$/3438.dat';

--
-- Data for Name: manga_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.manga_categories (id, manga_id, category_id, created_at, updated_at) FROM stdin;
\.
COPY public.manga_categories (id, manga_id, category_id, created_at, updated_at) FROM '$$PATH$$/3451.dat';

--
-- Data for Name: mangas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mangas (id, user_id, name, image, synopsis, qtd_chapter, created_at, updated_at, categorys) FROM stdin;
\.
COPY public.mangas (id, user_id, name, image, synopsis, qtd_chapter, created_at, updated_at, categorys) FROM '$$PATH$$/3445.dat';

--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
\.
COPY public.migrations (id, migration, batch) FROM '$$PATH$$/3430.dat';

--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.
COPY public.password_reset_tokens (email, token, created_at) FROM '$$PATH$$/3433.dat';

--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
\.
COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM '$$PATH$$/3443.dat';

--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
\.
COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM '$$PATH$$/3434.dat';

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, current_team_id, profile_photo_path, created_at, updated_at, two_factor_secret, two_factor_recovery_codes, two_factor_confirmed_at) FROM stdin;
\.
COPY public.users (id, name, email, email_verified_at, password, remember_token, current_team_id, profile_photo_path, created_at, updated_at, two_factor_secret, two_factor_recovery_codes, two_factor_confirmed_at) FROM '$$PATH$$/3432.dat';

--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 15, true);


--
-- Name: chapters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chapters_id_seq', 10, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: manga_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.manga_categories_id_seq', 70, true);


--
-- Name: mangas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mangas_id_seq', 13, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 11, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: chapters chapters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chapters
    ADD CONSTRAINT chapters_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: manga_categories manga_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manga_categories
    ADD CONSTRAINT manga_categories_pkey PRIMARY KEY (id);


--
-- Name: mangas mangas_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mangas
    ADD CONSTRAINT mangas_name_unique UNIQUE (name);


--
-- Name: mangas mangas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mangas
    ADD CONSTRAINT mangas_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- Name: chapters chapters_manga_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chapters
    ADD CONSTRAINT chapters_manga_id_foreign FOREIGN KEY (manga_id) REFERENCES public.mangas(id);


--
-- Name: manga_categories manga_categories_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manga_categories
    ADD CONSTRAINT manga_categories_category_id_foreign FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: manga_categories manga_categories_manga_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manga_categories
    ADD CONSTRAINT manga_categories_manga_id_foreign FOREIGN KEY (manga_id) REFERENCES public.mangas(id);


--
-- Name: mangas mangas_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mangas
    ADD CONSTRAINT mangas_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
