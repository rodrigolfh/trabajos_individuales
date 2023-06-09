-- Antes de comenzar, recordemos ciertos conceptos.
-- - ¿Qué es una transacción en MySql? Definalo y escriba un ejemplo.
--    	Es una secuencia de queries que en conjunto ejecutan una tarea o unidad de trabajo, a la
--    	cual luego se le hace 'commit' para confirmarla o 'rollback' para deshacerla si alguno
--    	de sus queries no fue exitoso.

--    		EJ: START TRANSACTION;
-- 			UPDATE tabla SET numero = 11 WHERE id = 1;
--  		COMMIT;		
 
-- - ¿Qué beneficios tiene para la consistencia de los datos, ejecutar transacciones?
-- 		Ejecutar transacciones permita la consistencia al asegurar que sólo se escriban
-- 		en la base datos válidos y que sigan todas las reglas y restricciones definidas,
-- 		y si algo no se cumple la base vuelve a su estado previo a través del ROLLBACK. 

-- - ¿Qué propiedades tienen las transacciones? Definirlas.
-- 		Sus propiedades se agrupan en el acrónimo ACID, que vine de: Atomicidad, Consistencia,
-- 		Aislamiento y Durabilidad. A continuación las defino:

-- 			Atomicidad: Implica que múltiples operaciones pueden ser agrupadas en una sola
-- 			entidad lógica, de forma tal que al observar la base de datos esta refleja
-- 			ya sea todos los cambios o ninguno.

-- 			Consistencia: Se refiere a que incluso al exixtir una caída o falla, el sistema
-- 			se recupera al echar mano a su buffer, que es una copia redundantes de la base 
--          para poder seguir funcionando y 'ser consistente' en todo momento. Esto sucede 
-- 			princialmente con InnoDB.

-- 			Aislamiento: Es cuando cada transacción actúa de manera aislada de otra, y no
-- 			pueden acceder a los cambios sin commit de otras transacciones.

-- 			Durabilidad: Una vez que un commit se realiza con éxito, los cambios efectuados
-- 			por ese commit están seguros de apagones, caídas de sistema o cualquier otro
-- 			problema potencial; todo esto gracias a que la información se almacena con algún
-- 			grado de redundancia cuando es escrita.
       
        
-- - Qué utilidades tienen las sentencias START TRANSACTION, COMMIT y ROLLBACK.
-- 		START TRANSACTION: Comienza una nueva transacción.
-- 		COMMIT: Realiza los cambios de la transacción, haciéndolos permanentes.
-- 		ROLLBACK: Deshace los cambios de la transacción.

-- - En términos de sintaxis ¿Cuándo finaliza una transacción?
-- 		La transacción termina cuando se realiza un COMMIT o un ROLLBACK.

-- Parte 1: Crear entorno de trabajo

-- - Crear una base de datos
CREATE DATABASE individual_5_3_2;

-- - Crear un usuario con todos los privilegios para trabajar con la base de datos recién creada.
CREATE USER 'user_indi_5_3_2'@'localhost' IDENTIFIED BY 'contraseña';

-- Parte 2: Crear tablas.
-- - Crea dos tablas en la base de datos. La primera almacena todos los usuarios sin una 
-- participación activa en tu aplicación y la segunda agrupa a los usuarios que son 
-- considerados especiales, debido a su alta participación en tu aplicación web.
-- Ambas tablas deben tener la siguiente información de cada usuario: id, nombre, apellido, 
-- correo electrónico telefono y género.
USE individual_5_3_2;
CREATE TABLE colaboradores_frecuentes(
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(20),
apellido VARCHAR(40),
correo VARCHAR(100),
teléfono INT,
género VARCHAR(15)
);

CREATE TABLE colaboradores_esporádicos(
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(20),
apellido VARCHAR(40),
correo VARCHAR(100),
teléfono INT,
género VARCHAR(15)
);

-- - La primera tabla debe tener 5 usuarios en un comienzo.
INSERT INTO colaboradores_frecuentes (nombre, apellido, correo, teléfono, género) VALUES
('Diego', 'González', 'diego.gonzalez@example.com', 912345678, 'Masculino'),
('Valentina', 'Rojas', 'valentina.rojas@example.com', 945678912, 'Femenino'),
('Matías', 'Silva', 'matias.silva@example.com', 978123456, 'Masculino'),
('Isabella', 'Torres', 'isabella.torres@example.com', 987654321, 'Femenino'),
('Joaquín', 'López', 'joaquin.lopez@example.com', 956781234, 'Masculino');

-- - La segunda tabla no debe tener usuarios.
-- 		OK

-- - Transfiera tres usuarios desde la primera tabla a la segunda.
-- - Anule la transferencia del tercer usuario.

-- DOS PRIMERO
START TRANSACTION;
INSERT INTO colaboradores_esporádicos
(SELECT * FROM colaboradores_frecuentes LIMIT 2);
DELETE FROM colaboradores_frecuentes WHERE id > 0 LIMIT 2;
COMMIT WORK;

-- ANULACIÓN
START TRANSACTION;
INSERT INTO colaboradores_esporádicos
(SELECT * FROM colaboradores_frecuentes LIMIT 1);
DELETE FROM colaboradores_frecuentes WHERE id > 0 LIMIT 1;
ROLLBACK WORK;


-- SELECTS PARA REVISAR
SELECT * FROM colaboradores_esporádicos;
SELECT * FROM colaboradores_frecuentes;

