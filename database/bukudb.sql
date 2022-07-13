-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2022 at 06:26 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bukudb`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `buku_isbn` char(13) NOT NULL,
  `buku_judul` varchar(50) NOT NULL,
  `penerbit_id` char(4) NOT NULL,
  `buku_tglterbit` date NOT NULL,
  `buku_jmlhalaman` int(11) NOT NULL,
  `buku_deskripsi` text NOT NULL,
  `buku_harga` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`buku_isbn`, `buku_judul`, `penerbit_id`, `buku_tglterbit`, `buku_jmlhalaman`, `buku_deskripsi`, `buku_harga`) VALUES
('222-34222-1-0', 'Mudah Belajar Photoshop', 'PB01', '2012-06-01', 300, '', '42000'),
('222-34222-1-1', 'Panduan Corel Draw', 'PB02', '2012-06-09', 400, '', '55000'),
('666-96771-2-0', 'Panduan Jaringan TCP/IP', 'PB08', '2013-06-08', 200, '', '60000');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `kategori_id` int(11) NOT NULL,
  `kategori_nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`kategori_id`, `kategori_nama`) VALUES
(1, 'Basis Data'),
(2, 'Desain Grafis'),
(3, 'Jaringan Komputer'),
(4, 'Pemrograman'),
(5, 'Web dan Internet'),
(6, 'Office Application');

-- --------------------------------------------------------

--
-- Table structure for table `link_buku_kategori`
--

CREATE TABLE `link_buku_kategori` (
  `buku_isbn` char(13) NOT NULL,
  `kategori_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `link_buku_kategori`
--

INSERT INTO `link_buku_kategori` (`buku_isbn`, `kategori_id`) VALUES
('222-34222-1-0', 2),
('222-34222-1-1', 2),
('666-96771-2-0', 3);

-- --------------------------------------------------------

--
-- Table structure for table `link_buku_pengarang`
--

CREATE TABLE `link_buku_pengarang` (
  `buku_isbn` char(13) NOT NULL,
  `pengarang_id` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `link_buku_pengarang`
--

INSERT INTO `link_buku_pengarang` (`buku_isbn`, `pengarang_id`) VALUES
('222-34222-1-0', 'ASW'),
('222-34222-1-1', 'DAR'),
('666-96771-2-0', 'ERD');

-- --------------------------------------------------------

--
-- Table structure for table `penerbit`
--

CREATE TABLE `penerbit` (
  `penerbit_id` char(4) NOT NULL,
  `penerbit_nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penerbit`
--

INSERT INTO `penerbit` (`penerbit_id`, `penerbit_nama`) VALUES
('PB01', 'ANGKASA RAYA'),
('PB02', 'CAHAYA ILMU PERSADA'),
('PB03', 'SINAR ILMU PERKASA'),
('PB04', 'INTAN'),
('PB05', 'SINAR RAYA'),
('PB06', 'INFORMATIKA'),
('PB07', 'TIGA SEKAWAN'),
('PB08', 'CIPTA ILMU');

-- --------------------------------------------------------

--
-- Table structure for table `pengarang`
--

CREATE TABLE `pengarang` (
  `pengarang_id` char(3) NOT NULL,
  `pengarang_nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengarang`
--

INSERT INTO `pengarang` (`pengarang_id`, `pengarang_nama`) VALUES
('ASW', 'Andi Setiawan'),
('BRH', 'Budi Raharjo'),
('BTO', 'Beni Tito'),
('DAR', 'Dewi Aulia R.'),
('ERD', 'Erik Rusdianto'),
('ERK', 'E. Rosdiana K.'),
('FDY', 'Fredi Hidayat'),
('GZL', 'Abdul Gozali'),
('HND', 'Hasanudin'),
('HNF', 'A. Hanafi'),
('IGN', 'Iwan Gunadi'),
('IHR', 'Imam Heryanto'),
('TTK', 'Totok Triwibowo');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`buku_isbn`),
  ADD KEY `penerbit_id` (`penerbit_id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indexes for table `link_buku_kategori`
--
ALTER TABLE `link_buku_kategori`
  ADD KEY `buku_isbn` (`buku_isbn`),
  ADD KEY `kategori_id` (`kategori_id`);

--
-- Indexes for table `link_buku_pengarang`
--
ALTER TABLE `link_buku_pengarang`
  ADD KEY `buku_isbn` (`buku_isbn`),
  ADD KEY `pengarang_id` (`pengarang_id`);

--
-- Indexes for table `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`penerbit_id`);

--
-- Indexes for table `pengarang`
--
ALTER TABLE `pengarang`
  ADD PRIMARY KEY (`pengarang_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`penerbit_id`) REFERENCES `penerbit` (`penerbit_id`);

--
-- Constraints for table `link_buku_kategori`
--
ALTER TABLE `link_buku_kategori`
  ADD CONSTRAINT `link_buku_kategori_ibfk_1` FOREIGN KEY (`buku_isbn`) REFERENCES `buku` (`buku_isbn`),
  ADD CONSTRAINT `link_buku_kategori_ibfk_2` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`kategori_id`);

--
-- Constraints for table `link_buku_pengarang`
--
ALTER TABLE `link_buku_pengarang`
  ADD CONSTRAINT `link_buku_pengarang_ibfk_1` FOREIGN KEY (`buku_isbn`) REFERENCES `buku` (`buku_isbn`),
  ADD CONSTRAINT `link_buku_pengarang_ibfk_2` FOREIGN KEY (`pengarang_id`) REFERENCES `pengarang` (`pengarang_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
