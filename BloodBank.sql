	/* SOURCE J/BloodBank.sql; */

CREATE DATABASE bancosangre;

SHOW DATABASES;

USE bancosangre;

CREATE TABLE tipoDoc (
	codigo1 TINYINT AUTO_INCREMENT PRIMARY KEY,
	tipoId CHAR(2))
	ENGINE=InnoDB;
	
INSERT INTO tipoDoc (codigo1, tipoId) VALUES
	(1, 'CC'),
	(2, 'CE'),
	(3, 'PP');

CREATE TABLE codSangre (
	codigo2 TINYINT AUTO_INCREMENT PRIMARY KEY,
	tipoSangre VARCHAR(2),
	rh CHAR(2))
	ENGINE=InnoDB;
	
INSERT INTO codSangre (codigo2, tipoSangre, rh) VALUES 
	(1, 'A', '+'),
	(2, 'A', '-'),
	(3, 'B', '+'),
	(4, 'B', '-'),
	(5, 'AB', '+'),
	(6, 'AB', '-'),
	(7, 'O', '+'),
	(8, 'O', '-');
	
CREATE TABLE codesSoli (
	codigo3 TINYINT AUTO_INCREMENT PRIMARY KEY,
	estado VARCHAR(2))
	ENGINE=InnoDB;
	
INSERT INTO codesSoli (codigo3, estado) VALUES 
	(1, 'Parcial'),
	(2, 'Pendiente'),
	(3, 'Entregada'),
	(4, 'Anulada');
	
CREATE TABLE codContact (
	numeroId VARCHAR(10) PRIMARY KEY,
	nombreContacto VARCHAR(256),
	telefonoContacto VARCHAR(16),
	direccionContacto VARCHAR(256),
	correoContacto VARCHAR(256),
	cargoContacto VARCHAR(64))
	ENGINE=InnoDB;
	
INSERT INTO codContact (numeroId, nombreContacto, telefonoContacto, direccionContacto, correoContacto, cargoContacto) VALUES 
	('1022220974', 'María Fernanda Rodríguez', '3201234567', 'Carrera 7 #40-50, Bogotá', 'mfrodriguez@gmail.com', 'Administradora'),
	('52566863', 'Carlos Andrés Gómez', '3157896543', 'Calle 116 #9-15, Bogotá', 'cagomez@gmail.com', 'Administrador'),
	('74306699', 'Laura Sofía Martínez', '3102345678', 'Carrera 15 #85-20, Bogotá', 'lsmartinez@gmail.com', 'Administradora'),
	('1045678234', 'Diego Alberto Pérez', '3189876543', 'Calle 100 #18-35, Bogotá', 'daperez@gmail.com', 'Administrador'),
	('1089234567', 'Andrea Catalina López', '3145678901', 'Avenida 19 #120-30, Bogotá', 'aclopez@gmail.com', 'Administradora'),
	('52345678', 'Juan Pablo Ramírez', '3176543210', 'Carrera 7 #32-16, Bogotá', 'jpramirez@gmail.com', 'Administrador'),
	('79823456', 'Valentina Díaz Castro', '3198765432', 'Calle 134 #7B-80, Bogotá', 'vdiazc@gmail.com', 'Administradora'),
	('1076543210', 'Santiago Moreno Villa', '3123456789', 'Avenida Caracas #45-12, Bogotá', 'smorenov@gmail.com', 'Administrador'),
	('1056789123', 'Daniela Vargas Ruiz', '3167890123', 'Calle 26 #51-20, Bogotá', 'dvargasr@gmail.com', 'Administradora'),
	('63912345', 'Miguel Ángel Torres', '3134567890', 'Carrera 30 #45-03, Bogotá', 'matorres@gmail.com', 'Administrador');

SHOW TABLES;

