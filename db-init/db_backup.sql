USE `db`
;

/****** Remove Table Objects    Script Date: 12/14/2020 7:28:56 AM ******/
-- IF OBJECT_ID('dbo.tasks', 'u') IS NOT NULL
-- DROP TABLE `tasks`
-- IF OBJECT_ID('dbo.workorders', 'u') IS NOT NULL
-- DROP TABLE `workorders`
-- IF OBJECT_ID('dbo.comments', 'u') IS NOT NULL
-- DROP TABLE `comments`
-- IF OBJECT_ID('dbo.equipment', 'u') IS NOT NULL
-- DROP TABLE `equipment`
-- IF OBJECT_ID('dbo.reports', 'u') IS NOT NULL
-- DROP TABLE `reports`
-- IF OBJECT_ID('dbo.auth_roles', 'u') IS NOT NULL
-- DROP TABLE `auth_roles`
-- IF OBJECT_ID('dbo.auth_user_ci', 'u') IS NOT NULL
-- DROP TABLE `auth_user_ci`
-- IF OBJECT_ID('dbo.auth_user_ex', 'u') IS NOT NULL
-- DROP TABLE `auth_user_ex`
-- IF OBJECT_ID('dbo.auth_user_rl', 'u') IS NOT NULL
-- DROP TABLE `auth_user_rl`
-- IF OBJECT_ID('dbo.auth_user_sa', 'u') IS NOT NULL
-- DROP TABLE `auth_user_sa`
-- IF OBJECT_ID('dbo.auth_users', 'u') IS NOT NULL
-- DROP TABLE `auth_users`
-- ;

/****** Object:  Table `auth_roles`    Script Date: 12/14/2020 7:28:56 AM ******/


CREATE TABLE `auth_roles`(
	`id` int AUTO_INCREMENT NOT NULL,
	`role_name` varchar(255) NOT NULL,
PRIMARY KEY 
(
	`id` ASC
)
)
;

/****** Object:  Table `auth_user_ci`    Script Date: 12/14/2020 7:28:57 AM ******/


CREATE TABLE `auth_user_ci`(
	`id` int AUTO_INCREMENT NOT NULL,
	`user_id` int NOT NULL,
	`contact_type` varchar(255) NOT NULL,
	`contact_value` varchar(255) NULL,
	`sort_order` int NULL,
PRIMARY KEY 
(
	`id` ASC
)
)
;

/****** Object:  Table `auth_user_ex`    Script Date: 12/14/2020 7:28:57 AM ******/


CREATE TABLE `auth_user_ex`(
	`id` int AUTO_INCREMENT NOT NULL,
	`user_id` int NOT NULL,
	`prop_name` varchar(255) NOT NULL,
	`prop_value` varchar(255) NULL,
PRIMARY KEY 
(
	`id` ASC
)
)
;

/****** Object:  Table `auth_user_rl`    Script Date: 12/14/2020 7:28:57 AM ******/


CREATE TABLE `auth_user_rl`(
	`user_id` int NOT NULL,
	`role_id` int NOT NULL
)
;

/****** Object:  Table `auth_user_sa`    Script Date: 12/14/2020 7:28:57 AM ******/


CREATE TABLE `auth_user_sa`(
	`id` int AUTO_INCREMENT NOT NULL,
	`user_id` int NOT NULL,
	`start_date` datetime NULL,
	`end_date` datetime NULL,
	`is_available` int NULL,
	`entry_note` varchar(255) NULL,
PRIMARY KEY 
(
	`id` ASC
)
)
;

/****** Object:  Table `auth_users`    Script Date: 12/14/2020 7:28:57 AM ******/


CREATE TABLE `auth_users`(
	`id` int AUTO_INCREMENT NOT NULL,
	`username` varchar(255) NOT NULL,
	`passwd` varchar(255) NOT NULL,
	`fname` varchar(255) NULL,
	`lname` varchar(255) NULL,
	`notes` varchar(255) NULL,
	`schedule` varchar(255) NULL,
	`language` varchar(255) NULL,
	`badge` varchar(255) NULL,
PRIMARY KEY 
(
	`id` ASC
)
)
;

/****** Object:  Table `comments`    Script Date: 12/14/2020 7:28:57 AM ******/


CREATE TABLE `comments`(
	`id` int AUTO_INCREMENT NOT NULL,
	`note` text NULL,
	`t_stamp` datetime NULL,
	`identifier` varchar(75) NULL,
	`user_id` int NULL,
 CONSTRAINT `PK_comments` PRIMARY KEY 
(
	`id` ASC
)
)
;

/****** Object:  Table `equipment`    Script Date: 12/14/2020 7:28:57 AM ******/


CREATE TABLE `equipment`(
	`id` int AUTO_INCREMENT NOT NULL,
	`name` varchar(255) NULL,
	`description` text NULL,
 CONSTRAINT `PK_equipment` PRIMARY KEY 
(
	`id` ASC
)
)
;

/****** Object:  Table `reports`    Script Date: 12/14/2020 7:28:57 AM ******/


CREATE TABLE `reports`(
	`id` int AUTO_INCREMENT NOT NULL,
	`report_name` varchar(255) NOT NULL,
	`report_bytes` `varbinary`(max) NULL,
	`t_stamp` datetime NOT NULL,
 CONSTRAINT `PK_reports` PRIMARY KEY 
(
	`id` ASC
)
)
;

/****** Object:  Table `tasks`    Script Date: 12/14/2020 7:28:57 AM ******/


