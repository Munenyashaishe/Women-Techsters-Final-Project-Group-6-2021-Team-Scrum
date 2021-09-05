-- DDL for creating tables
-- Mon Aug 30 04:59:25 2021
-- ITIAA Project

-- -----------------------------------------------------
-- Schema itiaa
-- -----------------------------------------------------

USE itiaa ;

-- -----------------------------------------------------
-- Table itiaa'.user
-- -----------------------------------------------------

CREATE TABLE Users
(
  UsersId BIGINT PRIMARY KEY IDENTITY(1,1),
  Email VARCHAR(120) NOT NULL,
  UserPassword VARCHAR(120) NOT NULL,
  FirstName VARCHAR(45) NOT NULL,
  LastName VARCHAR(45) NOT NULL,
  OtherNames VARCHAR(120) NULL,
  Gender VARCHAR(45) NULL,
  PhoneNumber VARCHAR(45) NULL,
  CountryResidence VARCHAR(45) NULL,
  StateResidence VARCHAR(45) NULL,
  CityResidence VARCHAR(45) NULL,
  UserAddress VARCHAR(255) NULL,
  CreatedAt DATETIME NOT NULL,
  UpdatedAt DATETIME NULL,
  UserStatus VARCHAR(45) NOT NULL,
  IsEmailVerified INT NOT NULL,
  EmailVerificationToken VARCHAR(255) NULL
  )


CREATE UNIQUE INDEX Email_UNIQUE ON Users (Email ASC);


-- -----------------------------------------------------
-- Table itiaa.Roles
-- -----------------------------------------------------
CREATE TABLE roles 
(
  RoleId INT PRIMARY KEY IDENTITY(1,1),
  RoleName VARCHAR(45) NOT NULL,
  CreatedAt DATETIME NOT NULL,
  UpdatedAt DATETIME NULL,
)

-- -----------------------------------------------------
-- Table itiaa.RoleUser
-- -----------------------------------------------------
CREATE TABLE RoleUser (
 RoleUserId INT NOT NULL,
  UsersId BIGINT NOT NULL,
  RoleId INT NOT NULL,
  PRIMARY KEY (RoleUserId),
  CONSTRAINT fk_RoleUser_Users
    FOREIGN KEY (UsersId)
    REFERENCES Users (UsersId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_RoleUser_Role1
    FOREIGN KEY (RoleId)
    REFERENCES Roles (RoleId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

CREATE INDEX fk_RoleUser_Users_idx ON RoleUser (UsersId ASC);

CREATE INDEX fk_RoleUser_Role1_idx ON RoleUser (RoleId ASC);


-- -----------------------------------------------------
-- Table itiaa.LoginLog
-- -----------------------------------------------------

CREATE TABLE LoginLog (
  LoginLogId INT NOT NULL,
  LoginDate DATETIME NULL,
  LogoutDate DATETIME NULL,
  Userstatus VARCHAR(45) NULL,
  UsersId BIGINT NOT NULL,
  PRIMARY KEY (LoginLogId),
  CONSTRAINT fk_LoginLog_User1
    FOREIGN KEY (UsersId)
    REFERENCES Users (UsersId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

CREATE INDEX fk_LoginLog_User1_idx ON LoginLog (UsersId ASC);

