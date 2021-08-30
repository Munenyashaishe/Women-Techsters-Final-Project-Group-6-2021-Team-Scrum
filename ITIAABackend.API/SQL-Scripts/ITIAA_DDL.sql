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


-- -----------------------------------------------------
-- Table itiaa.role
-- -----------------------------------------------------

CREATE TABLE roles 
(
  role_id INT PRIMARY KEY IDENTITY(1,1),
  role_name VARCHAR(45) NOT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NULL,
)


-- -----------------------------------------------------
-- Table itiaa.role_user
-- -----------------------------------------------------
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


-- -----------------------------------------------------
-- Table itiaa.login_log
-- -----------------------------------------------------

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

