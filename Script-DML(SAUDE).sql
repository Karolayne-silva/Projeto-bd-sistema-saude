-- SCRIPT DML
USE mydb;


-- PESSOA
INSERT INTO pessoa
VALUES
('68362029404', 'Karolayne Santos'),
('10988161451', 'Aldenir Telles'),
('32473923434', 'Ayrton Maia'),
('89530822421', 'Danilo Farias'),
('57738378468', 'Rodrigo Valois'),
('11721019499', 'Sabrina Maria'),
('66640233428', 'Guilheme Ataide'),
('76908245446', 'Quezia Cassiano'),
('67983607423', 'Everton Gabriel'),
('77307385465', 'Vitoria Oliveira'),
('41425437419', 'Livia Vitoria'),
('19218516434', 'Julio Gabriel'),
('34701852473', 'Pedro Lucas'),
('85669845447', 'Pedro Henrique'),
('96591496467', 'Felipe Lacerda'),
('24045200401', 'Felipe Renan'),
('26069002431', 'Apolo Nicolas'),
('73889456448', 'Gabriel Ramalho'),
('11112803475', 'Gilmar Adrian'),
('45692529408', 'Glyson Kaua'),
('19115511405', 'Jaqueline Silva'),
('66672002456', 'Emilly Talita'),
('66138042409', 'Erika Vilas'),
('20092686443', 'Leticia Correia'),
('38373840478', 'Ronaldo Filipe'),
('53903942405', 'Sara Lopes'),
('01044350466', 'Higor Cabral'),
('16010819440', 'Jhonata Carvalho'),
('76616189406', 'Maria Regina'),
('14222654477', 'Maiara Evelyn');


-- HOSPITAL
INSERT INTO hospital
VALUES
('81135692000187', 'Hospital in Memorie of Zendaya', '07:00:00'),
('14844266000125', 'Seatlle Hospital', '10:00:00'),
('33511288000118', 'Cleveland Clinic', '12:00:00'),
('19923801000157', 'Greys Anatomy', '07:00:00'),
('60766445000109', 'Dr House', '08:00:00'),
('51660455000174', 'Euphoria Hospital', '10:00:00'),
('09167233000158', 'Hospital Aldenir Telles', '12:00:00'),
('62454518000152', 'Hospital ADS', '09:30:00'),
('28170823000184', 'Toronto General Hospital', '07:30:00'),
('84810815000126', 'Hospital Karolayne', '11:00:00');



-- LABORATÓRIO
INSERT INTO laboratorio
VALUES
('08705361000145', 'KarolsLab', '15:30:00'),
('24674317000171', 'WWTC - When Was This Company', '10:00:00'),
('17649108000102', 'Hunter Medicina Laboratorial', '17:00:00'),
('85304456000106', 'Rue Center', '20:00:00'),
('61674743000131', 'Zendaya Laboratorios LTDA', '08:00:00'),
('50035298000143', 'Euphoria Laboratorio', '10:00:00'),
('27534123000169', 'Laboratorio Aldenir Telles', '15:30:00'),
('35514971000134', 'ADS Laboratorio de Odontologia', '17:00:00'),
('94693510000135', 'Valois LAB', '14:00:00'),
('32888004000144', 'Instituto de Diagnostico Ayrton Maia', '15:30:00');


-- MÉDICO
INSERT INTO medico
VALUES
('12345-PE','Oncologia', '12345', '68362029404', '84810815000126' ),
('54321-PE','Dermatologia', '45612', '10988161451', '81135692000187' ),
('23651-PE','Cirurgia Geral', null , '32473923434', '62454518000152' ),
('879644-SP','Cirurgia Plastica', null, '89530822421', '28170823000184' ),
('801242-SP','Traumotologia', '87412', '57738378468', '51660455000174' ),
('76425-GO','Neurologia', '25634', '11721019499', '09167233000158' ),
('654987-RJ','Obstetricia', null, '66640233428', '14844266000125' ),
('1423-PA','Pediatria', '74568', '76908245446', '60766445000109' ),
('8046-PI','Clinica Geral', null, '67983607423', '33511288000118' ),
('25647-PE','Cardiologia', null, '77307385465', '19923801000157' );


