-- RoleTable
-- RoleUser
USE itiaa;

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

CREATE INDEX fk_RoleUser_UsersIdx ON RoleUser (UsersId ASC);

CREATE INDEX fk_RoleUser_Role1_idx ON RoleUser (RoleId ASC);

-- Dropping Tables (deleting tables)
--DROP TABLE RoleUser;


--Read using Select
SELECT * FROM RoleUser LEFT JOIN Roles ON RoleUser.RoleId=Roles.RoleId LEFT JOIN users ON RoleUser.UsersId=users.UsersId;


-- Select Roles by user id
SELECT * FROM RoleUser LEFT JOIN Roles ON RoleUser.RoleId=Roles.RoleId WHERE RoleUser.UsersId=1;

-- Insert into RoleUser
 INSERT INTO RoleUser(UsersId,RoleId) VALUES (1,1); 

 -- Update RoleUser by id
UPDATE RoleUser SET RoleId = 2 WHERE RoleUserId = 1;

-- Delete RoleUser by ID
DELETE FROM RoleUser WHERE RoleUserId = 5;