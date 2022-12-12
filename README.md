# Projeto Banco de dados de um Sistema de Saúde
Projeto de banco de dados de um sistema de saúde fictício, com a descrição do minimundo, modelo conceitual, modelo lógico e os scipts de criação.


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

## Tabelas Do Banco de Dados
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

## Colaboradores 

<table>
  <tr>
    <td align="center"><a href="https://www.linkedin.com/in/karolayne-silvas/"><img src="https://media-exp1.licdn.com/dms/image/C4D03AQHNUS2ujDGLwg/profile-displayphoto-shrink_800_800/0/1659726701828?e=1671062400&v=beta&t=ENdrOV4vuJuxTikDchaBfbse_mXUHmXl45QlWKM15j0" width="100px;" alt=""/><br /><sub><b>Karolayne Silva</b></sub></a></td>
    <td align="center"><a href="https://www.linkedin.com/in/ayrton-maia-404489228/"><img src="https://avatars.githubusercontent.com/u/114452531?v=4" width="100px;" alt=""/><br /><sub><b>Ayrton Maia</b></sub></a></td>
    <td align="center"><a href="https://www.linkedin.com/in/aldenirtelles/"><img src="https://avatars.githubusercontent.com/u/60609409?v=4" width="100px;" alt=""/><br /><sub><b>Aldenir Telles</b></sub></a></td>
  </tr>

