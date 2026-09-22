# Dicionário de Dados

Banco de dados: estoque_loja.

PK significa chave primária e FK significa chave estrangeira.
NOT NULL indica um campo obrigatório.

## categoria

| Campo | Tipo | Tamanho | Chave/restrição | Descrição |
| --- | --- | --- | --- | --- |
| id | INT | 4 bytes | PK, NOT NULL, AUTO_INCREMENT | Identificador da categoria |
| nome | VARCHAR | 50 caracteres | NOT NULL | Nome da categoria |
| descricao | VARCHAR | 200 caracteres | Permite NULL | Descrição da categoria |

## fornecedor

| Campo | Tipo | Tamanho | Chave/restrição | Descrição |
| --- | --- | --- | --- | --- |
| id | INT | 4 bytes | PK, NOT NULL, AUTO_INCREMENT | Identificador do fornecedor |
| razao_social | VARCHAR | 100 caracteres | NOT NULL | Razão social do fornecedor |
| nome_fantasia | VARCHAR | 100 caracteres | Permite NULL | Nome comercial do fornecedor |
| cnpj | VARCHAR | 20 caracteres | NOT NULL | CNPJ do fornecedor |
| telefone | VARCHAR | 20 caracteres | Permite NULL | Telefone de contato |
| email | VARCHAR | 100 caracteres | Permite NULL | E-mail de contato |
| endereco | VARCHAR | 150 caracteres | Permite NULL | Endereço do fornecedor |

## produto

| Campo | Tipo | Tamanho | Chave/restrição | Descrição |
| --- | --- | --- | --- | --- |
| id | INT | 4 bytes | PK, NOT NULL, AUTO_INCREMENT | Identificador do produto |
| nome | VARCHAR | 100 caracteres | NOT NULL | Nome do produto |
| descricao | VARCHAR | 200 caracteres | Permite NULL | Descrição do produto |
| preco | DECIMAL | 10 dígitos, sendo 2 decimais | NOT NULL | Preço unitário do produto |
| marca | VARCHAR | 50 caracteres | Permite NULL | Marca do produto |
| id_categoria | INT | 4 bytes | FK → categoria(id), NOT NULL | Categoria do produto |
| id_fornecedor | INT | 4 bytes | FK → fornecedor(id), NOT NULL | Fornecedor do produto |

## estoque

| Campo | Tipo | Tamanho | Chave/restrição | Descrição |
| --- | --- | --- | --- | --- |
| id_estoque | INT | 4 bytes | PK, NOT NULL, AUTO_INCREMENT | Identificador do registro de estoque |
| id_produto | INT | 4 bytes | FK → produto(id), NOT NULL | Produto armazenado |
| quantidade | INT | 4 bytes | NOT NULL | Quantidade atual em estoque |
| quantidade_minima | INT | 4 bytes | NOT NULL | Quantidade mínima desejada |
| localizacao | VARCHAR | 100 caracteres | Permite NULL | Local onde o produto está armazenado |

## movimentacao_estoque

| Campo | Tipo | Tamanho | Chave/restrição | Descrição |
| --- | --- | --- | --- | --- |
| id_movimentacao | INT | 4 bytes | PK, NOT NULL, AUTO_INCREMENT | Identificador da movimentação |
| id_produto | INT | 4 bytes | FK → produto(id), NOT NULL | Produto movimentado |
| tipo | ENUM | 1 byte | NOT NULL; ENTRADA ou SAIDA | Tipo de movimentação |
| quantidade | INT | 4 bytes | NOT NULL | Quantidade movimentada |
| data | DATETIME | Sem frações de segundo | NOT NULL | Data e hora da movimentação |