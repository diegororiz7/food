-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18-Nov-2021 às 21:14
-- Versão do servidor: 10.4.21-MariaDB
-- versão do PHP: 7.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `food`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` int(5) UNSIGNED NOT NULL,
  `nome` varchar(128) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `criado_em` datetime DEFAULT NULL,
  `atualizado_em` datetime DEFAULT NULL,
  `deletado_em` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`id`, `nome`, `slug`, `ativo`, `criado_em`, `atualizado_em`, `deletado_em`) VALUES
(1, 'Pizza Doce', 'pizza-doce', 1, '2021-11-06 12:36:28', '2021-11-06 13:01:59', NULL),
(2, 'Pizza Salgada', 'pizza-salgada', 1, '2021-11-06 13:13:51', '2021-11-06 13:23:10', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `extras`
--

CREATE TABLE `extras` (
  `id` int(5) UNSIGNED NOT NULL,
  `nome` varchar(128) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `descricao` text NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `criado_em` datetime DEFAULT NULL,
  `atualizado_em` datetime DEFAULT NULL,
  `deletado_em` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `extras`
--

INSERT INTO `extras` (`id`, `nome`, `slug`, `preco`, `descricao`, `ativo`, `criado_em`, `atualizado_em`, `deletado_em`) VALUES
(1, 'Catupiry', 'catupiry', '10.00', 'Catupiry importado tipo A', 1, '2021-11-07 08:45:34', '2021-11-07 09:22:04', NULL),
(2, 'Borda de cheddar dupla', 'borda-de-cheddar-dupla', '12.00', 'Borda de cheddar como opcional para pizza', 1, '2021-11-07 09:30:35', '2021-11-07 09:31:28', NULL),
(3, 'Borda de Catupiry', 'borda-de-catupiry', '12.00', 'Adicional de borda de catupiry para pizza', 1, '2021-11-07 09:35:52', '2021-11-07 09:38:35', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `medidas`
--

CREATE TABLE `medidas` (
  `id` int(5) UNSIGNED NOT NULL,
  `nome` varchar(128) NOT NULL,
  `descricao` text NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `criado_em` datetime DEFAULT NULL,
  `atualizado_em` datetime DEFAULT NULL,
  `deletado_em` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `medidas`
--

INSERT INTO `medidas` (`id`, `nome`, `descricao`, `ativo`, `criado_em`, `atualizado_em`, `deletado_em`) VALUES
(1, 'Pizza grande 20 pedaços', 'Pizza grande 20 pedaços', 1, '2021-11-08 19:18:34', '2021-11-08 19:59:48', NULL),
(2, 'Pizza média 8 pedaços', 'Pizza média 8 pedaços', 1, '2021-11-08 19:55:37', '2021-11-08 20:03:02', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(3, '2021-10-18-214336', 'App\\Database\\Migrations\\CriaTabelaUsuarios', 'default', 'App', 1634683525, 1),
(7, '2021-11-06-102002', 'App\\Database\\Migrations\\CriaTabelaCaregorias', 'default', 'App', 1636212361, 2),
(9, '2021-11-06-152946', 'App\\Database\\Migrations\\CriaTabelaCategorias', 'default', 'App', 1636212924, 3),
(10, '2021-11-07-112300', 'App\\Database\\Migrations\\CriaTabelaExtras', 'default', 'App', 1636284453, 4),
(11, '2021-11-08-221645', 'App\\Database\\Migrations\\CriaTabelaMedidas', 'default', 'App', 1636409895, 5),
(12, '2021-11-16-220625', 'App\\Database\\Migrations\\CriaTabelaProdutos', 'default', 'App', 1637100984, 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(5) UNSIGNED NOT NULL,
  `categoria_id` int(5) UNSIGNED NOT NULL,
  `nome` varchar(128) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `ingredientes` text NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `imagem` varchar(200) NOT NULL,
  `criado_em` datetime DEFAULT NULL,
  `atualizado_em` datetime DEFAULT NULL,
  `deletado_em` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id`, `categoria_id`, `nome`, `slug`, `ingredientes`, `ativo`, `imagem`, `criado_em`, `atualizado_em`, `deletado_em`) VALUES
