--UserTable

-- User Table to insert, select all, select by user_id, select by email, update by user_id, delete by user_id.

USE itiaa;


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
-- Dropping Tables (deleting tables)
--DROP TABLE users;

--DML
-- To add data to the data base
-- a. By specifying the values to be inserted
INSERT INTO users (FirstName, LastName, Email,UserPassword, Gender, PhoneNumber, CountryResidence, StateResidence, CityResidence, UserAddress,EmailVerificationToken,IsEmailVerified,UserStatus) VALUES ('Remilekun', 'Odegbami', 'remdev22@gmail.com','itmghn890', 'Female', '+234123456789','Nigeria', 'Oyo', 'Ibadan', 'Uni Ibadan','remdev22@gmailcomitmghn890',1,'Active');

-- SELECT USERS
--This selects all users
SELECT * FROM Users LEFT JOIN RoleUser ON Users.UsersId=RoleUser.UsersId LEFT JOIN Roles on RoleUser.RoleId=Roles.RoleId;

-- Select a users with roles
SELECT u.*,ru.*, (SELECT r.RoleName from Roles AS r  WHERE ru.RoleId=r.RoleId) AS RoleName FROM Users AS u LEFT JOIN RoleUser as ru ON u.UsersId=ru.UsersId
 
-- select by id
SELECT * From Users WHERE UsersId = 2;

-- Select a users with roles by user id
SELECT u.*,ru.*, (SELECT r.RoleName from Roles AS r  WHERE ru.RoleId=r.RoleId) AS RoleName FROM Users AS u LEFT JOIN RoleUser as ru ON u.UsersId=ru.UsersId WHERE UsersId = 2;

-- select by email
SELECT u.*,ru.*, (SELECT r.RoleName from Roles AS r  WHERE ru.RoleId=r.RoleId) AS RoleName FROM Users AS u LEFT JOIN RoleUser as ru ON u.UsersId=ru.UsersId WHERE email = 'ifeayeni@gmail.com';


-- UPDATE USERS

UPDATE Users SET LastName = 'Werr' WHERE UsersId = 2;


-- DELETE FROM USERS
DELETE FROM Users WHERE UsersId = 8;

