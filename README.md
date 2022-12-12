# Projeto Banco de dados de um Sistema de Saúde
Projeto de banco de dados de um sistema de saúde fictício, com a descrição do minimundo, modelo conceitual, modelo lógico e os scipts de criação.

Alunos: 
- Karolayne Silva
- Aldenir Teles
- Ayrton Maia

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
