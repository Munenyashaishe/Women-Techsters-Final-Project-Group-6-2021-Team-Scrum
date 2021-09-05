-- RoleTable
-- RoleUser
USE itiaa;

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



-- Dropping Tables (deleting tables)
--DROP TABLE LoginLog;


--Read using Select
SELECT * FROM LoginLog AS l LEFT JOIN Users AS u ON l.UsersId=u.UsersId;


-- Select loginlogs by user id
SELECT * FROM LoginLog where UsersId=1;

-- Select loginlogs by id
SELECT * FROM LoginLog where LoginLogsId=1;


-- Insert into LoginLogs
 INSERT INTO LoginLog(LoginDate,LogoutDate,UsersId) VALUES ('2021/08/30','2021/08/30',1); 

 -- Update LoginLogs by id
UPDATE LoginLog SET LogoutDate = 2 WHERE LoginLogId = 1;

-- Delete role_user by ID
DELETE FROM LoginLog WHERE LoginLogId = 5;