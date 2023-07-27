-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema DROGUERIA_BD
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DROGUERIA_BD
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DROGUERIA_BD` DEFAULT CHARACTER SET utf8 ;
USE `DROGUERIA_BD` ;

-- -----------------------------------------------------
-- Table `DROGUERIA_BD`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DROGUERIA_BD`.`persona` (
  `idpersona` INT NOT NULL,
  `identificacion` VARCHAR(45) NOT NULL,
  `compania` VARCHAR(45) NULL,
  `nombres` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NULL,
  `ciudad` VARCHAR(45) NULL,
  `codigo_postal` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  PRIMARY KEY (`idpersona`),
  UNIQUE INDEX `identificacion_UNIQUE` (`identificacion` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DROGUERIA_BD`.`compania`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DROGUERIA_BD`.`compania` (
  `idcompania` SMALLINT NOT NULL,
  `nt` VARCHAR(45) NOT NULL,
  `compania` INT NOT NULL,
  PRIMARY KEY (`idcompania`),
  UNIQUE INDEX `nt_UNIQUE` (`nt` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DROGUERIA_BD`.`Termino`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DROGUERIA_BD`.`Termino` (
  `idTermino` TINYINT NOT NULL,
  `termino` VARCHAR(45) NULL,
  PRIMARY KEY (`idTermino`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DROGUERIA_BD`.`factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DROGUERIA_BD`.`factura` (
  `idfactura` BIGINT NOT NULL AUTO_INCREMENT,
  `id_persona` INT NOT NULL,
  `id_compania` SMALLINT NULL,
  `id_termino` TINYINT NOT NULL,
  `fecha` DATE NOT NULL,
  `hora` TIME NOT NULL,
  PRIMARY KEY (`idfactura`),
  INDEX `id_persona_idx` (`id_persona` ASC) VISIBLE,
  INDEX `id_compania_idx` (`id_compania` ASC) VISIBLE,
  INDEX `id_termino_idx` (`id_termino` ASC) VISIBLE,
  CONSTRAINT `id_persona`
    FOREIGN KEY (`id_persona`)
    REFERENCES `DROGUERIA_BD`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_compania`
    FOREIGN KEY (`id_compania`)
    REFERENCES `DROGUERIA_BD`.`compania` (`idcompania`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_termino`
    FOREIGN KEY (`id_termino`)
    REFERENCES `DROGUERIA_BD`.`Termino` (`idTermino`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DROGUERIA_BD`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DROGUERIA_BD`.`categoria` (
  `id_categoria` SMALLINT NOT NULL,
  `categoria` VARCHAR(45) NULL,
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DROGUERIA_BD`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DROGUERIA_BD`.`producto` (
  `id_producto` INT NOT NULL,
  `id_categoria` SMALLINT NOT NULL,
  `producto` VARCHAR(45) NOT NULL,
  `existencia` VARCHAR(45) NOT NULL,
  `valor_nitario_venta` FLOAT NOT NULL,
  `valor_unitario_compra` FLOAT NOT NULL,
  PRIMARY KEY (`id_producto`),
  INDEX `id_categoria_idx` (`id_categoria` ASC) VISIBLE,
  CONSTRAINT `id_categoria`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `DROGUERIA_BD`.`categoria` (`id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DROGUERIA_BD`.`factura_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DROGUERIA_BD`.`factura_producto` (
  `factura_idfactura` BIGINT NOT NULL,
  `producto_id_producto` INT NOT NULL,
  `valor_unitario` VARCHAR(45) NULL,
  `cantidad` SMALLINT NULL,
  `factura_has_productocol` VARCHAR(45) NULL,
  PRIMARY KEY (`factura_idfactura`, `producto_id_producto`),
  INDEX `fk_factura_has_producto_producto1_idx` (`producto_id_producto` ASC) VISIBLE,
  INDEX `fk_factura_has_producto_factura1_idx` (`factura_idfactura` ASC) VISIBLE,
  CONSTRAINT `fk_factura_has_producto_factura1`
    FOREIGN KEY (`factura_idfactura`)
    REFERENCES `DROGUERIA_BD`.`factura` (`idfactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_factura_has_producto_producto1`
    FOREIGN KEY (`producto_id_producto`)
    REFERENCES `DROGUERIA_BD`.`producto` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
