PGDMP  +                    |            blog_db    16.2    16.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16506    blog_db    DATABASE     z   CREATE DATABASE blog_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE blog_db;
                postgres    false            �            1259    16559    likes    TABLE     a   CREATE TABLE public.likes (
    id integer NOT NULL,
    user_id integer,
    post_id integer
);
    DROP TABLE public.likes;
       public         heap    postgres    false            �            1259    16558    likes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.likes_id_seq;
       public          postgres    false    220            �           0    0    likes_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;
          public          postgres    false    219            �            1259    16543    posts    TABLE        CREATE TABLE public.posts (
    id integer NOT NULL,
    creator_id integer,
    title character varying(50),
    text text
);
    DROP TABLE public.posts;
       public         heap    postgres    false            �            1259    16542    posts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.posts_id_seq;
       public          postgres    false    218            �           0    0    posts_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;
          public          postgres    false    217            �            1259    16508    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(50)
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16507    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    216            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    215            &           2604    16562    likes id    DEFAULT     d   ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);
 7   ALTER TABLE public.likes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            %           2604    16546    posts id    DEFAULT     d   ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);
 7   ALTER TABLE public.posts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            $           2604    16511    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            �          0    16559    likes 
   TABLE DATA           5   COPY public.likes (id, user_id, post_id) FROM stdin;
    public          postgres    false    220          �          0    16543    posts 
   TABLE DATA           <   COPY public.posts (id, creator_id, title, text) FROM stdin;
    public          postgres    false    218   F       �          0    16508    users 
   TABLE DATA           A   COPY public.users (id, first_name, last_name, email) FROM stdin;
    public          postgres    false    216   �       �           0    0    likes_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.likes_id_seq', 16, true);
          public          postgres    false    219            �           0    0    posts_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.posts_id_seq', 11, true);
          public          postgres    false    217            �           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 5, true);
          public          postgres    false    215            .           2606    16564    likes likes_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.likes DROP CONSTRAINT likes_pkey;
       public            postgres    false    220            ,           2606    16550    posts posts_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_pkey;
       public            postgres    false    218            (           2606    16515    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    216            *           2606    16513    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    216            0           2606    16574    likes likes_post_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.likes DROP CONSTRAINT likes_post_id_fkey;
       public          postgres    false    218    220    4652            1           2606    16569    likes likes_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.likes DROP CONSTRAINT likes_user_id_fkey;
       public          postgres    false    216    220    4650            /           2606    16553    posts posts_creator_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_creator_id_fkey FOREIGN KEY (creator_id) REFERENCES public.users(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_creator_id_fkey;
       public          postgres    false    4650    216    218            �   5   x���	� ���0B��i��ZhӔ���W��5tuK�O�����s /1��      �   E  x�MQAN1;���bv�i��Am3�$�o�c�3 �E����D-���5*E9'������Մ3ʘ|Y�U�ϩ^V~�{�� Z݁�=s#�g��T���>՞Lݑ�Ԓy�U=
���붰�K����i��Nt����Y�����ʾ	��5���c�El�Rq�l	Y��Vf������{2y]�SТ���e�H�2X�= �Y{�%e	+��{�=�
g`|�-�	��8��g��� b4 E�Ӥ��xMZ��2A�f-��0�& ���Z�NۤJY2�b���0rӄ�Q.H�Ƨ��B�ْ�wЖGۖY�-��?EuϷιo:��      �   �   x�U�K�@D�=��$���p �n:0�4]�g\��E0&��^�*j��tA����4s&�R��܁�:xKP�x��W��fD�[G�y�(�>��֊:���u;�DCdB�El�j2�h���ϙz����a	X�{�� wtB�     