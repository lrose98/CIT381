-- CIT 381
-- Fall 2019
-- Assignment 4
-- Lillie Rose

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema assign04
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema assign04
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `assign04` ;
USE `assign04` ;

-- -----------------------------------------------------
-- Table `assign04`.`Staff_List`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assign04`.`Staff_List` ;

CREATE TABLE IF NOT EXISTS `assign04`.`Staff_List` (
  `staff_id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NULL,
  `title` VARCHAR(45) NOT NULL,
  `hire_date` VARCHAR(45) NOT NULL,
  `email_address` VARCHAR(255) NOT NULL,
  `other_details` MEDIUMTEXT NULL,
  PRIMARY KEY (`staff_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assign04`.`Alumni_Courses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assign04`.`Alumni_Courses` ;

CREATE TABLE IF NOT EXISTS `assign04`.`Alumni_Courses` (
  `course_id` INT NOT NULL,
  `staff_id` INT NULL,
  `title` VARCHAR(255) NOT NULL,
  `start_time` DATETIME NOT NULL,
  `end_time` DATETIME NOT NULL,
  `other_details` MEDIUMTEXT NULL,
  PRIMARY KEY (`course_id`),
  INDEX `fk_Alumni_Courses_Staff_List1_idx` (`staff_id` ASC),
  CONSTRAINT `fk_Alumni_Courses_Staff_List1`
    FOREIGN KEY (`staff_id`)
    REFERENCES `assign04`.`Staff_List` (`staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assign04`.`Events`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assign04`.`Events` ;

CREATE TABLE IF NOT EXISTS `assign04`.`Events` (
  `event_id` INT NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `start_time` DATETIME NOT NULL,
  `end_time` DATETIME NOT NULL,
  `other_details` MEDIUMTEXT NULL,
  PRIMARY KEY (`event_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assign04`.`Alumni_Acceptance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assign04`.`Alumni_Acceptance` ;

CREATE TABLE IF NOT EXISTS `assign04`.`Alumni_Acceptance` (
  `option_id` INT NOT NULL,
  `acceptance_level` VARCHAR(45) NOT NULL,
  `other_details` MEDIUMTEXT NULL,
  PRIMARY KEY (`option_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assign04`.`Member_ Regisration`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assign04`.`Member_ Regisration` ;

CREATE TABLE IF NOT EXISTS `assign04`.`Member_ Regisration` (
  `email_address` VARCHAR(320) NOT NULL,
  `member_password` VARCHAR(45) NOT NULL,
  `option_id` INT NOT NULL,
  `other_details` VARCHAR(45) NULL,
  PRIMARY KEY (`email_address`),
  INDEX `fk_Member_ Regisration_table11_idx` (`option_id` ASC),
  CONSTRAINT `fk_Member_ Regisration_table11`
    FOREIGN KEY (`option_id`)
    REFERENCES `assign04`.`Alumni_Acceptance` (`option_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assign04`.`Member_List`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assign04`.`Member_List` ;

CREATE TABLE IF NOT EXISTS `assign04`.`Member_List` (
  `member_id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NULL,
  `phone_number` INT NOT NULL,
  `email_address` VARCHAR(320) NOT NULL,
  `graduation_date` DATE NOT NULL,
  `other_details` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`member_id`),
  INDEX `fk_Member_List_Member_ Regisration1_idx` (`email_address` ASC),
  CONSTRAINT `fk_Member_List_Member_ Regisration1`
    FOREIGN KEY (`email_address`)
    REFERENCES `assign04`.`Member_ Regisration` (`email_address`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assign04`.`Success_Stories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assign04`.`Success_Stories` ;

CREATE TABLE IF NOT EXISTS `assign04`.`Success_Stories` (
  `story_id` INT NOT NULL,
  `member_id` INT NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `other_details` MEDIUMTEXT NULL,
  PRIMARY KEY (`story_id`),
  INDEX `fk_Success_Stories_Member_List1_idx` (`member_id` ASC),
  CONSTRAINT `fk_Success_Stories_Member_List1`
    FOREIGN KEY (`member_id`)
    REFERENCES `assign04`.`Member_List` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assign04`.`Blog_Authors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assign04`.`Blog_Authors` ;

CREATE TABLE IF NOT EXISTS `assign04`.`Blog_Authors` (
  `author_id` INT NOT NULL,
  `staff_id` INT NULL,
  `member_id` INT NULL,
  `other_details` MEDIUMTEXT NULL,
  PRIMARY KEY (`author_id`),
  INDEX `fk_Blog_Authors_Staff_List1_idx` (`staff_id` ASC),
  INDEX `fk_Blog_Authors_Member_List1_idx` (`member_id` ASC),
  CONSTRAINT `fk_Blog_Authors_Staff_List1`
    FOREIGN KEY (`staff_id`)
    REFERENCES `assign04`.`Staff_List` (`staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Blog_Authors_Member_List1`
    FOREIGN KEY (`member_id`)
    REFERENCES `assign04`.`Member_List` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assign04`.`Blog_Article`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assign04`.`Blog_Article` ;

CREATE TABLE IF NOT EXISTS `assign04`.`Blog_Article` (
  `article_id` INT NOT NULL,
  `author_id` INT NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `sumbission_date` DATE NOT NULL,
  `other_details` MEDIUMTEXT NULL,
  PRIMARY KEY (`article_id`),
  INDEX `fk_Blog_Article_Blog_Authors1_idx` (`author_id` ASC),
  CONSTRAINT `fk_Blog_Article_Blog_Authors1`
    FOREIGN KEY (`author_id`)
    REFERENCES `assign04`.`Blog_Authors` (`author_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assign04`.`Course_Regisration`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assign04`.`Course_Regisration` ;

CREATE TABLE IF NOT EXISTS `assign04`.`Course_Regisration` (
  `course_id` INT NOT NULL,
  `member_id` INT NOT NULL,
  PRIMARY KEY (`course_id`, `member_id`),
  INDEX `fk_Alumni_Courses_has_Member_List_Member_List1_idx` (`member_id` ASC),
  INDEX `fk_Alumni_Courses_has_Member_List_Alumni_Courses1_idx` (`course_id` ASC),
  CONSTRAINT `fk_Alumni_Courses_has_Member_List_Alumni_Courses1`
    FOREIGN KEY (`course_id`)
    REFERENCES `assign04`.`Alumni_Courses` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumni_Courses_has_Member_List_Member_List1`
    FOREIGN KEY (`member_id`)
    REFERENCES `assign04`.`Member_List` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assign04`.`Course_Regisration`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assign04`.`Course_Regisration` ;

CREATE TABLE IF NOT EXISTS `assign04`.`Course_Regisration` (
  `course_id` INT NOT NULL,
  `member_id` INT NOT NULL,
  PRIMARY KEY (`course_id`, `member_id`),
  INDEX `fk_Alumni_Courses_has_Member_List_Member_List1_idx` (`member_id` ASC),
  INDEX `fk_Alumni_Courses_has_Member_List_Alumni_Courses1_idx` (`course_id` ASC),
  CONSTRAINT `fk_Alumni_Courses_has_Member_List_Alumni_Courses1`
    FOREIGN KEY (`course_id`)
    REFERENCES `assign04`.`Alumni_Courses` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumni_Courses_has_Member_List_Member_List1`
    FOREIGN KEY (`member_id`)
    REFERENCES `assign04`.`Member_List` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assign04`.`Event_Regisration`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assign04`.`Event_Regisration` ;

CREATE TABLE IF NOT EXISTS `assign04`.`Event_Regisration` (
  `event_id` INT NOT NULL,
  `member_id` INT NOT NULL,
  PRIMARY KEY (`event_id`, `member_id`),
  INDEX `fk_Events_has_Member_List_Member_List1_idx` (`member_id` ASC),
  INDEX `fk_Events_has_Member_List_Events1_idx` (`event_id` ASC),
  CONSTRAINT `fk_Events_has_Member_List_Events1`
    FOREIGN KEY (`event_id`)
    REFERENCES `assign04`.`Events` (`event_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Events_has_Member_List_Member_List1`
    FOREIGN KEY (`member_id`)
    REFERENCES `assign04`.`Member_List` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assign04`.`Contact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assign04`.`Contact` ;

CREATE TABLE IF NOT EXISTS `assign04`.`Contact` (
  `contact_id` INT NOT NULL,
  `email_address` VARCHAR(230) NOT NULL,
  `question_summary` VARCHAR(255) NULL,
  `question_detailed` MEDIUMTEXT NULL,
  PRIMARY KEY (`contact_id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
