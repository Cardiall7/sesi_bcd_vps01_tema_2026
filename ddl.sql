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

alter table produto add constraint pertence foreign key (id_categoria) references categoria(id);

alter table produto add constraint fornecido foreign key (id_fornecedor) references fornecedor(id);

alter table estoque add constraint possui foreign key (id_produto) references produto(id);

alter table movimentacao_estoque add constraint movimenta foreign key (id_produto) references produto(id);

show tables;

describe categoria;
describe fornecedor;
describe produto;
describe estoque;
describe movimentacao_estoque;