USE db_Ecommerce_ta99

CREATE TABLE ta9903.Cidades(
CidCodigo		smallint identity primary key,
Cidade			varchar(50) not null,
Estado			varchar(2)  not null,
Pais			varchar(35) not null
);

CREATE INDEX IX_Cidade on Cidades(Cidade);

SELECT * FROM Cidades;

EXEC SP_HELP Cidades;

--------------------------------------------------------------------------

CREATE TABLE ta9903.Editoras(
EdiCodigo		TINYINT IDENTITY PRIMARY KEY,
NomeEditora		VARCHAR(50) NOT NULL,
CNPJ			VARCHAR(18),
Logradouro		VARCHAR(35),
Numero			VARCHAR(5),
Complemento		VARCHAR(15),
Cep				VARCHAR(9),
Cidade			SMALLINT,
Telefone		VARCHAR(20),

CONSTRAINT FK_EdiCidade foreign key(Cidade) references Cidades(CidCodigo))

CREATE INDEX IX_EdiRazao ON Editoras(NomeEditora)

EXEC sp_help Editoras

-------------------------------------------------------------------------------------

CREATE TABLE ta9903.Categorias(
CatCodigo	TINYINT IDENTITY PRIMARY KEY,
Categoria	VARCHAR(25) NOT NULL
);

CREATE INDEX IX_Categoria ON ta9903.Categorias(Categoria);

-----------------------------------------------------------

CREATE TABLE Idiomas(
IdiCodigo	TINYINT IDENTITY PRIMARY KEY,
IDIOMA		VARCHAR(25) NOT NULL,
);

CREATE INDEX IX_Idiomas on ta9903.Idiomas(Idioma);

-----------------------------------------------------------

SELECT * FROM Categorias;
EXEC sp_help Categorias;

SELECT * FROM Idiomas;
EXEC sp_help Idiomas;

-----------------------------------------------------------------------------------------

create table Associados(
AssCodigo		smallint identity,
NomeCompleto	varchar(35) not null,
DataNasc		date,
Telefone		varchar(20),
Email			varchar(30),
CPF			varchar(15) not null,
Logradouro		varchar(35),
Numero			varchar(5),
Complemento		varchar(15),
Cep				varchar(9),
Cidade			smallint,

constraint PK_Associado primary key(AssCodigo),
constraint CK_AssNasc check(DataNasc<getdate()),
constraint	UQ_AssCPF unique(CPF))

create index IX_AssNome on Associados(NomeCompleto)

exec sp_help Associados

alter table Associados add constraint FK_AssCidade 
					foreign key(Cidade) references Cidades(CidCodigo)


---------------------------------------------
create table Livros
	(LivCodigo				int identity primary key,
	Titulo					varchar(60),
	NomeAutor				varchar(30),
	Categoria				tinyint,
	Idioma					tinyint,
	QtPag					smallint,
	NomeEditora				tinyint,
	QtLivros				int,
	ISBN					varchar(30),
constraint 	FK_LivCategoria foreign key (Categoria)		references Categorias(CatCodigo),
constraint 	FK_LivIdioma foreign key	(Idioma)		references Idiomas(IdiCodigo),
constraint 	FK_LivEditora foreign key	(NomeEditora)	references Editoras(EdiCodigo),
constraint 	CK_QtPag	check(QtPag>0),
constraint 	CK_QtLivros check(Qtlivros>=0))
create unique index IX_LivTitulo	on Livros(Titulo)
create unique index IX_LivAutor		on Livros(NomeAutor)

---------------------------------------------
create table Emprestimos
	(EmpCodigo									int identity primary key,
	DataEmprestimo					Date default getdate(),
	NomeCompleto						smallint,
	Titulo				 									int,
constraint 	CK_EmpData check(DataEmprestimo<=getdate()),
constraint 	FK_EmpLivro foreign key (Titulo) references Livros(LivCodigo),
constraint 	FK_EmpAss foreign key (NomeCompleto) references Associados(AssCodigo))
___________________________________________________________________________________________________________________
--AULA 29/08/2024

SELECT @@SERVICENAME --Mostra o nome do Serviço
SELECT @@SERVERNAME --Mostra o nome do Servidor Gerado na Maquina
SELECT DB_NAME() --Mostra o nome do DB que está usando
SELECT * FROM SYS.TABLES --Mostra todas as tabelas que se tem no DB

---------------------------------------------
-- Inclusão de registros / Inserindo valores nas tabelas

