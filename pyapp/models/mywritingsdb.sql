-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 17-Jul-2020 às 22:37
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

-- --------------------------------------------------------

--
-- Estrutura da tabela `books`
--

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
(16, 'bugbol14', 'Henry Bugalho', 'YouTube', NULL, '2020-07-08', NULL, NULL, NULL, '2020-07-08 21\' BOLSONARO E O ÓDIO QUE NOS UNE!', NULL, 'youtu.be/Yn6UkvFi8Yw', 'Comentário sobre o artigo por Hélio Schwartzman em que escreve: torço para que Bolsonaro, tendo pego o Coronavírus, mora. O problema do trem, famoso da palestra por Michael Sandel. Et al.', '2020-07-12 23:59:22', NULL),
(17, 'pormbl11', 'José Fernandes', 'Portal do José', NULL, '2020-07-13', NULL, NULL, NULL, 'Pane na Direita', '\"Guedes é um Bo$ta a serviço de corruptos\": Diz MBL! Como enfrentar vinganças?', 'youtu.be/_f2FvputC2w', NULL, '2020-07-14 23:56:00', NULL),
(18, 'rdvfel11', NULL, NULL, 'Roda Viva Entrevista', '2020-05-18', NULL, NULL, NULL, 'Roda Viva com Felipe Neto', NULL, 'youtu.be/KQ1CQqNveac', NULL, '2020-07-14 23:56:00', NULL),
(19, 'bibmt716', 'Mateus capítulo 7 versículo 16', 'Bíblia Cristã', NULL, NULL, NULL, NULL, NULL, 'Por Seus Frutos, Vós Os Conhecereis', NULL, NULL, NULL, '2020-07-15 00:00:44', NULL),
(20, 'reilib11', 'Reinaldo Azevedo', NULL, 'O É da Coisa', '2020-07-10', NULL, NULL, NULL, 'Não conter e não punir “fake news” é dar um tiro na própria cabeça', NULL, 'youtu.be/HJdSVVm_OQs', NULL, '2020-07-15 00:03:04', NULL),
(21, 'reilvj13', 'Reinaldo Azevedo', NULL, 'O É da Coisa', '2020-07-10', NULL, NULL, NULL, 'Lava Jato está triste - vai ter de seguir a lei pela 1ª vez...', NULL, 'youtu.be/cWLOEFmmWDs', NULL, '2020-07-15 00:05:59', NULL),
(22, 'folcor11', 'Fernanda Mena', 'Folha SP', NULL, '2020-01-23', NULL, NULL, NULL, 'Sob Bolsonaro, Brasil repete pior nota em ranking de percepção do combate à corrupção', 'Promessas de campanha do presidente se converteram em mais retrocessos que avanços na pauta, aponta ONG', 'https://www1.folha.uol.com.br/poder/2020/01/sob-bolsonaro-brasil-repete-pior-nota-em-ranking-de-percepcao-do-combate-a-corrupcao.shtml', NULL, '2020-07-15 00:16:07', NULL),
(23, 'bdfcor11', 'Redação', 'Brasil de Fato', NULL, NULL, NULL, NULL, NULL, 'Com Bolsonaro, Brasil mantém pior nota no combate à corrupção', 'Com a pontuação baixa, o país caiu mais uma posição em lista com 180 países, indo para o 106º lugar', 'https://www.brasildefato.com.br/2020/01/23/brasil-continua-com-a-pior-nota-quando-o-assunto-e-combate-a-corrupcao', NULL, '2020-07-15 00:19:50', NULL),
(24, 'oglcor11', 'Rayanderson Guerra', 'O Globo', NULL, '2020-01-23', NULL, NULL, NULL, 'Governo tomou medidas que resultaram em retrocesso no combate à corrupção, avalia Transparência Internacional', NULL, 'https://oglobo.globo.com/brasil/governo-tomou-medidas-que-resultaram-em-retrocesso-no-combate-corrupcao-avalia-transparencia-internacional-24206817', NULL, '2020-07-15 00:24:10', NULL),
(25, 'uolcor11', 'Jamil Chade', 'UOL', NULL, '2020-04-30', NULL, NULL, NULL, 'Ingerência presidencial em órgãos anti-corrupção e Amazônia preocupam OCDE', NULL, 'https://noticias.uol.com.br/colunas/jamil-chade/2020/04/30/ocde-critica-interferencia-de-bolsonaro-em-luta-anti-corrupcao-e-amazonia.htm', NULL, '2020-07-15 00:28:58', NULL),
(26, '', NULL, 'Brasil 247', NULL, NULL, NULL, NULL, NULL, 'Bloomberg estampa catástrofe brasileira: hospitais transbordando, corrupção generalizada e um populista obcecado por cloroquina', NULL, 'https://www.brasil247.com/coronavirus/bloomberg-estampa-catastrofe-brasileira-hospitais-transbordando-corrupcao-generalizada-e-um-populista-obcecado-por-cloroquina', NULL, '2020-07-15 00:33:02', NULL),
(27, 'blocor11', 'Julia Leite, Simone Iglesias, Martha Beck & Ethan Bronner', 'Bloomberg Businessweek', NULL, NULL, NULL, NULL, NULL, 'The Pandemic’s Worst-Case Scenario Is Unfolding in Brazil', 'Overflowing hospitals. Widespread corruption. And a chloroquine-obsessed populist in charge', 'https://www.bloomberg.com/news/features/2020-06-24/coronavirus-pandemic-brazil-faces-worst-case-scenario', NULL, '2020-07-15 00:36:37', NULL),
(28, 'ttchss11', 'Richard B. Spence', 'TTC', NULL, NULL, 2019, NULL, NULL, 'The Real History of Secret Societies', NULL, 'https://www.thegreatcoursesplus.com/the-real-history-of-secret-societies', NULL, '2020-07-15 00:45:10', NULL),
(29, 'fdlcir11', NULL, 'Fórum da Liberdade', NULL, NULL, 2008, NULL, NULL, 'Debate entre Ciro Gomes e Paulo Guedes no 21º Fórum da Liberdade', NULL, 'youtu.be/G8neGsOIh18', NULL, '2020-07-15 00:49:29', NULL),
(31, 'reigil11', 'Reinaldo Azevedo', NULL, 'O É da Coisa', '2020-07-14', NULL, NULL, 29, 'Generais confundem governo com quartel. Voltem para a caserna!', NULL, 'youtu.be/RoIcdolud60', 'Gilmar Mendes, em um ao-vivo, alerta aos militares: \"cuidado para não se associarem a um genocídio\"', '2020-07-16 00:14:03', NULL),
(32, 'brde4388', NULL, 'Decreto nº 4.388 de 2002 (Estatuto de Roma)', NULL, '2002-09-25', NULL, NULL, NULL, '', 'Promulga o Estatuto de Roma do Tribunal Penal Internacional', 'http://www.planalto.gov.br/ccivil_03/decreto/2002/d4388.htm', NULL, '2020-07-16 00:43:23', NULL),
(33, 'g1ggen11', 'Redação', 'G1', NULL, '2019-09-24', NULL, NULL, NULL, 'Número de assassinatos de indígenas cresce 20% no Brasil em 2018, aponta relatório do Cimi', NULL, 'https://g1.globo.com/natureza/noticia/2019/09/24/numero-de-assassinatos-de-indigenas-cresce-20percent-no-brasil-em-2018-aponta-relatorio.ghtml', NULL, '2020-07-16 00:59:35', NULL),
(34, 'vilind11', 'Marco Antônio Villa', 'YouTube', NULL, '2020-07-15', NULL, NULL, 26, 'Bolsonaro - a irracionalidade no poder', NULL, 'youtu.be/ibaiu5ekROE', NULL, '2020-07-16 01:15:20', NULL),
(35, 'huffnb11', 'Débora Melo, Marcella Fernandes', 'Huffpost Brasil', NULL, '2019-01-14', NULL, NULL, NULL, 'Estratégia de Bolsonaro, que inclui fake news e ataques à imprensa, é \'problemática\'', 'Ao fazer das redes sociais canal oficial de comunicação do governo, presidente se mantém no palanque e evita questionamentos', 'https://www.huffpostbrasil.com/entry/bolsonaro-ataques-imprensa-fake-news_br_5c3b4cdde4b01c93e00abdfb', NULL, '2020-07-18 00:43:37', NULL),
(36, 'huffnb12', 'Redação', 'Huffpost Brasil', NULL, '2018-10-24', NULL, NULL, NULL, '‘Kit gay’: A verdade sobre o programa alvo de críticas e fake news de Bolsonaro', 'Candidato trouxe tema para a campanha; TSE proibiu vídeos sobre o \'kit gay\' por desinformação', 'https://www.huffpostbrasil.com/2018/10/24/kit-gay-a-verdade-sobre-o-programa-alvo-de-criticas-e-fake-news-de-bolsonaro_a_23565210', NULL, '2020-07-18 00:51:49', NULL),
(37, 'elpmdt13', 'Afonso Benites', 'El País', NULL, '2018-10-28', NULL, NULL, NULL, 'A máquina de ‘fake news’ nos grupos a favor de Bolsonaro no WhatsApp', 'Reportagem do EL PAÍS acompanhou mobilização on-line por três semanas e detectou ativação para responder mídia, mentiras e teoria de conspiração', 'https://brasil.elpais.com/brasil/2018/09/26/politica/1537997311_859341.html', NULL, '2020-07-18 01:00:38', NULL),
(38, 'vilbol11', 'Marco Antônio Villa', 'YouTube', NULL, '2020-06-16', NULL, NULL, 37, 'Bolsonaro e a sua vocação para ditador', NULL, 'youtu.be/_Q00dgJpA2A', NULL, '2020-07-18 01:09:24', NULL),
(40, 'bugcha11', NULL, NULL, NULL, '2020-07-03', NULL, NULL, 19, 'Somos o Povo Mais Burro do Planeta!', NULL, 'youtu.be/QRbqXZVGB8o', 'Aos 8\', passa o trecho de uma palestra em que Marilena Chauí declara que odeia a classe média.', '2020-07-18 01:13:39', NULL);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
