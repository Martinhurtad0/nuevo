create database empresa;
show databases;
use empresa;
create table autos (
id int,
marca varchar(255),
modelo varchar(255),
primary key (id)

);
insert into autos (marca, modelo ) VALUES ('chevrolet', 'aveo16');
alter table autos MODIFY COLUMN id int auto_increment;

 show create table autos;
 CREATE TABLE `autos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `marca` varchar(255) DEFAULT NULL,
  `modelo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;

insert into autos (marca, modelo) values ( 'porshe', 'turbo');
insert into autos (marca, modelo) values ( 'renault', 'sandero');
select * from autos;