insert into Cidades values('São Paulo','SP','Brasil') -- Posicional
select * from Cidades
insert into Cidades (Estado,Pais,Cidade) values('SC','Brasil','Florianopolis') --Declarativo
insert into Cidades (Pais,Cidade,Estado) values('Brasil','Porto Alegre','RS') --Declarativo
--
select * from Cidades
--------------------------------------------

insert into Categorias values
('Misterio'),('Romance'),('Ficcao Cientifica')
-- Para verificação
select * from Categorias

-------------------------------------------
insert into Idiomas values
('Mandarim'),
('Portugues'),
('Espanhol')

select * from Idiomas

------------------------------------------
insert into Associados values
('Natalino','1988.12.25','2212345678','natalino@impacta.com.br','456.123.789-11','Av Paulista','1009', '15a S-38','00000-123',1),
('Antonio','1980.10.10','1112345678','antonio@impacta.com.br','123.456.789-12','Av Paulista','1009', '17a S-10','00000-123',3),
('Janaino','2000.01.01','3312345678','janaino@impacta.com.br','789.222.456-49','Av Paulista','1009', '4a S-50','00000-123',3)

select * from Associados

----------------------------------------
insert into Editoras values
('Melhor Livro','123.456.777-88','Rua Consolacao','100',null,'00000-777',3,'1177778888'),
('Aprenda Lendo','222.333.444-55','Rua Pamplona','135',null,'01293-555',1,'1122223333'),
('Conhecimento','555.666.777-55','Rua Itapeva','1245','11a Cj12','09874-555',1,'1185856363')

select * from Editoras

---------------------------------------
insert into Livros values
('Amanhecendo de Noite','Florisvaldo Albuquerque',2,1,120,2,2,'85-85961-60-0'),
('Passagem para Andromeda','Estefano Rei',3,2,300,3,3,'67-45123-70-1'),
('O Passo Alagado','Hercules Poirot',1,3,400,1,1,'12-12333-12-9')

select * from Livros
select * from Editoras
-------------------------------------

insert into Emprestimos values 
('2018.04.01',2,3),
('2018.04.02',2,5),
('2018.04.03',3,4),
('2019.05.13',1,5),
('2017.05.13',1,3)

-- Verificacao
select * from Cidades
select * from Idiomas
select * from Categorias
select * from Editoras
select * from Livros
select * from Associados
select * from Emprestimos

------------------------------------------

use db_Ecommerce_ta99
select * from sys.tables;
select DB_NAME()


select * from TB_CARGO
select * from TB_CLIENTE
select * from TB_COR
select * from TB_DEPARTAMENTO
select * from TB_DEPENDENTE
select * from TB_EMPREGADO
select * from TB_ENDERECO
select * from TB_FORNECEDOR
select * from TB_ITENSPEDIDO
select * from TB_PEDIDO
select * from TB_PRODUTO
select * from TB_PRODUTO_FORNECEDOR
select * from TB_TIPOPRODUTO
select * from TB_UNIDADE

-----------------------------
select * from TB_ENDERECO;
select Nome,Salario from tb_empregado

select Nome,Salario,id_departamento from tb_empregado
where id_departamento = 4

------------------------------
--Listar os registros não pertencentes aos departamentos 4,6,8
select * from tb_empregado where id_empregado  <> 4 and id_departamento <> 6 and id_departamento <>8
--- OU
select * from tb_empregado where id_empregado not in (4,6,8)

--Pertencem aos depto listados
select * from tb_empregado where id_empregado in (4,6,8)
order by id_departamento

---------------------------

--Lista registros com campos null
select Nome,Foto from tb_empregado where Foto is not null

select * from tb_endereco where estado='MG' and endereco is not null 
order by id_cliente 

select * from tb_endereco where Estado='MG' and endereco is null 
order by id_cliente

select Nome,Salario from tb_empregado 
where Salario<=1000 order by Salario asc, nome asc

select Nome,Salario from tb_empregado 
where Salario>=1000 and Salario<=2000 
order by Salario asc, Nome asc

select Nome,Salario from tb_empregado 
where Salario>=2000 
order by SALARIO asc, nome asc

-----------------------------------------

--Between -> Significa entre dois valores determinados
select nome, data_admissao from tb_empregado 
where data_admissao between '2015.01.01' and '2015.12.31'

select Nome, Salario from tb_empregado
where Salario between 900 and 1200;

----------------------------------------

