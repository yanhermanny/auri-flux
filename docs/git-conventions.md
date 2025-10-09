# 🧭 Convenções de Git, Commits e Ferramentas — Auri Flux

Este documento define as convenções padronizadas para **versionamento**, **commits**, **pull requests** e **ferramentas de automação** utilizadas no projeto **Auri Flux**.

---

## 📑 Índice

1. [🌿 Estrutura de Branches](#-estrutura-de-branches)
2. [💬 Padrão de Mensagens de Commit](#-padrão-de-mensagens-de-commit)
3. [🔀 Padrão de Pull Requests](#-padrão-de-pull-requests)
4. [⚙️ Padrões de Merge e Mensagens Resultantes](#️-padrões-de-merge-e-mensagens-resultantes)
5. [🛠️ Ferramentas e Estrutura de Diretórios](#️-ferramentas-e-estrutura-de-diretórios)
6. [⚙️ Passo a passo de uso das ferramentas](#️-passo-a-passo-de-uso-das-ferramentas)
7. [🧩 FAQ](#-faq)

---

## 🌿 Estrutura de Branches

O projeto utiliza um fluxo simples e eficiente baseado em **duas branches principais** e **branches temporárias de desenvolvimento**.

### Branches principais

| Branch | Descrição                                                       |
| ------ | --------------------------------------------------------------- |
| `main` | Código estável e pronto para produção.                          |
| `dev`  | Código em desenvolvimento (equivalente ao ambiente de staging). |

### Branches de trabalho

| Tipo        | Padrão de nome                             | Uso                                        |
| ----------- | ------------------------------------------ | ------------------------------------------ |
| **feature** | `feature/<descrição-curta>-#<id-da-issue>` | Desenvolvimento de novas funcionalidades.  |
| **fix**     | `fix/<descrição-curta>-#<id-da-issue>`     | Correção de bugs.                          |
| **chore**   | `chore/<descrição-curta>-#<id-da-issue>`   | Tarefas de manutenção ou ajustes técnicos. |

> 💡 **Exemplo:**
> `feature/expense-creation-#42`

Recomenda-se **sempre criar as branches a partir da `dev`**.

---

## 💬 Padrão de Mensagens de Commit

O projeto segue o padrão **Conventional Commits**, garantindo rastreabilidade e geração automatizada de changelogs.

### Estrutura

```text
<tipo>(<escopo>): <descrição curta>

[descrição detalhada opcional]

<rodapé - referência à issue>
```

### Detalhes de cada parte

| Parte                                | Descrição                                                     |
| ------------------------------------ | ------------------------------------------------------------- |
| **tipo**                             | Categoria do commit (ex: `feat`, `fix`, `chore`, etc).        |
| **escopo**                           | Parte do sistema afetada (ex: `user`, `expense`, `auth`).     |
| **descrição curta**                  | Resumo breve e direto da alteração (máx. ~70 caracteres).     |
| **descrição detalhada** *(opcional)* | Explicação mais completa do que foi feito e por quê.          |
| **rodapé**                           | Referência a issues usando palavras-chave (ex: `Closes #42`). |

### Tipos aceitos

| Tipo         | Uso                                   |
| ------------ | ------------------------------------- |
| **feat**     | Nova funcionalidade                   |
| **fix**      | Correção de bug                       |
| **chore**    | Tarefas de manutenção                 |
| **refactor** | Refatoração sem alterar comportamento |
| **docs**     | Alterações em documentação            |
| **test**     | Criação ou ajuste de testes           |

### Palavras-chave para vincular issues

| Palavra-chave  | Uso                           | Exemplo          |
| -------------- | ----------------------------- | ---------------- |
| **Closes**     | Fecha a issue automaticamente | `Closes #42`     |
| **Fixes**      | Fecha a issue automaticamente | `Fixes #17`      |
| **References** | Apenas referencia a issue     | `References #35` |
| **See**        | Apenas referencia a issue     | `See #21`        |

### Exemplo completo

```text
feat(expense): adiciona endpoint de criação de despesa

Adiciona o endpoint POST /expenses para registrar uma nova despesa com valor, data e categoria.
Inclui também validação de campos obrigatórios e tratamento de erros.

References #42
```

> 💡 **Regra prática:** todo commit deve conter **descrição curta** e **rodapé** (referência ao issue). A **descrição detalhada** é opcional, mas recomendada quando há lógica complexa ou múltiplas alterações.

---

## 🔀 Padrão de Pull Requests

### 1️⃣ PRs de *feature/fix/chore* → `dev`

Esses PRs representam a entrega de uma unidade de trabalho específica.

#### Título

```text
<tipo>(<escopo>): <descrição> (#<número do issue>)
```

Exemplo:

```text
feat(expense): implementa endpoint de criação de despesa (#42)
```

#### Descrição

```text
### Descrição
Explique brevemente o que foi implementado ou corrigido.

### Alterações principais
- Item 1
- Item 2

### Issue relacionada
Closes #<número do issue>
```

#### Tipo de merge recomendado

* **Squash merge**
  ✅ Garante que todos os commits da branch sejam condensados em **um único commit padronizado**.

---

### 2️⃣ PRs da `dev` → `main`

Esses PRs representam a **release** (conjunto de features testadas).

#### Título

```text
chore(release): merge development changes into main (#<número do issue>)
```

Exemplo:

```text
chore(release): merge development changes into main (#58)
```

#### Descrição

```text
### Descrição
Prepara o merge das alterações da branch `dev` para `main`, contendo as novas funcionalidades e correções.

### Alterações principais
- feat(expense): criação de despesas
- fix(auth): correção de token inválido
- docs(api): atualização de documentação

### Issue relacionada
Closes #<número do issue>
```

#### Tipo de merge recomendado

* **Merge commit (sem squash)**
  ✅ Preserva o histórico das features consolidadas na `dev`.

---

## ⚙️ Padrões de Merge e Mensagens Resultantes

| Origem → Destino    | Tipo de Merge    | Exemplo de Commit Resultante                                                                                                              | Descrição                                                     |
| ------------------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------- |
| `feature/*` → `dev` | **Squash Merge** | `feat(expense): implementa criação de despesas`<br><br>`Implementa o endpoint POST /expenses com validação e testes.`<br><br>`Closes #42` | Combina todos os commits da feature em um único commit limpo. |
| `dev` → `main`      | **Merge Commit** | `Merge pull request #58 from dev into main`<br><br>`chore(release): merge development changes into main`                                  | Mantém o histórico consolidado da release.                    |

> 💡 **Recomendação:** o texto da mensagem de squash deve seguir o mesmo padrão de commit convencional.

---

## 🛠️ Ferramentas e Estrutura de Diretórios

As ferramentas relacionadas à padronização de commits e hooks Git estão isoladas em um diretório próprio:

```text
/tools/git-hooks/
├── package.json              # Dependências do Husky e Commitlint
├── commitlint.config.js      # Regras de commit
└── .husky/                   # Hooks do Git
```

### Ferramentas utilizadas

| Ferramenta     | Função                                                                        |
| -------------- | ----------------------------------------------------------------------------- |
| **Husky**      | Executa scripts automáticos em hooks do Git (ex: validar mensagem de commit). |
| **Commitlint** | Verifica se a mensagem do commit segue o padrão definido.                     |

### Fluxo de funcionamento

1. O desenvolvedor faz um commit (`git commit -m ...`).
2. O **Husky** intercepta a mensagem através do hook `commit-msg`.
3. O **Commitlint** valida a mensagem conforme o padrão definido.
4. Caso a mensagem não siga o padrão, o commit é bloqueado.

---

## ⚙️ Passo a passo de uso das ferramentas

1. Navegue até o diretório de hooks:

   ```bash
   cd tools/git-hooks
   ```

2. Instale as dependências:

   ```bash
   npm install
   ```

3. Faça commits normalmente:

   ```bash
   git commit -m "feat(expense): adiciona endpoint de criação de despesa"
   ```

---

## 🧩 FAQ

**1. Preciso rodar algo antes de começar a commitar?**
Sim. Apenas o `npm install` dentro de `tools/git-hooks` para ativar as ferramentas.

**2. Onde devo criar minhas branches de trabalho?**
Sempre a partir da `dev`, com referência à issue:
`feature/<descrição-curta>-#<id-da-issue>`

**3. Posso fazer commits diretamente na `main`?**
Não. Toda modificação deve vir via PR partindo da `dev`.

**4. Qual merge usar para cada branch?**
* **Feature → Dev:** *Squash Merge*
* **Dev → Main:** *Merge Commit*

---

📘 **Resumo:**

* Branches principais: `main` e `dev`
* Branches temporárias: `feature/*-#id`, `fix/*-#id`, `chore/*-#id`
* Commits: padrão **Conventional Commits** (descrição curta + rodapé obrigatório)
* PR → dev : Squash merge, título `<tipo>(<escopo>): <descrição> (#id)`
* PR → main : Merge commit, título `chore(release): merge development changes into main (#id)`
* Ferramentas: **Husky** + **Commitlint** em `/tools/git-hooks/`
