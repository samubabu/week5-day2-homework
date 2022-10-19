create table customer(
	customer_id serial primary key,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(50),
	address varchar(50),
	loyalty_member boolean);

alter table customer
add column payment_onfile boolean;




create table tickets
	(ticket_id serial primary key,
	purchase_date timestamp default current_timestamp,
	price numeric (3,2),
	movie_id integer not null,
	--foreign key (movie_id) references movie (movie_id)
	movie_hall integer,
	--foreign key (movie_hall) references movie(movie_hall)
	movie_time integer);

create table movie(
	movie_id serial primary key,
	movie_name varchar (50),
	showtime timestamp(20),
	movie_hall integer);

alter table tickets
add foreign key (movie_id) references movie (movie_id),
add foreign key (movie_hall) references movie(movie_hall);



	