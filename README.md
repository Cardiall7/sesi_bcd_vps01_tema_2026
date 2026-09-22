# Estoque de uma Loja

Atividade de banco de dados para cadastrar produtos, categorias e fornecedores, controlar o estoque e registrar entradas e saídas.

## Arquivos

- ddl.sql: criação do banco e das tabelas.
- dml.sql: inserção dos dados de teste.
- normalizacao.md: explicação da normalização até a 3FN.
- dicionario_dados.md: campos, tipos e restrições das tabelas.
- categoria.csv: dados das categorias.
- fornecedor.csv: dados dos fornecedores.
- produto.csv: dados dos produtos.
- estoque.csv: quantidades e localização dos produtos.
- movimentacao_estoque.csv: entradas e saídas dos produtos.
- MER/DER em PNG: diagrama do banco de dados.

## Como executar

1. Abra a conexão no MySQL Workbench.
2. Para criar o banco, abra e execute o ddl.sql.
3. Depois, abra e execute o dml.sql uma única vez, com as tabelas vazias.
4. Confira os registros nas cinco tabelas do banco estoque_loja.

O ddl.sql contém DROP DATABASE, que apaga o banco existente. Se as tabelas já estiverem criadas e vazias, execute somente o dml.sql.

## Dados de teste

Os CSVs possuem cabeçalho e usam vírgula como separador. Os dados são fictícios e iguais aos do dml.sql.

Cada tabela possui 3 registros, exceto movimentacao_estoque, que possui 6.

Considerando o estoque inicial zerado, os saldos são:

- Feijão: 50 entradas menos 5 saídas = 45 unidades.
- Detergente: 40 entradas menos 8 saídas = 32 unidades.
- Caderno: 30 entradas menos 3 saídas = 27 unidades.

Não é necessário importar os CSVs depois de executar o dml.sql, pois isso repetiria os dados.# sesi_bcd_vps01_tema_2026
