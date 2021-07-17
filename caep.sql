-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 17-Jul-2021 às 01:21
-- Versão do servidor: 5.7.31
-- versão do PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `caep`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add section', 6, 'add_section'),
(22, 'Can change section', 6, 'change_section'),
(23, 'Can delete section', 6, 'delete_section'),
(24, 'Can view section', 6, 'view_section'),
(25, 'Can add message', 7, 'add_message'),
(26, 'Can change message', 7, 'change_message'),
(27, 'Can delete message', 7, 'delete_message'),
(28, 'Can view message', 7, 'view_message'),
(29, 'Can add subject', 8, 'add_subject'),
(30, 'Can change subject', 8, 'change_subject'),
(31, 'Can delete subject', 8, 'delete_subject'),
(32, 'Can view subject', 8, 'view_subject'),
(33, 'Can add user', 9, 'add_customer'),
(34, 'Can change user', 9, 'change_customer'),
(35, 'Can delete user', 9, 'delete_customer'),
(36, 'Can view user', 9, 'view_customer'),
(37, 'Can add order', 10, 'add_order'),
(38, 'Can change order', 10, 'change_order'),
(39, 'Can delete order', 10, 'delete_order'),
(40, 'Can view order', 10, 'view_order'),
(41, 'Can add product', 11, 'add_product'),
(42, 'Can change product', 11, 'change_product'),
(43, 'Can delete product', 11, 'delete_product'),
(44, 'Can view product', 11, 'view_product'),
(45, 'Can add supply', 12, 'add_supply'),
(46, 'Can change supply', 12, 'change_supply'),
(47, 'Can delete supply', 12, 'delete_supply'),
(48, 'Can view supply', 12, 'view_supply'),
(49, 'Can add supply item', 13, 'add_supplyitem'),
(50, 'Can change supply item', 13, 'change_supplyitem'),
(51, 'Can delete supply item', 13, 'delete_supplyitem'),
(52, 'Can view supply item', 13, 'view_supplyitem'),
(53, 'Can add order item', 14, 'add_orderitem'),
(54, 'Can change order item', 14, 'change_orderitem'),
(55, 'Can delete order item', 14, 'delete_orderitem'),
(56, 'Can view order item', 14, 'view_orderitem'),
(57, 'Can add payment', 15, 'add_payment'),
(58, 'Can change payment', 15, 'change_payment'),
(59, 'Can delete payment', 15, 'delete_payment'),
(60, 'Can view payment', 15, 'view_payment'),
(61, 'Can add shipping', 16, 'add_shipping'),
(62, 'Can change shipping', 16, 'change_shipping'),
(63, 'Can delete shipping', 16, 'delete_shipping'),
(64, 'Can view shipping', 16, 'view_shipping');

-- --------------------------------------------------------

--
-- Estrutura da tabela `communications_message`
--

