-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Ноя 03 2015 г., 09:34
-- Версия сервера: 5.6.24
-- Версия PHP: 5.5.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `news`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Քաղաքական'),
(2, 'Միջազգային'),
(3, 'Մշակույթ'),
(4, 'Սպորտ'),
(5, 'Ժամանց'),
(6, 'Մամուլ');

-- --------------------------------------------------------

--
-- Структура таблицы `category_relations`
--

CREATE TABLE IF NOT EXISTS `category_relations` (
  `id` int(11) NOT NULL,
  `news_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category_relations`
--

INSERT INTO `category_relations` (`id`, `news_id`, `category_id`) VALUES
(13, 5, 5),
(23, 2, 3),
(24, 2, 4),
(25, 1, 1),
(26, 1, 2),
(27, 3, 4),
(30, 8, 4),
(37, 11, 3),
(38, 11, 6),
(39, 10, 2),
(40, 10, 5),
(41, 9, 2),
(42, 6, 3),
(43, 7, 1),
(44, 7, 2),
(45, 7, 3),
(46, 7, 4),
(47, 7, 5),
(48, 7, 6),
(49, 4, 1),
(50, 4, 2),
(51, 4, 3),
(52, 4, 4),
(53, 4, 5),
(54, 4, 6),
(55, 12, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1446537202),
('m151025_092801_creating_newses_table', 1446537204),
('m151025_093956_creating_category_table', 1446537204),
('m151025_094219_creating_category_rel_table', 1446537205);

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text,
  `video` varchar(255) DEFAULT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `published` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_published` tinyint(1) DEFAULT '0',
  `important` tinyint(1) DEFAULT '0',
  `hits` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `video`, `meta_key`, `created`, `published`, `is_published`, `important`, `hits`) VALUES
(1, 'Lorem ipsum dolor sit amet', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer non nisi massa. Quisque et purus diam. Nullam vitae dui ac turpis bibendum sollicitudin aliquam in mi. Nulla velit arcu, dapibus sed neque id, accumsan finibus neque. Vivamus semper lacus et placerat ultricies. Mauris maximus luctus orci, at blandit turpis luctus et. Cras efficitur pharetra tincidunt. Ut aliquam ante ac sapien auctor pellentesque. Integer ultricies leo at nibh posuere, eget semper neque interdum. Praesent orci sapien, dignissim nec consectetur et, tempus non lacus. Mauris commodo, lacus eu feugiat tristique, nisl ante ultricies lectus, porttitor vulputate neque nibh at est. Sed in pulvinar augue.</p>\r\n\r\n<p>Sed non magna ultricies risus lobortis sodales. Quisque scelerisque lorem eros, a pellentesque purus iaculis ac. Curabitur quis porttitor nulla. Suspendisse potenti. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut sit amet quam facilisis, varius dui in, blandit ipsum. Aenean elementum, libero a porttitor interdum, orci turpis faucibus augue, in malesuada libero eros non massa. Nulla mattis urna tortor, quis cursus felis venenatis non. Vivamus consequat ex massa, sed gravida justo ultrices et. Phasellus mattis metus leo, sit amet commodo mi tincidunt non.</p>\r\n\r\n<p>Donec non fermentum erat. Nulla a nulla odio. Nullam in lacinia sapien, et aliquet diam. Mauris vehicula tempus neque, non lacinia augue porta fermentum. Vivamus dolor massa, bibendum eu vulputate ac, congue id enim. Fusce nec lectus vulputate, varius ex id, pellentesque tellus. Suspendisse luctus convallis sagittis. Aenean condimentum feugiat enim a auctor. Sed nec felis eros. Vestibulum faucibus massa at ipsum ullamcorper bibendum. Integer ultricies dapibus ex ut pretium. Curabitur faucibus erat nec lacinia pharetra. Pellentesque rhoncus, sem quis ultricies tincidunt, magna leo sodales libero, id tristique velit lectus eget nisi. Aliquam erat volutpat. Cras ac elit eget ante cursus pulvinar. Nullam scelerisque sapien quam, ut malesuada arcu cursus nec.</p>\r\n\r\n<p>Vestibulum pellentesque elit at justo rutrum ultricies. Aliquam faucibus, sem eu scelerisque gravida, est turpis malesuada velit, non condimentum nunc elit vel ipsum. Praesent sit amet tortor quis neque volutpat viverra nec a sem. Sed eget tellus eget diam auctor cursus. Aenean rhoncus, neque vitae sodales viverra, metus augue porttitor ante, quis efficitur odio est id mi. Maecenas molestie sit amet sapien at pretium. Aliquam nisi nunc, fringilla scelerisque tincidunt ut, luctus ac eros. Cras tristique ligula erat, sed convallis dolor pulvinar non.</p>\r\n\r\n<p>Donec sit amet posuere sem, at hendrerit nulla. Etiam a c</p>\r\n', '', '', '2015-11-03 08:07:50', '2015-11-03 05:14:28', 1, 1, 0),
(2, 'Neque porro quisquam est qui dolorem ipsum ', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer non nisi massa. Quisque et purus diam. Nullam vitae dui ac turpis bibendum sollicitudin aliquam in mi. Nulla velit arcu, dapibus sed neque id, accumsan finibus neque. Vivamus semper lacus et placerat ultricies. Mauris maximus luctus orci, at blandit turpis luctus et. Cras efficitur pharetra tincidunt. Ut aliquam ante ac sapien auctor pellentesque. Integer ultricies leo at nibh posuere, eget semper neque interdum. Praesent orci sapien, dignissim nec consectetur et, tempus non lacus. Mauris commodo, lacus eu feugiat tristique, nisl ante ultricies lectus, porttitor vulputate neque nibh at est. Sed in pulvinar augue.</p>\r\n\r\n<p>Sed non magna ultricies risus lobortis sodales. Quisque scelerisque lorem eros, a pellentesque purus iaculis ac. Curabitur quis porttitor nulla. Suspendisse potenti. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut sit amet quam facilisis, varius dui in, blandit ipsum. Aenean elementum, libero a porttitor interdum, orci turpis faucibus augue, in malesuada libero eros non massa. Nulla mattis urna tortor, quis cursus felis venenatis non. Vivamus consequat ex massa, sed gravida justo ultrices et. Phasellus mattis metus leo, sit amet commodo mi tincidunt non.</p>\r\n\r\n<p>Donec non fermentum erat. Nulla a nulla odio. Nullam in lacinia sapien, et aliquet diam. Mauris vehicula tempus neque, non lacinia augue porta fermentum. Vivamus dolor massa, bibendum eu vulputate ac, congue id enim. Fusce nec lectus vulputate, varius ex id, pellentesque tellus. Suspendisse luctus convallis sagittis. Aenean condimentum feugiat enim a auctor. Sed nec felis eros. Vestibulum faucibus massa at ipsum ullamcorper bibendum. Integer ultricies dapibus ex ut pretium. Curabitur faucibus erat nec lacinia pharetra. Pellentesque rhoncus, sem quis ultricies tincidunt, magna leo sodales libero, id tristique velit lectus eget nisi. Aliquam erat volutpat. Cras ac elit eget ante cursus pulvinar. Nullam scelerisque sapien quam, ut malesuada arcu cursus nec.</p>\r\n\r\n<p>Vestibulum pellentesque elit at justo rutrum ultricies. Aliquam faucibus, sem eu scelerisque gravida, est turpis malesuada velit, non condimentum nunc elit vel ipsum. Praesent sit amet tortor quis neque volutpat viverra nec a sem. Sed eget tellus eget diam auctor cursus. Aenean rhoncus, neque vitae sodales viverra, metus augue porttitor ante, quis efficitur odio est id mi. Maecenas molestie sit amet sapien at pretium. Aliquam nisi nunc, fringilla scelerisque tincidunt ut, luctus ac eros. Cras tristique ligula erat, sed convallis dolor pulvinar non.</p>\r\n\r\n<p>Donec sit amet posuere sem, at hendrerit nulla. Etiam a c</p>\r\n', '', 'Neque porro quisquam est qui dolorem ipsum ', '2015-11-03 08:08:13', '2015-11-03 05:14:17', 1, 1, 0),
(3, 'quia dolor sit amet, consectetur, adipisci velit..." "There is no one who loves pain itself, who seeks after it and wants to hav', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce non tempor sapien, ac molestie nibh. Donec et consequat justo. Donec in turpis sed lorem cursus tempus vitae a turpis. Proin leo dolor, condimentum tincidunt nisi in, lacinia venenatis metus. Donec placerat mauris orci, et rhoncus ipsum pretium placerat. Vivamus imperdiet nulla ut lectus vestibulum, vel rhoncus quam vulputate. Aliquam erat volutpat. Phasellus ornare dolor eu tempus lacinia. Mauris urna dui, hendrerit vitae justo id, ultrices lacinia nisl. Etiam at convallis nisi, sed eleifend odio. Sed ac gravida mauris. Sed congue justo eget sapien pretium fringilla. Curabitur scelerisque felis metus, sit amet tincidunt elit commodo vel. Nam nibh quam, scelerisque vel pharetra eu, hendrerit in enim. Donec consectetur justo vitae ullamcorper tincidunt. Phasellus id convallis lectus.</p>\r\n\r\n<p>Etiam varius erat eu ipsum hendrerit porttitor. Suspendisse imperdiet purus nibh, sit amet varius orci bibendum id. Proin in est turpis. Duis ac enim eu purus vestibulum molestie. Nam lobortis a lorem non facilisis. Proin eu varius erat. Quisque massa ipsum, venenatis a hendrerit eu, feugiat nec odio. Mauris pretium scelerisque nisl quis rhoncus. Aenean placerat nunc at lacus congue, sit amet varius risus bibendum. Nulla eu ex id lectus iaculis pretium. Etiam ultrices, neque non dictum laoreet, magna eros faucibus lacus, et bibendum odio magna ut est.</p>\r\n\r\n<p>Curabitur in tellus sed eros maximus suscipit in sed erat. Nunc consequat molestie nibh, at egestas ante maximus vitae. Ut scelerisque vulputate blandit. Aliquam ultrices sapien nec magna malesuada rutrum. Fusce varius nunc est, vitae luctus justo viverra ut. Donec sit amet augue bibendum, iaculis urna nec, imperdiet nulla. Quisque laoreet, metus sed ullamcorper dapibus, justo enim faucibus odio, vitae porta felis ligula nec nisl. Duis varius bibendum felis, sed porta eros dignissim at. Aliquam sed placerat felis. In consequat tortor ex, et maximus neque mattis ac. Nam euismod est sed posuere eleifend. Morbi vitae rhoncus turpis.</p>\r\n\r\n<p>Curabitur sodales urna quam, quis tristique nulla laoreet eu. Proin a magna felis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam fermentum dolor vitae leo maximus bibendum. Fusce bibendum elit erat, nec blandit ipsum feugiat a. Duis at eleifend urna, sit amet faucibus magna. Maecenas consequat massa eu turpis iaculis, sed fermentum elit egestas. Aenean in massa urna. Sed nec blandit lorem. Maecenas a orci ac libero rhoncus iaculis.</p>\r\n\r\n<p>Interdum et malesuada fames ac ante ipsum primis in faucibus. In rutrum sem in lorem interdum, a tempus lectus vehicula. Etiam eu lorem augue. Proin lacinia feugiat dui vitae interdum. Aenean eleifend, est eget elementum finibus, velit libero sollicitudin lacus, at euismod elit erat eget mi. Nulla vestibulum, libero nec auctor ornare, mauris nisl cursus quam, ac ullamcorper lacus lorem vitae ante. Integer dignissim nulla ut nisi fringilla, quis blandit eros volutpat. Donec elit nulla, condimentum eu fermentum vitae, pretium ac sem. Ut ut tellus fringilla, vestibulum magna ut, mattis arcu. Sed diam mauris, scelerisque sit amet ornare nec, rutrum vitae magna.</p>\r\n', '', '', '2015-11-03 08:08:44', '2015-11-03 05:14:40', 1, 1, 0),
(4, 'Curabitur sodales urna quam, quis tristique nulla laoreet eu. Proin a magna felis', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce non tempor sapien, ac molestie nibh. Donec et consequat justo. Donec in turpis sed lorem cursus tempus vitae a turpis. Proin leo dolor, condimentum tincidunt nisi in, lacinia venenatis metus. Donec placerat mauris orci, et rhoncus ipsum pretium placerat. Vivamus imperdiet nulla ut lectus vestibulum, vel rhoncus quam vulputate. Aliquam erat volutpat. Phasellus ornare dolor eu tempus lacinia. Mauris urna dui, hendrerit vitae justo id, ultrices lacinia nisl. Etiam at convallis nisi, sed eleifend odio. Sed ac gravida mauris. Sed congue justo eget sapien pretium fringilla. Curabitur scelerisque felis metus, sit amet tincidunt elit commodo vel. Nam nibh quam, scelerisque vel pharetra eu, hendrerit in enim. Donec consectetur justo vitae ullamcorper tincidunt. Phasellus id convallis lectus.</p>\r\n\r\n<p>Etiam varius erat eu ipsum hendrerit porttitor. Suspendisse imperdiet purus nibh, sit amet varius orci bibendum id. Proin in est turpis. Duis ac enim eu purus vestibulum molestie. Nam lobortis a lorem non facilisis. Proin eu varius erat. Quisque massa ipsum, venenatis a hendrerit eu, feugiat nec odio. Mauris pretium scelerisque nisl quis rhoncus. Aenean placerat nunc at lacus congue, sit amet varius risus bibendum. Nulla eu ex id lectus iaculis pretium. Etiam ultrices, neque non dictum laoreet, magna eros faucibus lacus, et bibendum odio magna ut est.</p>\r\n\r\n<p>Curabitur in tellus sed eros maximus suscipit in sed erat. Nunc consequat molestie nibh, at egestas ante maximus vitae. Ut scelerisque vulputate blandit. Aliquam ultrices sapien nec magna malesuada rutrum. Fusce varius nunc est, vitae luctus justo viverra ut. Donec sit amet augue bibendum, iaculis urna nec, imperdiet nulla. Quisque laoreet, metus sed ullamcorper dapibus, justo enim faucibus odio, vitae porta felis ligula nec nisl. Duis varius bibendum felis, sed porta eros dignissim at. Aliquam sed placerat felis. In consequat tortor ex, et maximus neque mattis ac. Nam euismod est sed posuere eleifend. Morbi vitae rhoncus turpis.</p>\r\n\r\n<p>Curabitur sodales urna quam, quis tristique nulla laoreet eu. Proin a magna felis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam fermentum dolor vitae leo maximus bibendum. Fusce bibendum elit erat, nec blandit ipsum feugiat a. Duis at eleifend urna, sit amet faucibus magna. Maecenas consequat massa eu turpis iaculis, sed fermentum elit egestas. Aenean in massa urna. Sed nec blandit lorem. Maecenas a orci ac libero rhoncus iaculis.</p>\r\n\r\n<p>Interdum et malesuada fames ac ante ipsum primis in faucibus. In rutrum sem in lorem interdum, a tempus lectus vehicula. Etiam eu lorem augue. Proin lacinia feugiat dui vitae interdum. Aenean eleifend, est eget elementum finibus, velit libero sollicitudin lacus, at euismod elit erat eget mi. Nulla vestibulum, libero nec auctor ornare, mauris nisl cursus quam, ac ullamcorper lacus lorem vitae ante. Integer dignissim nulla ut nisi fringilla, quis blandit eros volutpat. Donec elit nulla, condimentum eu fermentum vitae, pretium ac sem. Ut ut tellus fringilla, vestibulum magna ut, mattis arcu. Sed diam mauris, scelerisque sit amet ornare nec, rutrum vitae magna.</p>\r\n', '', 'Curabitur sodales urna quam, quis tristique nulla laoreet eu. Proin a magna felis', '2015-11-03 08:09:02', '2015-11-03 05:28:03', 1, 0, 0),
(5, 'Donec placerat mauris orci, et rhoncus ipsum pretium placerat. Vivamus imperdiet nulla ut lectus vestibulum, vel rhoncus quam vulputate. Aliquam erat volutpat.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce non tempor sapien, ac molestie nibh. Donec et consequat justo. Donec in turpis sed lorem cursus tempus vitae a turpis. Proin leo dolor, condimentum tincidunt nisi in, lacinia venenatis metus. Donec placerat mauris orci, et rhoncus ipsum pretium placerat. Vivamus imperdiet nulla ut lectus vestibulum, vel rhoncus quam vulputate. Aliquam erat volutpat. Phasellus ornare dolor eu tempus lacinia. Mauris urna dui, hendrerit vitae justo id, ultrices lacinia nisl. Etiam at convallis nisi, sed eleifend odio. Sed ac gravida mauris. Sed congue justo eget sapien pretium fringilla. Curabitur scelerisque felis metus, sit amet tincidunt elit commodo vel. Nam nibh quam, scelerisque vel pharetra eu, hendrerit in enim. Donec consectetur justo vitae ullamcorper tincidunt. Phasellus id convallis lectus.</p>\r\n\r\n<p>Etiam varius erat eu ipsum hendrerit porttitor. Suspendisse imperdiet purus nibh, sit amet varius orci bibendum id. Proin in est turpis. Duis ac enim eu purus vestibulum molestie. Nam lobortis a lorem non facilisis. Proin eu varius erat. Quisque massa ipsum, venenatis a hendrerit eu, feugiat nec odio. Mauris pretium scelerisque nisl quis rhoncus. Aenean placerat nunc at lacus congue, sit amet varius risus bibendum. Nulla eu ex id lectus iaculis pretium. Etiam ultrices, neque non dictum laoreet, magna eros faucibus lacus, et bibendum odio magna ut est.</p>\r\n\r\n<p>Curabitur in tellus sed eros maximus suscipit in sed erat. Nunc consequat molestie nibh, at egestas ante maximus vitae. Ut scelerisque vulputate blandit. Aliquam ultrices sapien nec magna malesuada rutrum. Fusce varius nunc est, vitae luctus justo viverra ut. Donec sit amet augue bibendum, iaculis urna nec, imperdiet nulla. Quisque laoreet, metus sed ullamcorper dapibus, justo enim faucibus odio, vitae porta felis ligula nec nisl. Duis varius bibendum felis, sed porta eros dignissim at. Aliquam sed placerat felis. In consequat tortor ex, et maximus neque mattis ac. Nam euismod est sed posuere eleifend. Morbi vitae rhoncus turpis.</p>\r\n\r\n<p>Curabitur sodales urna quam, quis tristique nulla laoreet eu. Proin a magna felis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam fermentum dolor vitae leo maximus bibendum. Fusce bibendum elit erat, nec blandit ipsum feugiat a. Duis at eleifend urna, sit amet faucibus magna. Maecenas consequat massa eu turpis iaculis, sed fermentum elit egestas. Aenean in massa urna. Sed nec blandit lorem. Maecenas a orci ac libero rhoncus iaculis.</p>\r\n\r\n<p>Interdum et malesuada fames ac ante ipsum primis in faucibus. In rutrum sem in lorem interdum, a tempus lectus vehicula. Etiam eu lorem augue. Proin lacinia feugiat dui vitae interdum. Aenean eleifend, est eget elementum finibus, velit libero sollicitudin lacus, at euismod elit erat eget mi. Nulla vestibulum, libero nec auctor ornare, mauris nisl cursus quam, ac ullamcorper lacus lorem vitae ante. Integer dignissim nulla ut nisi fringilla, quis blandit eros volutpat. Donec elit nulla, condimentum eu fermentum vitae, pretium ac sem. Ut ut tellus fringilla, vestibulum magna ut, mattis arcu. Sed diam mauris, scelerisque sit amet ornare nec, rutrum vitae magna.</p>\r\n', '', '', '2015-11-03 08:09:22', '2015-11-03 05:09:22', 1, 0, 0),
(6, 'Curabitur in tellus sed eros maximus suscipit in sed erat. Nunc consequat molestie nibh, at egestas ante maximus vitae.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce non tempor sapien, ac molestie nibh. Donec et consequat justo. Donec in turpis sed lorem cursus tempus vitae a turpis. Proin leo dolor, condimentum tincidunt nisi in, lacinia venenatis metus. Donec placerat mauris orci, et rhoncus ipsum pretium placerat. Vivamus imperdiet nulla ut lectus vestibulum, vel rhoncus quam vulputate. Aliquam erat volutpat. Phasellus ornare dolor eu tempus lacinia. Mauris urna dui, hendrerit vitae justo id, ultrices lacinia nisl. Etiam at convallis nisi, sed eleifend odio. Sed ac gravida mauris. Sed congue justo eget sapien pretium fringilla. Curabitur scelerisque felis metus, sit amet tincidunt elit commodo vel. Nam nibh quam, scelerisque vel pharetra eu, hendrerit in enim. Donec consectetur justo vitae ullamcorper tincidunt. Phasellus id convallis lectus.</p>\r\n\r\n<p>Etiam varius erat eu ipsum hendrerit porttitor. Suspendisse imperdiet purus nibh, sit amet varius orci bibendum id. Proin in est turpis. Duis ac enim eu purus vestibulum molestie. Nam lobortis a lorem non facilisis. Proin eu varius erat. Quisque massa ipsum, venenatis a hendrerit eu, feugiat nec odio. Mauris pretium scelerisque nisl quis rhoncus. Aenean placerat nunc at lacus congue, sit amet varius risus bibendum. Nulla eu ex id lectus iaculis pretium. Etiam ultrices, neque non dictum laoreet, magna eros faucibus lacus, et bibendum odio magna ut est.</p>\r\n\r\n<p>Curabitur in tellus sed eros maximus suscipit in sed erat. Nunc consequat molestie nibh, at egestas ante maximus vitae. Ut scelerisque vulputate blandit. Aliquam ultrices sapien nec magna malesuada rutrum. Fusce varius nunc est, vitae luctus justo viverra ut. Donec sit amet augue bibendum, iaculis urna nec, imperdiet nulla. Quisque laoreet, metus sed ullamcorper dapibus, justo enim faucibus odio, vitae porta felis ligula nec nisl. Duis varius bibendum felis, sed porta eros dignissim at. Aliquam sed placerat felis. In consequat tortor ex, et maximus neque mattis ac. Nam euismod est sed posuere eleifend. Morbi vitae rhoncus turpis.</p>\r\n\r\n<p>Curabitur sodales urna quam, quis tristique nulla laoreet eu. Proin a magna felis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam fermentum dolor vitae leo maximus bibendum. Fusce bibendum elit erat, nec blandit ipsum feugiat a. Duis at eleifend urna, sit amet faucibus magna. Maecenas consequat massa eu turpis iaculis, sed fermentum elit egestas. Aenean in massa urna. Sed nec blandit lorem. Maecenas a orci ac libero rhoncus iaculis.</p>\r\n\r\n<p>Interdum et malesuada fames ac ante ipsum primis in faucibus. In rutrum sem in lorem interdum, a tempus lectus vehicula. Etiam eu lorem augue. Proin lacinia feugiat dui vitae interdum. Aenean eleifend, est eget elementum finibus, velit libero sollicitudin lacus, at euismod elit erat eget mi. Nulla vestibulum, libero nec auctor ornare, mauris nisl cursus quam, ac ullamcorper lacus lorem vitae ante. Integer dignissim nulla ut nisi fringilla, quis blandit eros volutpat. Donec elit nulla, condimentum eu fermentum vitae, pretium ac sem. Ut ut tellus fringilla, vestibulum magna ut, mattis arcu. Sed diam mauris, scelerisque sit amet ornare nec, rutrum vitae magna.</p>\r\n', '', 'Curabitur in tellus sed eros maximus suscipit in sed erat. Nunc consequat molestie nibh, at egestas ante maximus vitae.', '2015-11-03 08:09:43', '2015-11-03 05:27:36', 1, 0, 0),
(7, 'Nulla tempor, quam porta eleifend dignissim, arcu ex vestibulum lectus, id bibendum ipsum nulla et nunc', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam pharetra malesuada fermentum. Nullam dapibus bibendum nibh id congue. Etiam ut porta turpis, in rhoncus velit. Donec quis lectus sit amet metus ullamcorper laoreet. Curabitur condimentum turpis nibh, eget facilisis arcu fringilla et. Nunc eget interdum urna, commodo porta diam. Nunc interdum aliquam rhoncus. Vivamus sit amet ligula luctus, euismod enim quis, placerat dolor. Aliquam commodo molestie leo, vehicula pulvinar mi blandit a. Nulla id diam at sem porttitor pellentesque. Pellentesque venenatis laoreet cursus. Nam libero lectus, efficitur in semper et, scelerisque sit amet neque. Aenean hendrerit, est sed mollis posuere, nulla felis ornare quam, sit amet aliquet odio sem nec nibh. Mauris a est nec urna fringilla semper in nec libero. Vivamus rutrum lorem id ipsum porta interdum. Integer quis libero in nulla sollicitudin convallis.</p>\r\n\r\n<p>Nulla tempor, quam porta eleifend dignissim, arcu ex vestibulum lectus, id bibendum ipsum nulla et nunc. In ut erat eget diam rutrum porttitor at eget dui. Aliquam commodo tellus nec ipsum efficitur viverra. Pellentesque nec magna quis ex dignissim venenatis. Vestibulum massa eros, varius et suscipit sit amet, cursus sed erat. Donec sodales condimentum enim, eu venenatis dolor hendrerit in. Phasellus nec consectetur lectus, sed convallis velit. Sed sed diam id sapien ornare euismod a id nunc. Nunc efficitur tristique vestibulum. Integer vestibulum laoreet eros sit amet sollicitudin. Praesent malesuada maximus velit. Mauris vestibulum sem sit amet est eleifend interdum. Donec sollicitudin nulla a elementum gravida.</p>\r\n\r\n<p>Duis egestas vel enim at gravida. In nunc nulla, faucibus quis semper sed, dignissim a diam. Praesent fringilla lectus eget elit mollis, nec malesuada ligula sodales. Donec tincidunt purus quis nulla volutpat blandit. Cras euismod metus vitae leo vulputate hendrerit. Nunc lorem ligula, semper accumsan leo a, eleifend iaculis elit. Suspendisse ac rutrum nibh. Praesent nec metus at sem varius mollis et id purus. Nam fermentum dictum ante vel elementum. Interdum et malesuada fames ac ante ipsum primis in faucibus. Integer facilisis leo ut tincidunt tristique. Aenean vehicula fermentum sodales. Maecenas accumsan feugiat magna scelerisque laoreet. Donec rhoncus accumsan justo sit amet ultrices.</p>\r\n\r\n<p>In congue rutrum orci a ornare. Ut maximus sem ac arcu ultricies aliquet. Cras pharetra eu purus sed dictum. Donec tincidunt, dolor id rhoncus hendrerit, nisi ante fermentum arcu, eu pellentesque arcu odio vehicula tellus. Morbi nec maximus erat, et dictum libero. Aliquam scelerisque ultricies placerat. Nam vestibulum tortor vel lectus tempor maximus. Sed varius porttitor dolor vel consectetur. Nam in eleifend sapien. Cras consequat nisi vel erat luctus convallis ut maximus orci. Duis cursus diam eget odio dictum volutpat. Aliquam erat volutpat.</p>\r\n\r\n<p>Etiam maximus massa ac eros laoreet, nec porttitor neque interdum. Proin vitae enim vel nunc tempus sagittis sed sed enim. Nullam fringilla turpis eu ante interdum congue. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultrices convallis leo nec imperdiet. Vestibulum vulputate luctus ullamcorper. Suspendisse tincidunt, magna et gravida sodales, magna metus mollis lorem, non elementum mauris tortor a sem. Vestibulum imperdiet ultrices neque id posuere. Donec quis erat tempus, mollis sem ac, vulputate lectus. Donec sed massa odio. Aenean felis velit, feugiat vitae feugiat vel, semper a turpis. Etiam lectus diam, rutrum quis facilisis eu, ullamcorper nec elit.</p>\r\n', '', '', '2015-11-03 08:14:10', '2015-11-03 05:27:51', 1, 1, 0),
(8, 'Պրոմեսի համար 20 միլիոն եվրո են առաջարկել, Սպարտակը պահանջում է 30 միլիոն', '<p>Նորաբաց Матч ТВ հեռուստաալիքի մեկնաբան Նոբել Արուստամյանը հայտարարել է, թե ինչպիսի գումարի դեպքում է Մոսկվայի &laquo;Սպարտակը&raquo; պատրաստ բաժանվել կիսապաշտպան Քվինսի Պրոմեսից:</p>\r\n\r\n<p>&laquo;Անգլիական 2 ակումբներ 23-ամյա հոլանդացու տրանսֆերի համար 20 միլիոն եվրո են առաջարկել: Նրա ծառայություններով հետաքրքրված են նաև &laquo;Բավարիան&raquo; ու &laquo;Յուվենտուսը&raquo;-, ասել է Արուստամյանը:</p>\r\n\r\n<p>Ըստ մեկնաբանի խոսքերի &laquo;Սպարտակը&raquo; վստահ է, որ Պրոմեսի տրանսֆերի համար կգտնի նաև 30 միլիոն եվրո առաջարկողներ:</p>\r\n\r\n<p>Նշենք, որ Ռուսաստանի ընթացիկ առաջնությունում անցկացրած 14 խաղում հոլանդացին դարձել է 7 գոլի հեղինակ:</p>\r\n', '', 'Պրոմեսի համար 20 միլիոն եվրո են առաջարկել, Սպարտակը պահանջում է 30 միլիոն', '2015-11-03 08:17:22', '2015-11-03 05:17:47', 1, 1, 0),
(9, 'Հայտնի են 2014-2015 ԲՈՒՀ-երի անցողիկ միավորները', '<p>Արմեն Աշոտյանը իր ֆեյսբուքյան էջում գրել է.</p>\r\n\r\n<p>Հարգելի դիմորդներ, ծնողներ, լրագրողներ:&nbsp;Ինչպես արդեն հայտնել էի, վաղը կեսօրից հետո ընդունվածների ցուցակները փակցված կլինեն բուհերում:Իսկ հիմա ԳԹԿ-ի կայքէջում կարող եք ծանոթանալ բուհերի անցողիկ միավորներին:&nbsp;Կրկին շնորհավորում եմ բոլոր ընդունվածներին, իսկ մնացածներին առաջարկում եմ հետևել մեր նորություններին:Ստորև ներկայացնում ենք 2014 թվականի ընդունելության &nbsp;բուհերի անցողիկ միավորները</p>\r\n', '', 'Հայտնի են 2014-2015 ԲՈՒՀ-երի անցողիկ միավորները', '2015-11-03 08:23:50', '2015-11-03 05:27:19', 1, 0, 0),
(10, 'Մոսկվա–Երևան ավտոբուսի վթարը 3D մոդելավորմամբ', '<p>Nulla tempor, quam porta eleifend dignissim, arcu ex vestibulum lectus, id bibendum ipsum nulla et nunc. In ut erat eget diam rutrum porttitor at eget dui. Aliquam commodo tellus nec ipsum efficitur viverra. Pellentesque nec magna quis ex dignissim venenatis. Vestibulum massa eros, varius et suscipit sit amet, cursus sed erat. Donec sodales condimentum enim, eu venenatis dolor hendrerit in. Phasellus nec consectetur lectus, sed convallis velit. Sed sed diam id sapien ornare euismod a id nunc. Nunc efficitur tristique vestibulum. Integer vestibulum laoreet eros sit amet sollicitudin. Praesent malesuada maximus velit. Mauris vestibulum sem sit amet est eleifend interdum. Donec sollicitudin nulla a elementum gravida.</p>\r\n', '', '', '2015-11-03 08:25:14', '2015-11-03 05:26:17', 1, 0, 0),
(11, 'vinar mi blandit a. Nulla id diam at sem porttitor pellentesque. Pellentesque venenatis laoreet cursus. N', '<p>rutrum porttitor at eget dui. Aliquam commodo tellus nec ipsum efficitur viverra. Pellentesque nec magna quis ex dignissim venenatis. Vestibulum massa eros, varius et suscipit sit amet, cursus sed erat. Donec sodales condimentum enim, eu venenatis dolor hendrerit in. Phasellus nec consectetur lectus, sed convallis velit. Sed sed diam id sapien ornare euismod a id nunc. Nunc efficitur tristique vestibulum. Integer vestibulum laoreet eros sit amet sollicitudin. Praesent malesuada maximus velit. Mauris vestibulum sem sit amet est eleifend interdum. Donec sollicitudin nulla a elementum gravida.</p>\r\n\r\n<p>Duis egestas vel enim at gravida. In nunc nulla, faucibus quis semper sed, dignissim a diam. Praesent fringilla lectus eget elit mollis, nec malesuada ligula sodales. Donec tincidunt purus quis nulla volutpat blandit. Cras euismod metus vitae leo vulputate hendrerit. Nunc lorem ligula, semper accumsan leo a, eleifend iaculis elit. Suspendisse ac rutrum nibh. Praesent nec metus at sem varius mollis et id purus. Nam fermentum dictum ante vel elementum. Interdum et malesuada fames ac ante ipsum primis in faucibus. Integer facilisis leo ut tincidunt tristique. Aenean vehicula fermentum sodales. Maecenas accumsan feugiat magna scelerisque laoreet. Donec rhoncus accumsan justo sit amet ultrices.</p>\r\n\r\n<p>In congue rutrum orci a ornare. Ut maximus sem ac arcu ultricies aliquet. Cras pharetra eu purus sed dictum. Donec tincidunt, dolor id rhoncus hendrerit, nisi ante fermentum arcu, eu pellentesque arcu odio vehicula tellus. Morbi nec maximus erat, et dictum libero. Aliquam scelerisque ultricies placerat. Nam vestibulum tortor vel lectus tempor maximus. Sed varius porttitor dolor vel consectetur. Nam in eleifend sapien. Cras consequat nisi vel erat luctus convallis ut maximus orci. Duis cursus diam eget odio dictum volutpat. Aliquam erat volutpat.</p>\r\n', '', '', '2015-11-03 08:25:50', '2015-11-03 05:25:50', 1, 0, 0),
(12, 'ollis, nec malesuada ligula sodales. Donec tincidunt purus quis nulla volutpat blandit. Cras', '<p>pulvinar mi blandit a. Nulla id diam at sem porttitor pellentesque. Pellentesque venenatis laoreet cursus. Nam libero lectus, efficitur in semper et, scelerisque sit amet neque. Aenean hendrerit, est sed mollis posuere, nulla felis ornare quam, sit amet aliquet odio sem nec nibh. Mauris a est nec urna fringilla semper in nec libero. Vivamus rutrum lorem id ipsum porta interdum. Integer quis libero in nulla sollicitudin convallis.</p>\r\n\r\n<p>Nulla tempor, quam porta eleifend dignissim, arcu ex vestibulum lectus, id bibendum ipsum nulla et nunc. In ut erat eget diam rutrum porttitor at eget dui. Aliquam commodo tellus nec ipsum efficitur viverra. Pellentesque nec magna quis ex dignissim venenatis. Vestibulum massa eros, varius et suscipit sit amet, cursus sed erat. Donec sodales condimentum enim, eu venenatis dolor hendrerit in. Phasellus nec consectetur lectus, sed convallis velit. Sed sed diam id sapien ornare euismod a id nunc. Nunc efficitur tristique vestibulum. Integer vestibulum laoreet eros sit amet sollicitudin. Praesent malesuada maximus velit. Mauris vestibulum sem sit amet est eleifend interdum. Donec sollicitudin nulla a elementum gravida.</p>\r\n\r\n<p>Duis egestas vel enim at gravida. In nunc nulla, faucibus quis semper sed, dignissim a diam. Praesent fringilla lectus eget elit mollis, nec malesuada ligula sodales. Donec tincidunt purus quis nulla volutpat blandit. Cras euismod metus vitae leo vulputate hendrerit. Nunc lorem ligula, semper accumsan leo a, eleifend iaculis elit. Suspendisse ac rutrum nibh. Praesent nec metus at sem varius mollis et id purus. Nam fermentum dictum ante vel elementum. Interdum et malesuada fames ac ante ipsum primis in faucibus. Integer facilisis leo ut tincidunt tristique. Aenean vehicula fermentum sodales. Maecenas accumsan feugiat magna scelerisque laoreet. Donec rhoncus accumsan justo sit amet ultrices.</p>\r\n\r\n<p>In congue rutrum orci a ornare. Ut maximus sem ac arcu ultricies aliquet. Cras pharetra eu purus sed dictum. Donec tincidunt, dolor id rhoncus hendrerit, nisi ante fermentum arcu, eu pellentesque arcu odio vehicula tellus. Morbi nec maximus erat, et dictum libero. Aliquam scelerisque ultricies placerat. Nam vestibulum tortor vel lectus tempor maximus. Sed varius porttitor dolor vel consectetur. Nam in eleifend sapien. Cras consequat nisi vel erat luctus convallis ut maximus orci. Duis cursus diam eget odio dictum volutpat. Aliquam erat volutpat.</p>\r\n\r\n<p>Etiam maximus massa ac eros laoreet, nec porttitor neque interdum. Proin vitae enim vel nunc tempus sagittis sed sed enim. Nullam fringilla turpis eu ante interdum congue. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultrices convallis leo nec imperdiet. Vestibulum vulputate luctus ullamcorper. Suspendisse tincidunt, magna et gravida sodales, magna metus mollis lorem, non elementum mauris tortor a sem. Vestibulum imperdiet ultrices neque id posuere. Donec quis erat tempus, mollis sem ac, vulputate lectus. Donec sed massa odio. Aenean felis velit, feugiat vitae feugiat vel, semper a turpis. Etiam lectus diam, rutrum quis facilisis eu, ullamcorper nec elit.</p>\r\n', '', '', '2015-11-03 08:28:36', '2015-11-03 05:28:36', 1, 0, 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `category_relations`
--
ALTER TABLE `category_relations`
  ADD PRIMARY KEY (`id`), ADD KEY `news_categories` (`news_id`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `category_relations`
--
ALTER TABLE `category_relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `category_relations`
--
ALTER TABLE `category_relations`
ADD CONSTRAINT `news_categories` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
