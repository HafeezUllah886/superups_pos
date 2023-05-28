-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2023 at 08:37 AM
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
-- Database: `superups_pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `bankbalances`
--

CREATE TABLE `bankbalances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bank_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `detail` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `detail` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `bank_name`, `created_at`, `updated_at`, `detail`) VALUES
(1, 'Mcb', '2023-05-09 05:12:30', '2023-05-09 05:12:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'UPS', '2023-04-03 05:00:30', '2023-04-03 05:00:30'),
(3, 'Samersebal', '2023-04-05 08:31:58', '2023-04-05 08:31:58'),
(5, 'BATTERY', '2023-04-08 08:35:13', '2023-04-08 08:35:13');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `credit` int(11) NOT NULL DEFAULT 0,
  `debit` int(11) NOT NULL DEFAULT 0,
  `detail` text DEFAULT NULL,
  `detail_hidden` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 0,
  `bank` int(11) DEFAULT NULL,
  `bank_balance` tinyint(4) NOT NULL DEFAULT 0,
  `payment_type` tinyint(4) NOT NULL DEFAULT 0,
  `invoice_id` int(20) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 => all expense or income,1 => only added by expense tab'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `credit`, `debit`, `detail`, `detail_hidden`, `created_at`, `updated_at`, `type`, `bank`, `bank_balance`, `payment_type`, `invoice_id`, `status`) VALUES
(1, 0, 2000, 'Stock Added', 'Stock Added', '2023-05-09 05:14:09', NULL, 1, 1, 0, 1, NULL, 0),
(2, 0, 4000, 'Stock Added', 'Stock Added', '2023-05-09 05:14:45', NULL, 1, 1, 0, 2, NULL, 0),
(3, 0, 500, 'Stock Added', 'Stock Added', '2023-05-09 07:07:33', NULL, 2, 1, 0, 2, NULL, 0),
(4, 500, 0, 'Item Purchased', 'Item Purchased', '2023-05-09 07:11:24', NULL, 1, NULL, 0, 0, 1, 0),
(6, 200, 0, 'Cash', NULL, '2023-05-09 07:13:54', NULL, 4, NULL, 1, 0, NULL, 0),
(7, 4500, 0, 'Item Purchased', 'Item Purchased', '2023-05-09 07:27:16', NULL, 2, 1, 0, 2, 4, 0),
(8, 0, 100, 'yut', 'Expense', '2023-05-09 07:29:07', '2023-05-09 07:29:07', 1, NULL, 0, 0, NULL, 1),
(9, 0, 100, 'yut', 'Expense', '2023-05-09 07:29:18', '2023-05-09 07:29:18', 1, 1, 0, 2, NULL, 1),
(10, 200, 0, 'fdgd', NULL, '2023-05-09 10:08:50', NULL, 4, NULL, 1, 0, NULL, 0),
(11, 500, 0, 'Item Purchased', 'Item Purchased', '2023-05-10 09:56:32', NULL, 1, NULL, 0, 0, 5, 0),
(12, 200, 0, 'Item Purchased', 'Item Purchased', '2023-05-02 07:12:32', NULL, 2, NULL, 0, 0, 3, 0),
(13, 0, 1000, 'fsdfsdf', 'Expense', '2023-05-12 05:43:24', '2023-05-12 05:43:24', 1, NULL, 0, 0, NULL, 1),
(14, 1000, 0, 'Item Purchased', 'Item Purchased', '2023-05-12 05:44:26', NULL, 1, NULL, 0, 0, 6, 0),
(15, 1000, 0, 'Item Purchased', 'Item Purchased', '2023-05-03 03:29:05', NULL, 1, NULL, 0, 0, 7, 0),
(16, 1000, 0, 'A/C Grill Set Suzuki Osaka  China Body', NULL, '2023-05-26 11:44:47', NULL, 4, NULL, 1, 0, NULL, 0),
(17, 0, 25000, 'Stock Added', 'Stock Added', '2023-05-26 12:06:50', NULL, 1, NULL, 0, 0, NULL, 0),
(18, 0, 10000, 'Stock Added', 'Stock Added', '2023-05-26 12:08:35', NULL, 2, NULL, 0, 0, NULL, 0),
(19, 0, 20000, 'Stock Added', 'Stock Added', '2023-05-26 12:11:26', NULL, 1, NULL, 0, 0, NULL, 0),
(20, 0, 5000, 'Stock Added', 'Stock Added', '2023-05-26 12:12:03', NULL, 2, NULL, 0, 0, NULL, 0),
(21, 0, 567, 'jkhjk', 'Expense', '2023-05-26 12:14:01', '2023-05-26 12:14:01', 1, NULL, 0, 0, NULL, 1),
(22, 0, 788, 'ihkh', 'Expense', '2023-05-26 12:14:14', '2023-05-26 12:14:14', 1, NULL, 0, 0, NULL, 1),
(23, 0, 3000, 'Latest', 'Expense', '2023-05-26 12:14:38', '2023-05-26 12:14:38', 1, NULL, 0, 0, NULL, 1),
(27, 0, 1232312, 'test entry', 'Expense', '2023-05-25 19:00:00', '2023-05-26 14:24:01', 1, NULL, 0, 0, NULL, 1),
(28, 0, 90000, 'Stock Added', 'Stock Added', '2023-05-27 20:01:23', NULL, 1, NULL, 0, 0, NULL, 0),
(29, 0, 2200, 'Stock Added', 'Stock Added', '2023-05-27 20:04:48', NULL, 1, NULL, 0, 0, NULL, 0);

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
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `total_amount` varchar(255) NOT NULL,
  `total_qty` varchar(255) NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_type` tinyint(4) NOT NULL DEFAULT 0,
  `detail` text DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `paid_amount` int(11) DEFAULT NULL,
  `discount` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `customer_name`, `total_amount`, `total_qty`, `customer_id`, `created_at`, `updated_at`, `payment_type`, `detail`, `bank`, `paid_amount`, `discount`) VALUES
(1, 'Walking Customer', '500', '1', 13, '2023-05-09 07:11:24', '2023-05-09 07:11:24', 0, 'Item Purchased', NULL, 500, 0),
(2, 'Walking Customer', '500', '1', 13, '2023-05-09 07:11:57', '2023-05-09 07:11:57', 0, 'Item Purchased', NULL, 0, 0),
(3, 'Walking Customer', '500', '1', 13, '2023-05-02 07:12:32', '2023-05-10 09:58:39', 0, 'Item Purchased', NULL, 200, 0),
(4, 'Walking Customer', '5000', '10', 13, '2023-05-09 07:27:16', '2023-05-09 07:27:16', 2, 'Item Purchased', 1, 4500, 0),
(5, 'Walking Customer', '500', '1', NULL, '2023-05-10 09:56:32', '2023-05-10 09:56:32', 0, 'Item Purchased', NULL, 500, 0),
(6, 'Walking Customer', '1000', '2', 14, '2023-05-12 05:44:26', '2023-05-12 05:44:26', 0, 'Item Purchased', NULL, 1000, 0),
(7, 'Walking Customer', '1000', '2', 1, '2023-05-03 03:29:05', '2023-05-15 03:29:06', 0, 'Item Purchased', NULL, 1000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ledgerdetails`
--

CREATE TABLE `ledgerdetails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ledger_id` bigint(20) UNSIGNED DEFAULT NULL,
  `lproduct` varchar(400) DEFAULT NULL,
  `lqty` int(11) DEFAULT NULL,
  `lprice` varchar(400) DEFAULT NULL,
  `ltotal` int(11) DEFAULT NULL,
  `type` tinyint(4) NOT NULL COMMENT '0 => ledger, 1 => Expense',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ledgerdetails`
--

INSERT INTO `ledgerdetails` (`id`, `ledger_id`, `lproduct`, `lqty`, `lprice`, `ltotal`, `type`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Veyron 1.2 Kw', 10, '400', 4000, 0, '2023-05-09 05:12:47', NULL),
(2, NULL, 'Veyron 1.2 Kw', 5, '400', 2000, 0, '2023-05-09 05:14:09', NULL),
(3, NULL, 'Veyron 1.2 Kw', 10, '400', 4000, 0, '2023-05-09 05:14:45', NULL),
(4, NULL, 'Veyron 1.2 Kw', 2, '400', 800, 0, '2023-05-09 07:07:33', NULL),
(5, 6, 'Veyron 1.2 Kw', 1, '500', 500, 0, '2023-05-09 07:11:24', NULL),
(6, 7, 'Veyron 1.2 Kw', 1, '500', 500, 0, '2023-05-09 07:11:57', NULL),
(9, 12, 'Veyron 1.2 Kw', 10, '500', 5000, 0, '2023-05-09 07:27:16', NULL),
(10, 17, 'Veyron 1.2 Kw', 1, '500', 500, 0, '2023-05-10 09:56:32', NULL),
(11, 18, 'Veyron 1.2 Kw', 1, '500', 500, 0, '2023-05-02 07:12:32', NULL),
(12, NULL, 'test battery', 5, '10000', 50000, 0, '2023-05-11 12:12:43', NULL),
(13, 22, 'Veyron 1.2 Kw', 2, '500', 1000, 0, '2023-05-12 05:44:26', NULL),
(14, 23, 'Veyron 1.2 Kw', 2, '500', 1000, 0, '2023-05-03 03:29:05', NULL),
(15, NULL, 'Battery IGS Solar 50', 5, '5000', 25000, 0, '2023-05-26 12:06:50', NULL),
(16, NULL, 'Veyron 2.5 Kw', 6, '2500', 15000, 0, '2023-05-26 12:08:35', NULL),
(17, NULL, 'Battery IGS Solar 50', 2, '10000', 20000, 0, '2023-05-26 12:11:26', NULL),
(18, NULL, 'Veyron 2.5 Kw', 4, '2500', 10000, 0, '2023-05-26 12:12:03', NULL),
(19, NULL, 'laptop', 45, '2000', 90000, 0, '2023-05-27 20:01:23', NULL),
(20, NULL, 'pc', 11, '100', 1100, 0, '2023-05-27 20:03:45', NULL),
(21, NULL, 'Battery IGS Solar 50', 22, '100', 2200, 0, '2023-05-27 20:04:48', NULL),
(22, NULL, 'Veyron 2.5 Kw', 10, '500', 5000, 0, '2023-05-27 20:05:45', NULL),
(23, NULL, 'test battery', 5, '2000', 10000, 0, '2023-05-27 20:07:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ledgers`
--

CREATE TABLE `ledgers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` bigint(20) NOT NULL,
  `details` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stock_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`stock_id`)),
  `bank` int(11) DEFAULT NULL,
  `payment_type` tinyint(4) NOT NULL DEFAULT 0,
  `invoice_id` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `full` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1 => full payment',
  `incentive` tinyint(4) NOT NULL DEFAULT 0,
  `return` tinyint(4) NOT NULL DEFAULT 0,
  `walking_customer` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '1= add stock',
  `sto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ledgers`
