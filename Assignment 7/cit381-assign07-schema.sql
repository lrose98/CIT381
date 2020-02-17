-- CIT 381
-- Assignment 7
-- r/girlsgonewild Database
-- Lillie Rose


-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema assign07
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema assign07
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `assign07` ;
USE `assign07` ;

-- -----------------------------------------------------
-- Table `assign07`.`subreddit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assign07`.`subreddit` ;

CREATE TABLE IF NOT EXISTS `assign07`.`subreddit` (
  `subreddit_id` VARCHAR(11) NOT NULL,
  `subreddit` VARCHAR(255) NOT NULL,
  `subreddit_type` VARCHAR(45) NULL,
  `subreddit_subscribers` INT NOT NULL,
  PRIMARY KEY (`subreddit_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assign07`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assign07`.`users` ;

CREATE TABLE IF NOT EXISTS `assign07`.`users` (
  `author` INT NOT NULL,
  `subreddit_id` VARCHAR(11) NOT NULL,
  `author_fullname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`author`, `subreddit_id`),
  INDEX `fk_users_subreddit_idx` (`subreddit_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_subreddit`
    FOREIGN KEY (`subreddit_id`)
    REFERENCES `assign07`.`subreddit` (`subreddit_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assign07`.`posts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assign07`.`posts` ;

CREATE TABLE IF NOT EXISTS `assign07`.`posts` (
  `id` VARCHAR(7) NOT NULL,
  `subreddit_id` VARCHAR(11) NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `selftext` LONGTEXT NULL,
  `created_utc` DECIMAL(15,2) NOT NULL,
  `edited` TINYINT NOT NULL,
  `removed_by` VARCHAR(45) NULL,
  `url` VARCHAR(500) NOT NULL,
  `num_comments` INT NOT NULL,
  `permalink` VARCHAR(500) NOT NULL,
  `author_fullname` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_posts_subreddit1_idx` (`subreddit_id` ASC) VISIBLE,
  CONSTRAINT `fk_posts_subreddit1`
    FOREIGN KEY (`subreddit_id`)
    REFERENCES `assign07`.`subreddit` (`subreddit_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assign07`.`analytics`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assign07`.`analytics` ;

CREATE TABLE IF NOT EXISTS `assign07`.`analytics` (
  `id` VARCHAR(7) NOT NULL,
  `ups` INT NOT NULL,
  `downs` INT NOT NULL,
  `score` INT NOT NULL,
  `likes` INT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_analytics_posts1`
    FOREIGN KEY (`id`)
    REFERENCES `assign07`.`posts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assign07`.`crossposts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assign07`.`crossposts` ;

CREATE TABLE IF NOT EXISTS `assign07`.`crossposts` (
  `id` VARCHAR(7) NOT NULL,
  `is_crosspostable` TINYINT NOT NULL,
  `num_crossposts` INT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_crossposts_posts1`
    FOREIGN KEY (`id`)
    REFERENCES `assign07`.`posts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
