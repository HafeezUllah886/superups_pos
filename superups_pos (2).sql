-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 03, 2023 at 04:07 PM
-- Server version: 10.6.12-MariaDB-cll-lve
-- PHP Version: 8.1.17

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
(1, 500, 0, 'Item Purchased', 'Item Purchased', '2023-05-27 07:04:41', NULL, 1, NULL, 0, 0, 1, 0),
(2, 500, 0, 'Item Purchased', 'Item Purchased', '2023-05-27 07:06:09', NULL, 1, 1, 0, 2, 3, 0),
(3, 500, 0, 'Item Purchased', 'Item Purchased', '2023-05-27 07:08:36', NULL, 1, NULL, 0, 0, 4, 0),
(4, 200, 0, 'Item Purchased', 'Item Purchased', '2023-05-27 07:08:54', NULL, 2, NULL, 0, 0, 5, 0),
(5, 500, 0, 'Item Purchased', 'Item Purchased', '2023-05-27 07:12:40', NULL, 1, NULL, 0, 0, 8, 0),
(6, 200, 0, 'Item Purchased', 'Item Purchased', '2023-05-27 07:13:07', NULL, 2, 1, 0, 1, 9, 0),
(7, 100, 0, 'Item Purchased', 'Item Purchased', '2023-05-27 07:14:58', NULL, 2, NULL, 0, 0, 12, 0),
(8, 200, 0, 'Item Purchased', 'Item Purchased', '2023-05-27 08:06:03', NULL, 2, NULL, 0, 0, 13, 0),
(10, 0, 0, 'Return = Veyron 1.2 Kw | Quantity = 1 | Price = 500 | Total = 500,', NULL, '2023-05-27 08:14:33', NULL, 5, NULL, 0, 0, 13, 0),
(11, 0, 500, '45', 'Expense', '2023-05-26 16:00:00', '2023-05-27 10:23:23', 1, NULL, 0, 0, NULL, 1),
(12, 0, 200, '000', 'Expense', '2023-05-15 16:00:00', '2023-05-27 10:23:54', 1, NULL, 0, 0, NULL, 1),
(13, 100, 0, 'Item Purchased', 'Item Purchased', '2023-05-25 11:33:38', NULL, 2, NULL, 0, 0, 14, 0),
(15, 0, 200, 'roti', 'Expense', '2023-05-26 16:00:00', '2023-05-27 12:18:59', 1, 1, 0, 2, NULL, 1),
(16, 200, 0, 'Item Purchased', 'Item Purchased', '2023-05-25 12:44:51', NULL, 2, 1, 0, 2, 18, 0);

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
(1, 'Walking Customer', '500', '1', 1, '2023-05-27 07:04:41', '2023-05-27 07:04:41', 0, 'Item Purchased', NULL, 500, 0),
(2, 'Walking Customer', '500', '1', 1, '2023-05-27 07:05:19', '2023-05-27 07:05:19', 0, 'Item Purchased', NULL, 0, 0),
(3, 'Walking Customer', '500', '1', 1, '2023-05-27 07:06:09', '2023-05-27 07:06:09', 2, 'Item Purchased', 1, 500, 0),
(4, 'Walking Customer', '500', '1', 1, '2023-05-27 07:08:36', '2023-05-27 07:08:36', 0, 'Item Purchased', NULL, 500, 0),
(5, 'Walking Customer', '500', '1', 1, '2023-05-27 07:08:54', '2023-05-27 07:08:54', 0, 'Item Purchased', NULL, 200, 0),
(6, 'Walking Customer', '500', '1', 1, '2023-05-27 07:09:21', '2023-05-27 07:09:21', 0, 'Item Purchased', NULL, 0, 0),
(7, 'Walking Customer', '500', '1', 1, '2023-05-27 07:12:26', '2023-05-27 07:12:26', 0, 'Item Purchased', NULL, 0, 0),
(8, 'Walking Customer', '500', '1', 1, '2023-05-27 07:12:40', '2023-05-27 07:12:40', 0, 'Item Purchased', NULL, 500, 0),
(9, 'Walking Customer', '500', '1', 1, '2023-05-27 07:13:07', '2023-05-27 07:13:07', 1, 'Item Purchased', 1, 200, 0),
(10, 'Walking Customer', '500', '1', 1, '2023-05-27 07:13:45', '2023-05-27 07:13:45', 0, 'Item Purchased', NULL, 0, 0),
(12, 'Walking Customer', '500', '1', 1, '2023-05-27 07:14:58', '2023-05-27 07:14:58', 0, 'Item Purchased', NULL, 100, 0),
(13, 'Walking Customer', '0', '0', 1, '2023-05-27 08:06:03', '2023-05-27 08:14:33', 0, 'Item Purchased', NULL, 200, 0),
(14, 'Walking Customer', '500', '1', 1, '2023-05-25 11:33:38', '2023-05-27 11:33:38', 0, 'Item Purchased', NULL, 100, 0),
(15, 'Walking Customer', '500', '1', 1, '2023-05-26 11:34:04', '2023-05-27 11:34:04', 0, 'Item Purchased', NULL, 0, 0),
(17, 'Walking Customer', '1000', '1', 1, '2023-05-27 12:43:06', '2023-05-27 12:43:06', 0, 'Item Purchased', NULL, 0, 0),
(18, 'Walking Customer', '500', '1', 8, '2023-05-25 12:44:51', '2023-05-27 12:44:51', 2, 'Item Purchased', 1, 200, 0);

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
(1, NULL, 'Veyron 1.2 Kw', 20, '400', 8000, 0, '2023-05-27 06:51:16', NULL),
(2, 2, 'Veyron 1.2 Kw', 1, '500', 500, 0, '2023-05-27 07:04:41', NULL),
(3, 3, 'Veyron 1.2 Kw', 1, '500', 500, 0, '2023-05-27 07:05:19', NULL),
(4, 4, 'Veyron 1.2 Kw', 1, '500', 500, 0, '2023-05-27 07:06:09', NULL),
(5, 5, 'Veyron 1.2 Kw', 1, '500', 500, 0, '2023-05-27 07:08:36', NULL),
(6, 6, 'Veyron 1.2 Kw', 1, '500', 500, 0, '2023-05-27 07:08:54', NULL),
(7, 8, 'Veyron 1.2 Kw', 1, '500', 500, 0, '2023-05-27 07:09:21', NULL),
(8, 9, 'Veyron 1.2 Kw', 1, '500', 500, 0, '2023-05-27 07:12:26', NULL),
(9, 10, 'Veyron 1.2 Kw', 1, '500', 500, 0, '2023-05-27 07:12:40', NULL),
(10, 11, 'Veyron 1.2 Kw', 1, '500', 500, 0, '2023-05-27 07:13:07', NULL),
(11, 13, 'Veyron 1.2 Kw', 1, '500', 500, 0, '2023-05-27 07:13:45', NULL),
(13, 15, 'Veyron 1.2 Kw', 1, '500', 500, 0, '2023-05-27 07:14:58', NULL),
(14, 17, 'Veyron 1.2 Kw', 1, '500', 500, 0, '2023-05-27 08:06:03', NULL),
(16, 20, 'Veyron 1.2 Kw', 1, '500', 500, 0, '2023-05-27 08:14:33', NULL),
(17, 23, 'Veyron 1.2 Kw', 1, '500', 500, 0, '2023-05-25 11:33:38', NULL),
(18, 25, 'Veyron 1.2 Kw', 1, '500', 500, 0, '2023-05-26 11:34:04', NULL),
(19, NULL, 'Veyron 2.5 Kw', 50, '900', 45000, 0, '2023-05-27 11:55:30', NULL),
(21, 29, 'Veyron 2.5 Kw', 1, '1000', 1000, 0, '2023-05-27 12:43:06', NULL),
(22, 30, 'Veyron 1.2 Kw', 1, '500', 500, 0, '2023-05-25 12:44:51', NULL);

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
(1, 2, 8000, 'Stock Added', '2023-05-27 06:51:16', NULL, NULL, NULL, 0, NULL, 0, 0, 0, 0, NULL, 1, 0),
(2, 1, 500, 'Item Purchased', '2023-05-27 07:04:41', NULL, NULL, NULL, 0, 1, 0, 1, 0, 0, 'test', NULL, 0),
(3, 1, -500, 'Item Purchased', '2023-05-27 07:05:19', NULL, NULL, NULL, 0, 2, 0, 0, 0, 0, 'test', NULL, 0),
(4, 1, 500, 'Item Purchased', '2023-05-27 07:06:09', NULL, NULL, 1, 2, 3, 0, 1, 0, 0, 'test', NULL, 0),
(5, 1, 500, 'Item Purchased', '2023-05-27 07:08:36', NULL, NULL, NULL, 0, 4, 0, 1, 0, 0, 'test', NULL, 0),
(6, 1, 200, 'Item Purchased', '2023-05-27 07:08:54', NULL, NULL, NULL, 0, 5, 0, 2, 0, 0, 'test', NULL, 0),
(7, 1, -500, 'Item Purchased', '2023-05-27 07:08:54', NULL, NULL, NULL, 0, 5, 0, 2, 0, 0, 'test', NULL, 0),
(8, 1, -500, 'Item Purchased', '2023-05-27 07:09:21', NULL, NULL, NULL, 0, 6, 0, 0, 0, 0, 'test', NULL, 0),
(9, 1, -500, 'Item Purchased', '2023-05-27 07:12:26', NULL, NULL, NULL, 0, 7, 0, 0, 0, 0, 'test', NULL, 0),
(10, 1, 500, 'Item Purchased', '2023-05-27 07:12:40', NULL, NULL, NULL, 0, 8, 0, 1, 0, 0, 'test', NULL, 0),
(11, 1, 200, 'Item Purchased', '2023-05-27 07:13:07', NULL, NULL, 1, 1, 9, 0, 2, 0, 0, 'test', NULL, 0),
(12, 1, -500, 'Item Purchased', '2023-05-27 07:13:07', NULL, NULL, 1, 1, 9, 0, 2, 0, 0, 'test', NULL, 0),
(13, 1, -500, 'Item Purchased', '2023-05-27 07:13:45', NULL, NULL, NULL, 0, 10, 0, 0, 0, 0, 'test', NULL, 0),
(15, 1, 100, 'Item Purchased', '2023-05-27 07:14:58', NULL, NULL, NULL, 0, 12, 0, 2, 0, 0, 'test', NULL, 0),
(16, 1, -500, 'Item Purchased', '2023-05-27 07:14:58', NULL, NULL, NULL, 0, 12, 0, 2, 0, 0, 'test', NULL, 0),
(17, 1, 200, 'Item Purchased', '2023-05-27 08:06:03', NULL, NULL, NULL, 0, 13, 0, 2, 0, 0, 'test', NULL, 0),
(18, 1, -500, 'Item Purchased', '2023-05-27 08:06:03', NULL, NULL, NULL, 0, 13, 0, 2, 0, 0, 'test', NULL, 0),
(20, 1, 0, 'Return = Veyron 1.2 Kw | Quantity = 1 | Price = 500 | Total = 500,', '2023-05-27 08:14:33', NULL, NULL, NULL, 0, 13, 0, 0, 0, 1, 'Walking Customer', NULL, 0),
(21, NULL, -500, '45', '2023-05-27 10:23:23', '2023-05-27 10:23:23', NULL, NULL, 0, NULL, 1, 0, 0, 0, 'EXPENSE', NULL, 0),
(22, NULL, -200, '000', '2023-05-27 10:23:54', '2023-05-27 10:23:54', NULL, NULL, 0, NULL, 1, 0, 0, 0, 'EXPENSE', NULL, 0),
(23, 1, 100, 'Item Purchased', '2023-05-25 11:33:38', NULL, NULL, NULL, 0, 14, 0, 2, 0, 0, 'test', NULL, 0),
(24, 1, -500, 'Item Purchased', '2023-05-25 11:33:38', NULL, NULL, NULL, 0, 14, 0, 2, 0, 0, 'test', NULL, 0),
(25, 1, -500, 'Item Purchased', '2023-05-26 11:34:04', NULL, NULL, NULL, 0, 15, 0, 0, 0, 0, 'test', NULL, 0),
(26, 2, 45000, 'Stock Added', '2023-05-27 11:55:30', NULL, NULL, NULL, 0, NULL, 0, 0, 0, 0, NULL, 1, 0),
(28, NULL, -200, 'roti', '2023-05-27 12:18:59', '2023-05-27 12:18:59', NULL, 1, 2, NULL, 1, 0, 0, 0, 'EXPENSE', NULL, 0),
(29, 1, -1000, 'Item Purchased', '2023-05-27 12:43:06', NULL, NULL, NULL, 0, 17, 0, 0, 0, 0, 'test', NULL, 0),
(30, 8, 200, 'Item Purchased', '2023-05-25 12:44:51', NULL, NULL, 1, 2, 18, 0, 2, 0, 0, 'test', NULL, 0),
(31, 8, -500, 'Item Purchased', '2023-05-25 12:44:51', NULL, NULL, 1, 2, 18, 0, 2, 0, 0, 'test', NULL, 0);

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
(9, '1', 'Growatt 5KW', '0', NULL, '2023-05-23 12:43:14', '2023-05-23 12:43:14', '6'),
(10, '1', 'Growatt 6KW', '0', NULL, '2023-05-23 12:43:49', '2023-05-23 12:43:49', '6');

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

