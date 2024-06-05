-- o	Buscar la forma de como implementar, mediante código, crear un campo autonumérico que sea PK
--	Al crear un campo autonumérico en una tabla, este se llene con el numero correspondiente a los registros.

--Agregar el nuevo campo id_detalle como clave primaria autonumérica a la tabla temporal:

ALTER TABLE detalle_pedido_11
DROP PRIMARY KEY, 
ADD COLUMN id_detalle INT AUTO_INCREMENT PRIMARY KEY; --  clave primaria

--verificamos que tiene la clave primaria

DESCRIBE detalle_pedido_11;

