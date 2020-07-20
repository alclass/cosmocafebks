-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 19-Jul-2020 às 22:02
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
(1, 'O Mistério dos Black Blocks em 2013', 'o-misterio-dos-black-blocks-em-2013', 1, 0, NULL, 1, '2020-07-03 01:06:48', '2020-07-19 23:36:58'),
(2, 'O Impeachment contra Dilma', 'o-impeachment-contra-dilma', 2, 0, NULL, 1, '2020-07-03 01:06:48', '2020-07-19 23:36:58'),
(3, 'O Engodo do Triplex', 'o-engodo-do-triplex', 3, 0, NULL, 1, '2020-07-03 01:06:48', '2020-07-19 23:36:58'),
(4, 'A Anticorrupção Como Manobra Política', 'a-anticorrupcao-como-manobra-politica', 4, 0, NULL, 1, '2020-07-03 01:06:48', '2020-07-19 23:36:58'),
(5, 'Da Lava Jato à Vazo Jato', 'da-lava-jato-a-vazo-jato', 5, 0, NULL, 1, '2020-07-03 01:06:48', '2020-07-19 23:36:58'),
(6, 'Os Precedentes de Bolsonaro', 'os-precedentes-de-bolsonaro', 6, 0, NULL, 1, '2020-07-03 01:06:48', '2020-07-19 23:36:58'),
(7, 'Fake News', 'fake-news', 7, 0, NULL, 1, '2020-07-03 01:06:48', '2020-07-19 23:36:58'),
(8, 'Bolsonaro Alto Traidor', 'bolsonaro-alto-traidor', 8, 0, NULL, 1, '2020-07-03 01:06:48', '2020-07-19 23:36:58'),
(9, 'A Ironia do Destino de Moro', 'a-ironia-do-destino-de-moro', 9, 0, NULL, 1, '2020-07-03 01:06:48', '2020-07-19 23:36:58'),
(10, 'A Reunião Infernal', 'a-reuniao-infernal', 10, 0, NULL, 1, '2020-07-03 01:06:48', '2020-07-19 23:36:58'),
(11, 'Queiroz e Wassef', 'queiroz-e-wassef', 11, 0, NULL, 1, '2020-07-03 01:06:48', '2020-07-19 23:36:58'),
(12, 'Mariele Vive', 'mariele-vive', 12, 0, NULL, 1, '2020-07-03 01:06:48', '2020-07-19 23:36:58'),
(13, 'A Fuga de Weintraub', 'a-fuga-de-weintraub', 13, 0, NULL, 1, '2020-07-03 01:06:48', '2020-07-19 23:36:59'),
(14, 'Coronavírus', 'coronavirus', 14, 0, NULL, 1, '2020-07-03 01:06:49', '2020-07-19 23:36:59'),
(15, 'Milicianismo', 'milicianismo', 15, 0, NULL, 1, '2020-07-03 01:06:49', '2020-07-19 23:36:59'),
(16, 'As Suspeitas sobre Guedes', 'as-suspeitas-sobre-guedes', 16, 0, NULL, 1, '2020-07-03 01:06:49', '2020-07-19 23:36:59'),
(17, 'Um Assalto Continental', 'um-assalto-continental', 17, 0, NULL, 1, '2020-07-03 01:06:49', '2020-07-19 23:36:59'),
(18, 'Facistas ou Enganados', 'facistas-ou-enganados', 18, 0, NULL, 1, '2020-07-03 01:06:49', '2020-07-19 23:36:59'),
(19, 'Terra Arrasada', 'terra-arrasada', 19, 0, NULL, 1, '2020-07-03 01:06:49', '2020-07-19 23:36:59'),
(20, 'O Quadruplo Desafio', 'o-quadruplo-desafio', 20, 0, NULL, 1, '2020-07-03 01:06:49', '2020-07-19 23:36:59'),
(21, 'O Dever do Ser Humano', 'o-dever-do-ser-humano', 21, 0, NULL, 1, '2020-07-03 01:06:49', '2020-07-19 23:36:59'),
(22, 'Esperança', 'esperanca', 22, 0, NULL, 1, '2020-07-03 01:06:49', '2020-07-19 23:36:59'),
(23, 'Princípio de Precaução', 'principio-de-precaucao', 23, 0, NULL, 1, '2020-07-03 01:06:49', '2020-07-19 23:21:08');

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
  `typeid` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
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

