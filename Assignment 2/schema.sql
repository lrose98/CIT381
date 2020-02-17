-- CIT 381 Fall 2019
-- Assignment #2
-- October 18th
-- Lillie Rose
-- schema.sql

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema wedding
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema wedding
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `wedding` DEFAULT CHARACTER SET utf8 ;
USE `wedding` ;

-- -----------------------------------------------------
-- Table `wedding`.`person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wedding`.`person` ;

CREATE TABLE IF NOT EXISTS `wedding`.`person` (
  `id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `birthdate` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wedding`.`relationship`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wedding`.`relationship` ;

CREATE TABLE IF NOT EXISTS `wedding`.`relationship` (
  `id` INT NOT NULL,
  `relationship` VARCHAR(45) NULL,
  `gen_id` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wedding`.`family`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wedding`.`family` ;

CREATE TABLE IF NOT EXISTS `wedding`.`family` (
  `person_id` INT NOT NULL,
  `relationship_id` INT NOT NULL,
  `person_1` VARCHAR(45) NULL,
  `person_2` VARCHAR(45) NULL,
  `gen_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`person_id`, `relationship_id`),
  INDEX `fk_person_has_relationship_relationship1_idx` (`relationship_id` ASC) VISIBLE,
  INDEX `fk_person_has_relationship_person_idx` (`person_id` ASC) VISIBLE,
  CONSTRAINT `fk_person_has_relationship_person`
    FOREIGN KEY (`person_id`)
    REFERENCES `wedding`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_person_has_relationship_relationship1`
    FOREIGN KEY (`relationship_id`)
    REFERENCES `wedding`.`relationship` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wedding`.`friend`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wedding`.`friend` ;

CREATE TABLE IF NOT EXISTS `wedding`.`friend` (
  `person_id` INT NOT NULL,
  `relationship_id` INT NOT NULL,
  `person_1` VARCHAR(45) NULL,
  `person_2` VARCHAR(45) NULL,
  PRIMARY KEY (`person_id`, `relationship_id`),
  INDEX `fk_person_has_relationship_relationship2_idx` (`relationship_id` ASC) VISIBLE,
  INDEX `fk_person_has_relationship_person1_idx` (`person_id` ASC) VISIBLE,
  CONSTRAINT `fk_person_has_relationship_person1`
    FOREIGN KEY (`person_id`)
    REFERENCES `wedding`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_person_has_relationship_relationship2`
    FOREIGN KEY (`relationship_id`)
    REFERENCES `wedding`.`relationship` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- insert values into person
insert into person (id, first_name, last_name, birthdate) 
values
	(001, "Lisa", "Robertson", "1969-12-27"),
    (002, "Alex", "Robertson", "1996-4-18"),
    (003, "Kim", "Hustom", "1993-03-03"),
    (004, "Benjamin", "Gilray", "1993-10-15"),
    (005, "Sammy", "Davis", "1992-06-12"),
    (006, "Alex", "Dix", "1993-09-18"),
    (007, "Derek", "DeBois", "1966-11-01"),
    (008, "Sally", "Dunn", "1968-01-31"),
    (009, "Johnathan", "Robertson", "1968-02-29"),
    (010, "Thomas", "Dunn", "1995-07-14"),
    (011, "Jamie", "Lacy", "1996-05-29"),
    (012, "Tyler", "June", "1989-08-08");
 
-- insert values into relationship
insert into relationship (id, relationship, gen_id)
values
	(001, "Mother", 2),
    (002, "Sister", 1),
    (003, "Maid of Honor", NULL),
    (004, "Best Man", NULL),
    (005, "Bridesmaid", NULL),
    (006, "Groomesman", NULL),
    (007, "Father", 2),
    (008, "Mother", 2),
    (009, "Father", 2),
    (010, "Brother", 1),
    (011, "Groomesman", NULL),
    (012, "Bridesmaid", NULL);
    
-- insert values into family
insert into family (person_id, relationship_id, person_1, person_2, gen_id)
values
	(001, 001, NULL, "Mother", 2),
    (002, 002, Null, "Sister", 1),
    (007, 007, "Father", NULL, 2),
    (008, 008, "Mother", NULL, 2),
    (009, 009, Null, "Father", 2),
    (010, 010, "Brother", Null, 1);
    
-- insert values into friend
insert into friend (person_id, relationship_id, person_1, person_2)
values
	(003, 003, "Maid of Honor", NULL),
    (004, 004, NULL, "Best Man"),
    (005, 005, "Bridesmaid", NULL),
    (006, 006, NULL, "Groomesman"),
    (011, 011, NULL, "Groomesman"),
    (012, 012, "Bridesmaid", NULL);