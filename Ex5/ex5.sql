create database football_team;
use football_team;

create table player(
	id int primary key auto_increment,
    name varchar(50) not null,
    birthday date,
    
    id_team int,
    foreign key (id_team) references team(id)
);

create table coach(
	id int primary key auto_increment,
    name varchar(50) not null,
    birthday date
);

create table team(
	id int primary key auto_increment,
    name varchar(50) not null,
    
    id_coach int,
    foreign key (id_coach) references coach(id)
);

create table positions(
	id int primary key auto_increment,
    player_positions varchar(10),
    
    id_player int,
    foreign key (id_player) references player(id)
);

create table matches(
	id int primary key auto_increment,
    `date` datetime,
    
    teamA int,
    teamB int,
    foreign key (teamA) references team(id),
    foreign key (teamB) references team(id),
    check (teamA != teamB)
);

create table coach_player(
	id_coach int,
    id_player int,
    primary key (id_coach, id_player),
    foreign key (id_coach) references coach(id),
    foreign key (id_player) references player(id)
);

create table matches_player(
	id_matches int,
    id_player int,
    primary key (id_matches, id_player),
    foreign key (id_matches) references matches(id),
    foreign key (id_player) references player(id)
);

create table matches_team(
	id_matches int,
    id_team int,
    primary key (id_matches, id_team),
    foreign key (id_matches) references matches(id),
    foreign key (id_team) references team(id)
);
