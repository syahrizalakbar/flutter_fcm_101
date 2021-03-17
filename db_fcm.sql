-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 16 Mar 2021 pada 10.12
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_fcm`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `id_user`, `created_by`, `created_at`) VALUES
(1, 'Task hari ini', 'djsnsnsnnsbsbsbsbsn', 7, 1, '2021-03-16 00:33:15'),
(2, 'Task hari ini', 'djsnsnsnnsbsbsbsbsn', 8, 1, '2021-03-16 00:33:15'),
(3, 'Task hari ini', 'djsnsnsnnsbsbsbsbsn', 9, 1, '2021-03-16 00:33:15'),
(4, 'Task hari ini', 'djsnsnsnnsbsbsbsbsn', 6, 1, '2021-03-16 00:33:15'),
(5, 'Task hari ini', 'djsnsnsnnsbsbsbsbsn', 5, 1, '2021-03-16 00:33:15'),
(6, 'Task hari ini', 'djsnsnsnnsbsbsbsbsn', 4, 1, '2021-03-16 00:33:15'),
(7, 'Task 2', 'hdhdjdjdhdhhd', 7, 1, '2021-03-16 00:33:41'),
(8, 'Task 2', 'hdhdjdjdhdhhd', 8, 1, '2021-03-16 00:33:41'),
(9, 'Task 2', 'hdhdjdjdhdhhd', 9, 1, '2021-03-16 00:33:41'),
(10, 'Task 2', 'hdhdjdjdhdhhd', 5, 1, '2021-03-16 00:33:41'),
(11, 'Task 2', 'hdhdjdjdhdhhd', 6, 1, '2021-03-16 00:33:41'),
(12, 'Task 2', 'hdhdjdjdhdhhd', 4, 1, '2021-03-16 00:33:41'),
(13, 'xdsdfsdf', 'fSDF34242234 asd', 1, 1, '2021-03-16 01:31:48'),
(14, 'xdsdfsdf', 'fSDF34242234 asd', 2, 1, '2021-03-16 01:31:48'),
(15, 'xdsdfsdf', 'fSDF34242234 asd', 3, 1, '2021-03-16 01:31:48'),
(16, 'xdsdfsdf', 'fSDF34242234 asd', 7, 1, '2021-03-16 01:31:48'),
(17, 'xdsdfsdf', 'fSDF34242234 asd', 8, 1, '2021-03-16 01:31:48'),
(18, 'xdsdfsdf', 'fSDF34242234 asd', 9, 1, '2021-03-16 01:31:48'),
(19, 'xdsdfsdf', 'fSDF34242234 asd', 1, 1, '2021-03-16 01:32:39'),
(20, 'xdsdfsdf', 'fSDF34242234 asd', 2, 1, '2021-03-16 01:32:39'),
(21, 'xdsdfsdf', 'fSDF34242234 asd', 3, 1, '2021-03-16 01:32:39'),
(22, 'xdsdfsdf', 'fSDF34242234 asd', 7, 1, '2021-03-16 01:32:39'),
(23, 'xdsdfsdf', 'fSDF34242234 asd', 8, 1, '2021-03-16 01:32:39'),
(24, 'xdsdfsdf', 'fSDF34242234 asd', 9, 1, '2021-03-16 01:32:39'),
(25, 'xdsdfsdf', 'fSDF34242234 asd', 1, 1, '2021-03-16 01:32:50'),
(26, 'xdsdfsdf', 'fSDF34242234 asd', 2, 1, '2021-03-16 01:32:50'),
(27, 'xdsdfsdf', 'fSDF34242234 asd', 3, 1, '2021-03-16 01:32:50'),
(28, 'xdsdfsdf', 'fSDF34242234 asd', 7, 1, '2021-03-16 01:32:50'),
(29, 'xdsdfsdf', 'fSDF34242234 asd', 8, 1, '2021-03-16 01:32:50'),
(30, 'xdsdfsdf', 'fSDF34242234 asd', 9, 1, '2021-03-16 01:32:50'),
(31, 'xdsdfsdf', 'fSDF34242234 asd', 1, 1, '2021-03-16 01:32:59'),
(32, 'xdsdfsdf', 'fSDF34242234 asd', 1, 1, '2021-03-16 01:33:05'),
(33, 'xdsdfsdf', 'fSDF34242234 asd', 2, 1, '2021-03-16 01:33:05'),
(34, 'xdsdfsdf', 'fSDF34242234 asd', 3, 1, '2021-03-16 01:33:05'),
(35, 'xdsdfsdf', 'fSDF34242234 asd', 7, 1, '2021-03-16 01:33:05'),
(36, 'xdsdfsdf', 'fSDF34242234 asd', 8, 1, '2021-03-16 01:33:05'),
(37, 'xdsdfsdf', 'fSDF34242234 asd', 9, 1, '2021-03-16 01:33:05'),
(38, 'xdsdfsdf', 'fSDF34242234 asd', 1, 1, '2021-03-16 01:33:11'),
(39, 'xdsdfsdf', 'fSDF34242234 asd', 2, 1, '2021-03-16 01:33:11'),
(40, 'xdsdfsdf', 'fSDF34242234 asd', 3, 1, '2021-03-16 01:33:11'),
(41, 'xdsdfsdf', 'fSDF34242234 asd', 7, 1, '2021-03-16 01:33:11'),
(42, 'xdsdfsdf', 'fSDF34242234 asd', 8, 1, '2021-03-16 01:33:11'),
(43, 'xdsdfsdf', 'fSDF34242234 asd', 9, 1, '2021-03-16 01:33:11'),
(44, 'xdsdfsdf', 'fSDF34242234 asd', 1, 1, '2021-03-16 01:33:16'),
(45, 'xdsdfsdf', 'fSDF34242234 asd', 2, 1, '2021-03-16 01:33:16'),
(46, 'xdsdfsdf', 'fSDF34242234 asd', 3, 1, '2021-03-16 01:33:16'),
(47, 'xdsdfsdf', 'fSDF34242234 asd', 9, 1, '2021-03-16 01:33:16'),
(48, 'xdsdfsdf', 'fSDF34242234 asd', 1, 1, '2021-03-16 01:33:19'),
(49, 'xdsdfsdf', 'fSDF34242234 asd', 9, 1, '2021-03-16 01:33:19'),
(50, 'xdsdfsdf', 'fSDF34242234 asd', 1, 1, '2021-03-16 01:34:03'),
(51, 'xdsdfsdf', 'fSDF34242234 asd', 2, 1, '2021-03-16 01:34:03'),
(52, 'xdsdfsdf', 'fSDF34242234 asd', 3, 1, '2021-03-16 01:34:03'),
(53, 'xdsdfsdf', 'fSDF34242234 asd', 1, 1, '2021-03-16 01:34:31'),
(54, 'xdsdfsdf', 'fSDF34242234 asd', 2, 1, '2021-03-16 01:34:31'),
(55, 'xdsdfsdf', 'fSDF34242234 asd', 3, 1, '2021-03-16 01:34:31'),
(56, 'xdsdfsdf', 'fSDF34242234 asd', 1, 1, '2021-03-16 01:34:49'),
(57, 'xdsdfsdf', 'fSDF34242234 asd', 2, 1, '2021-03-16 01:34:49'),
(58, 'xdsdfsdf', 'fSDF34242234 asd', 3, 1, '2021-03-16 01:34:49'),
(59, 'xdsdfsdf', 'fSDF34242234 asd', 1, 1, '2021-03-16 01:35:06'),
(60, 'xdsdfsdf', 'fSDF34242234 asd', 2, 1, '2021-03-16 01:35:06'),
(61, 'xdsdfsdf', 'fSDF34242234 asd', 3, 1, '2021-03-16 01:35:06'),
(62, 'xdsdfsdf', 'fSDF34242234 asd', 1, 1, '2021-03-16 01:36:03'),
(63, 'xdsdfsdf', 'fSDF34242234 asd', 2, 1, '2021-03-16 01:36:03'),
(64, 'xdsdfsdf', 'fSDF34242234 asd', 3, 1, '2021-03-16 01:36:03'),
(65, 'xdsdfsdf', 'fSDF34242234 asd', 1, 1, '2021-03-16 01:36:22'),
(66, 'xdsdfsdf', 'fSDF34242234 asd', 2, 1, '2021-03-16 01:36:22'),
(67, 'xdsdfsdf', 'fSDF34242234 asd', 3, 1, '2021-03-16 01:36:22'),
(68, 'xdsdfsdf', 'fSDF34242234 asd', 1, 1, '2021-03-16 01:36:35'),
(69, 'xdsdfsdf', 'fSDF34242234 asd', 2, 1, '2021-03-16 01:36:35'),
(70, 'xdsdfsdf', 'fSDF34242234 asd', 3, 1, '2021-03-16 01:36:35'),
(71, 'xdsdfsdf', 'fSDF34242234 asd', 1, 1, '2021-03-16 01:36:59'),
(72, 'xdsdfsdf', 'fSDF34242234 asd', 2, 1, '2021-03-16 01:36:59'),
(73, 'xdsdfsdf', 'fSDF34242234 asd', 3, 1, '2021-03-16 01:36:59'),
(74, 'xdsdfsdf', 'fSDF34242234 asd', 1, 1, '2021-03-16 01:37:28'),
(75, 'xdsdfsdf', 'fSDF34242234 asd', 2, 1, '2021-03-16 01:37:28'),
(76, 'xdsdfsdf', 'fSDF34242234 asd', 3, 1, '2021-03-16 01:37:28'),
(77, 'xdsdfsdf', 'fSDF34242234 asd', 1, 1, '2021-03-16 01:37:48'),
(78, 'xdsdfsdf', 'fSDF34242234 asd', 2, 1, '2021-03-16 01:37:48'),
(79, 'xdsdfsdf', 'fSDF34242234 asd', 3, 1, '2021-03-16 01:37:48'),
(80, 'xdsdfsdf', 'fSDF34242234 asd', 1, 1, '2021-03-16 01:38:26'),
(81, 'xdsdfsdf', 'fSDF34242234 asd', 2, 1, '2021-03-16 01:38:26'),
(82, 'xdsdfsdf', 'fSDF34242234 asd', 3, 1, '2021-03-16 01:38:26'),
(83, 'xdsdfsdf', 'fSDF34242234 asd', 1, 1, '2021-03-16 01:38:54'),
(84, 'xdsdfsdf', 'fSDF34242234 asd', 1, 1, '2021-03-16 01:39:24'),
(85, 'xdsdfsdf', 'fSDF34242234 asd', 2, 1, '2021-03-16 01:39:24'),
(86, 'xdsdfsdf', 'fSDF34242234 asd', 3, 1, '2021-03-16 01:39:24'),
(87, 'xdsdfsdf', 'fSDF34242234 asd', 1, 1, '2021-03-16 01:40:06'),
(88, 'xdsdfsdf', 'fSDF34242234 asd', 2, 1, '2021-03-16 01:40:06'),
(89, 'xdsdfsdf', 'fSDF34242234 asd', 3, 1, '2021-03-16 01:40:06'),
(90, 'xdsdfsdf', 'fSDF34242234 asd', 1, 1, '2021-03-16 01:40:37'),
(91, 'xdsdfsdf', 'fSDF34242234 asd', 2, 1, '2021-03-16 01:40:37'),
(92, 'xdsdfsdf', 'fSDF34242234 asd', 3, 1, '2021-03-16 01:40:37'),
(93, 'xdsdfsdf', 'fSDF34242234 asd', 1, 1, '2021-03-16 01:40:52'),
(94, 'xdsdfsdf', 'fSDF34242234 asd', 9, 1, '2021-03-16 01:40:52'),
(95, 'xdsdfsdf', 'fSDF34242234 asd', 1, 1, '2021-03-16 01:41:15'),
(96, 'xdsdfsdf', 'fSDF34242234 asd', 9, 1, '2021-03-16 01:41:15'),
(97, 'xdsdfsdf', 'fSDF34242234 asd', 1, 1, '2021-03-16 01:41:22'),
(98, 'xdsdfsdf', 'fSDF34242234 asd', 2, 1, '2021-03-16 01:41:22'),
(99, 'xdsdfsdf', 'fSDF34242234 asd', 1, 1, '2021-03-16 01:41:37'),
(100, 'xdsdfsdf', 'fSDF34242234 asd', 2, 1, '2021-03-16 01:41:37'),
(101, 'xdsdfsdf', 'fSDF34242234 asd', 3, 1, '2021-03-16 01:41:37'),
(102, 'xdsdfsdf', 'fSDF34242234 asd', 7, 1, '2021-03-16 06:11:44'),
(103, 'xdsdfsdf', 'fSDF34242234 asd', 8, 1, '2021-03-16 06:11:44'),
(104, 'xdsdfsdf', 'fSDF34242234 asd', 9, 1, '2021-03-16 06:11:44'),
(105, 'xdsdfsdf', 'fSDF34242234 asd', 1, 1, '2021-03-16 06:11:44'),
(106, 'xdsdfsdf', 'fSDF34242234 asd', 2, 1, '2021-03-16 06:11:44'),
(107, 'xdsdfsdf', 'fSDF34242234 asd', 3, 1, '2021-03-16 06:11:44'),
(108, 'xdsdfsdf', 'fSDF34242234 asd', 7, 1, '2021-03-16 06:12:48'),
(109, 'xdsdfsdf', 'fSDF34242234 asd', 8, 1, '2021-03-16 06:12:48'),
(110, 'xdsdfsdf', 'fSDF34242234 asd', 9, 1, '2021-03-16 06:12:48'),
(111, 'xdsdfsdf', 'fSDF34242234 asd', 1, 1, '2021-03-16 06:12:48'),
(112, 'xdsdfsdf', 'fSDF34242234 asd', 2, 1, '2021-03-16 06:12:48'),
(113, 'xdsdfsdf', 'fSDF34242234 asd', 3, 1, '2021-03-16 06:12:48'),
(114, 'xdsdfsdf', 'fSDF34242234 asd', 7, 1, '2021-03-16 06:13:02'),
(115, 'xdsdfsdf', 'fSDF34242234 asd', 8, 1, '2021-03-16 06:13:02'),
(116, 'xdsdfsdf', 'fSDF34242234 asd', 9, 1, '2021-03-16 06:13:02'),
(117, 'xdsdfsdf', 'fSDF34242234 asd', 1, 1, '2021-03-16 06:13:02'),
(118, 'xdsdfsdf', 'fSDF34242234 asd', 2, 1, '2021-03-16 06:13:02'),
(119, 'xdsdfsdf', 'fSDF34242234 asd', 3, 1, '2021-03-16 06:13:02'),
(120, 'xdsdfsdf', 'fSDF34242234 asd', 7, 1, '2021-03-16 06:14:14'),
(121, 'xdsdfsdf', 'fSDF34242234 asd', 8, 1, '2021-03-16 06:14:14'),
(122, 'xdsdfsdf', 'fSDF34242234 asd', 9, 1, '2021-03-16 06:14:14'),
(123, 'xdsdfsdf', 'fSDF34242234 asd', 1, 1, '2021-03-16 06:14:14'),
(124, 'xdsdfsdf', 'fSDF34242234 asd', 2, 1, '2021-03-16 06:14:14'),
(125, 'xdsdfsdf', 'fSDF34242234 asd', 3, 1, '2021-03-16 06:14:14'),
(126, 'xdsdfsdf', 'fSDF34242234 asd', 7, 1, '2021-03-16 06:14:40'),
(127, 'xdsdfsdf', 'fSDF34242234 asd', 8, 1, '2021-03-16 06:14:40'),
(128, 'xdsdfsdf', 'fSDF34242234 asd', 9, 1, '2021-03-16 06:14:40'),
(129, 'xdsdfsdf', 'fSDF34242234 asd', 1, 1, '2021-03-16 06:14:40'),
(130, 'xdsdfsdf', 'fSDF34242234 asd', 2, 1, '2021-03-16 06:14:40'),
(131, 'xdsdfsdf', 'fSDF34242234 asd', 3, 1, '2021-03-16 06:14:40'),
(132, 'xdsdfsdf', 'fSDF34242234 asd', 7, 1, '2021-03-16 07:18:27'),
(133, 'xdsdfsdf', 'fSDF34242234 asd', 7, 1, '2021-03-16 07:19:09'),
(134, 'xdsdfsdf', 'fSDF34242234 asd', 7, 1, '2021-03-16 07:19:49'),
(135, 'xdsdfsdf', 'fSDF34242234 asd', 7, 1, '2021-03-16 07:21:15'),
(136, 'xdsdfsdf', 'fSDF34242234 asd', 1, 1, '2021-03-16 07:27:02'),
(137, 'xdsdfsdf', 'fSDF34242234 asd', 2, 1, '2021-03-16 07:27:02'),
(138, 'xdsdfsdf', 'fSDF34242234 asd', 3, 1, '2021-03-16 07:27:02'),
(139, 'xdsdfsdf', 'fSDF34242234 asd', 7, 1, '2021-03-16 07:27:02'),
(140, 'xdsdfsdf', 'fSDF34242234 asd', 8, 1, '2021-03-16 07:27:02'),
(141, 'xdsdfsdf', 'fSDF34242234 asd', 9, 1, '2021-03-16 07:27:02'),
(142, 'xdsdfsdf', 'fSDF34242234 asd', 1, 1, '2021-03-16 07:27:26'),
(143, 'xdsdfsdf', 'fSDF34242234 asd', 2, 1, '2021-03-16 07:27:26'),
(144, 'xdsdfsdf', 'fSDF34242234 asd', 3, 1, '2021-03-16 07:27:26'),
(145, 'xdsdfsdf', 'fSDF34242234 asd', 7, 1, '2021-03-16 07:27:26'),
(146, 'xdsdfsdf', 'fSDF34242234 asd', 8, 1, '2021-03-16 07:27:26'),
(147, 'xdsdfsdf', 'fSDF34242234 asd', 9, 1, '2021-03-16 07:27:26'),
(148, 'xdsdfsdf', 'fSDF34242234 asd', 1, 1, '2021-03-16 07:28:32'),
(149, 'xdsdfsdf', 'fSDF34242234 asd', 2, 1, '2021-03-16 07:28:32'),
(150, 'xdsdfsdf', 'fSDF34242234 asd', 3, 1, '2021-03-16 07:28:32'),
(151, 'xdsdfsdf', 'fSDF34242234 asd', 7, 1, '2021-03-16 07:28:32'),
(152, 'xdsdfsdf', 'fSDF34242234 asd', 8, 1, '2021-03-16 07:28:32'),
(153, 'xdsdfsdf', 'fSDF34242234 asd', 9, 1, '2021-03-16 07:28:32'),
(154, 'xdsdfsdf', 'fSDF34242234 asd', 1, 1, '2021-03-16 07:38:46'),
(155, 'xdsdfsdf', 'fSDF34242234 asd', 2, 1, '2021-03-16 07:38:46'),
(156, 'xdsdfsdf', 'fSDF34242234 asd', 3, 1, '2021-03-16 07:38:46'),
(157, 'xdsdfsdf', 'fSDF34242234 asd', 7, 1, '2021-03-16 07:38:46'),
(158, 'xdsdfsdf', 'fSDF34242234 asd', 8, 1, '2021-03-16 07:38:46'),
(159, 'xdsdfsdf', 'fSDF34242234 asd', 9, 1, '2021-03-16 07:38:46'),
(160, 'xdsdfsdf', 'fSDF34242234 asd', 7, 1, '2021-03-16 07:39:24'),
(161, 'xdsdfsdf', 'fSDF34242234 asd', 2, 1, '2021-03-16 07:39:24'),
(162, 'xdsdfsdf', 'fSDF34242234 asd', 3, 1, '2021-03-16 07:39:24'),
(163, 'xdsdfsdf', 'fSDF34242234 asd', 7, 1, '2021-03-16 07:39:54'),
(164, 'xdsdfsdf', 'fSDF34242234 asd', 2, 1, '2021-03-16 07:39:54'),
(165, 'xdsdfsdf', 'fSDF34242234 asd', 3, 1, '2021-03-16 07:39:54'),
(166, 'xdsdfsdf', 'fSDF34242234 asd', 7, 1, '2021-03-16 07:40:05'),
(167, 'xdsdfsdf', 'fSDF34242234 asd', 2, 1, '2021-03-16 07:40:05'),
(168, 'xdsdfsdf', 'fSDF34242234 asd', 3, 1, '2021-03-16 07:40:05'),
(169, 'xdsdfsdf', 'fSDF34242234 asd', 7, 1, '2021-03-16 07:41:25'),
(170, 'xdsdfsdf', 'fSDF34242234 asd', 2, 1, '2021-03-16 07:41:25'),
(171, 'xdsdfsdf', 'fSDF34242234 asd', 3, 1, '2021-03-16 07:41:25'),
(172, 'xdsdfsdf', 'fSDF34242234 asd', 1, 1, '2021-03-16 07:56:18'),
(173, 'xdsdfsdf', 'fSDF34242234 asd', 2, 1, '2021-03-16 07:56:18'),
(174, 'xdsdfsdf', 'fSDF34242234 asd', 3, 1, '2021-03-16 07:56:18'),
(175, 'xdsdfsdf', 'fSDF34242234 asd', 7, 1, '2021-03-16 07:56:18'),
(176, 'xdsdfsdf', 'fSDF34242234 asd', 8, 1, '2021-03-16 07:56:18'),
(177, 'xdsdfsdf', 'fSDF34242234 asd', 9, 1, '2021-03-16 07:56:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `jabatan` enum('MANAGER','LEADER','NORMAL') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `jabatan`) VALUES
(1, 'manajer_a', '123123', 'MANAGER'),
(2, 'manajer_b', '123123', 'MANAGER'),
(3, 'manajer_c', '123123', 'MANAGER'),
(4, 'leader_a', '123123', 'LEADER'),
(5, 'leader_b', '123123', 'LEADER'),
(6, 'leader_c', '123123', 'LEADER'),
(7, 'normal_a', '123123', 'NORMAL'),
(8, 'normal_b', '123123', 'NORMAL'),
(9, 'normal_c', '123123', 'NORMAL');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users_token`
--

