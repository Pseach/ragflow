CREATE DATABASE IF NOT EXISTS rag_flow;
USE rag_flow;

-- auto-generated definition
create table user
(
    id               varchar(32)  not null
        primary key,
    create_time      bigint       null,
    create_date      datetime     null,
    update_time      bigint       null,
    update_date      datetime     null,
    access_token     varchar(255) null,
    nickname         varchar(100) not null,
    password         varchar(255) null,
    email            varchar(255) not null,
    avatar           text         null,
    language         varchar(32)  null,
    color_schema     varchar(32)  null,
    timezone         varchar(64)  null,
    last_login_time  datetime     null,
    is_authenticated varchar(1)   not null,
    is_active        varchar(1)   not null,
    is_anonymous     varchar(1)   not null,
    login_channel    varchar(255) null,
    status           varchar(1)   null,
    is_superuser     tinyint(1)   null
);

create index user_access_token
    on user (access_token);

create index user_color_schema
    on user (color_schema);

create index user_create_date
    on user (create_date);

create index user_create_time
    on user (create_time);

create index user_email
    on user (email);

create index user_is_active
    on user (is_active);

create index user_is_anonymous
    on user (is_anonymous);

create index user_is_authenticated
    on user (is_authenticated);

create index user_is_superuser
    on user (is_superuser);

create index user_language
    on user (language);

create index user_last_login_time
    on user (last_login_time);

create index user_login_channel
    on user (login_channel);

create index user_nickname
    on user (nickname);

create index user_password
    on user (password);

create index user_status
    on user (status);

create index user_timezone
    on user (timezone);

create index user_update_date
    on user (update_date);

create index user_update_time
    on user (update_time);

insert into user values ('7741a104fe9311efbfcb0242ac120006','1741709478712','2025-03-12 00:11:18','1741709480151','2025-03-12 00:11:20','782b1726fe9311ef9b400242ac120006','admin','scrypt:32768:8:1$5cVO7326zhnTvFLc$aa2433fbe33397309c2a4b0b67f78266ff399b9e13e779cf7085da68de2313893da50ece2f351e6eb1dcc7b88f09a1439e6be16d9880aea4226074681cf374f5','1749493452@qq.com','','Chinese','Bright','UTC+8	Asia/Shanghai','2025-03-12 00:11:18','1','1','0','password','1','0')