CREATE TABLE donante (
	numeroId VARCHAR(10) PRIMARY KEY,
    primerNombre VARCHAR(64),
    segundoNombre VARCHAR(64),
    primerApellido VARCHAR(64),
    segundoApellido VARCHAR(64),
    numeroTelefono VARCHAR(16),
    direccion VARCHAR(258),
    correo VARCHAR(258),
    donacionesRealizadas INT,
	codigo1 TINYINT NOT NULL,
	codigo2 TINYINT NOT NULL,
	KEY (codigo1),
	FOREIGN KEY (codigo1) REFERENCES tipoDoc (codigo1)
	ON DELETE CASCADE ON UPDATE CASCADE,
	KEY (codigo2),
	FOREIGN KEY (codigo2) REFERENCES codSangre (codigo2)
	ON DELETE CASCADE ON UPDATE CASCADE)
	ENGINE=InnoDB;
	
INSERT INTO donante (numeroId, primerNombre, segundoNombre, primerApellido, segundoApellido, numeroTelefono, direccion, correo, donacionesRealizadas, codigo1, codigo2) VALUES 
	('1023456789', 'Juan', 'Carlos', 'Martínez', 'Pérez', '3201234567', 'Carrera 15 #45-20, Bogotá', 'jcmartinez@gmail.com', 5, 1, 1),
	('52987654', 'María', 'Alejandra', 'González', 'Rojas', '3157896543', 'Calle 72 #10-35, Bogotá', 'magonzalez@gmail.com', 3, 1, 3),
	('1098765432', 'Luis', 'Fernando', 'Ramírez', 'Castro', '3102345678', 'Avenida 5 #28-15, Bogotá', 'lframirez@gmail.com', 8, 1, 7),
	('79456123', 'Ana', 'Sofía', 'López', 'Hernández', '3189876543', 'Carrera 8 #34-67, Bogotá', 'aslopez@gmail.com', 2, 1, 2),
	('1035678901', 'Carlos', 'Andrés', 'Rodríguez', 'Morales', '3145678901', 'Calle 127 #15-42, Bogotá', 'carodriguez@gmail.com', 12, 1, 5),
	('7123456', 'Valentina', '', 'Díaz', 'Vargas', '3176543210', 'Carrera 45 #23-78, Bogotá', 'vdiaz@gmail.com', 1, 2, 4),
	('1087654321', 'Diego', 'Alejandro', 'Torres', 'Ruiz', '3198765432', 'Calle 35 #18-90, Bogotá', 'datorres@gmail.com', 6, 1, 8),
	('AX987654', 'Andrew', 'Gustavo', 'Bolivar', 'Cerati', '3123456789', 'Avenida 30 #50-12, Bogotá', 'imgomez@gmail.com', 4, 3, 1),
	('63845621', 'Santiago', 'José', 'Moreno', 'Álvarez', '3167890123', 'Carrera 68 #40-25, Bogotá', 'sjmoreno@gmail.com', 9, 1, 6),
	('1012345678', 'Laura', 'Catalina', 'Castro', 'Jiménez', '3134567890', 'Calle 10 #5-33, Bogotá', 'lccastro@gmail.com', 7, 1, 3);

SHOW TABLES;

CREATE TABLE bolsadeSangre (
	numeroBolsa INT AUTO_INCREMENT PRIMARY KEY,  
    cantidad SMALLINT,
    fechaDonacion DATE,
    fechaCaducidad DATE,
	codigo2 TINYINT NOT NULL,
	numeroId VARCHAR(10) NOT NULL,
	KEY (codigo2),
	FOREIGN KEY (codigo2) REFERENCES codSangre (codigo2)
	ON DELETE CASCADE ON UPDATE CASCADE,
	KEY (numeroId),
	FOREIGN KEY (numeroId) REFERENCES donante (numeroId)
	ON DELETE CASCADE ON UPDATE CASCADE)
	ENGINE=InnoDB;
	
