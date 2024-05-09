-- Creando BBDD
CREATE SCHEMA alke_wallet; 
USE alke_wallet;
-- Creando usuario
CREATE TABLE Usuario(
	User_ID INT PRIMARY KEY auto_increment,
	Nombre VARCHAR(200) NOT NULL,
    Correo VARCHAR(100) NOT NULL, 
    Contraseña VARCHAR(100) DEFAULT NULL, 
    Saldo INT NOT NULL,
    Fecha_creacion DATETIME NOT NULL
);
-- Creando Transaccion 
CREATE TABLE Transaccion(
	Transaction_ID INT PRIMARY KEY AUTO_INCREMENT,
    Sender_user_ID INT NOT NULL,
    Receiver_user_ID INT NOT NULL,
	Valor INT NOT NULL,
    Transaction_Date datetime not null,
    FOREIGN KEY (Sender_user_ID) REFERENCES Usuario(User_ID),
    FOREIGN KEY (Receiver_user_ID) REFERENCES Usuario(User_ID)
);
-- Creando Moneda 
CREATE TABLE Moneda(
	Currency_ID INT PRIMARY KEY AUTO_INCREMENT,
    Currency_Name VARCHAR(50) NOT NULL,
    Currency_Symbol VARCHAR(50) NOT NULL,
    FOREIGN KEY (Currency_ID) REFERENCES Transaccion(Transaction_ID)
);
-- Insertando datos 
INSERT INTO Usuario (User_ID, Nombre, Correo, Saldo, Fecha_creacion)
VALUES 
	(1, 'Martín Rivas','mmartinr34@correo.cl', 0, NOW()),
	(2, 'Elsa Patacky', 'Elsapat4@correo.cl', 0, NOW()),
	(3, 'Lucho Pepe', 'Luchinp3pp@correo.cl', 0, NOW());
	
INSERT INTO Transaccion (Sender_user_ID, Receiver_user_ID, Valor, Transaction_Date)
VALUES
	(1,2,2500,now()),
	(2,1,1500,now()),
	(3,1,1700,now());
/* 
Consultas
*/ 
SELECT Moneda.Currency_Name
FROM Moneda
INNER JOIN Usuario ON Moneda.Currency_ID = Usuario.Nombre;

SELECT * 
FROM Transaccion; 

SELECT Transaction_ID
FROM Transaccion 
WHERE Sender_user_ID = 1;

UPDATE Usuario
SET Correo = 'martinT1n@correo.cl'
WHERE User_ID = 1;

DELETE FROM Transaccion
WHERE Sender_user_ID = 3 OR Receiver_user_ID = 3;