-- Textos
-- O símbolo percentual (%) aceita qualquer caracter e generaliza a quantidade de caracteres
-- O símbolo sublinhado (underline)(_) aceita apenas um caracter por símbolo
select * from tb_empregado -- Todos os registros
select * from tb_empregado where nome='maria aparecida' -- Nome completo e grafia correta
select * from tb_empregado where Nome like 'Maria%'	-- Começa por Maria
select * from tb_empregado where Nome like '%Maria'	-- Termina por Maria
select * from tb_empregado where Nome like '%Maria%' -- Tem Maria no nome
select * from tb_empregado where Nome like '% Maria %'	-- Tem Maria  no nome

----------------------------------------

select * from tb_empregado where Nome like '%jo%'	-- Tem jo  no nome
select * from tb_empregado where Nome like '%q%'	--Tem q no nome
select * from tb_empregado where Nome like '%lui[sz]%'         -- Grafia com s ou Z
select * from tb_empregado where Nome like '_a%'                -- Segunda lera do nome é A
select * from tb_empregado where Nome like '[a-e]%' order by Nome -- Todos começando por A,B,C,D,E
select * from tb_Empregado where  nome like '[a,c,g]%' ----------------- Todos começando por A, C, G

--DISTINCT
select Salario from tb_empregado
select distinct Salario from tb_empregado -- O Comando distinct retorna os valores sem repetidos

select id_departamento, Salario from tb_empregado order by id_departamento, salario

select distinct id_departamento, Salario from tb_empregado order by id_departamento, salario

-----------------------------------------
-- TOP
/* Top: Especifica que somente o primeiro conjunto de linhas será retornado do
     resultado da consulta. O conjunto de linhas pode ser um número ou uma 
     porcentagem das linhas.*/

select * from tb_empregado
--
select count(*) from tb_empregado -- Contagem de registros
select top 5 * from tb_empregado  -- Os 5 primeiros digitados
select top 5 * from tb_empregado order by Nome asc -- Os 5 primeiros LISTADOS
select top 5 * from tb_empregado order by Salario desc  -- Os 5 primeiros LISTADOS
select top 5 percent * from tb_empregado order by Salario desc -- Cinco por cento da  totalidade de registros (arredonda para mais)

-- Calcula o percent
select 71*0.5 -- metade
select 71*0.05 -- porcentagem

-------------------------------------------------------
--DATAS
select getdate()
select sysdatetime() -- Retorna data, hora, minutos e milésimos
select year(getdate()) -- Retorna ano
select month(getdate()) -- Retorna mês
select day(getdate()) -- Retorna o dia

-------------------------------------------------------
select * from tb_empregado order by data_admissao
select * from tb_empregado where data_admissao >='2019.01.01' order by data_admissao 

select * from tb_empregado 
	where data_admissao >='2011.07.03' and data_admissao <='2011.07.29'

select * from tb_empregado 
	where data_admissao between '2011.07.03' and '2011.07.29'


select Nome,Data_Admissao from tb_empregado where year(Data_Admissao) ='2011'

-- Listar os empregados admitidos em 2011 nos meses 2,3,4,5,6,7
select * from tb_empregado 
	where year(data_admissao)= 2011 and month(data_admissao) between 2 and 7
	
-------------------------------------------------------------
--1 Listar o ano e o mês de nascimento dos empregados
select Nome, year(Data_nascimento) AS ANO, month(Data_nascimento) AS MES from tb_empregado

--2 Listar o nome e a data de nascimento dos aniversariantes do mês (atual)
select Nome,Data_nascimento from tb_empregado where month(Data_nascimento) = '09' -- Errado pois no mês seguinte não irá funcionar
select Nome,Data_nascimento from tb_empregado where month(Data_nascimento) = Month(getdate())

--3 Listar o nome e data de nascimento dos aniversariantes no dia de hoje
select Nome AS FUNCIONARIO,Data_nascimento from tb_empregado where month(Data_nascimento) = month(getdate()) and 
day(Data_nascimento) = Day(getdate())
select Nome, data_nascimento from tb_empregado where month(data_nascimento) = '09' and day(data_nascimento) = '03' 

--4 Listar quem faz aniversário na terça-feira (não importa a data)
select Nome, Data_nascimento from tb_empregado 
where datepart(weekday,data_nascimento)=datepart(weekday,getdate())

select Nome, Data_nascimento from tb_empregado 
where datepart(weekday,data_nascimento)=datepart(weekday,getdate())


-- Retorna quem faz aniversario no dia especificado. 
select Nome, Data_nascimento from tb_empregado 
where DATEPART(weekday, Data_nascimento) = 1;

select datepart(weekday,getdate())

----------------------------------------------------------------------------------------------------
-- 3.5) CÁLCULOS
select 2/3       ------------ Número inteiros, resultado inteiro
select 2.0/3.0   ------------ Números com decimais, resultado com decimais

