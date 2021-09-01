-- ROLE

-- insert users, select all, select by role_id, select user_id, update by role_id, delete by role_id

USE itiaa;

CREATE TABLE roles 
(
  role_id INT PRIMARY KEY IDENTITY(1,1),
  role_name VARCHAR(45) NOT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NULL,
)

-- Dropping Tables (deleting tables)
--DROP TABLE roles;


--Read using Select
SELECT * FROM roles;

-- Insert into roles
INSERT INTO roles(role_name, Created_At, Updated_At ) Values ('Manager', '', '');


-- Select roles by ID
SELECT * FROM Roles WHERE role_id = '';

-- Update role by id
UPDATE roles SET role_name = 'Cook' WHERE role_Id = 1;

-- Delete role by ID
DELETE FROM roles WHERE role_Id = 5;