-- RoleTable
-- RoleUser
USE itiaa;

CREATE TABLE role_user (
  role_user_id INT NOT NULL,
  users_id BIGINT NOT NULL,
  role_id INT NOT NULL,
  PRIMARY KEY (role_user_id),
  CONSTRAINT fk_role_user_user
    FOREIGN KEY (users_id)
    REFERENCES users (users_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_role_user_role1
    FOREIGN KEY (role_id)
    REFERENCES roles (role_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

CREATE INDEX fk_role_user_user_idx ON role_user (users_id ASC);

CREATE INDEX fk_role_user_role1_idx ON role_user (role_id ASC);


-- Dropping Tables (deleting tables)
--DROP TABLE role_user;


--Read using Select
SELECT * FROM role_user LEFT JOIN roles ON role_user.role_id=roles.role_id LEFT JOIN users ON role_user.users_id=users.users_id;


-- Select roles by user id
SELECT * FROM role_user LEFT JOIN roles ON role_user.role_id=roles.role_id WHERE role_user.users_id=1;

-- Insert into role_user
 INSERT INTO role_user(users_id,role_id) VALUES (1,1); 

 -- Update role_user by id
UPDATE role_user SET role_id = 2 WHERE role_user_id = 1;

-- Delete role_user by ID
DELETE FROM role_user WHERE role_user_id = 5;