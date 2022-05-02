-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01-Maio-2022 às 21:15
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `twizards`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `user` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `pass` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `user`
--

INSERT INTO `user` (`id`, `user`, `name`, `pass`) VALUES
(1, '1231', '31231', '$2b$10$HFWrPeMtqAKlL3evPs2fOumVmDoCMvsdm32SRgVQeGx6SdJ6S3CZK'),
(2, '1232132', '132131', '$2b$10$erSTIZ1vIaSh94yABgiTp./Oh8Csfm56PIQMSj2FouWwSITRgzLQG'),
(3, 'turzinho', 'Artur', '$2b$10$IjCvM9.W53LL9nf5by7eQeKJLssI9/YdH3TAprmzey9/wQDTdw1P.'),
(4, '1233333', '123', '$2b$10$blOatNC9bp8TU5zQtgEPW.AAki065YKWr9kHouSBaEf7YxprhRW96'),
(5, 'a', 'a', '$2b$10$IYXyKgvcBguqv8pyLtJpA.VjlVsZlY8CRaQC6um59XGLBt.tqzSx.'),
(6, '1', '1', '$2b$10$jOq9yvzE8Cv9MjGYkYCAUOagu9lU1IeCDzUCjky642x68NEZ29MZ2'),
(7, '123123213', '21321321', '$2b$10$cyov4BvYxciTeKO.Y/wOSOEkmyfjYeruBBLcR3nU9vr7gavzspLVS'),
(8, 'peep', 'Pedro Fernandes', '$2b$10$w3.6G67fAGv/CiT6GwdMHeTjwx5xeLb0c6oLTn5PXrG4qWiSMlWtO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `wizards`
--

CREATE TABLE `wizards` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(200) NOT NULL,
  `img` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `wizards`
--

INSERT INTO `wizards` (`id`, `name`, `description`, `img`) VALUES
(15, 'Bill Gates', 'Bill Gates é um empresário americano mundialmente ', 'e13caaac3d5060ada3f32f610a33ce34.jpeg'),
(16, 'Dennis Ritchie', 'A true trailblazer in the field of computer technology, Dennis MacAlistair Ritchie, born on Sept. 9, 1941 in Bronxville, New York, is credited with the 1972 creation of one of the world’s most popular', '1a765ec7bab1bbe948cea5b8dbcf3163.jpeg'),
(17, 'Terry Davis', 'Terrence Andrew Davis (December 15, 1969 – August 11, 2018) was an American programmer who is most known for creating and designing the TempleOS operating system. Its development was an extremely comp', 'b0394475b2b5f2318436fb824926e51c.jpeg');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `wizards`
--
ALTER TABLE `wizards`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `wizards`
--
ALTER TABLE `wizards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
