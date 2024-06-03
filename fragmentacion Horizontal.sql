//FRAGMENTACIÓN HORIZONTAL
FRAGMENTACION HORIZONTAL --------------------------------------------------
1
CREAR TABLA 

CREATE TABLE alumno_horizontal (`codigo` int(5) NOT NULL,
  `cedula` varchar(15) DEFAULT NULL,
  `nombres` varchar(40) DEFAULT NULL,
  `apellidos` varchar(40) DEFAULT NULL,
  `direccion` varchar(40) DEFAULT NULL,
  `telefono1` varchar(15) DEFAULT NULL,
  `telefono2` varchar(15) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `provincia` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `fechanacimiento` date DEFAULT NULL,
  `redsocial` varchar(15) DEFAULT NULL,
  `carrera` varchar(40) DEFAULT NULL,
  `extension` varchar(15) DEFAULT NULL,
  `aniograduacion` int(4) DEFAULT NULL,
  `lugardetrabajo` varchar(40) DEFAULT NULL,
  `direcciontrabajo` varchar(40) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `cargo` varchar(40) DEFAULT NULL,
  `Empresapropia` varchar(5) DEFAULT NULL,
  `trabajaensuareadeestudio` varchar(5) DEFAULT NULL,
  `tiempodetrabajo` int(2) DEFAULT NULL,
  `s1` text DEFAULT NULL,
  `s2` text DEFAULT NULL,
  `s3` text DEFAULT NULL,
  `s4` text DEFAULT NULL,
  `s5` text DEFAULT NULL,
  `s6` text DEFAULT NULL,
  `s7` text DEFAULT NULL,
  `s8` text DEFAULT NULL,
  `s9` text DEFAULT NULL,
  `s10` text DEFAULT NULL,
  `s11` text DEFAULT NULL,
  `s12` datetime DEFAULT NULL,
  `s13` text DEFAULT NULL,
  `s14` text DEFAULT NULL,
  `s15` text DEFAULT NULL,
  `s16` text DEFAULT NULL,
  `s17` text DEFAULT NULL,
  `s18` text DEFAULT NULL,
  `s19` text DEFAULT NULL,
  `s20` text DEFAULT NULL,
  `s21` text DEFAULT NULL,
  `s22` text DEFAULT NULL,
  `s23` text DEFAULT NULL,
  `s24` text DEFAULT NULL,
  `s25` text DEFAULT NULL,
  `s26` text DEFAULT NULL,
  `s27` text DEFAULT NULL,
  `s28` text DEFAULT NULL,
  `s29` text DEFAULT NULL,
  `s30` text DEFAULT NULL,
  `s31` text DEFAULT NULL,
  `s32` text DEFAULT NULL,
  `s33` text DEFAULT NULL,
  `fechagrado` date DEFAULT NULL,
  `s36` text DEFAULT NULL,
  `s37` text DEFAULT NULL,
  `s38` text DEFAULT NULL,
  `s39` text DEFAULT NULL,
  `s40` text DEFAULT NULL,
  `s41` text DEFAULT NULL,
  `s42` text DEFAULT NULL,
  `s43` text DEFAULT NULL,
  `s44` text DEFAULT NULL,
  `s45` text DEFAULT NULL,
  `s46` text DEFAULT NULL,
  `s47` text DEFAULT NULL,
  `area1` varchar(50) DEFAULT NULL,
  `area2` varchar(50) DEFAULT NULL,
  `s48` text DEFAULT NULL,
  `s45_1` text DEFAULT NULL,
  `s46_1` text DEFAULT NULL,
  `s47_1` text DEFAULT NULL,
  `s48_1` text DEFAULT NULL,
  `s49_1` text DEFAULT NULL,
  `s50_1` text DEFAULT NULL,
  `valida` varchar(2) DEFAULT NULL,
  `validac` varchar(2) DEFAULT NULL,
  `validad` varchar(2) DEFAULT NULL,
  `validas` varchar(2) DEFAULT NULL,
  `validat` varchar(2) DEFAULT NULL,
  `ins_even` varchar(2) DEFAULT NULL,
  `par_even` varchar(2) DEFAULT NULL
)  

Insertar los datos de la tabla original en la nueva tabla particionada:


INSERT INTO alumno_horizontal
SELECT * FROM alumno;
******************************************************************************