--

INSERT INTO `ledgers` (`id`, `vendor_id`, `amount`, `details`, `created_at`, `updated_at`, `stock_id`, `bank`, `payment_type`, `invoice_id`, `status`, `full`, `incentive`, `return`, `walking_customer`, `type`, `sto_id`) VALUES
(1, 2, 4000, 'Stock Added', '2023-05-09 05:12:47', NULL, NULL, NULL, 0, NULL, 0, 0, 0, 0, NULL, 1, 0),
(2, 2, 2000, 'Stock Added', '2023-05-09 05:14:09', NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, NULL, 1, 0),
(3, 2, 4000, 'Stock Added', '2023-05-09 05:14:45', NULL, NULL, 1, 2, NULL, 0, 1, 0, 0, NULL, 1, 0),
(4, 2, 800, 'Stock Added', '2023-05-09 07:07:33', NULL, NULL, 1, 2, NULL, 0, 2, 0, 0, NULL, 1, 0),
(5, 2, -500, 'Stock Added', '2023-05-09 07:07:33', NULL, NULL, 1, 2, NULL, 0, 2, 0, 0, NULL, 1, 0),
(6, 13, 500, 'Item Purchased', '2023-05-09 07:11:24', NULL, NULL, NULL, 0, 1, 0, 1, 0, 0, 'test', NULL, 0),
(7, 13, -500, 'Item Purchased', '2023-05-09 07:11:57', NULL, NULL, NULL, 0, 2, 0, 0, 0, 0, 'test', NULL, 0),
(10, 13, 200, 'Cash', '2023-05-09 07:13:54', '2023-05-09 07:13:54', NULL, NULL, 0, NULL, 1, 4, 0, 0, NULL, NULL, 0),
(12, 13, 4500, 'Item Purchased', '2023-05-09 07:27:16', NULL, NULL, 1, 2, 4, 0, 2, 0, 0, 'test', NULL, 0),
(13, 13, -5000, 'Item Purchased', '2023-05-09 07:27:16', NULL, NULL, 1, 2, 4, 0, 2, 0, 0, 'test', NULL, 0),
(14, NULL, -100, 'yut', '2023-05-09 07:29:07', '2023-05-09 07:29:07', NULL, NULL, 0, NULL, 1, 0, 0, 0, 'EXPENSE', NULL, 0),
(15, NULL, -100, 'yut', '2023-05-09 07:29:18', '2023-05-09 07:29:18', NULL, 1, 2, NULL, 1, 0, 0, 0, 'EXPENSE', NULL, 0),
(16, 1, 200, 'fdgd', '2023-05-09 10:08:50', '2023-05-09 10:08:50', NULL, NULL, 0, NULL, 1, 4, 0, 0, NULL, NULL, 0),
(17, 0, 500, 'Item Purchased', '2023-05-10 09:56:32', NULL, NULL, NULL, 0, 5, 0, 1, 0, 0, 'test', NULL, 0),
(18, 13, 200, 'Item Purchased', '2023-05-02 07:12:32', NULL, NULL, NULL, 0, 3, 0, 2, 0, 0, NULL, NULL, 0),
(19, 13, -500, 'Item Purchased', '2023-05-02 07:12:32', NULL, NULL, NULL, 0, 3, 0, 2, 0, 0, NULL, NULL, 0),
(20, 5, 50000, 'Stock Added', '2023-05-11 12:12:43', NULL, NULL, 1, 1, NULL, 0, 0, 0, 0, NULL, 1, 0),
(21, NULL, -1000, 'fsdfsdf', '2023-05-12 05:43:24', '2023-05-12 05:43:24', NULL, NULL, 0, NULL, 1, 0, 0, 0, 'EXPENSE', NULL, 0),
(22, 14, 1000, 'Item Purchased', '2023-05-12 05:44:26', NULL, NULL, NULL, 0, 6, 0, 1, 0, 0, 'test', NULL, 0),
(23, 1, 1000, 'Item Purchased', '2023-05-03 03:29:05', NULL, NULL, NULL, 0, 7, 0, 1, 0, 0, 'test', NULL, 0),
(24, 5, 1000, 'A/C Grill Set Suzuki Osaka  China Body', '2023-05-26 11:44:47', '2023-05-26 11:44:47', NULL, NULL, 0, NULL, 1, 4, 0, 0, NULL, NULL, 0),
(25, 15, 25000, 'Stock Added', '2023-05-26 12:06:50', NULL, NULL, NULL, 0, NULL, 0, 1, 0, 0, NULL, 1, 0),
(26, 15, 15000, 'Stock Added', '2023-05-26 12:08:35', NULL, NULL, NULL, 0, NULL, 0, 2, 0, 0, NULL, 1, 0),
(27, 15, -10000, 'Stock Added', '2023-05-26 12:08:35', NULL, NULL, NULL, 0, NULL, 0, 2, 0, 0, NULL, 1, 0),
(28, 16, 20000, 'Stock Added', '2023-05-26 12:11:26', NULL, NULL, NULL, 0, NULL, 0, 1, 0, 0, NULL, 1, 0),
(29, 16, 10000, 'Stock Added', '2023-05-26 12:12:03', NULL, NULL, NULL, 0, NULL, 0, 2, 0, 0, NULL, 1, 0),
(30, 16, -5000, 'Stock Added', '2023-05-26 12:12:03', NULL, NULL, NULL, 0, NULL, 0, 2, 0, 0, NULL, 1, 0),
(31, NULL, -567, 'jkhjk', '2023-05-26 12:14:01', '2023-05-26 12:14:01', NULL, NULL, 0, NULL, 1, 0, 0, 0, 'EXPENSE', NULL, 0),
(32, NULL, -788, 'ihkh', '2023-05-26 12:14:14', '2023-05-26 12:14:14', NULL, NULL, 0, NULL, 1, 0, 0, 0, 'EXPENSE', NULL, 0),
(33, NULL, -3000, 'Latest', '2023-05-26 12:14:38', '2023-05-26 12:14:38', NULL, NULL, 0, NULL, 1, 0, 0, 0, 'EXPENSE', NULL, 0),
(34, NULL, -123, 'This is a test expense', '2023-05-26 14:01:43', '2023-05-26 14:01:43', NULL, NULL, 0, NULL, 1, 0, 0, 0, 'EXPENSE', NULL, 0),
(35, NULL, -6655, 'Test Entry', '2023-05-26 14:20:45', '2023-05-26 14:20:45', NULL, NULL, 0, NULL, 1, 0, 0, 0, 'EXPENSE', NULL, 0),
(36, NULL, -3232, 'Test Entry', '2023-05-26 14:21:48', '2023-05-26 14:21:48', NULL, NULL, 0, NULL, 1, 0, 0, 0, 'EXPENSE', NULL, 0),
(37, NULL, -1232312, 'test entry', '2023-05-26 14:24:01', '2023-05-26 14:24:01', NULL, NULL, 0, NULL, 1, 0, 0, 0, 'EXPENSE', NULL, 0),
(38, 13, 90000, 'Stock Added', '2023-05-27 20:01:23', NULL, NULL, NULL, 0, NULL, 0, 1, 0, 0, NULL, 1, 0),
(39, 13, 1100, 'Stock Added', '2023-05-27 20:03:45', NULL, NULL, NULL, 0, NULL, 0, 0, 0, 0, NULL, 1, 0),
(40, 13, 2200, 'Stock Added', '2023-05-27 20:04:48', NULL, NULL, NULL, 0, NULL, 0, 1, 0, 0, NULL, 1, 0),
(41, 13, 5000, 'Stock Added', '2023-05-27 20:05:45', NULL, NULL, NULL, 0, NULL, 0, 0, 0, 0, NULL, 1, 0),
(42, 13, 10000, 'Stock Added', '2023-05-27 20:07:24', NULL, NULL, NULL, 0, NULL, 0, 0, 0, 0, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
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

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('hafeezullah886@gmail.com', '$2y$10$6X22S2tyuILX5BIkKnJV0Okqq/xR8sxckpH/QtO8SvrQHLGXrctN6', '2023-05-27 16:06:00');

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `p_category` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `p_color` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `p_subcategory` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `p_category`, `name`, `price`, `p_color`, `created_at`, `updated_at`, `p_subcategory`) VALUES
(1, '1', 'Veyron 1.2 Kw', '0', NULL, '2023-04-03 05:05:40', '2023-04-03 05:05:40', '1'),
(3, '1', 'Veyron 2.5 Kw', '0', NULL, '2023-04-05 07:18:05', '2023-04-05 07:18:05', '1'),
(5, '5', 'Battery IGS Solar 50', '0', NULL, '2023-04-08 08:36:17', '2023-04-08 08:36:17', '3'),
(6, '1', 'pc', '0', NULL, '2023-04-12 14:58:06', '2023-04-12 14:58:06', '1'),
(7, '3', 'laptop', '0', NULL, '2023-04-15 15:05:37', '2023-04-15 15:05:37', '2'),
(8, '5', 'test battery', '0', NULL, '2023-05-11 12:10:29', '2023-05-11 12:10:29', '3');

