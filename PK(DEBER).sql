--duplicamos la tabla original
CREATE TABLE `detalle_pedido_nuevo` LIKE `detalle_pedido_1`;
INSERT INTO `detalle_pedido_nuevo` SELECT * FROM `detalle_pedido_1`;

--se agrega claves unicas
ALTER TABLE `detalle_pedido_nuevo`
ADD COLUMN `id_pedido` INT UNIQUE,
ADD COLUMN `id_producto` INT UNIQUE,
ADD COLUMN `id_linea` INT UNIQUE;

--se agrega indices unicos para la columnas
CREATE UNIQUE INDEX `uq_id_pedido` ON `detalle_pedido_nuevo` (`id_pedido`);
CREATE UNIQUE INDEX `uq_id_producto` ON `detalle_pedido_nuevo` (`id_producto`);
CREATE UNIQUE INDEX `uq_id_linea` ON `detalle_pedido_nuevo` (`id_linea`);