INSERT INTO `docrefs` (`id`, `typeid`, `tokid`, `authors`, `origins`, `program`, `refdate`, `year`, `trecho_min`, `total_min`, `title`, `subtitle`, `url`, `obs`, `created_at`, `updated_at`) VALUES
(1, 1, 'elpmdt11', 'Afonso Benites, Beatriz Jucá, Rodolfo Borges', 'El País', NULL, '2020-04-16', NULL, NULL, NULL, 'Mandetta é demitido por Bolsonaro', NULL, 'https://brasil.elpais.com/sociedade/2020-04-16/mandetta-e-demitido-por-bolsonaro.html', NULL, '2020-07-05 02:39:53', '2020-07-05 18:31:48'),
(2, 1, 'uolmai01', 'Marcelo Oliveira', 'UOL', NULL, '2020-07-04', NULL, NULL, NULL, 'Deltan deixou claro que Lava Jato é um movimento político, diz Maia', NULL, 'https://noticias.uol.com.br/politica/ultimas-noticias/2020/07/04/deltan-deixou-claro-que-lava-jato-e-um-movimento-politico-diz-maia.htm', NULL, '2020-07-05 03:06:55', NULL),
(3, 3, 'vidvil11', 'Marco Antônio Villa', NULL, NULL, '2020-07-04', NULL, 2, 29, 'Bolsonaro não respeita o Brasil', NULL, 'youtu.be/3kMc1Sqs6j0', '', '2020-07-05 18:06:38', NULL),
(4, 1, 'elpmdt12', 'Almudena Barragán', 'El País', NULL, '2018-10-19', NULL, NULL, NULL, 'Cinco ‘fake news’ que beneficiaram a candidatura de Bolsonaro', 'Na reta final da campanha presidencial, boatos sobre os adversários do ultradireitista aumentaram nas redes sociais', 'https://brasil.elpais.com/brasil/2018/10/18/actualidad/1539847547_146583.html', NULL, '2020-07-05 18:33:39', '2020-07-18 15:58:55'),
(5, 1, 'cagmet11', 'cagometro.com', NULL, NULL, '2020-04-16', NULL, NULL, NULL, 'Mandetta é demitido por Bolsonaro', 'Decisão de presidente foi anunciada no Twitter pelo agora ex-ministro. Nelson Teich comandará Ministério da Saúde. Mandatário diz que exoneração acontecerá “nas próximas horas”', 'http://www.cagometro.com/abril2020/mandetta-e-demitido-por-bolsonaro', NULL, '2020-07-05 19:09:49', NULL),
(6, 1, 'oglgri11', 'Marco Grillo', 'O Globo', NULL, '2020-06-10', NULL, NULL, NULL, '\'Cobre do seu governador, sai daqui\', diz Bolsonaro a eleitora que o criticou por atitudes durante pandemia', '\'Sinto que o senhor traiu nossa população\', afirma funcionaria de gabinete de vereador do MBL a presidente no Palácio da Alvorada', 'https://oglobo.globo.com/brasil/cobre-do-seu-governador-sai-daqui-diz-bolsonaro-eleitora-que-criticou-por-atitudes-durante-pandemia-24472272', NULL, '2020-07-05 19:16:55', NULL),
(7, 6, 'glg1jn11', NULL, 'Rede Globo', 'Jornal Nacional', '2020-06-22', NULL, NULL, NULL, 'Empresas ligadas à ex de Frederick Wassef têm contratos milionários com o governo', 'Empresa, ligada a Maria Cristina Boner Leo, ex-mulher e sócia do advogado que defendeu o senador Flávio Bolsonaro, recebeu R$ 41,6 milhões durante a gestão de Jair Bolsonaro', 'https://g1.globo.com/jornal-nacional/noticia/2020/06/22/empresas-ligadas-a-ex-de-frederick-wassef-tem-contratos-milionarios-com-o-governo.ghtml', NULL, '2020-07-05 23:27:36', '2020-07-18 16:12:34'),
(8, 1, 'oandan11', 'Claudio Dantas', 'O Antagonista', NULL, '2020-06-23', NULL, NULL, NULL, 'Exclusivo: advogado de Bolsonaro, Wassef vende consultoria a empresa com interesses no governo', NULL, 'https://www.oantagonista.com/brasil/exclusivo-advogado-de-bolsonaro-wassef-vende-consultoria-a-empresa-com-interesses-no-governo', NULL, '2020-07-05 23:29:12', NULL),
(9, 1, 'forred11', 'Redação', 'Revista Forum', NULL, '2020-07-05', NULL, NULL, NULL, 'Wassef ameaça e diz guardar a “sete chaves” provas de relação com Bolsonaro “que ninguém nem sonha”', 'Advogado do clã Bolsonaro que escondeu Queiroz, Wassef diz a interlocutores que em breve dará entrevista à TV sobre a morte do miliciano Adriano Nóbrega que vai \"explodir todo mundo em rede nacional\"', 'https://revistaforum.com.br/politica/bolsonaro/wassef-ameaca-e-diz-guardar-a-sete-chaves-provas-de-relacao-com-bolsonaro-que-ninguem-nem-sonha', NULL, '2020-07-05 23:32:40', NULL),
(10, 3, 'porjos12', 'José Fernandes da Silva', 'YouTube', 'Portal do José', '2020-07-05', NULL, 4, 14, 'PF perto de Guedes! Bolsonaro e seu Patrão - A morte acima de tudo! 200 mil vítimas! Feder fedeu!', NULL, 'youtu.be/8Sz-BVP456s9', 'O ponto alta é a mostra da matéria em O Globo que veicula a notícia de que a Operação Greenfield \"segue em velocidade de cruzeiro a investigação contra Paulo Guedes por suspeitas de ter participado de fraudes em fundos de pensão por meio da gestora da qual era sócio, antes de ser ministro\". Repassa entrevista antiga com o deputado do PDT, Paulo Ramos, que investiga Guedes. Esta entrevista está em https://www.youtube.com/watch?v=adyqoSyqTAU', '2020-07-06 01:00:22', NULL),
(11, 3, 'porjos13', 'José Fernandes da Silva', 'Portal do José', NULL, '2020-01-22', NULL, NULL, NULL, 'GUEDES: APLAUDIDO LÁ e INVESTIGADO CÁ! PAULO RAMOS REVELA QUEM É O VERDADEIRO MINISTRO DE BOLSONARO!', 'DEPUTADO PAULO RAMOS REVELA QUEM É GUEDES', 'youtu.be/adyqoSyqTAU', NULL, '2020-07-06 01:03:28', NULL),
(12, 1, 'ogllau11', 'Gabriel Mascarenhas', 'O Globo', 'Coluna Lauro Jardim', '2020-07-05', NULL, NULL, NULL, 'Investigação da Greenfield sobre Paulo Guedes avança', NULL, 'https://blogs.oglobo.globo.com/lauro-jardim/post/investigacao-da-greenfield-sobre-paulo-guedes-avanca.html', NULL, '2020-07-06 01:09:24', NULL),
(13, 7, 'oedrei12', 'Reinaldo Azevedo', 'BandNews', 'O É da Coisa', '2020-06-19', NULL, NULL, 13, 'Weintraub é ridículo até ao sair, mas será premiado', NULL, 'youtu.be/5s5Ho-llvIw', 'Neste trecho, 13\', Reinaldo Azevedo destrói forte Abraham Weintraub', '2020-07-06 02:00:57', NULL),
(14, 1, 'opmuol12', 'Ricardo Viel', 'Opera Mundi', NULL, '2019-07-29', NULL, NULL, NULL, 'O bolsonarismo é o neofacismo adaptado ao Brasil do século 21', 'Para Manuel Loff, estudioso português de governos autoritários, bolsonarismo soma “nostalgia da ditadura, discurso sobre a corrupção” e “ligação ao mundo evangélico”', 'https://operamundi.uol.com.br/politica-e-economia/59687/o-bolsonarismo-e-o-neofacismo-adaptado-ao-brasil-do-seculo-21', NULL, '2020-07-06 02:54:24', NULL),
(15, 1, 'fsppan11', NULL, 'Folha SP', 'Painel', '2020-07-12', NULL, NULL, NULL, 'PSOL entra com queixa-crime contra Bolsonaro por atuação na pandemia', 'Partido argumenta que Bolsonaro minimizou a Covid-19 e desrespeitou repetidamente as regras de contenção da doença, colocando em risco a vida da população', 'https://www1.folha.uol.com.br/colunas/painel/2020/07/psol-entra-com-queixa-crime-contra-bolsonaro-por-atuacao-na-pandemia.shtml', NULL, '2020-07-12 20:36:20', NULL),
(16, 3, 'bugbol14', 'Henry Bugalho', 'YouTube', NULL, '2020-07-08', NULL, NULL, 21, 'Bolsonaro e o Ódio Que Nos Une!', NULL, 'youtu.be/Yn6UkvFi8Yw', 'Comentário sobre o artigo por Hélio Schwartzman em que escreve: torço para que Bolsonaro, tendo pego o Coronavírus, mora. O problema do trem, famoso da palestra por Michael Sandel. Et al.', '2020-07-12 23:59:22', '2020-07-20 00:37:51'),
(17, 3, 'pormbl11', 'José Fernandes', 'YouTube', 'Portal do José', '2020-07-13', NULL, NULL, NULL, 'Pane na Direita', '\"Guedes é um Bo$ta a serviço de corruptos\": Diz MBL! Como enfrentar vinganças?', 'youtu.be/_f2FvputC2w', NULL, '2020-07-14 23:56:00', NULL),
(18, 6, 'rdvfel11', NULL, 'TV Cultura', 'Roda Viva Entrevista', '2020-05-18', NULL, NULL, NULL, 'Roda Viva com Felipe Neto', NULL, 'youtu.be/KQ1CQqNveac', NULL, '2020-07-14 23:56:00', NULL),
(19, 2, 'bibmt716', 'Mateus capítulo 7 versículo 16', 'Bíblia Cristã', NULL, NULL, NULL, NULL, NULL, 'Por Seus Frutos, Vós Os Conhecereis', NULL, 'https://www.bibliaonline.com.br/acf/mt/7/16-20', NULL, '2020-07-15 00:00:44', NULL),
(20, 7, 'reilib11', 'Reinaldo Azevedo', 'BandNews', 'O É da Coisa', '2020-07-10', NULL, NULL, NULL, 'Não conter e não punir “fake news” é dar um tiro na própria cabeça', NULL, 'youtu.be/HJdSVVm_OQs', NULL, '2020-07-15 00:03:04', NULL),
(21, 7, 'reilvj13', 'Reinaldo Azevedo', 'BandNews', 'O É da Coisa', '2020-07-10', NULL, NULL, NULL, 'Lava Jato está triste - vai ter de seguir a lei pela 1ª vez...', NULL, 'youtu.be/cWLOEFmmWDs', NULL, '2020-07-15 00:05:59', NULL),
(22, 1, 'folcor11', 'Fernanda Mena', 'Folha SP', NULL, '2020-01-23', NULL, NULL, NULL, 'Sob Bolsonaro, Brasil repete pior nota em ranking de percepção do combate à corrupção', 'Promessas de campanha do presidente se converteram em mais retrocessos que avanços na pauta, aponta ONG', 'https://www1.folha.uol.com.br/poder/2020/01/sob-bolsonaro-brasil-repete-pior-nota-em-ranking-de-percepcao-do-combate-a-corrupcao.shtml', NULL, '2020-07-15 00:16:07', NULL),
(23, 1, 'bdfcor11', 'Redação', 'Brasil de Fato', NULL, NULL, NULL, NULL, NULL, 'Com Bolsonaro, Brasil mantém pior nota no combate à corrupção', 'Com a pontuação baixa, o país caiu mais uma posição em lista com 180 países, indo para o 106º lugar', 'https://www.brasildefato.com.br/2020/01/23/brasil-continua-com-a-pior-nota-quando-o-assunto-e-combate-a-corrupcao', NULL, '2020-07-15 00:19:50', NULL),
(24, 1, 'oglcor11', 'Rayanderson Guerra', 'O Globo', NULL, '2020-01-23', NULL, NULL, NULL, 'Governo tomou medidas que resultaram em retrocesso no combate à corrupção, avalia Transparência Internacional', NULL, 'https://oglobo.globo.com/brasil/governo-tomou-medidas-que-resultaram-em-retrocesso-no-combate-corrupcao-avalia-transparencia-internacional-24206817', NULL, '2020-07-15 00:24:10', NULL),
(25, 1, 'uolcor11', 'Jamil Chade', 'UOL', NULL, '2020-04-30', NULL, NULL, NULL, 'Ingerência presidencial em órgãos anti-corrupção e Amazônia preocupam OCDE', NULL, 'https://noticias.uol.com.br/colunas/jamil-chade/2020/04/30/ocde-critica-interferencia-de-bolsonaro-em-luta-anti-corrupcao-e-amazonia.htm', NULL, '2020-07-15 00:28:58', NULL),
(26, 1, '', 'Redação', 'Brasil 247', NULL, NULL, NULL, NULL, NULL, 'Bloomberg estampa catástrofe brasileira: hospitais transbordando, corrupção generalizada e um populista obcecado por cloroquina', NULL, 'https://www.brasil247.com/coronavirus/bloomberg-estampa-catastrofe-brasileira-hospitais-transbordando-corrupcao-generalizada-e-um-populista-obcecado-por-cloroquina', NULL, '2020-07-15 00:33:02', NULL),
(27, 1, 'blocor11', 'Julia Leite, Simone Iglesias, Martha Beck & Ethan Bronner', 'Bloomberg Businessweek', NULL, NULL, NULL, NULL, NULL, 'The Pandemic’s Worst-Case Scenario Is Unfolding in Brazil', 'Overflowing hospitals. Widespread corruption. And a chloroquine-obsessed populist in charge', 'https://www.bloomberg.com/news/features/2020-06-24/coronavirus-pandemic-brazil-faces-worst-case-scenario', NULL, '2020-07-15 00:36:37', NULL),
(28, 5, 'ttchss11', 'Richard B. Spence', 'TTC', NULL, NULL, 2019, NULL, NULL, 'The Real History of Secret Societies', NULL, 'https://www.thegreatcoursesplus.com/the-real-history-of-secret-societies', NULL, '2020-07-15 00:45:10', NULL),
(29, 3, 'fdlcir11', NULL, 'Fórum da Liberdade', NULL, NULL, 2008, NULL, NULL, 'Debate entre Ciro Gomes e Paulo Guedes no 21º Fórum da Liberdade', NULL, 'youtu.be/G8neGsOIh18', NULL, '2020-07-15 00:49:29', NULL),
(31, 7, 'reigil11', 'Reinaldo Azevedo', 'BandNews', 'O É da Coisa', '2020-07-14', NULL, NULL, 29, 'Generais confundem governo com quartel. Voltem para a caserna!', NULL, 'youtu.be/RoIcdolud60', 'Gilmar Mendes, em um ao-vivo, alerta aos militares: \"cuidado para não se associarem a um genocídio\"', '2020-07-16 00:14:03', NULL),
(32, 4, 'brde4388', '', 'Decreto nº 4.388 de 2002 (Estatuto de Roma)', NULL, '2002-09-25', NULL, NULL, NULL, 'Estatuto de Roma', 'Promulga o Estatuto de Roma do Tribunal Penal Internacional', 'http://www.planalto.gov.br/ccivil_03/decreto/2002/d4388.htm', NULL, '2020-07-16 00:43:23', NULL),
(33, 1, 'g1ggen11', 'Redação', 'G1', NULL, '2019-09-24', NULL, NULL, NULL, 'Número de assassinatos de indígenas cresce 20% no Brasil em 2018, aponta relatório do Cimi', NULL, 'https://g1.globo.com/natureza/noticia/2019/09/24/numero-de-assassinatos-de-indigenas-cresce-20percent-no-brasil-em-2018-aponta-relatorio.ghtml', NULL, '2020-07-16 00:59:35', NULL),
(34, 3, 'vilind11', 'Marco Antônio Villa', 'YouTube', NULL, '2020-07-15', NULL, NULL, 26, 'Bolsonaro - a irracionalidade no poder', NULL, 'youtu.be/ibaiu5ekROE', 'Entre vários pontos da fala:\r\n- o ministro da Defesa quer processar Gilmar Mendes com a Lei de Segurança Nacional e até o Código Penal Militar; Villa: \"isto aqui não é Monty Python para rir..\"\r\n- John Bolton. ex-assessor de Trump, sugere a Bolsonaro a abrir canais com Biden, Bolton esteve nas Vivendas da Barra;\r\n- o novo ministro da Educação manda surrar as crianças;\r\n- Pazuello não entende nada de Saúde;\r\n- o futuro da nação sendo jogado no lixo;\r\n- JB diz que Pazuello é um pré-destinado, Villa (Folha, G1 etc.): \'alto lá\';\r\n- presidente estava informado pela tragédia, logo é responsável e cometeu genocídio;\r\n- partícipe indireto das mortes.\r\n- lembra do ex-recepcionista em Pernambuco que virou funcionário fantasma de Bolsonaro;', '2020-07-16 01:15:20', '2020-07-20 00:50:04'),
(35, 1, 'huffnb11', 'Débora Melo, Marcella Fernandes', 'Huffpost Brasil', NULL, '2019-01-14', NULL, NULL, NULL, 'Estratégia de Bolsonaro, que inclui fake news e ataques à imprensa, é \'problemática\'', 'Ao fazer das redes sociais canal oficial de comunicação do governo, presidente se mantém no palanque e evita questionamentos', 'https://www.huffpostbrasil.com/entry/bolsonaro-ataques-imprensa-fake-news_br_5c3b4cdde4b01c93e00abdfb', NULL, '2020-07-18 00:43:37', NULL),
(36, 1, 'huffnb12', 'Redação', 'Huffpost Brasil', NULL, '2018-10-24', NULL, NULL, NULL, '‘Kit gay’: A verdade sobre o programa alvo de críticas e fake news de Bolsonaro', 'Candidato trouxe tema para a campanha; TSE proibiu vídeos sobre o \'kit gay\' por desinformação', 'https://www.huffpostbrasil.com/2018/10/24/kit-gay-a-verdade-sobre-o-programa-alvo-de-criticas-e-fake-news-de-bolsonaro_a_23565210', NULL, '2020-07-18 00:51:49', NULL),
(37, 1, 'elpmdt13', 'Afonso Benites', 'El País', NULL, '2018-10-28', NULL, NULL, NULL, 'A máquina de ‘fake news’ nos grupos a favor de Bolsonaro no WhatsApp', 'Reportagem do EL PAÍS acompanhou mobilização on-line por três semanas e detectou ativação para responder mídia, mentiras e teoria de conspiração', 'https://brasil.elpais.com/brasil/2018/09/26/politica/1537997311_859341.html', NULL, '2020-07-18 01:00:38', NULL),
(38, 3, 'vilbol11', 'Marco Antônio Villa', 'YouTube', NULL, '2020-06-16', NULL, NULL, 37, 'Bolsonaro e a sua vocação para ditador', NULL, 'youtu.be/_Q00dgJpA2A', NULL, '2020-07-18 01:09:24', NULL),
(40, 3, 'bugcha11', 'Henry Bugalho', 'YouTube', NULL, '2020-07-03', NULL, NULL, 19, 'Somos o Povo Mais Burro do Planeta!', NULL, 'youtu.be/QRbqXZVGB8o', 'Aos 8\', passa o trecho de uma palestra em que Marilena Chauí declara que odeia a classe média.', '2020-07-18 01:13:39', NULL),
(41, 2, 'oyotor11', 'Thaís Oyama', 'Companhia das Letras', NULL, NULL, 2020, NULL, NULL, 'Tormenta - O governo Bolsonaro: crises, intrigas e segredos', NULL, 'https://www.companhiadasletras.com.br/detalhe.php?codigo=14665', NULL, '2020-07-18 15:47:44', NULL),
(42, 1, 'uoloyo12', 'Thaís Oyama', 'UOL', NULL, '2020-07-17', NULL, NULL, NULL, 'O Tédio de Bolsonaro e a Live Que Destroi', NULL, 'https://noticias.uol.com.br/colunas/thais-oyama/2020/07/17/o-tedio-de-bolsonaro-e-a-live-que-destroi.htm', NULL, '2020-07-18 19:38:19', NULL),
(43, 3, 'tonbol11', 'Tony Devito', 'YouTube', NULL, '2020-07-14', NULL, NULL, 13, 'Bolsonaro e Sua Indústria de Mentiras Cabeludas!', NULL, 'youtu.be/wmWGYQBU_5Q', NULL, '2020-07-18 19:58:09', NULL),
(44, 2, 'gopt1984', 'George Orwell', 'Companhia Editora Nacional', NULL, NULL, 2005, NULL, NULL, '1984 (29ªEd)', NULL, NULL, NULL, '2020-07-18 20:02:51', NULL),
(45, 2, 'orig1984', 'George Orwell', 'Harvill Secker publisher', NULL, NULL, 1949, NULL, NULL, '1984', NULL, 'https://archive.org/details/Orwell1984preywo', NULL, '2020-07-18 21:43:19', NULL),
(46, 1, 'gazorw11', 'Maurício Brum', 'Gazeta do Povo', NULL, '2017-09-12', NULL, NULL, NULL, '7 exemplos de que estamos vivendo em 1984, o livro', 'Publicada em 1949, a obra se tornou uma clássica metáfora para temas como regimes totalitários, vigilância massiva e propaganda estatal', 'https://www.gazetadopovo.com.br/ideias/7-exemplos-de-que-estamos-vivendo-em-1984-o-livro-abrh48bezzt18y7f1h9087x6s', NULL, '2020-07-19 01:11:43', NULL),
(47, 1, 'nexorw11', 'Juliana Domingos', 'Nexo Jornal', NULL, '2017-01-29', NULL, NULL, NULL, 'Por que o livro 1984 está de volta. E o que isso diz sobre o presente', NULL, 'https://www.nexojornal.com.br/expresso/2017/01/29/Por-que-o-livro-%E2%80%981984%E2%80%99-est%C3%A1-de-volta.-E-o-que-isso-diz-sobre-o-presente', NULL, '2020-07-19 01:17:54', NULL),
(48, 1, 'prapol11', 'Redação', 'Pragmatismo Político', NULL, '2018-11-08', NULL, NULL, NULL, 'Com a vitória de Bolsonaro, o Brasil entrou para o rol dos países que, nos últimos anos, elegeram governantes alinhados a tendências populistas e de extrema direita', NULL, 'https://www.pragmatismopolitico.com.br/2018/11/brasil-paises-populistas-de-direita.html', NULL, '2020-07-19 01:35:50', NULL),
(49, 1, 'folmdi11', 'Matheus Teixeira', 'Folha SP', NULL, '2020-07-14', NULL, NULL, NULL, 'Gilmar cita genocídio de índios e volta a criticar excesso de militares no Ministério da Saúde', 'Ministro do STF criticou governo federal por tentar se eximir de responsabilidade na pandemia', 'www1.folha.uol.com.br/poder/2020/07/gilmar-fala-em-genocidio-de-indios-e-volta-a-criticar-excesso-de-militares-no-ministerio-da-saude.shtml', NULL, '2020-07-20 00:32:12', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `reftypes`
--

CREATE TABLE `reftypes` (
  `id` tinyint(4) NOT NULL,
  `description` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='It keeps name description for reftypes (livro, vídeo, etc.)';

--
-- Extraindo dados da tabela `reftypes`
--

INSERT INTO `reftypes` (`id`, `description`, `created_at`, `updated_at`) VALUES
(1, 'artigo', '2020-07-18 15:53:30', NULL),
(2, 'livro', '2020-07-18 15:53:30', NULL),
(3, 'vídeo público', '2020-07-18 15:54:07', NULL),
(4, 'legislação', '2020-07-18 16:08:51', NULL),
(5, 'videocurso', '2020-07-18 16:11:07', NULL),
(6, 'programa de TV', '2020-07-18 16:12:57', NULL),
(7, 'programa de rádio', '2020-07-18 16:14:57', NULL);

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
-- Índices para tabela `reftypes`
--
ALTER TABLE `reftypes`
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de tabela `reftypes`
--
ALTER TABLE `reftypes`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
