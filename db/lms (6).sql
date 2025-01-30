-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2025 at 09:52 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `o_course_id` varchar(255) DEFAULT NULL,
  `o_course_name` varchar(255) DEFAULT NULL,
  `o_user_id` varchar(255) DEFAULT NULL,
  `o_price` varchar(50) NOT NULL,
  `o_pay` varchar(50) DEFAULT NULL,
  `o_status` varchar(50) DEFAULT NULL,
  `method` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `o_course_id`, `o_course_name`, `o_user_id`, `o_price`, `o_pay`, `o_status`, `method`, `created_at`, `updated_at`) VALUES
(2, '3', 'C++ Course for  beginner Students', '1', '150 $', 'no', 'active', 'Cash', '2025-01-29 12:36:56', '2025-01-29 12:36:56'),
(3, '4', 'Python Course for  beginner Students', '1', '250 $', 'no', 'suspend', 'Cash', '2025-01-29 12:36:56', '2025-01-29 12:36:56'),
(8, '2', 'C# Course for beginner Students', '1', '100 $', 'no', 'suspend', 'Cash', '2025-01-29 13:43:43', '2025-01-29 13:43:43');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cat_name` varchar(255) DEFAULT NULL,
  `cat_image` varchar(255) DEFAULT NULL,
  `cat_desc` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `cat_name`, `cat_image`, `cat_desc`, `created_at`, `updated_at`) VALUES
(1, 'Networks', '1732178099.jpg', 'Explore network principles for designing and managing computer networks', '2024-11-21 05:34:59', '2024-11-21 05:34:59'),
(2, 'Programing Languages', '1732178269.jpg', 'Online Programming Languages Classes like TypeScript · Swift · C# Programming · Python · Java', '2024-11-21 05:37:49', '2024-11-21 05:37:49');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_name` varchar(255) DEFAULT NULL,
  `course_code` varchar(255) DEFAULT NULL,
  `course_desc` text DEFAULT NULL,
  `course_image` varchar(255) DEFAULT NULL,
  `course_price` varchar(255) DEFAULT NULL,
  `course_duration` varchar(255) DEFAULT NULL,
  `course_level` varchar(255) DEFAULT NULL,
  `cat_id` varchar(255) DEFAULT NULL,
  `teacher_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_name`, `course_code`, `course_desc`, `course_image`, `course_price`, `course_duration`, `course_level`, `cat_id`, `teacher_id`, `created_at`, `updated_at`) VALUES
(2, 'C# Course for beginner Students', 'p-01', 'This hands-on introduction to C# training course give you comprehensive coverage of C# as an object-oriented programming language for application development. You will obtain practical experience using C# and learn how to leverage the .NET Framework Library to quickly produce production-level programs.', '1735633948.jpeg', '100 $', '5 hourse', 'level 1', '2', '1', '2024-12-31 05:32:28', '2024-12-31 05:32:28'),
(3, 'C++ Course for  beginner Students', 'p-02', 'This hands-on introduction to C++ training course give you comprehensive coverage of C++ as an object-oriented programming language for application development. You will obtain practical experience using C++ and learn how to leverage the .NET Framework Library to quickly produce production-level programs.', '1735634044.jpeg', '150 $', '4 hourse', 'level 1', '2', '1', '2024-12-31 05:34:04', '2024-12-31 05:34:04'),
(4, 'Python Course for  beginner Students', 'P-03', 'Python is a popular programming language. It was created by Guido van Rossum, and released in 1991.\n\nIt is used for:\n\nweb development (server-side),\nsoftware development,\nmathematics,\nsystem scripting.', '1735646136.jpeg', '250 $', '10 hours', 'level 1 +2', '2', '1', '2024-12-31 08:55:36', '2024-12-31 08:55:36');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `homework`
--

