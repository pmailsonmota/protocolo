CREATE DATABASE  IF NOT EXISTS `protocolo` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `protocolo`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: b-16-0030-dipla-vm02.brazilsouth.cloudapp.azure.com    Database: protocolo
-- ------------------------------------------------------
-- Server version	5.7.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `arquivos`
--

DROP TABLE IF EXISTS `arquivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arquivos` (
  `codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo_protocolo` bigint(20) DEFAULT NULL,
  `nome` varchar(200) NOT NULL,
  `nome_original` varchar(100) NOT NULL,
  `content_type` varchar(100) NOT NULL,
  `tamanho` varchar(10) NOT NULL,
  `codigo_tipo_documento` bigint(20) DEFAULT NULL,
  `descricao_documento` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo_protocolo` (`codigo_protocolo`),
  KEY `codigo_tipo_documento` (`codigo_tipo_documento`),
  CONSTRAINT `arquivos_ibfk_1` FOREIGN KEY (`codigo_protocolo`) REFERENCES `protocolo` (`codigo`),
  CONSTRAINT `arquivos_ibfk_2` FOREIGN KEY (`codigo_tipo_documento`) REFERENCES `tipo_documento` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `classificacao`
--

DROP TABLE IF EXISTS `classificacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classificacao` (
  `codigo` bigint(20) NOT NULL,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificacao`
--

LOCK TABLES `classificacao` WRITE;
/*!40000 ALTER TABLE `classificacao` DISABLE KEYS */;
INSERT INTO `classificacao` VALUES (1,'server-email'),(2,'sei'),(3,'storage'),(4,'brasil-cidadao'),(5,'captcha');
/*!40000 ALTER TABLE `classificacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuracao`
--

DROP TABLE IF EXISTS `configuracao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuracao` (
  `codigo` bigint(20) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `valor` text,
  `descricao` text,
  `codigo_classificacao` bigint(20) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_configuracao_classificacao_idx` (`codigo_classificacao`),
  CONSTRAINT `classificacao_fk` FOREIGN KEY (`codigo_classificacao`) REFERENCES `classificacao` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `configuracao` WRITE;
/*!40000 ALTER TABLE `configuracao` DISABLE KEYS */;
INSERT INTO `configuracao` VALUES (1,'SMTP_SERVER','10.209.253.28','',1),(2,'SMTP_PORT','25','teste3',1),(3,'MAIL_FROM','xxx@yyy.zzz','',1),(4,'EMAIL_RESPONSAVEL','sss@sssf.com',NULL,1),(9,'URL_AUTORIZAR','https://testescp-ecidadao.estaleiro.serpro.gov.br/scp/authorize',NULL,4),(10,'URL_TOKEN','https://testescp-ecidadao.estaleiro.serpro.gov.br/scp/token',NULL,4),(11,'URL_DADOS_USUARIO','https://testeservicos-ecidadao.estaleiro.serpro.gov.br/servicos-ecidadao/ecidadao/usuario/getUserInfo/',NULL,4),(12,'CLIENT_ID','516a9b57-d022-4843-a792-93b4dc95622b',NULL,4),(13,'SCOPE','openid',NULL,4),(14,'REDIRECT_URI','https://protocolo.planejamento.gov.br/login',NULL,4),(15,'CLIENT_SECRET','Ld65DuKIva0_EU0LO1VrVC6Be7b-_AsgvkueKpW4OJlhDdJQ4TJ9nKB173M5c5mmG03uhZvEbBKnDRmAe7gZkw',NULL,4),(16,'ESCOPO','dados_brasil_cidadao',NULL,4),(18,'URL_BRASIL_CIDADAO','https://testescp-ecidadao.estaleiro.serpro.gov.br/scp/login',NULL,4),(19,'URL_PRIMEIRO_ACESSO','https://testeportal-ecidadao.estaleiro.serpro.gov.br/servicos-cidadao/acesso/#/primeiro-acesso',NULL,4),(20,'STORAGE_PATH','/opt/protocolo_arquivos','teste2',3),(21,'URL_ENDPOINT','https://seitreina.nuvem.gov.br/sei/ws/SeiWS.php','teste4',2),(22,'ASSUNTO_CODIGO_ESTRUTURADO','520.1',NULL,2),(23,'PROCEDIMENTO_ESPECIFICADO','Especificacao do processo',NULL,2),(24,'PROCEDIMENTO_NIVEL_ACESSO','0',NULL,2),(25,'PROCEDIMENTO_ID_TIPO_PROCEDIMENTO','100000346',NULL,2),(26,'DOCUMENTO_TIPO','R',NULL,2),(27,'DOCUMENTO_ID_SERIE','1',NULL,2),(28,'DOCUMENTO_NIVEL_ACESSO','0',NULL,2),(29,'SIGLA_SISTEMA','UNB',NULL,2),(30,'IDENTIFICACAO_SERVICO','testeunb',NULL,2),(31,'ID_UNIDADE','110001972',NULL,2),(32,'CAPTCHA_SITE_KEY','6LdBAVQUAAAAAET4Dun738dTVCWfhqVDuvnDoBAp',NULL,5),(33,'CAPTCHA_SECRET_KEY','6LdBAVQUAAAAAEa3owvd2PBSaOwU8OOPeFwTq13w',NULL,5),(34,'EXP_NUM_PROTOCOLO','03154000244201864','numero do protocolo do sei ',2),(35,'EXP_DESC','teste','descrição',2),(36,'EXP_NOME_PDF','teste.pdf',NULL,2),(37,'EXP_CAMINHO_ARQUIVO','/home/dario/Documentos/123456.pdf',NULL,2),(38,'EXP_SERIE_TIPO','R',NULL,2),(39,'EXP_ID_SERIE','1',NULL,2);
/*!40000 ALTER TABLE `configuracao` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `configuracao_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuracao_email` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `valor` text,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracao_email`
--

LOCK TABLES `configuracao_email` WRITE;
/*!40000 ALTER TABLE `configuracao_email` DISABLE KEYS */;
INSERT INTO `configuracao_email` VALUES (1,'EMAIL_CONTEUDO_CADASTRO','<p><span>PREZADO(A),</span></p>\r\n<p style=\"text-align: justify;\"><span><br />SEJA&nbsp;BEM&nbsp;VINDO&nbsp;AO&nbsp;SISTEMA&nbsp;DE PROTOCOLIZA&Ccedil;&Atilde;O&nbsp;ELETR&Ocirc;NICA&nbsp;DE&nbsp;DOCUMENTOS DO&nbsp;MINIST&Eacute;RIO&nbsp;DO&nbsp;PLANEJAMENTO, DESENVOLVIMENTO&nbsp;E&nbsp;GEST&Atilde;O.&nbsp;PARA&nbsp;CONCLUIR&nbsp;O SEU&nbsp;CADASTRO,&nbsp;ACESSE&nbsp;O&nbsp;LINK&nbsp;&nbsp;<span>{$METADADO_USUARIO_URLCONFIRMACAO}</span></span></p>\r\n<p><span><br />ESSE&nbsp;PASSO&nbsp;&Eacute;&nbsp;IMPORTANTE&nbsp;PARA&nbsp;VALIDARMOS TODOS&nbsp;OS&nbsp;USU&Aacute;RIOS.</span></p>'),(2,'EMAIL_CONTEUDO_CONSOLIDACAO','<p><span>PREZADO(A),</span></p>\r\n<p style=\"text-align: justify;\"><span><br />SEJA&nbsp;BEM&nbsp;VINDO&nbsp;AO&nbsp;SISTEMA&nbsp;DE PROTOCOLIZA&Ccedil;&Atilde;O&nbsp;ELETR&Ocirc;NICA&nbsp;DE&nbsp;DOCUMENTOS DO&nbsp;MINIST&Eacute;RIO&nbsp;DO&nbsp;PLANEJAMENTO, DESENVOLVIMENTO&nbsp;E&nbsp;GEST&Atilde;O.&nbsp;PARA&nbsp;CONCLUIR&nbsp;O SEU&nbsp;CADASTRO,&nbsp;ACESSE&nbsp;O&nbsp;LINK&nbsp;&nbsp;<span>{$METADADO_USUARIO_URLCONSILIACAO}</span></span></p>\r\n<p><span><br />ESSE&nbsp;PASSO&nbsp;&Eacute;&nbsp;IMPORTANTE&nbsp;PARA&nbsp;VALIDARMOS TODOS&nbsp;OS&nbsp;USU&Aacute;RIOS.</span></p>'),(3,'EMAIL_CONTEUDO_ERRO_SEI','<h1 style=\"font-size: 15px;\">Erro ao enviar o protocolo N&ordm;&nbsp;<span>{$METADADO_PROTOCOLO_NUMERO}</span>para o SEI</h1>\r\n<p>Detalhe do Erro:&nbsp;<span>{$METADADO_MSGERRO}</span>.</p>'),(4,'EMAIL_CONTEUDO_ESQUECI_SENHA','<p style=\"font-size: 15px;\">Recebemos uma solicita&ccedil;&atilde;o de recupera&ccedil;&atilde;o de senha, por isso estamos enviando uma nova para que voc&ecirc; possa continuar usando nosso sistema de protocolo.</p>\r\n<h1 style=\"font-size: 15px;\">Sua nova senha &eacute;:&nbsp;<span>{$METADADO_USUARIO_NOVASENHA}</span></h1>'),(5,'EMAIL_CONTEUDO_PROTOCOLO','<h3>N&uacute;mero do Protocolo Provis&oacute;rio:&nbsp;<span>{$METADADO_PROTOCOLO_NUMERO}</span></h3>\r\n<p style=\"text-align: justify;\">N&uacute;mero &Uacute;nico de Protocolo: Ser&aacute; enviado para o(s) e-mail(s) cadastrado(s) no prazo m&aacute;ximo de vinte e quatro horas, contadas do recebimento, salvo quando este ocorrer &agrave;s sextas-feiras, v&eacute;spera de feriados ou pontos facultativos ou haja restri&ccedil;&atilde;o t&eacute;cnica da unidade, devidamente fundamentada.</p>\r\n<p>Data:&nbsp;<span>{$METADADO_PROTOCOLO_DATAHORAFORMADATA}</span></p>\r\n<p>Nome:&nbsp;<span>{$METADADO_PROTOCOLO_USUARIONOME}</span></p>\r\n<p>E-mail:&nbsp;<span>{$METADADO_PROTOCOLO_USUARIOEMAIL}</span></p>\r\n<p>E-mail:&nbsp;<span>{$METADADO_PROTOCOLO_EMAIL1}</span></p>\r\n<p>E-mail:&nbsp;<span>{$METADADO_PROTOCOLO_EMAIL2}</span></p>\r\n<p>Refer&ecirc;ncia ao protocolo anterior:&nbsp;<span>{$METADADO_PROTOCOLO_NUMEROANTERIOR}</span></p>\r\n<p><span>{$METADADO_PROTOCOLO_TABELAARQUIVO}</span><span><span></span><span><span><span></span></span></span></span></p>\r\n<p style=\"color: #626262;\">&ldquo;Por gentileza, responda nossa pesquisa de satisfa&ccedil;&atilde;o do Sistema de Protocolo Eletr&ocirc;nico. Sua contribui&ccedil;&atilde;o &eacute; de extrema valia.&nbsp;<a href=\"http://formsus.datasus.gov.br/site/formulario.php?id_aplicacao=36481\" target=\"_blank\" rel=\"noopener\">Clique aqui</a>&rdquo;</p>'),(6,'EMAIL_CONTEUDO_NEGADO','<h3>N&uacute;mero do Protocolo Provis&oacute;rio:&nbsp;<span>{$METADADO_PROTOCOLO_NUMERO}</span></h3>\r\n<p style=\"text-align: justify;\">Prezado (a)<span>{$METADADO_PROTOCOLO_USUARIONOME}</span>, <br /> Esta &eacute; uma mensagem autom&aacute;tica e n&atilde;o deve ser respondida. <br /> Seu protocolo n&atilde;o foi aceito pelo motivo abaixo especificado: <br /><span>{$METADADO_PROTOCOLO_OBSERVACAO}</span></p>\r\n<p>Nome:<span>{$METADADO_PROTOCOLO_USUARIONOME}</span></p>\r\n<p>E-mail:<span>{$METADADO_PROTOCOLO_USUARIOEMAIL}</span></p>\r\n<p>E-mail:<span>{$METADADO_PROTOCOLO_EMAIL1}</span></p>\r\n<p>E-mail:<span>{$METADADO_PROTOCOLO_EMAIL2}</span></p>'),(7,'EMAIL_CONTEUDO_RECEBIMENTO_SEI','<h3>N&uacute;mero &Uacute;nico de Protocolo:<span>{$METADADO_PROTOCOLO_NUPE}</span></h3>\r\n<p style=\"text-align: justify;\">Prezado (a) usu&aacute;rio (a), Esta &eacute; uma mensagem autom&aacute;tica e n&atilde;o deve ser respondida. Informamos que seu protocolo foi entregue ao setor respons&aacute;vel e que foi gerado o NUP:<span>{$METADADO_PROTOCOLO_NUPE}</span>. Quaisquer diverg&ecirc;ncias das informa&ccedil;&otilde;es prestadas ou problemas nos arquivos anexados ser&atilde;o comunicados ao (&agrave;) senhor (a) atrav&eacute;s dos e-mails informados em seu cadastro. Informa&ccedil;&otilde;es referentes &agrave; tramita&ccedil;&atilde;o de seu processo ser&atilde;o atualizadas at&eacute; 24 horas e estar&atilde;o acess&iacute;veis no s&iacute;tio do protocolo integrado do Governo Federal, dispon&iacute;vel em&nbsp;<span><span></span></span><span><span></span></span><span>{$METADADO_PROTOCOLO_LINKSEI}</span><span></span></p>\r\n<p>Data:<span>{$METADADO_PROTOCOLO_DATAHORAFORMADATA}</span>.</p>\r\n<p>Nome:<span>{$METADADO_PROTOCOLO_USUARIONOME}</span></p>\r\n<p>E-mail:<span>{$METADADO_PROTOCOLO_USUARIOEMAIL}</span></p>\r\n<p>E-mail:<span>{$METADADO_PROTOCOLO_EMAIL1}</span></p>\r\n<p>E-mail:<span>{$METADADO_PROTOCOLO_EMAIL2}</span></p>\r\n<p>Refer&ecirc;ncia ao protocolo anterior:</p>\r\n<p><span>{$METADADO_PROTOCOLO_TABELAARQUIVO}</span><span><span></span><span><span><span></span></span></span></span></p>\r\n<p style=\"color: #626262;\">&ldquo;Por gentileza, responda nossa pesquisa de satisfa&ccedil;&atilde;o do Sistema de Protocolo Eletr&ocirc;nico. Sua contribui&ccedil;&atilde;o &eacute; de extrema valia.&nbsp;<a href=\"http://formsus.datasus.gov.br/site/formulario.php?id_aplicacao=36481\" target=\"_blank\" rel=\"noopener\">Clique aqui</a>&rdquo;</p>\r\n<p>&nbsp;</p>'),(8,'EMAIL_CABECALHO','<h4 style=\"background-color: #fafafa; color: #626262; text-align: center;\"><span>{$METADADO_LOGO_EMAIL}</span></h4><h4 style=\"background-color: #fafafa; color: #626262; text-align: center;\">Minist&eacute;rio do Planejamento, Desenvolvimento e Gest&atilde;o&nbsp;<br />Protocolo Central&nbsp;<br />Esplanada dos Minist&eacute;rios Bloco K, T&eacute;rreo, sala T 28, CEP 70.040-906 &ndash; Bras&iacute;lia-DF&nbsp;<br />protocolo@planejamento.gov.br&nbsp;<br />(61) 2020-5195/5580&nbsp;</h4>'),(9,'EMAIL_RODAPE','<p>&nbsp;</p>\r <p>&ldquo;Por gentileza, responda nossa pesquisa de satisfa&ccedil;&atilde;o do Sistema de Protocolo Eletr&ocirc;nico. Sua contribui&ccedil;&atilde;o &eacute; de extrema valia.&nbsp;&nbsp;<a href=\"http://formsus.datasus.gov.br/site/formulario.php?id_aplicacao=36481\">Clique aqui</a>&rdquo;</p>\r <p>&nbsp;</p>\r <p style=\"text-align: justify; font-size: 10px;\">S&atilde;o de exclusiva responsabilidade do usu&aacute;rio: A conformidade entre os dados informados e os documentos; A conserva&ccedil;&atilde;o dos originais em papel de documentos digitalizados at&eacute; que decaia o direito de revis&atilde;o dos atos praticados no processo, para que, caso solicitado, sejam apresentados para qualquer tipo de confer&ecirc;ncia; A observa&ccedil;&atilde;o de que os atos processuais se consideram realizados no dia e hora do recebimento pelo SEI, considerando-se tempestivos os praticados at&eacute; 23h59min59s do &uacute;ltimo dia do prazo, considerando sempre o hor&aacute;rio oficial de Bras&iacute;lia, independente do fuso hor&aacute;rio em que se encontre. &nbsp;</p>'),(10,'EMAIL_CONTEUDO_DESBLOQUEIO','<p><span>PREZADO(A),</span></p>\r\n<p style=\"text-align: justify;\"><span><br />Usuário bloqueado, favor acessar o LINK <span>{$METADADO_USUARIO_URLDESBLOQUEIO}</span></span></p>\r\n<p><span><br />para desbloqueiar o usuário.</span></p>');
/*!40000 ALTER TABLE `configuracao_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo` (
  `codigo` bigint(20) NOT NULL,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (1,'Administrador'),(2,'Protocolo'),(3,'Brasil Cidadao');
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_permissao`
--

DROP TABLE IF EXISTS `grupo_permissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo_permissao` (
  `codigo_grupo` bigint(20) NOT NULL,
  `codigo_permissao` bigint(20) NOT NULL,
  PRIMARY KEY (`codigo_grupo`,`codigo_permissao`),
  KEY `codigo_permissao` (`codigo_permissao`),
  CONSTRAINT `grupo_permissao_ibfk_1` FOREIGN KEY (`codigo_grupo`) REFERENCES `grupo` (`codigo`),
  CONSTRAINT `grupo_permissao_ibfk_2` FOREIGN KEY (`codigo_permissao`) REFERENCES `permissao` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_permissao`
--

LOCK TABLES `grupo_permissao` WRITE;
/*!40000 ALTER TABLE `grupo_permissao` DISABLE KEYS */;
INSERT INTO `grupo_permissao` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `grupo_permissao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_sistema`
--

DROP TABLE IF EXISTS `log_sistema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_sistema` (
  `codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo_entidade` bigint(20) NOT NULL,
  `entidade` varchar(45) NOT NULL,
  `acao` varchar(45) NOT NULL,
  `antes` text,
  `depois` text,
  `data_hora` datetime NOT NULL,
  `codigo_usuario` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=1469 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `login_attempt`
--

DROP TABLE IF EXISTS `login_attempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_attempt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `amount` int(2) NOT NULL DEFAULT '1',
  `reset_at` timestamp NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT 0,
  `updated_at` timestamp NOT NULL DEFAULT now(),
  PRIMARY KEY (`id`),
  KEY `amount` (`amount`),
  KEY `reset_at` (`reset_at`),
  KEY `key` (`key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `metadado`
--

DROP TABLE IF EXISTS `metadado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadado` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `valor` text,
  `descricao` text,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadado`
--

LOCK TABLES `metadado` WRITE;
/*!40000 ALTER TABLE `metadado` DISABLE KEYS */;
INSERT INTO `metadado` VALUES (1,'METADADO_LOGO_EMAIL','<img src=\"../../static/images/brasao-brasil.png\" th:src=\"|cid:logo|\"/>','Imagem do logótipo do ministério.'),(2,'METADADO_MSGERRO','<span th:text=\"${msgErro}\">Erro no protocolo.</span>','Mensagem de erro ao enviar ao SEI.'),(3,'METADADO_PROTOCOLO_DATAHORAFORMADATA','<span th:text=\"${protocolo.dataHoraFormatada}\">','Data de criação do protocolo.'),(4,'METADADO_PROTOCOLO_EMAIL1','<span th:text=\"${protocolo.email1}\">E-mail: protocolo.email1</span>','E-mail 1  de interessado.'),(5,'METADADO_PROTOCOLO_EMAIL2','<span th:text=\"${protocolo.email2}\">E-mail: protocolo.emails</span>','E-mail 2 de interessado.'),(6,'METADADO_PROTOCOLO_LINKSEI','<a th:href=\"|https://protocolointegrado.gov.br/protocolo/documento/detalhes_documento.jsf?protocolo=${protocolo.nupe}|\">Link protocolo integrado.</a>','Link de acesso ao protocolo no SEI.'),(7,'METADADO_PROTOCOLO_NUMERO','<span th:text=\"${protocolo.numero}\">Nmero do Protocolo Provisrio: 123ads31232asfd</span>','Numero do protocolo.'),(8,'METADADO_PROTOCOLO_NUMEROANTERIOR','<span th:text=\"${protocolo.numeroProtocoloAnterior}\">Referncia ao protocolo anterior: 121345461</span>','Numero de protocolo anterior.'),(9,'METADADO_PROTOCOLO_NUPE','<span th:text=\"${protocolo.nupe}\">protocolo.nupe</span>','Numero único do protocolo no SEI.'),(10,'METADADO_PROTOCOLO_OBSERVACAO','<span th:text=\"${protocolo.observacao}\">observacao</span>','Observação cadastrada no cancelamento do protocolo.'),(11,'METADADO_PROTOCOLO_TABELAARQUIVO','<table border=\"1\" cellpadding=\"2\" cellspacing=\"0\" style=\"width: 100%\">\n    <thead>\n        <tr>\n            <td style=\"text-align: center\">\n                Descrição do documento\n            </td>\n            <td style=\"text-align: center\">\n                Arquivo\n            </td>\n        </tr>\n    </thead>\n    <tbody>\n        <tr th:each=\"arquivo: ${protocolo.arquivosList}\">\n            <td th:text=\"${arquivo.tipoDocumento.descricao}\">${arquivo.tipoDocumento.descricao}</td>\n            <td th:text=\"${arquivo.nomeOriginal}\">${arquivo.nomeOriginal}</td>\n        </tr>\n    </tbody>\n</table>','Tabela com a lista de arquivos do protocolo.'),(12,'METADADO_PROTOCOLO_USUARIOEMAIL','<span th:text=\"${protocolo.usuario.email}\">E-mail: protocolo.email1</span>','E-mail do usuário que cadastrou o protocolo.'),(13,'METADADO_PROTOCOLO_USUARIONOME','<span th:text=\"${protocolo.usuario.nome}\">$ usuario nome</span>','Nome do usuário que cadastrou o protocolo.'),(14,'METADADO_USUARIO_NOVASENHA','<span th:text=\"${usuario.senha}\">Sua nova senha : 5as4f56as4f5as4</span>','Nova senha gerada para o usuário.'),(15,'METADADO_USUARIO_URLCONFIRMACAO','<a th:href=\"${usuario.urlConfirmacaoCadastro}\">CONFIRMAR MEU CADASTRO.</a>','Url para ativação do usuário.'),(16,'METADADO_USUARIO_URLCONSILIACAO','<a th:href=\"${usuario.urlConfirmacaoCadastro}\">CONFIRMAR MEU CADASTRO.</a>','Url para conciliação de usuário protocolo com usuário brasil cidadão.'),(17,'METADADO_USUARIO_URLDESBLOQUEIO','<a th:href=\"${usuario.urlDesbloqueio}\">Link de desbloqueio</a>',NULL);
/*!40000 ALTER TABLE `metadado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadado_email`
--

DROP TABLE IF EXISTS `metadado_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadado_email` (
  `codigo_email` int(11) NOT NULL,
  `codigo_metadado` int(11) NOT NULL,
  PRIMARY KEY (`codigo_metadado`,`codigo_email`),
  KEY `fk_metadado_email_configuracao_email1_idx` (`codigo_email`),
  CONSTRAINT `metadado_email_fk1` FOREIGN KEY (`codigo_email`) REFERENCES `configuracao_email` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `metadado_email_fk2` FOREIGN KEY (`codigo_metadado`) REFERENCES `metadado` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadado_email`
--

LOCK TABLES `metadado_email` WRITE;
/*!40000 ALTER TABLE `metadado_email` DISABLE KEYS */;
INSERT INTO `metadado_email` VALUES (1,15),(2,16),(3,2),(3,7),(4,14),(5,3),(5,4),(5,5),(5,7),(5,8),(5,10),(5,11),(5,12),(5,13),(6,3),(6,4),(6,5),(6,7),(6,10),(6,12),(6,13),(7,3),(7,4),(7,5),(7,6),(7,7),(7,8),(7,9),(7,10),(7,11),(7,12),(7,13),(8,1),(9,1),(10,17);
/*!40000 ALTER TABLE `metadado_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissao`
--

DROP TABLE IF EXISTS `permissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissao` (
  `codigo` bigint(20) NOT NULL,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissao`
--

LOCK TABLES `permissao` WRITE;
/*!40000 ALTER TABLE `permissao` DISABLE KEYS */;
INSERT INTO `permissao` VALUES (1,'ROLE_CADASTRO'),(2,'ROLE_PROTOCOLO'),(3,'ROLE_BRASILCIDADAO');
/*!40000 ALTER TABLE `permissao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `protocolo`
--

DROP TABLE IF EXISTS `protocolo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `protocolo` (
  `codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `numero` varchar(50) NOT NULL,
  `data_hora` datetime DEFAULT NULL,
  `codigo_usuario` bigint(20) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'PENDENTE',
  `email1` varchar(50) DEFAULT NULL,
  `email2` varchar(50) DEFAULT NULL,
  `observacao` text,
  `nupe` varchar(20) DEFAULT NULL,
  `data_envio` datetime DEFAULT NULL,
  `erro_ws` text,
  `nr_protocolo_anterior` varchar(50) DEFAULT NULL,
  `id_unidade` bigint(20) DEFAULT NULL,
  `linksei` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo_usuario` (`codigo_usuario`),
  CONSTRAINT `protocolo_ibfk_1` FOREIGN KEY (`codigo_usuario`) REFERENCES `usuario` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=486 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Table structure for table `schema_version`
--

DROP TABLE IF EXISTS `schema_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_version` (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`),
  KEY `schema_version_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Table structure for table `temp_arquivo`
--

DROP TABLE IF EXISTS `temp_arquivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_arquivo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) CHARACTER SET latin1 NOT NULL,
  `pagina` varchar(10) CHARACTER SET latin1 NOT NULL,
  `temp_desc_arquivo_idarquivo` varchar(2) CHARACTER SET latin1 NOT NULL,
  `temp_desc_arquivo_token` varchar(6) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_temp_arquivo_temp_desc_arquivo1_idx` (`temp_desc_arquivo_idarquivo`,`temp_desc_arquivo_token`),
  CONSTRAINT `fk_temp_arquivo_temp_desc_arquivo1` FOREIGN KEY (`temp_desc_arquivo_idarquivo`, `temp_desc_arquivo_token`) REFERENCES `temp_desc_arquivo` (`idarquivo`, `token`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_desc_arquivo`
--

DROP TABLE IF EXISTS `temp_desc_arquivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_desc_arquivo` (
  `tipo` varchar(45) CHARACTER SET latin1 NOT NULL,
  `qtd_paginas` varchar(10) CHARACTER SET latin1 NOT NULL,
  `temp_protocolo_token` varchar(6) CHARACTER SET latin1 NOT NULL,
  `idarquivo` varchar(2) CHARACTER SET latin1 NOT NULL,
  `token` varchar(6) CHARACTER SET latin1 NOT NULL,
  `descricao` varchar(45) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`idarquivo`,`token`),
  KEY `fk_temp_desc_arquivo_temp_protocolo1_idx` (`temp_protocolo_token`),
  CONSTRAINT `fk_temp_desc_arquivo_temp_protocolo1` FOREIGN KEY (`temp_protocolo_token`) REFERENCES `temp_protocolo` (`token`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_protocolo`
--

DROP TABLE IF EXISTS `temp_protocolo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_protocolo` (
  `token` varchar(6) CHARACTER SET latin1 NOT NULL,
  `email1` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `email2` varchar(100) CHARACTER SET big5 DEFAULT NULL,
  `nr_protocolo_anterior` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `usuario_codigo` bigint(20) NOT NULL,
  PRIMARY KEY (`token`),
  KEY `fk_temp_protocolo_usuario1_idx` (`usuario_codigo`),
  CONSTRAINT `fk_temp_protocolo_usuario1` FOREIGN KEY (`usuario_codigo`) REFERENCES `usuario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_documento`
--

DROP TABLE IF EXISTS `tipo_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_documento` (
  `codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  `codigo_sei` varchar(45) NOT NULL,
  `ativo` tinyint(4) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_documento`
--

LOCK TABLES `tipo_documento` WRITE;
/*!40000 ALTER TABLE `tipo_documento` DISABLE KEYS */;
INSERT INTO `tipo_documento` VALUES (17,'Requerimento','238',1),(18,'Complemento','651',1),(20,'Tipo de documento','556',0);
/*!40000 ALTER TABLE `tipo_documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `senha` varchar(120) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  `token` varchar(255) NOT NULL DEFAULT '0',
  `nome_social` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'admin','admin@admin.com','$2a$10$FEa9yb.ixkE99s5lc9Eyr.6raqBUc9Otp9hwRSSj88Vof7EEvnVMW','(77) 77777-7777',1,'$2a$08$MjA3MTI0MTgyMzViNmM0Z.tRNfsvZEoTS8ZV4iY1eHwIST8j1qgoW','');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_brasil_cidadao`
--

DROP TABLE IF EXISTS `usuario_brasil_cidadao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_brasil_cidadao` (
  `codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `cpf` varchar(15) NOT NULL,
  `codigo_usuario` bigint(20) DEFAULT NULL,
  `token` text,
  `ativo` tinyint(4) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `usuario_brasil_cidadao_fki_1` (`codigo_usuario`),
  CONSTRAINT `usuario_brasil_cidadao_fk_1` FOREIGN KEY (`codigo_usuario`) REFERENCES `usuario` (`codigo`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Table structure for table `usuario_grupo`
--

DROP TABLE IF EXISTS `usuario_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_grupo` (
  `codigo_usuario` bigint(20) NOT NULL,
  `codigo_grupo` bigint(20) NOT NULL,
  PRIMARY KEY (`codigo_usuario`,`codigo_grupo`),
  KEY `codigo_grupo` (`codigo_grupo`),
  CONSTRAINT `usuario_grupo_ibfk_1` FOREIGN KEY (`codigo_usuario`) REFERENCES `usuario` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_grupo`
--

LOCK TABLES `usuario_grupo` WRITE;
/*!40000 ALTER TABLE `usuario_grupo` DISABLE KEYS */;
INSERT INTO `usuario_grupo` VALUES (1,1),(79,1),(81,1),(85,1),(98,1),(110,1),(112,1),(113,1),(136,1),(137,1),(157,1),(82,2),(87,2),(88,2),(89,2),(90,2),(92,2),(93,2),(94,2),(95,2),(96,2),(97,2),(99,2),(100,2),(101,2),(102,2),(104,2),(105,2),(106,2),(107,2),(108,2),(114,2),(121,2),(126,2),(127,2),(128,2),(129,2),(130,2),(131,2),(132,2),(133,2),(135,2),(139,2),(140,2),(141,2),(142,2),(143,2),(144,2),(145,2),(146,2),(147,2),(148,2),(149,2),(150,2),(151,2),(152,2),(153,2),(154,2),(155,2),(156,2),(83,3),(84,3),(86,3),(91,3),(138,3);
/*!40000 ALTER TABLE `usuario_grupo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-27 14:32:42
