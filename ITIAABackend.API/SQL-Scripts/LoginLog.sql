-- RoleTable
-- RoleUser
USE itiaa;

CREATE TABLE login_log (
  login_log_id INT NOT NULL,
  login_date DATETIME NULL,
  logout_date DATETIME NULL,
  status VARCHAR(45) NULL,
  users_id BIGINT NOT NULL,
  PRIMARY KEY (login_log_id),
  CONSTRAINT fk_login_log_user1
    FOREIGN KEY (users_id)
    REFERENCES users (users_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

CREATE INDEX fk_login_log_user1_idx ON login_log (users_id ASC);



-- Dropping Tables (deleting tables)
--DROP TABLE login_log;


--Read using Select
SELECT * FROM login_log AS l LEFT JOIN users AS u ON l.users_id=u.users_id;


-- Select loginlogs by user id
SELECT * FROM login_log where users_id=1;

-- Select loginlogs by id
SELECT * FROM login_log where login_logs_id=1;


-- Insert into login_logs
 INSERT INTO login_log(login_date,logout_date,users_id) VALUES ('2021/08/30','2021/08/30',1); 

 -- Update login_logs by id
UPDATE login_log SET logout_date = 2 WHERE login_log_Id = 1;

-- Delete role_user by ID
DELETE FROM login_log WHERE login_log_Id = 5;