------------------------------------------------------------
CREAR OTRAS DOS TABLAS PARA SEPARARLAS EN FRAGMENTOS MAS PEQUEÑAS

CREATE TABLE alumno_p1 LIKE alumno;
CREATE TABLE alumno_p2 LIKE alumno;
----------------------------------------------

SE ESTABLE CUAL VA SER EL PARAMETRO PARA DIVIDIR LA TABLA TRATANDO QUE SEA UN DATO IMPORTANTE DE EXCLUSION 
  EN ESTE CASO LA PROVINCIA
  QUITO 
  AMBATO
SE CALCULA EL VALOR INTERMEDIO ATRA VEZ DEL ID O CODIGO PARA PODER DIVIDIR LA TABLA PRINCIPAL ALUMNO_HORIZONTAL

SELECT @mitad_codigo := (
    SELECT ROUND(MAX(codigo) - MIN(codigo)) / 2 + MIN(codigo)
    FROM alumno
);
---------------------------------------------------
Se Inserta los registros en las tablas correspondientes según el valor del campo codigo:

-- Seleccionar e insertar en alumno_p1 basándose en la ciudad (por ejemplo, Quito)
INSERT INTO alumno_p1
SELECT * FROM alumno
WHERE ciudad = 'Quito';

-- Seleccionar e insertar en alumno_p2 basándose en la ciudad (por ejemplo, Ambato)
INSERT INTO alumno_p2
SELECT * FROM alumno
WHERE ciudad = 'Ambato';

****************************
ejemplo con datos masivos 

INSERT INTO alumno_p1
SELECT * FROM alumno
WHERE codigo < 196599;

INSERT INTO alumno_p2
SELECT * FROM alumno
WHERE codigo >=196600;
-----------------------------------------
SE VERIFICA EL NUMERO DE REGISTRO EN CADA TABLA:

SELECT COUNT(*) FROM alumno_p1;
SELECT COUNT(*) FROM alumno_p2;




--datos insertados
-- Insertar los datos en la tabla alumno_p1 y alumno_p2 según la ciudad
--INSERT INTO alumno_p1 ( cedula, nombres, apellidos, direccion, telefono1, telefono2, ciudad, provincia, pais, email, fechanacimiento, redsocial, carrera, extension, aniograduacion, lugardetrabajo, direcciontrabajo, telefono, cargo, Empresapropia, trabajaensuareadeestudio, tiempodetrabajo)
--VALUES
--('1234567890', 'Pedro', 'Ramírez', 'Av. Los Shyris 123', '0998765432', '0987654321', 'Quito', 'Pichincha', 'Ecuador', 'pedro.ramirez@example.com', '1991-02-14', 'LinkedIn', 'Medicina', 'Matriz', 2014, 'Hospital XYZ', 'Av. Naciones Unidas 456', '0223456789', 'Doctor', 'NO', 'SI', 6),
--( '2345678901', 'Lucía', 'Martínez', 'Calle Amazonas 789', '0991234567', '0976543210', 'Quito', 'Pichincha', 'Ecuador', 'lucia.martinez@example.com', '1993-06-18', 'Facebook', 'Psicología', 'Matriz', 2017, 'Centro Psicoterapéutico ABC', 'Av. República 123', '0223456789', 'Psicóloga', 'NO', 'SI', 3),
--( '3456789012', 'Carlos', 'López', 'Av. Los Andes 456', '0987654321', '0998765432', 'Ambato', 'Tungurahua', 'Ecuador', 'carlos.lopez@example.com', '1987-09-10', 'Twitter', 'Ingeniería Mecánica', 'Ambato', 2013, 'Fábrica Industrial ABC', 'Calle Bolívar 456', '0323456789', 'Ingeniero Mecánico', 'SI', 'SI', 7),
--( '4567890123', 'Ana', 'Vásquez', 'Calle Oriente 789', '0987123456', '0999876543', 'Ambato', 'Tungurahua', 'Ecuador', 'ana.vasquez@example.com', '1992-04-25', 'Instagram', 'Arquitectura', 'Ambato', 2016, 'Estudio de Arquitectura XYZ', 'Av. Cevallos 123', '0323456789', 'Arquitecta', 'NO', 'SI', 4);

