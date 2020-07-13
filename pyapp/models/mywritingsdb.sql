-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 12-Jul-2020 às 23:00
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
(1, 'Um Alerta às Gerações Futuras sobre o Golpe de 2018 no Brasil', NULL, 'um-alerta-as-geracoes-futuras-sobre-o-go', NULL, NULL, '2020-07-02 02:00:06', '2020-07-03 00:33:31');

-- --------------------------------------------------------

--
-- Estrutura da tabela `chapters`
--

DROP TABLE IF EXISTS `chapters`;
CREATE TABLE `chapters` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
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

INSERT INTO `chapters` (`id`, `title`, `slug`, `chapter_n`, `is_completed`, `obs`, `book_id`, `created_at`, `updated_at`) VALUES
(1, 'O Dever do Ser Humano', 'o-dever-do-ser-humano', 1, 0, NULL, 1, '2020-07-03 01:06:48', '2020-07-05 23:02:52'),
(2, 'O Mistério dos Black Blocks em 2013\'', 'o-misterio-dos-black-blocks-em-2013', 2, 0, NULL, 1, '2020-07-03 01:06:48', NULL),
(3, 'O Impeachment contra Dilma Roussef', 'o-impeachment-contra-dilma-roussef', 3, 0, NULL, 1, '2020-07-03 01:06:48', '2020-07-05 23:04:41'),
(4, 'A Fraude da Condenação Penal do Triplex', 'a-fraude-da-condenacao-penal-do-triplex', 4, 0, NULL, 1, '2020-07-03 01:06:48', '2020-07-05 23:06:53'),
(5, 'A Anticorrupção Como Manobra Política', 'a-anticorrupcao-como-manobra-politica', 5, 0, NULL, 1, '2020-07-03 01:06:48', '2020-07-05 23:08:30'),
(6, 'A Vaza Jato para Nos Ajudar: mas Dando as Provas Daquilo Que Deveria Ter Sido Óbvio', 'a-vaza-jato-para-nos-ajudar-mas-dando-as', 6, 0, NULL, 1, '2020-07-03 01:06:48', NULL),
(7, 'O Histórico de Bolsonaro antes de Ter Decidido Se Candidatar à Presidência', 'o-historico-de-bolsonaro-antes-de-ter-de', 7, 0, NULL, 1, '2020-07-03 01:06:48', NULL),
(8, 'Bolsonaro Desenvolve uma Campanha, Aproveitando seu Histórico Facista, de Altas Mentiras', 'bolsonaro-desenvolve-uma-campanha-aprove', 8, 0, NULL, 1, '2020-07-03 01:06:48', NULL),
(9, 'Bolsonaro, além de Mentiroso, um Traidor', 'bolsonaro-alem-de-mentiroso-um-traidor', 9, 0, NULL, 1, '2020-07-03 01:06:48', NULL),
(10, 'A Ironia dos Destinos: Moro, Aquele Que Armou contra um ex-Presidente, Agora Contribuirá para a Queda de Bolsonaro', 'a-ironia-dos-destinos-moro-aquele-que-ar', 10, 0, NULL, 1, '2020-07-03 01:06:48', NULL),
(11, 'A Reunião Ministerial dos Infernos', 'a-reuniao-ministerial-dos-infernos', 11, 0, NULL, 1, '2020-07-03 01:06:48', '2020-07-05 23:12:51'),
(12, 'Queiroz e Wassef: Tudo É Pior do Que Se Achava', 'queiroz-e-wassef-tudo-e-pior-do-que-se-a', 12, 0, NULL, 1, '2020-07-03 01:06:48', '2020-07-05 23:37:05'),
(13, 'Mariele Vive', 'mariele-vive', 13, 0, NULL, 1, '2020-07-03 01:06:48', NULL),
(14, 'Abraham Weintraub Foge Espetacularmente do País', 'abraham-weintraub-foge-espetacularmente', 14, 0, NULL, 1, '2020-07-03 01:06:49', NULL),
(15, 'O Imbróglio Decotelli e Bolsonaro Contando Mais Mentiras sobre a Educação', 'o-imbroglio-decotelli-e-bolsonaro-contan', 15, 0, NULL, 1, '2020-07-03 01:06:49', NULL),
(16, 'A Analogia do Entretenimento na Frente e o Assalto nos Fundos', 'a-analogia-do-entretenimento-na-frente-e', 16, 0, NULL, 1, '2020-07-03 01:06:49', NULL),
(17, 'A Pandemia do Coronavírus Escancara Exponencialmente o Desdém, o Desprezo e a Desvalorização da Vida Advindos do Desgoverno', 'a-pandemia-do-coronavirus-escancara-expo', 17, 0, NULL, 1, '2020-07-03 01:06:49', '2020-07-05 03:08:16'),
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
(1, '2020-07-01', 3542, '{\"1\": 657, \"2\": 810, \"3\": 781, \"4\": 39, \"5\": 19, \"6\": 1224, \"7\": 12}', 1, '2020-07-02 02:28:57', NULL),
(2, '2020-07-02', 6129, '{\"1\": 12, \"2\": 10, \"3\": 14, \"4\": 23, \"5\": 15, \"6\": 19, \"7\": 15, \"8\": 822, \"9\": 2933, \"10\": 21, \"11\": 20, \"12\": 11, \"13\": 5, \"14\": 1238, \"15\": 14, \"16\": 52, \"17\": 25, \"18\": 13, \"19\": 15, \"20\": 790, \"21\": 14, \"22\": 7, \"23\": 21, \"24\": 7, \"25\": 13}', 1, '2020-07-03 01:55:52', NULL),
(3, '2020-07-03', 8218, '{\"1\": 12, \"2\": 10, \"3\": 14, \"4\": 23, \"5\": 15, \"6\": 911, \"7\": 15, \"8\": 822, \"9\": 2933, \"10\": 21, \"11\": 20, \"12\": 11, \"13\": 5, \"14\": 1294, \"15\": 14, \"16\": 52, \"17\": 25, \"18\": 13, \"19\": 15, \"20\": 790, \"21\": 14, \"22\": 7, \"23\": 21, \"24\": 7, \"25\": 13}', 1, '2020-07-03 23:51:58', '2020-07-04 02:58:39'),
(4, '2020-07-05', 13327, '{\"1\": 17, \"2\": 10, \"3\": 23, \"4\": 2142, \"5\": 1317, \"6\": 928, \"7\": 15, \"8\": 2360, \"9\": 1504, \"10\": 21, \"11\": 42, \"12\": 200, \"13\": 765, \"14\": 1311, \"15\": 14, \"16\": 52, \"17\": 1154, \"18\": 13, \"19\": 15, \"20\": 790, \"21\": 14, \"22\": 7, \"23\": 21, \"24\": 7, \"25\": 13}', 1, '2020-07-06 00:32:12', '2020-07-06 01:35:19');