-- AMBULATÓRIO
INSERT INTO ambulatorio (Especialidade, Horario_Funcionamento, Hospital_CNPJ)
VALUES
('Cardiologia', '08:30:00', '51660455000174'),
('Cirurgia Plástica', '09:20:00', '28170823000184'),
('Dermatologia', '10:50:00', '81135692000187'),
('Fisioterapia', '13:30:00', '28170823000184'),
('Radiologia', '10:10:00', '62454518000152'),
('Fonoaudiologia', '14:00:00', '81135692000187'),
('Pediatria', '08:00:00', '84810815000126'),
('Reumatologia', '09:20:00', '33511288000118'),
('Odontologia', '11:00:00', '09167233000158'),
('Oftalmologia', '08:00:00', '81135692000187');


-- PESSOAL DE APOIO
INSERT INTO pessoalapoio (Cargo, Pessoa_CPF, Ambulatorio_idAmbulatorio)
VALUES
('Administrador Hospitalar', '41425437419', '01'),
('Chefe de Plantão' , '19218516434', '09'),
('Coordenador' , '34701852473', '07'),
('Gerente', '85669845447', '04'),
('Clínico Geral', '96591496467', '02'),
('Plantonista', '24045200401', '08'),
('Residentes', '26069002431', '06'),
('Enfermeiros', '73889456448', '10'),
('Farmacêuticos', '11112803475', '04'),
('Auxiliares de Enfermagem', '45692529408', '01');


-- PACIENTE
INSERT INTO paciente
VALUE
('70120010020102', '53903942405', '04'),
('094452909432357', '20092686443', '07'),
('923873973649844', '66640233428', '10'),
('893173009382653', '66138042409', '05'),
('024234535467632', '19115511405', '03'),
('646626476324543', '16010819440', '01'),
('765394102892873', '01044350466', '08'),
('384426483949873', '76616189406', '02'),
('438302925631646', '38373840478', '03'),
('294264685670138', '14222654477', '07');


-- CONSULTAR
INSERT INTO consultar (Medico_CRM, Paciente_CNS)
VALUES
('54321-PE', '024234535467632'),
('25647-PE', '384426483949873'),
('23651-PE', '70120010020102'),
('879644-SP', '646626476324543'),
('1423-PA', '094452909432357'),
('8046-PI', '923873973649844'),
('801242-SP', '438302925631646'),
('76425-GO', '294264685670138'),
('654987-RJ', '765394102892873'),
('12345-PE', '893173009382653');


-- DIAGNÓSTICO
INSERT INTO diagnostico (data, Hipotese, CIDI, Paciente_CNS)
values 
('2020-10-01', NULL, '003', '024234535467632'),
('2022-10-11', NULL, '010', '384426483949873'),
('2020-09-01', NULL, '011', '70120010020102'),
('2022-10-02', NULL, '001', '646626476324543'),
('2020-01-23', NULL, '017', '094452909432357'),
('2021-12-27', NULL, '025', '923873973649844'),
('2020-02-18', NULL, '038', '438302925631646'),
('2021-01-20', NULL, '039', '294264685670138'),
('2022-11-09', NULL, '043', '765394102892873'),
('2019-05-18', NULL, '045', '893173009382653');


-- SOLICITAR
INSERT INTO solicitar
VALUES
('08705361000145', '81135692000187'),
('24674317000171', '14844266000125'),
('17649108000102', '33511288000118'),
('85304456000106', '19923801000157'),
('61674743000131', '60766445000109'),
('27534123000169', '09167233000158'),
('50035298000143', '62454518000152'),
('35514971000134', '51660455000174'),
('94693510000135', '28170823000184'),
('32888004000144', '84810815000126');


