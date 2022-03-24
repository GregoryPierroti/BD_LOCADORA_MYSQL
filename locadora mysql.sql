CREATE TABLE `genero` (
  `id` int PRIMARY KEY,
  `genero` varchar(255) NOT NULL
);

CREATE TABLE `filmes` (
  `id` int PRIMARY KEY,
  `titulo` varchar(255) NOT NULL,
  `id_genero` int NOT NULL,
  `valor` decimal(8,2) NOT NULL
);

CREATE TABLE `dvds` (
  `id` int PRIMARY KEY,
  `id_filmes` int NOT NULL,
  `quantidade` int NOT NULL
);

CREATE TABLE `atores` (
  `id` int PRIMARY KEY,
  `nome` varchar(255) NOT NULL
);

CREATE TABLE `atores_filme` (
  `id` int PRIMARY KEY,
  `id_filmes` int NOT NULL,
  `id_atores` int NOT NULL,
  `personagem` varchar(255) NOT NULL
);

CREATE TABLE `clientes` (
  `id` int PRIMARY KEY,
  `nome` varchar(255) NOT NULL,
  `sobrenome` varchar(255) NOT NULL,
  `telefone` varchar(255) NOT NULL,
  `endereco` varchar(255) NOT NULL
);

CREATE TABLE `emprestimos` (
  `id` int PRIMARY KEY,
  `data` datetime NOT NULL,
  `id_cliente` int NOT NULL
);

CREATE TABLE `filmes_emprestimos` (
  `id` int PRIMARY KEY,
  `id_emprestimo` int NOT NULL,
  `id_filmes` int
);

CREATE TABLE `devolucoes` (
  `id` int PRIMARY KEY,
  `id_emprestimo` int NOT NULL
);

CREATE TABLE `filmes_devolucao` (
  `id` int PRIMARY KEY,
  `id_devolucao` int NOT NULL,
  `id_filmes_emprestimos` int NOT NULL
);

ALTER TABLE `filmes` ADD FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id`);

ALTER TABLE `dvds` ADD FOREIGN KEY (`id_filmes`) REFERENCES `filmes` (`id`);

ALTER TABLE `atores_filme` ADD FOREIGN KEY (`id_filmes`) REFERENCES `filmes` (`id`);

ALTER TABLE `atores_filme` ADD FOREIGN KEY (`id_atores`) REFERENCES `atores` (`id`);

ALTER TABLE `emprestimos` ADD FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`);

ALTER TABLE `filmes_emprestimos` ADD FOREIGN KEY (`id_emprestimo`) REFERENCES `emprestimos` (`id`);

ALTER TABLE `filmes_emprestimos` ADD FOREIGN KEY (`id_filmes`) REFERENCES `filmes` (`id`);

ALTER TABLE `devolucoes` ADD FOREIGN KEY (`id_emprestimo`) REFERENCES `emprestimos` (`id`);

ALTER TABLE `filmes_devolucao` ADD FOREIGN KEY (`id_devolucao`) REFERENCES `devolucoes` (`id`);

ALTER TABLE `filmes_devolucao` ADD FOREIGN KEY (`id_filmes_emprestimos`) REFERENCES `filmes_emprestimos` (`id`);

ALTER TABLE `filmes` ADD FOREIGN KEY (`titulo`) REFERENCES `filmes` (`id`);
