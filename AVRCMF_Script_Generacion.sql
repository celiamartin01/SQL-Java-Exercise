-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema AVRCMF
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema AVRCMF
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `AVRCMF` DEFAULT CHARACTER SET utf8 ;
USE `AVRCMF` ;

-- -----------------------------------------------------
-- Table `AVRCMF`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AVRCMF`.`Departamento` (
  `idDepartamento` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDepartamento`),
  UNIQUE INDEX `idDepartamentos_UNIQUE` (`idDepartamento` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AVRCMF`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AVRCMF`.`Empleado` (
  `idEmpleado` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellidos` VARCHAR(45) NOT NULL,
  `Telefono` INT NULL,
  `Departamento_idDepartamento` INT NOT NULL,
  PRIMARY KEY (`idEmpleado`),
  INDEX `fk_Empleado_Departamento1_idx` (`Departamento_idDepartamento` ASC) VISIBLE,
  CONSTRAINT `fk_Empleado_Departamento1`
    FOREIGN KEY (`Departamento_idDepartamento`)
    REFERENCES `AVRCMF`.`Departamento` (`idDepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AVRCMF`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AVRCMF`.`Cliente` (
  `idCliente` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AVRCMF`.`Proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AVRCMF`.`Proyecto` (
  `idProyecto` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Lenguaje` VARCHAR(45) NULL,
  `Departamento_idDepartamento` INT NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idProyecto`),
  INDEX `fk_Proyecto_Departamento1_idx` (`Departamento_idDepartamento` ASC) VISIBLE,
  INDEX `fk_Proyecto_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Proyecto_Departamento1`
    FOREIGN KEY (`Departamento_idDepartamento`)
    REFERENCES `AVRCMF`.`Departamento` (`idDepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proyecto_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `AVRCMF`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AVRCMF`.`Facturacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AVRCMF`.`Facturacion` (
  `idFacturacion` INT NOT NULL,
  `Precio` INT NOT NULL,
  `Fecha` DATETIME NOT NULL,
  `Proyecto_idProyecto` INT NOT NULL,
  PRIMARY KEY (`idFacturacion`, `Proyecto_idProyecto`),
  INDEX `fk_Facturacion_Proyecto1_idx` (`Proyecto_idProyecto` ASC) VISIBLE,
  CONSTRAINT `fk_Facturacion_Proyecto1`
    FOREIGN KEY (`Proyecto_idProyecto`)
    REFERENCES `AVRCMF`.`Proyecto` (`idProyecto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