-- --------------------------------------------------------

--
-- Table structure for table `quotationdetails`
--

CREATE TABLE `quotationdetails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quotation_id` bigint(20) UNSIGNED NOT NULL,
  `item` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double(15,2) DEFAULT NULL,
  `discount` double(15,2) DEFAULT NULL,
  `gst` double(15,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_no` varchar(255) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `ntn` varchar(255) DEFAULT NULL,
  `cnic` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `listing_name` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `returndetails`
--

CREATE TABLE `returndetails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `price` bigint(20) NOT NULL,
  `sale_price` bigint(20) DEFAULT NULL,
  `total` bigint(20) NOT NULL,
  `qty_received` bigint(20) NOT NULL,
  `qty` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id`, `product_id`, `vendor_id`, `price`, `sale_price`, `total`, `qty_received`, `qty`, `date`, `created_at`, `updated_at`, `type`) VALUES
(1, 1, 2, 400, 500, 4000, 10, 2, '2023-05-09', '2023-05-09 05:12:47', '2023-05-15 03:29:06', '0'),
(2, 1, 2, 400, 500, 2000, 5, 5, '2023-05-09', '2023-05-09 05:14:09', NULL, '1'),
(3, 1, 2, 400, 500, 4000, 10, 0, '2023-05-09', '2023-05-09 05:14:45', '2023-05-09 07:27:16', '1'),
(4, 1, 2, 400, 500, 800, 2, 2, '2023-05-09', '2023-05-09 07:07:33', NULL, '2'),
(5, 8, 5, 10000, 15000, 50000, 5, 5, '2023-05-11', '2023-05-11 12:12:43', NULL, '0'),
(6, 5, 15, 5000, 6000, 25000, 5, 5, '2023-05-03', '2023-05-26 12:06:50', NULL, '1'),
(7, 3, 15, 2500, 3000, 15000, 6, 6, '2023-05-26', '2023-05-26 12:08:35', NULL, '2'),
(8, 5, 16, 10000, 15000, 20000, 2, 2, '2023-05-26', '2023-05-26 12:11:26', NULL, '1'),
(9, 3, 16, 2500, 3000, 10000, 4, 4, '2023-05-26', '2023-05-26 12:12:03', NULL, '2'),
(10, 7, 13, 2000, 2500, 90000, 45, 45, '2023-05-28', '2023-05-27 20:01:23', NULL, '1'),
(11, 6, 13, 100, 120, 1100, 11, 11, '2023-05-28', '2023-05-27 20:03:45', NULL, '0'),
(12, 5, 13, 100, 300, 2200, 22, 22, '2023-05-28', '2023-05-27 20:04:48', NULL, '1'),
(13, 3, 13, 500, 550, 5000, 10, 10, '2023-05-28', '2023-05-27 20:05:45', NULL, '0'),
(14, 8, 13, 2000, 2300, 10000, 5, 5, '2023-05-28', '2023-05-27 20:07:24', NULL, '0');

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `name`, `created_at`, `updated_at`, `category`) VALUES
(1, 'INVEREX', '2023-04-05 07:17:35', '2023-04-05 07:17:35', '1'),
(2, 'dongyn', '2023-04-05 08:32:40', '2023-04-05 08:32:40', '3'),
(3, 'IGS', '2023-04-08 08:35:26', '2023-04-08 08:35:26', '5'),
(4, 'Amena Carpenter', '2023-04-12 14:56:23', '2023-04-12 14:56:23', '5'),
(5, 'looo', '2023-04-12 14:57:47', '2023-04-12 14:57:47', '1');

-- --------------------------------------------------------

--
-- Table structure for table `subinvoices`
--

CREATE TABLE `subinvoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `stock_id` bigint(20) UNSIGNED NOT NULL,
  `price` bigint(20) NOT NULL,
  `qty` bigint(20) NOT NULL,
  `total` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `purchase_price` bigint(20) DEFAULT NULL,
  `sto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subinvoices`
--

INSERT INTO `subinvoices` (`id`, `invoice_id`, `product_id`, `stock_id`, `price`, `qty`, `total`, `created_at`, `updated_at`, `purchase_price`, `sto_id`) VALUES
(1, 1, 1, 500, 500, 1, 500, '2023-05-09 07:11:24', '2023-05-09 07:11:24', 400, 0),
(2, 2, 1, 500, 500, 1, 500, '2023-05-09 07:11:57', '2023-05-09 07:11:57', 400, 0),
(5, 4, 1, 500, 500, 10, 5000, '2023-05-09 07:27:16', '2023-05-09 07:27:16', 400, 0),
(6, 5, 1, 500, 500, 1, 500, '2023-05-10 09:56:32', '2023-05-10 09:56:32', 400, 0),
(7, 3, 1, 500, 500, 1, 500, '2023-05-10 09:58:39', '2023-05-10 09:58:39', 400, 0),
(8, 6, 1, 500, 500, 2, 1000, '2023-05-12 05:44:26', '2023-05-12 05:44:26', 400, 0),
(9, 7, 1, 500, 500, 2, 1000, '2023-05-03 03:29:05', '2023-05-15 03:29:06', 400, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `status`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(1, 'Ashraf Khan', 'Ashraf@gmail.com', 0, NULL, '$2a$12$BsI/FO.ncwAdzWSGwp/k/eP.JMxcFKP3RA7/T7ywou7HBX36/ePNu', 'DIMwxSkU1FO0MfTq9DSMIoJbc2aimd9I8tQHxD0tptde96zhu07QZIQggVZJ', '2022-11-22 06:21:18', '2022-11-22 06:21:18', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 => vendor,1=> customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `name`, `phone`, `address`, `created_at`, `updated_at`, `type`) VALUES
(1, 'khalil', NULL, NULL, '2023-04-03 05:06:03', '2023-04-03 05:06:03', 1),
(2, 'INVEREX', NULL, NULL, '2023-04-03 05:06:39', '2023-04-03 05:06:39', 0),
(5, 'Khan', NULL, NULL, '2023-04-05 07:19:46', '2023-04-05 07:19:46', 1),
(6, 'IGS', NULL, NULL, '2023-04-08 08:36:35', '2023-04-08 08:36:35', 0),
(7, 'Jailani Agha', NULL, NULL, '2023-04-08 08:37:36', '2023-04-08 08:37:36', 1),
(8, 'Khan', NULL, NULL, '2023-04-15 04:51:32', '2023-04-15 04:51:32', 1),
(9, 'Jailani Agha', NULL, NULL, '2023-04-17 07:04:32', '2023-04-17 07:06:12', 1),
(10, 'Jailanii Agha', NULL, NULL, '2023-04-17 07:10:55', '2023-04-17 07:10:55', 1),
(11, 'jhbhjhg', NULL, NULL, '2023-04-17 07:18:06', '2023-04-17 07:18:06', 1),
(12, 'MZ', NULL, NULL, '2023-04-18 05:34:34', '2023-04-18 05:34:34', 1),
(13, 'imran Khan', NULL, NULL, '2023-05-09 07:10:48', '2023-05-09 07:10:48', 1),
(14, 'asdf', '03353401913', 'Military Station Library Aziz Bhatti Road Cantt', '2023-05-12 05:44:03', '2023-05-12 05:44:03', 1),
(15, 'Rehmat Ullah', '32424232342', NULL, '2023-05-26 12:04:43', '2023-05-26 12:04:43', 1),
(16, 'Khalid Khan', '23423423423', NULL, '2023-05-26 12:10:43', '2023-05-26 12:10:43', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bankbalances`
--
ALTER TABLE `bankbalances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bankbalances_bank_id_foreign` (`bank_id`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `ledgerdetails`
--
ALTER TABLE `ledgerdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ledgerdetails_ledger_id_foreign` (`ledger_id`);

--
-- Indexes for table `ledgers`
--
ALTER TABLE `ledgers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotationdetails`
--
ALTER TABLE `quotationdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotationdetails_quotation_id_foreign` (`quotation_id`);

--
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `returndetails`
--
ALTER TABLE `returndetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `returndetails_product_id_foreign` (`product_id`),
  ADD KEY `returndetails_invoice_id_foreign` (`invoice_id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subinvoices`
--
ALTER TABLE `subinvoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bankbalances`
--
ALTER TABLE `bankbalances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ledgerdetails`
--
ALTER TABLE `ledgerdetails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `ledgers`
--
ALTER TABLE `ledgers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `quotationdetails`
--
ALTER TABLE `quotationdetails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `returndetails`
--
ALTER TABLE `returndetails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `subinvoices`
--
ALTER TABLE `subinvoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bankbalances`
--
ALTER TABLE `bankbalances`
  ADD CONSTRAINT `bankbalances_bank_id_foreign` FOREIGN KEY (`bank_id`) REFERENCES `banks` (`id`);

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `vendors` (`id`);

--
-- Constraints for table `ledgerdetails`
--
ALTER TABLE `ledgerdetails`
  ADD CONSTRAINT `ledgerdetails_ledger_id_foreign` FOREIGN KEY (`ledger_id`) REFERENCES `ledgers` (`id`);

--
-- Constraints for table `quotationdetails`
--
ALTER TABLE `quotationdetails`
  ADD CONSTRAINT `quotationdetails_quotation_id_foreign` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`);

--
-- Constraints for table `returndetails`
--
ALTER TABLE `returndetails`
  ADD CONSTRAINT `returndetails_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  ADD CONSTRAINT `returndetails_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
