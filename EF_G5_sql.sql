-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema finaliweb_G5
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema finaliweb_G5
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `finaliweb_G5` DEFAULT CHARACTER SET utf8 ;
USE `finaliweb_G5` ;

-- -----------------------------------------------------
-- Table `finaliweb_G5`.`tipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finaliweb_G5`.`tipo` (
  `idTipo` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finaliweb_G5`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finaliweb_G5`.`usuarios` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `password` VARCHAR(256) NOT NULL,
  `idTipo` INT NOT NULL,
  PRIMARY KEY (`idUsuario`),
  INDEX `fk_usuarios_tipo_idx` (`idTipo` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_tipo`
    FOREIGN KEY (`idTipo`)
    REFERENCES `finaliweb_G5`.`tipo` (`idTipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finaliweb_G5`.`tiposervicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finaliweb_G5`.`tiposervicios` (
  `idTipoServicios` INT NOT NULL AUTO_INCREMENT,
  `nombreServicio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoServicios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finaliweb_G5`.`servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finaliweb_G5`.`servicios` (
  `idServicios` INT NOT NULL,
  `idTipoServicios` INT NOT NULL,
  `idUsuario` INT NOT NULL,
  `densidad` VARCHAR(45) NULL,
  `grosor` VARCHAR(45) NULL,
  `altura` VARCHAR(45) NULL,
  `material` VARCHAR(45) NULL,
  `url` VARCHAR(45) NULL,
  `autoservicio` VARCHAR(45) NULL,
  `color` VARCHAR(45) NULL,
  `material` VARCHAR(45) NULL,
  `ancho` VARCHAR(45) NULL,
  `largo` VARCHAR(45) NULL,
  `resolucion` VARCHAR(45) NULL,
  `borradologico` TINYINT NOT NULL,
  `fecha` DATE NOT NULL,
  PRIMARY KEY (`idServicios`),
  INDEX `fk_servicios_tiposervicios1_idx` (`idTipoServicios` ASC) VISIBLE,
  INDEX `fk_servicios_usuarios1_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_servicios_tiposervicios1`
    FOREIGN KEY (`idTipoServicios`)
    REFERENCES `finaliweb_G5`.`tiposervicios` (`idTipoServicios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicios_usuarios1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `finaliweb_G5`.`usuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
