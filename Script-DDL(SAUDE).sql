-- Script DDL

-- CREATE

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8mb3 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Hospital`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Hospital` (
  `CNPJ` VARCHAR(14) NOT NULL,
  `Nome` VARCHAR(140) NOT NULL,
  `Horario_Funcionamento` TIME NOT NULL,
  PRIMARY KEY (`CNPJ`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`Ambulatorio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ambulatorio` (
  `idAmbulatorio` INT NOT NULL AUTO_INCREMENT,
  `Especialidade` VARCHAR(30) NOT NULL,
  `Horario_Funcionamento` TIME NOT NULL,
  `Hospital_CNPJ` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`idAmbulatorio`),
  INDEX `fk_Ambulatório_Hospital1_idx` (`Hospital_CNPJ` ASC) VISIBLE,
  CONSTRAINT `fk_Ambulatório_Hospital1`
    FOREIGN KEY (`Hospital_CNPJ`)
    REFERENCES `mydb`.`Hospital` (`CNPJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`Pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pessoa` (
  `CPF` VARCHAR(14) NOT NULL,
  `Nome` VARCHAR(140) NOT NULL,
  PRIMARY KEY (`CPF`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`Paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Paciente` (
  `CNS` VARCHAR(15) NOT NULL,
  `Pessoa_CPF` VARCHAR(14) NOT NULL,
  `Ambulatorio_idAmbulatorio` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`CNS`, `Pessoa_CPF`),
  INDEX `fk_Paciente_Pessoa_idx` (`Pessoa_CPF` ASC) VISIBLE,
  INDEX `fk_Paciente_Ambulatório1_idx` (`Ambulatorio_idAmbulatorio` ASC) VISIBLE,
  CONSTRAINT `fk_Paciente_Pessoa`
    FOREIGN KEY (`Pessoa_CPF`)
    REFERENCES `mydb`.`Pessoa` (`CPF`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Paciente_Ambulatório1`
    FOREIGN KEY (`Ambulatorio_idAmbulatorio`)
    REFERENCES `mydb`.`Ambulatorio` (`idAmbulatorio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`Diagnostico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Diagnostico` (
  `idDiagnostico` INT NOT NULL AUTO_INCREMENT,
  `Data` DATETIME NOT NULL,
  `Hipotese` VARCHAR(150) NULL DEFAULT NULL,
  `CIDI` VARCHAR(4) NULL,
  `Paciente_CNS` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idDiagnostico`),
  INDEX `fk_Diagnostico_Paciente1_idx` (`Paciente_CNS` ASC) VISIBLE,
  CONSTRAINT `fk_Diagnostico_Paciente1`
    FOREIGN KEY (`Paciente_CNS`)
    REFERENCES `mydb`.`Paciente` (`CNS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`Laboratorio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Laboratorio` (
  `CNPJ` VARCHAR(14) NOT NULL,
  `Nome` VARCHAR(140) NOT NULL,
  `Horario_Funcionamento` TIME NOT NULL,
  PRIMARY KEY (`CNPJ`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`Exame`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Exame` (
  `idExame` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(140) NOT NULL,
  `Tipo` VARCHAR(70) NOT NULL,
  `Data` DATE NOT NULL,
  `Horario` TIME NOT NULL,
  `Justificativa` VARCHAR(200) NULL DEFAULT NULL,
  `Preparo` VARCHAR(140) NULL DEFAULT NULL,
  `Convenio` VARCHAR(70) NULL DEFAULT NULL,
  `Laboratorio_CNPJ` VARCHAR(14) NOT NULL,
  `Paciente_CNS` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idExame`),
  INDEX `fk_Exame_Laboratório1_idx` (`Laboratorio_CNPJ` ASC) VISIBLE,
  INDEX `fk_Exame_Paciente1_idx` (`Paciente_CNS` ASC) VISIBLE,
  CONSTRAINT `fk_Exame_Laboratório1`
    FOREIGN KEY (`Laboratorio_CNPJ`)
    REFERENCES `mydb`.`Laboratorio` (`CNPJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Exame_Paciente1`
    FOREIGN KEY (`Paciente_CNS`)
    REFERENCES `mydb`.`Paciente` (`CNS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`Medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Medico` (
  `CRM` VARCHAR(8) NOT NULL,
  `Area_Atuacao` VARCHAR(50) NOT NULL,
  `RQE` VARCHAR(6) NULL DEFAULT NULL,
  `Pessoa_CPF` VARCHAR(14) NOT NULL,
  `Hospital_CNPJ` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`CRM`, `Pessoa_CPF`),
  INDEX `fk_Médico_Hospital1_idx` (`Hospital_CNPJ` ASC) VISIBLE,
  CONSTRAINT `fk_Médico_Pessoa1`
    FOREIGN KEY (`Pessoa_CPF`)
    REFERENCES `mydb`.`Pessoa` (`CPF`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Médico_Hospital1`
    FOREIGN KEY (`Hospital_CNPJ`)
    REFERENCES `mydb`.`Hospital` (`CNPJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`Pessoal de Apoio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pessoal de Apoio` (
  `idPessoalApoio` INT NOT NULL AUTO_INCREMENT,
  `Cargo` VARCHAR(30) NOT NULL,
  `Pessoa_CPF` VARCHAR(14) NOT NULL,
  `Ambulatorio_idAmbulatorio` INT NOT NULL,
  PRIMARY KEY (`idPessoalApoio`, `Pessoa_CPF`),
  INDEX `fk_Pessoal de Apoio_Ambulatório1_idx` (`Ambulatorio_idAmbulatorio` ASC) VISIBLE,
  CONSTRAINT `fk_Pessoal de apoio_Pessoa1`
    FOREIGN KEY (`Pessoa_CPF`)
    REFERENCES `mydb`.`Pessoa` (`CPF`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Pessoal de Apoio_Ambulatório1`
    FOREIGN KEY (`Ambulatorio_idAmbulatorio`)
    REFERENCES `mydb`.`Ambulatorio` (`idAmbulatorio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Endereco` (
  `idEndereco` INT NOT NULL AUTO_INCREMENT,
  `Rua` VARCHAR(60) NOT NULL,
  `CEP` VARCHAR(9) NOT NULL,
  `Bairro` VARCHAR(45) NOT NULL,
  `Cidade` VARCHAR(45) NOT NULL,
  `Numero` INT NOT NULL,
  `UF` VARCHAR(2) NOT NULL,
  `Complemento` VARCHAR(45) NULL,
  `Paciente_CNS` VARCHAR(15) NULL,
  `Hospital_CNPJ` VARCHAR(14) NULL,
  `Laboratorio_CNPJ` VARCHAR(14) NULL,
  PRIMARY KEY (`idEndereco`),
  INDEX `fk_Endereço_Paciente1_idx` (`Paciente_CNS` ASC) VISIBLE,
  INDEX `fk_Endereço_Hospital1_idx` (`Hospital_CNPJ` ASC) VISIBLE,
  INDEX `fk_Endereço_Laboratório1_idx` (`Laboratorio_CNPJ` ASC) VISIBLE,
  CONSTRAINT `fk_Endereço_Paciente1`
    FOREIGN KEY (`Paciente_CNS`)
    REFERENCES `mydb`.`Paciente` (`CNS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Endereço_Hospital1`
    FOREIGN KEY (`Hospital_CNPJ`)
    REFERENCES `mydb`.`Hospital` (`CNPJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Endereço_Laboratório1`
    FOREIGN KEY (`Laboratorio_CNPJ`)
    REFERENCES `mydb`.`Laboratorio` (`CNPJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Telefone` (
  `idTelefone` INT NOT NULL AUTO_INCREMENT,
  `Numero` VARCHAR(11) NOT NULL,
  `Laboratorio_CNPJ` VARCHAR(14) NULL,
  `Hospital_CNPJ` VARCHAR(14) NULL,
  `Pessoa_CPF` VARCHAR(14) NULL,
  PRIMARY KEY (`idTelefone`),
  INDEX `fk_Telefone_Laboratório1_idx` (`Laboratorio_CNPJ` ASC) VISIBLE,
  INDEX `fk_Telefone_Hospital1_idx` (`Hospital_CNPJ` ASC) VISIBLE,
  INDEX `fk_Telefone_Pessoa1_idx` (`Pessoa_CPF` ASC) VISIBLE,
  CONSTRAINT `fk_Telefone_Laboratório1`
    FOREIGN KEY (`Laboratorio_CNPJ`)
    REFERENCES `mydb`.`Laboratorio` (`CNPJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Telefone_Hospital1`
    FOREIGN KEY (`Hospital_CNPJ`)
    REFERENCES `mydb`.`Hospital` (`CNPJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Telefone_Pessoa1`
    FOREIGN KEY (`Pessoa_CPF`)
    REFERENCES `mydb`.`Pessoa` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Consultar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Consultar` (
  `Motivo` VARCHAR(130) NULL,
  `Medico_CRM` VARCHAR(8) NOT NULL,
  `Paciente_CNS` VARCHAR(15) NOT NULL,
  INDEX `fk_Médico_has_Paciente_Paciente1_idx` (`Paciente_CNS` ASC) VISIBLE,
  INDEX `fk_Médico_has_Paciente_Médico1_idx` (`Medico_CRM` ASC) VISIBLE,
  CONSTRAINT `fk_Médico_has_Paciente_Médico1`
    FOREIGN KEY (`Medico_CRM`)
    REFERENCES `mydb`.`Medico` (`CRM`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Médico_has_Paciente_Paciente1`
    FOREIGN KEY (`Paciente_CNS`)
    REFERENCES `mydb`.`Paciente` (`CNS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`Solicitar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Solicitar` (
  `Laboratorio_CNPJ` VARCHAR(14) NOT NULL,
  `Hospital_CNPJ` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`Laboratorio_CNPJ`, `Hospital_CNPJ`),
  INDEX `fk_Laboratório_has_Hospital_Hospital1_idx` (`Hospital_CNPJ` ASC) VISIBLE,
  INDEX `fk_Laboratório_has_Hospital_Laboratório1_idx` (`Laboratorio_CNPJ` ASC) VISIBLE,
  CONSTRAINT `fk_Laboratório_has_Hospital_Laboratório1`
    FOREIGN KEY (`Laboratorio_CNPJ`)
    REFERENCES `mydb`.`Laboratorio` (`CNPJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Laboratório_has_Hospital_Hospital1`
    FOREIGN KEY (`Hospital_CNPJ`)
    REFERENCES `mydb`.`Hospital` (`CNPJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;




-- DROP E ALTER TABLE

DROP DATABASE mydb;

ALTER TABLE endereco DROP COLUMN cidade;
ALTER TABLE endereco ADD COLUMN Cidade varchar(45) AFTER bairro;

ALTER TABLE laboratorio DROP COLUMN Horario_funcionamento;
ALTER TABLE laboratorio ADD COLUMN Horario_funcionamento time;

ALTER TABLE exame RENAME COLUMN Tipo to TESTE;
ALTER TABLE exame RENAME COLUMN TESTE to Tipo;

ALTER TABLE laboratorio MODIFY COLUMN Nome varchar(200);

ALTER TABLE medico MODIFY COLUMN CRM varchar(9);

ALTER TABLE consultar MODIFY COLUMN Medico_CRM varchar(9);

ALTER TABLE diagnostico MODIFY COLUMN Data date;

ALTER TABLE telefone MODIFY COLUMN numero varchar(12);

ALTER TABLE `mydb`.`diagnostico` 
CHANGE COLUMN `CIDI` `CID` VARCHAR(4) NULL DEFAULT NULL ;

ALTER TABLE `mydb`.`pessoal de apoio` 
RENAME TO  `mydb`.`pessoalapoio` ;

-- VIEWS

CREATE VIEW Rel1 AS
	SELECT c.Motivo 'Motivo Consulta',pe.nome 'Nome Paciente', pe.CPF 'CPF Paciente', pes.nome 'Nome Médico', m.CRM 'CRM Médico',
h.Nome 'Nome Hospital'
	FROM consultar as c
		INNER JOIN paciente as p ON p.CNS = c.Paciente_CNS
        INNER JOIN pessoa as pe ON pe.CPF = p.Pessoa_CPF
        INNER JOIN medico as m ON m.CRM = c.Medico_CRM
        INNER JOIN pessoa as pes ON pes.CPF = m.Pessoa_CPF
        INNER JOIN hospital as h ON h.CNPJ = m.Hospital_CNPJ
			ORDER BY pe.nome;

CREATE VIEW Rel2 AS
	SELECT e.Nome'Nome do Exame', count(e.idExame) 'Quantidade Exames',e.Tipo'Tipo do Exame', e.Data'Data do Exame'
, e.Horario'Horario do Exame', pe.Nome'Nome Paciente', l.Nome'Nome do Laboratório', h.Nome'Nome do Hospital'
	FROM exame as e
		INNER JOIN paciente as p ON p.CNS = e.Paciente_CNS
        INNER JOIN pessoa as pe ON pe.CPF = p.pessoa_cpf
        INNER JOIN laboratorio as l ON l.CNPJ = e.Laboratorio_CNPJ
        INNER JOIN solicitar as s ON s.Laboratorio_CNPJ = l.CNPJ
        INNER JOIN hospital as h ON h.CNPJ = s.Hospital_CNPJ
			GROUP BY pe.Nome
				HAVING count(e.idExame) > 1
					ORDER BY e.tipo;
            
CREATE VIEW Rel3 AS
	SELECT a.Especialidade'Especialidade', a.Horario_Funcionamento'Horario Funcionamento', h.Nome'Nome do Hospital', 
pe.Nome'Nome Pessoal de Apoio', p.Cargo'Cargo Pessoal de Apoio'
	FROM ambulatorio as a
		INNER JOIN pessoalapoio as p ON p.Ambulatorio_idAmbulatorio = a.idAmbulatorio
        INNER JOIN pessoa as pe ON pe.CPF = p.Pessoa_CPF
        INNER JOIN hospital as h ON h.CNPJ = a.Hospital_CNPJ
			WHERE h.nome = 'Hospital in Memorie of Zendaya'
				ORDER BY a.Horario_Funcionamento;

CREATE VIEW Rel4 AS
	SELECT p.Pessoa_CPF'CPF Paciente', d.CID'CID Diagnostico', e.Cidade 'Cidade Paciente',
 t.Numero'Numero Medico'
	FROM paciente as p
		INNER JOIN pessoa as pe ON pe.CPF = p.Pessoa_CPF
		INNER JOIN diagnostico as d ON d.Paciente_CNS = p.CNS
        INNER JOIN endereco as e ON e.Paciente_CNS = p.CNS
        INNER JOIN consultar as c ON c.Paciente_CNS = p.CNS
        INNER JOIN medico as m ON m.CRM = c.Medico_CRM
        INNER JOIN pessoa as pes ON pes.CPF = m.Pessoa_CPF
        INNER JOIN telefone as t ON t.Pessoa_CPF = pes.CPF
			WHERE e.cidade = 'Recife'
				ORDER BY d.CID;
                
CREATE VIEW Rel5 AS
	SELECT l.nome 'Nome Laboratorio', e.Nome 'Nome Exame', count(idExame)'Quantidade Exame'
	FROM laboratorio as l
		INNER JOIN exame as e ON e.Laboratorio_CNPJ = l.CNPJ
			 GROUP BY l.nome
				ORDER BY count(e.idExame) DESC;
                
                
CREATE VIEW Rel6 AS
	SELECT c.Motivo 'Motivo Consulta', t.numero 'Numero Paciente', tel.numero 'Telefone Medico' 
	FROM consultar as c
		INNER JOIN paciente as p ON p.CNS = c.Paciente_CNS
        INNER JOIN pessoa as pe ON pe.CPF = p.Pessoa_CPF
        INNER JOIN telefone as t ON t.Pessoa_CPF = pe.CPF
        INNER JOIN Medico as m ON m.CRM = c.Medico_CRM
        INNER JOIN pessoa as pes ON pes.CPF = m.Pessoa_CPF
        INNER JOIN telefone as tel ON tel.Pessoa_CPF = pes.CPF
			ORDER BY tel.numero;
            
            
CREATE VIEW Rel7 AS
	SELECT pe.nome 'Nome Pessoal Apoio', h.nome 'Nome Hospital', pes.Nome'Nome Medico'
	FROM pessoalapoio as p
		INNER JOIN pessoa as pe ON pe.CPF = p.Pessoa_CPF
        INNER JOIN ambulatorio as a ON a.idAmbulatorio = p.Ambulatorio_idAmbulatorio
        INNER JOIN hospital as h ON h.CNPJ = a.Hospital_CNPJ
        INNER JOIN medico as m ON m.Hospital_CNPJ = h.CNPJ
        INNER JOIN pessoa as pes ON pes.cpf = m.Pessoa_CPF
			ORDER BY pes.Nome;