select 
	4-9+7/8*4 as Inteiro,
	4.0-9.0+7.0/8.0*4.0 as Decimal,
	(4.0-9.0)+7.0/(8.0*4.0) as Parenteses,
	sqrt(67) as RaizQuadrada,
	square(16) as ElevadoQuadrado,
	power(16,4) as Potencia

-- Criar uma consulta que apresente o nome do funcionário, 
-- salário atual e uma coluna calculada com 10% de aumento sobre o salário. 
select Nome,Salario,Salario*1.1 as [Simulação] from tb_empregado
select sum(Salario) as ValoresAtuais from tb_empregado
select sum(Salario*1.1) as ValoresComAumento from tb_empregado

-- Criar uma consulta que apresente o nome do produto, o preço de venda 
-- atual e uma coluna calculada com um desconto de 25%
select descricao, preco_venda, preco_venda *0.75 from tb_produto
select descricao, preco_venda, preco_venda - preco_venda *0.25 from tb_produto

-- Calcular a data de aposentadoria (35 anos após a admissão)
select * from tb_empregado
select Nome, data_admissao, 
year(data_admissao) +35 as [Ano da Aposentadoria] from tb_empregado

--------------------------------------------------------
-- Fazer uma listagem com nome do produto, o preço atual e uma coluna calculada com o preço descontado em 10%
-- Retornar tabela com nomes -> Preço promocional, preço atual
SELECT * FROM TB_PRODUTO
SELECT DESCRICAO AS NOME_DO_PRODUTO, PRECO_VENDA AS PREÇO_ATUAL, 
PRECO_VENDA * 0.90 AS PRECO_PROMOCIOAL FROM TB_PRODUTO ORDER BY DESCRICAO

--05/09/2024


-- 04 - Associando Tabelas
-----------------------------------------------------------------
/* Tipos de associações
	Join		= União, junção
	Inner join	= Correspondência únivoca, serão listados APENAS os dados estão nas duas tabelas
	Left join	= TODOS os registros da tabela A (nome que estiver a esquerda de 'left join') e suas correspondências em B (quando existirem)
	Right join	= TODOS os registros da tabela B (nome que estiver a direita de 'right join') e suas correspondências em A (quando existirem)
	Full join	= TODAS as linhas de AMBAS as tabelas (parecido Union)
	Cross join	= Listagem contendo para CADA REGISTRO de A, TODOS os registros de B (Produto cartesiano)
	Self join	= Listar linhas da MESMA TABELA com diferentes campos
	Union		= Listagem com campos de VÁRIAS TABELAS, porém SEM obrigatoriedade de PK e FK
*/

--Listar o nome do empregado, o número do pedido e a data da emissão

select nome, id_pedido, data_emissao
from tb_empregado inner join tb_pedido on tb_empregado.id_empregado=tb_pedido.id_empregado;
--
select tb_empregado.*, tb_pedido.*
from tb_empregado inner join tb_pedido on tb_empregado.id_empregado=tb_pedido.id_empregado;

-- Listar o nome do empregado e o nome de seus dependentes
select 
	tb_empregado.nome as Empregado, 
	tb_dependente.nome as Dependente
from tb_empregado inner join TB_DEPENDENTE
on tb_empregado.id_empregado=tb_dependente.id_empregado
order by 1,2

-- Listar o nome do empregado e o nome do departamento
select * from TB_EMPREGADO 
select * from TB_DEPARTAMENTO

select Nome, Departamento
from tb_empregado inner join tb_departamento on
tb_empregado.id_departamento=tb_departamento.id_departamento

exec sp_help tb_empregado
exec sp_help tb_departamento

--05/09/2024
-- Fazer uma listagem com nome do produto, o preço atual e uma coluna calculada com o preço descontado em 10%
-- Retornar tabela com nomes -> Preço promocional, preço atual

SELECT DESCRICAO AS NOME_DO_PRODUTO, PRECO_VENDA AS PREÇO_ATUAL, 
PRECO_VENDA * 0.90 AS PRECO_PROMOCIOAL FROM TB_PRODUTO ORDER BY DESCRICAO