--
-- Dumping data for table `returndetails`
--

INSERT INTO `returndetails` (`id`, `product_id`, `qty`, `invoice_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 13, '2023-05-27 08:14:33', NULL);

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
(1, 1, 2, 400, 500, 8000, 20, 6, '2023-05-27', '2023-05-27 06:51:16', '2023-05-27 12:44:51', '0'),
(2, 3, 2, 900, 1000, 45000, 50, 49, '2023-05-27', '2023-05-27 11:55:30', '2023-05-27 12:43:06', '0');

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
(3, 'IGS', '2023-04-08 08:35:26', '2023-04-08 08:35:26', '5'),
(4, 'Amena Carpenter', '2023-04-12 14:56:23', '2023-04-12 14:56:23', '5'),
(5, 'looo', '2023-04-12 14:57:47', '2023-04-12 14:57:47', '1'),
(6, 'Growatt Inverter', '2023-05-23 12:42:27', '2023-05-23 12:42:27', '1'),
(7, 'Growatt Inverter', '2023-05-23 12:42:36', '2023-05-23 12:42:36', '1');

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
(1, 1, 1, 500, 500, 1, 500, '2023-05-27 07:04:41', '2023-05-27 07:04:41', 400, 0),
(2, 2, 1, 500, 500, 1, 500, '2023-05-27 07:05:19', '2023-05-27 07:05:19', 400, 0),
(3, 3, 1, 500, 500, 1, 500, '2023-05-27 07:06:09', '2023-05-27 07:06:09', 400, 0),
(4, 4, 1, 500, 500, 1, 500, '2023-05-27 07:08:36', '2023-05-27 07:08:36', 400, 0),
(5, 5, 1, 500, 500, 1, 500, '2023-05-27 07:08:54', '2023-05-27 07:08:54', 400, 0),
(6, 6, 1, 500, 500, 1, 500, '2023-05-27 07:09:21', '2023-05-27 07:09:21', 400, 0),
(7, 7, 1, 500, 500, 1, 500, '2023-05-27 07:12:26', '2023-05-27 07:12:26', 400, 0),
(8, 8, 1, 500, 500, 1, 500, '2023-05-27 07:12:40', '2023-05-27 07:12:40', 400, 0),
(9, 9, 1, 500, 500, 1, 500, '2023-05-27 07:13:07', '2023-05-27 07:13:07', 400, 0),
(10, 10, 1, 500, 500, 1, 500, '2023-05-27 07:13:45', '2023-05-27 07:13:45', 400, 0),
(12, 12, 1, 500, 500, 1, 500, '2023-05-27 07:14:58', '2023-05-27 07:14:58', 400, 0),
(15, 14, 1, 500, 500, 1, 500, '2023-05-25 11:33:38', '2023-05-27 11:33:38', 400, 0),
(16, 15, 1, 500, 500, 1, 500, '2023-05-26 11:34:04', '2023-05-27 11:34:04', 400, 0),
(18, 17, 3, 1000, 1000, 1, 1000, '2023-05-27 12:43:06', '2023-05-27 12:43:06', 900, 0),
(19, 18, 1, 500, 500, 1, 500, '2023-05-25 12:44:51', '2023-05-27 12:44:51', 400, 0);

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
(1, 'Ashraf Khan', 'ashraf@gmail.com', 0, NULL, '$2y$10$vXR.1KWfRnPgxt9lrDxcqegdUYEubLDlse8a.DqVPWpFlFbGVoQQu', 'DJZWl6ibZqRL7zNx1MpfzSityS2vmuBX1WWfA2ItTMKXnMj4IaYlsZ6ZXrDc', '2022-11-22 06:21:18', '2022-11-22 06:21:18', 0);

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
(6, 'IGS', NULL, NULL, '2023-04-08 08:36:35', '2023-04-08 08:36:35', 0),
(7, 'Jailani Agha', NULL, NULL, '2023-04-08 08:37:36', '2023-04-08 08:37:36', 1),
(8, 'Khan', NULL, NULL, '2023-04-15 04:51:32', '2023-04-15 04:51:32', 1),
(9, 'Jailani Agha', NULL, NULL, '2023-04-17 07:04:32', '2023-04-17 07:06:12', 1),
(10, 'Jailanii Agha', NULL, NULL, '2023-04-17 07:10:55', '2023-04-17 07:10:55', 1),
(11, 'jhbhjhg', NULL, NULL, '2023-04-17 07:18:06', '2023-04-17 07:18:06', 1),
(12, 'MZ', NULL, NULL, '2023-04-18 05:34:34', '2023-04-18 05:34:34', 1),
(13, 'imran Khan', NULL, NULL, '2023-05-09 07:10:48', '2023-05-09 07:10:48', 1),
(14, 'Abdullah Mardan', NULL, NULL, '2023-05-23 12:41:47', '2023-05-23 12:41:47', 1),
(15, 'nadeem', '03333355555', NULL, '2023-05-24 12:22:39', '2023-05-24 12:22:39', 1),
(16, 'Abdullah', NULL, 'ffgfg', '2023-05-24 12:36:43', '2023-05-24 12:36:43', 1);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `ledgerdetails`
--
ALTER TABLE `ledgerdetails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `ledgers`
--
ALTER TABLE `ledgers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `subinvoices`
--
ALTER TABLE `subinvoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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