CREATE TABLE `homework` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `h_title` varchar(255) DEFAULT NULL,
  `h_desc` varchar(255) DEFAULT NULL,
  `h_pdf` varchar(255) DEFAULT NULL,
  `h_image` varchar(255) DEFAULT NULL,
  `h_start_date` varchar(255) DEFAULT NULL,
  `h_end_date` varchar(255) DEFAULT NULL,
  `course_id` varchar(255) DEFAULT NULL,
  `teacher_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `homework`
--

INSERT INTO `homework` (`id`, `h_title`, `h_desc`, `h_pdf`, `h_image`, `h_start_date`, `h_end_date`, `course_id`, `teacher_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'build network', 'new company 3 floors', '1736878986.pdf', '1736878986.jpg', '2025-01-14', '2025-01-31', '2', '1', NULL, '2025-01-14 15:23:06', '2025-01-14 15:23:06');

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` varchar(255) DEFAULT NULL,
  `l_title` varchar(255) DEFAULT NULL,
  `l_desc` varchar(255) DEFAULT NULL,
  `l_image` varchar(255) DEFAULT NULL,
  `l_video` varchar(255) DEFAULT NULL,
  `l_pdf` varchar(255) DEFAULT NULL,
  `l_audio` varchar(255) DEFAULT NULL,
  `l_text` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `course_id`, `l_title`, `l_desc`, `l_image`, `l_video`, `l_pdf`, `l_audio`, `l_text`, `created_at`, `updated_at`) VALUES
(1, '3', 'introduction to c++', 'short about the important of c++', '1735731184.PNG', '1735731184.mp4', NULL, NULL, NULL, '2025-01-01 08:33:04', '2025-01-01 08:33:04'),
(2, '3', 'lesson 2  about  c++ progrming', 'the foundation of  c++ programing', '1735731371.PNG', '1735731371.mp4', NULL, NULL, NULL, '2025-01-01 08:36:11', '2025-01-01 08:36:11'),
(3, '3', 'Lesson 3 - first program in c++', NULL, '1735731488.PNG', '1735731488.mp4', NULL, NULL, NULL, '2025-01-01 08:38:08', '2025-01-01 08:38:08'),
(4, '3', 'Lesson 4 - variable in c++ type', NULL, '1735731544.PNG', '1735731544.mp4', NULL, NULL, NULL, '2025-01-01 08:39:05', '2025-01-01 08:39:05'),
(5, '3', 'Lesson 5 - input data to algorthem', NULL, '1735731624.PNG', '1735731624.mp4', NULL, NULL, NULL, '2025-01-01 08:40:24', '2025-01-01 08:40:24'),
(6, '2', 'Lesson 1 - introductions', 'short about the important of c++', '1735739519.jpeg', '1735739519.mp4', NULL, NULL, NULL, '2025-01-01 10:52:00', '2025-01-01 10:52:00'),
(7, '2', 'Lesson 2 -  syntex in c#', NULL, '1735739622.jpeg', '1735739622.mp4', NULL, NULL, NULL, '2025-01-01 10:53:42', '2025-01-01 10:53:42'),
(8, '2', 'Lesson 3 -Data Type', 'data type and variable declartions', '1735739674.jpeg', '1735739674.mp4', NULL, NULL, NULL, '2025-01-01 10:54:34', '2025-01-01 10:54:34'),
(9, '2', 'Lesson 4 - operations', 'math operating in c#', '1735739740.jpeg', '1735739740.mp4', NULL, NULL, NULL, '2025-01-01 10:55:40', '2025-01-01 10:55:40'),
(10, '4', 'lesson 1 - introductions', 'short about the important of python', '1735739795.jpeg', '1735739795.mp4', NULL, NULL, NULL, '2025-01-01 10:56:35', '2025-01-01 10:56:35'),
(11, '4', 'lesson 2  about  python progrming', 'short about the important of  python', '1735739841.jpeg', '1735739841.mp4', NULL, NULL, NULL, '2025-01-01 10:57:21', '2025-01-01 10:57:21');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2024_10_09_081256_create_sessions_table', 1),
(7, '2024_11_07_074956_create_categories_table', 2),
(8, '2024_11_07_075513_create_courses_table', 3),
(9, '2024_11_07_075959_create_lessons_table', 4),
(10, '2024_11_07_080420_create_teachers_table', 5),
(11, '2024_11_07_080747_create_homework_table', 6),
(12, '2024_11_07_081150_create_registers_table', 7),
(13, '2025_01_15_073711_create_orders_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `o_course_id` varchar(255) DEFAULT NULL,
  `o_course_name` varchar(255) DEFAULT NULL,
  `o_user_id` varchar(255) DEFAULT NULL,
  `o_price` varchar(50) NOT NULL,
  `o_pay` varchar(50) DEFAULT NULL,
  `o_status` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registers`