-- 04 - Associando Tabelas
-----------------------------------------------------------------
/* Tipos de associações
	Join		= União, junção
	Inner join	= Correspondência únivoca, serão listados APENAS os dados estão nas duas tabelas
	Left join	= TODOS os registros da tabela A (nome que estiver a esquerda de 'left join') e suas correspondências em B (quando existirem)
	Right join	= TODOS os registros da tabela B (nome que estiver a direita de 'right join') e suas correspondências em A (quando existirem)
	Full join	= TODAS as linhas de AMBAS as tabelas (parecido Union)
	Cross join	= Listagem contendo para CADA REGISTRO de A, TODOS os registros de B (Produto cartesiano)
	Self join	= Listar linhas da MESMA TABELA com diferentes campos
	Union		= Listagem com campos de VÁRIAS TABELAS, porém SEM obrigatoriedade de PK e FK
*/

--Listar o nome do empregado, o número do pedido e a data da emissão

select nome, id_pedido, data_emissao
from tb_empregado inner join tb_pedido on tb_empregado.id_empregado=tb_pedido.id_empregado;
--
select tb_empregado.*, tb_pedido.*
from tb_empregado inner join tb_pedido on tb_empregado.id_empregado=tb_pedido.id_empregado;

-- Listar o nome do empregado e o nome de seus dependentes
select 
	tb_empregado.nome as Empregado, 
	tb_dependente.nome as Dependente
from tb_empregado inner join TB_DEPENDENTE
on tb_empregado.id_empregado=tb_dependente.id_empregado
order by 1,2

-- Listar o nome do empregado e o nome do departamento
select * from TB_EMPREGADO 
select * from TB_DEPARTAMENTO

select Nome, Departamento
from tb_empregado inner join tb_departamento on
tb_empregado.id_departamento=tb_departamento.id_departamento

exec sp_help tb_empregado
exec sp_help tb_departamento

--Listar o nome da empresa e o codigo de pedido dessa empresa
select * from tb_pedido
select * from tb_cliente
select * from tb_endereco

select nome AS EMPRESA, id_pedido AS CODIGO_DE_PEDIDO
from tb_cliente inner join tb_pedido on
tb_cliente.id_cliente=tb_pedido.id_cliente

exec sp_help tb_cliente

--Listar os nomes das cidades e os pedidos para essas cidades
select Nome, Cidade, id_pedido as Pedidos_Cidade
from tb_endereco 
inner join tb_cliente on tb_endereco.id_cliente=tb_cliente.id_cliente
inner join tb_pedido on tb_cliente.id_cliente=tb_pedido.id_cliente
where cidade  is not null and cidade <>''
order by cidade

-- <>'' este comando não retona os campos vazios



--Listar os nome da cidade do cliente e os pedidos desse cliente

--Listar os empregados que não tem dependentes
select tb_empregado.nome, tb_dependente.nome
from tb_empregado 
left join tb_dependente on 
tb_empregado.id_empregado=tb_dependente.id_empregado
where tb_dependente.nome is null

--Listar os empregados e departamento e quem não está alocado.
select * from tb_departamento

select tb_empregado.nome as EMPREGADOS, tb_departamento.departamento as NAO_ALOCADO
from tb_empregado
left join tb_departamento on
tb_empregado.id_departamento=tb_departamento.id_departamento
where tb_departamento.departamento is null

select * from tb_departamento where departamento is null

--Calcular o faturamento da empresa no ano de 2017
-- Funções de agregação
select sum(vlr_total) from tb_pedido where year(data_emissao)=2017
select avg(vlr_total) from tb_pedido where year(data_emissao)=2017
select max(vlr_total) from tb_pedido where year(data_emissao)=2017
select min(vlr_total) from tb_pedido where year(data_emissao)=2017 and vlr_total > 0
select count(vlr_total) from tb_pedido where year(data_emissao)=2017

select 
	sum(vlr_total)	AS FATURAMENTO,
	avg(vlr_total)	AS MediaGeral,
	max(vlr_total)	AS MaiorValor,
	min(vlr_total)	AS MenorValor,
	count(vlr_total)AS Contagem
from tb_pedido where vlr_total>0
group by year(data_emissao)

-----------------------------------------------------------------------------------------------------------------
--10/09/2024
------------------------------------------------------------------------------------
-- LEFT JOIN (p124)
-- A cláusula LEFT JOIN ou LEFT OUTER JOIN permite obter todos os dados 
-- da tabela à esquerda e os relacionados da tabela da direita
-- Caso não exista um valor relacionados na direita o campo será preenchido com NULL
-- Listar todos os empregados tenham ou não dependentes 
-- mas se tiverem, os nomes dos dependentes
select 
		tb_empregado.nome as Empregado,
		tb_dependente.nome as Dependente
from tb_empregado LEFT JOIN tb_dependente 
on tb_empregado.id_empregado=tb_dependente.id_empregado

-- Listar todos os empregados não tenham dependentes
select 
		tb_empregado.nome as Empregado,
		tb_dependente.nome as Dependente
