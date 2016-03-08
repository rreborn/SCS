-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 08 Mar 2016 pada 14.47
-- Versi Server: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `scs`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `artikel`
--

CREATE TABLE IF NOT EXISTS `artikel` (
  `idartikel` int(11) NOT NULL,
  `judul` varchar(45) NOT NULL,
  `isi` longtext NOT NULL,
  `tanggal_buat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL,
  `keterangan` longtext NOT NULL,
  `iduser` int(11) NOT NULL,
  `idjenis_artikel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hakses`
--

CREATE TABLE IF NOT EXISTS `hakses` (
  `idakses` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `hakses`
--

INSERT INTO `hakses` (`idakses`, `nama`) VALUES
(1, 'admin'),
(2, 'supervisor'),
(3, 'driver');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_artikel`
--

CREATE TABLE IF NOT EXISTS `jenis_artikel` (
  `idjenis_artikel` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `status` int(11) NOT NULL,
  `keterangan` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `spj`
--

CREATE TABLE IF NOT EXISTS `spj` (
  `idspj` int(11) NOT NULL,
  `nspj` varchar(45) NOT NULL,
  `tanggal_buat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `waktu_berangkat` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `waktu_kembali` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tracking` varchar(45) NOT NULL,
  `tekanan_awal` double NOT NULL,
  `tekanan_akhir` double NOT NULL,
  `cv` double NOT NULL,
  `ucv` double NOT NULL,
  `km_awal` double NOT NULL,
  `km_akhir` double NOT NULL,
  `tekanan_trailer` double NOT NULL,
  `turbin` double NOT NULL,
  `status` int(11) NOT NULL,
  `idtruk` int(11) NOT NULL,
  `iduser_supir` int(11) NOT NULL,
  `iduser_supervisor` int(11) NOT NULL,
  `idstasiun_asal` int(11) NOT NULL,
  `idstasiun_tujuan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `stasiun`
--

CREATE TABLE IF NOT EXISTS `stasiun` (
  `idstasiun` int(11) NOT NULL,
  `alamat` varchar(45) NOT NULL,
  `lat` double NOT NULL,
  `long` double NOT NULL,
  `kode` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tracking`
--

CREATE TABLE IF NOT EXISTS `tracking` (
  `idtracking` int(11) NOT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  `waktu` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idspj` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tracking`
--

INSERT INTO `tracking` (`idtracking`, `longitude`, `latitude`, `waktu`, `idspj`) VALUES
(3, 3.6, 4.2, '2016-03-08 20:45:07', 0),
(4, 112.68641610022169, -7.278114494055761, '2016-03-08 20:45:07', 0),
(5, 112.68647856381541, -7.278187372690023, '2016-03-08 20:45:07', 0),
(6, 112.68647856381541, -7.278187372690023, '2016-03-08 20:45:07', 0),
(7, 112.68627776978457, -7.278129154049431, '2016-03-08 20:45:07', 0),
(8, 112.68627776978457, -7.278129154049431, '2016-03-08 20:45:07', 0),
(9, 112.6862667983735, -7.278219452517824, '2016-03-08 20:45:07', 0),
(10, 112.6862667983735, -7.278219452517824, '2016-03-08 20:45:07', 0),
(11, 112.6862667983735, -7.278219452517824, '2016-03-08 20:45:07', 0),
(12, 112.6862667983735, -7.278219452517824, '2016-03-08 20:45:07', 0),
(13, 112.68640250786598, -7.2781605829426255, '2016-03-08 20:45:07', 0),
(14, 112.68640242191292, -7.278154299693844, '2016-03-08 20:45:07', 0),
(15, 112.68640242191292, -7.278154299693844, '2016-03-08 20:45:07', 0),
(16, 112.68640242191292, -7.278154299693844, '2016-03-08 20:45:07', 0),
(17, 112.68640242191292, -7.278154299693844, '2016-03-08 20:45:07', 0),
(18, 112.68640242191292, -7.278154299693844, '2016-03-08 20:45:07', 0),
(19, 112.68638868214889, -7.278136593378655, '2016-03-08 20:45:07', 0),
(20, 0.4, 0.5, '2016-03-08 20:46:29', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `truk`
--

CREATE TABLE IF NOT EXISTS `truk` (
  `idtruk` int(11) NOT NULL,
  `notruk` varchar(45) NOT NULL,
  `nopol` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `iduser` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `status` int(11) NOT NULL,
  `idakses` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`iduser`, `nama`, `email`, `username`, `password`, `status`, `idakses`) VALUES
(4, 'bbb', 'bbb@gmail.com', 'bbb', '08f8e0260c64418510cefb2b06eee5cd', 1, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`idartikel`), ADD KEY `idjenis_artikel` (`idjenis_artikel`), ADD KEY `iduser` (`iduser`);

--
-- Indexes for table `hakses`
--
ALTER TABLE `hakses`
  ADD PRIMARY KEY (`idakses`);

--
-- Indexes for table `jenis_artikel`
--
ALTER TABLE `jenis_artikel`
  ADD PRIMARY KEY (`idjenis_artikel`);

--
-- Indexes for table `spj`
--
ALTER TABLE `spj`
  ADD PRIMARY KEY (`idspj`), ADD KEY `idtruk` (`idtruk`,`iduser_supir`,`iduser_supervisor`,`idstasiun_asal`,`idstasiun_tujuan`), ADD KEY `iduser_supir` (`iduser_supir`), ADD KEY `iduser_supervisor` (`iduser_supervisor`), ADD KEY `idstasiun_asal` (`idstasiun_asal`), ADD KEY `idstasiun_tujuan` (`idstasiun_tujuan`);

--
-- Indexes for table `stasiun`
--
ALTER TABLE `stasiun`
  ADD PRIMARY KEY (`idstasiun`);

--
-- Indexes for table `tracking`
--
ALTER TABLE `tracking`
  ADD PRIMARY KEY (`idtracking`);

--
-- Indexes for table `truk`
--
ALTER TABLE `truk`
  ADD PRIMARY KEY (`idtruk`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`), ADD KEY `idakses` (`idakses`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artikel`
--
ALTER TABLE `artikel`
  MODIFY `idartikel` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hakses`
--
ALTER TABLE `hakses`
  MODIFY `idakses` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `jenis_artikel`
--
ALTER TABLE `jenis_artikel`
  MODIFY `idjenis_artikel` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `spj`
--
ALTER TABLE `spj`
  MODIFY `idspj` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `stasiun`
--
ALTER TABLE `stasiun`
  MODIFY `idstasiun` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tracking`
--
ALTER TABLE `tracking`
  MODIFY `idtracking` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `truk`
--
ALTER TABLE `truk`
  MODIFY `idtruk` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `artikel`
--
ALTER TABLE `artikel`
ADD CONSTRAINT `artikel_ibfk_1` FOREIGN KEY (`idjenis_artikel`) REFERENCES `jenis_artikel` (`idjenis_artikel`),
ADD CONSTRAINT `artikel_ibfk_2` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`);

--
-- Ketidakleluasaan untuk tabel `spj`
--
ALTER TABLE `spj`
ADD CONSTRAINT `spj_ibfk_1` FOREIGN KEY (`idtruk`) REFERENCES `truk` (`idtruk`),
ADD CONSTRAINT `spj_ibfk_2` FOREIGN KEY (`iduser_supir`) REFERENCES `user` (`iduser`),
ADD CONSTRAINT `spj_ibfk_3` FOREIGN KEY (`iduser_supervisor`) REFERENCES `user` (`iduser`),
ADD CONSTRAINT `spj_ibfk_4` FOREIGN KEY (`idstasiun_asal`) REFERENCES `stasiun` (`idstasiun`),
ADD CONSTRAINT `spj_ibfk_5` FOREIGN KEY (`idstasiun_tujuan`) REFERENCES `stasiun` (`idstasiun`);

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`idakses`) REFERENCES `hakses` (`idakses`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
