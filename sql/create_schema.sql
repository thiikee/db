create table "posts" (
    "id" text primary key,
    "title" text not null,
    "type" text not null,
    "love" integer,
    "cover" integer,
    "comment" text,
    "discarded" integer,
    "createdAt" integer,
    "updatedAt" integer,
    "use" integer,
    "have" integer
);

create table "women" (
    "name" text primary key not null,
    "yomi" text not null,
    "sort" text
);

create table "artists" (
    "name" text primary key not null,
    "yomi" text not null,
    "sort" text
);

create table "tags" (
    "name" text primary key not null,
    "yomi" text not null,
    "sort" text
);

create table "albums" (
    "name" text primary key not null,
    "yomi" text not null,
    "sort" text
);

create table "cast" (
    "postId" text not null,
    "womanName" text not null,
    unique("postId", "womanName")
);

create table "work" (
    "postId" text not null,
    "artistName" text not null,
    unique("postId", "artistName")
);

create table "tagging" (
    "postId" text not null,
    "tagName" text not null,
    unique("postId", "tagName")
);

create table "binding" (
    "postId" text not null,
    "albumName" text not null,
    unique("postId", "albumName")
);

create table "aliases" (
    "name" text not null,
    "alias" text not null,
    unique("name", "alias")
);

create view v_cast as
    select
        "cast".postId,
        "women".name
    from "cast"
    inner join "women" on
        "cast".womanName = "women".name;

create view v_work as
    select
        work.postId,
        artists.name
    from work
    inner join artists on
        work.artistName = artists.name;

create view v_tagging as
    select
        tagging.postId,
        tags.name
    from tagging
    inner join tags on
        tagging.tagName = tags.name;

create view v_binding as
    select
        binding.postId,
        albums.name
    from binding
    inner join albums on
        binding.albumName = albums.name;

create table "images" (
    "postId" text not null,
    "index" integer not null,
    "imageId" text not null,
    unique("postId", "imageId")
);

create table "movies" (
    "postId" text not null,
    "url" text not null,
    unique("postId", "url")
);