-- EXAME
INSERT INTO exame (Nome, Tipo, Data, Horario, Justificativa, Preparo, Convenio, Laboratorio_CNPJ, Paciente_CNS)
VALUES 
('Hemograma', 'Sangue', '2020-12-01', '14:09:28',  'Queixa de dor pelvica', NULL, NULL, '08705361000145', '70120010020102'),
('Glicemia', 'Sangue', '2022-09-23', '13:10:33', NULL, NULL, NULL, '24674317000171', '70120010020102'),
('Colesterol Total', 'Colesterol', '2019-10-01', '11:29:30', NULL, NULL, NULL, '17649108000102', '094452909432357'),
('Glicemia em Jejum', 'Glicemia', '2020-01-02', '10:01:42', NULL, NULL, NULL, '17649108000102', '923873973649844'),
('TSH', 'Tireoide', '2020-11-20', '06:20:01', NULL, NULL, NULL, '85304456000106', '893173009382653'),
('Mioglobina', 'Sangue', '2020-12-04', '08:21:00', NULL, NULL, NULL, '61674743000131', '024234535467632'),
('Tomografia', 'Neurologico', '2021-10-02', '12:30:03', NULL, NULL, NULL, '50035298000143', '646626476324543'),
('Eletroencefalograma', 'Neurologico', '2021-09-08', '12:51:08', NULL, NULL, NULL, '85304456000106', '765394102892873'),
('Ultrassonografia Transcraniana', 'Neurologico', '2022-10-12', '09:23:45', NULL, NULL, NULL,'32888004000144', '384426483949873'),
('Abdomên Total', 'Abdominal', '2022-07-25', '13:00:36', NULL, NULL, NULL, '61674743000131', '438302925631646'),
('Abdomên Superior', 'Abdominal', '2022-05-12', '09:45:05', NULL, NULL, NULL, '27534123000169', '70120010020102'),
('Intra-Bocal', 'Boca1', '2022-02-25', '11:55:10', NULL, NULL, NULL, '35514971000134', '765394102892873'),
('Papanicolau', 'Intimo', '2020-10-15', '10:16:12', NULL, NULL, NULL, '94693510000135', '384426483949873'),
('Vulvoscopia', 'Intimo', '2020-10-16', '10:30:22', NULL, NULL, NULL, '32888004000144', '438302925631646');



-- TELEFONE
INSERT INTO telefone (Numero, Laboratorio_CNPJ, Hospital_CNPJ, Pessoa_CPF)
Values 
(8598354-7775, '08705361000145', NULL, NULL),
(8697562-4229, '24674317000171', NULL, NULL),
(6997521-0517, '17649108000102', NULL, NULL),
(8198521-6173, '85304456000106', NULL, NULL),
(6297181-2724, '61674743000131', NULL, NULL),
(9599682-8787, '50035298000143', NULL, NULL),
(9396821-5258, '27534123000169', NULL, NULL),
(2298338-6445, '35514971000134', NULL, NULL),
(9598236-0146, '94693510000135', NULL, NULL),
(6598532-7151, '32888004000144', NULL, NULL),
(7996993-7640, NULL, '81135692000187', NULL),
(4698835-2552, NULL, '14844266000125', NULL),
(8498211-5606, NULL, '33511288000118', NULL),
(1397997-5642, NULL, '19923801000157', NULL),
(4599558-9443, NULL, '60766445000109', NULL),
(9596938-9286, NULL, '51660455000174', NULL),
(2797345-7038, NULL, '09167233000158', NULL),
(6499657-2048, NULL, '62454518000152', NULL),
(2296932-8364, NULL, '28170823000184', NULL),
(4998880-2732, NULL, '84810815000126', NULL),
('1131668-4473', NULL, NULL, '68362029404'),
('1163357-3768', NULL, NULL, '10988161451'),
('8143477-2993', NULL, NULL, '32473923434'),
('8116418-3524', NULL, NULL, '89530822421'),
('8114743-0923', NULL, NULL, '57738378468'),
('8157672-2736', NULL, NULL, '11721019499'),
('8130874-1056', NULL, NULL, '66640233428'),
('8137423-1558', NULL, NULL, '76908245446'),
('8111008-3561', NULL, NULL, '67983607423'),
('8124897-2079', NULL, NULL, '77307385465'),
('8183273-3780', NULL, NULL, '41425437419'),
('8135776-0135', NULL, NULL, '19218516434'),
('8176997-8217', NULL, NULL, '34701852473'),
('8134011-8775', NULL, NULL, '85669845447'),
('8181166-3968', NULL, NULL, '96591496467'),
('8169690-9037', NULL, NULL, '24045200401'),
('8130179-4110', NULL, NULL, '26069002431'),
('8177391-0344', NULL, NULL, '73889456448'),
('8143848-0308', NULL, NULL, '11112803475'),
('8166692-9480', NULL, NULL, '45692529408'),
('8129748-0416', NULL, NULL, '19115511405'),
('8122258-9802', NULL, NULL, '66672002456'),
('8156007-5860', NULL, NULL, '66138042409'),
('8187509-6212', NULL, NULL, '20092686443'),
('8112923-9899', NULL, NULL, '38373840478'),
('8151317-1128', NULL, NULL, '53903942405'),
('8115082-5238', NULL, NULL, '01044350466'),
('8161279-6170', NULL, NULL, '16010819440'),
('8161507-3223', NULL, NULL, '76616189406'),
('8157924-3374', NULL, NULL, '14222654477');


