-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 30, 2016 at 08:14 AM
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
(1, 'heri', 'heri@gmail.com', '$2y$10$stMd4anSPfmL/hNey3TX.utMBLyZJeHTzdFcgppO4ujqN0fXsEvQ6', 'qSp7BrNDmLG4RmO8hD9rK76qJ5E8QChSKPhb20bOM74FhTuZdq8nNtP3pjIV', NULL, '2016-10-29 05:14:24');

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
(3, 'Mandiri', '12345367', 'Dewo', '', '2016-10-23 19:46:42', '2016-10-23 19:46:42');

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
(3, 3, 3, '2016-10-23 19:46:42', '2016-10-23 19:46:42');

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
(1, 1, 1, '2016-10-21 06:30:37', '2016-10-21 06:30:37'),
(2, 1, 2, '2016-10-21 06:30:37', '2016-10-21 06:30:37'),
(4, 2, 1, '2016-10-21 06:41:33', '2016-10-21 06:41:33'),
(5, 2, 3, '2016-10-21 06:41:33', '2016-10-21 06:41:33');

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
(6, 3, 5, '2016-10-23 19:46:42', '2016-10-23 19:46:42');

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
(11, 'Acara test', 'test aja', '', 'J. L. Gordon Street, Tel Aviv-Yafo, Israel', 'medan', '32.08166899999999', '34.774463999999966', '2016-11-10 18:00:00', '2016-11-10 23:00:00', '0', 'post', 1, 'Y', 'acara-test', '2016-10-27 07:34:23', '2016-10-27 21:15:08'),
(12, 'Acarat ntah apa', 'fgdfhdjdj', '', 'J. L. Long Middle School, Reiger Avenue, Dallas, TX, United States', 'Jauh', '32.80678350000001', '-96.74906470000002', '2016-11-10 18:00:00', '2016-11-10 22:00:00', '1', 'post', 1, 'Y', 'acarat-ntah-apa', '2016-10-27 07:36:15', '2016-10-27 23:38:15'),
(13, 'Acara Makan Bersama', 'sdgfsgfdgdfgh', '', 'J. L. Long Middle School, Reiger Avenue, Dallas, TX, United States', 'diman aja', '32.80678350000001', '-96.74906470000002', '2016-11-10 18:00:00', '2016-11-10 23:00:00', '0', 'sewa', 1, 'Y', 'acara-makan-bersama', '2016-10-28 07:13:45', '2016-10-28 07:13:45');

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
(2, 'Dewi Dewi', 'Dewi dewi band is good', 'Group', '-', 'Bandung', 'nbz7hvshyrlcep2aafil', 'sample', 2000000, '', '', '', '', 'Y', 2, 'dewi-dewi', '2016-10-21 06:41:33', '2016-10-21 06:41:33');

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
(4, 2, 1, 2, '2016-10-25 02:44:36', '2016-10-25 02:44:36');

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
(5, 'herawati', '', 'Mandiri', '', 8, 3, '2016-10-25 23:52:05', '2016-10-25 23:52:05');

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
(1, 'heri', 'he@ri.com', '$2y$10$mJJFOWR7/YM9Z74mOEWaE.1J6Oa8yaTkFltYTbYj3.ezlD9aCl/TS', 'Solo', 'Duo', 'My Music is Murottal', '081398797257', 'Medan', 1000000, 'default_user', '', '', '', '', 'Y', 'heri', 'Jn8R3rEvUIvQvRkBBzHy3HMckYX5GG4QOSRhAvxnjPh5GXzswZYyZTAvXKg8', '2016-10-21 06:07:26', '2016-10-28 06:39:15'),
(2, 'Dewi', 'dewi@gmail.com', '$2y$10$V7m3pApEQ6snvW2R8u5afuKcWccF9wefyftgLACtoRXhgGQo.Xqti', 'Solo', '-', 'My Music is Asyik', '085278639012', 'Bandung', 1500000, 'default_user', '', '', '', '', 'Y', 'dewi', 'aXzIEy6Ooyc0OLsFHeb2EVs8P2JUMnSdWdbPYNJkk41rGUCpDUjuueXDqNq8', '2016-10-21 06:12:15', '2016-10-29 04:59:38'),
(3, 'dewo', 'dewo@gmail.com', '$2y$10$WSAw2wLtYgHXu72Rfuu6kOcbBbKSk4gsHCPCSRFauNTdY9pA8A68e', 'Solo', '-', 'Anak Rocker Men', '09083424', 'Jakarta', 500000, 'default_user', '', '', '', '', 'Y', 'dewo', 'fXUmXuoU9vlILvOaA5z4lharMVfpBT1tOvblRQTsIUPqP8CJezsiPmFqsIru', '2016-10-23 19:45:56', '2016-10-27 21:14:35');

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
(29, 0, 0, 'admin', 2, 'musisi', 'withdrawselesai', 'Y', '2016-10-29 12:17:31', '2016-10-29 05:17:31');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(7, 19, 1, 'ntaph lah', '5', '2016-10-28 07:32:30', '2016-10-28 07:32:30');

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
(1, 30500000, 2, 'band', '2016-10-23 23:36:38', '2016-10-25 23:52:40'),
(2, 200000, 1, 'musisi', '2016-10-23 23:38:34', '2016-10-25 00:16:02'),
(5, 5000000, 3, 'musisi', '2016-10-24 06:58:36', '2016-10-25 00:14:48'),
(6, 5500000, 2, 'musisi', '2016-10-28 07:20:41', '2016-10-29 04:59:23');

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
(5, 6, 19, '2016-10-28 07:20:41', '2016-10-28 07:20:41');

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
(13, 5000000, 10, 1, 1, '2', '1', 'hiremusisi', '2016-10-27 06:57:59', '2016-10-28 06:34:40'),
(14, 10000000, 11, 2, 1, '0', '2', 'hireband', '2016-10-27 07:34:23', '2016-10-27 21:15:08'),
(15, 6000000, 12, 2, 1, '0', '2', 'hiremusisi', '2016-10-27 07:36:15', '2016-10-27 23:38:15'),
(19, 6000000, 12, 1, 2, '4', '1', 'musisihire', '2016-10-27 23:32:58', '2016-10-28 07:20:42'),
(20, 8000000, 12, 1, 2, '0', '2', 'bandhire', '2016-10-27 23:33:02', '2016-10-27 23:38:15'),
(21, 7500000, 13, 2, 1, '0', '0', 'hiremusisi', '2016-10-28 07:13:45', '2016-10-28 07:13:45');

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
(1, 'Hera', 'Dwiana', 'hera@gmail.com', '$2y$10$qhnpk/O1I5zhmgOIHmXRtOTChne7NdscdlfjFi/D8sKQxAUJFvt4G', 'f8wqgvnccvuzoax5t6mt', 'Y', 'hera', 'BsjjiY1FO4DLm1vVpF2S3yZUqJZMNiTAdFNjkMuYEBqXqmno7jt1QuhR9CW3', '2016-10-21 06:13:33', '2016-10-28 07:32:39');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `bank_admin`
--
ALTER TABLE `bank_admin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `bank_musisi`
--
ALTER TABLE `bank_musisi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `genre_bands`
--
ALTER TABLE `genre_bands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `genre_musisi`
--
ALTER TABLE `genre_musisi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `gigs`
--
ALTER TABLE `gigs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `grupbands`
--
ALTER TABLE `grupbands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `grupband_musisi`
--
ALTER TABLE `grupband_musisi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `konfirmasi_pembayarans`
--
ALTER TABLE `konfirmasi_pembayarans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `musicians`
--
ALTER TABLE `musicians`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `notif`
--
ALTER TABLE `notif`
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `saldo`
--
ALTER TABLE `saldo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `saldo_detail`
--
ALTER TABLE `saldo_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sewas`
--
ALTER TABLE `sewas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
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
