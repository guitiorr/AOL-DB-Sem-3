-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Des 2023 pada 14.43
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rumahsakit`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detailobat`
--

CREATE TABLE `detailobat` (
  `IDDetail` varchar(10) NOT NULL CHECK (`IDDetail` regexp '^DET[0-9]{3}$'),
  `JenisObat` varchar(255) NOT NULL,
  `BentukObat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `detailobat`
--

INSERT INTO `detailobat` (`IDDetail`, `JenisObat`, `BentukObat`) VALUES
('DET001', 'Antibiotik', 'Kapsul'),
('DET002', 'Antibiotik', 'Tablet'),
('DET003', 'Analgesik', 'Sirup'),
('DET004', 'Analgesik', 'Serbuk'),
('DET005', 'Antibiotik', 'Serbuk');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detailperawatan`
--

CREATE TABLE `detailperawatan` (
  `IDJadwal` varchar(10) NOT NULL CHECK (`IDJadwal` regexp '^JA[0-9]{3}$'),
  `IDPasien` varchar(50) NOT NULL,
  `IDDokter` varchar(10) NOT NULL,
  `NomorKamar` varchar(35) NOT NULL,
  `IDPenyakit` varchar(10) NOT NULL,
  `IDObat` varchar(10) NOT NULL,
  `TanggalPerawatan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `detailperawatan`
--

INSERT INTO `detailperawatan` (`IDJadwal`, `IDPasien`, `IDDokter`, `NomorKamar`, `IDPenyakit`, `IDObat`, `TanggalPerawatan`) VALUES
('JA150', 'PA150', 'DOC004', '203', 'SIC003', 'MED005', '2017-09-14'),
('JA195', 'PA195', 'DOC005', '202', 'SIC002', 'MED004', '2015-09-12'),
('JA306', 'PA306', 'DOC001', '201', 'SIC001', 'MED001', '2023-09-13'),
('JA715', 'PA715', 'DOC005', '203', 'SIC002', 'MED003', '2022-09-14'),
('JA747', 'PA747', 'DOC003', '205', 'SIC003', 'MED005', '2014-09-11'),
('JA770', 'PA770', 'DOC002', '201', 'SIC002', 'MED004', '2023-09-17'),
('JA807', 'PA807', 'DOC002', '204', 'SIC001', 'MED002', '2019-09-16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `gejala`
--

CREATE TABLE `gejala` (
  `IDSymptom` varchar(10) NOT NULL CHECK (`IDSymptom` regexp '^SYM[0-9]{3}$'),
  `NamaSymptom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `gejala`
--

INSERT INTO `gejala` (`IDSymptom`, `NamaSymptom`) VALUES
('SYM001', 'Menggigil'),
('SYM002', 'Muntah-muntah'),
('SYM003', 'Demam tinggi'),
('SYM004', 'Ruam kulit'),
('SYM005', 'Pusing'),
('SYM006', 'Nyeri sendi'),
('SYM007', 'Tidak dapat bernafas'),
('SYM008', 'Kelelahan'),
('SYM009', 'Batuk');

-- --------------------------------------------------------

--
-- Struktur dari tabel `msasuransi`
--

CREATE TABLE `msasuransi` (
  `NamaAsuransi` varchar(255) NOT NULL,
  `AlamatJalanAsuransi` varchar(255) NOT NULL,
  `KelurahanAsuransi` varchar(255) NOT NULL,
  `KecamatanAsuransi` varchar(255) NOT NULL,
  `KotaAsuransi` varchar(255) NOT NULL,
  `ProvinsiAsuransi` varchar(255) NOT NULL,
  `KodePosAsuransi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `msasuransi`
--

INSERT INTO `msasuransi` (`NamaAsuransi`, `AlamatJalanAsuransi`, `KelurahanAsuransi`, `KecamatanAsuransi`, `KotaAsuransi`, `ProvinsiAsuransi`, `KodePosAsuransi`) VALUES
('Allianz', 'Jl. Setia Budi No.144', 'Srondol Kulon', 'Kec. Banyumanik', 'Kota Semarang', 'Jawa Tengah', 50263),
('Astra Life', 'Jl. Pandanaran No.89', 'Mugassari', 'Kec. Semarang Sel.', 'Kota Semarang', 'Jawa Tengah', 50249),
('Prudential', 'Jl. Singosari I No.24’', 'Pleburan', 'Kec. Semarang Sel.', 'Kota Semarang', 'Jawa Tengah', 50241);

-- --------------------------------------------------------

--
-- Struktur dari tabel `msdokter`
--

CREATE TABLE `msdokter` (
  `IDDokter` varchar(10) NOT NULL CHECK (`IDDokter` regexp '^DOC[0-9]{3}$'),
  `NamaDokter` varchar(50) NOT NULL,
  `SpesialisasiDokter` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `msdokter`
--

INSERT INTO `msdokter` (`IDDokter`, `NamaDokter`, `SpesialisasiDokter`) VALUES
('DOC001', 'Fabian Marchington', 'Spesialis penyakit dalam'),
('DOC002', 'Samaria Doggart', 'Spesialis penyakit dalam'),
('DOC003', 'Raviv Gouldthorpe', 'Pulmonologi'),
('DOC004', 'Casey Nemchinov', 'Pulmonologi'),
('DOC005', 'Johnny Sins', 'Spesialis penyakit dalam');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mskamar`
--

CREATE TABLE `mskamar` (
  `NomorKamar` varchar(35) NOT NULL CHECK (`NomorKamar` regexp '^[0-9]{3}$'),
  `NamaKamar` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mskamar`
--

INSERT INTO `mskamar` (`NomorKamar`, `NamaKamar`) VALUES
('201', 'Lavender'),
('202', 'Mawar'),
('203', 'Melati'),
('204', 'Anggrek'),
('205', 'Orchid'),
('206', 'Tulip'),
('207', 'Lily');

-- --------------------------------------------------------

--
-- Struktur dari tabel `msobat`
--

CREATE TABLE `msobat` (
  `IDObat` varchar(10) NOT NULL CHECK (`IDObat` regexp '^MED[0-9]{3}$'),
  `NamaObat` varchar(255) NOT NULL,
  `IDDetail` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `msobat`
--

INSERT INTO `msobat` (`IDObat`, `NamaObat`, `IDDetail`) VALUES
('MED001', 'Doxycycline', 'DET001'),
('MED002', 'Doxycycline', 'DET002'),
('MED003', 'Paracetamol', 'DET003'),
('MED004', 'Paracetamol', 'DET004'),
('MED005', 'Amoksisilin', 'DET005');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mspenyakitdetail`
--

CREATE TABLE `mspenyakitdetail` (
  `IDPenyakit` varchar(10) NOT NULL,
  `IDSymptom` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mspenyakitdetail`
--

INSERT INTO `mspenyakitdetail` (`IDPenyakit`, `IDSymptom`) VALUES
('SIC001', 'SYM001'),
('SIC001', 'SYM002'),
('SIC001', 'SYM003'),
('SIC002', 'SYM004'),
('SIC002', 'SYM005'),
('SIC002', 'SYM006'),
('SIC003', 'SYM007'),
('SIC003', 'SYM008'),
('SIC003', 'SYM009');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasien`
--

CREATE TABLE `pasien` (
  `IDPasien` varchar(50) NOT NULL CHECK (`IDPasien` regexp '^PA[0-9]{3}$'),
  `NamaPasien` varchar(50) NOT NULL,
  `JenisKelamin` varchar(50) NOT NULL,
  `TanggalLahir` date NOT NULL,
  `Alamat` varchar(15) NOT NULL,
  `NamaAsuransi` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pasien`
--

INSERT INTO `pasien` (`IDPasien`, `NamaPasien`, `JenisKelamin`, `TanggalLahir`, `Alamat`, `NamaAsuransi`) VALUES
('PA150', 'Lotte Kedward', 'Female', '1993-01-16', 'Jl. Madukoro', 'Allianz'),
('PA195', 'Michaeline Beardshall', 'Female', '1991-05-07', 'Jl. Anjasmoro', 'Prudential'),
('PA306', 'Lemmie Kalkofer', 'Male', '1991-10-21', 'Jl. Madukoro', 'Allianz'),
('PA715', 'Ardys Hamelyn', 'Female', '2010-01-09', 'Jl. Anjasmoro', 'Prudential'),
('PA747', 'Colver Yurenev', 'Male', '1992-05-03', 'Jl. KedungMundu', 'Allianz'),
('PA770', 'Konstantine Turn', 'Male', '1997-05-19', 'Jl. Mataram', 'Astra Life'),
('PA807', 'Tedd Bloom', 'Male', '1994-07-09', 'Jl. Mataram', 'Astra Life');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penyakit`
--

CREATE TABLE `penyakit` (
  `IDPenyakit` varchar(10) NOT NULL CHECK (`IDPenyakit` regexp '^SIC[0-9]{3}$'),
  `NamaPenyakit` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `penyakit`
--

INSERT INTO `penyakit` (`IDPenyakit`, `NamaPenyakit`) VALUES
('SIC001', 'Malaria'),
('SIC002', 'Dengue'),
('SIC003', 'Pneumonia');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detailobat`
--
ALTER TABLE `detailobat`
  ADD PRIMARY KEY (`IDDetail`);

--
-- Indeks untuk tabel `detailperawatan`
--
ALTER TABLE `detailperawatan`
  ADD PRIMARY KEY (`IDJadwal`),
  ADD KEY `IDPasien` (`IDPasien`),
  ADD KEY `IDDokter` (`IDDokter`),
  ADD KEY `NomorKamar` (`NomorKamar`),
  ADD KEY `IDPenyakit` (`IDPenyakit`),
  ADD KEY `IDObat` (`IDObat`);

--
-- Indeks untuk tabel `gejala`
--
ALTER TABLE `gejala`
  ADD PRIMARY KEY (`IDSymptom`);

--
-- Indeks untuk tabel `msasuransi`
--
ALTER TABLE `msasuransi`
  ADD PRIMARY KEY (`NamaAsuransi`);

--
-- Indeks untuk tabel `msdokter`
--
ALTER TABLE `msdokter`
  ADD PRIMARY KEY (`IDDokter`);

--
-- Indeks untuk tabel `mskamar`
--
ALTER TABLE `mskamar`
  ADD PRIMARY KEY (`NomorKamar`);

--
-- Indeks untuk tabel `msobat`
--
ALTER TABLE `msobat`
  ADD PRIMARY KEY (`IDObat`),
  ADD KEY `IDDetail` (`IDDetail`);

--
-- Indeks untuk tabel `mspenyakitdetail`
--
ALTER TABLE `mspenyakitdetail`
  ADD KEY `IDPenyakit` (`IDPenyakit`),
  ADD KEY `IDSymptom` (`IDSymptom`);

--
-- Indeks untuk tabel `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`IDPasien`),
  ADD KEY `NamaAsuransi` (`NamaAsuransi`);

--
-- Indeks untuk tabel `penyakit`
--
ALTER TABLE `penyakit`
  ADD PRIMARY KEY (`IDPenyakit`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detailperawatan`
--
ALTER TABLE `detailperawatan`
  ADD CONSTRAINT `detailperawatan_ibfk_1` FOREIGN KEY (`IDPasien`) REFERENCES `pasien` (`IDPasien`),
  ADD CONSTRAINT `detailperawatan_ibfk_2` FOREIGN KEY (`IDDokter`) REFERENCES `msdokter` (`IDDokter`),
  ADD CONSTRAINT `detailperawatan_ibfk_3` FOREIGN KEY (`NomorKamar`) REFERENCES `mskamar` (`NomorKamar`),
  ADD CONSTRAINT `detailperawatan_ibfk_4` FOREIGN KEY (`IDPenyakit`) REFERENCES `mspenyakitdetail` (`IDPenyakit`),
  ADD CONSTRAINT `detailperawatan_ibfk_5` FOREIGN KEY (`IDObat`) REFERENCES `msobat` (`IDObat`);

--
-- Ketidakleluasaan untuk tabel `msobat`
--
ALTER TABLE `msobat`
  ADD CONSTRAINT `msobat_ibfk_1` FOREIGN KEY (`IDDetail`) REFERENCES `detailobat` (`IDDetail`);

--
-- Ketidakleluasaan untuk tabel `mspenyakitdetail`
--
ALTER TABLE `mspenyakitdetail`
  ADD CONSTRAINT `mspenyakitdetail_ibfk_1` FOREIGN KEY (`IDPenyakit`) REFERENCES `penyakit` (`IDPenyakit`),
  ADD CONSTRAINT `mspenyakitdetail_ibfk_2` FOREIGN KEY (`IDSymptom`) REFERENCES `gejala` (`IDSymptom`);

--
-- Ketidakleluasaan untuk tabel `pasien`
--
ALTER TABLE `pasien`
  ADD CONSTRAINT `pasien_ibfk_1` FOREIGN KEY (`NamaAsuransi`) REFERENCES `msasuransi` (`NamaAsuransi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