(1, 1, 'Pizza de chocolate branco', 'pizza-de-chocolate-branco', 'Pizza de chocolate branco', 1, '', '2021-11-16 19:16:49', '2021-11-18 20:57:40', NULL),
(2, 2, 'Pizza de frango com catupiry', 'pizza-de-frango-com-catupiry', 'Pizza de frango com catupiry', 1, '', '2021-11-18 20:53:43', '2021-11-18 20:53:43', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(5) UNSIGNED NOT NULL,
  `nome` varchar(128) NOT NULL,
  `email` varchar(255) NOT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `telefone` varchar(20) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `ativo` tinyint(1) NOT NULL DEFAULT 0,
  `password_hash` varchar(255) NOT NULL,
  `ativacao_hash` varchar(64) DEFAULT NULL,
  `reset_hash` varchar(64) DEFAULT NULL,
  `reset_expira_em` datetime DEFAULT NULL,
  `criado_em` datetime DEFAULT NULL,
  `atualizado_em` datetime DEFAULT NULL,
  `deletado_em` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `cpf`, `telefone`, `is_admin`, `ativo`, `password_hash`, `ativacao_hash`, `reset_hash`, `reset_expira_em`, `criado_em`, `atualizado_em`, `deletado_em`) VALUES
(1, 'Lucio Antonio de Souza', 'admin@admin.com', '349.957.910-35', '(41) 99999-9988', 1, 1, '$2y$10$dv/t71EruC/LmeTMYoNPsep3K/WindwbBRAw8tXwgwN9YFr3zpVju', NULL, NULL, NULL, '2021-10-23 08:44:06', '2021-11-02 09:06:28', NULL),
(2, 'Fulano de Tal', 'fulano@email.com', '349.466.600-89', '(41) 98888-9999', 1, 1, '$2y$10$KSXyw.xJSNqu0Skub3dD3.lPKUOn.TOR8zbZS1uV0xonvvd7/yLkG', NULL, NULL, NULL, '2021-10-02 08:44:39', '2021-10-29 15:50:33', NULL),
(3, 'Pedro Pedra', 'pedro@email.com', '189.425.330-27', '(54) 64562-3652', 1, 1, '$2y$10$LLuF5KcD4LeSLrdf88gzyuHN0Dq8P33c4aqAFg1T1PUnLyOLPKORe', NULL, 'a12c27aba68a832f28a040bf479fed91d111f9375f32304ccd6926daccb3865a', '2021-11-03 21:22:29', '2021-10-28 18:34:49', '2021-11-03 19:22:29', NULL),
(4, 'Maria Luiza', 'marialuiza@email.com', '831.736.010-50', '(54) 24545-4524', 1, 1, '$2y$10$7My.d8pPtInp659KYo66iO8RsP1Kj/RtB0FfDfmS7RS2SG9fSrEQK', NULL, NULL, NULL, '2021-10-29 15:53:09', '2021-10-29 15:53:09', NULL),
(5, 'Luiz', 'luiz@email.com', '891.767.780-02', '(54) 57742-1477', 0, 1, '$2y$10$w0RoZPvAHkZIgp7PDExFqeP.IEj/kPjvlws4hnF4Jna2jW3m/Notm', NULL, NULL, NULL, '2021-10-29 15:53:39', '2021-11-02 09:06:49', '2021-11-02 09:06:49'),
(6, 'Diego Roriz', 'diegororiz7@gmail.com', '870.805.880-65', '(46) 56867-6545', 1, 1, '$2y$10$MgrubJzDaXojSjqrgdQxHuTD5OzHkKCXhGMemjocfQSSD/7SRNld2', NULL, NULL, NULL, '2021-11-02 09:24:26', '2021-11-04 19:42:09', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Índices para tabela `extras`
--
ALTER TABLE `extras`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `medidas`
--
ALTER TABLE `medidas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome` (`nome`),
  ADD KEY `produtos_categoria_id_foreign` (`categoria_id`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD UNIQUE KEY `ativacao_hash` (`ativacao_hash`),
  ADD UNIQUE KEY `reset_hash` (`reset_hash`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `extras`
--
ALTER TABLE `extras`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `medidas`
--
ALTER TABLE `medidas`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
