-- Implementasi dari ERD sistem perpustakan ke dalam bentuk SQL
-- memberikan tipedata, panjang data, dan relasi yang tepat
-- membuat minimal 10 data dummy untuk setiap tabel yang dibuat


create table category(
	id serial primary key,
	name varchar(25) not null
);

create table bookshelf(
	id serial primary key,
	code varchar(15) not null,
	category_id int references public.category(id)
);

create table books(
	id serial primary key,
	title varchar(50) not null,
	author varchar(25),
	bookshelf_id int references public.bookshelf(id)
);

create table librarians(
	id serial primary key,
	name varchar(25) not null
);

create table members(
	id serial primary key,
	name varchar(25) not null
);

create table borrowing(
	id serial primary key,
	book_id int references public.books(id),
	member_id int references public.members(id),
	librarian_id int references public.librarians(id),
	created_at timestamp default current_timestamp not null
);

insert into category(name)
	values('saince'),('novel'),('child book'),('history'),('math'),
	('social'),('comic'),('alchemis'),('religion'),('programming');

insert into bookshelf(code, category_id)
	values('A01', 2),('A02', 7),('A03', 3),('B01', 1),('B02', 4),
	('B03', 5),('B04', 6),('B05', 8),('P01', 10),('P02',10);

insert into members(name)
	values('Raka Prasetya'),('Dewi Lestari Putri'),('Bagas Wicaksono'),
	('Intan Maharani'), ('Fajar Ramadhan'), ('Sinta Ayuningtyas'), 
	('Aditya Nugroho'), ('Nabila Khairunnisa'), ('Rizky Ananta'),('Yuniar Salsabila');

insert into librarians(name)
	values('Dimas Ardiansyah'),('Melati Kusuma Wardhani'),('Galih Permadi'),
	('Sekar Larasati'),('Andhika Pramudya'),('Tiara Cahyani'),('Reza Firmansyah'),
	('Putri Anggraini'),('Yoga Saputra'),('Aulia Rahmadani');


ALTER TABLE books ALTER COLUMN author TYPE VARCHAR(50);
ALTER TABLE books ALTER COLUMN title TYPE VARCHAR(100);

insert into books(title, author, bookshelf_id)
	values('The Magic of Reality','Richard Dawkins', 4),
	('Cantik Itu Luka','Eka Kurniawan', 1),
	('The Very Hungry Caterpillar', 'Eric Carle', 3),
	('Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', 5),
	('The Man Who Knew Infinity', 'Robert Kanigel', 6),
	('Ilmu Sosial Budaya Dasar','Siti Aisyah', 7),
	('Fullmetal Alchemist', 'Hiromu Arakawa', 2),
	('he Alchemist (Sang Alkemis)', 'Paulo Coelho', 8),
	('The Pragmatic Programmer', 'Andrew Hunt & David Thomas', 9 ),
	('Clean Code: A Handbook of Agile Software Craftsmanship', 'Robert C. Martin', 10);


insert into borrowing(book_id, member_id, librarian_id)
	values(4, 5, 6),(1, 2, 3),(8, 4, 5),(3, 2, 4),(7, 5, 4),
	(9, 10, 10), (8, 4, 2), (6, 4, 10), (3, 10, 1), (10, 4, 1);


select * from category;
select * from bookshelf;
select * from members;
select * from librarians;
select * from books;
select * from borrowing;
