create sequence hibernate_sequence start 1 increment 1;

create table list
(
    id        int8 not null,
    list_name varchar(255),
    author_id int8,
    primary key (id)
);
create table list_list_prod_items
(
    list_prod_id           int8 not null,
    list_prod_items_number int4 not null
);
create table list_item
(
    number            int4 not null,
    count_cur         int4 not null,
    count_rec         int4 not null,
    item_name         varchar(255),
    list_prod_name_id int8,
    primary key (number)
);
create table user_role
(
    user_id int8 not null,
    roles   varchar(255)
);
create table usr
(
    id       int8    not null,
    active   boolean not null,
    password varchar(255) not null,
    username varchar(255) not null,
    primary key (id)
);
alter table if exists list_list_prod_items
    add constraint list_prod_item_uq unique (list_prod_items_number);
alter table if exists list
    add constraint list_author_fk foreign key (author_id) references usr;
alter table if exists list_list_prod_items
    add constraint prod_items_number_fk foreign key (list_prod_items_number) references list_item;
alter table if exists list_list_prod_items
    add constraint prod_items_list_id_fk foreign key (list_prod_id) references list;
alter table if exists list_item
    add constraint list_item_id_fk foreign key (list_prod_name_id) references list;
alter table if exists user_role
    add constraint user_role_user_fk foreign key (user_id) references usr