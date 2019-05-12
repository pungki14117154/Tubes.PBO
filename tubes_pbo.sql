-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2019 at 04:11 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tubes_pbo`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Id_admin` char(5) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Id_admin`, `username`, `password`) VALUES
('IF01', 'adm_IF01', 'adm_IF01'),
('IF02', 'adm_IF02', 'adm_IF02'),
('PWK01', 'adm_PWK01', 'adm_PWK01');

-- --------------------------------------------------------

--
-- Table structure for table `info_materi`
--

CREATE TABLE `info_materi` (
  `id_materi` int(15) NOT NULL,
  `judul_materi` text,
  `tanggal_kegiatan` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `info_materi`
--

INSERT INTO `info_materi` (`id_materi`, `judul_materi`, `tanggal_kegiatan`) VALUES
(1, 'manfaat membolos dimasa sekarang', '2019-11-20');

-- --------------------------------------------------------

--
-- Table structure for table `info_sg`
--

CREATE TABLE `info_sg` (
  `Id_SG` varchar(5) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `waktu` time DEFAULT NULL,
  `tempat` varchar(50) DEFAULT NULL,
  `pengisi_materi` varchar(50) DEFAULT NULL,
  `korum_kegiatan` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `info_sg`
--

INSERT INTO `info_sg` (`Id_SG`, `tanggal`, `waktu`, `tempat`, `pengisi_materi`, `korum_kegiatan`) VALUES
('1', '2019-11-20', NULL, NULL, 'Dr. Rahmat Fitriadi', 250),
('if001', '2019-11-20', '09:00:00', 'aula gedung e', 'ahmad luky', 100),
('if003', '2019-11-08', '08:00:00', 'aula gedung c', 'arif', 111),
('IF009', '2019-10-09', '10:00:00', 'aula gedung c', 'indra', 90);

-- --------------------------------------------------------

--
-- Table structure for table `peserta`
--

CREATE TABLE `peserta` (
  `id_peserta` int(15) NOT NULL,
  `user_email` varchar(150) DEFAULT NULL,
  `nim` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peserta`
--

INSERT INTO `peserta` (`id_peserta`, `user_email`, `nim`) VALUES
(1, 'wili.14115012@student.itera.ac.id', 14115012),
(2, 'rahmat.14115017@student.itera.ac.id', 14115017);

-- --------------------------------------------------------

--
-- Table structure for table `upload`
--

CREATE TABLE `upload` (
  `id_upload` int(11) NOT NULL,
  `nama_upload_tugas` varchar(50) DEFAULT NULL,
  `nim` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `upload`
--

INSERT INTO `upload` (`id_upload`, `nama_upload_tugas`, `nim`) VALUES
(1, 'wejangan sehat dari Dr. rahmat fitriadi', 14115017);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Id_admin`);

--
-- Indexes for table `info_materi`
--
ALTER TABLE `info_materi`
  ADD PRIMARY KEY (`id_materi`),
  ADD KEY `tanggal_kegiatan` (`tanggal_kegiatan`);

--
-- Indexes for table `info_sg`
--
ALTER TABLE `info_sg`
  ADD PRIMARY KEY (`Id_SG`),
  ADD KEY `tanggal` (`tanggal`);

--
-- Indexes for table `peserta`
--
ALTER TABLE `peserta`
  ADD PRIMARY KEY (`id_peserta`),
  ADD KEY `nim` (`nim`);

--
-- Indexes for table `upload`
--
ALTER TABLE `upload`
  ADD PRIMARY KEY (`id_upload`),
  ADD KEY `nim` (`nim`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `info_materi`
--
ALTER TABLE `info_materi`
  MODIFY `id_materi` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `peserta`
--
ALTER TABLE `peserta`
  MODIFY `id_peserta` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `upload`
--
ALTER TABLE `upload`
  MODIFY `id_upload` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `info_materi`
--
ALTER TABLE `info_materi`
  ADD CONSTRAINT `info_materi_ibfk_1` FOREIGN KEY (`tanggal_kegiatan`) REFERENCES `info_sg` (`tanggal`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `upload`
--
ALTER TABLE `upload`
  ADD CONSTRAINT `upload_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `peserta` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