CREATE TABLE `tasks`(
	`id` int AUTO_INCREMENT NOT NULL,
	`name` varchar(255) NULL,
	`description` text NULL,
	`equipment_id` int NULL,
	`start_time` datetime NULL,
	`end_time` datetime NULL,
	`actual_start` datetime NULL,
	`actual_end` datetime NULL,
	`user_id` int NULL,
 CONSTRAINT `PK_tasks` PRIMARY KEY 
(
	`id` ASC
)
)
;

/****** Object:  Table `workorders`    Script Date: 12/14/2020 7:28:57 AM ******/


CREATE TABLE `workorders`(
	`id` int AUTO_INCREMENT NOT NULL,
	`name` varchar(255) NULL,
	`description` text NULL,
	`equipment_id` int NULL,
	`rating` double NULL,
	`user_id` int NULL,
 CONSTRAINT `PK_workorders` PRIMARY KEY 
(
	`id` ASC
)
)
;

/****** Table Inserts ******/

SET IDENTITY_INSERT `auth_roles` ON 
INSERT `auth_roles` (`id`, `role_name`) VALUES (1, N'Administrator')
INSERT `auth_roles` (`id`, `role_name`) VALUES (2, N'Operator')
SET IDENTITY_INSERT `auth_roles` OFF
;

SET IDENTITY_INSERT `auth_user_ci` ON 
INSERT `auth_user_ci` (`id`, `user_id`, `contact_type`, `contact_value`, `sort_order`) VALUES (1, 1, N'email', N'admin@acme.com', 0)
INSERT `auth_user_ci` (`id`, `user_id`, `contact_type`, `contact_value`, `sort_order`) VALUES (2, 2, N'email', N'UserA@acme.com', 0)
INSERT `auth_user_ci` (`id`, `user_id`, `contact_type`, `contact_value`, `sort_order`) VALUES (3, 3, N'email', N'UserB@acme.com', 0)
INSERT `auth_user_ci` (`id`, `user_id`, `contact_type`, `contact_value`, `sort_order`) VALUES (4, 4, N'email', N'UserC@acme.com', 0)
INSERT `auth_user_ci` (`id`, `user_id`, `contact_type`, `contact_value`, `sort_order`) VALUES (5, 5, N'email', N'UserD@acme.com', 0)
SET IDENTITY_INSERT `auth_user_ci` OFF
;

SET IDENTITY_INSERT `auth_user_ex` ON 
SET IDENTITY_INSERT `auth_user_ex` OFF
;

INSERT `auth_user_rl` (`user_id`, `role_id`) VALUES (1, 1)
INSERT `auth_user_rl` (`user_id`, `role_id`) VALUES (2, 2)
INSERT `auth_user_rl` (`user_id`, `role_id`) VALUES (3, 2)
INSERT `auth_user_rl` (`user_id`, `role_id`) VALUES (4, 2)
INSERT `auth_user_rl` (`user_id`, `role_id`) VALUES (5, 2)
;

SET IDENTITY_INSERT `auth_user_sa` ON 
SET IDENTITY_INSERT `auth_user_sa` OFF
;

SET IDENTITY_INSERT `auth_users` ON 
INSERT `auth_users` (`id`, `username`, `passwd`, `fname`, `lname`, `notes`, `schedule`, `language`, `badge`) VALUES (1, N'admin', N'W6ph5Mm5Pz8GgiULbPgzG37mj9g=', NULL, NULL, NULL, N'Always', N'en', NULL)
INSERT `auth_users` (`id`, `username`, `passwd`, `fname`, `lname`, `notes`, `schedule`, `language`, `badge`) VALUES (2, N'UserA', N'W6ph5Mm5Pz8GgiULbPgzG37mj9g=', NULL, NULL, NULL, N'Always', N'en', NULL)
INSERT `auth_users` (`id`, `username`, `passwd`, `fname`, `lname`, `notes`, `schedule`, `language`, `badge`) VALUES (3, N'UserB', N'W6ph5Mm5Pz8GgiULbPgzG37mj9g=', NULL, NULL, NULL, N'Always', N'en', NULL)
INSERT `auth_users` (`id`, `username`, `passwd`, `fname`, `lname`, `notes`, `schedule`, `language`, `badge`) VALUES (4, N'UserC', N'W6ph5Mm5Pz8GgiULbPgzG37mj9g=', NULL, NULL, NULL, N'Always', N'en', NULL)
INSERT `auth_users` (`id`, `username`, `passwd`, `fname`, `lname`, `notes`, `schedule`, `language`, `badge`) VALUES (5, N'UserD', N'W6ph5Mm5Pz8GgiULbPgzG37mj9g=', NULL, NULL, NULL, N'Always', N'en', NULL)
INSERT `auth_users` (`id`, `username`, `passwd`, `fname`, `lname`, `notes`, `schedule`, `language`, `badge`) VALUES (6, N'guest', N'W6ph5Mm5Pz8GgiULbPgzG37mj9g=', NULL, NULL, NULL, N'Always', N'en', NULL)
SET IDENTITY_INSERT `auth_users` OFF
;

SET IDENTITY_INSERT `comments` ON 
INSERT `comments` (`id`, `note`, `t_stamp`, `identifier`, `user_id`) VALUES (1, N'Test Note', CURRENT_TIMESTAMP, N'Overview', 1)
INSERT `comments` (`id`, `note`, `t_stamp`, `identifier`, `user_id`) VALUES (2, N'Section A Test', CURRENT_TIMESTAMP, N'Section A', 1)
INSERT `comments` (`id`, `note`, `t_stamp`, `identifier`, `user_id`) VALUES (3, N'Section B Test', CURRENT_TIMESTAMP, N'Section B', 1)
SET IDENTITY_INSERT `comments` OFF
;

