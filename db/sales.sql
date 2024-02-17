-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 17, 2024 at 06:37 AM
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
-- Database: `sales`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(10) NOT NULL,
  `tanggal` datetime NOT NULL,
  `id_paket` int(10) NOT NULL,
  `name` text NOT NULL,
  `no_telp` text NOT NULL,
  `address` text NOT NULL,
  `img_ktp` text DEFAULT NULL,
  `img_rumah` text DEFAULT NULL,
  `flag` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `tanggal`, `id_paket`, `name`, `no_telp`, `address`, `img_ktp`, `img_rumah`, `flag`) VALUES
(2, '2024-02-13 23:17:43', 1, 'qw', '12', 's', NULL, NULL, 0),
(3, '2024-02-13 23:23:15', 11, 'zx', '347', 'sd', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `paket`
--

CREATE TABLE `paket` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `paket`
--

INSERT INTO `paket` (`id`, `name`, `price`) VALUES
(1, 'Home 1', 100000),
(2, 'Home 2', 150000),
(3, 'Home 3', 200000);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `id_level` int(11) NOT NULL DEFAULT 3,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `fullname` varchar(100) DEFAULT 'NULL',
  `pwd` varchar(100) DEFAULT NULL,
  `flag_active` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '0:blocked 1:active ',
  `tgl_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updater` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `id_level`, `username`, `email`, `fullname`, `pwd`, `flag_active`, `tgl_update`, `updater`) VALUES
(1, 1, 'admin', 'wfransm@gmail.com', 'Admin System', '123', 1, '2024-02-14 07:24:43', '1'),
(14, 2, '1234', NULL, 'NULL', 'sales', 1, '2024-02-14 08:02:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_level`
--

CREATE TABLE `users_level` (
  `id` int(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `last_chg_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_chg_user` int(5) NOT NULL COMMENT 'user terakhir pengubah record',
  `is_active` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'status aktif 1 atau dimatikan 0(hapus)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_level`
--

INSERT INTO `users_level` (`id`, `nama`, `last_chg_time`, `last_chg_user`, `is_active`) VALUES
(1, 'Admin', '2020-09-25 19:09:36', 1, 1),
(2, 'Sales', '2020-09-26 01:42:00', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `users_level`
--
ALTER TABLE `users_level`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `paket`
--
ALTER TABLE `paket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users_level`
--
ALTER TABLE `users_level`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
