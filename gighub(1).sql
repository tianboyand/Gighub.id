-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2016 at 05:06 AM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gighub`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'heri', 'heri@gmail.com', '$2y$10$stMd4anSPfmL/hNey3TX.utMBLyZJeHTzdFcgppO4ujqN0fXsEvQ6', '6S2CfivFMkjyboyGlOfLkxT4MWVrbMVamVAppCGhsp15Iu2vRf3Vv4gVfkwW', NULL, '2016-12-01 20:22:41');

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_bank` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `no_rek` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `atas_nama` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cabang` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `nama_bank`, `no_rek`, `atas_nama`, `cabang`, `created_at`, `updated_at`) VALUES
(1, 'BCA', '0284579482543', 'Heri', '', '2016-10-21 06:10:26', '2016-10-21 06:10:26'),
(2, 'BNI', '00000009875', 'Dewi Sari', '', '2016-10-21 06:12:53', '2016-10-21 06:12:53'),
(3, 'Mandiri', '12345367', 'Dewo', '', '2016-10-23 19:46:42', '2016-10-23 19:46:42'),
(4, 'BRI', '31231413', 'heru', '', '2016-11-24 02:50:15', '2016-11-24 02:50:15');

-- --------------------------------------------------------

--
-- Table structure for table `bank_admin`
--

CREATE TABLE `bank_admin` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_bank` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `no_rek` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `atas_nama` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cabang` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bank_admin`
--

INSERT INTO `bank_admin` (`id`, `nama_bank`, `no_rek`, `atas_nama`, `cabang`, `created_at`, `updated_at`) VALUES
(1, 'BRI', '230109230827', 'PT. Gighub Indonesia', 'Medan', '2016-10-21 06:11:32', '2016-10-21 06:11:32'),
(2, 'BCA', '09087871824', 'PT. Gighub Indonesia', 'Medan', '2016-10-21 06:11:41', '2016-10-21 06:11:41'),
(3, 'Mandiri', '000092132323', 'PT. Gighub Indonesia', 'Medan', '2016-10-21 06:11:51', '2016-10-21 06:11:51');

-- --------------------------------------------------------

--
-- Table structure for table `bank_musisi`
--

