-- ejemplo Semana 2 
DROP DATABASE IF EXISTS Semana2 ;
CREATE database Semana2;
use Semana2;

CREATE TABLE IF NOT EXISTS Aeropuertos (
    Id_Aeropuerto INT AUTO_INCREMENT,
    Ciudad Varchar(25) NOT NULL,
    Nombre VARCHAR(25) NOT NULL,
    PRIMARY KEY (Id_Aeropuerto)  
); 
CREATE TABLE IF NOT EXISTS Avion (

    Id_Avion INT,
    Capacidad INT NOT NULL,
	Longitud INT NOT NULL,
	Asiento varchar(25) NOT NULL,
    PRIMARY KEY (Id_Avion)    
);
CREATE TABLE IF NOT EXISTS Ruta (
    Id_Ruta INT AUTO_INCREMENT,
    Ciudad Varchar(25) NOT NULL,
    Nombre VARCHAR(25) NOT NULL,
    PRIMARY KEY (Id_Ruta)    
);
CREATE TABLE IF NOT EXISTS Vuelo (
    Id_vuelo INT AUTO_INCREMENT,
    Fh_Inicio Datetime NOT NULL,
	Fh_Fin Datetime NOT NULL,
    PRIMARY KEY (Id_vuelo) 
);
CREATE TABLE IF NOT EXISTS Pasajero (
    Id_Pasajero INT AUTO_INCREMENT,
    Nombre_Pasajero varchar(25) NOT NULL,
    Apellido_Pasajero varchar(25) NOT NULL,
    Telefono_Pasajero varchar(25) NOT NULL,
    Direccion_Pasajero varchar(25) NOT NULL,
    PRIMARY KEY (Id_Pasajero)
);
CREATE TABLE IF NOT EXISTS Equipaje (
    Id_Equipaje INT AUTO_INCREMENT,
    Peso INT NOT NULL,
    PRIMARY KEY (Id_Equipaje)  
);
--

ALTER TABLE Ruta ADD Id_AeropuertoIda INT NOT NULL;
ALTER TABLE Ruta ADD CONSTRAINT Id_AeropuertoIda FOREIGN KEY (Id_AeropuertoIda) REFERENCES Aeropuertos(Id_Aeropuerto)
ON UPDATE RESTRICT ON DELETE CASCADE; 

ALTER TABLE Ruta ADD Id_AeropuertoReg INT NOT NULL;
ALTER TABLE Ruta ADD CONSTRAINT Id_AeropuertoReg FOREIGN KEY (Id_AeropuertoReg) REFERENCES Aeropuertos(Id_Aeropuerto)
ON UPDATE RESTRICT ON DELETE CASCADE;
--

ALTER TABLE Equipaje ADD Id_Pasajero INT NOT NULL;
ALTER TABLE Equipaje ADD CONSTRAINT Id_Pasajero FOREIGN KEY (Id_Pasajero) REFERENCES Pasajero(Id_Pasajero)
ON UPDATE RESTRICT ON DELETE CASCADE;

ALTER TABLE Equipaje ADD Id_Vuelo INT NOT NULL;
ALTER TABLE Equipaje ADD CONSTRAINT Id_Vuelo FOREIGN KEY (Id_Vuelo) REFERENCES Vuelo(Id_Vuelo)
ON UPDATE RESTRICT ON DELETE CASCADE;
--   

ALTER TABLE Pasajero ADD Id_Vuelo INT NOT NULL;
ALTER TABLE Pasajero ADD CONSTRAINT Id_Vuelo FOREIGN KEY (Id_Vuelo) REFERENCES Vuelo(Id_Vuelo)
ON UPDATE RESTRICT ON DELETE CASCADE; 

ALTER TABLE Pasajero ADD Id_Equipaje INT NOT NULL;
ALTER TABLE Pasajero ADD CONSTRAINT Id_Equipaje FOREIGN KEY (Id_Equipaje) REFERENCES Equipaje(Id_Equipaje)
ON UPDATE RESTRICT ON DELETE CASCADE;

--

ALTER TABLE Vuelo ADD Id_Avion INT NOT NULL;
ALTER TABLE Vuelo ADD CONSTRAINT Id_Avion FOREIGN KEY (Id_Avion) REFERENCES Avion(Id_Avion)
ON UPDATE RESTRICT ON DELETE CASCADE;      

ALTER TABLE Vuelo ADD Id_Ruta INT NOT NULL;
ALTER TABLE Vuelo ADD CONSTRAINT Id_Ruta FOREIGN KEY (Id_Ruta) REFERENCES Ruta(Id_Ruta)
ON UPDATE RESTRICT ON DELETE CASCADE; 
 
--