SET IDENTITY_INSERT `equipment` ON 
INSERT `equipment` (`id`, `name`, `description`) VALUES (1, N'Machine 1', N'This is Machine 1')
INSERT `equipment` (`id`, `name`, `description`) VALUES (2, N'Machine 2', N'This is Machine 2')
INSERT `equipment` (`id`, `name`, `description`) VALUES (3, N'Machine 3', N'This is Machine 3')
INSERT `equipment` (`id`, `name`, `description`) VALUES (4, N'Machine 4', N'This is Machine 4')
SET IDENTITY_INSERT `equipment` OFF
;

SET IDENTITY_INSERT `reports` ON 
SET IDENTITY_INSERT `reports` OFF
;

SET IDENTITY_INSERT `tasks` OFF 
-- The below queries insert 4 tasks into the tasks database table for every weekday of the current calendar weekday.
-- The tasks always start at midnight and are always 4 hours long. 

-- Variable definitions

DECLARE @mondayMidnight DATETIME;
SET @mondayMidnight = (SELECT DATE_ADD(wk, DATEDIFF(wk,0,GETDATE()), 0) as mondayOfCurrentWeek);
DECLARE @tuesdayMidnight DATETIME;
SET @tuesdayMidnight = (SELECT DATE_ADD(dd, 1, @mondayMidnight) as tuesdayOfCurrentWeek);
DECLARE @wednesdayMidnight DATETIME;
SET @wednesdayMidnight = (SELECT DATE_ADD(dd, 2, @mondayMidnight) as wednesdayOfCurrentWeek);
DECLARE @thursdayMidnight DATETIME;
SET @thursdayMidnight = (SELECT DATE_ADD(dd, 3, @mondayMidnight) as thursdayOfCurrentWeek);
DECLARE @fridayMidnight DATETIME;
SET @fridayMidnight = (SELECT DATE_ADD(dd, 4, @mondayMidnight) as fridayOfCurrentWeek);
DECLARE @sundayMidnight DATETIME;
SET @sundayMidnight = (SELECT DATE_ADD(dd, -1, @mondayMidnight) as sundayOfPreviousWeek);
DECLARE @saturdayMidnight DATETIME;
SET @saturdayMidnight = (SELECT DATE_ADD(dd, -2, @mondayMidnight) as saturdayOfPreviousWeek);

--- Machine 1

-- Sunday Machine 1

INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'12 oz glass bottle', N'Producing 12 oz glass bottles', 1, DATE_ADD(hour, 0, @sundayMidnight), DATE_ADD(hour, 4, @sundayMidnight), DATE_ADD(minute, 5, @sundayMidnight), DATE_ADD(minute, 247, @sundayMidnight), 4)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'14 oz glass bottle', N'Producing 14 oz glass bottles', 1, DATE_ADD(hour, 5, @sundayMidnight), DATE_ADD(hour, 9, @sundayMidnight), DATE_ADD(minute, 303, @sundayMidnight), DATE_ADD(minute, 550, @sundayMidnight), 4)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'24 oz glass bottle', N'Producing 24 oz glass bottles', 1, DATE_ADD(hour, 10, @sundayMidnight), DATE_ADD(hour, 14, @sundayMidnight), DATE_ADD(minute, 606, @sundayMidnight), DATE_ADD(minute, 854, @sundayMidnight), 5)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'22 oz glass bottle', N'Producing 22 oz glass bottles', 1, DATE_ADD(hour, 15, @sundayMidnight), DATE_ADD(hour, 19, @sundayMidnight), DATE_ADD(minute, 910, @sundayMidnight), DATE_ADD(minute, 1136, @sundayMidnight), 5)

-- Monday Machine 1

INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'24 oz bottle', N'Producing 24 oz glass bottles', 1, DATE_ADD(hour, 0, @mondayMidnight), DATE_ADD(hour, 4, @mondayMidnight), DATE_ADD(minute, 0, @mondayMidnight), DATE_ADD(minute, 245, @mondayMidnight), 2)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'22 oz bottle', N'Producing 24 oz glass bottles', 1, DATE_ADD(hour, 5, @mondayMidnight), DATE_ADD(hour, 9, @mondayMidnight), DATE_ADD(minute, 310, @mondayMidnight), DATE_ADD(minute, 550, @mondayMidnight), 2)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'Changeover', N'Changeover from glass to plastic', 1, DATE_ADD(hour, 10, @mondayMidnight), DATE_ADD(hour, 14, @mondayMidnight), DATE_ADD(minute, 618, @mondayMidnight), DATE_ADD(minute, 850, @mondayMidnight), 3)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'1 liter plastic bottle', N'Producing 1 liter plastic bottles', 1, DATE_ADD(hour, 15, @mondayMidnight), DATE_ADD(hour, 19, @mondayMidnight), DATE_ADD(minute, 901, @mondayMidnight), DATE_ADD(minute, 1135, @mondayMidnight), 3)

-- Tuesday Machine 1

INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'1 liter plastic bottle', N'Producing 1 liter plastic bottles', 1, DATE_ADD(hour, 0, @tuesdayMidnight), DATE_ADD(hour, 4, @tuesdayMidnight), DATE_ADD(minute, 10, @tuesdayMidnight), DATE_ADD(minute, 245, @tuesdayMidnight), 4)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'2 liter plastic bottle', N'Producing 2 liter plastic bottles', 1, DATE_ADD(hour, 5, @tuesdayMidnight), DATE_ADD(hour, 9, @tuesdayMidnight), DATE_ADD(minute, 305, @tuesdayMidnight), NULL, 4)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'Biweekly Sanitize', N'Twice weekly machine sanitization', 1, DATE_ADD(hour, 10, @tuesdayMidnight), DATE_ADD(hour, 14, @tuesdayMidnight), NULL, NULL, 5)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'2 liter plastic bottle', N'Producing 2 liter plastic bottles', 1, DATE_ADD(hour, 15, @tuesdayMidnight), DATE_ADD(hour, 19, @tuesdayMidnight), NULL, NULL, 5)

-- Wednesday Machine 1

INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'2 liter plastic bottle', N'Producing 2 liter plastic bottles', 1, DATE_ADD(hour, 0, @wednesdayMidnight), DATE_ADD(hour, 4, @wednesdayMidnight), DATE_ADD(minute, 10, @wednesdayMidnight), DATE_ADD(minute, 245, @wednesdayMidnight), 2)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'Changeover', N'Changeover from plastic to glass', 1, DATE_ADD(hour, 5, @wednesdayMidnight), DATE_ADD(hour, 9, @wednesdayMidnight), DATE_ADD(minute, 305, @wednesdayMidnight), NULL, 2)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'12 oz bottle', N'Producing 12 oz glass bottles - brown', 1, DATE_ADD(hour, 10, @wednesdayMidnight), DATE_ADD(hour, 14, @wednesdayMidnight), NULL, NULL, 3)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'750 ml bottle', N'Producing 750 ml glass bottles - brown', 1, DATE_ADD(hour, 15, @wednesdayMidnight), DATE_ADD(hour, 19, @wednesdayMidnight), NULL, NULL, 3)

-- Thursday Machine 1

INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'750 ml bottle', N'Producing 750 ml glass bottles - brown', 1, DATE_ADD(hour, 0, @thursdayMidnight), DATE_ADD(hour, 4, @thursdayMidnight), NULL, NULL, 4)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'22 oz bottle', N'Producing 750 ml glass bottles - brown', 1, DATE_ADD(hour, 5, @thursdayMidnight), DATE_ADD(hour, 9, @thursdayMidnight), NULL, NULL, 4)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'Changeover', N'Changeover from brown to clear glass', 1, DATE_ADD(hour, 10, @thursdayMidnight), DATE_ADD(hour, 14, @thursdayMidnight), NULL, NULL, 5)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'12 oz bottle', N'Producing 12 oz glass bottles', 1, DATE_ADD(hour, 15, @thursdayMidnight), DATE_ADD(hour, 19, @thursdayMidnight), NULL, NULL, 5)

-- Friday Machine 1

INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'12 oz bottle', N'Producing 12 oz glass bottles', 1, DATE_ADD(hour, 0, @fridayMidnight), DATE_ADD(hour, 4, @fridayMidnight), NULL, NULL, 2)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'Biweekly Sanitize', N'Twice weekly machine sanitization', 1, DATE_ADD(hour, 5, @fridayMidnight), DATE_ADD(hour, 9, @fridayMidnight), NULL, NULL, 2)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'12 oz bottle', N'Producing 12 oz glass bottles', 1, DATE_ADD(hour, 10, @fridayMidnight), DATE_ADD(hour, 14, @fridayMidnight), NULL, NULL, 3)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'22 oz bottle', N'Producing 22 oz glass bottles', 1, DATE_ADD(hour, 15, @fridayMidnight), DATE_ADD(hour, 19, @fridayMidnight), NULL, NULL, 3)

--- Machine 2

-- Sunday Machine 2

INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'12 oz fill', N'Filling 12 oz', 2, DATE_ADD(hour, 1, @sundayMidnight), DATE_ADD(hour, 5, @sundayMidnight), DATE_ADD(minute, 70, @sundayMidnight), DATE_ADD(minute, 315, @sundayMidnight), 5)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'14 oz fill', N'Filling 14 oz', 2, DATE_ADD(hour, 6, @sundayMidnight), DATE_ADD(hour, 10, @sundayMidnight), DATE_ADD(minute, 360, @sundayMidnight), DATE_ADD(minute, 600, @sundayMidnight), 5)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'24 oz fill', N'Filling 24 oz', 2, DATE_ADD(hour, 11, @sundayMidnight), DATE_ADD(hour, 15, @sundayMidnight), DATE_ADD(minute, 660, @sundayMidnight), DATE_ADD(minute, 905, @sundayMidnight), 2)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'22 oz fill', N'Filling 22 oz', 2, DATE_ADD(hour, 16, @sundayMidnight), DATE_ADD(hour, 20, @sundayMidnight), DATE_ADD(minute, 960, @sundayMidnight), DATE_ADD(minute, 1214, @sundayMidnight), 2)

-- Monday Machine 2

INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'24 oz fill', N'Filling 24 oz', 2, DATE_ADD(hour, 1, @mondayMidnight), DATE_ADD(hour, 5, @mondayMidnight), DATE_ADD(minute, 65, @mondayMidnight), DATE_ADD(minute, 320, @mondayMidnight), 3)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'22 oz fill', N'Filling 22 oz', 2, DATE_ADD(hour, 6, @mondayMidnight), DATE_ADD(hour, 10, @mondayMidnight), DATE_ADD(minute, 355, @mondayMidnight), DATE_ADD(minute, 590, @mondayMidnight), 3)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'Changeover', N'Changeover glass to plastic fill', 2, DATE_ADD(hour, 11, @mondayMidnight), DATE_ADD(hour, 15, @mondayMidnight), DATE_ADD(minute, 655, @mondayMidnight), DATE_ADD(minute, 910, @mondayMidnight), 4)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'1 liter fill', N'Filling 1 liter', 2, DATE_ADD(hour, 16, @mondayMidnight), DATE_ADD(hour, 20, @mondayMidnight), DATE_ADD(minute, 965, @mondayMidnight), DATE_ADD(minute, 1190, @mondayMidnight), 4)

-- Tuesday Machine 2

INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'1 liter fill', N'Filling 1 liter', 2, DATE_ADD(hour, 1, @tuesdayMidnight), DATE_ADD(hour, 5, @tuesdayMidnight), DATE_ADD(minute, 65, @tuesdayMidnight), DATE_ADD(minute, 310, @tuesdayMidnight), 5)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'2 liter fill', N'Filling 2 liter', 2, DATE_ADD(hour, 6, @tuesdayMidnight), DATE_ADD(hour, 10, @tuesdayMidnight), DATE_ADD(minute, 355, @tuesdayMidnight), NULL, 5)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'Biweekly Sanitize', N'Twice weekly filler sanitization', 2, DATE_ADD(hour, 11, @tuesdayMidnight), DATE_ADD(hour, 15, @tuesdayMidnight), NULL, NULL, 2)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'2 liter fill', N'Filling 2 liter', 2, DATE_ADD(hour, 16, @tuesdayMidnight), DATE_ADD(hour, 20, @tuesdayMidnight), NULL, NULL, 2)

-- Wednesday Machine 2

INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'2 liter fill', N'Filling 2 liter', 2, DATE_ADD(hour, 1, @wednesdayMidnight), DATE_ADD(hour, 5, @wednesdayMidnight), DATE_ADD(minute, 65, @wednesdayMidnight), DATE_ADD(minute, 316, @wednesdayMidnight), 3)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'Changeover', N'Changeover from plastc to glass', 2, DATE_ADD(hour, 6, @wednesdayMidnight), DATE_ADD(hour, 10, @wednesdayMidnight), DATE_ADD(minute, 355, @wednesdayMidnight), NULL, 3)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'12 oz fill', N'Filling 2 liter', 2, DATE_ADD(hour, 11, @wednesdayMidnight), DATE_ADD(hour, 15, @wednesdayMidnight), NULL, NULL, 4)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'750 ml fill', N'Filling 750 ml', 2, DATE_ADD(hour, 16, @wednesdayMidnight), DATE_ADD(hour, 20, @wednesdayMidnight), NULL, NULL, 4)

-- Thursday Machine 2

INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'750 ml fill', N'Filling 750 ml', 2, DATE_ADD(hour, 1, @thursdayMidnight), DATE_ADD(hour, 5, @thursdayMidnight), NULL, NULL, 5)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'22 oz fill', N'Filling 22 oz', 2, DATE_ADD(hour, 6, @thursdayMidnight), DATE_ADD(hour, 10, @thursdayMidnight), NULL, NULL, 5)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'Changeover', N'Changeover from brown to clear glass', 2, DATE_ADD(hour, 11, @thursdayMidnight), DATE_ADD(hour, 15, @thursdayMidnight), NULL, NULL, 2)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'12 oz fill', N'Filling 12 oz', 2, DATE_ADD(hour, 16, @thursdayMidnight), DATE_ADD(hour, 20, @thursdayMidnight), NULL, NULL, 2)

-- Friday Machine 2

INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'12 oz fill', N'Filling 12 oz', 2, DATE_ADD(hour, 1, @fridayMidnight), DATE_ADD(hour, 5, @fridayMidnight), NULL, NULL, 3)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'Biweekly Sanitize', N'Twice weekly machine sanitization', 2, DATE_ADD(hour, 6, @fridayMidnight), DATE_ADD(hour, 10, @fridayMidnight), NULL, NULL, 3)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'12 oz fill', N'Filling 12 oz', 2, DATE_ADD(hour, 11, @fridayMidnight), DATE_ADD(hour, 15, @fridayMidnight), NULL, NULL, 4)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'22 oz fill', N'Filling 22 oz', 2, DATE_ADD(hour, 16, @fridayMidnight), DATE_ADD(hour, 20, @fridayMidnight), NULL, NULL, 4)

--- Machine 3

-- Sunday Machine 3

INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'CA Brew', N'CA Brew Face labels', 3, DATE_ADD(hour, 2, @sundayMidnight), DATE_ADD(hour, 5, @sundayMidnight), DATE_ADD(minute, 125, @sundayMidnight), DATE_ADD(minute, 250, @sundayMidnight), 2)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'Tahoe Seasonal', N'Tahoe Brewery Seasonal label', 3, DATE_ADD(hour, 6, @sundayMidnight), DATE_ADD(hour, 11, @sundayMidnight), DATE_ADD(minute, 306, @sundayMidnight), DATE_ADD(minute, 658, @sundayMidnight), 2)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'Corona Brew', N'2020 Edition labels', 3, DATE_ADD(hour, 12, @sundayMidnight), DATE_ADD(hour, 16, @sundayMidnight), DATE_ADD(minute, 723, @sundayMidnight), DATE_ADD(minute, 975, @sundayMidnight), 3)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'Munich Weiss', N'Munich Import Weissbier lables', 3, DATE_ADD(hour, 17, @sundayMidnight), DATE_ADD(hour, 22, @sundayMidnight), DATE_ADD(minute, 1020, @sundayMidnight), DATE_ADD(minute, 1320, @sundayMidnight), 3)

