create table users
(
    id       bigserial,
    username varchar(30) not null unique,
    password varchar(80) not null,
    email    varchar(50) unique,
    primary key (id)
);

create table roles
(
    id   serial,
    name varchar(50) not null,
    primary key (id)
);

create table privileges
(
    id   serial,
    name varchar(50) not null,
    primary key (id)
);

CREATE TABLE users_roles
(
    user_id bigint not null,
    role_id int    not null,
    primary key (user_id, role_id),
    foreign key (user_id) references users (id),
    foreign key (role_id) references roles (id)
);

CREATE TABLE roles_privileges
(
    role_id int not null,
    privilege_id int    not null,
    primary key (role_id, privilege_id),
    foreign key (role_id) references roles (id),
    foreign key (privilege_id) references privileges (id)
);




insert into roles (name)
values ('ROLE_USER'),
       ('ROLE_ADMIN'),
       ('ROLE_SUPERADMIN');

insert into privileges (name)
values ('READ'),
       ('EDIT'),
       ('DELETE');

insert into users (username, password, email)
values
    ('user1', '$2a$04$Fx/SX9.BAvtPlMyIIqqFx.hLY2Xp8nnhpzvEEVINvVpwIPbA3v/.i', 'user1@gmail.com'),
    ('user2', '$2a$15$Kx7V7zB6yPJfzTIfFb.ug.WHHBdajwhSoZSBUtz1cBOmm0B0btIfe', 'user2@gmail.com'),
    ('user3', '$2a$15$C6IZ7Nu7Bo6VkbWy2xdLE.2ZrFl/Izh22B9vbUcf00mXxeNvNbcKO', 'user3@gmail.com');

insert into users_roles (user_id, role_id)
values
    (1, 1),
    (2, 2),
    (3, 3);

insert into roles_privileges (role_id, privilege_id)
values
    (1, 1),
    (2, 1),
    (2, 2),
    (3, 1),
    (3, 2),
    (3, 3);