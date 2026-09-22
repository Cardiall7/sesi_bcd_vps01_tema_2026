# Projeto: Estoque de uma Loja

## Relacionamentos e Cardinalidades

![Relacionamentos e Cardinalidades](https://github.com/Cardiall7/sesi_bcd_vps01_tema_2026/blob/main/relacionamentos-e-cardinalidades.png)

## MER - Conceitual

![MER Conceitual](https://github.com/Cardiall7/sesi_bcd_vps01_tema_2026/blob/main/MER_DER%20estoque-loja.png)

## DER - Conceitual

![DER Conceitual](https://github.com/Cardiall7/sesi_bcd_vps01_tema_2026/blob/main/DER%20Logico%20(2).png)


# Dicionário de Dados

| Entidade | Atributo | Tipo | Tamanho | Descrição |
|---|---|---|---|---|
| Categoria | id | Inteiro | 11 | Identificador, PK, Auto incrementável |
| Categoria | nome | Texto | 50 | Nome da categoria |
| Categoria | descricao | Texto | 200 | Descrição da categoria |
| Fornecedor | id | Inteiro | 11 | Identificador, PK, Auto incrementável |
| Fornecedor | razao_social | Texto | 100 | Razão social do fornecedor |
| Fornecedor | nome_fantasia | Texto | 100 | Nome fantasia do fornecedor |
| Fornecedor | cnpj | Texto | 20 | CNPJ do fornecedor |
| Fornecedor | telefone | Texto | 20 | Telefone do fornecedor |
| Fornecedor | email | Texto | 100 | Email do fornecedor |
| Fornecedor | endereco | Texto | 150 | Endereço do fornecedor |
| Produto | id | Inteiro | 11 | Identificador, PK, Auto incrementável |
| Produto | nome | Texto | 100 | Nome do produto |
| Produto | descricao | Texto | 200 | Descrição do produto |
| Produto | preco | Decimal | 10,2 | Preço do produto |
| Produto | marca | Texto | 50 | Marca do produto |
| Produto | id_categoria | Inteiro | 11 | FK referenciando Categoria |
| Produto | id_fornecedor | Inteiro | 11 | FK referenciando Fornecedor |
| Estoque | id_estoque | Inteiro | 11 | Identificador, PK, Auto incrementável |
| Estoque | id_produto | Inteiro | 11 | FK referenciando Produto |
| Estoque | quantidade | Inteiro | 11 | Quantidade disponível |
| Estoque | quantidade_minima | Inteiro | 11 | Quantidade mínima permitida |
| Estoque | localizacao | Texto | 100 | Local onde o produto está armazenado |
| Movimentação de Estoque | id_movimentacao | Inteiro | 11 | Identificador, PK, Auto incrementável |
| Movimentação de Estoque | id_produto | Inteiro | 11 | FK referenciando Produto |
| Movimentação de Estoque | tipo | Texto | - | Tipo da movimentação: ENTRADA ou SAIDA |
| Movimentação de Estoque | quantidade | Inteiro | 11 | Quantidade movimentada |
| Movimentação de Estoque | data | Datetime | - | Data da movimentação |

---

# Dados de teste em CSV

- [categoria.csv](categoria.CSV)
- [fornecedor.csv](fornecedor.CSV)
- [produto.csv](produto.CSV)
- [estoque.csv](estoque.CSV)
- [movimentacao_estoque.csv](movimentacao_estoque.CSV)

---

# Script SQL DDL

```sql
drop database if exists estoque_loja;

create database estoque_loja;

use estoque_loja;

create table categoria(
    id int primary key not null auto_increment,
    nome varchar(50) not null,
    descricao varchar(200)
);

create table fornecedor(
    id int primary key not null auto_increment,
    razao_social varchar(100) not null,
    nome_fantasia varchar(100),
    cnpj varchar(20) not null,
    telefone varchar(20),
    email varchar(100),
    endereco varchar(150)
);

create table produto(
    id int primary key not null auto_increment,
    nome varchar(100) not null,
    descricao varchar(200),
    preco decimal(10,2) not null,
    marca varchar(50),
    id_categoria int not null,
    id_fornecedor int not null
);

create table estoque(
    id_estoque int primary key not null auto_increment,
    id_produto int not null,
    quantidade int not null,
    quantidade_minima int not null,
    localizacao varchar(100)
);

create table movimentacao_estoque(
    id_movimentacao int primary key not null auto_increment,
    id_produto int not null,
    tipo enum('ENTRADA','SAIDA') not null,
    quantidade int not null,
    data datetime not null
);

alter table produto
add constraint pertence
foreign key (id_categoria)
references categoria(id);

alter table produto
add constraint fornece
foreign key (id_fornecedor)
references fornecedor(id);

alter table estoque
add constraint possui
foreign key (id_produto)
references produto(id);

alter table movimentacao_estoque
add constraint movimenta
foreign key (id_produto)
references produto(id);
```

---

# Script SQL DML

```sql
use estoque_loja;

insert into categoria(nome, descricao) values
('Camisetas','Camisetas masculinas e femininas'),
('Calcas','Calcas jeans e esportivas'),
('Jaquetas','Jaquetas e casacos');

insert into fornecedor(razao_social, nome_fantasia, cnpj, telefone, email, endereco) values
('Roupas Brasil LTDA','Roupas Brasil','12.345.678/0001-10','19 99999-1111','contato@roupasbrasil.com','Rua das Flores, 100'),
('Moda SP LTDA','Moda SP','23.456.789/0001-20','19 99999-2222','contato@modasp.com','Rua Central, 200'),
('Estilo Fashion LTDA','Estilo Fashion','34.567.890/0001-30','19 99999-3333','contato@estilofashion.com','Avenida Brasil, 300');

insert into produto(nome, descricao, preco, marca, id_categoria, id_fornecedor) values
('Camiseta Preta','Camiseta basica preta',59.90,'Urban',1,1),
('Calca Jeans','Calca jeans azul',129.90,'Denim',2,2),
('Jaqueta Masculina','Jaqueta masculina preta',199.90,'Fashion',3,3);

insert into estoque(id_produto, quantidade, quantidade_minima, localizacao) values
(1,30,5,'Prateleira A1'),
(2,20,5,'Prateleira B1'),
(3,15,3,'Prateleira C1');

insert into movimentacao_estoque(id_produto, tipo, quantidade, data) values
(1,'ENTRADA',30,'2026-09-20 10:00:00'),
(2,'ENTRADA',20,'2026-09-20 11:00:00'),
(3,'ENTRADA',15,'2026-09-20 12:00:00');

select * from categoria;
select * from fornecedor;
select * from produto;
select * from estoque;
select * from movimentacao_estoque;
```