-- --------------------------------------------------------

--
-- Estrutura da tabela `docrefs`
--

DROP TABLE IF EXISTS `docrefs`;
CREATE TABLE `docrefs` (
  `id` int(10) UNSIGNED NOT NULL,
  `tokid` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authors` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origins` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `program` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refdate` date DEFAULT NULL,
  `year` year(4) DEFAULT NULL,
  `trecho_min` tinyint(4) DEFAULT NULL,
  `total_min` smallint(6) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `obs` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='references at end of chapters';

--
-- Extraindo dados da tabela `docrefs`
--

INSERT INTO `docrefs` (`id`, `tokid`, `authors`, `origins`, `program`, `refdate`, `year`, `trecho_min`, `total_min`, `title`, `subtitle`, `url`, `obs`, `created_at`, `updated_at`) VALUES
(1, 'elpmdt11', 'Afonso Benites, Beatriz Jucá, Rodolfo Borges', 'El País', NULL, '2020-04-16', NULL, NULL, NULL, 'Mandetta é demitido por Bolsonaro', NULL, 'https://brasil.elpais.com/sociedade/2020-04-16/mandetta-e-demitido-por-bolsonaro.html', NULL, '2020-07-05 02:39:53', '2020-07-05 18:31:48'),
(2, 'uolmai01', 'Marcelo Oliveira', 'UOL', NULL, '2020-07-04', NULL, NULL, NULL, 'Deltan deixou claro que Lava Jato é um movimento político, diz Maia', NULL, 'https://noticias.uol.com.br/politica/ultimas-noticias/2020/07/04/deltan-deixou-claro-que-lava-jato-e-um-movimento-politico-diz-maia.htm', NULL, '2020-07-05 03:06:55', NULL),
(3, 'vidvil11', 'Marco Antônio Villa', NULL, NULL, '2020-07-04', NULL, 2, 29, 'Bolsonaro não respeita o Brasil', NULL, 'youtu.be/3kMc1Sqs6j0', '', '2020-07-05 18:06:38', NULL),
(4, 'elpmdt12', 'Almudena Barragán', 'El País', NULL, '2018-10-19', NULL, NULL, NULL, 'Cinco ‘fake news’ que beneficiaram a candidatura de Bolsonaro', 'Na reta final da campanha presidencial, boatos sobre os adversários do ultradireitista aumentaram nas redes sociais', NULL, NULL, '2020-07-05 18:33:39', '2020-07-05 18:34:32'),
(5, 'cagmet11', 'cagometro.com', NULL, NULL, '2020-04-16', NULL, NULL, NULL, 'Mandetta é demitido por Bolsonaro', 'Decisão de presidente foi anunciada no Twitter pelo agora ex-ministro. Nelson Teich comandará Ministério da Saúde. Mandatário diz que exoneração acontecerá “nas próximas horas”', 'http://www.cagometro.com/abril2020/mandetta-e-demitido-por-bolsonaro', NULL, '2020-07-05 19:09:49', NULL),
(6, 'oglgri11', 'Marco Grillo', 'O Globo', NULL, '2020-06-10', NULL, NULL, NULL, '\'Cobre do seu governador, sai daqui\', diz Bolsonaro a eleitora que o criticou por atitudes durante pandemia', '\'Sinto que o senhor traiu nossa população\', afirma funcionaria de gabinete de vereador do MBL a presidente no Palácio da Alvorada', 'https://oglobo.globo.com/brasil/cobre-do-seu-governador-sai-daqui-diz-bolsonaro-eleitora-que-criticou-por-atitudes-durante-pandemia-24472272', NULL, '2020-07-05 19:16:55', NULL),
(7, 'glg1jn11', '', 'Rede Globo', 'Jornal Nacional', '2020-06-22', NULL, NULL, NULL, 'Empresas ligadas à ex de Frederick Wassef têm contratos milionários com o governo', 'Empresa, ligada a Maria Cristina Boner Leo, ex-mulher e sócia do advogado que defendeu o senador Flávio Bolsonaro, recebeu R$ 41,6 milhões durante a gestão de Jair Bolsonaro', 'https://g1.globo.com/jornal-nacional/noticia/2020/06/22/empresas-ligadas-a-ex-de-frederick-wassef-tem-contratos-milionarios-com-o-governo.ghtml', NULL, '2020-07-05 23:27:36', '2020-07-05 23:33:53'),
(8, 'oandan11', 'Claudio Dantas', 'O Antagonista', NULL, '2020-06-23', NULL, NULL, NULL, 'Exclusivo: advogado de Bolsonaro, Wassef vende consultoria a empresa com interesses no governo', NULL, 'https://www.oantagonista.com/brasil/exclusivo-advogado-de-bolsonaro-wassef-vende-consultoria-a-empresa-com-interesses-no-governo', NULL, '2020-07-05 23:29:12', NULL),
(9, 'forred11', NULL, 'Revista Forum', NULL, '2020-07-05', NULL, NULL, NULL, 'Wassef ameaça e diz guardar a “sete chaves” provas de relação com Bolsonaro “que ninguém nem sonha”', 'Advogado do clã Bolsonaro que escondeu Queiroz, Wassef diz a interlocutores que em breve dará entrevista à TV sobre a morte do miliciano Adriano Nóbrega que vai \"explodir todo mundo em rede nacional\"', 'https://revistaforum.com.br/politica/bolsonaro/wassef-ameaca-e-diz-guardar-a-sete-chaves-provas-de-relacao-com-bolsonaro-que-ninguem-nem-sonha', NULL, '2020-07-05 23:32:40', NULL),
(10, 'porjos12', 'José Fernandes da Silva', 'Portal do José', NULL, '2020-07-05', NULL, 4, 14, 'PF perto de Guedes! Bolsonaro e seu Patrão - A morte acima de tudo! 200 mil vítimas! Feder fedeu!', NULL, 'youtu.be/8Sz-BVP456s9', 'O ponto alta é a mostra da matéria em O Globo que veicula a notícia de que a Operação Greenfield \"segue em velocidade de cruzeiro a investigação contra Paulo Guedes por suspeitas de ter participado de fraudes em fundos de pensão por meio da gestora da qual era sócio, antes de ser ministro\". Repassa entrevista antiga com o deputado do PDT, Paulo Ramos, que investiga Guedes. Esta entrevista está em https://www.youtube.com/watch?v=adyqoSyqTAU', '2020-07-06 01:00:22', NULL),
(11, 'porjos13', 'José Fernandes da Silva', 'Portal do José', NULL, '2020-01-22', NULL, NULL, NULL, 'GUEDES: APLAUDIDO LÁ e INVESTIGADO CÁ! PAULO RAMOS REVELA QUEM É O VERDADEIRO MINISTRO DE BOLSONARO!', 'DEPUTADO PAULO RAMOS REVELA QUEM É GUEDES', 'youtu.be/adyqoSyqTAU', NULL, '2020-07-06 01:03:28', NULL),
(12, 'ogllau11', 'Gabriel Mascarenhas', 'O Globo', 'Coluna Lauro Jardim', '2020-07-05', NULL, NULL, NULL, 'Investigação da Greenfield sobre Paulo Guedes avança', NULL, 'https://blogs.oglobo.globo.com/lauro-jardim/post/investigacao-da-greenfield-sobre-paulo-guedes-avanca.html', NULL, '2020-07-06 01:09:24', NULL),
(13, 'oedrei12', 'Reinaldo Azevedo', 'BandNews', 'O É da Coisa', '2020-06-19', NULL, NULL, 13, 'Weintraub é ridículo até ao sair, mas será premiado', NULL, 'youtu.be/5s5Ho-llvIw', 'Neste trecho, 13\', Reinaldo Azevedo destrói forte Abraham Weintraub', '2020-07-06 02:00:57', NULL),
(14, 'opmuol12', 'Ricardo Viel', 'Opera Mundi', NULL, '2019-07-29', NULL, NULL, NULL, 'O bolsonarismo é o neofacismo adaptado ao Brasil do século 21', 'Para Manuel Loff, estudioso português de governos autoritários, bolsonarismo soma “nostalgia da ditadura, discurso sobre a corrupção” e “ligação ao mundo evangélico”', 'https://operamundi.uol.com.br/politica-e-economia/59687/o-bolsonarismo-e-o-neofacismo-adaptado-ao-brasil-do-seculo-21', NULL, '2020-07-06 02:54:24', NULL),
(15, 'fsppan11', NULL, 'Folha SP', 'Painel', '2020-07-12', NULL, NULL, NULL, 'PSOL entra com queixa-crime contra Bolsonaro por atuação na pandemia', 'Partido argumenta que Bolsonaro minimizou a Covid-19 e desrespeitou repetidamente as regras de contenção da doença, colocando em risco a vida da população', 'https://www1.folha.uol.com.br/colunas/painel/2020/07/psol-entra-com-queixa-crime-contra-bolsonaro-por-atuacao-na-pandemia.shtml', NULL, '2020-07-12 20:36:20', NULL),
(16, 'bugbol14', 'Henry Bugalho', 'YouTube', NULL, '2020-07-08', NULL, NULL, NULL, '2020-07-08 21\' BOLSONARO E O ÓDIO QUE NOS UNE!', NULL, 'youtu.be/Yn6UkvFi8Yw', 'Comentário sobre o artigo por Hélio Schwartzman em que escreve: torço para que Bolsonaro, tendo pego o Coronavírus, mora. O problema do trem, famoso da palestra por Michael Sandel. Et al.', '2020-07-12 23:59:22', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Índices para tabela `chapters`
--
ALTER TABLE `chapters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bookid_n_chaptern_uniq` (`chapter_n`,`book_id`);

--
-- Índices para tabela `datedmeasures`
--
ALTER TABLE `datedmeasures`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bookid_n_measuredate_uniq` (`measuredate`,`book_id`);

--
-- Índices para tabela `docrefs`
--
ALTER TABLE `docrefs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokid` (`tokid`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de tabela `datedmeasures`
--
ALTER TABLE `datedmeasures`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `docrefs`
--
ALTER TABLE `docrefs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
