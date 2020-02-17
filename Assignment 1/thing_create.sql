-- CIT 381 Fall 2019
-- Assignment #1
-- October 11th
-- Lillie Rose

-- if a table labeled thing already exists, delete it
DROP TABLE IF EXISTS thing; 

-- create a table called thing
CREATE TABLE thing (
  movie VARCHAR(45) NOT NULL,
  number INT NOT NULL,
  title VARCHAR(45) NOT NULL,
  minute_length VARCHAR(45) NOT NULL,
  year_of_release YEAR NOT NULL,
  PRIMARY KEY (number))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;