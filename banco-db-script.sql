-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Banco
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Banco
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Banco` DEFAULT CHARACTER SET utf8 ;
USE `Banco` ;

-- -----------------------------------------------------
-- Table `Banco2`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Banco`.`Usuario` (
  `cedula` VARCHAR(15) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `tipo_usuario` INT NOT NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Banco2`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Banco`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `Usuario_cedula` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idCliente`),
  INDEX `fk_Cliente_Usuario1_idx` (`Usuario_cedula` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Usuario1`
    FOREIGN KEY (`Usuario_cedula`)
    REFERENCES `Banco`.`Usuario` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Banco2`.`Moneda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Banco`.`Moneda` (
  `idMoneda` INT NOT NULL,
  `tasa_de_interes` FLOAT NOT NULL,
  `tipo_de_cambio` FLOAT NULL,
  PRIMARY KEY (`idMoneda`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Banco2`.`Cuenta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Banco`.`Cuenta` (
  `num_Cuenta` VARCHAR(20) NOT NULL,
  `saldo` FLOAT NOT NULL,
  `limite_transferencia` INT(6) NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Moneda_idMoneda` INT NOT NULL,
  INDEX `fk_Cuenta_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  INDEX `fk_Cuenta_Moneda1_idx` (`Moneda_idMoneda` ASC) VISIBLE,
  PRIMARY KEY (`num_Cuenta`),
  CONSTRAINT `fk_Cuenta_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `Banco`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cuenta_Moneda1`
    FOREIGN KEY (`Moneda_idMoneda`)
    REFERENCES `Banco`.`Moneda` (`idMoneda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Banco2`.`Movimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Banco`.`Movimiento` (
  `mov_id` INT NOT NULL AUTO_INCREMENT,
  `Monto` FLOAT NOT NULL,
  `mov_fecha` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `numero_cuenta` VARCHAR(20) NOT NULL,
  `detalle` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`mov_id`),
  INDEX `fk_Movimiento_Cuenta1_idx` (`numero_cuenta` ASC) VISIBLE,
  CONSTRAINT `fk_Movimiento_Cuenta1`
    FOREIGN KEY (`numero_cuenta`)
    REFERENCES `Banco`.`Cuenta` (`num_Cuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Banco2`.`Vinculadas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Banco`.`Vinculadas` (
  `vin_id` VARCHAR(15) NOT NULL,
  `Num_Cuenta_vinculada` VARCHAR(20) NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `owner` TINYINT NOT NULL,
  PRIMARY KEY (`vin_id`),
  INDEX `fk_Vinculadas_Cuenta1_idx` (`Num_Cuenta_vinculada` ASC) VISIBLE,
  INDEX `fk_Vinculadas_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Vinculadas_Cuenta1`
    FOREIGN KEY (`Num_Cuenta_vinculada`)
    REFERENCES `Banco`.`Cuenta` (`num_Cuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vinculadas_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `Banco`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Banco2`.`Cajero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Banco`.`Cajero` (
  `idCajero` INT NOT NULL AUTO_INCREMENT,
  `Usuario_cedula` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idCajero`),
  INDEX `fk_Cajero_Usuario1_idx` (`Usuario_cedula` ASC) VISIBLE,
  CONSTRAINT `fk_Cajero_Usuario1`
    FOREIGN KEY (`Usuario_cedula`)
    REFERENCES `Banco`.`Usuario` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