INSERT INTO bolsadeSangre (numeroBolsa, cantidad, fechaDonacion, fechaCaducidad, codigo2, numeroId) VALUES 
	(2152, 450, '2024-10-15', '2024-11-29', 1, '1023456789'),
	(5461, 500, '2024-09-20', '2024-11-04', 3, '52987654'),
	(9364, 470, '2024-11-01', '2024-12-16', 7, '1098765432'),
	(1146, 450, '2024-10-25', '2024-12-09', 2, '79456123'),
	(4863, 480, '2024-10-10', '2024-11-24', 5, '1035678901'),
	(7349, 450, '2024-11-05', '2024-12-20', 4, '7123456'),
	(1756, 500, '2024-09-30', '2024-11-14', 8, '1087654321'),
	(4637, 460, '2024-10-20', '2024-12-04', 1, 'AX987654'),
	(9125, 475, '2024-10-28', '2024-12-12', 6, '63845621'),
	(1654, 490, '2024-11-08', '2024-12-23', 3, '1012345678');

SHOW TABLES;

CREATE TABLE solicitud (
	numeroSolicitud INT AUTO_INCREMENT PRIMARY KEY,
    codigoHospital INT,
    numeroBolsas INT,
    fechaEmision DATE,
    fechaCaducidad DATE,
	codigo2 TINYINT NOT NULL,
	codigo3 TINYINT NOT NULL,
	KEY (codigo2),
	FOREIGN KEY (codigo2) REFERENCES codSangre (codigo2)
	ON DELETE CASCADE ON UPDATE CASCADE,
	KEY (codigo3),
	FOREIGN KEY (codigo3) REFERENCES codesSoli (codigo3)
	ON DELETE CASCADE ON UPDATE CASCADE)
	ENGINE=InnoDB;
	
INSERT INTO solicitud (numeroSolicitud, codigoHospital, numeroBolsas, fechaEmision, fechaCaducidad, codigo2, codigo3) VALUES 
	(1, 860001234, 5, '2024-10-15', '2024-11-29', 1, 2),
	(2, 860002345, 3, '2024-09-20', '2024-11-04', 3, 3),
	(3, 860003456, 8, '2024-11-01', '2024-12-16', 7, 1),
	(4, 860004567, 2, '2024-10-25', '2024-12-09', 2, 2),
	(5, 860005678, 10, '2024-10-10', '2024-11-24', 5, 3),
	(6, 860006789, 4, '2024-11-05', '2024-12-20', 4, 2),
	(7, 860007890, 6, '2024-09-30', '2024-11-14', 8, 1),
	(8, 860008901, 3, '2024-10-20', '2024-12-04', 1, 4),
	(9, 860009012, 7, '2024-10-28', '2024-12-12', 6, 2),
	(10, 860010123, 5, '2024-11-08', '2024-12-23', 3, 3);

SHOW TABLES;

CREATE TABLE formatodeEntrega (
	numeroEntrega INT AUTO_INCREMENT PRIMARY KEY,
    fechaEmision DATE,
    nombreHospital VARCHAR(64),
    nitHospital INT,
    numeroBolsas INT,
    fechaCaducidad DATE,
	numeroSolicitud INT NOT NULL,
	numeroBolsa INT NOT NULL,
	codigo3 TINYINT NOT NULL,
	KEY (numeroSolicitud),
	FOREIGN KEY (numeroSolicitud) REFERENCES solicitud (numeroSolicitud)
	ON DELETE CASCADE ON UPDATE CASCADE,
	KEY (numeroBolsa),
	FOREIGN KEY (numeroBolsa) REFERENCES bolsadeSangre (numeroBolsa)
	ON DELETE CASCADE ON UPDATE CASCADE,
	KEY (codigo3),
	FOREIGN KEY (codigo3) REFERENCES codesSoli (codigo3)
	ON DELETE CASCADE ON UPDATE CASCADE)
	ENGINE=InnoDB;
	