-- Monday Machine 3

INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'Munich Hefe', N'Munich Import Hefewisen lables', 3, DATE_ADD(hour, 2, @mondayMidnight), DATE_ADD(hour, 6, @mondayMidnight), DATE_ADD(minute, 120, @mondayMidnight), DATE_ADD(minute, 370, @mondayMidnight), 4)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'Dog and Pony Stout', N'Dog and Pony Stout lables', 3, DATE_ADD(hour, 7, @mondayMidnight), DATE_ADD(hour, 8, @mondayMidnight), DATE_ADD(minute, 420, @mondayMidnight), DATE_ADD(minute, 470, @mondayMidnight), 4)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'Changeover', N'Changeover sticker to wrap', 3, DATE_ADD(hour, 9, @mondayMidnight), DATE_ADD(hour, 15, @mondayMidnight), DATE_ADD(minute, 540, @mondayMidnight), DATE_ADD(minute, 915, @mondayMidnight), 5)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'CA Brew Wrap', N'CA Brew plastic full wrap', 3, DATE_ADD(hour, 16, @mondayMidnight), DATE_ADD(hour, 21, @mondayMidnight), DATE_ADD(minute, 963, @mondayMidnight), DATE_ADD(minute, 1267, @mondayMidnight), 5)

-- Tuesday Machine 3

INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'Porterific Wrap', N'Porterific Half bottle wrap', 3, DATE_ADD(hour, 2, @tuesdayMidnight), DATE_ADD(hour, 7, @tuesdayMidnight), DATE_ADD(minute, 120, @tuesdayMidnight), DATE_ADD(minute, 423, @tuesdayMidnight), 2)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'DownUnder Hefe Wrap', N'DownUnder Brewery Half bottle wrap', 3, DATE_ADD(hour, 8, @tuesdayMidnight), DATE_ADD(hour, 12, @tuesdayMidnight), DATE_ADD(minute, 482, @tuesdayMidnight), NULL, 2)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'Biweekly Sanitize', N'Twice weekly machine sanitization', 3, DATE_ADD(hour, 13, @tuesdayMidnight), DATE_ADD(hour, 18, @tuesdayMidnight), NULL, NULL, 3)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'DownUnder Hefe Wrap', N'DownUnder Brewery Half bottle wrap', 3, DATE_ADD(hour, 19, @tuesdayMidnight), DATE_ADD(hour, 23, @tuesdayMidnight), NULL, NULL, 3)

-- Wednesday Machine 3

INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'DownUnder Hefe Wrap', N'DownUnder Brewery Half bottle wrap', 3, DATE_ADD(hour, 1, @wednesdayMidnight), DATE_ADD(hour, 6, @wednesdayMidnight), DATE_ADD(minute, 58, @wednesdayMidnight), DATE_ADD(minute, 356, @wednesdayMidnight), 4)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'Changeover', N'Changeover wrap to sticker', 3, DATE_ADD(hour, 7, @wednesdayMidnight), DATE_ADD(hour, 10, @wednesdayMidnight), DATE_ADD(minute, 421, @wednesdayMidnight), NULL, 4)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'Big Poodle Label', N'Big Poodle brewing comically large labels', 3, DATE_ADD(hour, 11, @wednesdayMidnight), DATE_ADD(hour, 16, @wednesdayMidnight), NULL, NULL, 5)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'Little Dane Label', N'Little Dane Comically Small labels', 3, DATE_ADD(hour, 17, @wednesdayMidnight), DATE_ADD(hour, 20, @wednesdayMidnight), NULL, NULL, 5)

-- Thursday Machine 3

INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'Green Grass Label', N'Green Grass Brewing single color label', 3, DATE_ADD(hour, 2, @thursdayMidnight), DATE_ADD(hour, 4, @thursdayMidnight), NULL, NULL, 2)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'Green Grass Multi Label', N'Green Grass Brewing multi color label', 3, DATE_ADD(hour, 7, @thursdayMidnight), DATE_ADD(hour, 9, @thursdayMidnight), NULL, NULL, 2)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'Changeover', N'Changeover sticker to wrap', 3, DATE_ADD(hour, 12, @thursdayMidnight), DATE_ADD(hour, 14, @thursdayMidnight), NULL, NULL, 3)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'Natures Best Wrap', N'Now with biodegradable labels', 3, DATE_ADD(hour, 17, @thursdayMidnight), DATE_ADD(hour, 19, @thursdayMidnight), NULL, NULL, 3)

-- Friday Machine 3

INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'Ruinater Label', N'"What flavor is this?" paper label', 3, DATE_ADD(hour, 3, @fridayMidnight), DATE_ADD(hour, 4, @fridayMidnight), NULL, NULL, 4)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'Biweekly Sanitize', N'Twice weekly machine sanitization', 3, DATE_ADD(hour, 5, @fridayMidnight), DATE_ADD(hour, 9, @fridayMidnight), NULL, NULL, 4)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'Whatever Brand Label', N'Thats a dumb name for a beer.', 3, DATE_ADD(hour, 10, @fridayMidnight), DATE_ADD(hour, 15, @fridayMidnight), NULL, NULL, 5)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'CA Brew', N'Standard CA Brew label', 3, DATE_ADD(hour, 16, @fridayMidnight), DATE_ADD(hour, 21, @fridayMidnight), NULL, NULL, 5)

