-- PLSQL

DELIMITER $$
CREATE PROCEDURE sp_cadastra_hospital(IN cnpj_hp VARCHAR(14), IN nome_hp VARCHAR(140), IN horario_func TIME, OUT retorno VARCHAR(150))
BEGIN
	IF EXISTS(SELECT * FROM hospital WHERE cnpj = cnpj_hp) THEN
    BEGIN
		SET retorno = 'Hospital já EXISTE!';
    END;
    ELSE 
		INSERT INTO hospital
		VALUES (cnpj_hp, nome_hp, horario_func);
        
        IF row_count() = 0 THEN
				SET retorno = 'NENHUM Hospital foi cadastrado';
			ELSE
				SET retorno = 'Hospital cadastrado com SUCESSO!';
			END IF;
	END IF;
		SELECT retorno;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sp_exclui_hospital(IN cnpj_sp VARCHAR(14), OUT retorno VARCHAR(50))
BEGIN
	DELETE FROM hospital
		WHERE cnpj = cnpj_sp;
			IF row_count() = 0 THEN
				SET retorno = 'NENHUM Hospital foi excluido';
			ELSE
				SET retorno = 'Hospital excluido com SUCESSO!';
			END IF;
            SELECT retorno;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sp_cadastra_laboratorio(IN cnpj_lb VARCHAR(14), IN nome_lb VARCHAR(140), IN horario_func TIME, OUT retorno VARCHAR(150))
BEGIN
	IF EXISTS(SELECT * FROM laboratorio WHERE cnpj = cnpj_lb) THEN
    BEGIN
		SET retorno = 'Laboratório já EXISTE!';
    END;
    ELSE 
		INSERT INTO laboratorio
		VALUES (cnpj_lb, nome_lb, horario_func);
        
        IF row_count() = 0 THEN
				SET retorno = 'NENHUM Laboratório foi cadastrado';
			ELSE
				SET retorno = 'Laboratório cadastrado com SUCESSO!';
			END IF;
	END IF;
		SELECT retorno;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sp_exclui_laboratorio(IN cnpj_lb VARCHAR(14), OUT retorno VARCHAR(50))
BEGIN
	DELETE FROM laboratorio
		WHERE cnpj = cnpj_lb;
			IF row_count() = 0 THEN
				SET retorno = 'NENHUM laboratório foi excluido';
			ELSE
				SET retorno = 'Laboratório excluido com SUCESSO!';
			END IF;
            SELECT retorno;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sp_cadastra_pessoa(IN cpf_pes VARCHAR(14), IN nome_pes VARCHAR(140), OUT retorno VARCHAR(150))
BEGIN
	IF EXISTS(SELECT * FROM pessoa WHERE cpf = cpf_pes) THEN
    BEGIN
		SET retorno = 'Pessoa já EXISTE!';
    END;
    ELSE 
		INSERT INTO pessoa
		VALUES (cpf_pes, nome_pes);
        
        IF row_count() = 0 THEN
				SET retorno = 'NENHUMA pessoa foi cadastrada';
			ELSE
				SET retorno = 'Pessoa cadastrada com SUCESSO!';
			END IF;
	END IF;
		SELECT retorno;
END $$
DELIMITER ;

-- testes
CALL sp_exclui_hospital('78945612306547', @retorno);
CALL sp_cadastra_hospital('78945612306547', 'Jules Hospital Vaughn', '10:00:00', @retorno);