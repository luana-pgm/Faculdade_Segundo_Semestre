CREATE DATABASE veterinaria;
 
USE veterinaria;
 
CREATE TABLE IF NOT EXISTS `veterinaria`.`Cliente` (
  `id` VARCHAR(16) PRIMARY KEY NOT NULL,
  `nome` VARCHAR(45) NOT NULL, 
  `fone` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL);
  
 
-- -----------------------------------------------------
-- Table `veterinaria`.`Animal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veterinaria`.`Animal` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(20) NOT NULL,
  `especie` VARCHAR(45) NOT NULL,
  `idade` INT NULL,
  `peso` FLOAT NULL,
  `Cliente_id` VARCHAR(16) NOT NULL,
    FOREIGN KEY (`Cliente_id`) REFERENCES `veterinaria1`.`Cliente` (`id`));
 
 
-- -----------------------------------------------------
-- Table `veterinaria`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veterinaria1`.`Funcionario` (
  `id` INT PRIMARY KEY NOT NULL,
  `nome` VARCHAR(45) NULL,
  `funcao` VARCHAR(45) NULL);
 
 
-- -----------------------------------------------------
-- Table `veterinaria`.`pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veterinaria1`.`pagamento` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `forma_pagamento` VARCHAR(45) NULL);
 
 
-- -----------------------------------------------------
-- Table `veterinaria`.`Venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veterinaria1`.`Venda` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `Funcionario_id` INT NOT NULL,
  `Cliente_id` VARCHAR(16) NOT NULL,
  `pagamento_id` INT NOT NULL,
  `Data_hora` DATETIME NOT NULL,
   FOREIGN KEY (`Funcionario_id`) REFERENCES `veterinaria1`.`Funcionario` (`id`),
   FOREIGN KEY (`Cliente_id`) REFERENCES `veterinaria1`.`Cliente` (`id`),
   FOREIGN KEY (`pagamento_id`) REFERENCES `veterinaria1`.`pagamento` (`id`));
 
 
-- -----------------------------------------------------
-- Table `veterinaria`.`Servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veterinaria1`.`Servico` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  `preco` DECIMAL NOT NULL,
  `Funcionario_id` INT NOT NULL,
    FOREIGN KEY (`Funcionario_id`) REFERENCES `veterinaria1`.`Funcionario` (`id`));
 
 
-- -----------------------------------------------------
-- Table `veterinaria`.`Fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veterinaria1`.`Fornecedor` (
  `id` VARCHAR(20) PRIMARY KEY NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `fone` VARCHAR(15) NOT NULL,
  `email` VARCHAR(45) NOT NULL);
  
 
-- -----------------------------------------------------
-- Table `veterinaria`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veterinaria1`.`Endereco` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `uf` VARCHAR(2) NOT NULL,
  `cep` VARCHAR(9) NOT NULL,
  `numero` INT NOT NULL,
  `bairro` VARCHAR(45) NULL,
  `Cliente_id` VARCHAR(16) NULL,
  `Fornecedor_id` VARCHAR(20) NULL,
   FOREIGN KEY (`Cliente_id`) REFERENCES `veterinaria1`.`Cliente` (`id`),
   FOREIGN KEY (`Fornecedor_id`) REFERENCES `veterinaria1`.`Fornecedor` (`id`));
 
 
