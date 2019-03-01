-- DB: MySQL cande_1
use cande_1;
-- ******************************
-- TABLE: Entity
-- ******************************
-- Select all rows from Entity
DROP PROCEDURE IF EXISTS Entity_SelectAll;
DELIMITER // ;
CREATE PROCEDURE Entity_SelectAll()
SQL SECURITY INVOKER
BEGIN
	SELECT `EntityId` ,`QCode` ,`URI` ,`QDescr`  FROM `Entity`;
END//
DELIMITER ;
-- Select single row using Primary Key from Entity
DROP PROCEDURE IF EXISTS Entity_SelectOne;
DELIMITER // ;
CREATE PROCEDURE Entity_SelectOne(IN arg_EntityId bigint(20))
SQL SECURITY INVOKER
BEGIN
	SELECT `EntityId` ,`QCode` ,`URI` ,`QDescr`  FROM `Entity` WHERE `EntityId`=arg_EntityId;
END//
DELIMITER ;
-- Delete single row using Primary Key from Entity
DROP PROCEDURE IF EXISTS Entity_DeleteOne;
DELIMITER // ;
CREATE PROCEDURE Entity_DeleteOne(IN arg_EntityId bigint(20))
SQL SECURITY INVOKER
BEGIN
	DELETE FROM `Entity` WHERE `EntityId`=arg_EntityId;
END//
DELIMITER ;
-- Insert row into Entity
DROP PROCEDURE IF EXISTS Entity_Insert;
DELIMITER // ;
CREATE PROCEDURE Entity_Insert(IN arg_QCode varchar(20),IN arg_URI varchar(200),IN arg_QDescr varchar(200))
SQL SECURITY INVOKER
BEGIN
	INSERT INTO `Entity` (`QCode` ,`URI` ,`QDescr` ) VALUES (arg_QCode,arg_URI,arg_QDescr);
END//
DELIMITER ;
-- Insert row using default values into Entity
DROP PROCEDURE IF EXISTS Entity_InsertUsingDefaults;
DELIMITER // ;
CREATE PROCEDURE Entity_InsertUsingDefaults(IN arg_QCode varchar(20),IN arg_URI varchar(200))
SQL SECURITY INVOKER
BEGIN
	INSERT INTO `Entity` (`QCode` ,`URI` ) VALUES (arg_QCode,arg_URI);
END//
DELIMITER ;
-- Update row using primary key for Entity
DROP PROCEDURE IF EXISTS Entity_Update;
DELIMITER // ;
CREATE PROCEDURE Entity_Update(IN arg_EntityId bigint(20),IN arg_QCode varchar(20),IN arg_URI varchar(200),IN arg_QDescr varchar(200))
SQL SECURITY INVOKER
BEGIN
	UPDATE `Entity` SET `QCode`=arg_QCode,`URI`=arg_URI,`QDescr`=arg_QDescr WHERE `EntityId`=arg_EntityId;
END//
DELIMITER ;
-- Update row using default values and primary key for Entity
DROP PROCEDURE IF EXISTS Entity_UpdateUsingDefaults;
DELIMITER // ;
CREATE PROCEDURE Entity_UpdateUsingDefaults(IN arg_EntityId bigint(20),IN arg_QCode varchar(20),IN arg_URI varchar(200))
SQL SECURITY INVOKER
BEGIN
	UPDATE `Entity` SET `QCode`=arg_QCode,`URI`=arg_URI WHERE `EntityId`=arg_EntityId;
END//
DELIMITER ;
-- END TABLE: Entity
-- ******************************
-- TABLE: Property
-- ******************************
-- Select all rows from Property
DROP PROCEDURE IF EXISTS Property_SelectAll;
DELIMITER // ;
CREATE PROCEDURE Property_SelectAll()
SQL SECURITY INVOKER
BEGIN
	SELECT `PropertyId` ,`PCode` ,`PDescr`  FROM `Property`;
END//
DELIMITER ;
-- Select single row using Primary Key from Property
DROP PROCEDURE IF EXISTS Property_SelectOne;
DELIMITER // ;
CREATE PROCEDURE Property_SelectOne(IN arg_PropertyId bigint(20))
SQL SECURITY INVOKER
BEGIN
	SELECT `PropertyId` ,`PCode` ,`PDescr`  FROM `Property` WHERE `PropertyId`=arg_PropertyId;
END//
DELIMITER ;
-- Delete single row using Primary Key from Property
DROP PROCEDURE IF EXISTS Property_DeleteOne;
DELIMITER // ;
CREATE PROCEDURE Property_DeleteOne(IN arg_PropertyId bigint(20))
SQL SECURITY INVOKER
BEGIN
	DELETE FROM `Property` WHERE `PropertyId`=arg_PropertyId;
END//
DELIMITER ;
-- Insert row into Property
DROP PROCEDURE IF EXISTS Property_Insert;
DELIMITER // ;
CREATE PROCEDURE Property_Insert(IN arg_PCode varchar(20),IN arg_PDescr varchar(200))
SQL SECURITY INVOKER
BEGIN
	INSERT INTO `Property` (`PCode` ,`PDescr` ) VALUES (arg_PCode,arg_PDescr);
