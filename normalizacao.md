# Normalização do banco Estoque de uma Loja

## Primeira Forma Normal (1FN)

Todas as tabelas possuem uma chave primária para identificar cada registro. Cada campo guarda um único valor, sem listas ou grupos repetidos.

Por exemplo, cada produto ocupa uma linha na tabela produto e cada entrada ou saída ocupa uma linha na tabela movimentacao_estoque.

## Segunda Forma Normal (2FN)

As tabelas já estão na 1FN e possuem chaves primárias simples, formadas por apenas um campo. Assim, não existe dependência de apenas parte da chave.

As chaves são id nas tabelas categoria, fornecedor e produto, id_estoque em estoque e id_movimentacao em movimentacao_estoque.

## Terceira Forma Normal (3FN)

As tabelas estão na 2FN e os dados foram separados conforme o assunto, evitando dependências entre campos que não são chaves.

- categoria guarda o nome e a descrição da categoria.
- fornecedor guarda os dados de contato e identificação do fornecedor.
- produto guarda seus próprios dados e referencia categoria e fornecedor pelas chaves estrangeiras.
- estoque guarda a quantidade atual, a quantidade mínima e a localização do registro de estoque.
- movimentacao_estoque guarda o produto movimentado, o tipo, a quantidade e a data de cada entrada ou saída.

Por exemplo, o telefone do fornecedor fica somente em fornecedor, sem ser repetido em produto. Assim, quando o telefone muda, basta atualizar um cadastro.