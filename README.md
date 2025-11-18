# Clínica Odontológica Alves

Sistema completo para gestão de clínica odontológica desenvolvido em Delphi com arquitetura MVC e banco de dados PostgreSQL.

## 📋 Sumário

- [Visão Geral](#-visão-geral)
- [Funcionalidades](#-funcionalidades)
- [Arquitetura](#-arquitetura)
- [Tecnologias](#-tecnologias)
- [Estrutura do Projeto](#-estrutura-do-projeto)
- [Banco de Dados](#-banco-de-dados)
- [Instalação](#-instalação)
- [Como Usar](#-como-usar)
- [Relatórios](#-relatórios)
- [Logs do Sistema](#-logs-do-sistema)

## 🏥 Visão Geral

O Sistema de Clínica Odontológica Alves é uma solução completa para gerenciamento de clínicas odontológicas, permitindo o controle total de pacientes, profissionais, procedimentos e consultas. O sistema oferece interface intuitiva e funcionalidades robustas para otimizar o fluxo de trabalho da clínica.

## ✨ Funcionalidades

### 🧾 Gestão de Pacientes
- Cadastro completo de pacientes com informações pessoais
- Controle de dados (nome, CPF, telefone, CEP, endereço, data de nascimento)
- Sistema de ativação/desativação de pacientes
- Busca e filtragem de pacientes

### 👨‍⚕️ Gestão de Profissionais
- Cadastro de profissionais da clínica
- Gerenciamento de informações de contato
- Controle de status ativo/inativo
- Associação com consultas e procedimentos

### 🦷 Gestão de Procedimentos
- Catálogo de procedimentos odontológicos
- Controle de informações detalhadas
- Associação com consultas

### 📅 Gestão de Consultas
- Agendamento completo de consultas
- Controle de data e horário (início e fim)
- Vinculação entre paciente, profissional e procedimento
- Visualização em formato de calendário
- Controle de status ativo

### 👥 Gestão de Usuários
- Sistema de autenticação e controle de acesso
- Múltiplos níveis de permissão
- Gerenciamento de contas de usuário

### 📊 Sistema de Relatórios
- Relatórios por profissionais
- Relatórios por procedimentos
- Relatórios de consultas
- Exportação em diversos formatos

### 📝 Logs do Sistema
- Registro completo de todas as operações
- Logs de pacientes, profissionais, procedimentos e consultas
- Auditoria e rastreabilidade de ações

## 🏗️ Arquitetura

O sistema implementa uma arquitetura MVC (Model-View-Controller) bem definida:

- **Model**: Classes de dados e entidades
- **View**: Interfaces de usuário (formulários Delphi)
- **Controller**: Lógica de negócio e controle
- **Repository**: Camada de acesso a dados
- **Utils**: Utilitários e funcionalidades auxiliares

## 🔧 Tecnologias

- **Linguagem**: Object Pascal (Delphi)
- **Banco de Dados**: PostgreSQL
- **Relatórios**: FastReport
- **Framework**: VCL (Visual Component Library)

## 📁 Estrutura do Projeto

```
Clinica-Odontologica/
├── Delphi/
│   ├── Clinica_Odontologica.dpr    # Arquivo principal do projeto
│   └── Project1.dpr               # Projeto adicional
├── src/
│   ├── Controller/                # Controladores da aplicação
│   │   ├── uConsultasController.pas
│   │   ├── uPacientesController.pas
│   │   ├── uProfissionaisController.pas
│   │   ├── uProcedimentosController.pas
│   │   ├── uUsuariosController.pas
│   │   ├── uRelatoriosController.pas
│   │   └── [Controllers de Log]
│   ├── Model/                     # Modelos de dados
│   │   ├── uConsultas.pas
│   │   ├── uPacientes.pas
│   │   ├── uProfissionais.pas
│   │   ├── uProcedimentos.pas
│   │   ├── uUsuarios.pas
│   │   ├── uUsuarioConexao.pas
│   │   └── [Models de Log]
│   ├── Repository/                # Camada de acesso a dados
│   │   ├── uConsultasRepository.pas
│   │   ├── uPacientesRepository.pas
│   │   ├── uProfissionaisRepository.pas
│   │   ├── uProcedimentosRepository.pas
│   │   ├── uUsuarioRepository.pas
│   │   ├── uRelatoriosRepository.pas
│   │   └── [Repositories de Log]
│   ├── Utils/                     # Utilitários
│   │   └── uLogSimples.pas
│   ├── View/                      # Interfaces de usuário
│   │   ├── TelaLogin.pas/.dfm
│   │   ├── TelaPacientes.pas/.dfm
│   │   ├── TelaProfissionais.pas/.dfm
│   │   ├── TelaProcedimentos.pas/.dfm
│   │   ├── TelaConsultas.pas/.dfm
│   │   ├── TelaUsuarios.pas/.dfm
│   │   └── TelaRelatorios.pas/.dfm
│   └── uDadosGlobais.pas          # Variáveis globais
├── assets/
│   ├── Docs/                      # Documentação
│   │   └── Backup top.sql         # Backup do banco
│   └── Relatórios/                # Templates de relatórios
├── Logs/                          # Logs do sistema
│   ├── paciente_log.txt
│   ├── profissional_log.txt
│   └── usuario_log.txt
└── README.md                      # Este arquivo
```

## 🗄️ Banco de Dados

O sistema utiliza PostgreSQL com as seguintes tabelas principais:

- **pacientes**: Dados dos pacientes
- **profissionais**: Informações dos profissionais
- **procedimentos**: Catálogo de procedimentos
- **consultas**: Agendamentos e consultas
- **usuarios**: Sistema de autenticação
- **grupo_usuarios**: Controle de permissões

## 🚀 Instalação

### Pré-requisitos
- Delphi 10.4 ou superior
- PostgreSQL 12 ou superior
- FastReport para geração de relatórios

### Passos para instalação

1. **Clone o repositório:**
   ```bash
   git clone [URL_DO_REPOSITORIO]
   cd Clinica-Odontologica
   ```

2. **Configure o banco de dados:**
   - Crie o banco `clinica_odontologica` no PostgreSQL
   - Execute o script `assets/Docs/Backup top.sql` para criar as tabelas
   - Configure a conexão no arquivo `src/Model/uUsuarioConexao.pas`

3. **Abra o projeto no Delphi:**
   - Abra o arquivo `Delphi/Clinica_Odontologica.dpr`
   - Compile o projeto (Ctrl+F9)

4. **Execute a aplicação:**
   - Execute o projeto (F9)
   - Faça login com as credenciais padrão

## 📖 Como Usar

### Login
1. Abra a aplicação
2. Digite usuário e senha
3. Clique em "Entrar"

### Módulos Principais

**Pacientes:**
- Adicione novos pacientes clicando em "Novo"
- Preencha todos os campos obrigatórios
- Salve as alterações
- Use o campo de busca para encontrar pacientes rapidamente

**Profissionais:**
- Cadastre os profissionais da clínica
- Mantenha os dados atualizados
- Controle o status ativo/inativo

**Procedimentos:**
- Mantenha o catálogo de procedimentos atualizado
- Defina informações detalhadas para cada procedimento

**Consultas:**
- Agende novas consultas
- Visualize consultas por data/período
- Edite informações quando necessário
- Vincule paciente, profissional e procedimento

**Relatórios:**
- Acesse o módulo de relatórios
- Selecione o tipo desejado (profissionais, procedimentos, consultas)
- Defina o período
- Gere e exporte os relatórios

## 📊 Relatórios

O sistema oferece três tipos principais de relatórios:

1. **Relatório por Profissionais**
   - Lista todos os profissionais cadastrados
   - Informações detalhadas sobre cada um
   - Status e contatos

2. **Relatório por Procedimentos**
   - Catálogo completo de procedimentos
   - Detalhes e descrições
   - Controle de ativos/inativos

3. **Relatório de Consultas**
   - Agendamentos por período
   - Informações completas de cada consulta
   - Filtros por data, profissional ou paciente

## 📝 Logs do Sistema

O sistema mantém logs detalhados de todas as operações:

- **paciente_log.txt**: Operações relacionadas a pacientes
- **profissional_log.txt**: Operações relacionadas a profissionais
- **usuario_log.txt**: Operações relacionadas a usuários

Os logs registram:
- Data e hora da operação
- Usuário que realizou a ação
- Tipo de operação (inclusão, alteração, exclusão)
- Detalhes da operação

## 🔐 Segurança

O sistema implementa:
- Controle de acesso por usuário e senha
- Diferentes níveis de permissão
- Registro de auditoria em logs
- Validação de dados em todas as operações

## 📞 Suporte

Para suporte técnico ou dúvidas:
- Verifique os logs do sistema para identificar problemas
- Consulte a documentação técnica
- Entre em contato com o administrador do sistema

## 📄 Licença

Este projeto é proprietário e desenvolvido para uso exclusivo da Clínica Odontológica Alves.

---

**Versão:** 1.0
**Última Atualização:** 2025
**Desenvolvedor:** Equipe de Desenvolvimento Clínica Alves