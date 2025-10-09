# 📊 Auri Flux

![Build Status](https://github.com/yanhermanny/auri-flux/actions/workflows/main.yml/badge.svg) ![License](https://img.shields.io/github/license/yanhermanny/auri-flux) ![Version](https://img.shields.io/github/v/tag/yanhermanny/auri-flux)

O **Auri Flux** é um sistema de gerenciamento financeiro pessoal e familiar, desenvolvido para simplificar o acompanhamento de despesas, organizar categorias e oferecer clareza sobre o fluxo de dinheiro do dia a dia.

O nome vem do latim *“aurum”* (ouro) e *“fluxus”* (fluxo), simbolizando o **fluxo de valor** e a busca por equilíbrio financeiro.

---

## 📑 Sumário

* [Funcionalidades do MVP](#funcionalidades-do-mvp)
* [Futuro do Projeto](#futuro-do-projeto)
* [Tecnologias](#tecnologias)
* [Objetivo](#objetivo)
* [Como rodar localmente](#como-rodar-localmente)
* [Licença](#licença)
* [Contribuições](#contribuições)

---

## Funcionalidades do MVP
* Cadastro de **usuários** com autenticação segura.
* Gerenciamento de **contas** (carteira, cartões de crédito, etc.).
* Definição de **categorias** de despesas.
* Registro de **transações de despesas**, incluindo: valor, data, descrição, categoria e forma de pagamento.
* **Relatórios básicos**: listagem de despesas e totais por categoria/período.
* **Cálculo de dívidas e rateio entre membros da família**, para definir quanto cada pessoa deve à outra em compras compartilhadas.

---

## Futuro do Projeto
* Registro de receitas.
* Controle de investimentos e patrimônio.
* Suporte a cashback.
* Relatórios fiscais (imposto de renda).
* Interface otimizada para celular.

---

## Tecnologias
* **Backend:** Java 21 + Spring Boot + Maven
* **Banco de Dados:** MySQL (com versionamento via Flyway)
* **Containerização:** Docker
* **Frontend:** Thymeleaf + Bootstrap
* **CI/CD:** GitHub Actions + Docker Compose + GHCR
* **Deploy:** Servidor Proxmox com containers Docker

---

## Objetivo
📌 O Auri Flux nasceu da necessidade de organizar finanças familiares de forma prática e centralizada. A ideia é oferecer uma ferramenta com **simplicidade de uso** e **robustez de dados**, permitindo controle claro sobre recursos financeiros e equilíbrio entre membros da família.

---

## Como rodar localmente

### ✅ Pré-requisitos
* [Java 21](https://www.oracle.com/br/java/technologies/downloads/#java21) instalado
* [Maven 3.9+](https://maven.apache.org/download.cgi) instalado
* [Docker](https://docs.docker.com/get-docker/) e [Docker Compose](https://docs.docker.com/compose/) instalados

### ▶️ Passos
1. Clone o repositório:
   ```bash
   git clone https://github.com/yanhermanny/auri-flux.git
   cd auri-flux
   ```

2. Suba os containers do banco de dados e adminer:
   ```bash
   docker-compose up -d
   ```

3. Rode a aplicação Spring Boot:
   ```bash
   mvn spring-boot:run
   ```

4. Acesse a aplicação no navegador:  
   👉 [http://localhost:8080](http://localhost:8080)

---

## Licença
📄 Este projeto está licenciado sob a **GPLv3**. Veja o arquivo [LICENSE](LICENSE) para detalhes.

---

## Contribuições
✨ Este projeto é inicialmente desenvolvido por **Yan Hermanny**. Futuras contribuições são bem-vindas, respeitando a licença GPLv3.