from tb_empregado	LEFT JOIN tb_dependente 
on tb_empregado.id_empregado=tb_dependente.id_empregado
where tb_dependente.nome is null

-------------------------------------------------------------------------------------
-- RIGHT JOIN (p124)
-- A cláusula RIGHT JOIN ou RIGHT OUTER JOIN permite obter todos os dados 
-- da tabela à esquerda e os relacionados da tabela da direita
-- Caso não exista um valor relacionados na direita o campo será preenchido com NULL

select 
	departamento, 
	nome
from tb_empregado right join tb_departamento 
on tb_empregado.id_departamento=tb_departamento.id_departamento
order by 1,2

-------------------------------------------------------------------------
-- FULL JOIN (p125)
-- A cláusula FULL JOIN ou FULL OUTER JOIN retornam todas as linhas da tabela
-- à esquerda de JOIN e da tabela à direita (como no inner). Quando não houver correspondência 
-- em qualquer uma das tabelas o campo será prenchido com NULL.
-- Apresenta o resultado de um left join + right join

select 
	departamento,
	nome
from tb_departamento full join tb_empregado 
on tb_departamento.id_departamento=tb_empregado.id_departamento

-----------------------------------------------------------------------------------------
-- CROSS JOIN  (p125)
-- Todos os dados da tabela à esquerda de JOIN são cruzados com os dados da tabela
-- à direita de JOIN, ao utilizarmos CROSS JOIN. As possíveis combinações de linhas
-- em todas as tabelas são conhecidas como produto cartesiano. O tamanho do produto
-- cartesiano será definido pelo número de linhas na primeira tabela multiplicado pelo
-- número de linhas na segunda tabela. É possível cruzar informações de duas ou mais tabelas
create table #ViagensTuristicas 
(Destino char(2))
--
insert into #ViagensTuristicas values
('D1'),('D2'),('D3'),('D4'),('D5'),('D6')
--
select * from #ViagensTuristicas

------------------
create table #Conforto
(Nivel varchar(15))
--
insert into #conforto values
('Simples'),('MaisOuMenos'),('Luxo'),('SuperLuxo')
--
select * from #Conforto

-----------------------
select 
	destino,
	nivel 
from #conforto cross join #viagensturisticas
order by 1,2

----------------------------------------------------------------------------------------
--SELF JOIN (p123)
-- Uma self join (autojunção) é simplesmente a união (join) de uma tabela com ela mesma. 
-- Não há palavra-chave SELF JOIN, -- apenas é escrita ma junção comum onde ambas as tabelas 
-- envolvidas na junção são a mesma tabela. 
-- Necessário usar um alias para cada utilização da tabela, 
-- caso contrário, o nome da tabela seria ambíguo.
-- É útil quando você deseja correlacionar pares de linhas da mesma tabela, por exemplo, 
-- um relacionamento hierarquico.

-- Exemplo 1
create table #Funcionarios 
(id int identity primary key, 
nome varchar(50),
id_supervisor int) 

insert into #Funcionarios values
('Pedro Henrique',6),
('Lucas da Silva',6),
('Luana Gabriela',	7),
('Renato Lazuna',	6),
('Rafaela Barrosa',7),
('Arline da Costa',9),
('Giseli Pascoa',9),
('Renan Pereira',6),
('D. Pedro',Null)

select * from #Funcionarios

select
	f1.nome as Supervisor,
	f2.nome as Funcionario
from
	#funcionarios f1 inner join #funcionarios f2
	on f1.id = f2.id_supervisor
order by   f1.id

----------------------------------------------------------------------------------------
/*
-- UNION
-- Lista colunas de tabelas que não precisam estar vinculadas
-- Mesma quantidade de colunas
-- São possíveis restrições individuais
-- Apenas um comando de ordenação

O operador UNION elimina as linhas duplicadas. O SQL Server executa cada um dos SELECTs da query, 
reúne todos os resultados e então executa um SELECT DISTINCT, mesmo que não haja registros duplicados.  

O operador UNION ALL tem a mesma funcionalidade do UNION, porém, não executa o SELECT DISTINCT 
no result set final e apresenta todas as linhas, inclusive as linhas duplicadas

O operador UNION ALL mantém as linhas duplicadas. Ou seja, o SQL Server executa cada um 
dos SELECTs da query, reúne todos os resultados e então os exibe. 
*/

-- a)
select nome, fone1 from tb_cliente
union 
select nome, fone1 from tb_fornecedor

