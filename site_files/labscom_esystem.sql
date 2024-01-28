-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 27, 2024 at 09:25 PM
-- Server version: 10.6.16-MariaDB-cll-lve
-- PHP Version: 8.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `labscom_esystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_calendars`
--

CREATE TABLE `academic_calendars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `title` varchar(512) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `session_year_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(128) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `table_type` varchar(191) DEFAULT NULL,
  `table_id` bigint(20) UNSIGNED DEFAULT NULL,
  `session_year_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `title`, `description`, `table_type`, `table_id`, `session_year_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Assisgnment created', 'Check the last lesson', 'App\\Models\\SubjectTeacher', 1, 1, '2024-01-27 14:01:47', '2024-01-27 14:01:47', NULL),
(2, 'test alaa', 'test', 'App\\Models\\SubjectTeacher', 1, 1, '2024-01-27 19:51:28', '2024-01-27 19:51:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_section_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `instructions` varchar(1024) DEFAULT NULL,
  `due_date` datetime NOT NULL,
  `points` int(11) DEFAULT NULL,
  `resubmission` tinyint(1) NOT NULL DEFAULT 0,
  `extra_days_for_resubmission` int(11) DEFAULT NULL,
  `session_year_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`id`, `class_section_id`, `subject_id`, `name`, `instructions`, `due_date`, `points`, `resubmission`, `extra_days_for_resubmission`, `session_year_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 1, 'Practice counting', 'listen to the you tube of the lesson', '2024-06-27 14:01:00', 100, 1, 100, 1, '2024-01-27 14:01:19', '2024-01-27 14:01:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `assignment_submissions`
--

CREATE TABLE `assignment_submissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `assignment_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `session_year_id` int(11) NOT NULL,
  `feedback` text DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = Pending/In Review , 1 = Accepted , 2 = Rejected , 3 = Resubmitted',
  `editing` bigint(20) DEFAULT 1 COMMENT '0 - uneditable 1 - editable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assignment_submissions`
--

INSERT INTO `assignment_submissions` (`id`, `assignment_id`, `student_id`, `session_year_id`, `feedback`, `points`, `status`, `editing`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 2, 1, NULL, NULL, 0, 0, '2024-01-27 17:34:12', '2024-01-27 18:00:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_section_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `session_year_id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '0=Absent, 1=Present',
  `date` date NOT NULL,
  `remark` varchar(512) NOT NULL,
  `status` bigint(20) DEFAULT 0 COMMENT '0 - not send 1 - send',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(512) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'SC', 1, '2024-01-25 17:18:15', '2024-01-25 17:18:15', NULL),
(2, 'ST', 1, '2024-01-25 17:18:15', '2024-01-25 17:18:15', NULL),
(3, 'OBC', 1, '2024-01-25 17:18:15', '2024-01-25 17:18:15', NULL),
(4, 'General', 1, '2024-01-25 17:18:15', '2024-01-25 17:18:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chat_files`
--

CREATE TABLE `chat_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message_id` bigint(20) UNSIGNED DEFAULT NULL,
  `file_name` varchar(191) NOT NULL,
  `file_type` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_members`
--

CREATE TABLE `chat_members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `chat_room_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `modal_type` varchar(191) NOT NULL,
  `modal_id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED DEFAULT NULL,
  `body` text DEFAULT NULL,
  `date` datetime DEFAULT '2024-01-27 23:45:32',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_rooms`
--

CREATE TABLE `chat_rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(512) NOT NULL,
  `medium_id` int(11) NOT NULL,
  `stream_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shift_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `name`, `medium_id`, `stream_id`, `shift_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '9', 2, NULL, NULL, '2024-01-25 17:18:15', '2024-01-25 17:18:15', NULL),
(2, '10', 2, NULL, NULL, '2024-01-25 17:18:15', '2024-01-25 17:18:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `class_sections`
--

CREATE TABLE `class_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class_sections`
--

INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, '2024-01-25 17:18:15', '2024-01-25 17:18:15', NULL),
(2, 1, 2, '2024-01-25 17:18:15', '2024-01-25 17:18:15', NULL),
(3, 2, 1, '2024-01-25 17:18:15', '2024-01-25 17:18:15', NULL),
(4, 2, 2, '2024-01-25 17:18:15', '2024-01-25 17:18:15', NULL),
(5, 2, 3, '2024-01-25 17:18:15', '2024-01-25 17:18:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `class_subjects`
--

CREATE TABLE `class_subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL COMMENT 'Compulsory / Elective',
  `subject_id` int(11) NOT NULL,
  `elective_subject_group_id` int(11) DEFAULT NULL COMMENT 'if type=Elective',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class_subjects`
--

INSERT INTO `class_subjects` (`id`, `class_id`, `type`, `subject_id`, `elective_subject_group_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 'Compulsory', 1, NULL, NULL, NULL, NULL),
(2, 2, 'Compulsory', 2, NULL, NULL, NULL, NULL),
(3, 2, 'Compulsory', 3, NULL, NULL, NULL, NULL),
(4, 2, 'Compulsory', 7, NULL, NULL, NULL, NULL),
(5, 2, 'Compulsory', 8, NULL, NULL, NULL, NULL),
(6, 2, 'Elective', 5, 1, NULL, NULL, NULL),
(7, 2, 'Elective', 6, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `class_teachers`
--

CREATE TABLE `class_teachers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_section_id` bigint(20) UNSIGNED DEFAULT NULL,
  `class_teacher_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class_teachers`
--

INSERT INTO `class_teachers` (`id`, `class_section_id`, `class_teacher_id`, `created_at`, `updated_at`) VALUES
(1, 4, 2, '2024-01-27 13:57:05', '2024-01-27 13:57:05');

-- --------------------------------------------------------

--
-- Table structure for table `elective_subject_groups`
--

CREATE TABLE `elective_subject_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `total_subjects` int(11) NOT NULL,
  `total_selectable_subjects` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `elective_subject_groups`
--

INSERT INTO `elective_subject_groups` (`id`, `total_subjects`, `total_selectable_subjects`, `class_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, 2, '2024-01-27 12:51:37', '2024-01-27 12:51:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `session_year_id` int(11) NOT NULL,
  `publish` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_classes`
--

CREATE TABLE `exam_classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `exam_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_marks`
--

CREATE TABLE `exam_marks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `exam_timetable_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `obtained_marks` int(11) NOT NULL,
  `teacher_review` varchar(1024) DEFAULT NULL,
  `passing_status` tinyint(1) NOT NULL COMMENT '1=Pass, 0=Fail',
  `session_year_id` int(11) NOT NULL,
  `grade` tinytext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_results`
--

CREATE TABLE `exam_results` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `exam_id` int(11) NOT NULL,
  `class_section_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `total_marks` int(11) NOT NULL,
  `obtained_marks` int(11) NOT NULL,
  `percentage` double(8,2) NOT NULL,
  `grade` tinytext NOT NULL,
  `session_year_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_timetables`
--

CREATE TABLE `exam_timetables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `exam_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `total_marks` int(11) NOT NULL,
  `passing_marks` int(11) NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `session_year_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fees_choiceables`
--

CREATE TABLE `fees_choiceables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `fees_type_id` int(11) DEFAULT NULL,
  `is_due_charges` tinyint(4) NOT NULL COMMENT '0 - no 1 - yes',
  `total_amount` double NOT NULL,
  `session_year_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `payment_transaction_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` bigint(20) DEFAULT 0 COMMENT '0 - not paid 1 - paid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fees_classes`
--

CREATE TABLE `fees_classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_id` int(11) NOT NULL,
  `fees_type_id` int(11) NOT NULL,
  `choiceable` tinyint(4) NOT NULL COMMENT '0 - no 1 - yes',
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fees_paids`
--

CREATE TABLE `fees_paids` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `mode` smallint(6) DEFAULT NULL COMMENT '0 - cash 1 - cheque 2 - online',
  `payment_transaction_id` varchar(191) DEFAULT NULL,
  `cheque_no` varchar(191) DEFAULT NULL,
  `total_amount` double NOT NULL,
  `is_fully_paid` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 - no 1 - yes',
  `date` date NOT NULL,
  `session_year_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fees_types`
--

CREATE TABLE `fees_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `modal_type` varchar(191) NOT NULL,
  `modal_id` bigint(20) UNSIGNED NOT NULL,
  `file_name` varchar(1024) DEFAULT NULL,
  `file_thumbnail` varchar(1024) DEFAULT NULL,
  `type` tinytext NOT NULL COMMENT '1 = File Upload, 2 = Youtube Link, 3 = Video Upload, 4 = Other Link',
  `file_url` varchar(1024) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `modal_type`, `modal_id`, `file_name`, `file_thumbnail`, `type`, `file_url`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'App\\Models\\Lesson', 1, 'Counting', 'lessons/1706349574-sm_6574d1c35fa55.jpg', '2', 'https://www.youtube.com/watch?v=bGetqbqDVaA', '2024-01-27 13:59:34', '2024-01-27 13:59:34', NULL),
(2, 'App\\Models\\Lesson', 1, 'Extra', NULL, '1', 'lessons/FSE8kxlYEzCCLear6aevhvxxNhyv0VmL7CYDYR9Y.pdf', '2024-01-27 14:25:41', '2024-01-27 14:25:41', NULL),
(4, 'App\\Models\\AssignmentSubmission', 1, 'Screenshot_20240123_163836.jpg', NULL, '1', 'assignment/oSE6zo3QPhX9q4B3C1H2pdCbqkGXGVc79fK87IkF.jpg', '2024-01-27 18:00:22', '2024-01-27 18:00:22', NULL),
(5, 'App\\Models\\Announcement', 2, 'Screenshot_20240123_163836.jpg', NULL, '1', 'announcement/fGn8Yk6xJ7MwqY1v6y7ASpxHRS5oP31D97W0nu3p.jpg', '2024-01-27 19:51:28', '2024-01-27 19:51:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `form_fields`
--

CREATE TABLE `form_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `type` varchar(128) NOT NULL COMMENT 'text,number,textarea,dropdown,checkbox,radio,fileupload',
  `is_required` tinyint(4) NOT NULL DEFAULT 0,
  `default_values` text DEFAULT NULL COMMENT 'values of radio,checkbox,dropdown,etc',
  `other` text DEFAULT NULL COMMENT 'extra HTML attributes',
  `rank` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `starting_range` int(11) NOT NULL,
  `ending_range` int(11) NOT NULL,
  `grade` tinytext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `title` varchar(128) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `installment_fees`
--

CREATE TABLE `installment_fees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `due_date` date NOT NULL,
  `due_charges` int(11) NOT NULL COMMENT 'in percentage (%)',
  `session_year_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(512) NOT NULL,
  `code` varchar(64) NOT NULL,
  `file` varchar(512) NOT NULL,
  `is_rtl` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=>active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(512) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `class_section_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `name`, `description`, `class_section_id`, `subject_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Counting to 100', 'This lesson will teach students how to count to 100', 3, 1, '2024-01-27 13:59:34', '2024-01-27 13:59:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lesson_topics`
--

CREATE TABLE `lesson_topics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lesson_topics`
--

INSERT INTO `lesson_topics` (`id`, `lesson_id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'count to 50', 'first , counting from 0 to 50', '2024-01-27 14:00:05', '2024-01-27 14:00:05', NULL),
(2, 1, 'count to 100', 'count from 50 to 100', '2024-01-27 14:00:28', '2024-01-27 14:00:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mediums`
--

CREATE TABLE `mediums` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(512) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mediums`
--

INSERT INTO `mediums` (`id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Arabic', NULL, '2024-01-25 17:18:15', '2024-01-25 17:18:15'),
(2, 'British', NULL, '2024-01-25 17:18:15', '2024-01-25 17:18:15'),
(3, 'American', NULL, '2024-01-25 17:18:15', '2024-01-25 17:18:15');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_04_01_044234_create_settings_table', 1),
(6, '2022_04_01_091033_create_permission_tables', 1),
(7, '2022_04_01_105826_all_tables', 1),
(8, '2022_04_27_072441_parent_changes', 1),
(9, '2022_04_28_105419_add_day_name_to_timetables_table', 1),
(10, '2022_04_29_164836_add_class_section_id_to_timetables', 1),
(11, '2022_05_03_053843_add_lesson_files', 1),
(12, '2022_05_06_071034_create_holidays_table', 1),
(13, '2022_05_11_063841_add_sliders', 1),
(14, '2022_05_13_041458_add_date_to_session_years_table', 1),
(15, '2022_05_16_045021_add_class_secion_id_to_attendances', 1),
(16, '2022_05_19_053446_add_fcm_id_to_users', 1),
(17, '2022_05_31_133456_add_reset_request_to_users', 1),
(18, '2022_06_03_060653_create_student_sessions_table', 1),
(19, '2022_06_07_065946_create_languages_table', 1),
(20, '2022_07_18_044243_is_rtl_in_language', 1),
(21, '2022_07_25_103347_create_exams_table', 1),
(22, '2022_11_11_065720_fees_module', 1),
(23, '2022_12_08_044452_generate_roll_number', 1),
(24, '2022_12_12_033204_online_exam_module', 1),
(25, '2023_02_14_164618_update_online_exam_to_class_section', 1),
(26, '2023_06_02_100137_change_fee_choiceable_to_class', 1),
(27, '2023_06_02_100328_create_installment_fees_table', 1),
(28, '2023_06_05_104000_create_paid_installment_fees_table', 1),
(29, '2023_07_04_095806_create_streams_table', 1),
(30, '2023_07_06_101005_add_column_stream_id_in_classes_table', 1),
(31, '2023_07_11_095636_create_class_teachers_table', 1),
(32, '2023_07_11_101343_drop_column_class_teacher_id_from_class_sections', 1),
(33, '2023_07_14_092845_create_shifts_table', 1),
(34, '2023_07_18_101604_add_column_shift_id_in_classes', 1),
(35, '2023_07_25_123007_drop_column_deleted_at_from_class_teachers', 1),
(36, '2023_09_23_131406_add_column_status_in_fees_choiceables', 1),
(37, '2023_09_23_131627_add_column_status', 1),
(38, '2023_09_26_123001_add_column_status_in_assignment_submissions', 1),
(39, '2023_10_11_165326_create_dynamic_form_fields', 1),
(40, '2023_10_18_115940_create_notifications', 1),
(41, '2023_10_19_161317_add_column_device_type_in_users_table', 1),
(42, '2023_10_20_105920_drop_column_in_notifications', 1),
(43, '2023_10_23_110510_create_user_notifications', 1),
(44, '2023_10_27_153258_add_column_is_custom_in_notifications', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(29, 'App\\Models\\User', 8),
(29, 'App\\Models\\User', 9),
(30, 'App\\Models\\User', 8),
(30, 'App\\Models\\User', 9),
(31, 'App\\Models\\User', 8),
(31, 'App\\Models\\User', 9),
(37, 'App\\Models\\User', 8),
(37, 'App\\Models\\User', 9),
(38, 'App\\Models\\User', 8),
(38, 'App\\Models\\User', 9),
(39, 'App\\Models\\User', 8),
(39, 'App\\Models\\User', 9),
(40, 'App\\Models\\User', 8),
(40, 'App\\Models\\User', 9),
(109, 'App\\Models\\User', 9);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 8),
(2, 'App\\Models\\User', 9),
(3, 'App\\Models\\User', 5),
(4, 'App\\Models\\User', 6);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(128) NOT NULL,
  `type` varchar(128) NOT NULL,
  `message` varchar(128) NOT NULL,
  `send_to` int(11) NOT NULL,
  `image` varchar(512) DEFAULT NULL,
  `date` datetime NOT NULL,
  `is_custom` bigint(20) DEFAULT NULL COMMENT '1-custom, 0-autogenerated',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `title`, `type`, `message`, `send_to`, `image`, `date`, `is_custom`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'New assignment added in Maths', 'assignment', 'Practice counting', 3, NULL, '2024-01-27 14:01:19', 0, '2024-01-27 14:01:19', '2024-01-27 14:01:19', NULL),
(2, 'New submission', 'assignment_submission', 'Reem Ghamidi submitted their assignment.', 2, NULL, '2024-01-27 17:34:12', 0, '2024-01-27 17:34:12', '2024-01-27 17:34:12', NULL),
(3, 'Assignment Edited', 'assignment_submission', 'Reem Ghamidi edited their assignment.', 2, NULL, '2024-01-27 18:00:22', 0, '2024-01-27 18:00:22', '2024-01-27 18:00:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `online_exams`
--

CREATE TABLE `online_exams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(128) NOT NULL,
  `exam_key` bigint(20) NOT NULL,
  `duration` int(11) NOT NULL COMMENT 'in minutes',
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `session_year_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_exam_questions`
--

CREATE TABLE `online_exam_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_subject_id` bigint(20) UNSIGNED NOT NULL,
  `question_type` tinyint(4) NOT NULL COMMENT '0 - simple 1 - equation based',
  `question` varchar(1024) NOT NULL,
  `image_url` varchar(1024) DEFAULT NULL,
  `note` varchar(1024) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_exam_question_answers`
--

CREATE TABLE `online_exam_question_answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `answer` bigint(20) UNSIGNED NOT NULL COMMENT 'option id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_exam_question_choices`
--

CREATE TABLE `online_exam_question_choices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `online_exam_id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `marks` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_exam_question_options`
--

CREATE TABLE `online_exam_question_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `option` varchar(1024) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_exam_student_answers`
--

CREATE TABLE `online_exam_student_answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `online_exam_id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL COMMENT 'online exam question choice id',
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `submitted_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paid_installment_fees`
--

CREATE TABLE `paid_installment_fees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL,
  `installment_fee_id` bigint(20) UNSIGNED NOT NULL,
  `session_year_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double(8,2) NOT NULL,
  `due_charges` double(8,2) DEFAULT NULL,
  `date` date NOT NULL,
  `payment_transaction_id` bigint(20) UNSIGNED NOT NULL,
  `status` bigint(20) DEFAULT 0 COMMENT '0 - not paid 1 - paid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parents`
--

CREATE TABLE `parents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `first_name` varchar(128) NOT NULL,
  `last_name` varchar(128) NOT NULL,
  `gender` varchar(16) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `mobile` varchar(16) NOT NULL,
  `occupation` varchar(128) NOT NULL,
  `image` varchar(1024) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parents`
--

INSERT INTO `parents` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `email`, `mobile`, `occupation`, `image`, `dob`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'Othman', 'Amiri', 'Male', 'father@gmail.com', '1234567890', 'Accountant', 'parents/user.png', NULL, '2024-01-25 17:18:16', '2024-01-25 17:18:16', NULL),
(2, 3, 'Khalid', 'AbdulAzeem', 'Male', 'guardian@gmail.com', '1234567890', 'Business owner', 'parents/user.png', NULL, '2024-01-25 17:18:16', '2024-01-25 17:18:16', NULL),
(3, 5, 'Amira', 'Sultan', 'Female', 'example_mother@gmail.com', '982667637633', 'Nurse', 'parents/1706343785-woman.jpg', '1991-02-18', '2024-01-27 12:23:06', '2024-01-27 12:23:06', NULL),
(4, 5, 'Mohsen', 'Sultan', 'Male', 'example_father@gmail.com', '982667637633', 'Teacher', 'parents/1706343785-woman.jpg', '1991-02-18', '2024-01-27 12:23:06', '2024-01-27 12:23:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_transactions`
--

CREATE TABLE `payment_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `mode` smallint(6) NOT NULL DEFAULT 2 COMMENT '0 - cash 1 - cheque 2 - online',
  `cheque_no` varchar(191) DEFAULT NULL,
  `type_of_fee` smallint(6) NOT NULL DEFAULT 0 COMMENT '0 - compulosry_full , 1 - installments , 2 -optional',
  `payment_gateway` smallint(6) DEFAULT NULL COMMENT '1 - razorpay 2 - stripe',
  `order_id` varchar(191) DEFAULT NULL COMMENT 'order_id / payment_intent_id',
  `payment_id` varchar(191) DEFAULT NULL,
  `payment_signature` varchar(191) DEFAULT NULL,
  `payment_status` tinyint(4) NOT NULL COMMENT '0 - failed 1 - succeed 2 - pending',
  `total_amount` double NOT NULL,
  `date` datetime DEFAULT NULL,
  `session_year_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'role-list', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(2, 'role-create', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(3, 'role-edit', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(4, 'role-delete', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(5, 'medium-list', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(6, 'medium-create', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(7, 'medium-edit', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(8, 'medium-delete', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(9, 'section-list', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(10, 'section-create', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(11, 'section-edit', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(12, 'section-delete', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(13, 'class-list', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(14, 'class-create', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(15, 'class-edit', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(16, 'class-delete', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(17, 'subject-list', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(18, 'subject-create', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(19, 'subject-edit', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(20, 'subject-delete', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(21, 'teacher-list', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(22, 'teacher-create', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(23, 'teacher-edit', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(24, 'teacher-delete', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(25, 'class-teacher-list', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(26, 'class-teacher-create', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(27, 'class-teacher-edit', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(28, 'class-teacher-delete', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(29, 'parents-list', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(30, 'parents-create', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(31, 'parents-edit', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(32, 'parents-delete', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(33, 'session-year-list', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(34, 'session-year-create', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(35, 'session-year-edit', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(36, 'session-year-delete', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(37, 'student-list', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(38, 'student-create', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(39, 'student-edit', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(40, 'student-delete', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(41, 'category-list', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(42, 'category-create', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(43, 'category-edit', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(44, 'category-delete', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(45, 'subject-teacher-list', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(46, 'subject-teacher-create', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(47, 'subject-teacher-edit', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(48, 'subject-teacher-delete', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(49, 'timetable-list', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(50, 'timetable-create', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(51, 'timetable-edit', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(52, 'timetable-delete', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(53, 'attendance-list', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(54, 'attendance-create', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(55, 'attendance-edit', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(56, 'attendance-delete', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(57, 'holiday-list', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(58, 'holiday-create', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(59, 'holiday-edit', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(60, 'holiday-delete', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(61, 'announcement-list', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(62, 'announcement-create', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(63, 'announcement-edit', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(64, 'announcement-delete', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(65, 'slider-list', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(66, 'slider-create', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(67, 'slider-edit', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(68, 'slider-delete', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(69, 'class-timetable', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(70, 'teacher-timetable', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(71, 'student-assignment', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(72, 'subject-lesson', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(73, 'class-attendance', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(74, 'exam-create', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(75, 'exam-list', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(76, 'exam-edit', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(77, 'exam-delete', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(78, 'exam-upload-marks', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(79, 'setting-create', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(80, 'fcm-setting-create', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(81, 'assignment-create', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(82, 'assignment-list', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(83, 'assignment-edit', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(84, 'assignment-delete', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(85, 'assignment-submission', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(86, 'email-setting-create', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(87, 'privacy-policy', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(88, 'contact-us', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(89, 'about-us', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(90, 'student-reset-password', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(91, 'reset-password-list', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(92, 'student-change-password', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(93, 'promote-student-list', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(94, 'promote-student-create', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(95, 'promote-student-edit', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(96, 'promote-student-delete', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(97, 'language-list', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(98, 'language-create', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(99, 'language-edit', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(100, 'language-delete', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(101, 'lesson-list', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(102, 'lesson-create', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(103, 'lesson-edit', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(104, 'lesson-delete', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(105, 'topic-list', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(106, 'topic-create', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(107, 'topic-edit', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(108, 'topic-delete', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(109, 'class-teacher', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(110, 'terms-condition', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(111, 'assign-class-to-new-student', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(112, 'exam-timetable-create', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(113, 'grade-create', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(114, 'update-admin-profile', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(115, 'exam-result', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(116, 'fees-type', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(117, 'fees-classes', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(118, 'fees-paid', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(119, 'fees-config', 'web', '2024-01-25 17:17:07', '2024-01-25 17:17:07'),
(120, 'manage-online-exam', 'web', '2024-01-25 17:17:08', '2024-01-25 17:17:08'),
(121, 'stream-list', 'web', '2024-01-25 17:17:08', '2024-01-25 17:17:08'),
(122, 'stream-create', 'web', '2024-01-25 17:17:08', '2024-01-25 17:17:08'),
(123, 'stream-edit', 'web', '2024-01-25 17:17:08', '2024-01-25 17:17:08'),
(124, 'stream-delete', 'web', '2024-01-25 17:17:08', '2024-01-25 17:17:08'),
(125, 'shift-list', 'web', '2024-01-25 17:17:08', '2024-01-25 17:17:08'),
(126, 'shift-create', 'web', '2024-01-25 17:17:08', '2024-01-25 17:17:08'),
(127, 'shift-edit', 'web', '2024-01-25 17:17:08', '2024-01-25 17:17:08'),
(128, 'shift-delete', 'web', '2024-01-25 17:17:08', '2024-01-25 17:17:08'),
(129, 'form-field-list', 'web', '2024-01-25 17:17:08', '2024-01-25 17:17:08'),
(130, 'form-field-create', 'web', '2024-01-25 17:17:08', '2024-01-25 17:17:08'),
(131, 'form-field-edit', 'web', '2024-01-25 17:17:08', '2024-01-25 17:17:08'),
(132, 'form-field-delete', 'web', '2024-01-25 17:17:08', '2024-01-25 17:17:08'),
(133, 'notification-list', 'web', '2024-01-25 17:17:08', '2024-01-25 17:17:08'),
(134, 'notification-create', 'web', '2024-01-25 17:17:08', '2024-01-25 17:17:08'),
(135, 'notification-edit', 'web', '2024-01-25 17:17:08', '2024-01-25 17:17:08'),
(136, 'notification-delete', 'web', '2024-01-25 17:17:08', '2024-01-25 17:17:08');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 2, 'Mahmoud', '32c94a648e8d4861c3d665310c1ee4e9b0f67cd3356137ad0c8df14e1effc9cb', '[\"*\"]', NULL, '2024-01-26 20:35:11', '2024-01-26 20:35:11'),
(2, 'App\\Models\\User', 2, 'Mahmoud', 'cffa4dfc3e40a8708e1092b36670ff755bf3e837bb4117f9ee0bace8a263da20', '[\"*\"]', NULL, '2024-01-26 20:47:02', '2024-01-26 20:47:02'),
(3, 'App\\Models\\User', 2, 'Mahmoud', '15df5d1a3402bc58788b99f46011291a566fc7e080d35147475042063a47f9cd', '[\"*\"]', NULL, '2024-01-26 20:50:22', '2024-01-26 20:50:22'),
(4, 'App\\Models\\User', 2, 'Mahmoud', '7b9a084fc8da046ab7bcc52ae04fd6dec0975ce9b61426d59679ef1caa65ec46', '[\"*\"]', NULL, '2024-01-26 20:50:29', '2024-01-26 20:50:29'),
(5, 'App\\Models\\User', 2, 'Mahmoud', 'ab2530c20b944d3cae15f4f11594b8bcae62fa9fabf7bda99b4dc516abb0c610', '[\"*\"]', NULL, '2024-01-26 21:16:19', '2024-01-26 21:16:19'),
(6, 'App\\Models\\User', 2, 'Mahmoud', '8e72d601b6b92942cb2814e718fbab82ac1f8ad005376b801fcd7bfb6c50d5f5', '[\"*\"]', NULL, '2024-01-26 21:16:46', '2024-01-26 21:16:46'),
(7, 'App\\Models\\User', 2, 'Mahmoud', 'f99d8b3348701db14a4211671f6388092f304e09ded03f3e335948425c71a4ea', '[\"*\"]', NULL, '2024-01-26 21:17:27', '2024-01-26 21:17:27'),
(8, 'App\\Models\\User', 2, 'Mahmoud', '241738a27f2219567c65f1280a27a0d9f164416d690e3dacceaaf0eb4e2ccf3e', '[\"*\"]', NULL, '2024-01-26 21:37:28', '2024-01-26 21:37:28'),
(9, 'App\\Models\\User', 2, 'Mahmoud', 'f3409e43521d8bdf883d1d36bd9ee83853cb79ac7e6b52da61318f4fb58e1e55', '[\"*\"]', NULL, '2024-01-26 21:40:55', '2024-01-26 21:40:55'),
(10, 'App\\Models\\User', 2, 'Mahmoud', '77f42a3dc025697a4ff572b8aaf9747e38b849a35e219cad8b023e38101fe48b', '[\"*\"]', NULL, '2024-01-26 21:42:25', '2024-01-26 21:42:25'),
(11, 'App\\Models\\User', 2, 'Mahmoud', '4fd1d554d445c5ed62292e11a6edec9e5689439d0b3285e6fa29e41c189b0486', '[\"*\"]', NULL, '2024-01-26 21:43:19', '2024-01-26 21:43:19'),
(12, 'App\\Models\\User', 2, 'Mahmoud', '2fb90d333e328cf66537127f5f10361a0272fec5e455b40545902b693e9e7944', '[\"*\"]', NULL, '2024-01-26 21:47:54', '2024-01-26 21:47:54'),
(13, 'App\\Models\\User', 2, 'Mahmoud', 'b71d90beb5934dc7a1389546eacf3786870a1d7be495e2c9027b7578b5a2a512', '[\"*\"]', NULL, '2024-01-26 21:49:10', '2024-01-26 21:49:10'),
(14, 'App\\Models\\User', 2, 'Mahmoud', '8c98ca6406bf5f7f75611fef544c66d578432f2289bcfeb36c52e7a9d1ffb9ee', '[\"*\"]', NULL, '2024-01-26 21:50:56', '2024-01-26 21:50:56'),
(15, 'App\\Models\\User', 2, 'Mahmoud', '9b23461b5bd5202b875ada9df76e9b0e7714dd60461e3f88cdc8af530afcd50c', '[\"*\"]', NULL, '2024-01-26 21:51:05', '2024-01-26 21:51:05'),
(16, 'App\\Models\\User', 2, 'Mahmoud', '9d77dc3d8f1657eb8acdabdbd708130a5e7503b23b7b97b3b3d86aedde70e570', '[\"*\"]', NULL, '2024-01-26 21:52:39', '2024-01-26 21:52:39'),
(17, 'App\\Models\\User', 2, 'Mahmoud', '925ebec2472543efe0c6ca5d211ec0b161cdeca51cadf002f527943e06cbf8d8', '[\"*\"]', NULL, '2024-01-26 21:53:54', '2024-01-26 21:53:54'),
(18, 'App\\Models\\User', 2, 'Mahmoud', '4091dd548c978e80cdcdf04468ea6c6d7a877cced4fa3c734707a5f581806f24', '[\"*\"]', NULL, '2024-01-26 21:54:45', '2024-01-26 21:54:45'),
(19, 'App\\Models\\User', 2, 'Mahmoud', 'aef67cc7da881769cc0dc1fdd84a3affc4f248ef139aaf7a192a7bef212e5c9e', '[\"*\"]', NULL, '2024-01-26 21:55:37', '2024-01-26 21:55:37'),
(20, 'App\\Models\\User', 2, 'Mahmoud', '51b7d7b122e814a7ee23af8120a7fa550edaf604c2abd76a74216787e2bd4f2a', '[\"*\"]', NULL, '2024-01-26 21:56:43', '2024-01-26 21:56:43'),
(21, 'App\\Models\\User', 2, 'Mahmoud', '79910c3746ec671109729e387e6c78ea9bbd18f892551f01d9e7015ad850d7f3', '[\"*\"]', NULL, '2024-01-26 21:57:29', '2024-01-26 21:57:29'),
(22, 'App\\Models\\User', 2, 'Mahmoud', '9eb474ae427129a215d02338f4fd5a8b34a06f09f3feab260bcb8b8d9e8dcc5e', '[\"*\"]', NULL, '2024-01-26 22:00:36', '2024-01-26 22:00:36'),
(23, 'App\\Models\\User', 2, 'Mahmoud', '0b884b4a0a694fdaa7387e0ac7b845db20e8ffb0168d9c165f0138662086759b', '[\"*\"]', NULL, '2024-01-26 22:01:33', '2024-01-26 22:01:33'),
(24, 'App\\Models\\User', 2, 'Mahmoud', '46ab091ecccfe210f70caae3f08b744e443cf292098c04fb8fb45c433c94090e', '[\"*\"]', NULL, '2024-01-26 22:02:21', '2024-01-26 22:02:21'),
(25, 'App\\Models\\User', 2, 'Mahmoud', 'e953b5f6017f79212e9df08e706e025a6ecfa25d48d303431c99ad64cf368766', '[\"*\"]', NULL, '2024-01-26 22:02:32', '2024-01-26 22:02:32'),
(26, 'App\\Models\\User', 2, 'Mahmoud', 'e965f00ec264d377d8e33f961667e5186c325a503c4a5d876e50488171d612d5', '[\"*\"]', NULL, '2024-01-26 22:03:11', '2024-01-26 22:03:11'),
(27, 'App\\Models\\User', 2, 'Mahmoud', '1ed79ce0f67c2f1e103c28b8d091ef99e7ceb2303fd0b04b6e0d755b50ff460c', '[\"*\"]', NULL, '2024-01-26 22:03:40', '2024-01-26 22:03:40'),
(28, 'App\\Models\\User', 2, 'Mahmoud', '1503ea430da69e95181531905ed773b40e7f8985bf1bebfdc885d705730620ee', '[\"*\"]', NULL, '2024-01-26 22:03:57', '2024-01-26 22:03:57'),
(29, 'App\\Models\\User', 2, 'Mahmoud', 'bf502182cacae32b29be7fabaa1f31a2aa73def94f492d4447529c8135a47adb', '[\"*\"]', NULL, '2024-01-26 22:04:38', '2024-01-26 22:04:38'),
(30, 'App\\Models\\User', 2, 'Mahmoud', '0173a082f50aaf2d944826c4b69c15c6b354876d7c1143c2cef8e26e91451c4f', '[\"*\"]', NULL, '2024-01-26 22:05:24', '2024-01-26 22:05:24'),
(31, 'App\\Models\\User', 2, 'Mahmoud', '7ac9a10900b01208dfa8bb4307c49b987195c45f80dfd15404abb5b7f3f38a28', '[\"*\"]', NULL, '2024-01-26 22:06:49', '2024-01-26 22:06:49'),
(32, 'App\\Models\\User', 2, 'Mahmoud', '6515b0eca14a62dea8c994a3c9531c3a19eb829acb3e78f218899d18ac8aad94', '[\"*\"]', NULL, '2024-01-26 22:07:37', '2024-01-26 22:07:37'),
(33, 'App\\Models\\User', 2, 'Mahmoud', 'e9e8f61842fc68cea3d58273eda903aa67d83f592433eae545e5da3634a1a214', '[\"*\"]', NULL, '2024-01-26 22:08:29', '2024-01-26 22:08:29'),
(34, 'App\\Models\\User', 2, 'Mahmoud', 'abacb049d085c2189a844277667274e3946151dcb59e1efdd64db9204d3d168d', '[\"*\"]', NULL, '2024-01-26 22:08:53', '2024-01-26 22:08:53'),
(35, 'App\\Models\\User', 2, 'Mahmoud', '67e372a1b75fc641d1d0f038e090068cf38c2112a5b4e2c96c388a68a4d8e7ee', '[\"*\"]', NULL, '2024-01-26 22:10:15', '2024-01-26 22:10:15'),
(36, 'App\\Models\\User', 2, 'Mahmoud', '744e76dc06761dbe3b56a3db1d46c3a93efcf4c42b3d49a65df34141d39182a0', '[\"*\"]', NULL, '2024-01-26 22:12:47', '2024-01-26 22:12:47'),
(37, 'App\\Models\\User', 2, 'Mahmoud', '3b61bb447ccd109e8c1f37c48cbea7a12b9e55d73f80efb13d7400c9bdadbf7c', '[\"*\"]', NULL, '2024-01-26 22:13:44', '2024-01-26 22:13:44'),
(38, 'App\\Models\\User', 2, 'Mahmoud', '8a67ef362211f02e7d9eae8b568effbed4f0b171a753bb1c827714a4f923c091', '[\"*\"]', NULL, '2024-01-26 22:14:38', '2024-01-26 22:14:38'),
(39, 'App\\Models\\User', 2, 'Mahmoud', '0d7ce36a2264e9ab35f296d28a42fe5a29968912adb698524258395620fd8f49', '[\"*\"]', NULL, '2024-01-26 22:18:49', '2024-01-26 22:18:49'),
(40, 'App\\Models\\User', 2, 'Mahmoud', 'bc03394c0abea86018330d85ece24d1b5d4eb018df0eb7896aa26ac68a64c340', '[\"*\"]', NULL, '2024-01-26 22:20:58', '2024-01-26 22:20:58'),
(41, 'App\\Models\\User', 2, 'Mahmoud', 'b383d51f4774ef98fde352f91f5e632b6864fe72719da46328fb6ec0f10cd5a3', '[\"*\"]', NULL, '2024-01-26 22:24:03', '2024-01-26 22:24:03'),
(42, 'App\\Models\\User', 2, 'Mahmoud', 'b54b955cc3ff2bc4130346113ed0e7ba2b5196430b41f15fc80ea25aa5ffce99', '[\"*\"]', NULL, '2024-01-26 22:25:06', '2024-01-26 22:25:06'),
(43, 'App\\Models\\User', 2, 'Mahmoud', '4211712f4c0d2accccb248ef87f761fe6403206e8af90433e4552135576f688d', '[\"*\"]', NULL, '2024-01-26 22:25:39', '2024-01-26 22:25:39'),
(44, 'App\\Models\\User', 2, 'Mahmoud', '53261e88e666ff87f2037b2cccec3cfee692af5c6b6cd8484d311a4d862e3a7b', '[\"*\"]', NULL, '2024-01-26 22:25:51', '2024-01-26 22:25:51'),
(45, 'App\\Models\\User', 2, 'Mahmoud', 'f37628bb8da21c974aec5f1b5058c2a9f6b01a435294e65725317955d157519a', '[\"*\"]', NULL, '2024-01-26 22:26:01', '2024-01-26 22:26:01'),
(46, 'App\\Models\\User', 2, 'Mahmoud', '3bbc047b1eb1de6f495aceea671d15288a554328dae8a8f5ec5883f70ece53d2', '[\"*\"]', NULL, '2024-01-26 22:26:11', '2024-01-26 22:26:11'),
(47, 'App\\Models\\User', 2, 'Mahmoud', 'add49a8ed50272550a6f0746c2717d76174850b5fb7941fb90fbad3af308efba', '[\"*\"]', NULL, '2024-01-26 22:26:28', '2024-01-26 22:26:28'),
(48, 'App\\Models\\User', 2, 'Mahmoud', '9d5a05e189d8667e9107a448024c67dcee3cde651af6e066c28aef3b6508b946', '[\"*\"]', NULL, '2024-01-26 22:27:10', '2024-01-26 22:27:10'),
(49, 'App\\Models\\User', 2, 'Mahmoud', '0915510f6b43e52d3b6d4b4f7f9f80cb03736c46dd91a222a59df1e7d62f2621', '[\"*\"]', NULL, '2024-01-26 22:28:02', '2024-01-26 22:28:02'),
(50, 'App\\Models\\User', 2, 'Mahmoud', '76829a1f54e3183553b2ed9a340fe7e9207d221c063e4a3c5f7ed05cb7aba263', '[\"*\"]', NULL, '2024-01-26 22:29:24', '2024-01-26 22:29:24'),
(52, 'App\\Models\\User', 2, 'Mahmoud', 'ca9239c27760fa31f74812f8dad5593f2f3d8fe8fa57a01c09988a0a8620fb94', '[\"*\"]', NULL, '2024-01-27 00:29:15', '2024-01-27 00:29:15'),
(53, 'App\\Models\\User', 2, 'Mahmoud', '3679d8ddfd4cfdb189c68f16b255c6736b47f830741861234c138d8e8806992b', '[\"*\"]', '2024-01-27 11:59:09', '2024-01-27 00:41:25', '2024-01-27 11:59:09'),
(54, 'App\\Models\\User', 2, 'Mahmoud', '36d437a22dbf78d2aa20d24972c58647ef5019ab08c1b8cd6d56645dc607d8f8', '[\"*\"]', NULL, '2024-01-27 12:03:01', '2024-01-27 12:03:01'),
(55, 'App\\Models\\User', 2, 'Mahmoud', 'f1c5582c0cd291aa28fdac8c0b29bd732f49797dc7511c19e6b91899462bed53', '[\"*\"]', NULL, '2024-01-27 12:07:13', '2024-01-27 12:07:13'),
(56, 'App\\Models\\User', 2, 'Mahmoud', '06a8c422c874b5a52a1f073030b5c08a4bad327acc68e7b1d55a191444f23b45', '[\"*\"]', NULL, '2024-01-27 12:09:48', '2024-01-27 12:09:48'),
(57, 'App\\Models\\User', 2, 'Mahmoud', '46a477ba3fe6e8be31ded4448c9282b9974325a69f7d0c35af80bbd5d06dc275', '[\"*\"]', NULL, '2024-01-27 12:10:59', '2024-01-27 12:10:59'),
(58, 'App\\Models\\User', 2, 'Mahmoud', 'b6e2c550f508a297fb5dfe01617cfd4ca0eca585e428c9e094a72e8999aa762e', '[\"*\"]', NULL, '2024-01-27 12:12:08', '2024-01-27 12:12:08'),
(60, 'App\\Models\\User', 6, 'Reem', '835e50ee0357874520e962be8632a286e9f65f99dbcce31a5b589d85a144b50d', '[\"*\"]', NULL, '2024-01-27 12:45:18', '2024-01-27 12:45:18'),
(61, 'App\\Models\\User', 6, 'Reem', '67aa6f3a4f8496ac8c2550bf24cbd9c4f0c9b349a7ccec96399652b09efdd9ae', '[\"*\"]', NULL, '2024-01-27 12:45:41', '2024-01-27 12:45:41'),
(62, 'App\\Models\\User', 2, 'Mahmoud', '94d36668521b201d46f41ff972ffec55a1f16d54a5444136b8b49229e8bdf73e', '[\"*\"]', NULL, '2024-01-27 12:45:52', '2024-01-27 12:45:52'),
(64, 'App\\Models\\User', 6, 'Reem', 'fae2e401ac0a995532a688e6f3bfda2bba86a6a5859e39e2cfc9f1612ad73b6c', '[\"*\"]', NULL, '2024-01-27 12:48:04', '2024-01-27 12:48:04'),
(65, 'App\\Models\\User', 6, 'Reem', '38dd1dfecf493a226cb83a71eeaf408f8691585636436528164adbaad9e78dc8', '[\"*\"]', NULL, '2024-01-27 12:48:10', '2024-01-27 12:48:10'),
(70, 'App\\Models\\User', 6, 'Reem', 'eb790fc981b1d8205684cc2dcccd1583c8ee9511d6a50c5661b0661e7e34859e', '[\"*\"]', '2024-01-27 14:21:41', '2024-01-27 14:04:11', '2024-01-27 14:21:41'),
(74, 'App\\Models\\User', 6, 'Reem', '9aad22e01b3f8685863d4aa89396dc3d806fc1f7b8e378b05a9dbb243e99fca9', '[\"*\"]', '2024-01-27 21:52:37', '2024-01-27 18:57:24', '2024-01-27 21:52:37'),
(75, 'App\\Models\\User', 9, 'Ahmad', 'eef94eacad2e408290aead955d0461fd5abfa2453c40ea7ae54058953d60c9dc', '[\"*\"]', '2024-01-27 21:30:20', '2024-01-27 19:35:46', '2024-01-27 21:30:20'),
(76, 'App\\Models\\User', 2, 'Mahmoud', '48b78744a9f5ea461349193d5a216bc2794dc6535776024377c9377dae29f238', '[\"*\"]', '2024-01-27 23:20:59', '2024-01-27 23:20:58', '2024-01-27 23:20:59'),
(77, 'App\\Models\\User', 9, 'Ahmad', '74e158ac45694ba06f62a103da27bb66be9b41068cbea2ac65569ec280596433', '[\"*\"]', NULL, '2024-01-27 23:25:37', '2024-01-27 23:25:37'),
(78, 'App\\Models\\User', 9, 'Ahmad', '536a2cb6fdc0d90a488f1cb18b0a0d913f55f4376b5e4f721b6705ba4c80bcb5', '[\"*\"]', '2024-01-28 01:13:14', '2024-01-27 23:29:54', '2024-01-28 01:13:14'),
(79, 'App\\Models\\User', 9, 'Ahmad', '803bf679c2b0db07d9051b923d86a82b9cc28fbb65ced65ae328df4f75d682d3', '[\"*\"]', '2024-01-28 00:29:23', '2024-01-28 00:05:22', '2024-01-28 00:29:23');

-- --------------------------------------------------------

--
-- Table structure for table `read_messages`
--

CREATE TABLE `read_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `modal_type` varchar(191) NOT NULL,
  `modal_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `last_read_message_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'web', '2024-01-25 17:17:08', '2024-01-25 17:17:08'),
(2, 'Teacher', 'web', '2024-01-25 17:17:08', '2024-01-25 17:17:08'),
(3, 'Parent', 'web', '2024-01-25 17:17:09', '2024-01-25 17:17:09'),
(4, 'Student', 'web', '2024-01-25 17:17:09', '2024-01-25 17:17:09');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(37, 2),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(45, 2),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(49, 2),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(53, 2),
(54, 2),
(55, 2),
(56, 2),
(57, 1),
(57, 2),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(61, 2),
(62, 1),
(62, 2),
(63, 1),
(63, 2),
(64, 1),
(64, 2),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(69, 2),
(70, 1),
(70, 2),
(71, 1),
(71, 2),
(72, 1),
(72, 2),
(73, 1),
(73, 2),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 2),
(79, 1),
(80, 1),
(81, 2),
(82, 2),
(83, 2),
(84, 2),
(85, 1),
(85, 2),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 2),
(102, 2),
(103, 2),
(104, 2),
(105, 2),
(106, 2),
(107, 2),
(108, 2),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 2),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 2),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 1),
(133, 1),
(134, 1),
(135, 1),
(136, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(512) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'A', '2024-01-25 17:18:15', '2024-01-25 17:18:15', NULL),
(2, 'B', '2024-01-25 17:18:15', '2024-01-25 17:18:15', NULL),
(3, 'C', '2024-01-25 17:18:15', '2024-01-25 17:18:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `session_years`
--

CREATE TABLE `session_years` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(512) NOT NULL,
  `default` tinyint(4) NOT NULL DEFAULT 0,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `include_fee_installments` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 - no 1 - yes',
  `fee_due_date` date NOT NULL DEFAULT '2024-01-25',
  `fee_due_charges` int(11) NOT NULL DEFAULT 0 COMMENT 'in percentage (%)',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `session_years`
--

INSERT INTO `session_years` (`id`, `name`, `default`, `start_date`, `end_date`, `include_fee_installments`, `fee_due_date`, `fee_due_charges`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2022-23', 1, '2022-06-01', '2023-04-30', 0, '2024-01-25', 0, '2024-01-25 17:18:15', '2024-01-25 17:18:48', NULL),
(2, '2023', 0, '2023-06-01', '2024-04-30', 0, '2024-01-25', 0, '2024-01-25 17:18:15', '2024-01-25 17:18:15', NULL),
(3, '2024', 0, '2024-06-01', '2025-04-30', 0, '2024-01-25', 0, '2024-01-25 17:18:15', '2024-01-25 17:18:15', NULL),
(4, '2025', 0, '2025-06-01', '2026-04-30', 0, '2024-01-25', 0, '2024-01-25 17:18:15', '2024-01-25 17:18:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` text NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `type`, `message`) VALUES
(1, 'school_name', 'e-School'),
(2, 'school_email', 'eschool@gmail.com'),
(3, 'school_phone', '9876543210'),
(4, 'school_address', 'India'),
(5, 'time_zone', 'Asia/Kolkata'),
(6, 'date_formate', 'd-m-Y'),
(7, 'time_formate', 'h:i A'),
(8, 'theme_color', '#4C5EA6'),
(9, 'session_year', '1'),
(10, 'system_version', '2.0.2'),
(11, 'session_year', '1'),
(12, 'session_year', '1'),
(13, 'mail_mailer', 'smtp'),
(14, 'email_configration_verification', '0'),
(15, 'mail_host', 'mail.labs2030.com'),
(16, 'mail_port', '465'),
(17, 'mail_username', 'demo@labs2030.com'),
(18, 'mail_password', ']?X$R+O6,D#O'),
(19, 'mail_encryption', 'ssl'),
(20, 'mail_send_from', 'demo@labs2030.com');

-- --------------------------------------------------------

--
-- Table structure for table `shifts`
--

CREATE TABLE `shifts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(1024) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `streams`
--

CREATE TABLE `streams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `class_section_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `admission_no` varchar(512) NOT NULL,
  `roll_number` int(11) DEFAULT NULL,
  `caste` varchar(128) DEFAULT NULL,
  `religion` varchar(128) DEFAULT NULL,
  `admission_date` date NOT NULL,
  `blood_group` varchar(32) DEFAULT NULL,
  `height` varchar(32) DEFAULT NULL,
  `weight` varchar(64) DEFAULT NULL,
  `is_new_admission` tinyint(4) NOT NULL DEFAULT 1,
  `father_id` int(11) DEFAULT NULL,
  `mother_id` int(11) DEFAULT NULL,
  `guardian_id` int(11) DEFAULT NULL,
  `dynamic_fields` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `user_id`, `class_section_id`, `category_id`, `admission_no`, `roll_number`, `caste`, `religion`, `admission_date`, `blood_group`, `height`, `weight`, `is_new_admission`, `father_id`, `mother_id`, `guardian_id`, `dynamic_fields`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, 3, 1, '12345667', 1, 'Islam', 'Islam', '2022-04-01', 'B+', '5.5', '59', 1, 0, 0, 1, '[]', '2024-01-25 17:18:16', '2024-01-26 20:24:47', NULL),
(2, 6, 3, 1, '005005', 2, 'Islam', 'Islam', '2022-04-01', 'B+', '5.5', '59', 1, 4, 3, 0, '[]', '2024-01-25 17:18:16', '2024-01-27 12:40:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_online_exam_statuses`
--

CREATE TABLE `student_online_exam_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `online_exam_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1 - in progress 2 - completed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_sessions`
--

CREATE TABLE `student_sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL,
  `class_section_id` int(11) NOT NULL,
  `session_year_id` int(11) NOT NULL,
  `result` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=>Pass,0=>fail',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=>continue,0=>leave',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_subjects`
--

CREATE TABLE `student_subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `class_section_id` int(11) NOT NULL,
  `session_year_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_subjects`
--

INSERT INTO `student_subjects` (`id`, `student_id`, `subject_id`, `class_section_id`, `session_year_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 5, 3, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(512) NOT NULL,
  `code` varchar(64) DEFAULT NULL,
  `bg_color` varchar(32) NOT NULL,
  `image` varchar(512) NOT NULL,
  `medium_id` int(11) NOT NULL,
  `type` varchar(64) NOT NULL COMMENT 'Theory / Practical',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `code`, `bg_color`, `image`, `medium_id`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Maths', 'MA', '#dad4ff', 'subjects/1706349907-subject.png', 2, 'Practical', '2024-01-25 17:18:15', '2024-01-27 14:05:07', NULL),
(2, 'Science', 'SC', '#5031f7', 'subject.png', 2, 'Practical', '2024-01-25 17:18:15', '2024-01-25 17:18:15', NULL),
(3, 'English', 'EN', '#5031f7', 'subject.png', 2, 'Theory', '2024-01-25 17:18:15', '2024-01-25 17:18:15', NULL),
(4, 'Islam', 'GJ', '#5031f7', 'subject.png', 2, 'Theory', '2024-01-25 17:18:15', '2024-01-25 17:18:15', NULL),
(5, 'Literature', 'SN', '#5031f7', 'subject.png', 2, 'Theory', '2024-01-25 17:18:15', '2024-01-25 17:18:15', NULL),
(6, 'Chinese', 'HN', '#5031f7', 'subject.png', 2, 'Theory', '2024-01-25 17:18:15', '2024-01-25 17:18:15', NULL),
(7, 'Computer', 'CMP', '#5031f7', 'subject.png', 2, 'Practical', '2024-01-25 17:18:15', '2024-01-25 17:18:15', NULL),
(8, 'PT', 'PT', '#5031f7', 'subject.png', 2, 'Practical', '2024-01-25 17:18:15', '2024-01-25 17:18:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subject_teachers`
--

CREATE TABLE `subject_teachers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_section_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subject_teachers`
--

INSERT INTO `subject_teachers` (`id`, `class_section_id`, `subject_id`, `teacher_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 1, 2, '2024-01-27 13:57:21', '2024-01-27 13:57:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `qualification` varchar(512) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `user_id`, `qualification`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 8, 'PHD', '2024-01-27 13:53:57', '2024-01-27 13:55:05', '2024-01-27 13:55:05'),
(2, 9, 'PHD', '2024-01-27 13:54:41', '2024-01-27 13:54:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `timetables`
--

CREATE TABLE `timetables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subject_teacher_id` int(11) NOT NULL,
  `class_section_id` int(11) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `note` varchar(1024) DEFAULT NULL,
  `day` int(11) NOT NULL COMMENT '1=monday,2=tuesday,3=wednesday,4=thursday,5=friday,6=saturday,7=sunday',
  `day_name` varchar(512) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `timetables`
--

INSERT INTO `timetables` (`id`, `subject_teacher_id`, `class_section_id`, `start_time`, `end_time`, `note`, `day`, `day_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 3, '13:00:00', '15:00:00', '', 1, 'monday', '2024-01-27 13:57:50', '2024-01-27 13:57:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(128) NOT NULL,
  `last_name` varchar(128) NOT NULL,
  `gender` varchar(16) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `fcm_id` varchar(1024) DEFAULT NULL,
  `device_type` varchar(128) DEFAULT NULL COMMENT 'android, ios',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `image` varchar(512) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `current_address` varchar(191) DEFAULT NULL,
  `permanent_address` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `reset_request` tinyint(4) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `gender`, `email`, `fcm_id`, `device_type`, `email_verified_at`, `password`, `mobile`, `image`, `dob`, `current_address`, `permanent_address`, `status`, `reset_request`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'super', 'admin', 'Male', 'superadmin@gmail.com', NULL, NULL, NULL, '$2y$10$vjl/0RlHVnFlkugp1ONM7OdrBQShChUj4Frlv8NU.nBZ8kX9CJocW', '', 'logo.svg', NULL, NULL, NULL, 1, 0, NULL, '2024-01-25 17:18:48', '2024-01-25 17:20:07', NULL),
(2, 'Mahmoud', 'Ghamidi', 'Male', 'father@gmail.com', 'dEHnDQwxR0uoU-wBVOnpS_:APA91bEI14XRDMU6tOYAMbO1FUn8_8sHl7uMsHNvdn6lcuXNOEeXoydYX8EGyeSdNhCJrLlqIWaoP7ska5zqLxBTPAGXFeBAYuSGdrcYfj9lEmbDsvQVKCO7zbtqNIWB1FES47GvGFME', 'android', NULL, '$2y$10$vjl/0RlHVnFlkugp1ONM7OdrBQShChUj4Frlv8NU.nBZ8kX9CJocW', '1234567890', 'parents/user.png', NULL, 'Jeddah', 'Jeddah', 1, 0, NULL, '2024-01-25 17:18:16', '2024-01-27 23:20:58', NULL),
(3, 'Ahmad', 'Ansari', 'Female', 'mother@gmail.com', NULL, NULL, NULL, '$2y$10$vjl/0RlHVnFlkugp1ONM7OdrBQShChUj4Frlv8NU.nBZ8kX9CJocW', '1234567890', 'parents/user.png', NULL, 'Jeddah', 'Jeddah', 1, 0, NULL, '2024-01-25 17:18:16', '2024-01-25 17:18:16', NULL),
(4, 'Omar', 'AbdulKareem', 'male', 'student@gmail.com', NULL, NULL, NULL, '$2y$10$vjl/0RlHVnFlkugp1ONM7OdrBQShChUj4Frlv8NU.nBZ8kX9CJocW', '1234567890', 'students/user.png', '1999-01-01', 'Jeddah', 'Jeddah', 1, 0, NULL, '2024-01-25 17:18:16', '2024-01-26 20:26:44', NULL),
(5, 'Amira', 'Sultan', 'Female', 'example_mother@gmail.com', NULL, NULL, NULL, '$2y$10$5UpbjChFT.dxM5Nlu3TIxelX8ovCLnPJny4ck1SfP10ACirnIxgv.', '982667637633', 'parents/1706343785-woman.jpg', '1991-02-18', NULL, NULL, 1, 0, NULL, '2024-01-27 12:23:06', '2024-01-27 12:23:06', NULL),
(6, 'Reem', 'Ghamidi', 'female', 'example_student@gmail.com', 'dktCPsTQRtS0k_EjdL8tyH:APA91bEAc4WF-Ip_kJTpV9KHBrkm-YxbtxLyriLkxB4Pb6NO4sDGs6G0WYwV6GTUUlsdPQHsvljH7PtmTRYyz5vebDhLPQP9MmyJjmvnytdKa0uiIBo0ev8AtZNW1hk528hNbBVj5Y4s', 'android', NULL, '$2y$10$vjl/0RlHVnFlkugp1ONM7OdrBQShChUj4Frlv8NU.nBZ8kX9CJocW', '56425442', 'students/1706345442-d9bkg0l-ccb01679-07f2-41fb-b53a-f7e09d4fe77e.jpg', '2000-01-01', 'Dammam', 'Dammam', 1, 0, NULL, '2024-01-27 12:23:06', '2024-01-27 18:57:24', NULL),
(7, 'Mohsen', 'Sultan', 'Male', 'example_father@gmail.com', NULL, NULL, NULL, '$2y$10$5UpbjChFT.dxM5Nlu3TIxelX8ovCLnPJny4ck1SfP10ACirnIxgv.', '982667637633', 'parents/1706343785-woman.jpg', '1991-02-18', NULL, NULL, 1, 0, NULL, '2024-01-27 12:23:06', '2024-01-27 12:23:06', NULL),
(8, 'Ahmad', 'Habashi', 'male', 'teacher@gmail.com', NULL, NULL, NULL, '$2y$10$s9Rnxmjc8VWWxTzV32/O3ONuacKh4JFO1shiKyKFeP6f3sEEE6cCi', '1234567890', 'teachers/1706349237-istockphoto-1496929545-612x612.jpg', '1994-06-15', 'Riyadh', 'Riyadh', 1, 0, NULL, '2024-01-27 13:53:57', '2024-01-27 13:55:05', '2024-01-27 13:55:05'),
(9, 'Ahmad', 'Habashi', 'male', 'example_teacher@gmail.com', 'd2jjZVXZQAuV6Z4sfqw3eW:APA91bGr6PJnVuPbFnSZNTvomORtnSBUp3fZr3xCiiVHb6BcAnK1a0zIpZC7A67MdOYx76iPqM4qOGUMH6kxoNQMNrsueKADYvh77tk4rFf2OvD1Ha6VJBV0k48peWp4VnLFZtcNAj04', 'android', NULL, '$2y$10$vjl/0RlHVnFlkugp1ONM7OdrBQShChUj4Frlv8NU.nBZ8kX9CJocW', '1234567890', '', '1994-06-15', 'Riyadh', 'Riyadh', 1, 0, NULL, '2024-01-27 13:54:41', '2024-01-27 23:29:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `notification_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_notifications`
--

INSERT INTO `user_notifications` (`id`, `notification_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 4, '2024-01-27 14:01:19', '2024-01-27 14:01:19'),
(2, 1, 6, '2024-01-27 14:01:19', '2024-01-27 14:01:19'),
(3, 2, 9, '2024-01-27 17:34:12', '2024-01-27 17:34:12'),
(4, 3, 9, '2024-01-27 18:00:22', '2024-01-27 18:00:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_calendars`
--
ALTER TABLE `academic_calendars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `announcements_table_type_table_id_index` (`table_type`,`table_id`);

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assignment_submissions`
--
ALTER TABLE `assignment_submissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_files`
--
ALTER TABLE `chat_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_files_message_id_foreign` (`message_id`);

--
-- Indexes for table `chat_members`
--
ALTER TABLE `chat_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_members_chat_room_id_foreign` (`chat_room_id`),
  ADD KEY `chat_members_user_id_foreign` (`user_id`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_messages_modal_type_modal_id_index` (`modal_type`,`modal_id`),
  ADD KEY `chat_messages_sender_id_foreign` (`sender_id`);

--
-- Indexes for table `chat_rooms`
--
ALTER TABLE `chat_rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classes_stream_id_foreign` (`stream_id`),
  ADD KEY `classes_shift_id_foreign` (`shift_id`);

--
-- Indexes for table `class_sections`
--
ALTER TABLE `class_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class_subjects`
--
ALTER TABLE `class_subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class_teachers`
--
ALTER TABLE `class_teachers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_teachers_class_section_id_foreign` (`class_section_id`),
  ADD KEY `class_teachers_class_teacher_id_foreign` (`class_teacher_id`);

--
-- Indexes for table `elective_subject_groups`
--
ALTER TABLE `elective_subject_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_classes`
--
ALTER TABLE `exam_classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_marks`
--
ALTER TABLE `exam_marks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_results`
--
ALTER TABLE `exam_results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_timetables`
--
ALTER TABLE `exam_timetables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fees_choiceables`
--
ALTER TABLE `fees_choiceables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fees_choiceables_payment_transaction_id_index` (`payment_transaction_id`);

--
-- Indexes for table `fees_classes`
--
ALTER TABLE `fees_classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fees_paids`
--
ALTER TABLE `fees_paids`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fees_types`
--
ALTER TABLE `fees_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `files_modal_type_modal_id_index` (`modal_type`,`modal_id`);

--
-- Indexes for table `form_fields`
--
ALTER TABLE `form_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `installment_fees`
--
ALTER TABLE `installment_fees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `installment_fees_session_year_id_index` (`session_year_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lesson_topics`
--
ALTER TABLE `lesson_topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mediums`
--
ALTER TABLE `mediums`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_exams`
--
ALTER TABLE `online_exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `online_exams_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `online_exams_subject_id_index` (`subject_id`),
  ADD KEY `online_exams_session_year_id_index` (`session_year_id`);

--
-- Indexes for table `online_exam_questions`
--
ALTER TABLE `online_exam_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `online_exam_questions_class_subject_id_index` (`class_subject_id`);

--
-- Indexes for table `online_exam_question_answers`
--
ALTER TABLE `online_exam_question_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `online_exam_question_answers_question_id_index` (`question_id`),
  ADD KEY `online_exam_question_answers_answer_index` (`answer`);

--
-- Indexes for table `online_exam_question_choices`
--
ALTER TABLE `online_exam_question_choices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `online_exam_question_choices_online_exam_id_index` (`online_exam_id`),
  ADD KEY `online_exam_question_choices_question_id_index` (`question_id`);

--
-- Indexes for table `online_exam_question_options`
--
ALTER TABLE `online_exam_question_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `online_exam_question_options_question_id_index` (`question_id`);

--
-- Indexes for table `online_exam_student_answers`
--
ALTER TABLE `online_exam_student_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `online_exam_student_answers_student_id_index` (`student_id`),
  ADD KEY `online_exam_student_answers_online_exam_id_index` (`online_exam_id`),
  ADD KEY `online_exam_student_answers_question_id_index` (`question_id`),
  ADD KEY `online_exam_student_answers_option_id_index` (`option_id`);

--
-- Indexes for table `paid_installment_fees`
--
ALTER TABLE `paid_installment_fees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paid_installment_fees_class_id_index` (`class_id`),
  ADD KEY `paid_installment_fees_student_id_index` (`student_id`),
  ADD KEY `paid_installment_fees_parent_id_index` (`parent_id`),
  ADD KEY `paid_installment_fees_installment_fee_id_index` (`installment_fee_id`),
  ADD KEY `paid_installment_fees_session_year_id_index` (`session_year_id`),
  ADD KEY `paid_installment_fees_payment_transaction_id_index` (`payment_transaction_id`);

--
-- Indexes for table `parents`
--
ALTER TABLE `parents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_transactions`
--
ALTER TABLE `payment_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `read_messages`
--
ALTER TABLE `read_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `read_messages_modal_type_modal_id_index` (`modal_type`,`modal_id`),
  ADD KEY `read_messages_user_id_foreign` (`user_id`),
  ADD KEY `read_messages_last_read_message_id_foreign` (`last_read_message_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `session_years`
--
ALTER TABLE `session_years`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shifts`
--
ALTER TABLE `shifts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `streams`
--
ALTER TABLE `streams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_online_exam_statuses`
--
ALTER TABLE `student_online_exam_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_online_exam_statuses_student_id_index` (`student_id`),
  ADD KEY `student_online_exam_statuses_online_exam_id_index` (`online_exam_id`);

--
-- Indexes for table `student_sessions`
--
ALTER TABLE `student_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_subjects`
--
ALTER TABLE `student_subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject_teachers`
--
ALTER TABLE `subject_teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timetables`
--
ALTER TABLE `timetables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_notifications_notification_id_foreign` (`notification_id`),
  ADD KEY `user_notifications_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_calendars`
--
ALTER TABLE `academic_calendars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `assignment_submissions`
--
ALTER TABLE `assignment_submissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `chat_files`
--
ALTER TABLE `chat_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_members`
--
ALTER TABLE `chat_members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_rooms`
--
ALTER TABLE `chat_rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `class_sections`
--
ALTER TABLE `class_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `class_subjects`
--
ALTER TABLE `class_subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `class_teachers`
--
ALTER TABLE `class_teachers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `elective_subject_groups`
--
ALTER TABLE `elective_subject_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_classes`
--
ALTER TABLE `exam_classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_marks`
--
ALTER TABLE `exam_marks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_results`
--
ALTER TABLE `exam_results`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_timetables`
--
ALTER TABLE `exam_timetables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fees_choiceables`
--
ALTER TABLE `fees_choiceables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fees_classes`
--
ALTER TABLE `fees_classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fees_paids`
--
ALTER TABLE `fees_paids`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fees_types`
--
ALTER TABLE `fees_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `form_fields`
--
ALTER TABLE `form_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `installment_fees`
--
ALTER TABLE `installment_fees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lesson_topics`
--
ALTER TABLE `lesson_topics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mediums`
--
ALTER TABLE `mediums`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `online_exams`
--
ALTER TABLE `online_exams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_exam_questions`
--
ALTER TABLE `online_exam_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_exam_question_answers`
--
ALTER TABLE `online_exam_question_answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_exam_question_choices`
--
ALTER TABLE `online_exam_question_choices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_exam_question_options`
--
ALTER TABLE `online_exam_question_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_exam_student_answers`
--
ALTER TABLE `online_exam_student_answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paid_installment_fees`
--
ALTER TABLE `paid_installment_fees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parents`
--
ALTER TABLE `parents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payment_transactions`
--
ALTER TABLE `payment_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `read_messages`
--
ALTER TABLE `read_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `session_years`
--
ALTER TABLE `session_years`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `shifts`
--
ALTER TABLE `shifts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `streams`
--
ALTER TABLE `streams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `student_online_exam_statuses`
--
ALTER TABLE `student_online_exam_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_sessions`
--
ALTER TABLE `student_sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_subjects`
--
ALTER TABLE `student_subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `subject_teachers`
--
ALTER TABLE `subject_teachers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `timetables`
--
ALTER TABLE `timetables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_notifications`
--
ALTER TABLE `user_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chat_files`
--
ALTER TABLE `chat_files`
  ADD CONSTRAINT `chat_files_message_id_foreign` FOREIGN KEY (`message_id`) REFERENCES `chat_messages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chat_members`
--
ALTER TABLE `chat_members`
  ADD CONSTRAINT `chat_members_chat_room_id_foreign` FOREIGN KEY (`chat_room_id`) REFERENCES `chat_rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chat_members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD CONSTRAINT `chat_messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_shift_id_foreign` FOREIGN KEY (`shift_id`) REFERENCES `shifts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `classes_stream_id_foreign` FOREIGN KEY (`stream_id`) REFERENCES `streams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `class_teachers`
--
ALTER TABLE `class_teachers`
  ADD CONSTRAINT `class_teachers_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `class_teachers_class_teacher_id_foreign` FOREIGN KEY (`class_teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `fees_choiceables`
--
ALTER TABLE `fees_choiceables`
  ADD CONSTRAINT `fees_choiceables_payment_transaction_id_foreign` FOREIGN KEY (`payment_transaction_id`) REFERENCES `payment_transactions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `installment_fees`
--
ALTER TABLE `installment_fees`
  ADD CONSTRAINT `installment_fees_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `online_exams`
--
ALTER TABLE `online_exams`
  ADD CONSTRAINT `online_exams_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `online_exams_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `online_exam_questions`
--
ALTER TABLE `online_exam_questions`
  ADD CONSTRAINT `online_exam_questions_class_subject_id_foreign` FOREIGN KEY (`class_subject_id`) REFERENCES `class_subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `online_exam_question_answers`
--
ALTER TABLE `online_exam_question_answers`
  ADD CONSTRAINT `online_exam_question_answers_answer_foreign` FOREIGN KEY (`answer`) REFERENCES `online_exam_question_options` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `online_exam_question_answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `online_exam_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `online_exam_question_choices`
--
ALTER TABLE `online_exam_question_choices`
  ADD CONSTRAINT `online_exam_question_choices_online_exam_id_foreign` FOREIGN KEY (`online_exam_id`) REFERENCES `online_exams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `online_exam_question_choices_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `online_exam_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `online_exam_question_options`
--
ALTER TABLE `online_exam_question_options`
  ADD CONSTRAINT `online_exam_question_options_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `online_exam_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `online_exam_student_answers`
--
ALTER TABLE `online_exam_student_answers`
  ADD CONSTRAINT `online_exam_student_answers_online_exam_id_foreign` FOREIGN KEY (`online_exam_id`) REFERENCES `online_exams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `online_exam_student_answers_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `online_exam_question_options` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `online_exam_student_answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `online_exam_question_choices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `online_exam_student_answers_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `paid_installment_fees`
--
ALTER TABLE `paid_installment_fees`
  ADD CONSTRAINT `paid_installment_fees_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `paid_installment_fees_installment_fee_id_foreign` FOREIGN KEY (`installment_fee_id`) REFERENCES `installment_fees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `paid_installment_fees_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `parents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `paid_installment_fees_payment_transaction_id_foreign` FOREIGN KEY (`payment_transaction_id`) REFERENCES `payment_transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `paid_installment_fees_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `paid_installment_fees_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `read_messages`
--
ALTER TABLE `read_messages`
  ADD CONSTRAINT `read_messages_last_read_message_id_foreign` FOREIGN KEY (`last_read_message_id`) REFERENCES `chat_messages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `read_messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_online_exam_statuses`
--
ALTER TABLE `student_online_exam_statuses`
  ADD CONSTRAINT `student_online_exam_statuses_online_exam_id_foreign` FOREIGN KEY (`online_exam_id`) REFERENCES `online_exams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_online_exam_statuses_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD CONSTRAINT `user_notifications_notification_id_foreign` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
