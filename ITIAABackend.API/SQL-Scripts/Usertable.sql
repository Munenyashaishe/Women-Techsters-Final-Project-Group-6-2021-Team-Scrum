--UserTable

-- User Table to insert, select all, select by user_id, select by email, update by user_id, delete by user_id.

USE itiaa;

CREATE TABLE users
(
  users_id BIGINT PRIMARY KEY IDENTITY(1,1),
  email VARCHAR(120) NOT NULL,
  password VARCHAR(120) NOT NULL,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  other_names VARCHAR(120) NULL,
  gender VARCHAR(45) NULL,
  phone_number VARCHAR(45) NULL,
  country_residence VARCHAR(45) NULL,
  state_residence VARCHAR(45) NULL,
  city_residence VARCHAR(45) NULL,
  address VARCHAR(255) NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NULL,
  status VARCHAR(45) NOT NULL,
  is_email_verified INT NOT NULL,
  email_verification_token VARCHAR(255) NULL
  )


CREATE UNIQUE INDEX email_UNIQUE ON users (email ASC);

-- Dropping Tables (deleting tables)
--DROP TABLE users;

--DML
-- To add data to the data base
-- a. By specifying the values to be inserted
INSERT INTO users (first_name, last_name, email,password, gender, phone_number, country_residence, state_residence, city_residence, address,email_verification_token,is_email_verified,status) VALUES ('Remilekun', 'Odegbami', 'remdev22@gmail.com','itmghn890', 'Female', '+234123456789','Nigeria', 'Oyo', 'Ibadan', 'Uni Ibadan','remdev22@gmailcomitmghn890',1,'Active');

-- SELECT USERS
--This selects all users
SELECT * FROM users LEFT JOIN role_user ON users.users_id=role_user.users_id LEFT JOIN roles on role_user.role_id=roles.role_id;

-- Select a users with roles
SELECT u.*,ru.*, (SELECT r.role_name from roles AS r  WHERE ru.role_id=r.role_id) AS role_name FROM users AS u LEFT JOIN role_user as ru ON u.users_id=ru.users_id
 
-- select by id
SELECT * From users WHERE users_id = 2;

-- Select a users with roles by user id
SELECT u.*,ru.*, (SELECT r.role_name from roles AS r  WHERE ru.role_id=r.role_id) AS role_name FROM users AS u LEFT JOIN role_user as ru ON u.users_id=ru.users_id WHERE users_id = 2;

-- select by email
SELECT u.*,ru.*, (SELECT r.role_name from roles AS r  WHERE ru.role_id=r.role_id) AS role_name FROM users AS u LEFT JOIN role_user as ru ON u.users_id=ru.users_id WHERE email = 'ifeayeni@gmail.com';


-- UPDATE USERS

UPDATE users SET last_name = 'Werr' WHERE users_id = 2;


-- DELETE FROM USERS
DELETE FROM users WHERE users_id = 8;

