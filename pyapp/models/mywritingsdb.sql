-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 02-Jul-2020 às 23:15
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
CREATE TABLE IF NOT EXISTS `books` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `obs` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='books my writings';

--
-- Extraindo dados da tabela `books`
--

INSERT INTO `books` (`id`, `title`, `subtitle`, `slug`, `category_id`, `obs`, `created_at`, `updated_at`) VALUES
(1, 'Um Alerta às Gerações Futuras sobre o Golpe de 2018 no Brasil', NULL, 'um-alerta-as-geracoes-futuras-sobre-o-go', NULL, NULL, '2020-07-02 02:00:06', '2020-07-03 00:33:31');

-- --------------------------------------------------------

--
-- Estrutura da tabela `chapters`
--

DROP TABLE IF EXISTS `chapters`;
CREATE TABLE IF NOT EXISTS `chapters` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chapter_n` tinyint(4) NOT NULL DEFAULT '1',
  `is_completed` tinyint(1) NOT NULL DEFAULT '0',
  `obs` text COLLATE utf8mb4_unicode_ci,
  `book_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bookid_n_chaptern_uniq` (`chapter_n`,`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='book chapters';

--
-- Extraindo dados da tabela `chapters`
--

INSERT INTO `chapters` (`id`, `title`, `slug`, `chapter_n`, `is_completed`, `obs`, `book_id`, `created_at`, `updated_at`) VALUES
(1, 'O Dever do Homem para com as Gerações Vindouras\',', 'o-dever-do-homem-para-com-as-geracoes-vi', 1, 0, NULL, 1, '2020-07-03 01:06:48', NULL),
(2, 'O Mistério dos Black Blocks em 2013\'', 'o-misterio-dos-black-blocks-em-2013', 2, 0, NULL, 1, '2020-07-03 01:06:48', NULL),
(3, 'O Impeachment contra Dilma Roussef em 2013/2014 Foi um Golpe Branco\'', 'o-impeachment-contra-dilma-roussef-em-20', 3, 0, NULL, 1, '2020-07-03 01:06:48', NULL),
(4, 'A Armação e Fraude da Condenação Penal do Triplex contra o ex-Presidente Lula: o Judiciário Face a um Alto Risco', 'a-armacao-e-fraude-da-condenacao-penal-d', 4, 0, NULL, 1, '2020-07-03 01:06:48', NULL),
(5, 'A Anticorrupção Como Manobra Política e um Defeito Político da Classe Média', 'a-anticorrupcao-como-manobra-politica-e', 5, 0, NULL, 1, '2020-07-03 01:06:48', NULL),
(6, 'A Vaza Jato para Nos Ajudar: mas Dando as Provas Daquilo Que Deveria Ter Sido Óbvio', 'a-vaza-jato-para-nos-ajudar-mas-dando-as', 6, 0, NULL, 1, '2020-07-03 01:06:48', NULL),
(7, 'O Histórico de Bolsonaro antes de Ter Decidido Se Candidatar à Presidência', 'o-historico-de-bolsonaro-antes-de-ter-de', 7, 0, NULL, 1, '2020-07-03 01:06:48', NULL),
(8, 'Bolsonaro Desenvolve uma Campanha, Aproveitando seu Histórico Facista, de Altas Mentiras', 'bolsonaro-desenvolve-uma-campanha-aprove', 8, 0, NULL, 1, '2020-07-03 01:06:48', NULL),
(9, 'Bolsonaro, além de Mentiroso, um Traidor', 'bolsonaro-alem-de-mentiroso-um-traidor', 9, 0, NULL, 1, '2020-07-03 01:06:48', NULL),
(10, 'A Ironia dos Destinos: Moro, Aquele Que Armou contra um ex-Presidente, Agora Contribuirá para a Queda de Bolsonaro', 'a-ironia-dos-destinos-moro-aquele-que-ar', 10, 0, NULL, 1, '2020-07-03 01:06:48', NULL),
(11, 'A Reunião Ministerial dos Infernos: a Exposição de uma Caterva, Malta e ORCRIM dentro do Governo Federal', 'a-reuniao-ministerial-dos-infernos-a-exp', 11, 0, NULL, 1, '2020-07-03 01:06:48', NULL),
(12, 'Quando Queiroz é Preso Preventivamente em Junho 2020', 'quando-queiroz-e-preso-preventivamente-e', 12, 0, NULL, 1, '2020-07-03 01:06:48', NULL),
(13, 'Mariele Vive', 'mariele-vive', 13, 0, NULL, 1, '2020-07-03 01:06:48', NULL),
(14, 'A Fuga de Abraham Weintraub: o Ministro Que Quase Destruiu o MEC', 'a-fuga-de-abraham-weintraub-o-ministro-q', 14, 0, NULL, 1, '2020-07-03 01:06:49', NULL),
(15, 'O Imbróglio Decotelli e Bolsonaro Contando Mais Mentiras sobre a Educação', 'o-imbroglio-decotelli-e-bolsonaro-contan', 15, 0, NULL, 1, '2020-07-03 01:06:49', NULL),
(16, 'A Analogia do Entretenimento na Frente e o Assalto nos Fundos', 'a-analogia-do-entretenimento-na-frente-e', 16, 0, NULL, 1, '2020-07-03 01:06:49', NULL),
(17, 'Os Gritinhos de Bolsonaro Nos Quais Dizia: Me Chama de Misógono/Racista/Facista, mas Não Me Chama de Ladrão: Era Mais uma Alta Mentira', 'os-gritinhos-de-bolsonaro-nos-quais-dizi', 17, 0, NULL, 1, '2020-07-03 01:06:49', NULL),
(18, 'Milícia, Igrejas Caça-níqueis e Armas a Rodo para os Reacionários', 'milicia-igrejas-caca-niqueis-e-armas-a-r', 18, 0, NULL, 1, '2020-07-03 01:06:49', NULL),
(19, 'A Tese dos Brasileiros Como Facistas contra a Tese dos Muitos Enganados', 'a-tese-dos-brasileiros-como-facistas-con', 19, 0, NULL, 1, '2020-07-03 01:06:49', NULL),
(20, 'Guedes: a Mentira sem o Menor Pudor', 'guedes-a-mentira-sem-o-menor-pudor', 20, 0, NULL, 1, '2020-07-03 01:06:49', NULL),
(21, 'Guedes e as Suspeitas de Fraudes Bilionárias contra Fundos de Pensão', 'guedes-e-as-suspeitas-de-fraudes-biliona', 21, 0, NULL, 1, '2020-07-03 01:06:49', NULL),
(22, 'Um País em Frangalhos', 'um-pais-em-frangalhos', 22, 0, NULL, 1, '2020-07-03 01:06:49', NULL),
(23, 'O Dever de Não Perder as Esperanças', 'o-dever-de-nao-perder-as-esperancas', 23, 0, NULL, 1, '2020-07-03 01:06:49', NULL),
(24, 'O Quadruplo Desafio: Sócio-Econômico/Energértico/Ambienta/Cultural', 'o-quadruplo-desafio-socio-economico-ener', 24, 0, NULL, 1, '2020-07-03 01:06:49', NULL),
(25, 'Como Um Princípio de Precaução: um Alerta às Gerações Futuras', 'como-um-principio-de-precaucao-um-alerta', 25, 0, NULL, 1, '2020-07-03 01:06:49', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `datedmeasures`
--

DROP TABLE IF EXISTS `datedmeasures`;
CREATE TABLE IF NOT EXISTS `datedmeasures` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `measuredate` date NOT NULL,
  `n_words` int(11) NOT NULL DEFAULT '0',
  `json_chapters_words` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `book_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bookid_n_measuredate_uniq` (`measuredate`,`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='dated measures';

--
-- Extraindo dados da tabela `datedmeasures`
--

INSERT INTO `datedmeasures` (`id`, `measuredate`, `n_words`, `json_chapters_words`, `book_id`, `created_at`, `updated_at`) VALUES
(1, '2020-07-01', 3542, '{\"1\": 657, \"2\": 810, \"3\": 781, \"4\": 39, \"5\": 19, \"6\": 1224, \"7\": 12}', 1, '2020-07-02 02:28:57', NULL),
(2, '2020-07-02', 6129, '{\"1\": 12, \"2\": 10, \"3\": 14, \"4\": 23, \"5\": 15, \"6\": 19, \"7\": 15, \"8\": 822, \"9\": 2933, \"10\": 21, \"11\": 20, \"12\": 11, \"13\": 5, \"14\": 1238, \"15\": 14, \"16\": 52, \"17\": 25, \"18\": 13, \"19\": 15, \"20\": 790, \"21\": 14, \"22\": 7, \"23\": 21, \"24\": 7, \"25\": 13}', 1, '2020-07-03 01:55:52', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