DROP TABLE IF EXISTS `communications_message`;
CREATE TABLE IF NOT EXISTS `communications_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `whatsapp` varchar(11) NOT NULL,
  `email` varchar(1024) NOT NULL,
  `message` longtext NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `communications_message`
--

INSERT INTO `communications_message` (`id`, `name`, `whatsapp`, `email`, `message`, `status`) VALUES
(1, 'Caio Rogerio Ribeiro', '11964886861', 'caiorogerio@gmail.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sit amet metus tellus. Nulla hendrerit tellus quam, id interdum lacus fermentum vitae. Phasellus eget nisi ex. Curabitur massa diam, tincidunt a semper sit amet, viverra nec ex. Duis vulputate leo ex. Pellentesque at nisi libero. Morbi euismod mattis ante, in rutrum mi. Donec placerat, elit at vulputate condimentum, felis dui tincidunt eros, id commodo est nulla eget arcu.', 'Unread');

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-07-17 00:31:45.837411', '1', 'Sobre nós', 1, '[{\"added\": {}}]', 6, 1),
(2, '2021-07-17 00:32:03.666247', '2', 'Missão', 1, '[{\"added\": {}}]', 6, 1),
(3, '2021-07-17 00:32:07.241311', '2', 'Missão', 2, '[]', 6, 1),
(4, '2021-07-17 00:32:21.492483', '3', 'Visão', 1, '[{\"added\": {}}]', 6, 1),
(5, '2021-07-17 00:32:32.165615', '4', 'Valores', 1, '[{\"added\": {}}]', 6, 1),
(6, '2021-07-17 00:33:03.414637', '5', 'Nosso espaço', 1, '[{\"added\": {}}]', 6, 1),
(7, '2021-07-17 00:33:16.011505', '6', 'Contato', 1, '[{\"added\": {}}]', 6, 1),
(8, '2021-07-17 00:34:02.180610', '1', 'Iniciação cientifica sobre Sistemas de Centros Acadêmicos', 1, '[{\"added\": {}}]', 8, 1),
(9, '2021-07-17 00:36:16.694906', '1', 'Boné', 1, '[{\"added\": {}}]', 11, 1),
(10, '2021-07-17 00:36:48.864124', '2', 'Camiseta', 1, '[{\"added\": {}}]', 11, 1),
(11, '2021-07-17 00:37:08.577596', '3', 'Bandeira', 1, '[{\"added\": {}}]', 11, 1),
(12, '2021-07-17 00:37:36.306920', '1', 'caiorogerio@gmail.com', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Address\"]}}]', 9, 1),
(13, '2021-07-17 00:38:09.709700', '1', '2021-07-17 00:38:09.706683+00:00', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"supply item\", \"object\": \"Bon\\u00e9 (10)\"}}, {\"added\": {\"name\": \"supply item\", \"object\": \"Camiseta (10)\"}}, {\"added\": {\"name\": \"supply item\", \"object\": \"Bandeira (10)\"}}]', 12, 1),
(14, '2021-07-17 00:38:17.366683', '1', '2021-07-17 00:38:09.706683+00:00', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(15, '2021-07-17 00:38:20.261231', '1', '2021-07-17 00:38:09.706683+00:00', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(16, '2021-07-17 00:38:22.018000', '1', '2021-07-17 00:38:09.706683+00:00', 2, '[]', 12, 1),
(17, '2021-07-17 00:49:59.618555', '1', '1', 2, '[{\"added\": {\"name\": \"payment\", \"object\": \"R$5 (Dinheiro)\"}}, {\"added\": {\"name\": \"payment\", \"object\": \"R$11 (Pix)\"}}]', 10, 1),
(18, '2021-07-17 00:50:14.903715', '1', '1', 2, '[{\"added\": {\"name\": \"shipping\", \"object\": \"2021-07-17 00:50:14.901713+00:00\"}}]', 10, 1),
(19, '2021-07-17 00:51:03.190675', '3', '3', 2, '[{\"added\": {\"name\": \"payment\", \"object\": \"R$5 (Visa)\"}}]', 10, 1),
(20, '2021-07-17 00:51:10.756020', '3', '3', 2, '[{\"added\": {\"name\": \"shipping\", \"object\": \"2021-07-17 00:51:10.754018+00:00\"}}]', 10, 1),
(21, '2021-07-17 00:51:59.718219', '4', '4', 2, '[{\"added\": {\"name\": \"order item\", \"object\": \"Bon\\u00e9 (1)\"}}]', 10, 1),
(22, '2021-07-17 01:15:07.248821', '2', 'admin@caep.com.br', 1, '[{\"added\": {}}]', 9, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session'),
(6, 'website', 'section'),
(7, 'communications', 'message'),
(8, 'scientific_research', 'subject'),
(9, 'store', 'customer'),
(10, 'store', 'order'),
(11, 'store', 'product'),
(12, 'store', 'supply'),
(13, 'store', 'supplyitem'),
(14, 'store', 'orderitem'),
(15, 'store', 'payment'),
(16, 'store', 'shipping');

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-07-17 00:25:15.903893'),
(2, 'contenttypes', '0002_remove_content_type_name', '2021-07-17 00:25:15.975617'),
(3, 'auth', '0001_initial', '2021-07-17 00:25:16.258900'),
(4, 'auth', '0002_alter_permission_name_max_length', '2021-07-17 00:25:16.295204'),
(5, 'auth', '0003_alter_user_email_max_length', '2021-07-17 00:25:16.301736'),
(6, 'auth', '0004_alter_user_username_opts', '2021-07-17 00:25:16.305746'),
(7, 'auth', '0005_alter_user_last_login_null', '2021-07-17 00:25:16.311747'),
(8, 'auth', '0006_require_contenttypes_0002', '2021-07-17 00:25:16.313784'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2021-07-17 00:25:16.317716'),
(10, 'auth', '0008_alter_user_username_max_length', '2021-07-17 00:25:16.322024'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2021-07-17 00:25:16.327917'),
(12, 'auth', '0010_alter_group_name_max_length', '2021-07-17 00:25:16.364462'),
(13, 'auth', '0011_update_proxy_permissions', '2021-07-17 00:25:16.369936'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2021-07-17 00:25:16.375558'),
(15, 'store', '0001_initial', '2021-07-17 00:25:17.088431'),
(16, 'admin', '0001_initial', '2021-07-17 00:25:17.229132'),
(17, 'admin', '0002_logentry_remove_auto_add', '2021-07-17 00:25:17.238188'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2021-07-17 00:25:17.248014'),
(19, 'communications', '0001_initial', '2021-07-17 00:25:17.267226'),
(20, 'communications', '0002_message_status', '2021-07-17 00:25:17.322584'),
(21, 'scientific_research', '0001_initial', '2021-07-17 00:25:17.342510'),
(22, 'sessions', '0001_initial', '2021-07-17 00:25:17.399518'),
(23, 'store', '0002_auto_20210715_0114', '2021-07-17 00:25:17.500711'),
(24, 'store', '0003_shipping', '2021-07-17 00:25:17.554597'),
(25, 'store', '0004_auto_20210715_0150', '2021-07-17 00:25:17.666481'),
(26, 'store', '0005_order_address', '2021-07-17 00:25:17.723562'),
(27, 'store', '0006_auto_20210716_0012', '2021-07-17 00:25:17.745654'),
(28, 'website', '0001_initial', '2021-07-17 00:25:17.764318'),
(29, 'website', '0002_alter_section_content', '2021-07-17 00:25:17.767322');

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('jdt0cv8lgev029dw48cslyngh77znx01', 'eyJjYXJ0IjoyfQ:1m4YGk:rjDbsHeWoUzFMuHHwan5Wk6FyIJ5i7v-l1Gog3XZRiE', '2021-07-31 00:33:26.921473'),
('2zj3ef97243uott8ggexzk4kni48ik74', '.eJxVjMsOwiAQRf-FtSHlDS7d-w1kgBmpGkhKuzL-uzbpQrf3nHNfLMK21rgNXOJc2JkJdvrdEuQHth2UO7Rb57m3dZkT3xV-0MGvveDzcrh_BxVG_dZoipDahEDaERmbjRQIygmFMjgsZpKkrSJdvJMBPKQ8EToQyoL3lNn7A9bNN-g:1m4YDH:rYbKrT4tLmX6l6Nni1Ej-DSTy4haEuHnqQMgvJJhtcc', '2021-07-31 00:29:51.167241'),
('iyhcosbnkpoar1j9y9sbxuubwehob47x', '.eJxVjEsOAiEQBe_C2hA-gQaX7j0DaWiQUQPJMLMy3l1JZqHbqnrvxQLuWw37yGtYiJ2ZZqdfFjE9cpuC7thunafetnWJfCb8sINfO-Xn5Wj_DiqOOtckkyewRXhdiJI3qI0D67NS5AwWSeRt_HLpnEIBgATFJ4VSoIbI3h_61DhK:1m4Yv7:W9ngvSqKs2FC7YpKKvOprnuZS99AA0L05_82Fm1qk9M', '2021-07-31 01:15:09.526464');

-- --------------------------------------------------------

--
-- Estrutura da tabela `scientific_research_subject`
--

DROP TABLE IF EXISTS `scientific_research_subject`;
CREATE TABLE IF NOT EXISTS `scientific_research_subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(1024) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `scientific_research_subject`
--

