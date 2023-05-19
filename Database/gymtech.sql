-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2023 at 04:26 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gymtech`
--

-- --------------------------------------------------------

--
-- Table structure for table `badge`
--

CREATE TABLE `badge` (
  `badge_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `image_url` varchar(200) DEFAULT NULL,
  `condition` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `badges_earned`
--

CREATE TABLE `badges_earned` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `badge_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `daily_workout`
--

CREATE TABLE `daily_workout` (
  `workout_name` varchar(20) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `ex_id` int(10) UNSIGNED NOT NULL,
  `set_number` int(10) UNSIGNED NOT NULL,
  `weight` int(10) UNSIGNED DEFAULT NULL,
  `reps` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `daily_workout`
--

INSERT INTO `daily_workout` (`workout_name`, `user_id`, `date`, `ex_id`, `set_number`, `weight`, `reps`) VALUES
('leg 1', 1, '2023-05-12', 22, 1, 50, 10),
('leg 1', 1, '2023-05-12', 23, 1, 50, 10),
('leg 1', 1, '2023-05-12', 22, 2, 50, 10),
('leg 1', 1, '2023-05-12', 23, 2, 50, 10),
('leg 1', 1, '2023-05-12', 22, 3, 50, 10),
('leg 1', 1, '2023-05-12', 23, 3, 50, 10),
('pull 1', 1, '2023-01-21', 1, 1, 35, 12),
('pull 1', 1, '2023-02-21', 1, 1, 40, 12),
('pull 1', 1, '2023-04-21', 1, 1, 35, 12),
('pull 1', 1, '2023-05-12', 1, 1, 25, 8),
('pull 1', 1, '2023-01-21', 2, 1, 55, 11),
('pull 1', 1, '2023-02-21', 2, 1, 30, 11),
('pull 1', 1, '2023-04-21', 2, 1, 35, 12),
('pull 1', 1, '2023-05-12', 2, 1, 50, 10),
('pull 1', 1, '2023-01-21', 1, 2, 50, 10),
('pull 1', 1, '2023-02-21', 1, 2, 50, 10),
('pull 1', 1, '2023-04-21', 1, 2, 40, 12),
('pull 1', 1, '2023-05-12', 1, 2, 25, 8),
('pull 1', 1, '2023-01-21', 2, 2, 35, 12),
('pull 1', 1, '2023-02-21', 2, 2, 35, 12),
('pull 1', 1, '2023-04-21', 2, 2, 30, 12),
('pull 1', 1, '2023-05-12', 2, 2, 50, 10),
('pull 1', 1, '2023-01-21', 1, 3, 35, 12),
('pull 1', 1, '2023-02-21', 1, 3, 50, 12),
('pull 1', 1, '2023-04-21', 1, 3, 35, 12),
('pull 1', 1, '2023-05-12', 1, 3, 25, 8),
('pull 1', 1, '2023-01-21', 2, 3, 40, 12),
('pull 1', 1, '2023-02-21', 2, 3, 35, 12),
('pull 1', 1, '2023-04-21', 2, 3, 40, 12),
('pull 1', 1, '2023-05-12', 2, 3, 50, 12),
('push 1', 1, '2023-05-12', 8, 1, 30, 8),
('push 1', 1, '2023-05-12', 9, 1, 30, 8),
('push 1', 1, '2023-05-12', 11, 1, 30, 8),
('push 1', 1, '2023-05-12', 8, 2, 30, 8),
('push 1', 1, '2023-05-12', 9, 2, 30, 8),
('push 1', 1, '2023-05-12', 11, 2, 30, 8),
('push 1', 1, '2023-05-12', 8, 3, 30, 8),
('push 1', 1, '2023-05-12', 9, 3, 30, 8),
('push 1', 1, '2023-05-12', 11, 3, 30, 8);

-- --------------------------------------------------------

--
-- Table structure for table `exercise`
--

CREATE TABLE `exercise` (
  `ex_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `image_url` varchar(200) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `target_muscle` varchar(50) DEFAULT NULL,
  `video_link` varchar(200) DEFAULT NULL,
  `calories_per_set` float(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `exercise`
--

INSERT INTO `exercise` (`ex_id`, `name`, `image_url`, `category`, `target_muscle`, `video_link`, `calories_per_set`) VALUES
(1, 'one arm dumbbell row', 'https://static.strengthlevel.com/images/illustrations/dumbbell-row-1000x1000.jpg', 'back', 'upper and lower back', 'https://fitnessprogramer.com/wp-content/uploads/2021/02/Dumbbell-Row.gif', 50.00),
(2, 'pull up', 'https://static.strengthlevel.com/images/illustrations/pull-ups-1000x1000.jpg', 'back', 'Latissimus dorsi', 'https://fitnessprogramer.com/wp-content/uploads/2021/02/Pull-up.gif', 56.00),
(3, 'bent over row', 'https://static.strengthlevel.com/images/illustrations/bent-over-row-1000x1000.jpg', 'back', 'Latissimus dorsi', 'https://www.inspireusafoundation.org/wp-content/uploads/2022/08/barbell-bent-over-row.gif', 58.00),
(4, 'deadlift', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSV6f369xK6oxy6shF7_D_OqblSLGoXwo-qmw&usqp=CAU', 'back', 'glutes and trapezius muscles', 'https://fitnessprogramer.com/wp-content/uploads/2021/02/Barbell-Romanian-Deadlift.gif', 65.00),
(5, 'T-bar row', 'https://static.strengthlevel.com/images/illustrations/t-bar-row-1000x1000.jpg', 'back', 'latissimus dorsi', 'https://fitnessprogramer.com/wp-content/uploads/2021/06/T-Bar-Row.gif', 60.00),
(6, 'seated cable row', 'https://static.strengthlevel.com/images/illustrations/seated-cable-row-1000x1000.jpg', 'back', 'upper back', 'https://fitnessprogramer.com/wp-content/uploads/2021/06/Seated-Cable-Rope-Row.gif', 50.00),
(7, 'pull down row', 'https://thefitnessstore.com/cdn/shop/products/DLAT-SF@2x.jpg?v=1627306573', 'back', 'lats', 'https://fitnessprogramer.com/wp-content/uploads/2021/02/Lat-Pulldown.gif', 62.00),
(8, 'overhead triceps extension', 'https://static.strengthlevel.com/images/illustrations/cable-overhead-tricep-extension-1000x1000.jpg', 'Triceps', 'long head of the triceps', 'https://fitnessprogramer.com/wp-content/uploads/2021/02/Dumbbell-Triceps-Extension.gif', 25.00),
(9, 'Push down', 'https://static.strengthlevel.com/images/illustrations/tricep-pushdown-1000x1000.jpg', 'Triceps', 'long head of the triceps', 'https://fitnessprogramer.com/wp-content/uploads/2021/02/Pushdown.gif', 30.00),
(10, 'close grip bench press', 'https://static.strengthlevel.com/images/illustrations/close-grip-bench-press-1000x1000.jpg', 'Triceps', 'anterior deltoids', 'https://www.inspireusafoundation.org/wp-content/uploads/2022/01/close-grip-bench-press-movement.gif', 32.00),
(11, 'incline bench press', 'https://static.strengthlevel.com/images/illustrations/incline-bench-press-1000x1000.jpg', 'Bench', 'upper pecs', 'https://fitnessprogramer.com/wp-content/uploads/2021/06/Smith-Machine-Incline-Bench-Press.gif', 65.00),
(12, 'flat bench press', 'https://s3assets.skimble.com/assets/2289486/image_iphone.jpg', 'Bench', 'pectoralis major', 'https://www.inspireusafoundation.org/wp-content/uploads/2022/04/barbell-bench-press.gif', 65.00),
(13, 'dumbbell fly flat', 'https://static.strengthlevel.com/images/illustrations/dumbbell-fly-1000x1000.jpg', 'Bench', 'anterior deltoid', 'https://www.inspireusafoundation.org/wp-content/uploads/2023/04/one-arm-dumbbell-fly.gif', 60.00),
(14, 'cable crossover', 'https://static.strengthlevel.com/images/illustrations/cable-fly-1000x1000.jpg', 'Bench', 'pectoralis major muscles sternal heads', 'https://fitnessprogramer.com/wp-content/uploads/2021/02/Cable-Crossover.gif', 50.00),
(15, 'push up', 'https://static.strengthlevel.com/images/illustrations/push-ups-1000x1000.jpg', 'Bench', 'pectoralis major muscles sternal heads', 'https://www.inspireusafoundation.org/wp-content/uploads/2022/05/weighted-push-up.gif', 55.00),
(16, 'cable lateral raise', 'https://static.strengthlevel.com/images/illustrations/cable-lateral-raise-1000x1000.jpg', 'Shoulder', 'the middle head of the deltoid muscle', 'https://www.inspireusafoundation.org/wp-content/uploads/2022/05/weighted-push-up.gif', 55.00),
(17, 'dumbbell shoulder press', 'https://static.strengthlevel.com/images/illustrations/dumbbell-shoulder-press-1000x1000.jpg', 'Shoulder', 'Shoulders', 'https://fitnessprogramer.com/wp-content/uploads/2021/02/Dumbbell-Shoulder-Press.gif', 50.00),
(18, 'parallel bar dips', 'https://www.burnthefatinnercircle.com/members/images/1084.jpg?cb=20230213050608', 'Shoulder', 'front deltoids', 'https://fitnessprogramer.com/wp-content/uploads/2022/04/parallel-bar-dip.gif', 48.00),
(19, 'bicep curl', 'https://static.strengthlevel.com/images/illustrations/cable-bicep-curl-1000x1000.jpg', 'Biceps', 'biceps brachii', 'https://i.pinimg.com/originals/7d/3c/de/7d3cdeed84c1c19ad372d5b25beffd08.gif', 35.00),
(20, 'hammer curl', 'https://static.strengthlevel.com/images/illustrations/cable-hammer-curl-1000x1000.jpg', 'Biceps', 'brachioradialis', 'https://fitnessprogramer.com/wp-content/uploads/2021/02/Hammer-Curl.gif', 32.00),
(21, 'spider curl', 'https://www.fitliferegime.com/wp-content/uploads/2022/06/Spider-Curl.jpg', 'Biceps', 'long head and short head', 'https://fitnessprogramer.com/wp-content/uploads/2022/02/Single-Dumbbell-Spider-Hammer-Curl.gif', 38.00),
(22, 'squats', 'https://static.strengthlevel.com/images/illustrations/squat-1000x1000.jpg', 'Legs', 'gluteus maximus', 'https://www.inspireusafoundation.org/wp-content/uploads/2021/06/bodyweight-squat-2.gif', 70.00),
(23, 'leg curl', 'https://static.strengthlevel.com/images/illustrations/lying-leg-curl-1000x1000.jpg', 'Legs', 'Hamstrings', 'https://www.inspireusafoundation.org/wp-content/uploads/2022/04/lying-leg-curl.gif', 55.00),
(24, 'leg extension', 'https://static.strengthlevel.com/images/illustrations/leg-extension-1000x1000.jpg', 'Legs', 'quadriceps', 'https://www.inspireusafoundation.org/wp-content/uploads/2021/06/leg-extension-machine.gif', 55.00),
(25, 'walking lunges', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwlTggbgT6GoyF5eIq8H7-7P32kncBDAllOw&usqp=CAU', 'Legs', 'quadriceps', 'https://fitnessprogramer.com/wp-content/uploads/2021/06/Bodyweight-Walking-Lunge.gif', 68.00);

-- --------------------------------------------------------

--
-- Table structure for table `gym`
--

CREATE TABLE `gym` (
  `name` varchar(20) NOT NULL,
  `location` varchar(50) DEFAULT NULL,
  `price/month` int(11) DEFAULT NULL,
  `working_hours` varchar(20) DEFAULT NULL,
  `rating` float(3,1) DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gym`
--

INSERT INTO `gym` (`name`, `location`, `price/month`, `working_hours`, `rating`, `link`) VALUES
('Golds gym', 'Alexandria', 1000, '10am-12am', 5.0, 'https://www.facebook.com/goldsgym'),
('Leader Gym', 'Louran', 700, '24 hours', 4.5, 'https://www.facebook.com/LeaderGymAlex'),
('Muscle Empire', 'Smouha', 800, '10am-12am', 4.5, 'https://www.facebook.com/MusclesEmpireGym'),
('Uphill gym', 'Saba Basha', 900, '24 hours', 4.5, 'https://www.facebook.com/uphill.gym');

-- --------------------------------------------------------

--
-- Table structure for table `progress`
--

CREATE TABLE `progress` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `workout_name` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `trained` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `progress`
--

INSERT INTO `progress` (`user_id`, `workout_name`, `date`, `trained`) VALUES
(1, 'pull 1', '2023-02-01', 1),
(1, 'pull 1', '2023-02-02', 1),
(1, 'pull 1', '2023-02-03', 1),
(1, 'pull 1', '2023-02-04', 1),
(1, 'pull 1', '2023-03-01', 1),
(1, 'pull 1', '2023-03-02', 1),
(1, 'pull 1', '2023-03-03', 1),
(1, 'pull 1', '2023-03-04', 1),
(1, 'pull 1', '2023-03-05', 1),
(1, 'pull 1', '2023-03-06', 1),
(1, 'pull 1', '2023-03-07', 1),
(1, 'pull 1', '2023-04-01', 1),
(1, 'pull 1', '2023-04-02', 1),
(1, 'pull 1', '2023-04-03', 1),
(1, 'pull 1', '2023-04-04', 1),
(1, 'pull 1', '2023-04-05', 1),
(1, 'pull 1', '2023-04-06', 1),
(1, 'pull 1', '2023-04-07', 1),
(1, 'pull 1', '2023-04-08', 1),
(1, 'pull 1', '2023-04-09', 1),
(1, 'pull 1', '2023-04-10', 1),
(1, 'pull 1', '2023-04-11', 1),
(1, 'pull 1', '2023-04-12', 1),
(1, 'pull 1', '2023-05-01', 1),
(1, 'pull 1', '2023-05-02', 1),
(1, 'pull 1', '2023-05-03', 1),
(1, 'pull 1', '2023-05-04', 1),
(1, 'pull 1', '2023-05-05', 1),
(1, 'pull 1', '2023-05-06', 1),
(1, 'pull 1', '2023-05-07', 1),
(1, 'pull 1', '2023-05-08', 1),
(1, 'pull 1', '2023-05-09', 1),
(1, 'pull 1', '2023-05-10', 1),
(1, 'pull 1', '2023-05-11', 1),
(1, '', '2023-05-12', 1),
(1, 'leg 1', '2023-05-12', 1),
(1, 'push 1', '2023-05-12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `recommendations`
--

CREATE TABLE `recommendations` (
  `recommendation_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `date` date DEFAULT NULL,
  `recommendation` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `fname` varchar(20) DEFAULT NULL,
  `lname` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `weight` float(5,2) DEFAULT NULL,
  `height` float(5,2) DEFAULT NULL,
  `target_weight` float(5,2) DEFAULT NULL,
  `daily_calories_burnt` float(6,2) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `age` int(10) UNSIGNED DEFAULT NULL,
  `suggested_calories_per_day` float(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `fname`, `lname`, `email`, `password`, `weight`, `height`, `target_weight`, `daily_calories_burnt`, `gender`, `age`, `suggested_calories_per_day`) VALUES
(1, 'Ali', 'Mekky', 'mekky@gmail.com', '$2a$10$Ic7JloslZvehbiHnT3mMwuVNbo2/QsZAgoSRa2tz7V.9RHjMlmmTi', 56.00, 165.00, 58.50, 0.00, 'M', 21, 1209.60);

-- --------------------------------------------------------

--
-- Table structure for table `workout`
--

CREATE TABLE `workout` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `ex_id` int(10) UNSIGNED NOT NULL,
  `workout_name` varchar(20) NOT NULL,
  `category` varchar(20) DEFAULT NULL,
  `number_of_sets` int(11) DEFAULT NULL,
  `total_calories` float(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `workout`
--

INSERT INTO `workout` (`user_id`, `ex_id`, `workout_name`, `category`, `number_of_sets`, `total_calories`) VALUES
(1, 22, 'leg 1', NULL, 3, 165.00),
(1, 23, 'leg 1', NULL, 3, 210.00),
(1, 1, 'pull 1', NULL, 3, 168.00),
(1, 2, 'pull 1', NULL, 3, 150.00),
(1, 8, 'push 1', NULL, 3, 75.00),
(1, 9, 'push 1', NULL, 3, 90.00),
(1, 11, 'push 1', NULL, 3, 195.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `badge`
--
ALTER TABLE `badge`
  ADD PRIMARY KEY (`badge_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `badges_earned`
--
ALTER TABLE `badges_earned`
  ADD PRIMARY KEY (`user_id`,`badge_id`),
  ADD KEY `badge_id` (`badge_id`);

--
-- Indexes for table `daily_workout`
--
ALTER TABLE `daily_workout`
  ADD PRIMARY KEY (`workout_name`,`user_id`,`set_number`,`ex_id`,`date`),
  ADD KEY `ex_id` (`ex_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `exercise`
--
ALTER TABLE `exercise`
  ADD PRIMARY KEY (`ex_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `gym`
--
ALTER TABLE `gym`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `progress`
--
ALTER TABLE `progress`
  ADD PRIMARY KEY (`user_id`,`date`,`workout_name`);

--
-- Indexes for table `recommendations`
--
ALTER TABLE `recommendations`
  ADD PRIMARY KEY (`recommendation_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `workout`
--
ALTER TABLE `workout`
  ADD PRIMARY KEY (`workout_name`,`user_id`,`ex_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `ex_id` (`ex_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `badge`
--
ALTER TABLE `badge`
  MODIFY `badge_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exercise`
--
ALTER TABLE `exercise`
  MODIFY `ex_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `recommendations`
--
ALTER TABLE `recommendations`
  MODIFY `recommendation_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `badges_earned`
--
ALTER TABLE `badges_earned`
  ADD CONSTRAINT `badges_earned_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `badges_earned_ibfk_2` FOREIGN KEY (`badge_id`) REFERENCES `badge` (`badge_id`);

--
-- Constraints for table `daily_workout`
--
ALTER TABLE `daily_workout`
  ADD CONSTRAINT `daily_workout_ibfk_1` FOREIGN KEY (`workout_name`) REFERENCES `workout` (`workout_name`),
  ADD CONSTRAINT `daily_workout_ibfk_2` FOREIGN KEY (`ex_id`) REFERENCES `workout` (`ex_id`),
  ADD CONSTRAINT `daily_workout_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `workout` (`user_id`);

--
-- Constraints for table `progress`
--
ALTER TABLE `progress`
  ADD CONSTRAINT `progress_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `recommendations`
--
ALTER TABLE `recommendations`
  ADD CONSTRAINT `recommendations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `workout`
--
ALTER TABLE `workout`
  ADD CONSTRAINT `workout_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `workout_ibfk_2` FOREIGN KEY (`ex_id`) REFERENCES `exercise` (`ex_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
