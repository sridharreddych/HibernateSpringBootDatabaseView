DROP TABLE IF EXISTS book ^; 
DROP TABLE IF EXISTS author ^; 

CREATE TABLE author (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  age int(11) NOT NULL,
  genre varchar(255) DEFAULT NULL,
  name varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
) ^;

CREATE TABLE book (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  isbn varchar(255) DEFAULT NULL,
  title varchar(255) DEFAULT NULL,
  author_id bigint(20) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY FKklnrv3weler2ftkweewlky958 (author_id),
  CONSTRAINT FKklnrv3weler2ftkweewlky958 FOREIGN KEY (author_id) REFERENCES author (id)
) ^;
 
delimiter ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `tbl_people_update`(IN `p_Id` INT, IN `p_Name` VARCHAR(150), IN `p_Mobile_Number` VARCHAR(100))
    IF CHAR_LENGTH(p_Mobile_Number) <= 0 THEN
     SET p_Mobile_Number = '12345';
    END IF;

    UPDATE tbl_people
     SET 
     Name=p_Name,
     Mobile_Number = p_Mobile_Number
     WHERE
     Id=p_Id;
||
delimiter ;