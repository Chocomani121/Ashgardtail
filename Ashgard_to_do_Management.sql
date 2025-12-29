CREATE TABLE `department` (
  `department_id` int PRIMARY KEY,
  `department_name` varchar(255),
  `creation_date` datetime
);

CREATE TABLE `members` (
  `member_id` int PRIMARY KEY,
  `department_id` int,
  `name` varchar(255),
  `account_type` varchar(255)
);

CREATE TABLE `project` (
  `project_id` int PRIMARY KEY,
  `department_id` int,
  `project_manager` int,
  `deadlines_id` datetime,
  `client_name` varchar(255),
  `project_status` varchar(255),
  `progress` varchar(255),
  `p_members_id` int
);

CREATE TABLE `project_members` (
  `p_members_id` int PRIMARY KEY,
  `member_id` int,
  `role` varchar(255),
  `generated_code` varchar(255),
  `assigned_date` datetime,
  `removed_date` datetime,
  `re_assigned_date` datetime
);

CREATE TABLE `task_tbl` (
  `task_id` int PRIMARY KEY,
  `deadline_id` datetime,
  `project_id` int,
  `p_members_id` int,
  `notes_id` int,
  `priority` varchar(255),
  `task_name` varchar(255),
  `task_description` text,
  `generated_code` varchar(255),
  `category` varchar(255),
  `progress` varchar(255)
);

CREATE TABLE `sub_task_list` (
  `sub_task_id` int PRIMARY KEY,
  `parent_task_id` int,
  `notes_id` int,
  `subtask_name` varchar(255),
  `generated_code` varchar(255),
  `checked_timestamp` datetime,
  `status` varchar(255),
  `is_checked` bool,
  `created_on` datetime
);

CREATE TABLE `notes_tbl` (
  `notes_id` int PRIMARY KEY,
  `generated_code` varchar(255),
  `reply_code` int,
  `note_body` text,
  `created_on` datetime,
  `edited_on` datetime,
  `pin_stat` bool,
  `pin_datetime` datetime
);

CREATE TABLE `deadlines_tbl` (
  `deadlines_id` datetime PRIMARY KEY,
  `start_date` datetime,
  `end_date` datetime,
  `created_on` datetime,
  `prev_date_id` int,
  `flag` varchar(255)
);

CREATE TABLE `prev_date_list` (
  `prev_date_id` int PRIMARY KEY,
  `prev_date_actual` datetime,
  `created_on` datetime
);

ALTER TABLE `members` ADD FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`);

ALTER TABLE `project` ADD FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`);

ALTER TABLE `project` ADD FOREIGN KEY (`project_manager`) REFERENCES `members` (`member_id`);

ALTER TABLE `project` ADD FOREIGN KEY (`deadlines_id`) REFERENCES `deadlines_tbl` (`deadlines_id`);

ALTER TABLE `project` ADD FOREIGN KEY (`p_members_id`) REFERENCES `project_members` (`p_members_id`);

ALTER TABLE `project_members` ADD FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`);

ALTER TABLE `task_tbl` ADD FOREIGN KEY (`deadline_id`) REFERENCES `deadlines_tbl` (`deadlines_id`);

ALTER TABLE `task_tbl` ADD FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`);

ALTER TABLE `task_tbl` ADD FOREIGN KEY (`p_members_id`) REFERENCES `project_members` (`p_members_id`);

ALTER TABLE `task_tbl` ADD FOREIGN KEY (`notes_id`) REFERENCES `notes_tbl` (`notes_id`);

ALTER TABLE `sub_task_list` ADD FOREIGN KEY (`parent_task_id`) REFERENCES `task_tbl` (`task_id`);

ALTER TABLE `sub_task_list` ADD FOREIGN KEY (`notes_id`) REFERENCES `notes_tbl` (`notes_id`);

ALTER TABLE `deadlines_tbl` ADD FOREIGN KEY (`prev_date_id`) REFERENCES `prev_date_list` (`prev_date_id`);
