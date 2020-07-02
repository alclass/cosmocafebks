-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 01-Jul-2020 às 23:44
-- Versão do servidor: 5.7.30-0ubuntu0.18.04.1
-- versão do PHP: 7.2.24-0ubuntu0.18.04.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `mywritingsdb`
--
CREATE DATABASE IF NOT EXISTS `mywritingsdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `mywritingsdb`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `obs` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='books my writings';

--
-- Extraindo dados da tabela `books`
--

INSERT INTO `books` (`id`, `title`, `subtitle`, `slug`, `category_id`, `obs`, `created_at`, `updated_at`) VALUES
(1, 'Uma História do Pior Governo Que o Brasil Já Teve', 'Volume 1: Terra Arrasada', 'uma-historia-do-pior-governo', NULL, NULL, '2020-07-02 02:00:06', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `chapters`
--

DROP TABLE IF EXISTS `chapters`;
CREATE TABLE `chapters` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chapter_n` tinyint(4) NOT NULL DEFAULT '1',
  `is_completed` tinyint(1) NOT NULL DEFAULT '0',
  `obs` text COLLATE utf8mb4_unicode_ci,
  `book_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='book chapters';

--
-- Extraindo dados da tabela `chapters`
--

INSERT INTO `chapters` (`id`, `title`, `chapter_n`, `is_completed`, `obs`, `book_id`, `created_at`, `updated_at`) VALUES
(1, 'O Pesadelo diante dos Olhos: Bolsonaro Eleito Presidente', 1, 0, NULL, 1, '2020-07-02 02:35:45', NULL),
(2, 'As Mentiras e Fake News nas Campanhas dos Bolsolavistas e a Enganação de Grande Parte do Eleitorado', 2, 0, NULL, 1, '2020-07-02 02:35:45', NULL),
(3, 'A Década Perdida e as Décadas a Perder', 3, 0, NULL, 1, '2020-07-02 02:36:13', NULL),
(4, 'A Analogia do Bêbado-Palhaço Entretendo os Fregueses enquanto o Assalto Acontece nos Fundos do Bar', 4, 0, NULL, 1, '2020-07-02 02:36:48', NULL),
(5, 'A Famigerada Reunião do Dia 22 de Abril: Uma Caterva, Uma Malta, Uma ORCRIM no Poder', 5, 0, NULL, 1, '2020-07-02 02:37:41', NULL),
(6, 'A Fuga de Abraham Weintraub', 6, 0, NULL, 1, '2020-07-02 02:41:56', NULL),
(7, 'Terra Arrasada e a Urgência de Recomeçar e Reconstruir', 7, 0, NULL, 1, '2020-07-02 02:42:36', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `datedmeasures`
--

DROP TABLE IF EXISTS `datedmeasures`;
CREATE TABLE `datedmeasures` (
  `id` int(10) UNSIGNED NOT NULL,
  `measuredate` date NOT NULL,
  `n_words` int(11) NOT NULL DEFAULT '0',
  `json_chapters_words` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `book_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='dated measures';

--
-- Extraindo dados da tabela `datedmeasures`
--

INSERT INTO `datedmeasures` (`id`, `measuredate`, `n_words`, `json_chapters_words`, `book_id`, `created_at`, `updated_at`) VALUES
(1, '2020-07-01', 3542, '{\"1\": 657, \"2\": 810, \"3\": 781, \"4\": 39, \"5\": 19, \"6\": 1224, \"7\": 12}', 1, '2020-07-02 02:28:57', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `chapters`
--
ALTER TABLE `chapters`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `datedmeasures`
--
ALTER TABLE `datedmeasures`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `books`
--
ALTER TABLE `books`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `chapters`
--
ALTER TABLE `chapters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `datedmeasures`
--
ALTER TABLE `datedmeasures`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
