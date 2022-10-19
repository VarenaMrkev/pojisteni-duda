-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Stř 19. říj 2022, 17:14
-- Verze serveru: 10.4.24-MariaDB
-- Verze PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `pojisteni`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `adresa`
--

CREATE TABLE `adresa` (
  `adresa_id` int(11) NOT NULL,
  `ulice` varchar(60) COLLATE utf8mb4_czech_ci NOT NULL,
  `cislo_popisne` varchar(60) COLLATE utf8mb4_czech_ci NOT NULL,
  `mesto` varchar(60) COLLATE utf8mb4_czech_ci NOT NULL,
  `PSC` varchar(60) COLLATE utf8mb4_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `adresa`
--

INSERT INTO `adresa` (`adresa_id`, `ulice`, `cislo_popisne`, `mesto`, `PSC`) VALUES
(1, 'Seifrtova', '479', 'Praha', '11000'),
(2, 'Barikádníků', '879', 'Brno', '60100'),
(3, 'Barikádníků', '678', 'Ostrava', '70100'),
(4, 'Dobrovolníků', '227', 'Ostrava', '70100'),
(5, 'Dobrovolníků', '322', 'Brno', '60100'),
(6, 'Hlavní', '366', 'Praha', '11000'),
(7, 'Seifrtova', '267', 'Ostrava', '70100'),
(8, 'Prokešova', '149', 'Ostrava', '70100'),
(9, 'Seifrtova', '558', 'Brno', '60100'),
(10, 'Seifrtova', '712', 'Praha', '11000'),
(11, 'Dobrovolníků', '781', 'Ostrava', '70100'),
(12, 'Hlavní', '521', 'Ostrava', '70100'),
(13, 'Prokešova', '637', 'Ostrava', '70100'),
(14, 'Prokešova', '214', 'Brno', '60100'),
(15, 'Seifrtova', '886', 'Praha', '11000'),
(16, 'Prokešova', '951', 'Praha', '11000'),
(17, 'Barikádníků', '693', 'Brno', '60100'),
(18, 'Hlavní', '535', 'Ostrava', '70100'),
(19, 'Hlavní', '144', 'Praha', '11000'),
(20, 'Hlavní', '267', 'Ostrava', '70100');

-- --------------------------------------------------------

--
-- Struktura tabulky `klient`
--

CREATE TABLE `klient` (
  `klient_id` int(11) NOT NULL,
  `jmeno` varchar(60) COLLATE utf8mb4_czech_ci NOT NULL,
  `prijmeni` varchar(60) COLLATE utf8mb4_czech_ci NOT NULL,
  `adresa` int(11) NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_czech_ci NOT NULL,
  `telefon` varchar(60) COLLATE utf8mb4_czech_ci NOT NULL,
  `uzivatel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `klient`
--

INSERT INTO `klient` (`klient_id`, `jmeno`, `prijmeni`, `adresa`, `email`, `telefon`, `uzivatel`) VALUES
(2, 'Josef', 'Mládek', 6, 'Mládek_Josef@centrum.cz', '+420915 810 720', 5),
(3, 'Karel', 'Mašek', 6, 'Mašek_Karel@centrum.cz', '+420733 708 908', 5),
(4, 'Adolf', 'Hajný', 11, 'Hajný_Adolf@centrum.cz', '+420786 767 998', 4),
(5, 'Adolf', 'Mrázek', 9, 'Mrázek_Adolf@gmail.com', '+420955 807 773', 5),
(6, 'Adam', 'Pech', 8, 'Pech_Adam@gmail.com', '+420903 864 932', 4),
(7, 'Lukáš', 'Mašek', 16, 'Mašek_Lukáš@gmail.com', '+420776 735 918', 6),
(8, 'Jaroslav', 'Holý', 3, 'Holý_Jaroslav@seznam.cz', '+420805 775 776', 4),
(9, 'František', 'Novák', 15, 'Novák_František@centrum.cz', '+420780 711 912', 6),
(10, 'Josef', 'Pech', 12, 'Pech_Josef@centrum.cz', '+420777 854 792', 4),
(11, 'Petr', 'Mrázek', 7, 'Mrázek_Petr@seznam.cz', '+420789 724 968', 5),
(12, 'Adam', 'Svatý', 8, 'Svatý_Adam@centrum.cz', '+420761 889 805', 5),
(13, 'Jiří', 'Mrázek', 20, 'Mrázek_Jiří@centrum.cz', '+420992 982 809', 4),
(14, 'Josef', 'Mrázek', 10, 'Mrázek_Josef@centrum.cz', '+420851 908 966', 6),
(15, 'Lukáš', 'Holý', 1, 'Holý_Lukáš@centrum.cz', '+420979 883 947', 3),
(16, 'Josef', 'Pech', 14, 'Pech_Josef@centrum.cz', '+420704 717 966', 5),
(17, 'František', 'Hajný', 20, 'Hajný_František@seznam.cz', '+420810 775 834', 4),
(18, 'Martin', 'Mašek', 1, 'Mašek_Martin@gmail.com', '+420783 741 787', 2),
(19, 'Josef', 'Pech', 5, 'Pech_Josef@gmail.com', '+420832 969 937', 5),
(20, 'Jan', 'Novák', 6, 'Novák_Jan@centrum.cz', '+420846 943 930', 2),
(21, 'František', 'Mrázek', 14, 'Mrázek_František@seznam.cz', '+420967 793 716', 6),
(22, 'Lukáš', 'Mrázek', 11, 'Mrázek_Lukáš@gmail.com', '+420819 846 846', 4),
(23, 'Josef', 'Svěrák', 6, 'Svěrák_Josef@seznam.cz', '+420958 735 711', 2),
(24, 'Jaroslav', 'Mašek', 6, 'Mašek_Jaroslav@gmail.com', '+420944 718 725', 2),
(25, 'Josef', 'Mrázek', 6, 'Mrázek_Josef@centrum.cz', '+420982 806 901', 5),
(26, 'Jaroslav', 'Mrázek', 2, 'Mrázek_Jaroslav@seznam.cz', '+420736 925 711', 4),
(27, 'Petr', 'Mládek', 10, 'Mládek_Petr@seznam.cz', '+420964 719 728', 4),
(28, 'Jaroslav', 'Hajný', 1, 'Hajný_Jaroslav@gmail.com', '+420963 819 896', 2),
(29, 'František', 'Mládek', 1, 'Mládek_František@gmail.com', '+420796 975 999', 5),
(30, 'Josef', 'Hajný', 16, 'Hajný_Josef@centrum.cz', '+420705 998 735', 4),
(31, 'Josef', 'Mrázek', 9, 'Mrázek_Josef@gmail.com', '+420812 800 962', 5),
(32, 'Josef', 'Holý', 8, 'Holý_Josef@gmail.com', '+420774 895 830', 5),
(33, 'Jaroslav', 'Hajný', 14, 'Hajný_Jaroslav@gmail.com', '+420925 782 767', 4),
(34, 'Adam', 'Mrázek', 14, 'Mrázek_Adam@gmail.com', '+420945 970 796', 2),
(35, 'Lukáš', 'Pech', 8, 'Pech_Lukáš@gmail.com', '+420858 870 739', 5),
(36, 'František', 'Pech', 11, 'Pech_František@seznam.cz', '+420901 908 856', 3),
(37, 'Josef', 'Holý', 14, 'Holý_Josef@centrum.cz', '+420804 731 899', 5),
(38, 'Martin', 'Mládek', 19, 'Mládek_Martin@centrum.cz', '+420762 964 940', 6),
(39, 'Adolf', 'Mládek', 6, 'Mládek_Adolf@seznam.cz', '+420749 737 873', 6),
(40, 'Jan', 'Hajný', 13, 'Hajný_Jan@gmail.com', '+420761 893 847', 6),
(41, 'Martin', 'Svatý', 20, 'Svatý_Martin@centrum.cz', '+420849 945 777', 3),
(42, 'Adam', 'Novák', 10, 'Novák_Adam@seznam.cz', '+420725 703 862', 3),
(43, 'Adam', 'Mašek', 15, 'Mašek_Adam@seznam.cz', '+420868 744 834', 3),
(44, 'Karel', 'Pech', 5, 'Pech_Karel@seznam.cz', '+420994 972 804', 5),
(45, 'Martin', 'Mládek', 5, 'Mládek_Martin@seznam.cz', '+420908 738 764', 2),
(46, 'Petr', 'Pech', 7, 'Pech_Petr@gmail.com', '+420990 818 937', 3),
(47, 'František', 'Hajný', 17, 'Hajný_František@gmail.com', '+420924 962 896', 4),
(48, 'František', 'Svatý', 3, 'Svatý_František@gmail.com', '+420968 987 855', 2),
(49, 'Martin', 'Mašek', 19, 'Mašek_Martin@centrum.cz', '+420860 751 882', 2),
(50, 'Jan', 'Mašek', 3, 'Mašek_Jan@gmail.com', '+420725 798 880', 3),
(51, 'Jan', 'Pech', 7, 'Pech_Jan@gmail.com', '+420946 777 971', 5),
(52, 'Karel', 'Mrázek', 6, 'Mrázek_Karel@centrum.cz', '+420733 703 923', 2),
(53, 'Jaroslav', 'Novák', 9, 'Novák_Jaroslav@seznam.cz', '+420770 852 790', 5),
(54, 'Karel', 'Mašek', 11, 'Mašek_Karel@centrum.cz', '+420910 708 753', 2),
(55, 'Jan', 'Holý', 11, 'Holý_Jan@seznam.cz', '+420936 871 804', 5),
(56, 'Adam', 'Pech', 20, 'Pech_Adam@centrum.cz', '+420701 703 781', 2),
(57, 'František', 'Mašek', 5, 'Mašek_František@seznam.cz', '+420987 944 886', 5),
(58, 'Martin', 'Novák', 6, 'Novák_Martin@seznam.cz', '+420843 767 763', 2),
(59, 'Martin', 'Mrázek', 2, 'Mrázek_Martin@gmail.com', '+420819 987 782', 3),
(60, 'Jaroslav', 'Svěrák', 2, 'Svěrák_Jaroslav@seznam.cz', '+420877 972 890', 6),
(61, 'Jiří', 'Svatý', 15, 'Svatý_Jiří@centrum.cz', '+420751 764 985', 5),
(62, 'Josef', 'Hajný', 2, 'Hajný_Josef@gmail.com', '+420857 952 902', 2),
(63, 'František', 'Svěrák', 8, 'Svěrák_František@centrum.cz', '+420832 793 901', 4),
(64, 'Lukáš', 'Mašek', 6, 'Mašek_Lukáš@seznam.cz', '+420745 741 757', 6),
(65, 'Lukáš', 'Svěrák', 11, 'Svěrák_Lukáš@centrum.cz', '+420713 715 874', 3),
(66, 'Jaroslav', 'Svěrák', 5, 'Svěrák_Jaroslav@seznam.cz', '+420784 914 801', 3),
(67, 'Josef', 'Holý', 7, 'Holý_Josef@gmail.com', '+420892 821 893', 2),
(68, 'Petr', 'Mrázek', 4, 'Mrázek_Petr@seznam.cz', '+420747 703 829', 3),
(69, 'Josef', 'Pech', 5, 'Pech_Josef@gmail.com', '+420936 996 987', 6),
(70, 'Petr', 'Novák', 2, 'Novák_Petr@centrum.cz', '+420838 733 930', 4),
(71, 'František', 'Svěrák', 9, 'Svěrák_František@gmail.com', '+420700 897 831', 5),
(72, 'Lukáš', 'Hajný', 20, 'Hajný_Lukáš@seznam.cz', '+420975 786 787', 6),
(73, 'Adam', 'Svěrák', 1, 'Svěrák_Adam@centrum.cz', '+420903 753 738', 3),
(74, 'Adam', 'Novák', 2, 'Novák_Adam@gmail.com', '+420973 873 946', 3),
(75, 'Josef', 'Mrázek', 12, 'Mrázek_Josef@centrum.cz', '+420789 747 815', 4),
(76, 'Karel', 'Mrázek', 8, 'Mrázek_Karel@centrum.cz', '+420772 970 822', 3),
(77, 'Karel', 'Svatý', 3, 'Svatý_Karel@gmail.com', '+420968 762 751', 3),
(78, 'Josef', 'Svatý', 5, 'Svatý_Josef@centrum.cz', '+420935 877 811', 3),
(79, 'Jiří', 'Hajný', 5, 'Hajný_Jiří@seznam.cz', '+420867 993 975', 4),
(80, 'Adam', 'Mládek', 14, 'Mládek_Adam@gmail.com', '+420954 825 887', 5),
(81, 'Adolf', 'Mládek', 15, 'Mládek_Adolf@seznam.cz', '+420982 985 817', 2),
(82, 'Martin', 'Hajný', 3, 'Hajný_Martin@gmail.com', '+420751 846 758', 3),
(83, 'Lukáš', 'Pech', 4, 'Pech_Lukáš@seznam.cz', '+420933 726 830', 4),
(84, 'Lukáš', 'Mrázek', 7, 'Mrázek_Lukáš@centrum.cz', '+420726 996 708', 6),
(85, 'Martin', 'Svatý', 12, 'Svatý_Martin@seznam.cz', '+420828 765 957', 5),
(86, 'Martin', 'Svatý', 7, 'Svatý_Martin@seznam.cz', '+420853 735 928', 4),
(87, 'Petr', 'Pech', 8, 'Pech_Petr@centrum.cz', '+420764 916 993', 6),
(88, 'Josef', 'Mládek', 11, 'Mládek_Josef@gmail.com', '+420759 858 805', 6),
(89, 'Jaroslav', 'Svatý', 10, 'Svatý_Jaroslav@seznam.cz', '+420740 705 774', 2),
(90, 'Jaroslav', 'Mrázek', 6, 'Mrázek_Jaroslav@centrum.cz', '+420951 950 884', 6),
(91, 'Lukáš', 'Mládek', 16, 'Mládek_Lukáš@centrum.cz', '+420844 882 940', 5),
(92, 'Jiří', 'Svěrák', 13, 'Svěrák_Jiří@centrum.cz', '+420930 777 850', 4),
(93, 'Jan', 'Svatý', 4, 'Svatý_Jan@seznam.cz', '+420800 991 946', 2),
(94, 'Petr', 'Holý', 5, 'Holý_Petr@seznam.cz', '+420722 908 811', 5),
(95, 'Josef', 'Mašek', 3, 'Mašek_Josef@seznam.cz', '+420938 993 902', 2),
(96, 'Jan', 'Svatý', 1, 'Svatý_Jan@gmail.com', '+420756 892 760', 6),
(97, 'Josef', 'Mládek', 10, 'Mládek_Josef@centrum.cz', '+420922 996 955', 6),
(98, 'Adolf', 'Hajný', 5, 'Hajný_Adolf@gmail.com', '+420705 800 993', 4),
(99, 'Martin', 'Pech', 18, 'Pech_Martin@gmail.com', '+420998 902 894', 6),
(100, 'Jaroslav', 'Mládek', 11, 'Mládek_Jaroslav@seznam.cz', '+420919 806 876', 4),
(101, 'Petr', 'Svěrák', 20, 'Svěrák_Petr@centrum.cz', '+420744 950 886', 2);

-- --------------------------------------------------------

--
-- Struktura tabulky `pojisteni`
--

CREATE TABLE `pojisteni` (
  `pojisteni_id` int(11) NOT NULL,
  `typ` varchar(60) COLLATE utf8mb4_czech_ci NOT NULL,
  `pojistenec` int(11) NOT NULL,
  `pojistne` varchar(60) COLLATE utf8mb4_czech_ci NOT NULL,
  `vznik` varchar(60) COLLATE utf8mb4_czech_ci NOT NULL,
  `platnost` varchar(60) COLLATE utf8mb4_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `pojisteni`
--

INSERT INTO `pojisteni` (`pojisteni_id`, `typ`, `pojistenec`, `pojistne`, `vznik`, `platnost`) VALUES
(2, 'Havarijní pojištění', 20, '9046', '2022-12-10', '2029-11-26'),
(3, 'Životní pojištění', 8, '5224', '2022-5-18', '2026-12-22'),
(4, 'Havarijní pojištění', 32, '1365', '2022-2-14', '2024-4-27'),
(5, 'Pojištění domácnosti', 39, '2914', '2022-9-11', '2029-11-26'),
(6, 'Životní pojištění', 21, '8770', '2022-5-9', '2029-12-7'),
(7, 'Pojištění domácnosti', 61, '3397', '2022-11-21', '2027-11-25'),
(8, 'Pojištění odpovědnosti za škody', 34, '8940', '2022-4-12', '2030-9-28'),
(9, 'Životní pojištění', 84, '7214', '2022-5-13', '2025-12-17'),
(10, 'Životní pojištění', 55, '7633', '2022-7-5', '2024-1-2'),
(11, 'Životní pojištění', 28, '1831', '2022-10-27', '2026-12-27'),
(12, 'Havarijní pojištění', 43, '3731', '2022-7-18', '2029-2-15'),
(13, 'Pojištění odpovědnosti za škody', 69, '5347', '2022-5-27', '2024-10-22'),
(14, 'Pojištění domácnosti', 74, '2210', '2022-11-13', '2027-3-16'),
(15, 'Havarijní pojištění', 44, '7934', '2022-9-2', '2025-6-15'),
(16, 'Pojištění domácnosti', 74, '9304', '2022-8-1', '2027-2-21'),
(17, 'Životní pojištění', 69, '1714', '2022-10-19', '2028-8-8'),
(18, 'Pojištění domácnosti', 69, '1784', '2022-5-15', '2026-1-21'),
(19, 'Havarijní pojištění', 96, '7886', '2022-9-19', '2027-8-21'),
(20, 'Životní pojištění', 50, '7751', '2022-2-11', '2030-3-25'),
(21, 'Životní pojištění', 26, '1931', '2022-8-9', '2028-8-21'),
(22, 'Pojištění odpovědnosti za škody', 24, '8377', '2022-7-18', '2028-2-23'),
(23, 'Pojištění domácnosti', 9, '1000', '2022-8-22', '2024-6-20'),
(24, 'Pojištění domácnosti', 34, '3024', '2022-12-21', '2025-10-18'),
(25, 'Životní pojištění', 39, '4577', '2022-10-14', '2026-1-5'),
(26, 'Pojištění odpovědnosti za škody', 7, '9166', '2022-9-13', '2028-12-3'),
(27, 'Havarijní pojištění', 67, '2756', '2022-1-24', '2029-7-19'),
(28, 'Životní pojištění', 21, '8923', '2022-1-3', '2025-1-22'),
(29, 'Životní pojištění', 70, '1081', '2022-11-19', '2027-4-28'),
(30, 'Životní pojištění', 39, '6837', '2022-8-12', '2025-4-8'),
(31, 'Pojištění domácnosti', 3, '8841', '2022-3-17', '2030-8-25'),
(32, 'Životní pojištění', 79, '8207', '2022-2-7', '2027-3-24'),
(33, 'Pojištění odpovědnosti za škody', 47, '9351', '2022-2-6', '2024-10-17'),
(34, 'Havarijní pojištění', 2, '8665', '2022-6-3', '2027-5-14'),
(35, 'Havarijní pojištění', 76, '6393', '2022-1-25', '2030-8-4'),
(36, 'Životní pojištění', 97, '9247', '2022-8-15', '2030-9-4'),
(37, 'Životní pojištění', 67, '9486', '2022-2-27', '2030-6-24'),
(38, 'Pojištění odpovědnosti za škody', 19, '5413', '2022-6-10', '2028-8-6'),
(39, 'Pojištění domácnosti', 41, '9940', '2022-2-6', '2028-5-4'),
(40, 'Životní pojištění', 47, '2955', '2022-1-19', '2026-11-4'),
(41, 'Pojištění domácnosti', 16, '2570', '2022-3-17', '2026-1-19'),
(42, 'Havarijní pojištění', 13, '7628', '2022-3-1', '2030-8-13'),
(43, 'Havarijní pojištění', 44, '6194', '2022-12-4', '2029-11-10'),
(44, 'Životní pojištění', 64, '7464', '2022-12-28', '2026-9-27'),
(45, 'Pojištění odpovědnosti za škody', 55, '4072', '2022-7-3', '2024-8-27'),
(46, 'Pojištění odpovědnosti za škody', 12, '8853', '2022-9-14', '2028-12-3'),
(47, 'Havarijní pojištění', 94, '8156', '2022-6-8', '2030-8-7'),
(48, 'Pojištění domácnosti', 54, '6122', '2022-12-19', '2025-2-11'),
(49, 'Pojištění domácnosti', 93, '6384', '2022-3-28', '2026-3-15'),
(50, 'Pojištění domácnosti', 83, '1449', '2022-1-26', '2026-7-5'),
(51, 'Pojištění domácnosti', 47, '7465', '2022-2-1', '2029-10-2'),
(52, 'Havarijní pojištění', 12, '9172', '2022-11-19', '2026-4-7'),
(53, 'Pojištění domácnosti', 39, '5048', '2022-7-25', '2027-4-13'),
(54, 'Pojištění odpovědnosti za škody', 63, '2600', '2022-9-22', '2030-5-11'),
(55, 'Pojištění domácnosti', 71, '5458', '2022-9-23', '2027-3-18'),
(56, 'Pojištění odpovědnosti za škody', 5, '8102', '2022-5-11', '2029-7-6'),
(57, 'Pojištění domácnosti', 85, '4511', '2022-2-11', '2026-8-4'),
(58, 'Havarijní pojištění', 73, '8149', '2022-12-8', '2025-2-20'),
(59, 'Pojištění odpovědnosti za škody', 54, '4479', '2022-12-6', '2024-1-23'),
(61, 'Životní pojištění', 47, '8360', '2022-9-19', '2024-11-18'),
(62, 'Pojištění domácnosti', 61, '6941', '2022-6-18', '2030-3-4'),
(63, 'Pojištění domácnosti', 11, '3566', '2022-11-27', '2029-10-16'),
(64, 'Havarijní pojištění', 14, '3413', '2022-2-28', '2028-5-1'),
(65, 'Havarijní pojištění', 82, '5228', '2022-11-17', '2026-9-8'),
(66, 'Pojištění domácnosti', 75, '8947', '2022-4-20', '2024-4-27'),
(67, 'Havarijní pojištění', 58, '1014', '2022-8-28', '2028-5-5'),
(68, 'Havarijní pojištění', 87, '5244', '2022-7-11', '2030-6-12'),
(69, 'Životní pojištění', 72, '9148', '2022-8-7', '2030-3-27'),
(70, 'Životní pojištění', 64, '5425', '2022-2-23', '2028-8-27'),
(71, 'Havarijní pojištění', 62, '7987', '2022-3-22', '2026-1-21'),
(72, 'Životní pojištění', 75, '1867', '2022-12-25', '2024-7-17'),
(73, 'Havarijní pojištění', 34, '6721', '2022-10-9', '2025-11-15'),
(74, 'Havarijní pojištění', 7, '3642', '2022-4-12', '2026-6-14'),
(75, 'Havarijní pojištění', 92, '8692', '2022-3-24', '2026-6-21'),
(76, 'Havarijní pojištění', 51, '8933', '2022-7-19', '2029-1-13'),
(77, 'Životní pojištění', 57, '5847', '2022-12-20', '2025-7-11'),
(78, 'Havarijní pojištění', 30, '6457', '2022-9-19', '2030-4-26'),
(79, 'Životní pojištění', 42, '6458', '2022-7-6', '2024-10-23'),
(80, 'Pojištění odpovědnosti za škody', 44, '8619', '2022-12-26', '2026-9-14'),
(81, 'Havarijní pojištění', 57, '7561', '2022-12-25', '2030-3-9'),
(82, 'Pojištění odpovědnosti za škody', 43, '2338', '2022-1-17', '2028-3-15'),
(83, 'Pojištění odpovědnosti za škody', 89, '6205', '2022-2-14', '2029-7-1'),
(84, 'Pojištění domácnosti', 60, '5448', '2022-4-8', '2025-12-26'),
(85, 'Pojištění domácnosti', 45, '6754', '2022-8-24', '2025-9-5'),
(86, 'Životní pojištění', 95, '7219', '2022-4-21', '2024-7-10'),
(87, 'Pojištění domácnosti', 71, '9325', '2022-12-25', '2028-8-12'),
(88, 'Pojištění domácnosti', 34, '8884', '2022-3-6', '2024-5-26'),
(89, 'Pojištění domácnosti', 38, '1878', '2022-4-27', '2029-10-2'),
(90, 'Pojištění odpovědnosti za škody', 43, '8952', '2022-2-3', '2024-6-5'),
(91, 'Životní pojištění', 10, '9684', '2022-6-7', '2025-2-28'),
(92, 'Životní pojištění', 18, '4828', '2022-1-11', '2027-5-24'),
(93, 'Životní pojištění', 33, '5303', '2022-7-22', '2024-10-15'),
(94, 'Pojištění odpovědnosti za škody', 93, '8031', '2022-8-1', '2026-7-14'),
(95, 'Pojištění domácnosti', 22, '4797', '2022-11-3', '2029-12-7'),
(96, 'Havarijní pojištění', 11, '2167', '2022-12-26', '2030-8-25'),
(97, 'Havarijní pojištění', 47, '9586', '2022-12-1', '2029-12-5'),
(98, 'Životní pojištění', 94, '9892', '2022-11-11', '2024-8-23'),
(99, 'Životní pojištění', 98, '1196', '2022-2-19', '2029-12-25'),
(100, 'Životní pojištění', 90, '4652', '2022-9-23', '2029-11-22'),
(101, 'Pojištění domácnosti', 59, '7107', '2022-3-5', '2024-8-9'),
(102, 'Pojištění odpovědnosti za škody', 86, '8942', '2022-1-14', '2028-3-24'),
(103, 'Havarijní pojištění', 49, '5371', '2022-2-10', '2030-7-6'),
(104, 'Pojištění domácnosti', 56, '6307', '2022-9-11', '2029-4-19'),
(105, 'Životní pojištění', 49, '7275', '2022-10-25', '2029-1-27'),
(106, 'Havarijní pojištění', 14, '7153', '2022-4-16', '2025-4-1'),
(107, 'Pojištění odpovědnosti za škody', 6, '7035', '2022-11-24', '2026-4-12'),
(108, 'Pojištění odpovědnosti za škody', 52, '5002', '2022-10-25', '2027-1-4'),
(109, 'Havarijní pojištění', 92, '1000', '2022-7-25', '2024-3-18'),
(110, 'Pojištění domácnosti', 56, '1370', '2022-2-19', '2025-5-21'),
(111, 'Životní pojištění', 38, '5360', '2022-5-26', '2029-1-26'),
(112, 'Pojištění domácnosti', 78, '6169', '2022-2-25', '2029-10-24'),
(113, 'Pojištění odpovědnosti za škody', 72, '3797', '2022-10-4', '2028-4-20'),
(114, 'Pojištění domácnosti', 83, '2319', '2022-10-4', '2026-5-6'),
(115, 'Životní pojištění', 5, '5150', '2022-3-17', '2024-12-1'),
(116, 'Pojištění odpovědnosti za škody', 43, '3385', '2022-1-14', '2025-1-6'),
(117, 'Pojištění odpovědnosti za škody', 56, '5888', '2022-10-23', '2026-12-9'),
(118, 'Pojištění domácnosti', 68, '8728', '2022-2-7', '2025-4-25'),
(119, 'Havarijní pojištění', 36, '2249', '2022-3-26', '2025-12-15'),
(120, 'Životní pojištění', 38, '4042', '2022-11-3', '2030-2-18'),
(121, 'Životní pojištění', 65, '3523', '2022-12-25', '2025-5-22'),
(122, 'Životní pojištění', 26, '5296', '2022-2-22', '2026-11-27'),
(123, 'Pojištění odpovědnosti za škody', 31, '5202', '2022-3-21', '2025-9-4'),
(124, 'Pojištění odpovědnosti za škody', 67, '4853', '2022-8-4', '2029-10-28'),
(125, 'Životní pojištění', 73, '2335', '2022-12-8', '2025-10-25'),
(126, 'Životní pojištění', 2, '1096', '2022-10-19', '2026-2-19'),
(127, 'Pojištění odpovědnosti za škody', 77, '5923', '2022-6-21', '2024-1-24'),
(128, 'Pojištění domácnosti', 71, '5170', '2022-4-16', '2027-4-7'),
(129, 'Životní pojištění', 50, '2802', '2022-5-9', '2025-11-6'),
(130, 'Životní pojištění', 100, '6491', '2022-3-15', '2025-8-15'),
(131, 'Havarijní pojištění', 52, '4905', '2022-12-25', '2029-7-24'),
(132, 'Havarijní pojištění', 40, '1779', '2022-6-21', '2028-9-26'),
(133, 'Pojištění odpovědnosti za škody', 4, '6123', '2022-2-20', '2029-10-2'),
(134, 'Pojištění domácnosti', 77, '6501', '2022-5-20', '2028-10-26'),
(135, 'Pojištění domácnosti', 77, '8438', '2022-8-22', '2025-9-6'),
(136, 'Pojištění odpovědnosti za škody', 94, '7164', '2022-4-22', '2027-10-17'),
(137, 'Havarijní pojištění', 60, '8375', '2022-4-9', '2030-2-3'),
(138, 'Havarijní pojištění', 34, '4992', '2022-12-5', '2024-12-26'),
(139, 'Pojištění odpovědnosti za škody', 97, '5328', '2022-4-13', '2027-1-18'),
(140, 'Životní pojištění', 82, '1825', '2022-3-23', '2024-8-8'),
(141, 'Pojištění domácnosti', 64, '9184', '2022-11-7', '2026-8-18'),
(142, 'Pojištění domácnosti', 31, '7816', '2022-1-10', '2024-3-25'),
(143, 'Životní pojištění', 86, '8957', '2022-11-14', '2025-11-1'),
(144, 'Životní pojištění', 22, '2109', '2022-8-14', '2027-12-20'),
(145, 'Pojištění domácnosti', 30, '8356', '2022-4-22', '2030-7-18'),
(146, 'Pojištění domácnosti', 86, '7443', '2022-4-17', '2029-3-27'),
(147, 'Životní pojištění', 23, '5531', '2022-4-5', '2030-10-21'),
(148, 'Pojištění odpovědnosti za škody', 45, '5138', '2022-9-14', '2025-5-17'),
(149, 'Pojištění odpovědnosti za škody', 39, '2651', '2022-9-5', '2029-1-21'),
(150, 'Životní pojištění', 27, '7504', '2022-6-9', '2030-8-22'),
(151, 'Životní pojištění', 27, '2099', '2022-11-17', '2025-4-12'),
(152, 'Pojištění odpovědnosti za škody', 56, '9697', '2022-12-5', '2025-8-8'),
(153, 'Havarijní pojištění', 23, '9290', '2022-1-14', '2025-7-27'),
(154, 'Životní pojištění', 73, '2742', '2022-6-12', '2030-4-16'),
(155, 'Životní pojištění', 87, '6060', '2022-3-21', '2025-10-9'),
(156, 'Pojištění odpovědnosti za škody', 67, '7500', '2022-9-13', '2026-8-11'),
(157, 'Pojištění domácnosti', 26, '3417', '2022-6-15', '2027-9-28'),
(158, 'Pojištění odpovědnosti za škody', 22, '8164', '2022-10-11', '2028-5-13'),
(159, 'Pojištění domácnosti', 57, '4575', '2022-3-20', '2024-2-22'),
(160, 'Pojištění odpovědnosti za škody', 94, '5980', '2022-3-27', '2030-7-25'),
(161, 'Pojištění domácnosti', 10, '9353', '2022-6-20', '2025-4-26'),
(162, 'Pojištění domácnosti', 37, '1679', '2022-1-26', '2029-1-11'),
(163, 'Pojištění odpovědnosti za škody', 8, '4812', '2022-5-14', '2027-7-27'),
(164, 'Pojištění domácnosti', 61, '6314', '2022-12-12', '2026-7-5'),
(165, 'Pojištění domácnosti', 90, '7215', '2022-4-28', '2027-8-1'),
(166, 'Havarijní pojištění', 54, '8705', '2022-3-20', '2024-4-8'),
(167, 'Pojištění odpovědnosti za škody', 18, '8996', '2022-8-14', '2028-4-14'),
(168, 'Pojištění domácnosti', 49, '8319', '2022-4-22', '2025-6-23'),
(169, 'Havarijní pojištění', 56, '9984', '2022-3-18', '2030-8-18'),
(170, 'Životní pojištění', 61, '8499', '2022-1-1', '2029-7-28'),
(171, 'Pojištění domácnosti', 27, '1172', '2022-11-16', '2024-1-20'),
(172, 'Pojištění odpovědnosti za škody', 11, '6655', '2022-3-28', '2030-5-21'),
(173, 'Pojištění odpovědnosti za škody', 48, '3766', '2022-10-25', '2024-4-10'),
(174, 'Pojištění domácnosti', 85, '1636', '2022-7-3', '2030-11-18'),
(175, 'Pojištění domácnosti', 53, '2033', '2022-7-20', '2028-6-12'),
(176, 'Havarijní pojištění', 10, '2320', '2022-6-20', '2026-2-17'),
(177, 'Havarijní pojištění', 75, '2751', '2022-8-28', '2025-9-17'),
(178, 'Pojištění domácnosti', 39, '2909', '2022-6-25', '2030-9-13'),
(179, 'Pojištění domácnosti', 89, '5602', '2022-10-26', '2029-11-21'),
(180, 'Pojištění domácnosti', 98, '9859', '2022-10-19', '2027-10-1'),
(181, 'Pojištění odpovědnosti za škody', 82, '3215', '2022-12-27', '2028-1-28'),
(182, 'Havarijní pojištění', 10, '6451', '2022-11-24', '2027-12-23'),
(183, 'Pojištění odpovědnosti za škody', 11, '2365', '2022-9-11', '2026-2-7'),
(184, 'Pojištění odpovědnosti za škody', 36, '5977', '2022-6-24', '2027-11-3'),
(185, 'Pojištění odpovědnosti za škody', 100, '4445', '2022-10-9', '2024-3-10'),
(186, 'Pojištění odpovědnosti za škody', 21, '7833', '2022-5-3', '2027-6-17'),
(187, 'Pojištění domácnosti', 67, '5432', '2022-6-15', '2026-10-15'),
(188, 'Pojištění odpovědnosti za škody', 35, '8883', '2022-7-27', '2030-7-7'),
(189, 'Havarijní pojištění', 30, '3240', '2022-9-7', '2027-6-18'),
(190, 'Pojištění domácnosti', 53, '1677', '2022-12-17', '2029-8-8'),
(192, 'Havarijní pojištění', 12, '9873', '2022-2-16', '2024-3-25'),
(193, 'Havarijní pojištění', 79, '3880', '2022-1-17', '2028-11-10'),
(194, 'Pojištění odpovědnosti za škody', 59, '9366', '2022-5-18', '2028-12-26'),
(195, 'Havarijní pojištění', 34, '7202', '2022-2-7', '2027-8-15'),
(196, 'Životní pojištění', 99, '6274', '2022-8-12', '2027-12-28'),
(197, 'Pojištění domácnosti', 46, '4926', '2022-10-9', '2025-11-26'),
(198, 'Havarijní pojištění', 98, '5462', '2022-11-22', '2026-4-2'),
(199, 'Havarijní pojištění', 26, '5736', '2022-5-21', '2026-3-20'),
(200, 'Životní pojištění', 40, '3972', '2022-12-26', '2025-6-16'),
(201, 'Havarijní pojištění', 96, '5555', '2022-4-28', '2024-1-3'),
(202, 'Životní pojištění', 6, '9714', '2022-8-1', '2029-10-19'),
(203, 'Pojištění odpovědnosti za škody', 36, '6436', '2022-11-23', '2027-10-25'),
(204, 'Pojištění domácnosti', 60, '4402', '2022-12-2', '2028-12-11'),
(205, 'Pojištění domácnosti', 5, '8232', '2022-4-5', '2027-7-24'),
(206, 'Pojištění odpovědnosti za škody', 39, '1141', '2022-1-10', '2025-2-6'),
(207, 'Pojištění odpovědnosti za škody', 36, '4470', '2022-4-6', '2027-8-22'),
(208, 'Havarijní pojištění', 50, '2947', '2022-8-24', '2026-11-15'),
(209, 'Pojištění domácnosti', 89, '2657', '2022-5-15', '2028-10-14'),
(210, 'Životní pojištění', 34, '3357', '2022-3-10', '2028-6-20'),
(211, 'Životní pojištění', 89, '6265', '2022-6-21', '2030-4-6'),
(212, 'Havarijní pojištění', 56, '2801', '2022-2-14', '2024-7-8'),
(213, 'Pojištění odpovědnosti za škody', 88, '8484', '2022-10-18', '2029-4-22'),
(214, 'Pojištění odpovědnosti za škody', 3, '5307', '2022-11-11', '2024-2-2'),
(215, 'Životní pojištění', 73, '2990', '2022-12-10', '2030-7-15'),
(216, 'Havarijní pojištění', 100, '9716', '2022-2-13', '2025-1-4'),
(217, 'Životní pojištění', 89, '7180', '2022-7-23', '2026-12-14'),
(218, 'Pojištění odpovědnosti za škody', 21, '7281', '2022-10-6', '2028-8-6'),
(219, 'Pojištění odpovědnosti za škody', 20, '7112', '2022-7-5', '2029-3-23'),
(220, 'Pojištění domácnosti', 64, '1788', '2022-9-20', '2028-1-27'),
(221, 'Pojištění domácnosti', 36, '1833', '2022-7-3', '2024-12-16'),
(222, 'Pojištění domácnosti', 50, '3159', '2022-9-4', '2024-9-8'),
(223, 'Pojištění domácnosti', 82, '6131', '2022-5-5', '2025-1-18'),
(224, 'Havarijní pojištění', 71, '7513', '2022-2-14', '2025-7-14'),
(226, 'Pojištění domácnosti', 15, '6039', '2022-2-15', '2026-12-3'),
(227, 'Životní pojištění', 41, '8545', '2022-7-24', '2026-7-3'),
(228, 'Životní pojištění', 49, '6275', '2022-11-11', '2028-2-26'),
(229, 'Životní pojištění', 77, '4508', '2022-1-9', '2027-8-24'),
(230, 'Pojištění odpovědnosti za škody', 13, '3847', '2022-1-22', '2027-8-22'),
(231, 'Havarijní pojištění', 38, '5423', '2022-8-2', '2024-11-15'),
(232, 'Pojištění domácnosti', 8, '7328', '2022-3-23', '2027-11-7'),
(233, 'Pojištění odpovědnosti za škody', 22, '1043', '2022-5-20', '2030-8-12'),
(234, 'Životní pojištění', 34, '1734', '2022-12-9', '2028-3-6'),
(235, 'Pojištění odpovědnosti za škody', 70, '9824', '2022-1-3', '2030-4-18'),
(237, 'Havarijní pojištění', 30, '6386', '2022-7-6', '2024-2-27'),
(238, 'Pojištění odpovědnosti za škody', 21, '9337', '2022-10-24', '2025-9-1'),
(239, 'Pojištění domácnosti', 7, '8241', '2022-9-1', '2028-8-10'),
(240, 'Havarijní pojištění', 72, '6270', '2022-1-2', '2027-10-28'),
(241, 'Pojištění domácnosti', 69, '5079', '2022-2-13', '2028-7-11'),
(242, 'Havarijní pojištění', 26, '5482', '2022-2-21', '2024-12-1'),
(243, 'Životní pojištění', 99, '8889', '2022-3-21', '2030-6-22'),
(244, 'Pojištění domácnosti', 12, '1747', '2022-8-8', '2027-2-2'),
(245, 'Havarijní pojištění', 55, '6746', '2022-12-7', '2024-9-3'),
(246, 'Životní pojištění', 92, '5501', '2022-9-7', '2024-8-13'),
(247, 'Pojištění odpovědnosti za škody', 29, '6828', '2022-11-1', '2028-5-2'),
(248, 'Havarijní pojištění', 47, '5162', '2022-7-6', '2028-7-7'),
(249, 'Havarijní pojištění', 85, '8479', '2022-8-28', '2026-6-12'),
(250, 'Pojištění domácnosti', 70, '3093', '2022-1-27', '2025-12-8'),
(251, 'Životní pojištění', 88, '7912', '2022-4-20', '2025-7-8'),
(252, 'Havarijní pojištění', 19, '5701', '2022-10-23', '2027-4-14'),
(253, 'Životní pojištění', 23, '8950', '2022-10-28', '2024-8-13'),
(254, 'Pojištění odpovědnosti za škody', 15, '2718', '2022-6-25', '2025-2-24'),
(255, 'Pojištění odpovědnosti za škody', 78, '2501', '2022-11-22', '2030-12-13'),
(256, 'Pojištění domácnosti', 99, '3798', '2022-8-2', '2028-9-17'),
(257, 'Havarijní pojištění', 4, '2858', '2022-1-16', '2028-8-8'),
(258, 'Pojištění odpovědnosti za škody', 15, '9005', '2022-10-7', '2025-3-17'),
(259, 'Životní pojištění', 97, '7383', '2022-9-12', '2027-2-21'),
(260, 'Pojištění odpovědnosti za škody', 85, '7349', '2022-9-6', '2025-12-21'),
(261, 'Pojištění odpovědnosti za škody', 16, '2225', '2022-6-18', '2029-9-25'),
(262, 'Životní pojištění', 4, '3818', '2022-7-12', '2024-1-4'),
(263, 'Životní pojištění', 70, '9132', '2022-2-8', '2030-3-22'),
(264, 'Pojištění domácnosti', 80, '4352', '2022-1-15', '2025-3-3'),
(265, 'Pojištění odpovědnosti za škody', 33, '5635', '2022-10-14', '2030-5-15'),
(266, 'Havarijní pojištění', 77, '9510', '2022-8-28', '2027-12-13'),
(267, 'Pojištění odpovědnosti za škody', 65, '4957', '2022-7-5', '2030-1-27'),
(268, 'Havarijní pojištění', 70, '9038', '2022-6-22', '2030-5-20'),
(269, 'Havarijní pojištění', 81, '1926', '2022-2-21', '2028-5-27'),
(270, 'Havarijní pojištění', 18, '1784', '2022-2-15', '2026-5-4'),
(271, 'Životní pojištění', 4, '7104', '2022-1-21', '2026-8-16'),
(272, 'Životní pojištění', 79, '7703', '2022-11-9', '2026-12-4'),
(273, 'Životní pojištění', 7, '4014', '2022-10-28', '2024-6-17'),
(274, 'Pojištění domácnosti', 45, '1431', '2022-7-1', '2026-4-9'),
(275, 'Pojištění odpovědnosti za škody', 85, '9223', '2022-4-16', '2029-10-17'),
(276, 'Havarijní pojištění', 6, '7656', '2022-5-10', '2025-1-8'),
(277, 'Pojištění domácnosti', 100, '4459', '2022-4-16', '2028-1-13'),
(278, 'Havarijní pojištění', 46, '6401', '2022-3-8', '2025-7-22'),
(279, 'Pojištění odpovědnosti za škody', 43, '2927', '2022-8-10', '2026-12-10'),
(280, 'Pojištění odpovědnosti za škody', 82, '6402', '2022-5-4', '2027-1-7'),
(281, 'Pojištění domácnosti', 10, '4577', '2022-9-20', '2025-12-24'),
(282, 'Havarijní pojištění', 98, '3375', '2022-11-26', '2029-5-16'),
(283, 'Životní pojištění', 9, '3921', '2022-12-5', '2024-12-25'),
(284, 'Životní pojištění', 76, '3523', '2022-4-21', '2024-11-13'),
(285, 'Pojištění odpovědnosti za škody', 20, '6791', '2022-3-6', '2026-12-9'),
(286, 'Pojištění odpovědnosti za škody', 99, '3898', '2022-1-22', '2029-5-15'),
(287, 'Pojištění odpovědnosti za škody', 72, '1663', '2022-3-12', '2030-5-18'),
(288, 'Pojištění domácnosti', 71, '6962', '2022-9-22', '2026-8-19'),
(289, 'Havarijní pojištění', 52, '7354', '2022-12-15', '2026-10-21'),
(290, 'Havarijní pojištění', 99, '7335', '2022-7-7', '2024-3-27'),
(291, 'Havarijní pojištění', 68, '9074', '2022-5-25', '2029-8-25'),
(292, 'Havarijní pojištění', 76, '9485', '2022-9-2', '2028-4-19'),
(293, 'Pojištění domácnosti', 90, '6284', '2022-6-27', '2024-1-18'),
(294, 'Havarijní pojištění', 83, '1923', '2022-3-7', '2024-6-2'),
(295, 'Pojištění odpovědnosti za škody', 7, '2240', '2022-8-3', '2030-7-10'),
(296, 'Životní pojištění', 8, '2018', '2022-4-18', '2028-4-18'),
(297, 'Havarijní pojištění', 10, '7485', '2022-10-11', '2025-6-14'),
(298, 'Životní pojištění', 88, '8188', '2022-5-15', '2026-12-4'),
(299, 'Životní pojištění', 34, '5899', '2022-12-4', '2030-1-24'),
(300, 'Životní pojištění', 2, '1740', '2022-1-9', '2029-1-11'),
(301, 'Pojištění odpovědnosti za škody', 96, '5848', '2022-12-9', '2025-6-26'),
(302, 'Havarijní pojištění', 12, '8484', '2022-5-8', '2029-6-12'),
(303, 'Životní pojištění', 41, '1263', '2022-10-23', '2029-4-19'),
(304, 'Životní pojištění', 41, '4900', '2022-7-15', '2026-1-25'),
(305, 'Pojištění odpovědnosti za škody', 62, '4388', '2022-3-17', '2029-4-21'),
(306, 'Pojištění domácnosti', 58, '3815', '2022-5-17', '2029-6-22'),
(307, 'Pojištění domácnosti', 62, '2153', '2022-9-11', '2028-4-12'),
(308, 'Pojištění domácnosti', 13, '2987', '2022-9-26', '2024-5-24'),
(309, 'Životní pojištění', 66, '2681', '2022-2-12', '2030-4-22'),
(310, 'Pojištění odpovědnosti za škody', 96, '7171', '2022-7-2', '2029-5-26'),
(311, 'Pojištění odpovědnosti za škody', 81, '4560', '2022-2-15', '2028-3-11'),
(312, 'Havarijní pojištění', 87, '5877', '2022-6-7', '2027-5-14'),
(313, 'Pojištění domácnosti', 7, '7976', '2022-3-6', '2028-2-22'),
(314, 'Havarijní pojištění', 66, '8103', '2022-1-23', '2030-7-23'),
(315, 'Životní pojištění', 23, '3373', '2022-11-19', '2025-9-17'),
(316, 'Pojištění odpovědnosti za škody', 86, '9979', '2022-2-12', '2028-10-21'),
(317, 'Životní pojištění', 31, '2647', '2022-3-19', '2024-3-9'),
(318, 'Pojištění odpovědnosti za škody', 2, '9440', '2022-7-2', '2030-8-18'),
(319, 'Životní pojištění', 78, '1877', '2022-10-19', '2027-11-5'),
(320, 'Životní pojištění', 51, '9497', '2022-12-22', '2027-8-15'),
(321, 'Životní pojištění', 10, '9746', '2022-9-27', '2024-3-16'),
(322, 'Havarijní pojištění', 61, '4807', '2022-8-11', '2030-11-1'),
(323, 'Životní pojištění', 85, '9297', '2022-8-14', '2028-2-27'),
(324, 'Životní pojištění', 42, '7640', '2022-8-9', '2024-5-21'),
(326, 'Pojištění domácnosti', 87, '3579', '2022-7-2', '2026-4-10'),
(327, 'Havarijní pojištění', 49, '7712', '2022-10-7', '2024-11-23'),
(328, 'Havarijní pojištění', 27, '2689', '2022-3-20', '2027-8-5'),
(329, 'Pojištění odpovědnosti za škody', 45, '2945', '2022-8-19', '2030-11-17'),
(330, 'Životní pojištění', 22, '1425', '2022-10-27', '2030-11-22'),
(331, 'Havarijní pojištění', 23, '8176', '2022-4-10', '2029-6-22'),
(332, 'Pojištění domácnosti', 98, '7398', '2022-10-3', '2024-3-13'),
(333, 'Pojištění domácnosti', 75, '6130', '2022-1-13', '2025-9-16'),
(334, 'Pojištění odpovědnosti za škody', 80, '7591', '2022-9-9', '2026-9-20'),
(335, 'Pojištění odpovědnosti za škody', 27, '3743', '2022-1-8', '2030-2-19'),
(336, 'Pojištění domácnosti', 32, '1914', '2022-12-18', '2026-8-1'),
(337, 'Životní pojištění', 89, '3586', '2022-8-11', '2030-12-1'),
(338, 'Životní pojištění', 36, '8091', '2022-10-12', '2030-1-7'),
(339, 'Životní pojištění', 48, '9637', '2022-5-16', '2028-7-14'),
(340, 'Životní pojištění', 93, '1818', '2022-8-24', '2027-1-18'),
(341, 'Havarijní pojištění', 51, '9156', '2022-8-24', '2027-12-1'),
(342, 'Pojištění domácnosti', 81, '9517', '2022-9-20', '2028-9-14'),
(343, 'Životní pojištění', 55, '1898', '2022-8-23', '2027-4-10'),
(344, 'Pojištění domácnosti', 78, '4460', '2022-10-11', '2025-10-13'),
(345, 'Havarijní pojištění', 5, '2566', '2022-12-15', '2026-4-18'),
(346, 'Havarijní pojištění', 84, '3917', '2022-1-24', '2024-6-21'),
(347, 'Pojištění odpovědnosti za škody', 24, '5083', '2022-9-18', '2027-10-4'),
(348, 'Životní pojištění', 19, '4528', '2022-7-25', '2029-2-7'),
(349, 'Pojištění domácnosti', 93, '9743', '2022-12-3', '2024-1-25'),
(350, 'Pojištění domácnosti', 27, '6654', '2022-6-20', '2024-3-21'),
(351, 'Pojištění domácnosti', 25, '1089', '2022-11-18', '2030-5-19'),
(352, 'Pojištění domácnosti', 57, '6848', '2022-8-19', '2027-4-12'),
(353, 'Životní pojištění', 97, '8747', '2022-10-24', '2024-4-20'),
(354, 'Pojištění domácnosti', 12, '2698', '2022-6-26', '2028-4-16'),
(355, 'Životní pojištění', 26, '7052', '2022-4-27', '2026-7-1'),
(356, 'Životní pojištění', 32, '7744', '2022-3-1', '2030-11-21'),
(357, 'Havarijní pojištění', 26, '5957', '2022-4-18', '2028-2-12'),
(358, 'Havarijní pojištění', 9, '1149', '2022-11-11', '2024-1-28'),
(359, 'Životní pojištění', 63, '8466', '2022-11-10', '2024-8-20'),
(360, 'Havarijní pojištění', 48, '4412', '2022-3-8', '2026-3-14'),
(361, 'Havarijní pojištění', 44, '2017', '2022-3-18', '2030-9-20'),
(362, 'Pojištění domácnosti', 22, '2371', '2022-4-17', '2024-10-25'),
(363, 'Pojištění domácnosti', 76, '8839', '2022-11-21', '2026-10-4'),
(364, 'Pojištění domácnosti', 98, '3565', '2022-8-18', '2025-1-8'),
(365, 'Havarijní pojištění', 69, '2646', '2022-3-16', '2028-1-3'),
(366, 'Havarijní pojištění', 62, '7658', '2022-11-9', '2026-6-25'),
(367, 'Pojištění domácnosti', 11, '1749', '2022-8-8', '2027-3-21'),
(368, 'Životní pojištění', 83, '3232', '2022-4-15', '2024-12-12'),
(369, 'Pojištění domácnosti', 88, '8138', '2022-4-8', '2030-8-26'),
(370, 'Havarijní pojištění', 27, '4621', '2022-5-24', '2027-8-18'),
(371, 'Pojištění odpovědnosti za škody', 62, '2512', '2022-9-9', '2026-1-17'),
(372, 'Havarijní pojištění', 24, '9131', '2022-9-21', '2024-8-6'),
(373, 'Pojištění domácnosti', 38, '8454', '2022-7-11', '2029-9-26'),
(374, 'Havarijní pojištění', 58, '9380', '2022-5-8', '2030-4-22'),
(375, 'Životní pojištění', 95, '4094', '2022-12-27', '2027-9-13'),
(376, 'Havarijní pojištění', 43, '3326', '2022-4-11', '2028-5-9'),
(377, 'Životní pojištění', 63, '8592', '2022-7-27', '2026-6-6'),
(378, 'Životní pojištění', 28, '6817', '2022-10-19', '2027-5-16'),
(379, 'Životní pojištění', 46, '7443', '2022-2-24', '2024-8-16'),
(380, 'Pojištění odpovědnosti za škody', 39, '9362', '2022-5-5', '2030-10-28'),
(381, 'Životní pojištění', 17, '1866', '2022-7-25', '2030-4-24'),
(382, 'Pojištění odpovědnosti za škody', 20, '7736', '2022-8-7', '2029-9-15'),
(383, 'Havarijní pojištění', 15, '2970', '2022-2-12', '2028-4-9'),
(384, 'Pojištění odpovědnosti za škody', 69, '6480', '2022-4-3', '2028-1-27'),
(385, 'Pojištění domácnosti', 21, '8282', '2022-2-2', '2028-9-19'),
(386, 'Pojištění odpovědnosti za škody', 99, '1265', '2022-1-16', '2026-7-9'),
(387, 'Pojištění domácnosti', 71, '1419', '2022-8-13', '2027-8-14'),
(388, 'Pojištění odpovědnosti za škody', 63, '5751', '2022-11-17', '2027-5-9'),
(389, 'Pojištění odpovědnosti za škody', 34, '2225', '2022-4-23', '2028-6-14'),
(390, 'Havarijní pojištění', 78, '8385', '2022-12-5', '2030-5-24'),
(391, 'Pojištění domácnosti', 50, '9049', '2022-6-18', '2029-2-13'),
(392, 'Životní pojištění', 7, '1952', '2022-12-12', '2025-6-11'),
(393, 'Havarijní pojištění', 61, '6787', '2022-7-20', '2025-7-28'),
(394, 'Pojištění odpovědnosti za škody', 84, '9801', '2022-10-19', '2030-1-23'),
(395, 'Životní pojištění', 70, '4742', '2022-5-2', '2030-4-3'),
(396, 'Pojištění odpovědnosti za škody', 95, '6209', '2022-5-16', '2028-10-5'),
(397, 'Životní pojištění', 84, '4659', '2022-9-11', '2028-1-10'),
(398, 'Pojištění odpovědnosti za škody', 4, '3708', '2022-4-28', '2030-11-22'),
(399, 'Životní pojištění', 22, '7313', '2022-6-28', '2028-1-13'),
(400, 'Pojištění odpovědnosti za škody', 84, '7253', '2022-11-22', '2027-5-14'),
(401, 'Životní pojištění', 48, '5914', '2022-9-3', '2030-10-26');

-- --------------------------------------------------------

--
-- Struktura tabulky `uzivatel`
--

CREATE TABLE `uzivatel` (
  `uzivatel_id` int(11) NOT NULL,
  `jmeno` varchar(255) COLLATE utf8mb4_czech_ci NOT NULL,
  `heslo` varchar(255) COLLATE utf8mb4_czech_ci NOT NULL,
  `admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `uzivatel`
--

INSERT INTO `uzivatel` (`uzivatel_id`, `jmeno`, `heslo`, `admin`) VALUES
(1, 'admin', '$2y$10$MhYU6DroKrPcDEuJvB98fOsW5/Bb11BFll.olaLWlyszOxGbMBDbW', 1),
(2, 'holyK', '$2y$10$cEGk0odd22aWH28faw6AweTBGOMqw2OqQg3/yKpmn0QhFIk87IqWC', 0),
(3, 'choryM', '$2y$10$gPsA7Bz/9dOBSov1GIVqmu6TjIDzEhRo4MKAKWUBeMNI8j0oAEiKa', 0),
(4, 'hajnaH', '$2y$10$mtuzoKcTyng8UbMg9n1a6OxDX3ktkbetIR8FskC9PCXaVrI7/aC2C', 0),
(5, 'setekV', '$2y$10$6dUGH7k4rnh9qlwwSVEgXeEKWi0i2UhImnjN4kBVBbJv8NO6cVNte', 0),
(6, 'kolmyP', '$2y$10$etCAf6rm2KL0JgHZr68J4eqbStjZmCXwsjo2nqCv0HVrHRxgkYY.S', 0);

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `adresa`
--
ALTER TABLE `adresa`
  ADD PRIMARY KEY (`adresa_id`);

--
-- Indexy pro tabulku `klient`
--
ALTER TABLE `klient`
  ADD PRIMARY KEY (`klient_id`);

--
-- Indexy pro tabulku `pojisteni`
--
ALTER TABLE `pojisteni`
  ADD PRIMARY KEY (`pojisteni_id`),
  ADD KEY `pojistenipojistenec` (`pojistenec`);

--
-- Indexy pro tabulku `uzivatel`
--
ALTER TABLE `uzivatel`
  ADD PRIMARY KEY (`uzivatel_id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `adresa`
--
ALTER TABLE `adresa`
  MODIFY `adresa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pro tabulku `klient`
--
ALTER TABLE `klient`
  MODIFY `klient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT pro tabulku `pojisteni`
--
ALTER TABLE `pojisteni`
  MODIFY `pojisteni_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=402;

--
-- AUTO_INCREMENT pro tabulku `uzivatel`
--
ALTER TABLE `uzivatel`
  MODIFY `uzivatel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `pojisteni`
--
ALTER TABLE `pojisteni`
  ADD CONSTRAINT `pojistenipojistenec` FOREIGN KEY (`pojistenec`) REFERENCES `klient` (`klient_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
