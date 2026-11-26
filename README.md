# 🏨 Sistema de Hotelaria — Banco de Dados (SQL)

Olá! Sou o **Pedro**, estudante do curso técnico de **Desenvolvimento de Sistemas (DS)** no **CEEP Castaldi**.

Este repositório reúne as atividades práticas e consultas SQL desenvolvidas durante as aulas de **Banco de Dados**, ministradas pelo professor **Lucas Camacho**. O projeto simula operações reais de consulta, análise de métricas e manutenção estrutural em um sistema de gestão de hospedagens.

---

## 🛠️ Tecnologias Utilizadas

* **Linguagem:** SQL (Structured Query Language)
* **SGBD:** MySQL (utilizando recursos de DDL e DQL)

---

## 🗂️ Estrutura do Banco de Dados

Os scripts trabalham sobre as seguintes entidades principais:
* `enderecos`: Localização das propriedades (número, bairro, cidade, estado).
* `proprietarios`: Dados cadastrais dos donos dos imóveis.
* `hospedagens`: Informações dos imóveis disponíveis e status de atividade (`ativo`).
* `alugueis` *(posteriormente renomeada para `RESERVAS`)*: Registro de estadias, datas de início/fim e valores totais.

---

## ⚙️ Processos e Operações Realizadas

O arquivo `hotelaria.sql` está dividido em duas etapas principais: **Consultas e Análises (DQL)** e **Evolução da Estrutura (DDL)**.

### 1. Consultas, Filtros e Ordenação (DQL)
* **Seleção e Filtros Específicos:** Uso de `SELECT` e `WHERE` com operadores relacionais e lógicos (`>=`, `<`, `=`, `AND`) para filtrar imóveis por estado (`AL`, `PB`), bairro (`centro`) e numeração.
* **Ordenação e Paginação:** Aplicação de `ORDER BY` (`ASC` e `DESC`) e `LIMIT` para ranquear resultados e limitar exibições.

### 2. Relacionamentos e Métricas de Negócio
* **Junção de Tabelas (`JOIN`):** Cruzamento de dados entre `proprietarios`, `hospedagens` e `enderecos` utilizando `INNER JOIN` para identificar imóveis ativos (`ativo = 1`) e inativos (`ativo = 0`).
* **Funções de Agregação e Datas:**
  * Cálculo de **ticket médio** por cliente usando `AVG(PRECO_TOTAL)` e `GROUP BY`.
  * Cálculo da **média de dias de estadia** combinando `AVG()` e `DATEDIFF(data_fim, data_inicio)`.
  * Contagem de hospedagens por proprietário com `COUNT()`.
  * Análise de **sazonalidade e demanda mensal** extraindo ano e mês com `YEAR()` e `MONTH()`.

### 3. Manutenção e Alteração de Estrutura (DDL)
Para atender a novas regras de negócio da plataforma, foram aplicadas modificações na arquitetura das tabelas utilizando `ALTER TABLE`:
* **Adição de Coluna:** Criação do campo `QNT_HOSPEDAGEM` na tabela `proprietarios` para controle da quantidade de imóveis por dono.
* **Renomeação de Tabela:** Alteração da tabela `alugueis` para `RESERVAS`, adequando a nomenclatura ao contexto do sistema.
* **Renomeação de Coluna:** Atualização da chave primária `ALUGUEL_ID` para `RESERVA_ID` na nova tabela `RESERVAS`.

---

## 🚀 Como Executar

1. Certifique-se de ter o **MySQL** instalado (via MySQL Workbench, XAMPP, DBeaver ou terminal).
2. Crie e selecione o banco de dados com as tabelas base (`enderecos`, `proprietarios`, `hospedagens`, `alugueis`).
3. Abra o arquivo `.sql` deste repositório no seu cliente SQL e execute os blocos de comandos de forma sequencial.

---

## 👨‍💻 Autor

* **Pedro** — Estudante de Desenvolvimento de Sistemas (CEEP Castaldi)
* **Orientação:** Prof. Lucas Camacho