CREATE TABLE `bank_musisi` (
  `id` int(10) UNSIGNED NOT NULL,
  `musician_id` int(10) UNSIGNED NOT NULL,
  `bank_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bank_musisi`
--

INSERT INTO `bank_musisi` (`id`, `musician_id`, `bank_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2016-10-21 06:10:26', '2016-10-21 06:10:26'),
(2, 2, 2, '2016-10-21 06:12:53', '2016-10-21 06:12:53'),
(3, 3, 3, '2016-10-23 19:46:42', '2016-10-23 19:46:42'),
(4, 4, 4, '2016-11-24 02:50:15', '2016-11-24 02:50:15');

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id` int(10) UNSIGNED NOT NULL,
  `genre_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `genre_name`, `created_at`, `updated_at`) VALUES
(1, 'Pop', '2016-10-21 06:08:46', '2016-10-21 06:08:46'),
(2, 'Rock', '2016-10-21 06:08:49', '2016-10-21 06:08:49'),
(3, 'Jazz', '2016-10-21 06:08:53', '2016-10-21 06:08:53'),
(4, 'Dangdut', '2016-10-21 06:08:56', '2016-10-21 06:08:56'),
(5, 'Regae', '2016-10-21 06:09:03', '2016-10-21 06:09:03');

-- --------------------------------------------------------

--
-- Table structure for table `genre_bands`
--

CREATE TABLE `genre_bands` (
  `id` int(10) UNSIGNED NOT NULL,
  `band_id` int(10) UNSIGNED NOT NULL,
  `genre_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `genre_bands`
--

INSERT INTO `genre_bands` (`id`, `band_id`, `genre_id`, `created_at`, `updated_at`) VALUES
(2, 1, 2, '2016-10-21 06:30:37', '2016-10-21 06:30:37'),
(4, 2, 1, '2016-10-21 06:41:33', '2016-10-21 06:41:33'),
(5, 2, 3, '2016-10-21 06:41:33', '2016-10-21 06:41:33'),
(8, 3, 5, '2016-10-31 08:42:20', '2016-10-31 08:42:20'),
(9, 1, 3, '2016-10-31 23:40:28', '2016-10-31 23:40:28'),
(10, 1, 1, '2016-10-31 23:40:28', '2016-10-31 23:40:28');

-- --------------------------------------------------------

--
-- Table structure for table `genre_musisi`
--

CREATE TABLE `genre_musisi` (
  `id` int(10) UNSIGNED NOT NULL,
  `musician_id` int(10) UNSIGNED NOT NULL,
  `genre_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `genre_musisi`
--

INSERT INTO `genre_musisi` (`id`, `musician_id`, `genre_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2016-10-21 06:10:26', '2016-10-21 06:10:26'),
(2, 1, 3, '2016-10-21 06:10:27', '2016-10-21 06:10:27'),
(3, 2, 3, '2016-10-21 06:12:53', '2016-10-21 06:12:53'),
(4, 3, 2, '2016-10-23 19:46:42', '2016-10-23 19:46:42'),
(5, 3, 3, '2016-10-23 19:46:42', '2016-10-23 19:46:42'),
(6, 3, 5, '2016-10-23 19:46:42', '2016-10-23 19:46:42'),
(7, 4, 1, '2016-11-24 02:50:15', '2016-11-24 02:50:15'),
(8, 4, 2, '2016-11-24 02:50:15', '2016-11-24 02:50:15');

-- --------------------------------------------------------

--
-- Table structure for table `gigs`
--

CREATE TABLE `gigs` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_gig` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8_unicode_ci NOT NULL,
  `photo_gig` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lokasi` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `detail_lokasi` text COLLATE utf8_unicode_ci NOT NULL,
  `lat` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lng` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tanggal_mulai` datetime NOT NULL,
  `tanggal_selesai` datetime NOT NULL,
  `status` enum('0','1') COLLATE utf8_unicode_ci NOT NULL,
  `type_gig` enum('sewa','post') COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `aktif` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `slug` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `gigs`
--

INSERT INTO `gigs` (`id`, `nama_gig`, `deskripsi`, `photo_gig`, `lokasi`, `detail_lokasi`, `lat`, `lng`, `tanggal_mulai`, `tanggal_selesai`, `status`, `type_gig`, `user_id`, `aktif`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Malam Perpisahan SMAN 99 MEDAN', 'Malam perpisahan anak SMA', 'fsmdlymq641hi0aks8nw', 'Jl. STM, Suka Maju, Medan City, North Sumatra, Indonesia', 'STM, No.99', '3.534926399999999', '98.69144289999997', '2016-10-30 18:00:00', '2016-10-30 22:00:00', '1', 'post', 1, 'Y', 'malam-perpisahan-sman-99-medan', '2016-10-21 06:16:41', '2016-10-21 06:16:41'),
(2, 'Ultah Hera', 'acara ulang tahun', 'luyhoykgunrs4edxbhp0', 'Jalan Wahidin Medan, Pandau Hulu II, Medan City, North Sumatra, Indonesia', 'Gg. Dalam No.22', '', '', '2016-10-25 19:00:00', '2016-10-25 22:30:00', '1', 'sewa', 1, 'Y', 'ulang-tahun-hera', '2016-10-21 06:58:53', '2016-10-25 09:13:52'),
(3, 'My Wedding Hera', 'Acara resepsi pernikahan', 'sample', 'Medan, Medan City, North Sumatra, Indonesia', 'Adimulya Hotel Ballroom', '3.5951956', '98.67222270000002', '2016-11-05 10:00:00', '2016-11-05 21:00:00', '1', 'post', 1, 'Y', 'my-wedding-hera', '2016-10-23 19:53:44', '2016-10-23 19:53:44'),
(4, 'Acara Makan Makan', 'Acara makan makan dan syukuran', 'kvyefxpzyizrxvvctasb', 'Jl. Bilal, Pulo Brayan Darat I, Medan City, North Sumatra, Indonesia', 'Komplek Bilal Residence, No.8', '3.6228308', '98.68308290000004', '2016-11-10 11:00:00', '2016-11-10 17:00:00', '1', 'post', 1, 'Y', 'acara-makan-makan', '2016-10-25 23:00:03', '2016-10-25 23:01:09'),
(5, 'Ulang Tahun My Kids', 'Acara ulang tahun anak anak', 'j0etkdvlzhaarng6rjlt', 'Jalan Ring Road, Tanjung Sari, Medan City, North Sumatra, Indonesia', 'Komplek Grand Emerald, No.1 Blok B', '3.5530459', '98.62610659999996', '2016-10-31 14:00:00', '2016-10-31 17:00:00', '1', 'post', 1, 'Y', 'ulang-tahun-my-kids', '2016-10-25 23:41:15', '2016-10-25 23:51:47'),
(10, 'Acara kibod', 'Acara perayaan ulang tahun kelurahan', '', 'Jalan Jendral Gatot Subroto, Sei Sikambing D, Medan City, North Sumatra, Indonesia', 'Gg.Kenanga No.123', '3.590270699999999', '98.65402369999993', '2016-11-10 18:00:00', '2016-11-10 23:00:00', '1', 'sewa', 1, 'Y', 'acara-kibod', '2016-10-27 06:57:59', '2016-10-27 07:22:30'),
(11, 'Acara test', 'test aja', '', 'J. L. Gordon Street, Tel Aviv-Yafo, Israel', 'medan', '32.08166899999999', '34.774463999999966', '2016-11-10 18:00:00', '2016-11-10 23:00:00', '1', 'post', 1, 'Y', 'acara-test', '2016-10-27 07:34:23', '2016-10-30 23:20:25'),
(12, 'Acarat ntah apa', 'fgdfhdjdj', '', 'J. L. Long Middle School, Reiger Avenue, Dallas, TX, United States', 'Jauh', '32.80678350000001', '-96.74906470000002', '2016-11-10 18:00:00', '2016-11-10 22:00:00', '1', 'post', 1, 'Y', 'acarat-ntah-apa', '2016-10-27 07:36:15', '2016-10-27 23:38:15'),
(13, 'Acara Makan Bersama', 'sdgfsgfdgdfgh', '', 'J. L. Long Middle School, Reiger Avenue, Dallas, TX, United States', 'diman aja', '32.80678350000001', '-96.74906470000002', '2016-11-10 18:00:00', '2016-11-10 23:00:00', '1', 'sewa', 1, 'Y', 'acara-makan-bersama', '2016-10-28 07:13:45', '2016-11-01 19:20:35'),
(14, 'Acara test eror', 'att gdf', '', 'Medan, Medan City, North Sumatra, Indonesia', 'Jl.bilal', '3.5951956', '98.67222270000002', '2016-11-10 13:00:00', '2016-11-10 17:00:00', '1', 'sewa', 1, 'Y', 'acara-test-eror', '2016-10-30 23:31:50', '2016-10-30 23:32:20'),
(15, 'hao hao', 'hao hao', '', 'Marindal Satu, Deli Serdang Regency, North Sumatra, Indonesia', 'Jl. Bajak 5', '3.5250683', '98.7095789', '2016-11-08 18:00:00', '2016-11-08 20:00:00', '1', 'sewa', 1, 'Y', 'hao-hao', '2016-11-06 01:04:50', '2016-11-06 01:20:20');

-- --------------------------------------------------------

--
-- Table structure for table `grupbands`
--

CREATE TABLE `grupbands` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_grupband` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8_unicode_ci NOT NULL,
  `tipe` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Group',
  `basis` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '-',
  `kota` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cover` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `harga` int(11) NOT NULL,
  `youtube_video` text COLLATE utf8_unicode_ci NOT NULL,
  `url_website` text COLLATE utf8_unicode_ci NOT NULL,
  `username_soundcloud` text COLLATE utf8_unicode_ci NOT NULL,
  `username_reverbnation` text COLLATE utf8_unicode_ci NOT NULL,
  `aktif` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `admin_id` int(10) UNSIGNED NOT NULL,
  `slug` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `grupbands`
--

INSERT INTO `grupbands` (`id`, `nama_grupband`, `deskripsi`, `tipe`, `basis`, `kota`, `photo`, `cover`, `harga`, `youtube_video`, `url_website`, `username_soundcloud`, `username_reverbnation`, `aktif`, `admin_id`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Kelilingin Band', 'Keliling band', 'Group', 'Trio', 'Medan', 'sample', 'sample', 2000000, '', '', '', '', 'Y', 1, 'kelilingin-band', '2016-10-21 06:19:35', '2016-10-25 20:37:20'),
(2, 'Dewi Dewi', 'Dewi dewi band is good', 'Group', '-', 'Bandung', 'nbz7hvshyrlcep2aafil', 'sample', 2000000, '', '', '', '', 'Y', 2, 'dewi-dewi', '2016-10-21 06:41:33', '2016-10-21 06:41:33'),
(3, 'Maha Dewo', 'dewo dewo band', 'Group', '-', 'Medan', 'sample', 'sample', 150000, '', '', '', '', 'Y', 3, 'maha-dewo', '2016-10-31 08:42:20', '2016-10-31 08:42:20');

-- --------------------------------------------------------

--
-- Table structure for table `grupband_musisi`
--

CREATE TABLE `grupband_musisi` (
  `id` int(10) UNSIGNED NOT NULL,
  `position_id` int(10) UNSIGNED NOT NULL,
  `musician_id` int(10) UNSIGNED NOT NULL,
  `grupband_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `grupband_musisi`
--

INSERT INTO `grupband_musisi` (`id`, `position_id`, `musician_id`, `grupband_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2016-10-21 06:19:35', '2016-10-21 06:19:35'),
(2, 5, 2, 2, '2016-10-21 06:41:33', '2016-10-21 06:41:33'),
(3, 5, 2, 1, '2016-10-25 02:27:40', '2016-10-25 02:27:40'),
(4, 2, 1, 2, '2016-10-25 02:44:36', '2016-10-25 02:44:36'),
(5, 2, 3, 3, '2016-10-31 08:42:20', '2016-10-31 08:42:20');

-- --------------------------------------------------------

--
-- Table structure for table `konfirmasi_pembayarans`
--

CREATE TABLE `konfirmasi_pembayarans` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_rek` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `no_rek` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nama_bank` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sewa_id` int(10) UNSIGNED NOT NULL,
  `bank_admin_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `konfirmasi_pembayarans`
--

INSERT INTO `konfirmasi_pembayarans` (`id`, `nama_rek`, `no_rek`, `nama_bank`, `photo`, `sewa_id`, `bank_admin_id`, `created_at`, `updated_at`) VALUES
(1, 'herawati', '', 'BCA', '', 5, 2, '2016-10-21 07:07:31', '2016-10-21 07:07:31'),
(2, 'Hera', '', 'BCA', '', 4, 2, '2016-10-23 19:57:29', '2016-10-23 19:57:29'),
(3, 'herawati', '', 'Mandiri', '', 6, 3, '2016-10-24 06:47:17', '2016-10-24 06:47:17'),
(4, 'herawati', '', 'BCA', '', 7, 2, '2016-10-25 23:01:29', '2016-10-25 23:01:29'),
(5, 'herawati', '', 'Mandiri', '', 8, 3, '2016-10-25 23:52:05', '2016-10-25 23:52:05'),
(6, 'herawati', '', 'BCA', '', 14, 2, '2016-10-30 00:38:09', '2016-10-30 00:38:09'),
(7, 'Anto', '', 'BCA', '', 22, 2, '2016-10-30 23:20:40', '2016-10-30 23:20:40'),
(8, 'Budi', '', 'BNI', '', 23, 3, '2016-10-30 23:32:45', '2016-10-30 23:32:45'),
(9, 'Hera', '', 'BRI', '', 21, 1, '2016-11-01 19:21:01', '2016-11-01 19:21:01');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2016_05_24_073233_create_admins_table', 1),
('2016_08_18_191655_create_musicians_table', 1),
('2016_09_18_082215_create_banks_table', 1),
('2016_09_18_082216_create_bank_admin_table', 1),
('2016_09_18_082217_create_bank_musisi_table', 1),
('2016_09_18_082251_create_genres_table', 1),
('2016_09_18_082252_create_genre_musisi_table', 1),
('2016_09_18_085545_create_gigs_table', 1),
('2016_09_18_085722_create_grupbands_table', 1),
('2016_09_18_090100_create_positions_table', 1),
('2016_09_18_090101_create_grupband_musisi_table', 1),
('2016_09_18_090136_create_sewas_table', 1),
('2016_09_18_090346_create_konfirmasi_pembayarans_table', 1),
('2016_10_21_065112_create_review_table', 1),
('2016_10_21_065139_create_saldo_table', 1),
('2016_10_21_065153_create_withdraw_table', 1),
('2016_10_21_080528_create_genre_bands_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `musicians`
--

CREATE TABLE `musicians` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tipe` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Solo',
  `basis` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '-',
  `deskripsi` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `no_telp` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kota` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `harga_sewa` int(11) NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `youtube_video` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url_website` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_soundcloud` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_reverbnation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `aktif` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `slug` text COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `musicians`
--

INSERT INTO `musicians` (`id`, `name`, `email`, `password`, `tipe`, `basis`, `deskripsi`, `no_telp`, `kota`, `harga_sewa`, `photo`, `youtube_video`, `url_website`, `username_soundcloud`, `username_reverbnation`, `aktif`, `slug`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'heri', 'hery.trie@gmail.com', '$2y$10$LbtqW.lMwtF37/AKc.iR8OsqnOAKYEg.U4yRYIOf3A/g2arOO/uGO', 'Solo', 'Duo', 'My Music is Murottal', '081398797257', 'Medan', 1000000, 'default_user', '', '', '', '', 'Y', 'heri', 'PgBkT8bvUN0bqhcJJmAMoAE7ER4SjByBWGSmz3WUJrVJ2N135rTYQKtPM5DO', '2016-10-21 06:07:26', '2016-12-01 01:24:48'),
(2, 'Dewi', 'dewi@gmail.com', '$2y$10$V7m3pApEQ6snvW2R8u5afuKcWccF9wefyftgLACtoRXhgGQo.Xqti', 'Solo', '-', 'My Music is Asyik', '085278639012', 'Bandung', 1500000, 'default_user', '', '', '', '', 'Y', 'dewi', '13PkXFerZB9io8bYjJTLPAtYjdUSlDzmDiNHq017ZCKy1LRomnGdIeDMv1c1', '2016-10-21 06:12:15', '2016-11-28 21:06:10'),
(3, 'dewo', 'dewo@gmail.com', '$2y$10$WSAw2wLtYgHXu72Rfuu6kOcbBbKSk4gsHCPCSRFauNTdY9pA8A68e', 'Solo', '-', 'Anak Rocker Men', '09083424', 'Jakarta', 500000, 'default_user', '', '', '', '', 'Y', 'dewo', '8l7UENh1Vr6w9s2UCDzvmPggubUI6l5V90EnZ8tS7Guz3nRNiB7BNZmmgyxj', '2016-10-23 19:45:56', '2016-10-31 20:33:54'),
(4, 'heru', 'heru@gmail.com', '$2y$10$dFl3feCbh46kVi7jXmQEMO5zzeww7emqoxeLYNW72EIZzc6Dv5cLO', 'Solo', 'Solo', 'fsdgfhdgh', '12342', 'Medan', 5000000, 'default_user', '', '', '', '', 'Y', 'heru', 'sSHh4boYBAwxDvM2Tq7X1llOmPf0IcUnpMyKcaILdW5Bc29QsvIXRkrmFTG6', '2016-11-24 02:49:48', '2016-11-24 02:50:23');

-- --------------------------------------------------------

--
-- Table structure for table `notif`
--

CREATE TABLE `notif` (
  `id` int(10) NOT NULL,
  `object_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `type_subject` enum('musisi','band','organizer','admin') DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type_user` enum('musisi','band','organizer','admin') DEFAULT NULL,
  `type_notif` enum('reqoffer','reqsewa','lunas','batal','selesai','terimasewa','tolaksewa','tolakoffer','terimaoffer','tambahsaldo','withdrawselesai','withdraw','konfirmasipembayaran','review') DEFAULT NULL,
  `baca` enum('N','Y') DEFAULT 'N',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notif`
--

INSERT INTO `notif` (`id`, `object_id`, `subject_id`, `type_subject`, `user_id`, `type_user`, `type_notif`, `baca`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'organizer', 1, 'musisi', 'reqsewa', 'Y', '2016-10-28 13:38:57', '2016-10-28 06:38:57'),
(2, 10, 1, 'organizer', 1, 'musisi', 'reqsewa', 'Y', '2016-10-27 14:13:30', '2016-10-27 07:13:30'),
(3, 10, 1, 'musisi', 1, 'organizer', 'terimasewa', 'Y', '2016-10-28 04:04:36', '2016-10-27 21:04:36'),
(4, 11, 1, 'organizer', 2, 'band', 'reqsewa', 'Y', '2016-10-28 04:15:03', '2016-10-27 21:15:03'),
(5, 12, 1, 'organizer', 2, 'musisi', 'reqsewa', 'Y', '2016-10-28 04:14:46', '2016-10-27 21:14:46'),
(11, 12, 2, 'musisi', 1, 'organizer', 'tolaksewa', 'Y', '2016-10-28 06:28:21', '2016-10-27 23:28:21'),
(12, 11, 2, 'band', 1, 'organizer', 'tolaksewa', 'Y', '2016-10-28 06:28:25', '2016-10-27 23:28:25'),
(16, 12, 2, 'musisi', 1, 'organizer', 'reqoffer', 'Y', '2016-10-28 06:33:17', '2016-10-27 23:33:17'),
(17, 12, 2, 'band', 1, 'organizer', 'reqoffer', 'Y', '2016-10-28 06:33:27', '2016-10-27 23:33:27'),
(18, 12, 1, 'organizer', 2, 'band', 'tolakoffer', 'N', '2016-10-27 23:37:09', '2016-10-27 23:37:09'),
(19, 12, 1, 'organizer', 2, 'musisi', 'terimaoffer', 'N', '2016-10-27 23:38:15', '2016-10-27 23:38:15'),
(21, 12, 0, 'admin', 1, 'organizer', 'lunas', 'Y', '2016-10-28 13:26:34', '2016-10-28 06:26:34'),
(22, 12, 1, 'organizer', 2, 'musisi', 'lunas', 'Y', '2016-10-28 13:34:01', '2016-10-28 06:34:01'),
(23, 10, 0, 'admin', 1, 'organizer', 'lunas', 'Y', '2016-10-28 13:39:28', '2016-10-28 06:39:28'),
(24, 10, 1, 'organizer', 1, 'musisi', 'lunas', 'Y', '2016-10-28 13:38:40', '2016-10-28 06:38:40'),
(25, 13, 1, 'organizer', 2, 'musisi', 'reqsewa', 'Y', '2016-10-28 14:47:58', '2016-10-28 07:47:58'),
(26, 12, 0, 'admin', 2, 'musisi', 'tambahsaldo', 'Y', '2016-10-28 14:24:28', '2016-10-28 07:24:28'),
(27, 12, 1, 'organizer', 2, 'musisi', 'review', 'N', '2016-10-28 14:48:43', '2016-10-28 14:48:43'),
(28, 0, 2, 'musisi', 0, 'admin', 'withdraw', 'Y', '2016-10-29 12:14:34', '2016-10-29 05:14:34'),
(29, 0, 0, 'admin', 2, 'musisi', 'withdrawselesai', 'Y', '2016-10-29 12:17:31', '2016-10-29 05:17:31'),
(30, 11, 1, 'organizer', 0, 'admin', 'konfirmasipembayaran', 'N', '2016-10-30 00:38:09', '2016-10-30 00:38:09'),
(31, 11, 1, 'musisi', 1, 'organizer', 'reqoffer', 'Y', '2016-10-31 06:20:22', '2016-10-30 23:20:22'),
(32, 11, 1, 'organizer', 1, 'musisi', 'terimaoffer', 'Y', '2016-10-31 08:21:41', '2016-10-31 01:21:41'),
(33, 11, 1, 'organizer', 0, 'admin', 'konfirmasipembayaran', 'N', '2016-10-30 23:20:41', '2016-10-30 23:20:41'),
(34, 11, 0, 'admin', 1, 'organizer', 'lunas', 'Y', '2016-10-31 06:31:54', '2016-10-30 23:31:54'),
(35, 11, 1, 'organizer', 1, 'musisi', 'lunas', 'Y', '2016-10-31 06:37:31', '2016-10-30 23:37:31'),
(36, 14, 1, 'organizer', 2, 'band', 'reqsewa', 'Y', '2016-10-31 06:32:14', '2016-10-30 23:32:14'),
(37, 14, 2, 'band', 1, 'organizer', 'terimasewa', 'Y', '2016-10-31 06:32:35', '2016-10-30 23:32:35'),
(38, 14, 1, 'organizer', 0, 'admin', 'konfirmasipembayaran', 'Y', '2016-10-31 06:33:36', '2016-10-30 23:33:36'),
(39, 14, 0, 'admin', 1, 'organizer', 'lunas', 'Y', '2016-11-06 03:24:37', '2016-11-05 20:24:37'),
(40, 14, 1, 'organizer', 2, 'band', 'lunas', 'N', '2016-10-30 23:33:42', '2016-10-30 23:33:42'),
(41, 10, 0, 'admin', 1, 'organizer', 'lunas', 'N', '2016-10-31 00:46:15', '2016-10-31 00:46:15'),
(42, 10, 1, 'organizer', 1, 'musisi', 'lunas', 'Y', '2016-10-31 07:47:46', '2016-10-31 00:47:46'),
(43, 10, 0, 'admin', 1, 'musisi', 'tambahsaldo', 'Y', '2016-11-01 01:20:39', '2016-10-31 18:20:39'),
(44, 13, 2, 'musisi', 1, 'organizer', 'terimasewa', 'Y', '2016-11-02 02:20:52', '2016-11-01 19:20:52'),
(45, 13, 1, 'organizer', 0, 'admin', 'konfirmasipembayaran', 'N', '2016-11-01 19:21:01', '2016-11-01 19:21:01'),
(46, 13, 0, 'admin', 1, 'organizer', 'lunas', 'N', '2016-11-01 19:21:32', '2016-11-01 19:21:32'),
(47, 13, 1, 'organizer', 2, 'musisi', 'lunas', 'Y', '2016-11-02 02:23:18', '2016-11-01 19:23:18'),
(48, 13, 0, 'admin', 1, 'organizer', 'lunas', 'N', '2016-11-01 19:32:29', '2016-11-01 19:32:29'),
(49, 13, 1, 'organizer', 2, 'musisi', 'lunas', 'N', '2016-11-01 19:32:29', '2016-11-01 19:32:29'),
(50, 15, 1, 'organizer', 2, 'band', 'reqsewa', 'Y', '2016-11-06 08:20:14', '2016-11-06 01:20:14'),
(51, 15, 2, 'band', 1, 'organizer', 'terimasewa', 'N', '2016-11-06 01:20:20', '2016-11-06 01:20:20'),
(52, 14, 1, 'organizer', 2, 'band', 'review', 'Y', '2016-11-27 08:18:53', '2016-11-27 01:18:53'),
(53, 13, 0, 'admin', 2, 'musisi', 'tambahsaldo', 'Y', '2016-11-27 09:20:22', '2016-11-27 02:20:22'),
(54, 13, 1, 'organizer', 2, 'musisi', 'review', 'N', '2016-11-27 02:18:49', '2016-11-27 02:18:49'),
(55, 14, 0, 'admin', 2, 'band', 'tambahsaldo', 'Y', '2016-11-27 09:56:30', '2016-11-27 02:56:30'),
(56, 10, 1, 'organizer', 1, 'musisi', 'review', 'N', '2016-11-27 06:30:31', '2016-11-27 06:30:31');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('hera@gmail.com', '3c1b9af30b8aa44e4b078338a15f552a10fece90f7ea240c33619a8f7a02d845', '2016-11-29 19:53:01'),
('terasdistro@gmail.com', '2f8335619b85b60231a2ed21a5c94dc2c0becbd7a09374c83cb9f93ec1d48dcb', '2016-11-30 00:33:04');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_musicians`
--

CREATE TABLE `password_reset_musicians` (
  `id` int(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `password_reset_musicians`
--

INSERT INTO `password_reset_musicians` (`id`, `email`, `token`, `created_at`, `updated_at`) VALUES
(1, 'hery.trie@gmail.com', 'E6xYy2lexWxrFaVNz4udNhveeb0qcnhQgEVukZrR3UEQm5eZaCaEk61480571618', '2016-11-30 22:53:38', '2016-11-30 22:53:38'),
(2, 'hery.trie@gmail.com', 'MMt3gqBAEqkEAtg5pxcEUpsF3gR6Z7zkapVHdArwjKzGzEoEOLN9h61480571688', '2016-11-30 22:54:48', '2016-11-30 22:54:48'),
(3, 'hery.trie@gmail.com', 'YrxXS2D4GgJ8Rh8HIZLn1EzywqHkMafhcKhYzxdiDsrK7pZluueQau1480573790', '2016-11-30 23:29:50', '2016-11-30 23:29:50'),
(4, 'hery.trie@gmail.com', 'Hcv1zePKGDnw84ahxjXZ5ct2StHYPN8Xeemhz7kbCuPg2fRxp0A2rW1480574169', '2016-11-30 23:36:09', '2016-11-30 23:36:09'),
(5, 'hery.trie@gmail.com', 'WHcoWtLGt9uf3E2FOTwKslOe1C1kgp5XawwlQZVNsrNOlcenUAAAZC1480574215', '2016-11-30 23:36:55', '2016-11-30 23:36:55'),
(6, 'hery.trie@gmail.com', '0FkmybraGe7vDMSIwgF6Q1foXl9ZzPINwUde0xilGJER87znJbTVUd1480574238', '2016-11-30 23:37:18', '2016-11-30 23:37:18'),
(7, 'hery.trie@gmail.com', 'P1GkWEUNmHVq9nJAYlwzIMrvGkAxXO2xWbrQkYd6OpWUYxjd0IYzxo1480574272', '2016-11-30 23:37:52', '2016-11-30 23:37:52'),
(8, 'hery.trie@gmail.com', 'MCR1zX1XkpUcBi9tAown4yL3bWUJMhIBUO6irugXONsDW0kowYm7u01480574284', '2016-11-30 23:38:04', '2016-11-30 23:38:04'),
(9, 'hery.trie@gmail.com', 'cQ0uUoLbw9E9jMCHePimJQs6GRhYSXSgrZxS4SWUk2L9YAVUI7XmBS1480574416', '2016-11-30 23:40:16', '2016-11-30 23:40:16'),
(10, 'hery.trie@gmail.com', 'MCBLrKXlxVav5EWLEDyFCvPeDp6y5mUzz80FE5dt2RPOlqAn1ECJmv1480575021', '2016-11-30 23:50:21', '2016-11-30 23:50:21'),
(11, 'hery.trie@gmail.com', 'X6VnVOGq7TpfFr0Hu1C4MYbWpDiKxglfhF0mKqYYRJmXyoRTlAi6xt1480575312', '2016-11-30 23:55:12', '2016-11-30 23:55:12'),
(12, 'hery.trie@gmail.com', 'Gc6PWkP4VkoYNgjz0vRdBnv6Szvmc8hdUY2qxN4eXDmYcToN0uTBHG1480578458', '2016-12-01 00:47:38', '2016-12-01 00:47:38'),
(13, 'hery.trie@gmail.com', 'U7SNyfn1qEJurFhfxVoT8yjkS1EVmhypEYYYFQoYWFjPTxXORtWPLG1480580828', '2016-12-01 01:27:08', '2016-12-01 01:27:08'),
(14, 'hery.trie@gmail.com', 'uuPg8VMEb0myKRC5x2oBka1SkWiRN8KL0tEtDGb5fswJx2dbOXgFKz1480581337', '2016-12-01 01:35:37', '2016-12-01 01:35:37'),
(15, 'hery.trie@gmail.com', 'lLSOydLoWi6mcz3zL2ElvIFRJ9drCIkMTpmramqjIAcKLyepSlXqmA1480581405', '2016-12-01 01:36:45', '2016-12-01 01:36:45'),
(16, 'hery.trie@gmail.com', 'cz1z38XLFCiZqDJ1SfnXEjp5BZ4I9l12IH7WBRmZiZEj8ieIWQWf8J1480581437', '2016-12-01 01:37:17', '2016-12-01 01:37:17'),
(17, 'hery.trie@gmail.com', 'QApuwl2azsUSMCSSygKAFUfxPlOx16Kz3258cNDkhb5C1YRhfMIrCx1480581466', '2016-12-01 01:37:46', '2016-12-01 01:37:46'),
(18, 'hery.trie@gmail.com', 'dbUR1rFnYS4uaP5cJ5gPMGDKZJwlQuHuU1mS79UcoarHxVCGxPBfDe1480583667', '2016-12-01 02:14:27', '2016-12-01 02:14:27'),
(19, 'hery.trie@gmail.com', 'l4LMP1spKH7NvrCfYLkSD4vvFmMsxzCoupi4BjhIDeu7DYwLxehkIq1480583729', '2016-12-01 02:15:29', '2016-12-01 02:15:29'),
(20, 'hery.trie@gmail.com', 'wSswnZTz4tYi1V1TTxsZY1VHKnEoS5baCAB3F7CTz1UtYxA6UeHPE51480584433', '2016-12-01 02:27:13', '2016-12-01 02:27:13'),
(21, 'hery.trie@gmail.com', 'Zz5zLQh5AGRLqGN3UiPcHSrocFwpv6mvwqNvU2cpfUJUJNfho8KUNv1480584453', '2016-12-01 02:27:33', '2016-12-01 02:27:33'),
(22, 'hery.trie@gmail.com', 'HkbUs11un7zP4r8MQFnfztbNPpru91e6mhCEuIcdkUPlnM9ob0Yvwy1480584458', '2016-12-01 02:27:38', '2016-12-01 02:27:38'),
(23, 'hery.trie@gmail.com', 'mbOPQCDSQbG7B775Kzj3SFupEoYsIJfHoRROpXFy4KgxlueDahgVfu1480584793', '2016-12-01 02:33:13', '2016-12-01 02:33:13'),
(24, 'hery.trie@gmail.com', 'YziLxuqV7eiOt5kXlpJ5QzLC3RaXYhQAport37DgdVvp9OY9kLdJ5x1480585104', '2016-12-01 02:38:24', '2016-12-01 02:38:24'),
(25, 'hery.trie@gmail.com', 'NfC1e4t1jPoPReuw8UXmbSxoEL9ANTGA5O3xopekftRk8sQcTuDurd1480585199', '2016-12-01 02:39:59', '2016-12-01 02:39:59'),
(26, 'hery.trie@gmail.com', 'r5DOOBsFxKjBCgMpgnpGF0LsV0yK4hyIBcIOvWc1Q3Km87Fn5rSlIV1480647566', '2016-12-01 19:59:26', '2016-12-01 19:59:26'),
(27, 'hery.trie@gmail.com', '365F49htuV3sNbrvEvPsVNWsQWAtjP62oxpW2YrJtxzrsuArsup1cA1480647608', '2016-12-01 20:00:08', '2016-12-01 20:00:08'),
(28, 'hery.trie@gmail.com', 'Iy9kLn2Uxv04htyTWbtORNf3iMg3PClDR9pUYoAb9plxQSO0dqPf4p1480647633', '2016-12-01 20:00:33', '2016-12-01 20:00:33'),
(29, 'hery.trie@gmail.com', '5UkevrzJ3HPktuiSZM5KKgO0jbQlujYzh2caBm6LFEChRvn9U4uhNc1480647712', '2016-12-01 20:01:52', '2016-12-01 20:01:52');

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `id` int(10) UNSIGNED NOT NULL,
  `position_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`id`, `position_name`, `created_at`, `updated_at`) VALUES
(1, 'Vocalist', '2016-10-21 06:09:15', '2016-10-21 06:09:15'),
(2, 'Guitarist', '2016-10-21 06:09:20', '2016-10-21 06:09:20'),
(3, 'Bassis', '2016-10-21 06:10:48', '2016-10-21 06:10:48'),
(4, 'Drummer', '2016-10-21 06:10:54', '2016-10-21 06:10:54'),
(5, 'Keyboardist', '2016-10-21 06:10:59', '2016-10-21 06:10:59'),
(6, 'Pianist', '2016-10-21 06:11:02', '2016-10-21 06:11:02'),
(7, 'backing', '2016-10-21 06:11:07', '2016-10-21 06:11:07');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` int(10) UNSIGNED NOT NULL,
  `sewa_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `pesan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nilai` enum('1','2','3','4','5') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`id`, `sewa_id`, `user_id`, `pesan`, `nilai`, `created_at`, `updated_at`) VALUES
(1, 5, 1, 'Penampilan bandnya keren', '4', '2016-10-21 07:38:00', '2016-10-21 07:38:00'),
(2, 4, 1, 'Mantaph performance nya!', '4', '2016-10-23 20:21:36', '2016-10-23 20:21:36'),
(3, 7, 1, 'Memuaskan...', '5', '2016-10-25 23:07:55', '2016-10-25 23:07:55'),
(4, 8, 1, 'Good Job! suka sekali', '5', '2016-10-25 23:54:20', '2016-10-25 23:54:20'),
(6, 6, 1, 'Good Job dewo!', '4', '2016-10-26 06:25:24', '2016-10-26 06:25:24'),
(7, 19, 1, 'ntaph lah', '5', '2016-10-28 07:32:30', '2016-10-28 07:32:30'),
(9, 23, 1, 'awesome', '5', '2016-11-27 01:16:56', '2016-11-27 01:16:56'),
(10, 21, 1, 'nice', '5', '2016-11-27 02:18:48', '2016-11-27 02:18:48'),
(11, 13, 1, 'not bad', '3', '2016-11-27 06:30:31', '2016-11-27 06:30:31');

-- --------------------------------------------------------

--
-- Table structure for table `saldo`
--

CREATE TABLE `saldo` (
  `id` int(10) UNSIGNED NOT NULL,
  `saldo` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `type_pemilik` enum('musisi','band') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `saldo`
--

INSERT INTO `saldo` (`id`, `saldo`, `subject_id`, `type_pemilik`, `created_at`, `updated_at`) VALUES
(1, 38500000, 2, 'band', '2016-10-23 23:36:38', '2016-11-27 02:54:24'),
(2, 15200000, 1, 'musisi', '2016-10-23 23:38:34', '2016-11-27 02:54:24'),
(5, 5000000, 3, 'musisi', '2016-10-24 06:58:36', '2016-10-25 00:14:48'),
(6, 13000000, 2, 'musisi', '2016-10-28 07:20:41', '2016-11-27 02:18:48');

-- --------------------------------------------------------

--
-- Table structure for table `saldo_detail`
--

CREATE TABLE `saldo_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `saldo_id` int(11) NOT NULL,
  `sewa_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `saldo_detail`
--

INSERT INTO `saldo_detail` (`id`, `saldo_id`, `sewa_id`, `created_at`, `updated_at`) VALUES
(1, 2, 4, NULL, NULL),
(2, 1, 5, NULL, NULL),
(3, 1, 7, '2016-10-25 23:50:42', '2016-10-25 23:50:42'),
(4, 1, 8, '2016-10-25 23:52:41', '2016-10-25 23:52:41'),
(5, 6, 19, '2016-10-28 07:20:41', '2016-10-28 07:20:41'),
(6, 2, 13, '2016-10-31 00:53:43', '2016-10-31 00:53:43'),
(7, 6, 21, '2016-11-27 02:18:49', '2016-11-27 02:18:49'),
(8, 2, 22, '2016-11-27 02:52:50', '2016-11-27 02:52:50'),
(9, 2, 22, '2016-11-27 02:54:24', '2016-11-27 02:54:24'),
(10, 1, 23, '2016-11-27 02:54:24', '2016-11-27 02:54:24');

-- --------------------------------------------------------

--
-- Table structure for table `sewas`
--

CREATE TABLE `sewas` (
  `id` int(10) UNSIGNED NOT NULL,
  `total_biaya` int(11) NOT NULL,
  `gig_id` int(10) UNSIGNED NOT NULL,
  `object_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `status` enum('0','1','2','3','4','5','6') COLLATE utf8_unicode_ci NOT NULL,
  `status_request` enum('0','1','2') COLLATE utf8_unicode_ci NOT NULL,
  `type_sewa` enum('hireband','hiremusisi','bandhire','musisihire') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sewas`
--

INSERT INTO `sewas` (`id`, `total_biaya`, `gig_id`, `object_id`, `subject_id`, `status`, `status_request`, `type_sewa`, `created_at`, `updated_at`) VALUES
(1, 10000000, 1, 1, 2, '0', '2', 'bandhire', '2016-10-21 06:47:06', '2016-10-21 06:56:08'),
(2, 6000000, 1, 1, 2, '0', '2', 'musisihire', '2016-10-21 06:47:13', '2016-10-21 06:56:08'),
(4, 4000000, 1, 1, 1, '4', '1', 'musisihire', '2016-10-21 06:48:55', '2016-10-24 23:47:30'),
(5, 10000000, 2, 2, 1, '4', '1', 'hireband', '2016-10-21 06:58:53', '2016-10-23 23:36:38'),
(6, 5500000, 3, 1, 3, '4', '1', 'musisihire', '2016-10-23 19:56:37', '2016-10-24 06:58:36'),
(7, 15000000, 4, 1, 2, '4', '1', 'bandhire', '2016-10-25 23:00:36', '2016-10-25 23:50:43'),
(8, 7500000, 5, 1, 2, '4', '1', 'bandhire', '2016-10-25 23:43:16', '2016-10-25 23:52:41'),
(13, 5000000, 10, 1, 1, '4', '1', 'hiremusisi', '2016-10-27 06:57:59', '2016-10-31 00:53:43'),
(14, 10000000, 11, 2, 1, '1', '2', 'hireband', '2016-10-27 07:34:23', '2016-10-30 23:20:25'),
(15, 6000000, 12, 2, 1, '0', '2', 'hiremusisi', '2016-10-27 07:36:15', '2016-10-27 23:38:15'),
(19, 6000000, 12, 1, 2, '4', '1', 'musisihire', '2016-10-27 23:32:58', '2016-10-28 07:20:42'),
(20, 8000000, 12, 1, 2, '0', '2', 'bandhire', '2016-10-27 23:33:02', '2016-10-27 23:38:15'),
(21, 7500000, 13, 2, 1, '4', '1', 'hiremusisi', '2016-10-28 07:13:45', '2016-11-27 02:18:49'),
(22, 5000000, 11, 1, 1, '4', '1', 'musisihire', '2016-10-30 23:20:06', '2016-10-30 23:29:14'),
(23, 8000000, 14, 2, 1, '4', '1', 'hireband', '2016-10-30 23:31:50', '2016-10-30 23:33:46'),
(24, 4000000, 15, 2, 1, '5', '1', 'hireband', '2016-11-06 01:04:50', '2016-11-05 08:27:20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `aktif` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `slug` text COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `photo`, `aktif`, `slug`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Hera', 'Dwiana', 'oxydesystemz@ymail.com', '$2y$10$yFPWV0KOsGiRgSyvKi3.M.dU9/LY7ku8eJK2Fz.aDS9wJ6YMOIuXy', 'f8wqgvnccvuzoax5t6mt', 'Y', 'hera', 'VdIuBtRP3m2oMIgfPd0qGbI2qsIIntUAEVdBXfNhx0gqQaIQP969dNI04J6Z', '2016-10-21 06:13:33', '2016-12-01 01:25:49');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw`
--

CREATE TABLE `withdraw` (
  `id` int(10) UNSIGNED NOT NULL,
  `jumlah` int(11) NOT NULL,
  `saldo_id` int(10) UNSIGNED NOT NULL,
  `saldo_akhir` int(11) DEFAULT NULL,
  `status` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `withdraw`
--

INSERT INTO `withdraw` (`id`, `jumlah`, `saldo_id`, `saldo_akhir`, `status`, `created_at`, `updated_at`) VALUES
(7, 500000, 5, 5000000, '1', '2016-10-25 00:14:48', '2016-10-25 00:41:35'),
(8, 3000000, 2, 1000000, '1', '2016-10-25 00:15:46', '2016-10-25 08:25:29'),
(9, 800000, 2, 200000, '0', '2016-10-25 00:16:02', '2016-10-25 00:16:02'),
(10, 2000000, 1, 8000000, '1', '2016-10-25 02:33:59', '2016-10-25 02:36:07'),
(13, 500000, 6, 5500000, '1', '2016-10-29 04:59:23', '2016-10-29 05:14:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_admin`
--
ALTER TABLE `bank_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_musisi`
--
ALTER TABLE `bank_musisi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bank_musisi_musician_id_foreign` (`musician_id`),
  ADD KEY `bank_musisi_bank_id_foreign` (`bank_id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genre_bands`
--
ALTER TABLE `genre_bands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `genre_bands_band_id_foreign` (`band_id`),
  ADD KEY `genre_bands_genre_id_foreign` (`genre_id`);

--
-- Indexes for table `genre_musisi`
--
ALTER TABLE `genre_musisi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `genre_musisi_musician_id_foreign` (`musician_id`),
  ADD KEY `genre_musisi_genre_id_foreign` (`genre_id`);

--
-- Indexes for table `gigs`
--
ALTER TABLE `gigs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gigs_user_id_foreign` (`user_id`);

--
-- Indexes for table `grupbands`
--
ALTER TABLE `grupbands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grupbands_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `grupband_musisi`
--
ALTER TABLE `grupband_musisi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grupband_musisi_position_id_foreign` (`position_id`),
  ADD KEY `grupband_musisi_musician_id_foreign` (`musician_id`),
  ADD KEY `grupband_musisi_grupband_id_foreign` (`grupband_id`);

--
-- Indexes for table `konfirmasi_pembayarans`
--
ALTER TABLE `konfirmasi_pembayarans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `konfirmasi_pembayarans_sewa_id_foreign` (`sewa_id`);

--
-- Indexes for table `musicians`
--
ALTER TABLE `musicians`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `musicians_email_unique` (`email`);

--
-- Indexes for table `notif`
--
ALTER TABLE `notif`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `password_reset_musicians`
--
ALTER TABLE `password_reset_musicians`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `review_sewa_id_foreign` (`sewa_id`),
  ADD KEY `review_user_id_foreign` (`user_id`);

--
-- Indexes for table `saldo`
--
ALTER TABLE `saldo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `saldo_detail`
--
ALTER TABLE `saldo_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sewas`
--
ALTER TABLE `sewas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sewas_gig_id_foreign` (`gig_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `withdraw`
--
ALTER TABLE `withdraw`
  ADD PRIMARY KEY (`id`),
  ADD KEY `withdraw_saldo_id_foreign` (`saldo_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `bank_admin`
--
ALTER TABLE `bank_admin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `bank_musisi`
--
ALTER TABLE `bank_musisi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `genre_bands`
--
ALTER TABLE `genre_bands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `genre_musisi`
--
ALTER TABLE `genre_musisi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `gigs`
--
ALTER TABLE `gigs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `grupbands`
--
ALTER TABLE `grupbands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `grupband_musisi`
--
ALTER TABLE `grupband_musisi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `konfirmasi_pembayarans`
--
ALTER TABLE `konfirmasi_pembayarans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `musicians`
--
ALTER TABLE `musicians`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `notif`
--
ALTER TABLE `notif`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `password_reset_musicians`
--
ALTER TABLE `password_reset_musicians`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `saldo`
--
ALTER TABLE `saldo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `saldo_detail`
--
ALTER TABLE `saldo_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `sewas`
--
ALTER TABLE `sewas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `withdraw`
--
ALTER TABLE `withdraw`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `bank_musisi`
--
ALTER TABLE `bank_musisi`
  ADD CONSTRAINT `bank_musisi_bank_id_foreign` FOREIGN KEY (`bank_id`) REFERENCES `banks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bank_musisi_musician_id_foreign` FOREIGN KEY (`musician_id`) REFERENCES `musicians` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `genre_bands`
--
ALTER TABLE `genre_bands`
  ADD CONSTRAINT `genre_bands_band_id_foreign` FOREIGN KEY (`band_id`) REFERENCES `grupbands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `genre_bands_genre_id_foreign` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `genre_musisi`
--
ALTER TABLE `genre_musisi`
  ADD CONSTRAINT `genre_musisi_genre_id_foreign` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `genre_musisi_musician_id_foreign` FOREIGN KEY (`musician_id`) REFERENCES `musicians` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gigs`
--
ALTER TABLE `gigs`
  ADD CONSTRAINT `gigs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `grupbands`
--
ALTER TABLE `grupbands`
  ADD CONSTRAINT `grupbands_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `musicians` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `grupband_musisi`
--
ALTER TABLE `grupband_musisi`
  ADD CONSTRAINT `grupband_musisi_grupband_id_foreign` FOREIGN KEY (`grupband_id`) REFERENCES `grupbands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `grupband_musisi_musician_id_foreign` FOREIGN KEY (`musician_id`) REFERENCES `musicians` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `grupband_musisi_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `konfirmasi_pembayarans`
--
ALTER TABLE `konfirmasi_pembayarans`
  ADD CONSTRAINT `konfirmasi_pembayarans_sewa_id_foreign` FOREIGN KEY (`sewa_id`) REFERENCES `sewas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_sewa_id_foreign` FOREIGN KEY (`sewa_id`) REFERENCES `sewas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `review_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sewas`
--
ALTER TABLE `sewas`
  ADD CONSTRAINT `sewas_gig_id_foreign` FOREIGN KEY (`gig_id`) REFERENCES `gigs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `withdraw`
--
ALTER TABLE `withdraw`
  ADD CONSTRAINT `withdraw_saldo_id_foreign` FOREIGN KEY (`saldo_id`) REFERENCES `saldo` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