--

CREATE TABLE `registers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `pay_type` varchar(255) DEFAULT NULL,
  `pay_status` varchar(255) DEFAULT NULL,
  `course_enabled` varchar(255) DEFAULT NULL,
  `pay_amount` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('E1eaZbMgHYResGfjcVd5n0yLMAEBnvBGF6joltGL', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSk9GZGZIR0dZdWhxRGg1amRuZ2NNRDA5dzRLVGVCMGY1WkY2cEV3SiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jb3Vyc2VfbGVzc29ucy8yIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjEwOiJjYXJ0X2NvdW50IjtpOjA7fQ==', 1738169047),
('nCmdOcjTkGLmYKO1l1nDnsVljZolCf62fdzarLvW', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiYTFzQWtHNjB2VWo2cUhjem04c1F4b0VyTDhYMk14WTZNSFlyVEJoMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wYXkvNCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MTA6ImNhcnRfY291bnQiO2k6MDtzOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1738226689);

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `t_name` varchar(255) DEFAULT NULL,
  `t_email` varchar(255) DEFAULT NULL,
  `t_mobile` varchar(255) DEFAULT NULL,
  `t_address` varchar(255) DEFAULT NULL,
  `t_image` varchar(255) DEFAULT NULL,
  `t_password` varchar(255) DEFAULT NULL,
  `t_majority` varchar(255) DEFAULT NULL,
  `t_cv` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `t_name`, `t_email`, `t_mobile`, `t_address`, `t_image`, `t_password`, `t_majority`, `t_cv`, `created_at`, `updated_at`) VALUES
(1, 'Saher Al mossa', 'saher@gmail.com', '0944225143', 'damascus', 'saher.jpg', 'English123', 'programming', 'saher_cv.pdf', NULL, '2024-12-30 06:01:40'),
(2, 'alla', 'alla@gmail.com', '0947822302', 'darra- jabel elsheik', '1734595451.jpg', '123456', 'netowrks', '1734595451.pdf', '2024-12-19 05:04:11', '2024-12-30 06:01:22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_type` varchar(255) DEFAULT '0',
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `cert` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `user_type`, `email`, `mobile`, `address`, `cert`, `job`, `image`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Sami Ahmad', '0', 'user01@gmail.com', '944225143', 'jaramana', 'students\n', NULL, '1735547470.jpg', NULL, '$2y$10$WVIe.X/qsnG0xqATSLnJQuJoSLSvKYWBh1aX6IPYMsdUnFiONEb/O', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-14 05:00:26', '2024-12-30 05:31:10'),
(3, 'admin', '1', 'admin@gmail.com', '0947822302', 'sham Academy', 'developers', 'admin', 'admin.png', NULL, '$2y$10$oJ.Y5a.JlrkDTsdz3/bG2ea9AYRTWVkgpfXQcdM/.mWK1vkjTC49m', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-30 05:00:55', '2024-10-30 05:00:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `homework`
--
ALTER TABLE `homework`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `registers`
--
ALTER TABLE `registers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `homework`
--
ALTER TABLE `homework`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `registers`
--
ALTER TABLE `registers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
