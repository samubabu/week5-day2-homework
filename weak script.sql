--DDL(DATA DEFINITION LANGUAGE)
--syntax
--create TABLE table_name(col_name DATA_TYPE, ...)
--table_name - is usually all lowercase in singular form

--CREATE CUSTOMER TABLE
create table customer(
--column_name DATATYPE <CONSTRAINTS>,
customer_id SERIAL primary key, --primary key specifies both unique  and not null 
first_name varchar(50) not null, --not null means that this column cannnot be empty 
last_name varchar(50) not null,
email varchar(50),
address varchar(100),
loyalty_member boolean default false);


select   *
from customer



alter table customer
add column username varchar(20);
--change datatype of the column
--change email datatype to VARCHAR(30) from VARCHAR(50)
--alter TABLE table_name ALTER Column col_name TYPE NEW_DATATYPE
alter table customer
alter column email type varchar(30);

--change the name of a column
alter table customer
rename column email to email_address;

select *
from customer;


--Create Ordertable with a foregin key to Customer table

create table order_(
	order_id SERIAL primary key,
	order_date timestamp default current_timestamp,
	date_shipped timestamp,
	customer_id integer not null,
	--Syntax :FOREIGN KEY(column_in_domestic_table) REFERENCES foreign_table_name()
	foreign key(customer_id) references customer(customer_id)
);




SELECT   *
FROM CUSTOMER

--Create Order-product Join table (join table between the order and product table)

create table order_product(
	order_id integer not null,
	foreign key(order_id) references order_(order_id),
	products_id integer not null);
--foreign key(product_id) references products(products_id) --CANNOT REFERENCE A TABLE THAT DOES NOT EXIST	


create table product(
product_id serial primary key,
prod_name varchar(25),
description varchar(200),
price numeric(5,2),
quantity integer
);

--atler order_product table to add to the foreign key
alter table order_product
add foreign key(product_id) references product(product_id);





