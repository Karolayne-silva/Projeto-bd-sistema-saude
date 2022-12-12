-- SCRIPT DQL

/*Relatório 1 - Lista dos Pacientes que expressaram o motivo da consulta trazendo as colunas 
(Motivo da consulta ,Nome Paciente, CPF Paciente, Nome do médico, CRM do Médico e Hospital do Médico), ordenado pelo nome do Paciente;*/

SELECT c.Motivo 'Motivo Consulta',pe.nome 'Nome Paciente', pe.CPF 'CPF Paciente', pes.nome 'Nome Médico', m.CRM 'CRM Médico',
h.Nome 'Nome Hospital'
	FROM consultar as c
		INNER JOIN paciente as p ON p.CNS = c.Paciente_CNS
        INNER JOIN pessoa as pe ON pe.CPF = p.Pessoa_CPF
        INNER JOIN medico as m ON m.CRM = c.Medico_CRM
        INNER JOIN pessoa as pes ON pes.CPF = m.Pessoa_CPF
        INNER JOIN hospital as h ON h.CNPJ = m.Hospital_CNPJ
			ORDER BY pe.nome;

/*Relatório 2 - Lista dos Exames contendo os detalhes do mesmo trazendo as colunas 
(Nome do Exame, Quantidade Exames,Tipo do Exame, Data do Exame, Horario do Exame, Nome Paciente,
 Nome do Laboratório, Nome do Hospital), ordenado pelo tipo do exame;*/

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
                    
/*Relatório 3 - Lista do Pessoal de Apoio que trabalha no ambulatorio especializado em dermatologia 
contendo os detalhes do mesmo trazendo as colunas (Especialidade, Horario Funcionamento, Nome do Hospital, 
Nome Pessoal de Apoio, Cargo Pessoal de Apoio), ordenado pelo horario de funcionamento do ambulatorio;*/

SELECT a.Especialidade'Especialidade', a.Horario_Funcionamento'Horario Funcionamento', h.Nome'Nome do Hospital', 
pe.Nome'Nome Pessoal de Apoio', p.Cargo'Cargo Pessoal de Apoio'
	FROM ambulatorio as a
		INNER JOIN pessoalapoio as p ON p.Ambulatorio_idAmbulatorio = a.idAmbulatorio
        INNER JOIN pessoa as pe ON pe.CPF = p.Pessoa_CPF
        INNER JOIN hospital as h ON h.CNPJ = a.Hospital_CNPJ
			WHERE h.nome = 'Hospital in Memorie of Zendaya'
				ORDER BY a.Horario_Funcionamento;
                
/*Relatório 4 - Lista dos Pacientes que moram em Recife e tiveram um CID associado
 trazendo as colunas (CPF Paciente, CID Diagnostico,Cidade Paciente, Numero Medico)
 , ordenado pelo CID;*/

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

/*Relatório 5 - Lista dos Laboratorios contando a quantidade de exames realizados trazendo
 as colunas (Nome Laboratorio, Nome Exame,Quantidade Exame), ordenado pela quantidade exame;*/
 
 SELECT l.nome 'Nome Laboratorio', e.Nome 'Nome Exame', count(idExame)'Quantidade Exame'
	FROM laboratorio as l
		INNER JOIN exame as e ON e.Laboratorio_CNPJ = l.CNPJ
			 GROUP BY l.nome
				ORDER BY count(e.idExame) DESC;
 
 
 /*Relatório 6 - Lista da Consulta com o motivo, juntamente com o Numero do Paciente
 e o número do médico que realizou a consulta, trazendo as colunas
 (Motivo Consulta, Numero Paciente,Telefone Medico), ordenado pelo Telefone do Medico;*/
 
 SELECT c.Motivo 'Motivo Consulta', t.numero 'Numero Paciente', tel.numero 'Telefone Medico' 
	FROM consultar as c
		INNER JOIN paciente as p ON p.CNS = c.Paciente_CNS
        INNER JOIN pessoa as pe ON pe.CPF = p.Pessoa_CPF
        INNER JOIN telefone as t ON t.Pessoa_CPF = pe.CPF
        INNER JOIN Medico as m ON m.CRM = c.Medico_CRM
        INNER JOIN pessoa as pes ON pes.CPF = m.Pessoa_CPF
        INNER JOIN telefone as tel ON tel.Pessoa_CPF = pes.CPF
			ORDER BY tel.numero;
        
 
 /*Relatório 7 - Lista dos Paciente com os Medicos que os consultaram
 juntamente com o nome do Hospital que ocorreu a consulta
 trazendo as colunas (Nome Pessoal Apoio, Nome Hospital,Nome Medico)
 , ordenado pelo nome Medico;*/
 