--- Machine 4

-- Sunday Machine 4

INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'6H', N'H pattern for 6 packs', 4, DATE_ADD(hour, 3, @sundayMidnight), DATE_ADD(hour, 7, @sundayMidnight), DATE_ADD(minute, 180, @sundayMidnight), DATE_ADD(minute, 430, @sundayMidnight), 2)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'6H', N'H pattern for 6 packs', 4, DATE_ADD(hour, 8, @sundayMidnight), DATE_ADD(hour, 12, @sundayMidnight), DATE_ADD(minute, 482, @sundayMidnight), DATE_ADD(minute, 716, @sundayMidnight), 2)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'4H', N'H pattern for 4 packs', 4, DATE_ADD(hour, 13, @sundayMidnight), DATE_ADD(hour, 17, @sundayMidnight), DATE_ADD(minute, 774, @sundayMidnight), DATE_ADD(minute, 1023, @sundayMidnight), 3)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'4D', N'D pattern for 4 packs', 4, DATE_ADD(hour, 18, @sundayMidnight), DATE_ADD(hour, 22, @sundayMidnight), DATE_ADD(minute, 1075, @sundayMidnight), DATE_ADD(minute, 1307, @sundayMidnight), 3)

-- Monday Machine 4

INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'4J', N'J pattern for 4 packs', 4, DATE_ADD(hour, 4, @mondayMidnight), DATE_ADD(hour, 7, @mondayMidnight), DATE_ADD(minute, 240, @mondayMidnight), DATE_ADD(minute, 434, @mondayMidnight), 4)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'4A', N'A pattern for 4 packs', 4, DATE_ADD(hour, 8, @mondayMidnight), DATE_ADD(hour, 14, @mondayMidnight), DATE_ADD(minute, 480, @mondayMidnight), DATE_ADD(minute, 840, @mondayMidnight), 4)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'Changeover', N'Changeover multi packs to bottles', 4, DATE_ADD(hour, 15, @mondayMidnight), DATE_ADD(hour, 20, @mondayMidnight), DATE_ADD(minute, 903, @mondayMidnight), DATE_ADD(minute, 1207, @mondayMidnight), 5)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'1C', N'C pattern for individuals', 4, DATE_ADD(hour, 21, @mondayMidnight), DATE_ADD(hour, 23, @mondayMidnight), DATE_ADD(minute, 1262, @mondayMidnight), DATE_ADD(minute, 1389, @mondayMidnight), 5)

-- Tuesday Machine 4

INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'1D', N'D pattern for individuals', 4, DATE_ADD(hour, 3, @tuesdayMidnight), DATE_ADD(hour, 8, @tuesdayMidnight), DATE_ADD(minute, 183, @tuesdayMidnight), DATE_ADD(minute, 487, @tuesdayMidnight), 2)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'1A', N'A pattern for individuals', 4, DATE_ADD(hour, 9, @tuesdayMidnight), DATE_ADD(hour, 13, @tuesdayMidnight), DATE_ADD(minute, 543, @tuesdayMidnight), NULL, 2)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'Biweekly Sanitize', N'Twice weekly machine sanitization', 4, DATE_ADD(hour, 14, @tuesdayMidnight), DATE_ADD(hour, 19, @tuesdayMidnight), NULL, NULL, 3)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'1C', N'C pattern for individuals', 4, DATE_ADD(hour, 20, @tuesdayMidnight), DATE_ADD(hour, 22, @tuesdayMidnight), NULL, NULL, 3)

-- Wednesday Machine 4

INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'1A', N'A pattern for individuals', 4, DATE_ADD(hour, 3, @wednesdayMidnight), DATE_ADD(hour, 7, @wednesdayMidnight), DATE_ADD(minute, 183, @wednesdayMidnight), DATE_ADD(minute, 427, @wednesdayMidnight), 4)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'Changeover', N'Changeover bottles to multi packs', 4, DATE_ADD(hour, 8, @wednesdayMidnight), DATE_ADD(hour, 12, @wednesdayMidnight), DATE_ADD(minute, 483, @wednesdayMidnight), NULL, 4)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'6K', N'K pattern for 6 packs', 4, DATE_ADD(hour, 13, @wednesdayMidnight), DATE_ADD(hour, 17, @wednesdayMidnight), NULL, NULL, 5)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'4J', N'J pattern for 4 packs', 4, DATE_ADD(hour, 18, @wednesdayMidnight), DATE_ADD(hour, 22, @wednesdayMidnight), NULL, NULL, 5)

-- Thursday Machine 4

INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'4J', N'J pattern for 4 packs', 4, DATE_ADD(hour, 1, @thursdayMidnight), DATE_ADD(hour, 6, @thursdayMidnight), NULL, NULL, 2)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'4L', N'L pattern for 4 packs', 4, DATE_ADD(hour, 7, @thursdayMidnight), DATE_ADD(hour, 12, @thursdayMidnight), NULL, NULL, 2)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'Changeover', N'Changeover downtime', 4, DATE_ADD(hour, 13, @thursdayMidnight), DATE_ADD(hour, 18, @thursdayMidnight), NULL, NULL, 3)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'4J', N'J pattern for 4 packs', 4, DATE_ADD(hour, 19, @thursdayMidnight), DATE_ADD(hour, 23, @thursdayMidnight), NULL, NULL, 3)