-- ENDEREÇO
INSERT INTO endereco (Rua, CEP, Bairro, Cidade, Numero, UF, Complemento, Paciente_CNS, Hospital_CNPJ, Laboratorio_CNPJ)
VALUES 
('Rua Monis Menezes', '00291-22', 'Ibura', 'Belem', 30, 'PA', NULL, '70120010020102', NULL, NULL),
('Rua Jaspe', '51230-022', 'Ipsep', 'Recife', '12', 'PE', 'Perto da av. lima', '094452909432357', NULL, NULL),
('Rua Santo Antonio', '34569-021', 'Nova Esperança', 'Natal', 123, 'RN', 'Do lado da escola Apolonio Sales', '893173009382653', NULL, NULL ),
('Rua são Francisco', '14589-789', 'Marco Zero', 'São Bernado do Campo', 456, 'SP', NULL, '923873973649844', NULL, NULL ),
('Rua sete de setembro', '26491-012', 'Pacoval', 'Recife', 21, 'PE', NULL, '024234535467632', NULL, NULL),
('Rua Amado Batista', '58340-278', 'Trem', 'São Gonçalo', 45, 'RJ', NULL, '646626476324543', NULL, NULL ),
('Rua Cristovão Colombo', '1457-689', 'Botafogo', 'Aflumenau', 13, 'RJ', NULL, '765394102892873', NULL, NULL ),
('Rua A', '4598-790', 'Catumbi', 'Belem', 456, 'PA', NULL, '384426483949873', NULL, NULL),
('Rua quinze', '48294-940', 'Centro', 'Contagem', 490, 'MG', NULL, '438302925631646', NULL, NULL ), 
('Rua Princesa Isabel', '47295-948', 'Barreiro', 'Uberlândia', 40, 'MG', NULL, '294264685670138', NULL, NULL );

INSERT INTO endereco (Rua, CEP, Bairro, Cidade, Numero, UF, Complemento, Paciente_CNS, Hospital_CNPJ, Laboratorio_CNPJ)
VALUES 
('Rua sao Carlos', '79785-971', 'Sobradinho', 'Brasilia', 98, 'DF', NULL, NULL, '81135692000187', NULL),
('Rua Arere', '56503-126', 'São Cristóvão', 'Arcoverde', 892, 'PE', NULL, NULL, '14844266000125', NULL),
('Praça Zacarias Virgínio', '55265-970', 'Perpétuo Socorro', 'Alagoinha', 21, 'PE', NULL, NULL, '33511288000118', NULL),
('Rua Londrina', '76390-970', 'Setor Central', 'Barro Alto', 650, 'GO', NULL, NULL, '19923801000157', NULL),
('Avenida Goiás', '76729-970', 'Setor Oeste', 'Araguapaz', 466, 'GO', NULL, NULL, '60766445000109', NULL),
('Avenida Vale do Sol', '72930-970', 'Centro', 'Alexânia', 76, 'GO', NULL, NULL, '51660455000174', NULL),
('Rua Carlos Riedel', '18295-970', 'Aracaçu', 'Aracaçu', 90, 'SP', NULL, NULL, '09167233000158', NULL),
('Travessa Vice-Prefeito Antônio Luiz Prado', '12820-970', 'Centro', 'Areias', 12, 'SP', NULL, NULL, '62454518000152', NULL),
('Avenida Ruth Passarinho', '68645-970', 'Centro', 'Bonito', 543, 'PA', NULL, NULL, '28170823000184', NULL),
('Rua WZ-24', '66633-830', 'Parque Verde', 'Belém', 837, 'PA', NULL, NULL, '84810815000126', NULL);