SELECT pe.nome 'Nome Pessoal Apoio', h.nome 'Nome Hospital', pes.Nome'Nome Medico'
	FROM pessoalapoio as p
		INNER JOIN pessoa as pe ON pe.CPF = p.Pessoa_CPF
        INNER JOIN ambulatorio as a ON a.idAmbulatorio = p.Ambulatorio_idAmbulatorio
        INNER JOIN hospital as h ON h.CNPJ = a.Hospital_CNPJ
        INNER JOIN medico as m ON m.Hospital_CNPJ = h.CNPJ
        INNER JOIN pessoa as pes ON pes.cpf = m.Pessoa_CPF
			ORDER BY pes.Nome;
            
-- Relatório 14 -> Lista de pessoas que realizaram o exame no laboratório Hunter Medicina Laboratorial. Colunas (Nome Pessoa, Tipo Exame, Data Exame, Nome Laboratório), ordenar pela Data do Exame;

SELECT ps.nome'Nome Pessoa', e.tipo'Tipo Exame', e.Data'Data Exame', lab.nome'Nome Laboratorio'
FROM exame AS e
	INNER JOIN laboratorio AS lab ON e.Laboratorio_CNPJ = lab.CNPJ
    INNER JOIN paciente AS pc ON e.Paciente_CNS = pc.CNS
    INNER JOIN pessoa AS ps ON pc.Pessoa_CPF = ps.CPF
		 WHERE lab.nome = 'Hunter Medicina Laboratorial'
         ORDER BY e.data;


-- Relatório 15 -> Nomes dos médicos, junto com seu CRM, que trabalham no Toronto General Hospital. Colunas (Nome Pessoa, CRM Médico, Nome Hospital, Especialidade Ambulatório);

SELECT ps.nome'Nome Medico', m.CRM'CRM Medico', hp.nome'Nome Hospital', am.especialidade'Especialidade Ambulatorio'
FROM medico AS m
	INNER JOIN pessoa AS ps ON m.Pessoa_CPF = ps.CPF
    INNER JOIN hospital AS hp ON m.Hospital_CNPJ = hp.CNPJ
    INNER JOIN ambulatorio AS am ON hp.CNPJ = am.Hospital_CNPJ
		WHERE hp.nome = 'Toronto General Hospital';


-- Relatório 16 -> Telefone dos pacientes que foram ao ambulatório no horário das 10h às 13h. Colunas (Número Telefone, CNS Paciente, Nome Paciente, Horario_Funcionamento Ambulatório), ordenando pelo horário de funcionamento do ambulatório;

SELECT tel.numero'Numero Telefone', pc.CNS'CNS Paciente', ps.nome'Nome Paciente', am.Horario_Funcionamento'Horario Func. Ambulatorio'
FROM  pessoa AS ps
	INNER JOIN telefone AS tel ON ps.CPF = tel.Pessoa_CPF
    INNER JOIN paciente AS pc ON pc.Pessoa_CPF = ps.CPF
    INNER JOIN ambulatorio AS am ON am.idAmbulatorio = pc.Ambulatorio_idAmbulatorio
		WHERE am.Horario_Funcionamento BETWEEN '08:00:00' AND '10:30:00'
        ORDER BY am.Horario_Funcionamento;


