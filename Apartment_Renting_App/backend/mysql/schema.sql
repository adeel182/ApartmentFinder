-- =============================================
-- File name: schema.py
-- Description:
-- Author: Team-13
-- Submission: Spring-2019
-- Instructor: Dragutin Petkovic
-- =============================================

DROP DATABASE IF EXISTS CSC648;
CREATE DATABASE CSC648;
USE CSC648;

CREATE TABLE USER
(
  user_id     INT PRIMARY KEY AUTO_INCREMENT,
  username    VARCHAR(100) UNIQUE NOT NULL,
  password    VARCHAR(100) NOT NULL,
  email       VARCHAR(50),
  role        INTEGER NOT NULL DEFAULT 1,
  isStudent   BOOLEAN,
  isBanned    BOOLEAN DEFAULT FALSE
);

CREATE TABLE  LISTINGS
(
  house_id    INT PRIMARY KEY AUTO_INCREMENT,
  landlord_id   INT NOT NULL REFERENCES USER(user_id),
  house_name  VARCHAR(100),
  type        VARCHAR(100),
  description VARCHAR(1000),
  price       VARCHAR(100),
  size        VARCHAR(100),
  distance    VARCHAR(100),
  number      VARCHAR(100),
  street      VARCHAR(100),
  city        VARCHAR(30),
  state       CHAR(20),
  zipcode     CHAR(5),
  image_url   VARCHAR(500),
  bedroom_count   VARCHAR(100),
  bathroom_count  VARCHAR(100),
  parking_count   VARCHAR(100),
  isAvailable BOOLEAN DEFAULT TRUE,
  create_date DATE,
  approved    BOOLEAN DEFAULT FALSE,
  deleted     BOOLEAN DEFAULT FALSE
);

CREATE TABLE  ORDERS
(
  house_id    INT NOT NULL REFERENCES LISTINGS(house_id),
  landlord_id INT NOT NULL REFERENCES USER(user_id),
  customer_id INT NOT NULL REFERENCES USER(user_id),
  create_date DATE
);

CREATE TABLE PENDING_REQUEST
(
  house_id    INT NOT NULL REFERENCES LISTINGS(house_id),
  landlord_id INT NOT NULL REFERENCES USER(user_id),
  customer_id INT NOT NULL REFERENCES USER(user_id),
  create_date DATE,
  status      INT DEFAULT 0
);

CREATE TABLE MESSAGE
(
  landlord_id INT NOT NULL REFERENCES USER(user_id),
  customer_id INT NOT NULL REFERENCES USER(user_id),
  house_id    INT NOT NULL REFERENCES LISTINGS(house_id),
  sender      VARCHAR(100) NOT NULL REFERENCES USER(username),
  message     VARCHAR(500),
  date        DATE
);


INSERT INTO USER (username, password, email, role, isStudent) VALUES
('kim', 'pbkdf2:sha256:50000$9XWLJGwo$6678202a64d3f2ff73112b52e5abf13abf55d7d7644649d3294d2db4ada8751e', 'kim@gmail.com', 2, TRUE),
('alex', 'pbkdf2:sha256:50000$haxl4dtL$0698478436cd3820cd1c24216fe11771b29162a62dbd0e09e8b71ac46a973ee0', 'alex@gmail.com', 1, TRUE),
('sindy', 'pbkdf2:sha256:50000$cznvRDRP$8cae4da3a9c6f0271033239fd3557b0b284dc475e20372ed0e0f9a05ccdfa776', 'sindy@gmail.com', 1, TRUE),
('daniel', 'pbkdf2:sha256:50000$AmTDRb0B$4a5816a363e041c03fa8016ca63799c1e3cba32ab1cda9f260f0b26262c09423', 'daniel@gmail.com', 1, TRUE);



INSERT INTO LISTINGS (landlord_id, house_name, type, description, price, size, distance, number, street, city, state, zipcode, image_url, bedroom_count, bathroom_count, parking_count, isAvailable, create_date, approved) VALUES
(3, 'Foster', 'House','This is my fantastic house in foster city',1200, 500, 15.4, 861, 'Sanbarra st', 'Foster City', 'CA', 94404, 'Foster_1.jpg Foster_2.jpg', 2, 2, 2, TRUE, NOW(), TRUE),
(2, 'South SF', 'Apartment','Beautiful brand new house in South SF with spacious bedroom', 1000, 300, 2.4, 181, 'Fremont st', 'San Francisco', 'CA', 94105, 'SF_1.jpeg', 1, 1, 1, TRUE, NOW(), TRUE),
(2, 'Downtown SF', 'Condo','Room at the heat of SF', 1500, 500, 8, 201, 'Van Ness Ave', 'San Francisco', 'CA', 94102, 'Downtown_SF_1.jpg Downtown_SF_2.jpg', 2, 1.5, 2, TRUE, NOW(), TRUE),
(4, 'Single room near SJSU', 'Single room','Nice room near SJSU', 500, 300, 50, 868, 'S 5th st', 'San Jose', 'CA', 95112, '', 1, 1, 1, TRUE, NOW(), TRUE);



INSERT INTO MESSAGE (landlord_id, customer_id, house_id, sender, message, date) VALUES
(2, 4, 2, 2, 'Hi Alex, my name is Daniel. Im interested in renting your apartment in South SF', NOW()),
(3, 2, 1, 1, 'Hi Kim, my name is Alex. Im interested in renting your house in Foster City, and I would like to schedule a tour', NOW());


INSERT INTO ORDERS (house_id, landlord_id, customer_id, create_date) VALUES
(3, 2, 3, NOW());