CREATE TABLE `users_token` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `device_id` varchar(255) NOT NULL,
  `firebase_token` varchar(255) NOT NULL,
  `still_valid` tinyint(1) NOT NULL DEFAULT 1,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users_token`
--

INSERT INTO `users_token` (`id`, `id_user`, `device_id`, `firebase_token`, `still_valid`, `updated_at`) VALUES
(1, 1, '234u293924203423423', 'fFITXlHdBgQ:APA91bGV81LJnalh32pRvEn5qGvuKRqNn7R4wDU5TSFh2yqz0WETfri1U0PCNbYScRbPouYaBou-Og5HJlkhM0Gme_xYVaWfnGngRCoRLn8jXdRrIv2wYphJp-cbumCO0sVuWCajLRFa', 1, '2021-03-11 03:31:20'),
(2, 1, '289374982c923nc492c3c423c4', 'c2n3cuihewciuehwfnc92y3y49823c419cn0120918c2n0981n0c9812309cn091n2n3c012c1092c8012c091c2', 0, '2021-03-11 03:31:20'),
(3, 3, '34892374c9n23c4923c482c3c4', 'cjhncfihscinuwuyercbq8yc32819c41983240c82034c87012c34c1234c123cnwehcriobisc2nruwecnwcqe', 0, '2021-03-11 03:31:20'),
(4, 4, '123c812n18nc4c14c1c241c4', 'ckjscnnkchnuiwenrcn012893n019c8n0481m9icnwoqouc3o10jc088cu02398cu0981u2nc0r8unc1238curn2c1', 1, '2021-03-11 03:31:20'),
(5, 5, '847c9n8274c89n12c982393823472', 'jhkcnjhfknqweqcjnor9328c982uc8u23n08c28ybv8y20nycn209c4809182c0n934c902n0c4092nc4n21c40c214c3', 1, '2021-03-11 03:31:20'),
(6, 6, '238949283cn82c2348cn23c42c2343', 'nweoicfniwhcryq0283c0981327498cn281750817083174087120348c702813c409821n7c490nc230n47901273nc490n', 1, '2021-03-11 03:31:20'),
(7, 7, '28374917n20c1c2n0124c1c2412c4', 'iunkwjhvhroi2c801238c4n0192834cn09283c4098120c489201c94c21c412c42cn4y81n12c31ch81y983y10483yc13', 0, '2021-03-11 03:31:20'),
(8, 8, '28342c42c38n23c42442452323cc23c', 'fdn9c2c490182ucn49012cu49c123498nc2813bv8917ybc23y0n2v13cm18c81vn09u2nv98n19082v3812v5081yv208u4ytbe', 1, '2021-03-11 03:31:20'),
(9, 9, '14197301cn1cn20948c10nc401c241c4', 'jklcoiajpncuqp09uehcnshvv23nvy08y403v58y01924n0cnnn21nn12uhcbobcqbcscs13y982c4b92837c498c49b1cbc12c23', 1, '2021-03-11 03:31:20'),
(10, 1, '837c9n27c928375n2357825323532', 'c2n3ic2nociuweribvywyc92347byc978234b98723vb48723v9239v293vb4832bc8273982bsh973h987234598h23947563452345', 1, '2021-03-11 03:31:20'),
(18, 7, 'af9edb00fdefa206', 'fAg44q22Rjev7iL4Idmikx:APA91bGjdpuqrC22ouz3uaR86JwQp5XtkUTkdHR4er-qwGcRGosaYKoCQHofod45VUGoKI9mhOybOxR_BBcHhU615PzhGqgGeQB6tOcgxf84Kc0z87MIEseXx18C68EdgHw04gR38iZ1', 0, '2021-03-16 14:27:44');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users_token`
--
ALTER TABLE `users_token`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `firebase_token` (`firebase_token`,`device_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `users_token`
--
ALTER TABLE `users_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