INSERT INTO endereco (Rua, CEP, Bairro, Cidade, Numero, UF, Complemento, Paciente_CNS, Hospital_CNPJ, Laboratorio_CNPJ)
VALUES 
('Quadra QNO', '72250-303', 'Ceilândia Norte', 'Brasília', 982, 'DF', NULL, NULL, NULL, '08705361000145'),
('Rua Deoutado Federal', '58390-970', 'lucas', 'Alagoinha', 568, 'PB', NULL, NULL, NULL, '24674317000171'),
('Rua São Jerônimo', '23953-310', 'Parque Perequê', 'Angra dos Reis', 809, 'RJ', NULL, NULL, NULL, '17649108000102'),
('Rua da Matriz', '28525-970', 'Centro', 'Boa Sorte', 922, 'RJ', NULL, NULL, NULL, '85304456000106'),
('Rua das Estrelas', '28908-650', 'Miguel Couto', 'Cabo Frio', 12, 'RJ', NULL, NULL, NULL, '61674743000131'),
('Rua Joaquim de Souza', '76254-970', 'Setor Central', 'Baliza', 76, 'GO', NULL, NULL, NULL, '50035298000143'),
('Praça José Adamian', '73858-970', 'Girimun', 'Campo Lindo', 10, 'GO', NULL, NULL, NULL, '27534123000169'),
('Avenida Esmênia da Silva Martins', '79785-971', 'Cajuru', 'Angélica', 213, 'MS', NULL, NULL, NULL, '35514971000134'),
('Avenida Manoel Vicente', '79670-970', 'Boqueirão', 'Brasilândia', 111, 'MS', NULL, NULL, NULL, '94693510000135'),
('Rua Principal', '79892-970', 'Matriz', 'Carumbé', 9, 'MS', NULL, NULL, NULL, '32888004000144');


UPDATE exame set convenio = "Hospital in Memorie of Zendaya"
	WHERE idExame = 1;
    
UPDATE exame set convenio = "Seatlle Hospital"
	WHERE idExame = 2;
    
UPDATE exame set convenio = "Cleveland Clinic"
	WHERE idExame = 3;
    
UPDATE exame set convenio = "Greys Anatomy"
	WHERE idExame = 4;
    
UPDATE exame set convenio = "Dr House"
	WHERE idExame = 5;
    
UPDATE exame set convenio = "Euphoria Hospital"
	WHERE idExame = 6;
    
UPDATE exame set convenio = "Hospital Aldenir Telles"
	WHERE idExame = 7;
    
UPDATE exame set convenio = "Hospital ADS"
	WHERE idExame = 8;
    
UPDATE exame set convenio = "Toronto General Hospital"
	WHERE idExame = 9;

UPDATE exame set convenio = "Hospital Karolayne"
	WHERE idExame = 10;
    
UPDATE exame set convenio = "Hospital in Memorie of Zendaya"
	WHERE idExame = 11;
    
UPDATE exame set convenio = "Seatlle Hospital"
	WHERE idExame = 12;
    
UPDATE exame set convenio = "Cleveland Clinic"
	WHERE idExame = 13;
    
UPDATE exame set convenio = "Greys Anatomy"
	WHERE idExame = 14;
    
UPDATE exame set preparo = "Jejum sugerido de 12 horas."
	WHERE idExame = 1;
    
UPDATE exame set preparo = "A abstinência de bebida alcoólica é desejável nas 72 horas que antecedem o teste."
	WHERE idExame = 2;
    
UPDATE exame set preparo = "Não praticar atividades físicas 12 horas antes da coleta"
	WHERE idExame = 3;
    
UPDATE exame set preparo = "abstinência de bebida alcoólica é desejável nas 72 horas que antecedem o teste."
	WHERE idExame = 4;
    
UPDATE exame set preparo = "Jejum sugerido de, no mínimo, 8 horas e, no máximo 12 horas"
	WHERE idExame = 5;
    
UPDATE exame set preparo = "Jejum sugerido de 12 horas."
	WHERE idExame = 6;