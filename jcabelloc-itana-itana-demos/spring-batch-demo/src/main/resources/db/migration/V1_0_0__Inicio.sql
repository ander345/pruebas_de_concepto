
CREATE TABLE IF NOT EXISTS `movimiento_banco` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nro_operacion` VARCHAR(20) NOT NULL,
  `importe` DECIMAL(10,2) NOT NULL,
  `fecha_proceso` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;
