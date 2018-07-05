-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 05 Jul 2018 pada 09.00
-- Versi Server: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `loket_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `events`
--

CREATE TABLE `events` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_location` int(11) NOT NULL,
  `date_start` date NOT NULL,
  `date_close` date NOT NULL,
  `time_start` time NOT NULL,
  `time_close` time NOT NULL,
  `url_image` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `events`
--

INSERT INTO `events` (`id`, `name`, `description`, `id_location`, `date_start`, `date_close`, `time_start`, `time_close`, `url_image`, `created_at`, `updated_at`) VALUES
(1, 'Universitas Indonesia Job Fair', 'Job Fair in UI Tahun 2018', 2, '2018-07-05', '2018-07-30', '08:00:00', '20:00:00', 'images/icon.png', '2018-07-04 06:36:08', '2018-07-04 06:36:08'),
(2, 'Universitas Indonesia Job Fair 2018', 'Job Fair in UI Tahun 2018', 2, '2018-07-05', '2018-07-30', '08:00:00', '20:00:00', 'images/icon.png', '2018-07-04 06:36:34', '2018-07-04 06:36:34'),
(3, 'EVent Twi', 'This event is for you', 1, '2018-07-15', '2018-07-16', '08:00:00', '09:00:00', 'images/logo2.png', '2018-07-04 18:50:49', '2018-07-04 18:50:49'),
(4, 'EVent Twi 2', 'This event is for you', 1, '2018-07-16', '2018-07-16', '08:00:00', '09:00:00', 'images/logo2.png', '2018-07-04 19:22:47', '2018-07-04 19:22:47'),
(5, 'This is Fresh Event', 'This event is for you', 1, '2018-07-16', '2018-07-17', '08:00:00', '09:00:00', 'images/logo2.png', '2018-07-04 19:24:40', '2018-07-04 19:24:40'),
(6, 'New Event', 'This event is for you', 1, '2018-07-16', '2018-07-17', '08:00:00', '09:00:00', 'images/logo2.png', '2018-07-04 23:49:44', '2018-07-04 23:49:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `locations`
--

CREATE TABLE `locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `location` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` decimal(10,6) NOT NULL,
  `longitude` decimal(10,6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `locations`
--

INSERT INTO `locations` (`id`, `location`, `city`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(1, 'CIMB Niaga KCP Depok - FE Universitas Indonesia', 'Depok', '0.000000', '0.000000', NULL, NULL),
(2, 'CIMB Niaga KCP Depok - FE Universitas Indonesia', 'Depok', '41.000000', '2.000000', '2018-07-04 05:39:48', '2018-07-04 05:39:48'),
(3, 'Universitas Indonesia', 'Depok', '41.403380', '2.174030', '2018-07-04 05:46:27', '2018-07-04 05:46:27'),
(4, 'Universitas Indonesia', 'Depok', '42.121211', '2.001020', '2018-07-04 06:11:11', '2018-07-04 06:11:11'),
(5, 'Gumiwang', 'Wonogiri', '41.123112', '2.097612', '2018-07-04 19:27:41', '2018-07-04 19:27:41'),
(6, 'Gumiwang', 'Wonogiri', '41.123112', '2.097612', '2018-07-04 23:50:21', '2018-07-04 23:50:21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_07_04_091549_create_locations_table', 1),
(4, '2018_07_04_091619_create_events_table', 1),
(5, '2018_07_04_091636_create_tickets_table', 1),
(6, '2018_07_04_091654_create_transactions_table', 1),
(7, '2018_07_04_091709_create_transaction_tickets_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tickets`
--

CREATE TABLE `tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_event` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tickets`
--

INSERT INTO `tickets` (`id`, `id_event`, `name`, `detail`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 'Tiket Gold', 'Anda akan mendapatkan full feature', 0, 3500.00, '2018-07-04 06:47:59', '2018-07-04 23:37:58'),
(2, 1, 'Premium Ticket', 'Premium Ticket', 15, 2000.00, '2018-07-04 23:52:14', '2018-07-04 23:52:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_event` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `transactions`
--

INSERT INTO `transactions` (`id`, `id_user`, `id_event`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2018-07-04 18:29:17', '2018-07-04 18:29:17'),
(2, 1, 1, '2018-07-04 18:30:02', '2018-07-04 18:30:02'),
(3, 1, 1, '2018-07-04 23:37:58', '2018-07-04 23:37:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction_tickets`
--

CREATE TABLE `transaction_tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_transaction` int(11) NOT NULL,
  `id_ticket` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `transaction_tickets`
--

INSERT INTO `transaction_tickets` (`id`, `id_transaction`, `id_ticket`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 5, '2018-07-04 18:30:03', '2018-07-04 18:30:03'),
(2, 2, 1, 5, '2018-07-04 18:30:03', '2018-07-04 18:30:03'),
(3, 3, 1, 5, '2018-07-04 23:37:58', '2018-07-04 23:37:58'),
(4, 3, 1, 5, '2018-07-04 23:37:58', '2018-07-04 23:37:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Alexander Pierce', 'Alexander@Pierce.com', '$2y$10$EFaU99NqxxPtjpslVjA70OHH2v58RrXSi7CnwGQRmjq.co5GgJa8G', NULL, '2018-07-04 17:05:17', '2018-07-04 17:05:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_tickets`
--
ALTER TABLE `transaction_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transaction_tickets`
--
ALTER TABLE `transaction_tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