-- b)
select nome, fone1 from tb_cliente  Where nome like 'A_%'
union 
select nome, fone1 from tb_fornecedor  Where nome like 'B_%' 

-- c)
select nome, fone1,'Cliente' as Tipo from tb_cliente  Where nome like 'A_%'
union 
select nome, fone1,'Fornecedor' as Tipo from tb_fornecedor  Where nome like 'B_%'   order by 2


-- Union All
-- Lista também as possíveis repetições no campo ou na 
-- concatenação dos campos declarado(s)

select id_empregado,'Pedido' from tb_pedido
union
select id_empregado,'Empregado' from tb_empregado order by 1

select id_empregado, 'Pedido' from tb_pedido
union all
select id_empregado,'Empregado' from tb_empregado

/* Uma consulta aninhada em uma instrução SELECT, INSERT, DELETE ou UPDATE é
chamada de subquery (subconsulta) ou consulta interna. Isso ocorre quando usamos 
um SELECT dentro de outro SELECT ou INSERT ou UPDATE ou DELETE

O primeiro select é chamado de query ou consulta externa, os demais de 
subquery ou consultas internas. O primeiro select é ligado com o segundo 
pelos operadores:
	IN, NOT IN, >,>=,<,<=,<>, EXISTS, NOT EXISTS, ALL, SOME/ANY
*/

--1) Listar os produtos com preco_custo acima da média
select * from tb_produto
select avg(preco_custo) from tb_produto --  1.724975
select * from tb_produto where preco_custo >1.724975

select * from tb_produto where preco_custo > (select avg(preco_custo) from tb_produto)

-- 2) Listar os nomes dos empregados que tem um cargo começando pela letra C
select nome,id_cargo from tb_empregado 
where id_cargo in (select id_cargo from tb_cargo where cargo like 'C%')
order by 1

------------------------------------------------------------------
-- Exists / Not Exists
-- In / Not In

-- IN e Not in são utilizados para compor um filtro (where) da consulta

-- Exists e Not Exists é utilizado para verificar se a listagem resultou em um conjunto vazio
-- Exists é True (verdadeiro) se a consulta utilizada retornar 
-- pelo menos uma linha de registros. Não é equivalente a in/not in

-- Preparação
create table #CopiaTeste(A int)
select * from #CopiaTeste
if not exists (select * from #CopiaTeste) drop table #CopiaTeste

create table #CopiaTeste(A int)
insert into #copiateste values (6)
select * from #CopiaTeste
if not exists (select * from #CopiaTeste) drop table #CopiaTeste

--------------------------------------------------------------------

-- Funções
		Funções de agregação  = Calculam resultados sobre um grupo de registros que é pode ser a tabela completa ou subconjuntos, agrupados segundo um determinado critério
		Funções escalares = Calculam resultados para cada registro da tabela
		Funções de usuário= Podem ser das duas maneiras e utilizam o comando 'return' 	 (devolver, retornar, produzir, identificar)
3
-- Mais utilizadas
-- AVG ........ Média aritmética
-- COUNT ... Contagem de registros 
-- MIN ........ Menor valor
-- MAX ....... Maior valor
-- SUM ....... Soma dos valores

-- Todas
-- AVG, CHECKSUM_AGG, COUNT, COUNT_BIG, GROUPING, GROUPING_ID, 
-- MAX, MIN, STDEV, STDEVP, SUM, VAR, VARP

-- GROUP BY
	Calcula subtotais por agrupamento. Para cada  subagrupamento, podendo 
	agrupar por um ou mais critérios. Utiliza as funções de agregação, 
	como sum, count, max, min, avg, desvpad e outras

-- Utilizando HAVING ............. Filtra as informações baseado nos resultados do agrupamento. Idem 'group by', aplicando restrições na coluna que é critério para o 'group by', 											filtrando o que é mostrado.



--------------------------------------------------------------------------------------------
-- Exemplos
select sum(vlr_total) from tb_pedido

-- a) Funções de agregação aplicadas a base por inteiro, SEM FILTROS
select
	sum([vlr_total]) as total,
	avg([vlr_total]) as média,
	max([vlr_total]) as [maior pedido],
	min([vlr_total]) as [menor pedido], 
	count([id_pedido]) as [nº de pedidos]
from Tb_Pedido
where Vlr_Total<>0

-- b) Filtrando apenas o ano de 2018
select
	sum([vlr_total]) as total,
	avg([vlr_total]) as média,
	count([id_pedido]) as [nº de pedidos],
	max([vlr_total]) as [maior pedido],
	min([vlr_total]) as [menor pedido]
