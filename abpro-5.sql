CREATE DATABASE ABP5;
USE ABP5;

CREATE TABLE USUARIOS (
	ID_USUARIO INT NOT NULL PRIMARY KEY auto_increment,  
    NOMBRE VARCHAR(55),
    APELLIDO VARCHAR(55),
    PASS VARCHAR(55),
    ZONA_HORARIA VARCHAR(10) DEFAULT 'utc-3',
    GENERO VARCHAR(55),
    TELEFONO BIGINT    
);

-- DROP TABLE FECHA_HORA;
CREATE TABLE FECHA_HORA (
	ID_INGRESO INT NOT NULL PRIMARY KEY,
    ID_USUARIO INT NOT NULL auto_increment,
    FECHA_HORA DATETIME DEFAULT CURRENT_TIMESTAMP,
    foreign key (ID_USUARIO) references USUARIOS (ID_USUARIO)
);
-- drop table usuarios;

SELECT * FROM FECHA_HORA;

-- Creación registros.
INSERT INTO USUARIOS (NOMBRE, APELLIDO, PASS, GENERO, TELEFONO)
VALUES
('Juan', 'Pérez', '12345', 'M', 54115555555),
('María', 'González', '67890', 'F', 54225555555),
('Pedro', 'Sánchez', 'abcdef', 'M', 54335555555),
('Ana', 'Martínez', 'qwerty', 'F', 54445555555),
('Carlos', 'Fernández', 'zxcvbn', 'M', 4555555555),
('Laura', 'López', 'poiuyt', 'F', 54665555555),
('Miguel', 'Rodríguez', 'mnbvcx', 'M', 54775555555),
('Sofía', 'Torres', 'lkjhgf', 'F', 54885555555);

-- revisando inserciones (y lo de utc-3)
select * from usuarios;

-- Modifique el UTC por defecto de UTC-3 a UTC-2.
alter table usuarios modify zona_horaria varchar(10) default 'utc-2';

-- revisar que cambió utc-3 por defecto a utc-2 realizando nueva inserción.
INSERT INTO USUARIOS (NOMBRE, APELLIDO, PASS, GENERO, TELEFONO)
VALUES
('Juana', 'Pérez', '12343', 'F', 54115555333);
-- revisando zona_horaria nueva inserción
select * from usuarios;

-- Este no es por defecto, pero sirve en caso de que se quieran cambiar los registros ya existentes.
update usuarios set zona_horaria='utc-2'where zona_horaria='utc-3';
select * from usuarios;

-- Creación registros.
INSERT INTO FECHA_HORA (ID_INGRESO, ID_USUARIO)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8);

-- revisando inserciones
select * from fecha_hora;

/* Justificar cada tipo de dato utilizado 
INT(ID)
VARCHAR(NOMBRE, APELLIDO, PASS, GENERO, TELEFONO, CORREO)= varchar debido a que permite una cadena de caracteres.
VARCHAR(ZONA HORARIA DEFAULT='utc-3')= Era necesario asignar zona horaria a través de un varchar por defecto
FECHA HORA(DATETIME DEFAULT CURRENT_TIMESTAMP)= Con este tipo de dato se obtiene fecha y hora actual a través del sistema.
*/

-- Creen una nueva tabla llamada Contactos (id_contacto, id_usuario, numero de telefono, correo electronico).
CREATE TABLE CONTACTOS (
	ID_CONTACTO INT PRIMARY KEY NOT NULL,
    ID_USUARIO INT NOT NULL,
    TELEFONO BIGINT,
    CORREO VARCHAR(55)
);

select * from contactos;
drop table contactos;

-- Modificar la columna teléfono de contacto, para crear un vínculo entre la tabla Usuarios y la tabla Contactos.

ALTER TABLE contactos ADD CONSTRAINT fk_id_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario);

INSERT INTO CONTACTOS (ID_CONTACTO, ID_USUARIO, TELEFONO, CORREO)
VALUES (1, 1, 54115555555, 'usuario1@example.com');

INSERT INTO CONTACTOS (ID_CONTACTO, ID_USUARIO, TELEFONO, CORREO)
VALUES (2, 2, 54225555555, 'usuario2@example.com');