END//
DELIMITER ;
-- Insert row using default values into Property
DROP PROCEDURE IF EXISTS Property_InsertUsingDefaults;
DELIMITER // ;
CREATE PROCEDURE Property_InsertUsingDefaults(IN arg_PCode varchar(20),IN arg_PDescr varchar(200))
SQL SECURITY INVOKER
BEGIN
	INSERT INTO `Property` (`PCode` ,`PDescr` ) VALUES (arg_PCode,arg_PDescr);
END//
DELIMITER ;
-- Update row using primary key for Property
DROP PROCEDURE IF EXISTS Property_Update;
DELIMITER // ;
CREATE PROCEDURE Property_Update(IN arg_PropertyId bigint(20),IN arg_PCode varchar(20),IN arg_PDescr varchar(200))
SQL SECURITY INVOKER
BEGIN
	UPDATE `Property` SET `PCode`=arg_PCode,`PDescr`=arg_PDescr WHERE `PropertyId`=arg_PropertyId;
END//
DELIMITER ;
-- Update row using default values and primary key for Property
DROP PROCEDURE IF EXISTS Property_UpdateUsingDefaults;
DELIMITER // ;
CREATE PROCEDURE Property_UpdateUsingDefaults(IN arg_PropertyId bigint(20),IN arg_PCode varchar(20),IN arg_PDescr varchar(200))
SQL SECURITY INVOKER
BEGIN
	UPDATE `Property` SET `PCode`=arg_PCode,`PDescr`=arg_PDescr WHERE `PropertyId`=arg_PropertyId;
END//
DELIMITER ;
-- END TABLE: Property
-- ******************************
-- TABLE: Triple
-- ******************************
-- Select all rows from Triple
DROP PROCEDURE IF EXISTS Triple_SelectAll;
DELIMITER // ;
CREATE PROCEDURE Triple_SelectAll()
SQL SECURITY INVOKER
BEGIN
	SELECT `Cause` ,`Relationship` ,`Effect` ,`AsOf`  FROM `Triple`;
END//
DELIMITER ;
-- Select single row using Primary Key from Triple
DROP PROCEDURE IF EXISTS Triple_SelectOne;
DELIMITER // ;
CREATE PROCEDURE Triple_SelectOne(IN arg_Cause bigint(20),IN arg_Relationship bigint(20),IN arg_Effect bigint(20))
SQL SECURITY INVOKER
BEGIN
	SELECT `Cause` ,`Relationship` ,`Effect` ,`AsOf`  FROM `Triple` WHERE `Cause`=arg_Cause AND `Relationship`=arg_Relationship AND `Effect`=arg_Effect;
END//
DELIMITER ;
-- Delete single row using Primary Key from Triple
DROP PROCEDURE IF EXISTS Triple_DeleteOne;
DELIMITER // ;
CREATE PROCEDURE Triple_DeleteOne(IN arg_Cause bigint(20),IN arg_Relationship bigint(20),IN arg_Effect bigint(20))
SQL SECURITY INVOKER
BEGIN
	DELETE FROM `Triple` WHERE `Cause`=arg_Cause AND `Relationship`=arg_Relationship AND `Effect`=arg_Effect;
END//
DELIMITER ;
-- Insert row into Triple
DROP PROCEDURE IF EXISTS Triple_Insert;
DELIMITER // ;
CREATE PROCEDURE Triple_Insert(IN arg_Cause bigint(20),IN arg_Relationship bigint(20),IN arg_Effect bigint(20),IN arg_AsOf datetime)
SQL SECURITY INVOKER
BEGIN
	INSERT INTO `Triple` (`Cause` ,`Relationship` ,`Effect` ,`AsOf` ) VALUES (arg_Cause,arg_Relationship,arg_Effect,arg_AsOf);
END//
DELIMITER ;
-- Insert row using default values into Triple
DROP PROCEDURE IF EXISTS Triple_InsertUsingDefaults;
DELIMITER // ;
CREATE PROCEDURE Triple_InsertUsingDefaults(IN arg_Cause bigint(20),IN arg_Relationship bigint(20),IN arg_Effect bigint(20))
SQL SECURITY INVOKER
BEGIN
	INSERT INTO `Triple` (`Cause` ,`Relationship` ,`Effect` ) VALUES (arg_Cause,arg_Relationship,arg_Effect);
END//
DELIMITER ;
-- Update row using primary key for Triple
DROP PROCEDURE IF EXISTS Triple_Update;
DELIMITER // ;
CREATE PROCEDURE Triple_Update(IN arg_Cause bigint(20),IN arg_Relationship bigint(20),IN arg_Effect bigint(20),IN arg_AsOf datetime)
SQL SECURITY INVOKER
BEGIN
	UPDATE `Triple` SET `AsOf`=arg_AsOf WHERE `Cause`=arg_Cause AND `Relationship`=arg_Relationship AND `Effect`=arg_Effect;
END//
DELIMITER ;
-- Update row using default values and primary key for Triple
-- **********************************
-- WARNING! NO PROCEDURE GENERATED:
-- Triple_UpdateUsingDefaults
-- **********************************
-- END TABLE: Triple
-- *******************************
-- Run command below to verify success.
-- There should be 20 procedures created.
-- If numbers don't match, please see warnings.
-- show procedure status where db='cande_1';
