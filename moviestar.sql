-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03/11/2022 às 23:47
-- Versão do servidor: 10.4.24-MariaDB
-- Versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `swe`
--

DELIMITER $$
--
-- Funções
--
CREATE DEFINER=`root`@`localhost` FUNCTION `hello` (`texto` CHAR(20)) RETURNS CHAR(50) CHARSET utf8mb4  BEGIN
	
	RETURN CONCAT('hello', texto, '!');
	
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `soma` (`n1` FLOAT, `n2` FLOAT) RETURNS FLOAT  BEGIN
	
DECLARE resultado FLOAT;

SET resultado = n1 + n2;

RETURN resultado;
	
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `movies`
--

CREATE TABLE `movies` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `trailer` varchar(150) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `lenght` varchar(50) DEFAULT NULL,
  `users_id` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) UNSIGNED NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `review` text DEFAULT NULL,
  `users_id` int(11) UNSIGNED DEFAULT NULL,
  `movies_id` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `lastname` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `token` varchar(200) DEFAULT NULL,
  `bio` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `name`, `lastname`, `email`, `password`, `image`, `token`, `bio`) VALUES
(6, 'teste', 'teste 1', 'teste@teste', '$2y$10$N7PkBTNrnogvCkXxjhLRDuTHc9UxQKTK6/duNLAgh/1FCQujEeCXe', NULL, '38fb2061ac0e903b435346a719a783e4f6de098b6bc4bdfa52d35ed0a3b94f06140694dbf59f335248d3e2047f84351a0677', NULL),
(7, 'teste3', 'teste3', 'teste3@teste3', '$2y$10$mcYrbOV0JXjkTjR67vzjxOsLsXSVNl50yB599CbAphkN7HHqvmH/C', NULL, 'd804be4923838fcc857dc9b9f239dc06ba065d43cc35bce395c35d7428bbef02c558d821202262b7a3a333e8f815551bbf47', NULL),
(8, 'teste4', 'teste4', 'teste4@teste4', '$2y$10$cqKtbBu6RtwBTqXa30lyYeo0J3VcCJDmIfcAJ2qzIIVeCmItuhCOG', NULL, 'f7a33d8cbd9217d8eef76a4a60aff163cdba8fdb5005655cb7c48011fd6a6c3e039a5f43fb524db1819adb8fee26b6abee28', NULL),
(9, 'teste1', 'teste', 'teste1@teste1', '$2y$10$jdxWnn7y7JoGsKCC2rzlJ.zHeCT5cLOXaR4NgRttiGAHUdLtHThGK', NULL, '09361426615628877f18284756f226d0d5098342de3dbbebfef5a00e0ccc99e6cb70ac2e08642b244b00a9cafd088ea79123', NULL),
(10, 'regis', 'ferreira', 'regis_ginho@gmail.com', '$2y$10$2J3h8TxKPoPrSJAWmxU9fuc2cNg6EXlNX6S68kN/db31VJxkDktl.', NULL, 'ccb62ed4f65301e6727ee48e765618d53a75a63d63b85ee2f1dac6866951e43c050a3e34e528cd9829304a3444da64fb735c', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`users_id`);

--
-- Índices de tabela `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `movies_id` (`movies_id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Restrições para tabelas `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`movies_id`) REFERENCES `movies` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
