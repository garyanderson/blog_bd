create table users (
	id serial primary key,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(60) unique
);
create table posts (
	id serial primary key,
	creator_id int,
	title varchar(20),
	text text,
	foreign key (creator_id) references users(id) on delete cascade
);
create table likes (
	id serial primary key,
	user_id int,
	post_id int,
	foreign key (user_id) references users(id) on delete cascade,
	foreign key (post_id) references posts(id) on delete cascade	 
);

insert into users (first_name, last_name, email) values
('Gary', 'Botina', 'gary.dev@gmail.com'),
('Anderson', 'Santa', 'ander58@gmail.com'),
('Cesar', 'Millan', 'cesar14@hotmail.com'),
('Rick', 'Grimmes', 'Ri@hotmail.com'),
('Gustavo', 'Petro', 'petrosky@gmail.com');

insert into posts (creator_id, title, text) values
(1 , 'comida sana', 'mitos y sobre la comida y recetas sobre comida sana y buena alimentacion'),
(2 , 'vida fit', 'rutinas de eeercicio casra y en gym, para mantenerte en forma'),
(3 , 'programacion', 'tutoriales de distintos lenguajes de programacion desde el nivel mas basico al nivel mas avanzado'),
(4 , 'arte y diseño', 'como ser creativo y tencicas de colores y ponturas, gadges para mejorar la actividad'),
(5 , 'sport', 'guia de diferentes deportes informccion  resultado de equipos de cualquir pais'),
(2 , 'giua turistica', 'folletos e informacion e los diferntes puntos tuisticos en cualquier parte del mundo, viajes y cruceros'),
(1 , 'solo se que nada se', 'principios de filosofia y estudio de los grandes pensadores del mundo'),
(3 , 'ya que hijueputas', 'guia de aceptar las cosas como venga, ponerle el pecho a las malas situaciones');

insert into likes (user_id, post_id) values 
(1 ,2),
(2 ,1),
(4 ,5),
(5 ,4),
(3 ,3),
(5 ,2),
(4 ,3),
(4 ,2),
(2 ,3),
(1 ,1);

/*Trae todos los posts y la información del usuario del campo creator_id*/
select posts.*, users.* from posts join users on users.id = posts.creator_id;

/*Trae todos los posts, con la información de los usuarios que les dieron like.*/
select posts.*, users.* from likes 
join posts on posts.id = likes.post_id
join users on users.id = likes.user_id; 
