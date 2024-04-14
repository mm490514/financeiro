CREATE DATABASE `financeiro` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;


-- financeiro.bancarias definition

CREATE TABLE `bancarias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `banco` varchar(255) DEFAULT NULL,
  `agencia` varchar(255) DEFAULT NULL,
  `conta` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `pessoa` varchar(255) DEFAULT NULL,
  `doc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- financeiro.bancos definition

CREATE TABLE `bancos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- financeiro.caixa definition

CREATE TABLE `caixa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data_abertura` date DEFAULT NULL,
  `valor_abertura` decimal(10,2) DEFAULT NULL,
  `usuario_abertura` int DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `saida` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- financeiro.cat_despesas definition

CREATE TABLE `cat_despesas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- financeiro.cat_produtos definition

CREATE TABLE `cat_produtos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- financeiro.clientes definition

CREATE TABLE `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `pessoa` varchar(255) DEFAULT NULL,
  `doc` varchar(255) DEFAULT NULL,
  `ativo` varchar(255) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `telefone` varchar(100) DEFAULT NULL,
  `endereco` varchar(500) DEFAULT NULL,
  `obs` text,
  `banco` varchar(100) DEFAULT NULL,
  `agencia` varchar(100) DEFAULT NULL,
  `conta` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- financeiro.cobrancas definition

CREATE TABLE `cobrancas` (
  `data` date DEFAULT NULL,
  `quantidade` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- financeiro.compras definition

CREATE TABLE `compras` (
  `id` int NOT NULL AUTO_INCREMENT,
  `valor` decimal(10,2) DEFAULT NULL,
  `usuario` int DEFAULT NULL,
  `pagamento` varchar(255) DEFAULT NULL,
  `lancamento` varchar(255) DEFAULT NULL,
  `data_lanc` date DEFAULT NULL,
  `data_pgto` date DEFAULT NULL,
  `parcelas` int DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `cliente` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- financeiro.config definition

CREATE TABLE `config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome_sistema` varchar(255) DEFAULT NULL,
  `email_adm` varchar(255) DEFAULT NULL,
  `endereco_site` varchar(255) DEFAULT NULL,
  `telefone_fixo` varchar(255) DEFAULT NULL,
  `telefone_whatsapp` varchar(255) DEFAULT NULL,
  `cnpj_site` varchar(255) DEFAULT NULL,
  `rodape_relatorios` varchar(255) DEFAULT NULL,
  `valor_multa` double DEFAULT NULL,
  `valor_juros_dia` double DEFAULT NULL,
  `frequencia_automatica` varchar(255) DEFAULT NULL,
  `relatorio_pdf` varchar(255) DEFAULT NULL,
  `fonte_comprovante` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `icone` varchar(255) DEFAULT NULL,
  `dias_carencia` int DEFAULT NULL,
  `alerta` date DEFAULT NULL,
  `impressao_automatica` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- financeiro.contas_despesa definition

CREATE TABLE `contas_despesa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `usuario` int DEFAULT NULL,
  `lancamento` varchar(255) DEFAULT NULL,
  `documento` varchar(255) DEFAULT NULL,
  `plano_conta` varchar(255) DEFAULT NULL,
  `fornecedor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- financeiro.contas_pagar definition

CREATE TABLE `contas_pagar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `cliente` varchar(255) DEFAULT NULL,
  `saida` decimal(10,2) DEFAULT NULL,
  `documento` varchar(255) DEFAULT NULL,
  `plano_conta` varchar(255) DEFAULT NULL,
  `data_emissao` date DEFAULT NULL,
  `vencimento` date DEFAULT NULL,
  `frequencia` varchar(255) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `usuario_lanc` int DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `data_recor` date DEFAULT NULL,
  `id_compra` int DEFAULT NULL,
  `arquivo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- financeiro.contas_receber definition

CREATE TABLE `contas_receber` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `data_emissao` date DEFAULT NULL,
  `vencimento` date DEFAULT NULL,
  `frequencia` varchar(255) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `usuario_lanc` int DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `id_venda` int DEFAULT NULL,
  `arquivo` varchar(255) DEFAULT NULL,
  `cliente` int DEFAULT NULL,
  `entrada` varchar(100) DEFAULT NULL,
  `documento` varchar(100) DEFAULT NULL,
  `plano_conta` varchar(100) DEFAULT NULL,
  `data_recor` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- financeiro.despesas definition

CREATE TABLE `despesas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `cat_despesa` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- financeiro.formas_pgtos definition

CREATE TABLE `formas_pgtos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `taxa` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- financeiro.fornecedores definition

CREATE TABLE `fornecedores` (
  `id` int DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `pessoa` varchar(255) DEFAULT NULL,
  `doc` varchar(255) DEFAULT NULL,
  `ativo` varchar(255) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `telefone` varchar(100) DEFAULT NULL,
  `endereco` text,
  `obs` text,
  `banco` varchar(100) DEFAULT NULL,
  `agencia` varchar(100) DEFAULT NULL,
  `conta` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- financeiro.frequencias definition

CREATE TABLE `frequencias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- financeiro.itens_compra definition

CREATE TABLE `itens_compra` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_compra` int DEFAULT NULL,
  `produto` varchar(255) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `usuario` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- financeiro.itens_venda definition

CREATE TABLE `itens_venda` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_venda` int DEFAULT NULL,
  `produto` int DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `usuario` int DEFAULT NULL,
  `valor_custo` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- financeiro.movimentacoes definition

CREATE TABLE `movimentacoes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) DEFAULT NULL,
  `movimento` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `usuario` int DEFAULT NULL,
  `data` date DEFAULT NULL,
  `lancamento` varchar(255) DEFAULT NULL,
  `plano_conta` varchar(255) DEFAULT NULL,
  `documento` varchar(255) DEFAULT NULL,
  `caixa_periodo` varchar(255) DEFAULT NULL,
  `id_mov` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- financeiro.niveis definition

CREATE TABLE `niveis` (
  `nivel` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- financeiro.nome_da_tabela definition

CREATE TABLE `nome_da_tabela` (
  `id` int NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- financeiro.produtos definition

CREATE TABLE `produtos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `descricao` text,
  `preco` decimal(10,2) DEFAULT NULL,
  `estoque` int DEFAULT NULL,
  `ativo` varchar(255) DEFAULT NULL,
  `nivel` int DEFAULT NULL,
  `categoria` int DEFAULT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `valor_compra` decimal(10,2) DEFAULT NULL,
  `valor_venda` decimal(10,2) DEFAULT NULL,
  `fornecedor` varchar(100) DEFAULT NULL,
  `foto` text,
  `lucro` decimal(10,2) DEFAULT NULL,
  `telefone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- financeiro.token definition

CREATE TABLE `token` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- financeiro.usuarios definition

CREATE TABLE `usuarios` (
  `nome` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `nivel` varchar(255) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- financeiro.valor_parcial definition

CREATE TABLE `valor_parcial` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_conta` int DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `usuario` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- financeiro.vendas definition

CREATE TABLE `vendas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `valor` decimal(10,2) DEFAULT NULL,
  `usuario` int DEFAULT NULL,
  `pagamento` varchar(255) DEFAULT NULL,
  `lancamento` varchar(255) DEFAULT NULL,
  `data_lanc` date DEFAULT NULL,
  `data_pgto` date DEFAULT NULL,
  `desconto` decimal(10,2) DEFAULT NULL,
  `acrescimo` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `parcelas` int DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `cliente` varchar(255) DEFAULT NULL,
  `valor_custo` decimal(10,2) DEFAULT NULL,
  `recebido` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;