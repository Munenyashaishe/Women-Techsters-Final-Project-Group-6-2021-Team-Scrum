-- ROLE

-- insert users, select all, select by role_id, select user_id, update by role_id, delete by role_id

USE itiaa;

CREATE TABLE roles 
(
  RoleId INT PRIMARY KEY IDENTITY(1,1),
  RoleName VARCHAR(45) NOT NULL,
  CreatedAt DATETIME NOT NULL,
  UpdatedAt DATETIME NULL,
)

-- Dropping Tables (deleting tables)
--DROP TABLE roles;


--Read using Select
SELECT * FROM Roles;

-- Insert into roles
INSERT INTO Roles(RoleName, CreatedAt, UpdatedAt ) Values ('Manager', '', '');


-- Select roles by ID
SELECT * FROM Roles WHERE RoleId = '';

-- Update role by id
UPDATE Roles SET RoleName = 'Cook' WHERE RoleId = 1;

-- Delete role by ID
DELETE FROM Roles WHERE RoleId = 5;