INSERT INTO `scientific_research_subject` (`id`, `title`, `description`) VALUES
(1, 'Iniciação cientifica sobre Sistemas de Centros Acadêmicos', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ipsum nulla, blandit a sagittis dapibus, consequat id tortor. Mauris volutpat, est ac interdum feugiat, diam lacus tristique arcu, in aliquam mauris lectus vitae est. Nulla facilisi. Vivamus sagittis ante porta turpis luctus finibus. Quisque mattis tellus non mauris molestie consectetur. Nullam erat dolor, blandit rutrum viverra sed, dignissim ut arcu. Phasellus nisl risus, semper sit amet gravida vitae, malesuada ac tortor. Donec ut porttitor odio, in fringilla felis. Duis sed pretium est. Sed vel felis blandit, tempor augue sed, auctor enim. Nullam at velit mauris. Quisque vulputate ornare felis, eu rhoncus justo ultricies non. Vivamus non molestie sapien.');

-- --------------------------------------------------------

--
-- Estrutura da tabela `store_customer`
--

DROP TABLE IF EXISTS `store_customer`;
CREATE TABLE IF NOT EXISTS `store_customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `address` varchar(1024) NOT NULL,
  `email` varchar(254) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `store_customer`
--

INSERT INTO `store_customer` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `address`, `email`) VALUES
(1, 'pbkdf2_sha256$260000$L1i6SVMsfFqZ2LTFLaMuKe$QSgFlvnODD09grk4B8Ur8Rn+TvqZNS1/gyI7NkFb+U0=', '2021-07-17 00:29:51.000000', 1, 'caiorogerio@gmail.com', 'Caio', 'Ribeiro', 1, 1, '2021-07-17 00:27:46.000000', 'Rua do Parque, 256', 'caiorogerio@gmail.com'),
(2, 'caep2021', NULL, 0, 'admin@caep.com.br', 'Admin', 'CAEP', 1, 1, '2021-07-17 01:14:28.000000', 'Biênio', 'admin@caep.com.br'),
(3, 'pbkdf2_sha256$260000$0zQHCvdsSlbXg09mMO3gqa$thFZOFbCqZgvekiWyqqA4AGJ9Y3aAk6XqLFH9cVdugM=', '2021-07-17 01:15:09.524284', 0, 'usuario@caep.com.br', 'Usuário', 'do Caep', 0, 1, '2021-07-17 01:15:09.117525', 'Prédio do Biênio', 'usuario@caep.com.br');

-- --------------------------------------------------------

--
-- Estrutura da tabela `store_customer_groups`
--

DROP TABLE IF EXISTS `store_customer_groups`;
CREATE TABLE IF NOT EXISTS `store_customer_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `store_customer_groups_customer_id_group_id_8d768cd0_uniq` (`customer_id`,`group_id`),
  KEY `store_customer_groups_customer_id_1eaa2da5` (`customer_id`),
  KEY `store_customer_groups_group_id_38b30817` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `store_customer_user_permissions`
--

DROP TABLE IF EXISTS `store_customer_user_permissions`;
CREATE TABLE IF NOT EXISTS `store_customer_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `store_customer_user_perm_customer_id_permission_i_769baa8b_uniq` (`customer_id`,`permission_id`),
  KEY `store_customer_user_permissions_customer_id_6ee97152` (`customer_id`),
  KEY `store_customer_user_permissions_permission_id_529f3bfa` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `store_order`
--

DROP TABLE IF EXISTS `store_order`;
CREATE TABLE IF NOT EXISTS `store_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `status` varchar(10) NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `address` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_order_customer_id_13d6d43e` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `store_order`
--

INSERT INTO `store_order` (`id`, `created_at`, `updated_at`, `status`, `customer_id`, `address`) VALUES
(1, '2021-07-17 00:28:42.445777', '2021-07-17 00:50:31.265964', 'Delivered', 1, 'Rua do Parque, 256'),
(2, '2021-07-17 00:33:26.911474', '2021-07-17 00:33:26.911474', 'Cart', NULL, ''),
(3, '2021-07-17 00:38:59.414960', '2021-07-17 00:51:33.885033', 'Delivered', 1, 'Rua do Parque, 256'),
(4, '2021-07-17 00:50:41.770573', '2021-07-17 00:51:59.716262', 'Closed', 1, 'Rua do Parque, 256'),
(5, '2021-07-17 00:51:13.617652', '2021-07-17 00:51:13.618654', 'Cart', 1, 'Rua do Parque, 256'),
(6, '2021-07-17 01:06:54.808986', '2021-07-17 01:15:09.524284', 'Cart', 3, 'Prédio do Biênio');

-- --------------------------------------------------------

--
-- Estrutura da tabela `store_orderitem`
--

DROP TABLE IF EXISTS `store_orderitem`;
CREATE TABLE IF NOT EXISTS `store_orderitem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_orderitem_order_id_acf8722d` (`order_id`),
  KEY `store_orderitem_product_id_f2b098d4` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `store_orderitem`
--

INSERT INTO `store_orderitem` (`id`, `created_at`, `updated_at`, `quantity`, `price`, `order_id`, `product_id`) VALUES
(1, '2021-07-17 00:38:46.853757', '2021-07-17 00:38:46.854757', 1, '1.00', 1, 1),
(2, '2021-07-17 00:38:50.539408', '2021-07-17 00:38:50.540420', 1, '5.00', 1, 2),
(3, '2021-07-17 00:38:53.694095', '2021-07-17 00:38:53.695112', 1, '10.00', 1, 3),
(4, '2021-07-17 00:50:39.892723', '2021-07-17 00:50:39.893727', 1, '5.00', 3, 2),
(5, '2021-07-17 00:51:59.717264', '2021-07-17 00:51:59.717264', 1, '1.00', 4, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `store_payment`
--

DROP TABLE IF EXISTS `store_payment`;
CREATE TABLE IF NOT EXISTS `store_payment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `value` decimal(6,2) NOT NULL,
  `type` varchar(15) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_payment_order_id_b5ee0383` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `store_payment`
--

INSERT INTO `store_payment` (`id`, `created_at`, `updated_at`, `value`, `type`, `order_id`) VALUES
(1, '2021-07-17 00:49:59.613083', '2021-07-17 00:49:59.613083', '5.00', 'Dinheiro', 1),
(2, '2021-07-17 00:49:59.615555', '2021-07-17 00:49:59.615555', '11.00', 'Pix', 1),
(3, '2021-07-17 00:51:03.187748', '2021-07-17 00:51:03.187748', '5.00', 'Visa', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `store_product`
--

DROP TABLE IF EXISTS `store_product`;
CREATE TABLE IF NOT EXISTS `store_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `store_product`
--

INSERT INTO `store_product` (`id`, `created_at`, `updated_at`, `title`, `description`, `image`, `price`) VALUES
(1, '2021-07-17 00:36:16.691906', '2021-07-17 00:36:16.691906', 'Boné', 'Boné do CAEP', 'store/product/images/bone_An7rwUV.jpg', '1.00'),
(2, '2021-07-17 00:36:48.862536', '2021-07-17 00:36:48.862536', 'Camiseta', 'Camiseta do CAEP', 'store/product/images/camiseta_7dUUnWp.jpg', '5.00'),
(3, '2021-07-17 00:37:08.565962', '2021-07-17 00:37:08.565962', 'Bandeira', 'Bandeira do CAEP', 'store/product/images/539c51a0-3976-4861-8fbd-143839b33834_xQgB70A.jpg', '10.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `store_shipping`
--

DROP TABLE IF EXISTS `store_shipping`;
CREATE TABLE IF NOT EXISTS `store_shipping` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `type` varchar(15) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `estimated_delivery` date NOT NULL,
  `tracking_number` varchar(13) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `store_shipping`
--

INSERT INTO `store_shipping` (`id`, `created_at`, `updated_at`, `type`, `order_id`, `estimated_delivery`, `tracking_number`) VALUES
(1, '2021-07-17 00:50:14.901713', '2021-07-17 00:50:14.901713', 'Correios', 1, '2021-07-23', 'AA123456789BR'),
(2, '2021-07-17 00:51:10.754018', '2021-07-17 00:51:10.754018', 'Rappi', 3, '2021-07-17', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `store_supply`
--

DROP TABLE IF EXISTS `store_supply`;
CREATE TABLE IF NOT EXISTS `store_supply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `store_supply`
--

INSERT INTO `store_supply` (`id`, `created_at`, `updated_at`, `status`) VALUES
(1, '2021-07-17 00:38:09.706683', '2021-07-17 00:38:22.017000', 'Received');

-- --------------------------------------------------------

--
-- Estrutura da tabela `store_supplyitem`
--

DROP TABLE IF EXISTS `store_supplyitem`;
CREATE TABLE IF NOT EXISTS `store_supplyitem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `quantity` int(11) NOT NULL,
  `cost` decimal(6,2) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `supply_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_supplyitem_product_id_face2c10` (`product_id`),
  KEY `store_supplyitem_supply_id_d29d1810` (`supply_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `store_supplyitem`
--

INSERT INTO `store_supplyitem` (`id`, `created_at`, `updated_at`, `quantity`, `cost`, `product_id`, `supply_id`) VALUES
(1, '2021-07-17 00:38:09.707686', '2021-07-17 00:38:09.707686', 10, '0.50', 1, 1),
(2, '2021-07-17 00:38:09.708691', '2021-07-17 00:38:09.708691', 10, '1.00', 2, 1),
(3, '2021-07-17 00:38:09.708691', '2021-07-17 00:38:09.708691', 10, '5.00', 3, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `website_section`
--

DROP TABLE IF EXISTS `website_section`;
CREATE TABLE IF NOT EXISTS `website_section` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `page` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `title` varchar(1024) NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `website_section`
--

INSERT INTO `website_section` (`id`, `page`, `name`, `title`, `content`) VALUES
(1, 'home', 'about', 'Sobre nós', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ipsum nulla, blandit a sagittis dapibus, consequat id tortor. Mauris volutpat, est ac interdum feugiat, diam lacus tristique arcu, in aliquam mauris lectus vitae est. Nulla facilisi. Vivamus sagittis ante porta turpis luctus finibus. Quisque mattis tellus non mauris molestie consectetur. Nullam erat dolor, blandit rutrum viverra sed, dignissim ut arcu. Phasellus nisl risus, semper sit amet gravida vitae, malesuada ac tortor. Donec ut porttitor odio, in fringilla felis. Duis sed pretium est. Sed vel felis blandit, tempor augue sed, auctor enim. Nullam at velit mauris. Quisque vulputate ornare felis, eu rhoncus justo ultricies non. Vivamus non molestie sapien.</p>'),
(2, 'home', 'mission', 'Missão', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ipsum nulla, blandit a sagittis dapibus</p>'),
(3, 'home', 'vision', 'Visão', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ipsum nulla, blandit a sagittis dapibus</p>'),
(4, 'home', 'values', 'Valores', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ipsum nulla, blandit a sagittis dapibus</p>'),
(5, 'home', 'space', 'Nosso espaço', '<p><img src=\"/static/assets/images/vivencia.jpeg\" alt=\"Foto da vivência do CAEP\" class=\"image-text image-text-left\"> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ipsum nulla, blandit a sagittis dapibus, consequat id tortor. Mauris volutpat, est ac interdum feugiat, diam lacus tristique arcu, in aliquam mauris lectus vitae est. Nulla facilisi. Vivamus sagittis ante porta turpis luctus finibus. Quisque mattis tellus non mauris molestie consectetur. Nullam erat dolor, blandit rutrum viverra sed, dignissim ut arcu. Phasellus nisl risus, semper sit amet gravida vitae, malesuada ac tortor. Donec ut porttitor odio, in fringilla felis. Duis sed pretium est. Sed vel felis blandit, tempor augue sed, auctor enim. Nullam at velit mauris. Quisque vulputate ornare felis, eu rhoncus justo ultricies non. Vivamus non molestie sapien.</p>\r\n            <p><img src=\"/static/assets/images/maps.png\" alt=\"Mapa da localização do CAEP\"></p>\r\n            <address>Localização - Av. Prof. Luciano Gualberto, 380 - Butantã, São Paulo - SP, 05508-010</address>'),
(6, 'home', 'contact', 'Contato', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ipsum nulla, blandit a sagittis dapibus, consequat id tortor. Mauris volutpat, est ac interdum feugiat, diam lacus tristique arcu, in aliquam mauris lectus vitae est. Nulla facilisi. Vivamus sagittis ante porta turpis luctus finibus. Quisque mattis tellus non mauris molestie consectetur. Nullam erat dolor, blandit rutrum viverra sed, dignissim ut arcu. Phasellus nisl risus, semper sit amet gravida vitae, malesuada ac tortor. Donec ut porttitor odio, in fringilla felis. Duis sed pretium est. Sed vel felis blandit, tempor augue sed, auctor enim. Nullam at velit mauris. Quisque vulputate ornare felis, eu rhoncus justo ultricies non. Vivamus non molestie sapien.</p>');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
