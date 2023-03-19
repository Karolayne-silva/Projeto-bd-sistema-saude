# Projeto Banco de dados - Sistema de Saúde
Projeto de banco de dados de um sistema de saúde fictício, com a descrição do minimundo, modelo conceitual, modelo lógico e os scripts de criação.


## Descrição do minimundo

- Hospitais são formados por um ou mais Ambulatórios e cada um destes está
em um único Hospital;
- Médicos clinicam em um único Hospital, cada um deles agregando vários
Médicos;
- Hospitais solicitam exames clínicos em vários Laboratórios, cada um destes
pode ter solicitações de vários Hospitais;
- Pacientes consultam vários Médicos, e estes são consultados por vários
Pacientes;
- Ambulatórios atendem vários Pacientes, enquanto estes só podem ser
atendidos em um único Ambulatório;
- Pessoal de apoio está alocado a cada Ambulatório, e cada um destes conta
com vários integrantes do Pessoal de apoio;
- Laboratórios fazem vários Exames, e cada um dos Exames é feito em um
único Laboratório;
- Pacientes realizam vários Exames, e cada Exame é realizado por um único
Paciente;
- Cada Paciente pode receber vários Diagnósticos, e cada Diagnóstico é de um
único Paciente.

## Modelo Conceitual

![image](https://user-images.githubusercontent.com/96891482/207071784-cb6e2d29-6b1a-442e-bac2-266fb46a08af.png)


## Modelo lógico

![image](https://user-images.githubusercontent.com/96891482/207071952-9bb74798-8424-49bf-97a1-bf701da4921c.png)

### Tabelas Do Banco de Dados
---
Pessoa -> CPF, nome

Pessoa de apoio -> idPessoaApoio, cargo, Pessoa_CPF, Ambulatorio_idAmbulatorio

Ambulatorio -> idAmbulatorio, Especialidade, Horario_funcionamento, Hospital_CNPJ

Consultar -> Motivo, medico_CRM, Paciente_CNS

Medico -> CRM, Area_atuacao, RQE, Pessoa_CPF, Hospital_CNPJ

Hospital -> CNPJ, nome, Horario_funcionamento

Telefone -> idTelefone, Numero, Laboratorio_CNPJ, Hospital_CNPJ, Pessoa_CPF

Solicitar -> Laboratorio_CNPJ, Hospital_CNPJ

Paciente -> CNS, Pessoa_CPF, Ambulatorio_idAmbulatorio

Diagnostico -> idDiagnostico, Data, Hipotese, CIDI, Paciente_CNS

Endereco -> idEndereco, Rua, CEP, Bairro, Cidade, Numero, UF, Complemento, Paciente_CNS, Hospital_CNPJ, Laboratorio_CNPJ

Laboratorio -> CNPJ, Nome, Horario_funcionamento

Exame -> idExame, Nome, Tipo, Data, Horario, Justificativa, Preparo, Convenio, Laboratorio_CNPJ, Paciente_CNS

# Colaboradores 

<table>
  <tr>
    <td align="center"><a href="https://www.linkedin.com/in/karolayne-silvas/"><img src="https://media-exp1.licdn.com/dms/image/D4D03AQFKcKwPnjaP4g/profile-displayphoto-shrink_200_200/0/1665427761243?e=1676505600&v=beta&t=qW-_JKEP_DqV1SkzjzqYWFqDO57qQnHjiZ6LyU-pIgQ" width="100px;" alt=""/><br /><sub><b>Karolayne Silva</b></sub></a></td>
    <td align="center"><a href="https://www.linkedin.com/in/ayrton-maia-404489228/"><img src="https://media-exp1.licdn.com/dms/image/C4D03AQFOZAJm8Zqwgw/profile-displayphoto-shrink_200_200/0/1638994306152?e=1676505600&v=beta&t=DaDdWR1LHl6K4rO-PA1RUaYmhlk0fF3ZM0Zga-cqxaM" width="100px;" alt=""/><br /><sub><b>Ayrton Maia</b></sub></a></td>
    <td align="center"><a href="https://www.linkedin.com/in/aldenirtelles/"><img src="https://media-exp1.licdn.com/dms/image/C4E03AQFDSsg7qdLV5w/profile-displayphoto-shrink_200_200/0/1616101838264?e=1676505600&v=beta&t=JkVn2R4flewVkPgD44OZFD_f9eTaMGRL3v4sLtz42wI" width="100px;" alt=""/><br /><sub><b>Aldenir Telles</b></sub></a></td>
  </tr>