-- -----------------------------------------------------
-- Table `veterinaria`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veterinaria1`.`Produto` (
  `id` INT PRIMARY KEY NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  `quantidade` INT NOT NULL,
  `preco` VARCHAR(45) NULL);
 
-- -----------------------------------------------------
-- Table `veterinaria`.`itens_venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veterinaria1`.`itens_venda` (
  `Venda_idVenda` INT PRIMARY KEY NOT NULL,
  `servico-produto_codigo` INT NULL,
  `Produto_id` INT NULL,
    FOREIGN KEY (`Venda_idVenda`) REFERENCES `veterinaria1`.`Venda` (`id`),
    FOREIGN KEY (`servico-produto_codigo`) REFERENCES `veterinaria1`.`Servico` (`id`),
    FOREIGN KEY (`Produto_id`) REFERENCES `veterinaria1`.`Produto` (`id`));
 
 
-- -----------------------------------------------------
-- Table `veterinaria`.`Fornece_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veterinaria1`.`Fornece_produto` (
  `Fornecedor_id` VARCHAR(20) PRIMARY KEY NOT NULL,
  `Produto_id` INT NOT NULL,
    FOREIGN KEY (`Fornecedor_id`) REFERENCES `veterinaria1`.`Fornecedor` (`id`),
    FOREIGN KEY (`Produto_id`) REFERENCES `veterinaria1`.`Produto` (`id`));
 
 
-- -----------------------------------------------------
-- Table `veterinaria`.`Cliente_Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veterinaria1`.`Cliente_Produto` (
  `Cliente_id` VARCHAR(16) NULL,
  `Produto_id` INT NULL,
    FOREIGN KEY (`Cliente_id`) REFERENCES `veterinaria1`.`Cliente` (`id`),
    FOREIGN KEY (`Produto_id`) REFERENCES `veterinaria1`.`Produto` (`id`));
-- -----------------------------------------------------
-- Table `veterinaria`.`Cliente_Servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veterinaria1`.`Cliente_Servico` (
  `Cliente_id` VARCHAR(16) NULL,
  `Servico_id` INT NULL,
    FOREIGN KEY (`Cliente_id`) REFERENCES `veterinaria1`.`Cliente` (`id`),
    FOREIGN KEY (`Servico_id`) REFERENCES `veterinaria1`.`Servico` (`id`));
    

Scripts de INSERT:

/*
os cpf foram gerados de forma aleatória no seguinte site: https://www.4devs.com.br/gerador_de_cpf
os nomes dos clientes também foram gerados pelo site: https://www.4devs.com.br/gerador_de_nomes
*/
-- populando tabela de cliente
INSERT INTO veterinaria.Cliente (id, nome, fone, email) VALUES
('12057183021', 'Bumbwe', '(11) 99876-5432', 'bumbwe@email.com'),
('14719263038', 'Reaion', '(31) 99234-5678', 'reaion@email.com'),
('18315064088', 'Geurt', '(41) 99123-4567', 'geurt@email.com'),
('66739827052', 'Irloaim', '(51) 99765-4321', 'irloaim@email.com'),
('79601875093', 'Nusriogu', '(61) 99654-3210', 'nusriogu@email.com'),
('37861896099', 'Arangaxu', '(71) 99543-2109', 'arangaxu@email.com'),
('94136733062', 'Nuawuidir', '(81) 99321-0987', 'nuawuidir@email.com'),
('57439573048', 'Zavukas', '(91) 99432-1098', 'zavukas@email.com'),
('11871755018', 'Yatudiotub', '(48) 99234-7654', 'yatudiotub@email.com');
 
INSERT INTO veterinaria.Cliente (id, nome, fone, email) VALUES
('12057103022', 'João Silva', '(11) 98765-4321', 'joao@email.com'),
('12057193023', 'Maria Santos', '(31) 97654-3210', 'maria@email.com'),
('14719263024', 'José Oliveira', '(41) 96543-2109', 'jose@email.com'),
('18315064025', 'Ana Pereira', '(51) 95432-1098', 'ana@email.com'),
('12057103026', 'Carlos Souza', '(61) 94321-0987', 'carlos@email.com'),
('12057193027', 'Mariana Costa', '(71) 93210-9876', 'mariana@email.com'),
('14719263028', 'Pedro Martins', '(81) 92109-8765', 'pedro@email.com'),
('18315064029', 'Laura Ferreira', '(91) 91098-7654', 'laura@email.com'),
('12057103030', 'Fernando Almeida', '(48) 90987-6543', 'fernando@email.com'),
('12057193031', 'Juliana Rocha', '(00) 90000-0000', 'juliana@email.com');
 
 
-- Populando tabela cliente_produto
INSERT INTO veterinaria.Cliente_Produto (Cliente_id, Produto_id) VALUES
('12057103021', 1),
('12057103021', 2),
('12057103021', 3),
('12057103021', 4),
('12057103021', 5),
('12057193021', 6),
('12057193021', 7),
('12057193021', 8),
('12057193021', 9),
('12057193021', 10),
('14719263038', 11),
('14719263038', 12),
('14719263038', 13),
('14719263038', 14),
('14719263038', 15),
('18315064088', 16),
('18315064088', 17),
('18315064088', 18),
('18315064088', 19),
('18315064088', 20),
('66739827052', 21),
('66739827052', 22),
('66739827052', 23),
('66739827052', 24),
('66739827052', 25),
('79601875093', 26),
('79601875093', 27),
('79601875093', 28),
('79601875093', 29),
('79601875093', 30),
('37861896099', 31),
('37861896099', 32),
('37861896099', 33),
('37861896099', 34);
 
 
-- Populando tabela cliente_servico
INSERT INTO veterinaria.Cliente_Servico (Cliente_id, Servico_id) VALUES
('12057103021', 1),
('12057103021', 2),
('12057103021', 3),
('12057103021', 4),
('12057103021', 5),
('12057193021', 6),
('12057193021', 7),
('12057193021', 8),
('12057193021', 9),
('12057193021', 10),
('14719263038', 11),
('14719263038', 12),
('14719263038', 13),
('14719263038', 14),
('14719263038', 15),
('18315064088', 16),
('18315064088', 17),
('18315064088', 18),
('18315064088', 19),
('18315064088', 20),
('66739827052', 21),
('66739827052', 22),
('66739827052', 23),
('66739827052', 24),
('66739827052', 25),
('79601875093', 26),
('79601875093', 27),
('79601875093', 28),
('79601875093', 29),
('79601875093', 30),
('37861896099', 31),
('37861896099', 32),
('37861896099', 33),
('37861896099', 34);
 
 
-- populando tabela de animais 
INSERT INTO `veterinaria`.`Animal` (`id`, `nome`, `especie`, `idade`, `peso`, `Cliente_id`) VALUES
(1, 'Rex', 'Cachorro', 5, 20.5, '12057103021'),
(2, 'Dory', 'Peixe', 3, 0.1, '12057193021'),
(3, 'Bolinha', 'Cachorro', 2, 10.4, '12057103021'),
(4, 'Pipoca', 'Papagaio', 1, 0.9, '12057103021'),
(5, 'Luna', 'Cachorro', 4, 15.6, '14719263038'),
(6, 'Mel', 'Gato', 6, 5.3, '66739827052'),
(7, 'Blu', 'Arara', 3, 1.2, '18315064088'),  -- Corrigido Cliente_id
(8, 'Felix', 'Gato', 2, 4.1, '14719263038'), -- Corrigido Cliente_id
(9, 'Apolo', 'Cachorro', 7, 30.0, '66739827052'),
(10, 'Simba', 'Gato', 5, 6.5, '79601875093'),
(11, 'Zoe', 'Coelho', 8, 4.4, '79601875093'),
(12, 'Olaf', 'Furão', 4, 1.7, '37861896099'),
(13, 'Lola', 'Cachorro', 6, 12.2, '37861896099'),
(14, 'Bella', 'Gato', 7, 4.7, '94136733062'),
(15, 'Max', 'Cachorro', 9, 33.3, '57439573048'),
(16, 'Tom', 'Tucano', 10, 1.7, '57439573048'),
(17, 'Amora', 'Cachorro', 11, 24.4, '11871755018'),
(18, 'Jerry', 'Rato', 12, 0.1, '11871755018');
 
-- Populando tabela pagamento
INSERT INTO veterinaria.pagamento (id, forma_pagamento) VALUES
(1, 'Cartão de Crédito'),
(2, 'Cartão de Débito'),
(3, 'Dinheiro'),
(4, 'Pix'),
(5, 'Transferência Bancária'),
(6, 'Cheque'),
(7, 'Vale Alimentação'),
(8, 'Crédito Loja');
 
 
 
-- populando tabela de fornecedor 
INSERT INTO veterinaria.fornecedor (`id`, `nome`, `fone`, `email`) VALUES
('98.765.432/0001-99', 'Maria', '98765-4321', 'maria@example.com'),
('12.345.678/0001-00', 'Pedro', '97654-3210', 'pedro@example.com'),
('11.223.344/0001-11', 'Felipe', '99887-6655', 'lucas@example.com'),
('55.667.778/0001-22', 'Ana', '98877-5432', 'ana@example.com'),
('33.444.555/0001-33', 'José', '97654-3210', 'jose@example.com'),
('44.555.666/0001-44', 'Carla', '98765-4321', 'carla@example.com'),
('66.777.888/0001-55', 'Marcos', '99887-6655', 'marcos@example.com');
 
 
 
 
-- populando tabela de funcionario
 
INSERT INTO veterinaria.funcionario (id, nome, funcao) VALUES 
('123456789', 'João Silva', 'Veterinário'),
('987654321', 'Maria Santos', 'Atendente'),
('456789123', 'Pedro Oliveira', 'Auxiliar'),
('789123456', 'Ana Pereira', 'Administrador'),
('111111111', 'Carlos Almeida', 'Veterinário'),
('222222222', 'Fernanda Costa', 'Atendente'),
('333333333', 'Luis Santos', 'Auxiliar'),
('444444444', 'Patricia Lima', 'Administrador'),
('555555555', 'Roberto Nunes', 'Veterinário'),
('666666666', 'Juliana Moreira', 'Atendente'),
('777777777', 'Bruno Souza', 'Auxiliar'),
('888888888', 'Amanda Ferreira', 'Administrador'),
('999999999', 'Ricardo Ribeiro', 'Veterinário'),
('101010101', 'Sofia Martins', 'Atendente');
 
 
-- populando tabela servico
 
INSERT INTO veterinaria.Servico (id, descricao, preco, Funcionario_id) VALUES
(1, 'Consulta Veterinária', 100.00, 123456789),
(2, 'Vacinação', 50.00, 123456789),
(3, 'Banho e Tosa', 70.00, 456789123),
(4, 'Exame de Sangue', 150.00, 789123456),
(5, 'Ultrassom', 200.00, 123456789),
(6, 'Cirurgia', 500.00, 123456789),
(7, 'Aplicação de Microchip', 80.00, 456789123),
(8, 'Limpeza Dentária', 120.00, 789123456),
(9, 'Consulta Dermatológica', 110.00, 123456789),
(10, 'Consulta Oftalmológica', 130.00, 987654321),
(11, 'Fisioterapia', 90.00, 456789123),
(12, 'Hidroterapia', 100.00, 789123456),
(13, 'Internação', 300.00, 111111111),
(14, 'Sessão de Acupuntura', 80.00, 123456789),
(15, 'Exame de Fezes', 40.00, 222222222),
(16, 'Exame de Urina', 45.00, 333333333),
(17, 'Consulta de Rotina', 60.00, 444444444),
(18, 'Radiografia', 150.00, 555555555),
(19, 'Ecocardiograma', 250.00, 666666666),
(20, 'Consulta de Emergência', 180.00, 777777777),
(21, 'Aplicação de Vacina', 55.00, 888888888),
(22, 'Retirada de Pontos', 30.00, 999999999),
(23, 'Tratamento de Pulgas', 70.00, 101010101),
(24, 'Tratamento de Carrapatos', 70.00, 123456789),
(25, 'Corte de Unhas', 25.00, 987654321),
(26, 'Consulta Comportamental', 90.00, 456789123),
(27, 'Consulta Nutricional', 100.00, 789123456),
(28, 'Acompanhamento Pós-Operatório', 120.00, 111111111),
(29, 'Tratamento de Alergias', 110.00, 222222222),
(30, 'Consulta Ortopédica', 140.00, 333333333),
(31, 'Consulta Neurológica', 160.00, 444444444),
(32, 'Exame Cardiológico', 200.00, 555555555),
(33, 'Consulta Endocrinológica', 150.00, 666666666),
(34, 'Consulta Oncológica', 180.00, 777777777),
(35, 'Consulta Geriátrica', 130.00, 888888888);
 
-- populando tabela produto
INSERT INTO veterinaria.Produto (id, descricao, quantidade, preco) VALUES
(1, 'Ração Canina', 50, '100.00'),
(2, 'Ração Felina', 30, '80.00'),
(3, 'Medicamento A', 20, '150.00'),
(4, 'Brinquedo para Cães', 40, '30.00'),
(5, 'Coleira Antipulgas', 25, '60.00'),
(6, 'Shampoo para Cães', 15, '25.00'),
(7, 'Arranhador para Gatos', 10, '70.00'),
(8, 'Ração para Peixes', 35, '20.00'),
(9, 'Medicamento B', 10, '200.00'),
(10, 'Osso de Brinquedo', 50, '15.00'),
(11, 'Casinha para Cães', 5, '300.00'),
(12, 'Bebedouro Automático', 12, '120.00'),
(13, 'Areia para Gatos', 40, '35.00'),
(14, 'Ração para Aves', 30, '40.00'),
(15, 'Medicamento C', 8, '180.00'),
(16, 'Brinquedo para Gatos', 50, '25.00'),
(17, 'Ração Premium Canina', 20, '150.00'),
(18, 'Ração Premium Felina', 15, '130.00'),
(19, 'Toca para Gatos', 10, '80.00'),
(20, 'Coleira para Gatos', 25, '20.00'),
(21, 'Medicamento D', 18, '220.00'),
(22, 'Brinquedo para Roedores', 30, '15.00'),
(23, 'Comedouro para Cães', 20, '50.00'),
(24, 'Comedouro para Gatos', 20, '45.00'),
(25, 'Ração para Coelhos', 25, '60.00'),
(26, 'Medicamento E', 12, '250.00'),
(27, 'Brinquedo para Pássaros', 35, '20.00'),
(28, 'Vitamina para Cães', 30, '90.00'),
(29, 'Vitamina para Gatos', 30, '85.00'),
(30, 'Ração para Hamsters', 25, '40.00'),
(31, 'Medicamento F', 8, '210.00'),
(32, 'Cama para Cães', 10, '150.00'),
(33, 'Cama para Gatos', 10, '140.00'),
(34, 'Ração para Furões', 15, '70.00');
 
 
 
-- Endereços para fornecedores
INSERT INTO `veterinaria`.`Endereco` (`uf`, `cep`, `numero`, `bairro`, `Cliente_id`, `Fornecedor_id`)
VALUES 
('SP', '01234-567', 123, 'Centro', NULL, '98.765.432/0001-99'),
('RJ', '98765-432', 456, 'Copacabana', NULL, '12.345.678/0001-00'),
('MG', '54321-098', 789, 'Industrial', NULL, '11.223.344/0001-11'),
('SP', '13579-246', 987, 'Comercial', NULL, '55.667.778/0001-22');
 
INSERT INTO `veterinaria`.`Endereco` (`uf`, `cep`, `numero`, `bairro`, `Cliente_id`, `Fornecedor_id`)
VALUES 
('RS', '87654-321', 321, 'Residencial', NULL, '33.444.555/0001-33'),
('BA', '23456-789', 654, 'Praia', NULL, '44.555.666/0001-44'),
('SC', '65432-109', 987, 'Centro', NULL, '66.777.888/0001-55');
('RJ', '23456-789', 654, 'Copacabana', '12057193021', NULL),
('MG', '34567-890', 987, 'Centro', '14719263038', NULL),
('PR', '45678-901', 123, 'Batel', '18315064088', NULL),
('RS', '56789-012', 456, 'Moinhos de Vento', '66739827052', NULL),
('DF', '67890-123', 789, 'Asa Sul', '79601875093', NULL),
('BA', '78901-234', 987, 'Barra', '37861896099', NULL),
('PE', '89012-345', 123, 'Boa Viagem', '94136733062', NULL),
('PA', '90123-456', 456, 'Nazaré', '57439573048', NULL),
('SC', '01234-567', 789, 'Centro', '11871755018', NULL),
('SP', '54321-098', 321, 'Moema', '12057103122', NULL),
('RJ', '65432-109', 654, 'Leblon', '12057193123', NULL),
('MG', '76543-210', 987, 'Savassi', '14719263124', NULL),
('PR', '87654-321', 123, 'Centro', '18315064125', NULL),
('RS', '98765-432', 456, 'Moinhos de Vento', '66739827126', NULL),
('DF', '09876-543', 789, 'Asa Sul', '79601875127', NULL),
('BA', '98765-654', 987, 'Barra', '37861896128', NULL),
('PE', '87654-321', 123, 'Boa Viagem', '94136733129', NULL),
('PA', '76543-210', 456, 'Nazaré', '57439573130', NULL),
('SC', '65432-109', 789, 'Centro', '11871755131', NULL),
('SP', '54321-098', 321, 'Moema', '13047103222', NULL),
('RJ', '65432-109', 654, 'Leblon', '14057193223', NULL),
('MG', '76543-210', 987, 'Savassi', '15719263324', NULL),
('PR', '87654-321', 123, 'Centro', '18315064225', NULL),
('RS', '98765-432', 456, 'Moinhos de Vento', '66739827226', NULL),
('DF', '09876-543', 789, 'Asa Sul', '79601875227', NULL),
('BA', '98765-654', 987, 'Barra', '37861896228', NULL),
('PE', '87654-321', 123, 'Boa Viagem', '94136733229', NULL),
('PA', '76543-210', 456, 'Nazaré', '57439573230', NULL),
('SC', '65432-109', 789, 'Centro', '11871755231', NULL),
('SP', '54321-098', 321, 'Moema', '13047103332', NULL),
('RJ', '65432-109', 654, 'Leblon', '14057193333', NULL),
('MG', '76543-210', 987, 'Savassi', '15719263434', NULL),
('PR', '87654-321', 123, 'Centro', '18315064335', NULL),
('RS', '98765-432', 456, 'Moinhos de Vento', '66739827336', NULL),
('DF', '09876-543', 789, 'Asa Sul', '79601875337', NULL),
('BA', '98765-654', 987, 'Barra', '37861896338', NULL),
('PE', '87654-321', 123, 'Boa Viagem', '94136733339', NULL),
('PA', '76543-210', 456, 'Nazaré', '57439573340', NULL),
('SC', '65432-109', 789, 'Centro', '11871755341', NULL);
 
 
 
 
INSERT INTO veterinaria.Servico (id, descricao, preco, Funcionario_id) VALUES
(1, 'Consulta Veterinária', 100.00, 123456789),
(2, 'Vacinação', 50.00, 123456789),
(3, 'Banho e Tosa', 70.00, 456789123),
(4, 'Exame de Sangue', 150.00, 789123456),
(5, 'Ultrassom', 200.00, 123456789),
(6, 'Cirurgia', 500.00, 123456789),
(7, 'Aplicação de Microchip', 80.00, 456789123),
(8, 'Limpeza Dentária', 120.00, 789123456),
(9, 'Consulta Dermatológica', 110.00, 123456789),
(10, 'Consulta Oftalmológica', 130.00, 987654321),
(11, 'Fisioterapia', 90.00, 456789123),
(12, 'Hidroterapia', 100.00, 789123456),
(13, 'Internação', 300.00, 111111111),
(14, 'Sessão de Acupuntura', 80.00, 123456789),
(15, 'Exame de Fezes', 40.00, 222222222),
(16, 'Exame de Urina', 45.00, 333333333),
(17, 'Consulta de Rotina', 60.00, 444444444),
(18, 'Radiografia', 150.00, 555555555),
(19, 'Ecocardiograma', 250.00, 666666666),
(20, 'Consulta de Emergência', 180.00, 777777777),
(21, 'Aplicação de Vacina', 55.00, 888888888),
(22, 'Retirada de Pontos', 30.00, 999999999),
(23, 'Tratamento de Pulgas', 70.00, 101010101),
(24, 'Tratamento de Carrapatos', 70.00, 123456789),
(25, 'Corte de Unhas', 25.00, 987654321),
(26, 'Consulta Comportamental', 90.00, 456789123),
(27, 'Consulta Nutricional', 100.00, 789123456),
(28, 'Acompanhamento Pós-Operatório', 120.00, 111111111),
(29, 'Tratamento de Alergias', 110.00, 222222222),
(30, 'Consulta Ortopédica', 140.00, 333333333),
(31, 'Consulta Neurológica', 160.00, 444444444),
(32, 'Exame Cardiológico', 200.00, 555555555),
(33, 'Consulta Endocrinológica', 150.00, 666666666),
(34, 'Consulta Oncológica', 180.00, 777777777),
(35, 'Consulta Geriátrica', 130.00, 888888888);
 
 
-- populando tabela produto
INSERT INTO veterinaria.Produto (id, descricao, quantidade, preco) VALUES
(1, 'Ração Canina', 50, '100.00'),
(2, 'Ração Felina', 30, '80.00'),
(3, 'Medicamento A', 20, '150.00'),
(4, 'Brinquedo para Cães', 40, '30.00'),
(5, 'Coleira Antipulgas', 25, '60.00'),
(6, 'Shampoo para Cães', 15, '25.00'),
(7, 'Arranhador para Gatos', 10, '70.00'),
(8, 'Ração para Peixes', 35, '20.00'),
(9, 'Medicamento B', 10, '200.00'),
(10, 'Osso de Brinquedo', 50, '15.00'),
(11, 'Casinha para Cães', 5, '300.00'),
(12, 'Bebedouro Automático', 12, '120.00'),
(13, 'Areia para Gatos', 40, '35.00'),
(14, 'Ração para Aves', 30, '40.00'),
(15, 'Medicamento C', 8, '180.00'),
(16, 'Brinquedo para Gatos', 50, '25.00'),
(17, 'Ração Premium Canina', 20, '150.00'),
(18, 'Ração Premium Felina', 15, '130.00'),
(19, 'Toca para Gatos', 10, '80.00'),
(20, 'Coleira para Gatos', 25, '20.00'),
(21, 'Medicamento D', 18, '220.00'),
(22, 'Brinquedo para Roedores', 30, '15.00'),
(23, 'Comedouro para Cães', 20, '50.00'),
(24, 'Comedouro para Gatos', 20, '45.00'),
(25, 'Ração para Coelhos', 25, '60.00'),
(26, 'Medicamento E', 12, '250.00'),
(27, 'Brinquedo para Pássaros', 35, '20.00'),
(28, 'Vitamina para Cães', 30, '90.00'),
(29, 'Vitamina para Gatos', 30, '85.00'),
(30, 'Ração para Hamsters', 25, '40.00'),
(31, 'Medicamento F', 8, '210.00'),
(32, 'Cama para Cães', 10, '150.00'),
(33, 'Cama para Gatos', 10, '140.00'),
(34, 'Ração para Furões', 15, '70.00');
 
 
-- populando tabela venda
 
INSERT INTO veterinaria.Venda (id, Funcionario_id, Cliente_id, pagamento_id, Data_hora) VALUES
(1, 123456789, '12057103021', 1, '2023-05-19 10:30:00'),
(2, 987654321, '12057193021', 2, '2023-05-19 11:00:00'),
(3, 456789123, '14719263038', 3, '2023-05-19 11:30:00'),
(4, 789123456, '18315064088', 4, '2023-05-19 12:00:00'),
(5, 123456789, '12057103022', 5, '2023-05-20 10:30:00'),
(6, 987654321, '12057193023', 6, '2023-05-20 11:00:00'),
(7, 456789123, '14719263024', 7, '2023-05-20 11:30:00'),
(8, 789123456, '18315064025', 8, '2023-05-20 12:00:00'),
(9, 123456789, '12057103026', 1, '2023-05-21 10:30:00'),
(10, 987654321, '12057193027', 2, '2023-05-21 11:00:00'),
(11, 456789123, '14719263028', 3, '2023-05-21 11:30:00'),
(12, 789123456, '18315064029', 4, '2023-05-21 12:00:00'),
(13, 123456789, '12057103030', 5, '2023-05-22 10:30:00'),
(14, 987654321, '12057193031', 6, '2023-05-22 11:00:00');
 
-- Populando tabela itens_venda
 
INSERT INTO veterinaria.itens_venda (Venda_idVenda, `servico-produto_codigo`, Produto_id) VALUES
(1, NULL, 1),
(2, 1, NULL),
(3, NULL, 2),
(4, 2, NULL),
(5, NULL, 2),
(6, 3, NULL),
(7, NULL, 4),
(8, 7, 6);