INSERT INTO formatodeEntrega (numeroEntrega, fechaEmision, nombreHospital, nitHospital, numeroBolsas, fechaCaducidad, numeroSolicitud, numeroBolsa, codigo3) VALUES 
	(1, '2024-10-15', 'Hospital San Ignacio', 860001234, 5, '2024-11-29', 1, 2152, 2),
	(2, '2024-09-20', 'Clínica del Country', 860002345, 3, '2024-11-04', 2, 5461, 3),
	(3, '2024-11-01', 'Fundación Santa Fe de Bogotá', 860003456, 8, '2024-12-16', 3, 9364, 1),
	(4, '2024-10-25', 'Hospital Universitario San Ignacio', 860004567, 2, '2024-12-09', 4, 1146, 2),
	(5, '2024-10-10', 'Clínica Marly', 860005678, 10, '2024-11-24', 5, 4863, 3),
	(6, '2024-11-05', 'Hospital Kennedy', 860006789, 4, '2024-12-20', 6, 7349, 2),
	(7, '2024-09-30', 'Clínica Reina Sofía', 860007890, 6, '2024-11-14', 7, 1756, 1),
	(8, '2024-10-20', 'Clínica Shaio', 860008901, 3, '2024-12-04', 8, 4637, 4),
	(9, '2024-10-28', 'Hospital Simón Bolívar', 860009012, 7, '2024-12-12', 9, 9125, 2),
	(10, '2024-11-08', 'Clínica Colombia', 860010123, 5, '2024-12-23', 10, 1654, 3);
	
SHOW TABLES;

CREATE TABLE hospital (
	nit INT AUTO_INCREMENT PRIMARY KEY,
    nombreHospital VARCHAR(64),
    direccion VARCHAR(258),
    telefonoHospital VARCHAR(16),
	numeroId VARCHAR(10) NOT NULL,
	KEY (numeroId),
	FOREIGN KEY (numeroId) REFERENCES codContact (numeroId)
	ON DELETE CASCADE ON UPDATE CASCADE)
	ENGINE=InnoDB;

INSERT INTO hospital (nit, nombreHospital, direccion, telefonoHospital, numeroId) VALUES 
	(860001234, 'Hospital San Ignacio', 'Carrera 7 #40-62, Bogotá', '6013208320', '1022220974'),
	(860002345, 'Clínica del Country', 'Carrera 16 #82-57, Bogotá', '6014429292', '52566863'),
	(860003456, 'Fundación Santa Fe de Bogotá', 'Calle 119 #7-75, Bogotá', '6013319090', '74306699'),
	(860004567, 'Hospital Universitario San Ignacio', 'Carrera 7 #40-62, Bogotá', '6013369090', '1045678234'),
	(860005678, 'Clínica Marly', 'Calle 50 #9-67, Bogotá', '6016030303', '1089234567'),
	(860006789, 'Hospital Kennedy', 'Avenida 1 #41D-04 Sur, Bogotá', '6016693636', '52345678'),
	(860007890, 'Clínica Reina Sofía', 'Calle 134 #7B-83, Bogotá', '6016347474', '79823456'),
	(860008901, 'Clínica Shaio', 'Diagonal 115A #70C-75, Bogotá', '6013135050', '1076543210'),
	(860009012, 'Hospital Simón Bolívar', 'Avenida Circunvalar #1-60, Bogotá', '6016333333', '1056789123'),
	(860010123, 'Clínica Colombia', 'Calle 23 #66-46, Bogotá', '6015776666', '63912345');
	
SHOW TABLES;

SHOW COLUMNS FROM donante;

SHOW COLUMNS FROM bolsadeSangre;

SHOW COLUMNS FROM solicitud;

SHOW COLUMNS FROM formatodeEntrega;

SHOW COLUMNS FROM hospital;

SELECT * FROM tipoDoc;

SELECT * FROM codSangre;

SELECT * FROM codesSoli;

SELECT * FROM codContact;

SELECT * FROM donante;

SELECT * FROM bolsadeSangre;

SELECT * FROM solicitud;

SELECT * FROM formatodeEntrega;

SELECT * FROM hospital;

SELECT * FROM tipoDoc JOIN donante
	ON (tipoDoc.codigo1 = donante.codigo1);
	
SELECT * FROM solicitud INNER JOIN formatodeEntrega
	ON (solicitud.numeroSolicitud = formatodeEntrega.numeroSolicitud);

SELECT * FROM codContact CROSS JOIN hospital
	ON (codContact.numeroId = hospital.numeroId);
	
SELECT * FROM donante WHERE codigo2='8';