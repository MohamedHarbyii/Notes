-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2023 at 11:59 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `notes`
--

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
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notebooks`
--

CREATE TABLE `notebooks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(300) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notebooks`
--

INSERT INTO `notebooks` (`id`, `title`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'first node book', 1, '2023-12-13 01:37:44', '2023-12-13 01:37:44');

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `notebook_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `caption` varchar(5000) NOT NULL,
  `favourite` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`id`, `user_id`, `notebook_id`, `title`, `caption`, `favourite`, `created_at`, `updated_at`) VALUES
(3, 1, 1, 'Second Note', 'hi this is my sec note', 1, '2023-12-06 15:28:47', '2023-12-06 17:43:10'),
(4, 1, 1, 'Second Note', 'hi this is my sec note', 0, '2023-12-06 15:36:36', '2023-12-06 17:36:36'),
(5, 1, 1, 'Second Note', 'hi this is my sec note', 0, '2023-12-06 15:36:38', '2023-12-06 17:36:38'),
(6, 1, 1, 'Second Note', 'hi this is my sec note', 0, '2023-12-06 15:36:39', '2023-12-06 17:36:39'),
(7, 1, 1, 's Note', 's sec note', 0, '2023-12-06 15:37:07', '2023-12-06 17:37:07');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
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
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'mohamed', 'mohamed@gmail.com', NULL, '$2y$12$ZlPYButeo3OZL97OPP.EwOEUGoJKbwJ.g7WivlWcWEXuOrgGEn5Wq', NULL, '2023-12-06 15:17:12', '2023-12-06 15:17:12'),
(2, 'mohamed', 'mohamwed@gmail.com', NULL, '$2y$12$XIZUV9gx5ukCbNXsicJ4p.yxYe8j4k7q1zhFbKvx/8tROPhctlGfm', NULL, '2023-12-06 15:19:24', '2023-12-06 15:19:24'),
(3, 'test', 'test@gmail.com', NULL, '$2y$12$ZS7guMrDAi4AdhyhhGVg0.c62PFH.aPT8bzsf/RuEE.QMF8gmFwpW', NULL, '2023-12-08 21:41:15', '2023-12-08 21:41:15'),
(4, 'Mazen Adel II & Mohamed Harby', 'IWantToSleep@gmail.com', NULL, '$2y$12$q9KFXluTA.qtVapFhyOlFeJ79afnFqPxqSRerLnsW.f92aAVybd3K', NULL, '2023-12-08 21:44:50', '2023-12-08 21:44:50'),
(5, 'last test (ok it)', 'testtest@gmail.com', NULL, '$2y$12$XE7cF8KLPAM/z8OeQ6YUz.d4uH4ohMD74fZsVKx4L91H4wdiE9X.e', NULL, '2023-12-08 21:57:31', '2023-12-08 21:57:31'),
(6, 'test', 'TEST2@gmail.com', NULL, '$2y$12$6Tj5.zVLd2vdp6nSW7jKi.4XJA5tSKyJiA062IS20HwLlb5BcFG/2', NULL, '2023-12-09 20:35:53', '2023-12-09 20:35:53'),
(7, 'test', 'TEST3@gmail.com', NULL, '$2y$12$H/Ax/cUkZP3WzIGMpfNipe2foJlwHg5gRo0wLDbhJ6anpT8TunC/q', NULL, '2023-12-09 20:45:24', '2023-12-09 20:45:24'),
(8, 'test', 'TEST5@gmail.com', NULL, '$2y$12$pmDo1sQNCFbb46nJE1vR2O6fWSSE98/cICQFrJctN2TOB.Sahdaau', NULL, '2023-12-09 20:45:59', '2023-12-09 20:45:59'),
(9, 'test', 'Test6@gmail.com', NULL, '$2y$12$ECxGTbXRaMvV3/XLp/gZXO7ZzwqCYr6/76Z8iVw6kP5abMp4Xazcq', NULL, '2023-12-09 21:05:09', '2023-12-09 21:05:09'),
(10, 'f', 'f@gmail.com', NULL, '$2y$12$ToNmAt7E7YaD6/y4bgsnEuSZX/ZD/mcr2ldomAduPkft3.zzJ2kAG', NULL, '2023-12-09 21:15:17', '2023-12-09 21:15:17'),
(11, 'f', 'fp@gmail.com', NULL, '$2y$12$67Uj82bTnSo87jxBSpNqEOpbyjNmlhjp5KLwj7ONdHTTr8SLgfEFi', NULL, '2023-12-09 21:17:51', '2023-12-09 21:17:51'),
(12, 'test', 'TEST7@gmail.com', NULL, '$2y$12$CIzomnhE9yUrAJAE7Rqkv.OZImX13CLwJnwmzs2NEjXupQnnC9L.m', NULL, '2023-12-09 21:19:56', '2023-12-09 21:19:56'),
(13, 'f', 'fps@gmail.com', NULL, '$2y$12$7bfEtg6IESOMRfbI4VvK9O8Y8GTx3UigUbYyB0YkSy3XAkxdK5D3C', NULL, '2023-12-09 21:25:59', '2023-12-09 21:25:59'),
(14, 'fhh', 'fpsv@gmail.com', NULL, '$2y$12$mXf4kRhXKnUjuERyaPThg.nAZtqHRQl0hu8EN5PTaEYr0oTzyy2Si', NULL, '2023-12-09 21:26:41', '2023-12-09 21:26:41'),
(15, 'fhh', 'fpfsv@gmail.com', NULL, '$2y$12$N4VJrCVI2d/Htp65FwW5z.ui84wI1FCK9mypPyYRfMJn4K6witPhy', NULL, '2023-12-09 21:27:46', '2023-12-09 21:27:46'),
(16, 'test', 'TEST8@gmail.com', NULL, '$2y$12$wQqdHHZlwlWHf2KtpXumnuYULA./ty/uBuQbiltekGnvlT.Rs8vUu', NULL, '2023-12-09 21:28:59', '2023-12-09 21:28:59'),
(17, 'test', 'TEST9@gmail.com', NULL, '$2y$12$/q14iq.kIxNoOaeNne.jKOkEV1IZSifGKcCfIXvwIoASq2IGKBp/G', NULL, '2023-12-09 21:30:09', '2023-12-09 21:30:09'),
(18, 'test', 'TEST10@gmail.com', NULL, '$2y$12$mYMVM6VCqNkZZURvhKZgDeL2FrcnVi.URKoXAAMCxeFXfvMSXKy1S', NULL, '2023-12-09 21:34:16', '2023-12-09 21:34:16'),
(19, 'test', 'TEST11@gmail.com', NULL, '$2y$12$NPyce0POqwplBX4/69qUc.HXvhgo8pqQZf53e8q38tcEcPIuZ/0Aq', NULL, '2023-12-09 21:36:25', '2023-12-09 21:36:25'),
(20, 'test', 'TEST12@gmail.com', NULL, '$2y$12$BA8JjdKUCs1CBLUUaCerA.2ggyeN4RpkRZpHCl9wmP9/Ty05zpm/m', NULL, '2023-12-09 21:38:37', '2023-12-09 21:38:37'),
(21, 'test', 'TEST15@gmail.com', NULL, '$2y$12$0h7qI8uuTuvqP4zsogzRX.vFyZOY4uJ0VvfrDs0.wauSgBklebM1a', NULL, '2023-12-09 22:01:16', '2023-12-09 22:01:16'),
(22, 'test', 'TEST16@gmail.com', NULL, '$2y$12$.RSEstCYaMaPFfn/RQtV4.j47CX8sDnoJktRd/JLkTLnoDwT8sGaK', NULL, '2023-12-09 22:05:32', '2023-12-09 22:05:32'),
(23, 'test', 'TEST19@gmail.com', NULL, '$2y$12$iyfxnhyvMsVSnLxlKd5/eOV2loe9Ns/n9nXDhoEb97fDlkjg7vFo6', NULL, '2023-12-09 22:14:15', '2023-12-09 22:14:15'),
(24, 's', 's@gmail.com', NULL, '$2y$12$qa6yL5r5ixi.ZlpDdzCsheVq5pt41Ev3bXARR8Dkk8f10gcztROMO', NULL, '2023-12-09 22:59:19', '2023-12-09 22:59:19'),
(25, 's', 'sf@gmail.com', NULL, '$2y$12$RNHcwtkRKnE3BcRzXLzMs.nRoHOdRLpZ732KR5foxsoMBmKeYcQSe', NULL, '2023-12-09 23:02:09', '2023-12-09 23:02:09'),
(26, 'test', 'TEST20@gmail.com', NULL, '$2y$12$iQxAxoeGVFdPTtOONVCamuK3hLtkaiXj9BA5eejDke907xCqx9kEq', NULL, '2023-12-09 23:08:32', '2023-12-09 23:08:32'),
(27, 'test', 'TEST21@gmail.com', NULL, '$2y$12$vaeekYf/MChr.MGGx8/nZuD6/eNgTbus59sWE1PvFK8HdCVYscczm', NULL, '2023-12-09 23:41:02', '2023-12-09 23:41:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notebooks`
--
ALTER TABLE `notebooks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `notebook_id` (`notebook_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `notebooks`
--
ALTER TABLE `notebooks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `notebooks`
--
ALTER TABLE `notebooks`
  ADD CONSTRAINT `notebooks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notes_ibfk_2` FOREIGN KEY (`notebook_id`) REFERENCES `notebooks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
