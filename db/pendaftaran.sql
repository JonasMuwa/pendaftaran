-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2022 at 01:50 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pendaftaran`
--

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id` int(11) NOT NULL,
  `nilai_un` double DEFAULT NULL,
  `nilai_us` double DEFAULT NULL,
  `nilai_uts_1` double NOT NULL,
  `status` int(1) NOT NULL,
  `pendaftar_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`id`, `nilai_un`, `nilai_us`, `nilai_uts_1`, `status`, `pendaftar_id`) VALUES
(1, 80, 80, 80, 1, 1),
(2, 90, 90, 90, 1, 2),
(3, 80, 80, 80, 2, 3),
(4, 90, 90, 90, 1, 4),
(6, 80, 90, 85, 0, 6),
(7, 80, 85, 75, 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `pendaftar`
--

CREATE TABLE `pendaftar` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `tmpt_lahir` varchar(100) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `agama` varchar(45) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telepon` varchar(45) DEFAULT NULL,
  `foto` varchar(100) NOT NULL,
  `users_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pendaftar`
--

INSERT INTO `pendaftar` (`id`, `nama`, `tmpt_lahir`, `tgl_lahir`, `jenis_kelamin`, `agama`, `alamat`, `email`, `telepon`, `foto`, `users_id`) VALUES
(1, 'josi', 'Cancar', '1999-06-22', 'L', 'Katolik', 'Cancar', 'est23.edi@gmail.com', '082302002407', '', 9),
(2, 'Ovin Mado', 'Labuan Bajo', '1998-08-12', 'P', 'Katolik', 'Labuan Bajo', 'ovin@gmail.com', '082302002407', '', 10),
(3, 'Tetin', 'Mukun', '1999-01-11', 'P', 'Katolik', 'Mukun', 'tetin@gmail.com', '08123456789', '', 11),
(4, 'Abel', 'Rende', '1999-01-01', 'L', 'islam', 'Rende', 'abel@gmail.com', '08123456789', '', 12),
(6, 'jonas', 'Kuwu', '1998-09-21', 'L', 'katolik', 'Kuwu', 'jonas@gmail', '081359924093', '', 14),
(7, 'Demario Pratama', 'Dongang', '1999-09-20', 'L', 'katolik', 'Dongang', 'pratama@gmail.com', '081359924093', 'Demario Pratama.jpg', 15);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `level` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama`, `username`, `password`, `level`) VALUES
(8, 'Administrator', 'admin@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'admin'),
(9, 'Chika', 'chika@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'siswa'),
(10, 'ovin', 'ovin@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'siswa'),
(11, 'Tetin', 'tetin@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'siswa'),
(12, 'Abel', 'abel@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'siswa'),
(14, 'jonas', 'jonas@gmail', '827ccb0eea8a706c4c34a16891f84e7b', 'siswa'),
(15, 'Demario Pratama', 'pratama@gmail.com', 'de2f15d014d40b93578d255e6221fd60', 'siswa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_nilai_pendaftar1_idx` (`pendaftar_id`);

--
-- Indexes for table `pendaftar`
--
ALTER TABLE `pendaftar`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD KEY `fk_pendaftar_users_idx` (`users_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pendaftar`
--
ALTER TABLE `pendaftar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `fk_nilai_pendaftar1` FOREIGN KEY (`pendaftar_id`) REFERENCES `pendaftar` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pendaftar`
--
ALTER TABLE `pendaftar`
  ADD CONSTRAINT `fk_pendaftar_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