-- Friday Machine 4

INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'6H', N'H pattern for 6 packs', 4, DATE_ADD(hour, 2, @fridayMidnight), DATE_ADD(hour, 7, @fridayMidnight), NULL, NULL, 4)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'Biweekly Sanitize', N'Twice weekly machine sanitization', 4, DATE_ADD(hour, 8, @fridayMidnight), DATE_ADD(hour, 13, @fridayMidnight), NULL, NULL, 4)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'6H', N'H pattern for 6 packs', 4, DATE_ADD(hour, 15, @fridayMidnight), DATE_ADD(hour, 18, @fridayMidnight), NULL, NULL, 5)
INSERT `tasks` (`name`, `description`, `equipment_id`, `start_time`, `end_time`, `actual_start`, `actual_end`, `user_id`) VALUES 
(N'4D', N'D pattern for 4 packs', 4, DATE_ADD(hour, 19, @fridayMidnight), DATE_ADD(hour, 21, @fridayMidnight), NULL, NULL, 5)

-- End of Task Inserts --
SET IDENTITY_INSERT `tasks` OFF
;

SET IDENTITY_INSERT `workorders` OFF 
INSERT `workorders` (`name`, `description`, `equipment_id`, `rating`, `user_id`) VALUES (N'Calibrate', N'Sensor calibration on Equipment 1', 1, 10, 4)
INSERT `workorders` (`name`, `description`, `equipment_id`, `rating`, `user_id`) VALUES (N'Belt Repair', N'Main drive belt inspect.', 1, 60, 4)
INSERT `workorders` (`name`, `description`, `equipment_id`, `rating`, `user_id`) VALUES (N'Belt Repair', N'Main drive belt repair/replace.', 1, 90, 2)
INSERT `workorders` (`name`, `description`, `equipment_id`, `rating`, `user_id`) VALUES (N'Amperage Test', N'Main drive motor amperage test.', 1, 30, 2)
INSERT `workorders` (`name`, `description`, `equipment_id`, `rating`, `user_id`) VALUES (N'Calibrate', N'Sensor calibration on Equipment 2', 2, 10, 5)
INSERT `workorders` (`name`, `description`, `equipment_id`, `rating`, `user_id`) VALUES (N'Filler Leak', N'Inspect filler for damage/leaks.', 2, 75, 5)
INSERT `workorders` (`name`, `description`, `equipment_id`, `rating`, `user_id`) VALUES (N'Filler Overflow', N'Inspect filler controller. Determine overflow reason and repair. Possible PEBKAC', 2, 90, 2)
INSERT `workorders` (`name`, `description`, `equipment_id`, `rating`, `user_id`) VALUES (N'ID10T Training', N'Operator training - VPs son.', 2, 100, 3)
INSERT `workorders` (`name`, `description`, `equipment_id`, `rating`, `user_id`) VALUES (N'Calibrate', N'Sensor calibration on Equipment 3', 3, 10, 2)
INSERT `workorders` (`name`, `description`, `equipment_id`, `rating`, `user_id`) VALUES (N'Palletizer Manfunction', N'Determine malfunction root cause. Production stop.', 3, 90, 2)
INSERT `workorders` (`name`, `description`, `equipment_id`, `rating`, `user_id`) VALUES (N'Palletizer Pattern Upload', N'Upload new wrap patterns in Equip3 CLX.', 3, 25, 5)
INSERT `workorders` (`name`, `description`, `equipment_id`, `rating`, `user_id`) VALUES (N'Equipment 3 Operator Training', N'.', 3, 50, 5)
INSERT `workorders` (`name`, `description`, `equipment_id`, `rating`, `user_id`) VALUES (N'Calibrate', N'Sensor calibration on Equipment 4', 4, 15, 3)
INSERT `workorders` (`name`, `description`, `equipment_id`, `rating`, `user_id`) VALUES (N'Corker Refill Error', N'Refill tray sticks frequently, diagnose.', 4, 30, 3)
INSERT `workorders` (`name`, `description`, `equipment_id`, `rating`, `user_id`) VALUES (N'Replace Corker refil tray', N'New hopper/infeed tray.', 4, 60, 4)
INSERT `workorders` (`name`, `description`, `equipment_id`, `rating`, `user_id`) VALUES (N'Corker infeed upgrade', N'New tray did not work, add shaker motor.', 4, 70, 4)
SET IDENTITY_INSERT `workorders` OFF
;


/****** Foreign Keys    Script Date: 12/14/2020 7:29:08 AM ******/
ALTER TABLE `comments`  WITH CHECK ADD  CONSTRAINT FOREIGN KEY (`user_id`)
REFERENCES `auth_users` (`id`)
ON UPDATE CASCADE
ON DELETE CASCADE
;
ALTER TABLE `comments` CHECK CONSTRAINT `FK_comments_auth_users`
;

ALTER TABLE `tasks`  WITH CHECK ADD  CONSTRAINT FOREIGN KEY (`equipment_id`)
REFERENCES `equipment` (`id`)
ON UPDATE CASCADE
ON DELETE CASCADE
;
ALTER TABLE `tasks` CHECK CONSTRAINT `FK_tasks_equipment`
;

ALTER TABLE `tasks`  WITH CHECK ADD  CONSTRAINT FOREIGN KEY (`user_id`)
REFERENCES `auth_users` (`id`)
ON UPDATE CASCADE
ON DELETE CASCADE
;
ALTER TABLE `tasks` CHECK CONSTRAINT `FK_tasks_auth_users`
;