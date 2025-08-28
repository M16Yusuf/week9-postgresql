
create table promos(
	id serial primary key,
	name varchar(50) not null,
	discount int not null
);

create table products(
	id serial primary key,
	created_at timestamp default current_timestamp not null,
	updated_at timestamp,
	name varchar(100) not null,
	promo_id int references promos(id),
	price int not null
);


insert into promos(name, discount)
	values('Soft Opening', 10000),
		('Gajian', 5000),
		('Lebaran Haji', 15000);

insert into products(name, promo_id, price)
	values('Tea', null, 10000),
		('Coffee', 1, 12000),
		('Cake', 1, 22000),
		('Fried Rice', 2, 15000);

select * from promos;
select * from products;

select p.id, p.name, p.price, pr.name, pr.discount from 
	products as p inner join promos as pr on p.promo_id = pr.id;

select p.id, p.name, p.price, pr.name, pr.discount from 
	products as p left join promos as pr on p.promo_id = pr.id;

select p.id, p.name, p.price, pr.name, pr.discount from 
	products as p right join promos as pr on p.promo_id = pr.id;
	
select p.id, p.name, p.price, pr.name, pr.discount from 
	products as p full join promos as pr on p.promo_id = pr.id;


select min(products.price), products.name, promos.name from products
	join promos on products.promo_id = promos.id 
	group by promos.name;

