DROP DATABASE IF EXISTS GYMTECH;
CREATE DATABASE GYMTECH;
USE GYMTECH;

CREATE TABLE `USER`(
    user_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    fname VARCHAR(20),
    lname VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    `password` VARCHAR(100),
    `weight` FLOAT(5,2),
    `height` FLOAT(5,2),
    `target_weight` FLOAT(5,2),
    `daily_calories_burnt` FLOAT(6,2),
    gender CHAR(1),
    age INT UNSIGNED,
    `suggested_calories_per_day` FLOAT(6,2)
);

CREATE TABLE EXERCISE(
    ex_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) UNIQUE,
    image_url VARCHAR(200),
    category VARCHAR(20),
    target_muscle VARCHAR(50),
    video_link VARCHAR(200),
    calories_per_set FLOAT(6,2)
);

CREATE TABLE BADGE(
    badge_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(20) UNIQUE,
    image_url VARCHAR(200),
    `condition` VARCHAR(100)
);

CREATE TABLE WORKOUT(
    user_id INT UNSIGNED,
    ex_id INT UNSIGNED,
    workout_name VARCHAR(20),
    category VARCHAR(20),
    number_of_sets INT,
    total_calories FLOAT(6,2),
    constraint keying PRIMARY KEY (workout_name, user_id, ex_id)
);
-- FOREIGN KEYS

CREATE TABLE DAILY_WORKOUT(
    workout_name VARCHAR(20),
    user_id INT UNSIGNED,
    `date`  DATE,
    ex_id INT UNSIGNED,
    set_number INT UNSIGNED,
    `weight` INT UNSIGNED,
    reps INT UNSIGNED,
    constraint keying PRIMARY KEY (workout_name,user_id, set_number, ex_id, `date`) 
);
-- FOREIGN KEYS

CREATE TABLE PROGRESS(
    user_id INT UNSIGNED,
    workout_name VARCHAR(20),
    `date`  DATE,
    trained TINYINT, -- 0 for false and 1 for true
    constraint keying PRIMARY KEY (user_id, `date`, workout_name)
);
-- FOREIGN KEYS

CREATE TABLE BADGES_EARNED(
    user_id INT UNSIGNED,
    badge_id INT UNSIGNED,
    constraint keying PRIMARY KEY (user_id, badge_id)
);
-- FOREIGN KEYS

CREATE TABLE GYM(
    `name` VARCHAR(20) PRIMARY KEY,
    `location` VARCHAR(50),
    `price/month` INT,
    working_hours VARCHAR(20),
    rating FLOAT(3,1),
    link VARCHAR(100)
);

CREATE TABLE RECOMMENDATIONS(
    recommendation_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    user_id INT UNSIGNED,
    `date`  DATE,
    recommendation VARCHAR(200)
);
-- FOREIGN KEYS

ALTER TABLE WORKOUT ADD FOREIGN KEY (user_id) REFERENCES USER (user_id);
ALTER TABLE WORKOUT ADD FOREIGN KEY (ex_id) REFERENCES EXERCISE (ex_id);
ALTER TABLE PROGRESS ADD FOREIGN KEY (user_id) REFERENCES USER (user_id);
ALTER TABLE BADGES_EARNED ADD FOREIGN KEY (user_id) REFERENCES USER (user_id);
ALTER TABLE BADGES_EARNED ADD FOREIGN KEY (badge_id) REFERENCES BADGE (badge_id);
ALTER TABLE RECOMMENDATIONS ADD FOREIGN KEY (user_id) REFERENCES USER (user_id);
ALTER TABLE DAILY_WORKOUT ADD FOREIGN KEY (workout_name) REFERENCES WORKOUT (workout_name);
ALTER TABLE DAILY_WORKOUT ADD FOREIGN KEY (ex_id) REFERENCES WORKOUT (ex_id);
ALTER TABLE DAILY_WORKOUT ADD FOREIGN KEY (user_id) REFERENCES WORKOUT (user_id);