-- Relatório 17 -> Lista de nomes do pessoal de apoio com suas respectivas areas de atuacao e em qual hospital trabalham, trazendo as colunas (Nome Pessoa de Apoio, Cargo Pessoa de Apoio, Especialidade Ambulatorial, Telefone Funcionario, Nome do Hospital), ordenando pelo cargo / área de atuação do pessoal de apoio

SELECT ps.Nome'Pessoal de Apoio', pa.Cargo'Cargo Funcionario', am.Especialidade'Especialidade Ambulatorial', tel.Numero'Telefone Funcionario', hp.nome'Nome Hospital'
FROM pessoalapoio AS pa
	INNER JOIN ambulatorio  AS am ON am.idAmbulatorio = pa.Ambulatorio_idAmbulatorio 
	INNER JOIN pessoa AS ps ON ps.CPF = pa.Pessoa_CPF
	INNER JOIN telefone AS tel ON tel.Pessoa_CPF = ps.CPF
	INNER JOIN hospital AS hp ON hp.CNPJ = am.Hospital_CNPJ
		ORDER BY pa.Cargo;


-- Relatório 18 -> Telefone dos médicos que atuam na área de cirurgia geral e seus códigos de CRM juntamente com o nome e CPF. Colunas (Nome Pessoa, CRM Médico, CPF Pessoa, Número Telefone, Área Atuação Médico), ordenado pelo nome dos médicos.

SELECT ps.nome 'Nome Médico', m.CRM 'CRM Médico', ps.CPF 'CPF Médico', tel.Numero'Telefone Médico',m.Area_Atuacao 'Área de Atuação'
FROM pessoa AS ps
	INNER JOIN medico AS m ON ps.CPF = m.Pessoa_CPF
    INNER JOIN telefone AS tel ON tel.Pessoa_CPF = ps.CPF
		WHERE m.Area_Atuacao = 'Cirurgia Geral';


-- Relatório 19 -> Lista dos telefones dos médicos ,juntamente com sua Área de Atuação, que trabalham em Hospitais no Bairro Centro (Nome Pessoa, Area Atuacao Médico, Numero Telefone, Nome Hospital, Bairro Endereço), ordenando pelo nome dos médicos

SELECT ps.nome'Nome Funcionario', m.Area_Atuacao'Área de Atuação', tel.numero'Telefone', hp.nome'Hospital', d.Bairro'Bairro'
FROM endereco AS d
	INNER JOIN hospital AS hp ON hp.CNPJ = d.Hospital_CNPJ
    INNER JOIN medico AS m ON m.Hospital_CNPJ = hp.CNPJ
    INNER JOIN pessoa AS ps ON ps.CPF = m.Pessoa_CPF
    INNER JOIN telefone AS tel ON tel.Pessoa_CPF = ps.CPF
		WHERE d.bairro = 'Centro'
		ORDER BY ps.nome;


-- Relatório 20 -> Lista dos pacientes que foram atendidos pelo médico Rodrigo Valois, informando o motivo da consulta e qual hospital. Colunas (Nome Pessoa-Paciente, Motivo Consulta, Nome Hospital, Nome Médico, Bairro Hospital, Cidade Hospital)

SELECT ps.nome'Paciente',co.Motivo 'Motivo', hp.nome'Hospital', pes.nome'Médico', d.Bairro'Bairro Hospital', d.Cidade'Cidade Hospital'
FROM paciente AS pc
	INNER JOIN diagnostico AS di ON di.Paciente_CNS = pc.CNS
    INNER JOIN consultar AS co ON co.Paciente_CNS = pc.CNS
    INNER JOIN pessoa AS ps ON ps.CPF = pc.Pessoa_CPF
    INNER JOIN medico AS m ON co.Medico_CRM = m.CRM
    INNER JOIN pessoa AS pes ON pes.CPF = m.Pessoa_CPF
    INNER JOIN hospital AS hp ON hp.CNPJ = m.Hospital_CNPJ
    INNER JOIN endereco AS d ON d.Hospital_CNPJ = hp.CNPJ
		WHERE pes.nome LIKE 'Rod%';