# 📊 Auri Flux

![Build Status](https://github.com/yanhermanny/auri-flux/actions/workflows/main.yml/badge.svg) ![License](https://img.shields.io/github/license/yanhermanny/auri-flux) ![Version](https://img.shields.io/github/v/tag/yanhermanny/auri-flux)

O **Auri Flux** é um sistema de gerenciamento financeiro pessoal e familiar, desenvolvido para simplificar o acompanhamento de despesas, organizar categorias e oferecer clareza sobre o fluxo de dinheiro do dia a dia.  
O nome vem do latim *“aurum”* (ouro) e *“fluxus”* (fluxo), simbolizando o **fluxo de valor** e a busca por equilíbrio financeiro.

> 🧪 Atualmente o projeto está na fase de desenvolvimento do MVP, com automação de build e deploy no ambiente *staging* via GitHub Actions.

---

## 📑 Sumário

* [🎯 Objetivo](#-objetivo)
* [🚀 Funcionalidades do MVP](#-funcionalidades-do-mvp)
* [🔮 Futuro do Projeto](#-futuro-do-projeto)
* [🧩 Tecnologias](#-tecnologias)
* [🏗️ Arquitetura e Estrutura](#️-arquitetura-e-estrutura)
* [🐳 Containerização com Docker](#-containerização-com-docker)
* [⚙️ Workflows CI/CD](#️-workflows-cicd)
* [🔄 Fluxo de Desenvolvimento](#-fluxo-de-desenvolvimento)
* [💻 Como rodar localmente](#-como-rodar-localmente)
* [🤝 Contribuições](#-contribuições)
* [📄 Licença](#-licença)

---

## 🎯 Objetivo

📌 O Auri Flux nasceu da necessidade de organizar finanças familiares de forma prática e centralizada.  
A proposta é oferecer uma ferramenta com **simplicidade de uso** e **robustez de dados**, permitindo controle claro sobre recursos financeiros e equilíbrio entre membros da família.

---

## 🚀 Funcionalidades do MVP

* Cadastro de **usuários** com autenticação segura.
* Gerenciamento de **contas** (carteira, cartões de crédito, etc.).
* Definição de **categorias** de despesas.
* Registro de **transações de despesas**, incluindo: valor, data, descrição, categoria e forma de pagamento.
* **Relatórios básicos**: listagem de despesas e totais por categoria/período.
* **Cálculo de dívidas e rateio entre membros da família**, para definir quanto cada pessoa deve à outra em compras compartilhadas.

---

## 🔮 Futuro do Projeto

* Registro de receitas.
* Controle de investimentos e patrimônio.
* Suporte a cashback.
* Relatórios fiscais (imposto de renda).
* Interface otimizada para celular.

---

## 🧩 Tecnologias

* **Backend:** Java 21 + Spring Boot + Maven  
* **Banco de Dados:** MySQL (com versionamento via Flyway)  
* **Containerização:** Docker + Docker Compose  
* **Frontend:** Thymeleaf + Bootstrap  
* **CI/CD:** GitHub Actions + GHCR  
* **Deploy:** Servidor Proxmox com containers Docker

---

## 🏗️ Arquitetura e Estrutura

O projeto é organizado em módulos principais:

```text
auri-flux/
├── src/
│   ├── main/java/...          # Código principal (API + lógica de negócio)
│   ├── main/resources/        # Configurações e templates
│   └── test/java/...          # Testes unitários e de integração
├── tools/
│   └── git-hooks/             # Hooks Git gerenciados pelo Husky e Commitlint
│       └── package.json       # Configuração de dependências JS (Husky, Commitlint, etc.)
├── docs/                      # Documentação complementar
├── compose.yaml               # Define containers para ambiente local ( MySQL + Adminer)
├── Dockerfile                 # Configuração Docker para construir a imagem da aplicação
└── pom.xml                    # Configuração Maven
```

---

## 🐳 Containerização com Docker

A aplicação é containerizada para simplificar o ambiente de desenvolvimento e garantir consistência entre as fases de *build*, *staging* e *produção*.

### 🔧 `Dockerfile`

O `Dockerfile` define como a imagem da aplicação é construída.
Ele realiza as etapas de:

1. Compilar o código com Maven (Java 21 + Maven 3.9.9).
2. Empacotar a aplicação (`.jar`) pronta para execução.
3. Criar um container otimizado e seguro baseado em **OpenJDK 21**.

Essa imagem é utilizada para *deploys* em staging e produção.

### 🧱 `compose.yaml`

O `compose.yaml` define os serviços necessários para rodar o projeto localmente:

* **MySQL 8.4.6 (LTS)** — banco de dados da aplicação.
* **Adminer 5.4.0** — interface web para inspeção do banco.

Ao executar `docker compose up -d`, ambos os serviços são iniciados em rede compartilhada.
Os dados permanecem disponíveis entre reinicializações e só são removidos caso o volume seja excluído manualmente.

---

## ⚙️ Workflows CI/CD

| Workflow             | Branch      | Evento    | Descrição                           |
| -------------------- | ----------- | --------- | ----------------------------------- |
| `ci-feature.yml`     | `feature/*` | push + PR | Build e testes unitários            |
| `cd-development.yml` | `dev`       | push      | Build, testes e deploy em *staging* |
| `cd-release.yml`     | `main`      | push      | GitHub release e deploy em produção |

---

## 🔄 Fluxo de Desenvolvimento

1. Crie uma branch a partir de `dev` com o padrão:

   ```text
   feature/<descrição-curta>-#<id-da-issue>
   ```
2. Faça commits seguindo o padrão **Conventional Commits**.
3. PRs para `dev` usam **Squash Merge**.  
   PRs de `dev` para `main` usam **Merge Commit**.
4. O título do PR deve incluir o número da issue, ex.:

   ```text
   feat(expense): adiciona endpoint de despesas (#42)
   ```

📘 Guia completo: [Git Conventions](docs/git-conventions.md)

---

## 💻 Como rodar localmente

### ✅ Pré-requisitos

* [Java 21](https://www.oracle.com/br/java/technologies/downloads/#java21)
* [Maven 3.9+](https://maven.apache.org/download.cgi)
* [Docker](https://docs.docker.com/get-docker/)
* [Docker Compose](https://docs.docker.com/compose/)

### ▶️ Passos

```bash
# Clone o repositório
git clone https://github.com/yanhermanny/auri-flux.git
cd auri-flux

# Suba os containers do banco de dados e Adminer
docker compose up -d

# Execute a aplicação
mvn spring-boot:run
```

Acesse:

* Aplicação: [http://localhost:8080](http://localhost:8080)
* Adminer: [http://localhost:8081](http://localhost:8081)

---

## 🤝 Contribuições

✨ Este projeto é inicialmente desenvolvido por **Yan Hermanny**. Futuras contribuições são bem-vindas, respeitando a licença GPLv3.

Para colaborar:

1. Abra uma *issue* descrevendo a melhoria ou correção.
2. Crie uma branch a partir de `dev` seguindo as [convenções Git](docs/git-conventions.md).
3. Faça commits padronizados e abra um *pull request*.
4. Aguarde a revisão e o build automatizado.

---

## 📄 Licença

Este projeto está licenciado sob a **GPLv3**.
Consulte o arquivo [LICENSE](LICENSE) para mais detalhes.