from Tb_Pedido 
where Vlr_Total<>0 and data_emissao between '2018.01.01' and '2018.12.31'

-- c) Para todos os anos da base
select
	year(data_emissao) as [Ano],
	sum(vlr_total) as 'Total',
	avg([vlr_total]) as Média,
	count('id_pedido') as 'Nº de pedidos',
	max([vlr_total]) as [Maior pedido],
	min([vlr_total]) as [Menor pedido]
from Tb_Pedido 
where Vlr_Total<>0 
group by year(data_emissao)
order by 1

------------------------------------------------------------

-- Calcular o total de comprado ($) por nome do cliente
select 
	nome,
	sum(vlr_total) 
from tb_pedido inner join tb_cliente 
on tb_cliente.id_cliente=tb_pedido.id_cliente
group by nome
order by 2 desc


select 
	nome,
	sum(vlr_total) 
from tb_pedido inner join tb_cliente 
on tb_cliente.id_cliente=tb_pedido.id_cliente
group by nome
having sum(vlr_total) >=100000


select 
	nome,
	sum(vlr_total) 
from tb_pedido inner join tb_cliente 
on tb_cliente.id_cliente=tb_pedido.id_cliente
where nome like '[a,g,f]%'
group by nome
order by 1 desc

select 
	nome,
	sum(vlr_total) 
from tb_pedido inner join tb_cliente 
on tb_cliente.id_cliente=tb_pedido.id_cliente
where  nome like '[w,t]%'
group by nome
having sum(vlr_total) >=100000

----------------------------------------------------------------------------------------------------------------------------------------------
-- SINÔNIMOS (p234)
/* Sinônimos são recursos que permitem substituir o nome de um objeto, valendo 
   para todo o banco*/

-- Legenda da coluna na listagem
select qtd_real, qtd_real as [Qt Estoque] from tb_produto 
-- Alias, apelido, legenda, título, caption

-- Legenda do nome da tabela em um join
select 
	E.nome,
	D.nome
from tb_empregado as E inner join tb_dependente as D
on E.id_empregado=D.id_empregado

-- Sinônimo (apelido válido para o banco inteiro)
-- Permanece até ser apagado
create table ValorEstimadoDoProdutoSazonal
(Id_produto int, valor numeric (11,2), Nome varchar(20))

insert into ValorEstimadoDoProdutoSazonal values
(1,100,'P1'),
(2,150,'P2'),
(3,345,'P3')

select * from ValorEstimadoDoProdutoSazonal
--
create synonym veps for ValorEstimadoDoProdutoSazonal
----
select * from veps
insert into veps values(4,333,'P8')
update veps set valor=1500 where id_produto=2
select * from veps
--
select * from sys.tables order by name
select * from sys.synonyms order by name

-------------------------------------------------------------

-- COLUNAS COMPUTADAS (pág 245)
-- Semelhante ao campo calculado do Access
-- Inclusão de colunas resultantes de cálculo na estrutura da tabela

-- Exemplo 1 - coluna calculada
-- Ela só existe em tempo de execução, não faz parte da estrutura
select 
	nome, 
	data_nascimento,
	getdate()-Data_Nascimento as [Idade Sem Formatação],
	floor(cast(getdate()-Data_Nascimento as float)/365.25) as [Idade com Formatação]
from tb_empregado


-- Exemplo 2 - coluna computada (campo definido apos a estrutura)
-- Inclusão de coluna computada, faz parte da estrutura e é calculada "automaticamente"
-- cada vez que o script do select é executado
if object_id('CopiaEmpre') is not null drop table CopiaEmpre
--
-- Copiar a tabela tb_empregado
select Nome, Data_Nascimento into CopiaEmpre from tb_empregado
 where data_nascimento is not null;
-- Verificando
select * from CopiaEmpre
exec sp_help copiaempre
--
-- O campo Idade não é definido diretamente, mas pelo data type do resultado da fórmula 
-- a coluna(campo) é caracterizado como Computed, float,null
alter table CopiaEmpre add
Idade as floor(cast(getdate()-data_nascimento as float)/365.25)
--
select * from CopiaEmpre

-- Verificação
insert into Copiaempre values('Pantagruel','1927.01.01')
select * from CopiaEmpre
-- OUTPUT - Apagados 
select descricao into #Teste from tb_produto
select * from #teste
delete from  #teste where descricao='Caneta pop'

delete from  #teste 
				output deleted.*
where descricao='Pente Jacare'

----------------------------------------------------------
select descricao into #teste from tb_produto
select * from #teste
delete from #teste where descricao='Caneta pop'
drop table #teste