select * 
from sales.customers
limit 10


select
    email,
	birth_date,
	(current_date - birth_date) / 365 as idade_do_cliente


from sales.customers



select
    email,
	birth_date,
	(current_date - birth_date) / 365 as "idade do cliente"


from sales.customers


select
    email,
	birth_date,
	(current_date - birth_date) / 365 as "idade do cliente"
from sales.customers
order by "idade do cliente"


select
    first_name || ' ' || last_name as "nome completo"
from sales.customers

SELECT
   customer_id,
   first_name,
   professional_status,
   (professional_status='clt') as cliente_clt

from sales.customers

select *
from sales.products
where price >= 100000 and price <= 200000

select *
from sales.products
where price between 100000 and 200000

select * 
from sales.products
where price <100000 or price > 200000

select * 
from sales.products
where price not between 100000 and 200000

select*
from sales.products
where brand = 'HONDA' or brand = 'TOYOTA' or brand= 'RENAULT'

select*
from sales.products
where brand IN ('HONDA','TOYOTA','RENAULT')

select*
from sales.products
where brand NOT IN ('HONDA','TOYOTA','RENAULT')

select distinct first_name
from sales.customers
where first_name = 'ANA'

select distinct first_name
from sales.customers
where first_name LIKE 'ANA%'

select distinct first_name
from sales.customers
where first_name LIKE '%ANA'

select distinct first_name
from sales.customers
where first_name ILIKE 'ana%'


select*
from temp_tables.regions

select*
from temp_tables.regions
where population is null

exercises

select email, income
from sales.customers
order by income asc
----------------------------

select 
  email,
  income,
  (income / 1200) as salario_minimo
 
from sales.customers

select 
  email,
  income,
  (income / 1200) as "salarios minimos"
  
from sales.customers

-------------------------------------

2

select -------------> errado
  email,
  income,
  (income / 1200) as "salarios minimos"
  ((income / 1200) <= 4 or >=5 ) as 
from sales.customers

--------correto
select
	email,
	income,
	(income) / 1200 as "salários mínimos",
	((income) / 1200) > 4 as "acima de 4 salários"   --> isola apenas o income e faz a primeira salario minimo e 2 operação numeros de salarios
from sales.customers


----------------------------

3


select salarios min ---------------errado
  
from sales.customers
where salarios minimos between 4 and 5

select
	email,
	income,
	(income) / 1200 as "salários mínimos",
	((income) / 1200) > 4 as "acima de 4 salários"
from sales.customers
where ((income) / 1200) between 4 and 5


----------------

4

select email, city, state
from sales.customers
where state in ('MG', 'MS')
-------------
5
select email, city, state
from sales.customers
where state not in ('SP')



------------
6
select *
from temp_tables.regions
where city ilike 'Z%'

select state
from sales.customers


select count(*)
from sales.funnel


select*
from sales.funnel
limit 10

select count(paid_date)
from sales.funnel


select count(product_id)
from sales.funnel
where visit_page_date between '2021-01-01' and '2021-01-31'

select count( distinct product_id)
from sales.funnel
where visit_page_date between '2021-01-01' and '2021-01-31'

select min(price), max(price), avg(price)
from sales.products

select max (price) from sales.products

select *
from sales.products
where price = (select max (price) from sales.products)


select count(*)
from sales.customers


select state, count(*)
from sales.customers
group by state

select state, count(*) as contagem
from sales.customers
group by state
order by contagem desc

select state, professional_status, count(*) as contagem
from sales.customers
group by state, professional_status
order by state, contagem desc

ou

select state, professional_status, count(*) as contagem
from sales.customers
group by 1, 2
order by state, contagem desc


select distinct state
from sales.customers

ou 

select state
from sales.customers
group by state

select 
    state,
	count(*)
from sales.customers
group by state

select 
    state,
	count(*)
from sales.customers
group by state
having count(*) > 100

OU 

select 
    state,
	count(*)
from sales.customers
group by state
having count(*) > 100
    AND STATE<>'MG'

-- USANDO WHERE EM COLUNA NÃO AGREGADA:(FOI RETIRADO O ESTADO DE MG )

select 
    state,
	count(*)
from sales.customers
WHERE STATE<>'MG'
group by state
having count(*) > 100

-- O HAVING FUNCIONA IGUAL EXEMPLO ACIMA:

select 
    state,
	count(*)
from sales.customers
group by state
having count(*) > 100
    AND STATE<>'MG'

-- DESAFIO> 
1--- feito

select count(birth_date)
from sales.customers
where birth_date >= '1995-01-01'

ou 
select count(birth_date)
from sales.customers
where birth_date <= '1995-01-01'


--- coreto: 
select count(*)
from sales.customers
where ((current_date - birth_date) / 365 ) < 30


2 --- retornar esta incompleto


select max(birth_date) as "novo", min(birth_date) as "velho"
from sales.customers


--correto:

select 
	max((current_date - birth_date) / 365 ),
	min((current_date - birth_date) / 365 )
from sales.customers


3 ---feito

SELECT*
from sales.customers
order by income desc

----correto: 

select *
from sales.customers
where income = (select max(income) from sales.customers)

4 ----

select *
from sales.products


select 
     brand,
	 count(*)

from sales.products
group by brand
order by brand

5---- talvez correto

select 
     brand, 
	 model_year,
	 count(*) as contagem

from sales.products
group by brand, model_year
order by brand, model_year asc

correto: - acertei
select brand, model_year, count(*)
from sales.products
group by brand, model_year
order by brand , model_year

6



select 
     brand, 
	 count(*)

from sales.products
group by brand
having count(*) > 10
order by count(*) asc

correto: -----acertei
select brand, count(*)
from sales.products
group by brand
having count(*) > 10 




-- joins

select * from temp_tables.tabela_1
select * from temp_tables.tabela_2

select t1.cpf, t1.name, t2.state
from temp_tables.tabela_1 as t1 left join temp_tables.tabela_2 as t2
on t1.cpf = t2.cpf


select t1.cpf, t1.name, t2.state
from temp_tables.tabela_1 as t1 inner join temp_tables.tabela_2 as t2
on t1.cpf = t2.cpf

select t2.cpf, t1.name, t2.state
from temp_tables.tabela_1 as t1 right join temp_tables.tabela_2 as t2
on t1.cpf = t2.cpf

select t2.cpf, t1.name, t2.state
from temp_tables.tabela_1 as t1 full join temp_tables.tabela_2 as t2
on t1.cpf = t2.cpf


----exemplos
select
    cus.professional_status,
	fun.paid_date

from sales.funnel as fun
left join sales.customers as cus
    on fun.customer_id = cus.customer_id

---depois realizamos abaixo o exemplo 1
select
    cus.professional_status,
	count (fun.paid_date) as pagamentos

from sales.funnel as fun
left join sales.customers as cus
    on fun.customer_id = cus.customer_id
group by cus.professional_status
order by pagamentos desc


--exemplo 2

select* from temp_tables.ibge_genders limit 10

select
    ibge.gender,
	count(fun.paid_date)
from sales.funnel as fun
left join sales.customers as cus
    on fun.customer_id = cus.customer_id
left join temp_tables.ibge_genders as ibge
    on lower (cus.first_name) = ibge.first_name
group by ibge.gender


--3


select*from sales.customers limit 10
select*from temp_tables.regions limit 10
select*from sales.funnel limit 10

select 
    reg.region, 
	count(fun.visit_page_date) as visitas
from sales.funnel as fun
left join sales.customers as cus
   on fun.customer_id = cus.customer_id
left join temp_tables.regions as reg
   on lower (cus.city) = lower (reg.city) 
   and lower (cus.state) = lower(reg.state) 
group by reg.region
order by visitas desc


--desafio 1

select*from sales.funnel
select*from sales.products

select 
      pro.brand,
	  count(fun.visit_page_date) as visitas
from sales.funnel as fun
left join sales.products as pro
    on fun.product_id = pro.product_id
group by pro.brand
order by visitas desc


---correto: 
select 
	pro.brand,
	count(*) as visitas

from sales.funnel as fun
left join sales.products as pro
	on fun.product_id = pro.product_id
group by pro.brand
order by visitas desc


-- desafio 2

select*from sales.funnel
select*from sales.products


select 
      fun.store_id,
	  count(fun.visit_page_date) as visitas
from sales.funnel as fun
left join sales.products as pro
    on fun.product_id = pro.product_id
group by fun.store_id
order by visitas desc


---correto: 

select 
	sto.store_name,
	count(*) as visitas

from sales.funnel as fun
left join sales.stores as sto
	on fun.store_id = sto.store_id
group by sto.store_name
order by visitas desc

--desafio 3 
select*from sales.funnel limit 10
select*from sales.customers limit 10
select*from temp_tables.regions limit 10

select 
      reg.size,
	  count(fun.visit_page_date) as visitas	  
from sales.funnel as fun
left join sales.customers as cus
on fun.customer_id = cus.customer_id
left join temp_tables.regions as reg
on lower (cus.city) = lower (reg.city)
and lower(cus.state) = lower(reg.state)
group by reg.size
order by visitas asc


--correto:
select
	reg.size,
	count(*) as contagem
from sales.customers as cus
left join temp_tables.regions as reg
	on lower(cus.city) = lower(reg.city)
	and lower(cus.state) = lower(reg.state)
group by reg.size
order by contagem


select 
    reg.region, 
	count(fun.visit_page_date) as visitas
from sales.funnel as fun
left join sales.customers as cus
   on fun.customer_id = cus.customer_id
left join temp_tables.regions as reg
   on lower (cus.city) = lower (reg.city) 
   and lower (cus.state) = lower(reg.state)
group by reg.region
order by visitas desc


---union

select * from sales.products
union all
select* from temp_tables.products_2


--subquery no where

select * from sales.products
where price = (select min (price) from sales.products)

select min (price) from sales.products


--subquery no with
---sintaxe para media agrupado no status professional
select
      professional_status,
	  avg(idade) as idade_media
from alguma_tabela
group by professional_status

-- calculando a idade 
select
     professional_status,
	 (current_date-birth_date)/365 as idade
from sales.customers


--depois com with agrupando idade mais a média:

with alguma_tabela as(select
     professional_status,
	 (current_date-birth_date)/365 as idade
from sales.customers)

select
      professional_status,
	  avg(idade) as idade_media
from alguma_tabela
group by professional_status


--sub no from , invertido os dados de with para o from 

select
      professional_status,
	  avg(idade) as idade_media
from (select
     professional_status,
	 (current_date-birth_date)/365 as idade
from sales.customers) as alguma_tabela
group by professional_status


--sub no select
select
    fun.visit_id,
	fun.visit_page_date,
	sto.store_name,
	(
       select count(*)
	   from sales.funnel as fun2
	   where fun2.visit_page_date <= fun.visit_page_date
	       and fun2.store_id = fun.store_id
	)as visitas_acumuladas

from sales.funnel as fun
left join sales.stores as sto
   on fun.store_id= sto.store_id
order by sto.store_name, fun.visit_page_date

--- resultado: trazendo visitas aCUMULADAS

---exemplos:

with primeira_visita as (

    select customer_id, min(visit_page_date) as visita_1
    from sales.funnel
    group by customer_id
)
select
    fun.visit_page_date,
	(fun.visit_page_date <> primeira_visita.visita_1) as lead_recorrente,
	count(*)
from sales.funnel as fun
left join primeira_visita
    on fun.customer_id= primeira_visita.customer_id
group by fun.visit_page_date, lead_recorrente
order by fun.visit_page_date desc, lead_recorrente



--ex2

select* from sales.funnel
select* from sales.products

with preco_medio as(
   select brand, avg(price) as preco_medio_da_marca
   from sales.products
   group by brand
)
select 
    fun.visit_id,
	fun.visit_page_date,
	pro.brand,
	(pro.price*(1+ fun.discount)) as preco_final
	preco_medio . preco_medio_da_marca
	((pro.price*(1+fun.discount)) - preco_medio.preco_medio_da_marca) as preco_vs_media
from sales.funnel as fun
left join sales.products as pro
   on fun.product_id = pro.product_id
left join preco_medio
   on pro.brand=preco_medio.brand

-- DESAFIO 1 (Exercício 1) Crie uma coluna calculada com o número de visitas realizadas por cada
-- cliente da tabela sales.customers

SELECT * FROM SALES.CUSTOMERS

select * from sales.funnel


with visita_por_cliente as(

select
     fun.visit_id,
     fun.visit_page_date,
	 count(*)
	 from sales.funnel
	 group by customer_id)
from sales.funnel as fun
left join visitas_por_cliente as cus
  on fun.customer_id = cus.customer_id
group by customer_id

-- correto:

with numero_de_visitas as (

	select customer_id, count(*) as n_visitas
	from sales.funnel
	group by customer_id

)

select
	cus.*,
	n_visitas

from sales.customers as cus
left join numero_de_visitas as ndv
	on cus.customer_id = ndv.customer_id


--CONVERSÃO DE TEXTO EM DATA

select '2021-10-01'::date - '2021-02-01'::date

--CONVERSÃO DE TEXTO EM numero

select '100'::numeric -'10'::numeric

--CONVERSÃO DE numero em texto

select replace(112122::text,'1','a')

--CONVERSÃO DE TEXTO EM DATA
select cast ('2021-10-01'as date) - cast('2021-02-01'as date)


--TRATAMENTO GERAL

select* from sales.customers limit 10




with faixa_de_renda as (
    select
	      income,
		  case
		      when income <5000 then '0-5000'
			  when income >=5000 and income < 10000 then'5000 -10000'
			  when income >= 10000 and income < 15000 then '10000-15000'
			  else '15000+'
			  end as faixa_renda
    from sales.customers
)
select faixa_renda, count(*)
from faixa_de_renda
group by faixa_renda



with faixa_de_renda as (
    select
	     income, 
		 case
             when income < 5000 then '0-5000'
			 when income >= 5000 and income<10000 then '5000-10000'
			 when income >= 10000 and income <15000 then '10000-15000'
			 else '15000+'
			 end as faixa_renda
	from sales.customers
	order by income asc
)

select faixa_renda, count(*)
from faixa_de_renda
group by faixa_renda


--COALESCE

select* from temp_tables.regions

--no case when

select
     *,
	 case
	     when population is not null then population
		 else(select avg(population) from temp_tables.regions)
		 end as populacao_ajustada
from temp_tables.regions
where population is null

---com coalesce

select
     *,
	 coalesce (population, (select avg(population)from temp_tables.regions)) as populacao_ajustada
from temp_tables.regions
where population is null

--TRATAMENTO COM  DATA

---ex1
select current_date + 10
select current_date + interval '10weeks'
select (current_date + interval '10months')::date
select current_date + interval '10hours'
-----ex2
select visit_page_date, count(*)
from sales.funnel
group by visit_page_date
order by visit_page_date desc


select
     visit_page_date,
	 date_trunc('month', visit_page_date)::date
from sales.funnel

-- ex2depois

select
     date_trunc('month', visit_page_date)::date as visit_page_month,
	 count(*)
from sales.funnel
group by visit_page_month
order by visit_page_month desc


--ex 3
select
     '2022-01-30'::date,
	 extract('dow' from '2022-01-30'::date)
---
select
     extract('dow' from visit_page_date) as dia_da_semana,
	 count(*)

from sales.funnel
group by dia_da_semana
order by dia_da_semana

---ex4

--sem usar função:
--dias
select
     (current_date-'2018-06-01')
--semanas
select
     (current_date-'2018-06-01')/7
--meses
select
     (current_date-'2018-06-01')/30
--ano
select
     (current_date-'2018-06-01')/365

--usando função: não irá funcionar pois não tem essa função criada, será criada na proxima aula de funções.

select
     datediff('weeks', '2018-06-01', current_date)

----funções

--datediff

select
     (current_date-'2018-06-01')
--semanas
select
     (current_date-'2018-06-01')/7
--meses
select
     (current_date-'2018-06-01')/30
--ano
select
     (current_date-'2018-06-01')/365
	 	 
---criando função datediff

select
     datediff('weeks', '2018-06-01', current_date)

----------
create function datediff(unidade varchar, data_inicial date, data_final date)
returns integer
language sql

as

$$
select
    case
	    when unidade in('d', 'day', 'days') then (data_final - data_inicial)
		when unidade in('w', 'week', 'weeks') then (data_final-data_inicial)/7
		when unidade in('m', 'month', 'months') then (data_final-data_inicial)/30
		when unidade in('y', 'year', 'years') then (data_final-data_inicial)/365
		end as diferenca



$$
--------------
select
     datediff('y', '2024-07-31', current_date)

--- MANIPULÇAÕ DE TABELAS
---ex1 criar tabela apartir de uma query
--crie uma tabela chamada customers_age com o id e a idade dos clientes
--chamea de temp_tables.customers_age


select
     customer_id,
	 datediff('years', birth_date, current_date) idade_cliente
	 into temp_tables.customers_age

from sales.customers


select*
from temp_tables.customers_age


---ex2 criação de tabela a partir do zero
---crie uma tebela com a tradução dos status profissionais dos clientes
--chamea de temp_tables.profissoes


select distinct professional_status  ---saber os diferentes(distintos) profissoes da tabela
from sales.customers
---criando a tabela traduzida sem valores/linhas 
create table temp_tables.profissoes(
    professional_status varchar,
	status_professional varchar
)
---- criando valores/linhas com profissoes traduzidas
insert into temp_tables.profissoes
(professional_status, status_professional)

values
('freelancer', 'freelancer'),
('retires', 'aposentado'),
('clt', 'clt'),
('self_employed', 'autonomo'),
('other', 'outro'),
('bussinessman', 'empresario'),
('civil_servant', 'funcionário publico'),
('student', 'estudante')


--consultar se criou tabela traduzida
select * from temp_tables.profissoes


--ex 3 como deletar tabela

drop table temp_tables.profissoes


---manipular linhas
---ex1
select * from temp_tables.profissoes



---inserir linha:

insert into temp_tables.profissoes
(professional_status, status_professional)

values
('unemployed', 'desempregado'),
('trainee', 'estagiario')



---ex2 alterar linha

update temp_tables.profissoes
set professional_status = 'intern'
where status_professional = 'estagiario'


--MANIPULAR COLUNA

---EX1 INSERIR
---INSERIR COLUNA TABELA SALES.CUSTOMERS C IDADE DO CLIENTE

alter table sales.customers
add customer_age int

select* from sales.customers limit 10

UPDATE sales.customers
set customer_age = datediff('years', birth_date, current_date)
where true


----EX2 ALTERAR TIPO
--CUSTOMER AGE DE INTGER PARA VARCHAR

alter table sales.customers
alter column customer_age type varchar
]

---EX3 ALTERAR NOME DA TABELA
--CUSTOMER_AGE PARA AGE
alter table sales.customers
rename column customer_age to age

---


------ PROJETO 1 DASHBOARDS DE ACOMPANHAMENTO DAS VENDAS

 -- (Query 1) Receita, leads, conversão e ticket médio mês a mês
-- Colunas: mês, leads (#), vendas (#), receita (k, R$), conversão (%), ticket médio (k, R$)

with 
	leads as (
		select
			date_trunc('month', visit_page_date)::date as visit_page_month,
			count(*) as visit_page_count
		from sales.funnel
		group by visit_page_month
		order by visit_page_month
	),
	
	payments as (
		select
			date_trunc('month', fun.paid_date)::date as paid_month,
			count(fun.paid_date) as paid_count,
			sum(pro.price * (1+fun.discount)) as receita
		from sales.funnel as fun
		left join sales.products as pro
			on fun.product_id = pro.product_id
		where fun.paid_date is not null
		group by paid_month
		order by paid_month
	)
	
select
	leads.visit_page_month as "mês",
	leads.visit_page_count as "leads (#)",
	payments.paid_count as "vendas (#)",
	(payments.receita/1000) as "receita (k, R$)",
	(payments.paid_count::float/leads.visit_page_count::float) as "conversão (%)",
	(payments.receita/payments.paid_count/1000) as "ticket médio (k, R$)"
from leads
left join payments
	on leads.visit_page_month = paid_month


-- (Query 2) Estados que mais venderam
-- Colunas: país, estado, vendas (#)

select * from sales.customers

select* from sales.funnel


alter table sales.customers
add pais int

select* from sales.customers limit 10

update sales.customers
set pais = 'Brazil'
where pais is null

alter table sales.customers
alter column pais type varchar

select
     state

	 SELECT * FROM sales.customers


select 
    pais,
	state,
	count(*)

from sales.customers as cus
left join sales.funnel as fun
   on cus.customer_id = fun.customer_id
   where paid_date between '2021-08-01' and '2021-08-31'
group by cus.pais, cus.state
order by count desc


select
	'Brazil' as país,
	cus.state as estado,
	count(fun.paid_date) as "vendas (#)"

from sales.funnel as fun
left join sales.customers as cus
	on fun.customer_id = cus.customer_id
where paid_date between '2021-08-01' and '2021-08-31'
group by país, estado
order by "vendas (#)" desc
limit 5


-- (Query 3) Marcas que mais venderam no mês
-- Colunas: marca, vendas (#)

select 
   brand,
   count(fun.paid_date) as "vendas"

from sales.products as pro
left join sales.funnel as fun
    on pro.product_id = fun.product_id
where paid_date between '2021-08-01' and '2021-08-31'
group by brand
order by vendas desc limit 5



select
	pro.brand as marca,
	count(fun.paid_date) as "vendas (#)"

from sales.funnel as fun
left join sales.products as pro
	on fun.product_id = pro.product_id
where paid_date between '2021-08-01' and '2021-08-31'
group by marca
order by "vendas (#)" desc
limit 5


select * from sales.funnel


-- (Query 4) Lojas que mais venderam
-- Colunas: loja, vendas (#)

select
     store_name as lojas,
	 count (fun.paid_date) as "vendas"
from sales.funnel as fun
left join sales.stores as sto
   on fun.store_id = sto.store_id
where paid_date between '2021-08-01' and '2021-08-31'
group by store_name
order by vendas desc
limit 5


-- (Query 5) Dias da semana com maior número de visitas ao site
-- Colunas: dia_semana, dia da semana, visitas (#)


select
	extract('dow' from visit_page_date) as dia_semana,
	case 
		when extract('dow' from visit_page_date)=0 then 'domingo'
		when extract('dow' from visit_page_date)=1 then 'segunda'
		when extract('dow' from visit_page_date)=2 then 'terça'
		when extract('dow' from visit_page_date)=3 then 'quarta'
		when extract('dow' from visit_page_date)=4 then 'quinta'
		when extract('dow' from visit_page_date)=5 then 'sexta'
		when extract('dow' from visit_page_date)=6 then 'sábado'
		else null end as "dia da semana",
	count(*) as "visitas (#)"

from sales.funnel
where visit_page_date between '2021-08-01' and '2021-08-31'
group by dia_semana
order by dia_semana


------- PROJETO 2 ANALISE DE PERFIL DOS CLIENTES

-- (Query 1) Gênero dos leads
-- Colunas: gênero, leads(#)

select *
from sales.customers

select *
from temp_tables.ibge_genders


select
     case 
	     when ibge.gender = 'male' then 'homens'
		 when ibge.gender = 'female' then 'mulheres'
		 end as "Genêro",
     count(*) as "Lead"
	 
from sales.customers as cus
left join temp_tables.ibge_genders as ibge
    on lower(cus.first_name) = lower(ibge.first_name)
group by ibge.gender


-- (Query 1) Gênero dos leads
-- Colunas: gênero, leads(#)

select
	case
		when ibge.gender = 'male' then 'homens'
		when ibge.gender = 'female' then 'mulheres'
		end as "gênero",
	count(*) as "leads (#)"

from sales.customers as cus
left join temp_tables.ibge_genders as ibge
	on lower(cus.first_name) = lower(ibge.first_name)
group by ibge.gender


-- (Query 2) Status profissional dos leads
-- Colunas: status profissional, leads (%)

select
	case
		when professional_status = 'freelancer' then 'freelancer'
		when professional_status = 'retired' then 'aposentado(a)'
		when professional_status = 'clt' then 'clt'
		when professional_status = 'self_employed' then 'autônomo(a)'		
		when professional_status = 'other' then 'outro'
		when professional_status = 'businessman' then 'empresário(a)'
		when professional_status = 'civil_servant' then 'funcionário(a) público(a)'
		when professional_status = 'student' then 'estudante'
		end as "status profissional",
	(count(*)::float)/(select count(*) from sales.customers) as "leads (%)"

from sales.customers
group by professional_status
order by "leads (%)"


-- (Query 3) Faixa etária dos leads
-- Colunas: faixa etária, leads (%)

select
	case
		when datediff('years', birth_date, current_date) < 20 then '0-20'
		when datediff('years', birth_date, current_date) < 40 then '20-40'
		when datediff('years', birth_date, current_date) < 60 then '40-60'
		when datediff('years', birth_date, current_date) < 80 then '60-80'
		else '80+' end "faixa etária",
		count(*)::float/(select count(*) from sales.customers) as "leads (%)"

from sales.customers
group by "faixa etária"
order by "faixa etária" desc


-- (Query 4) Faixa salarial dos leads
-- Colunas: faixa salarial, leads (%), ordem

select
	case
		when income < 5000 then '0-5000'
		when income < 10000 then '5000-10000'
		when income < 15000 then '10000-15000'
		when income < 20000 then '15000-20000'
		else '20000+' end "faixa salarial",
		count(*)::float/(select count(*) from sales.customers) as "leads (%)",
	case
		when income < 5000 then 1
		when income < 10000 then 2
		when income < 15000 then 3
		when income < 20000 then 4
		else 5 end "ordem"

from sales.customers
group by "faixa salarial", "ordem"
order by "ordem" desc

-- (Query 5) Classificação dos veículos visitados
-- Colunas: classificação do veículo, veículos visitados (#)
-- Regra de negócio: Veículos novos tem até 2 anos e seminovos acima de 2 anos

with
	classificacao_veiculos as (
	
		select
			fun.visit_page_date,
			pro.model_year,
			extract('year' from visit_page_date) - pro.model_year::int as idade_veiculo,
			case
				when (extract('year' from visit_page_date) - pro.model_year::int)<=2 then 'novo'
				else 'seminovo'
				end as "classificação do veículo"
		
		from sales.funnel as fun
		left join sales.products as pro
			on fun.product_id = pro.product_id	
	)

select
	"classificação do veículo",
	count(*) as "veículos visitados (#)"
from classificacao_veiculos
group by "classificação do veículo"


-- (Query 6) Idade dos veículos visitados
-- Colunas: Idade do veículo, veículos visitados (%), ordem

with
	faixa_de_idade_dos_veiculos as (
	
		select
			fun.visit_page_date,
			pro.model_year,
			extract('year' from visit_page_date) - pro.model_year::int as idade_veiculo,
			case
				when (extract('year' from visit_page_date) - pro.model_year::int)<=2 then 'até 2 anos'
				when (extract('year' from visit_page_date) - pro.model_year::int)<=4 then 'de 2 à 4 anos'
				when (extract('year' from visit_page_date) - pro.model_year::int)<=6 then 'de 4 à 6 anos'
				when (extract('year' from visit_page_date) - pro.model_year::int)<=8 then 'de 6 à 8 anos'
				when (extract('year' from visit_page_date) - pro.model_year::int)<=10 then 'de 8 à 10 anos'
				else 'acima de 10 anos'
				end as "idade do veículo",
			case
				when (extract('year' from visit_page_date) - pro.model_year::int)<=2 then 1
				when (extract('year' from visit_page_date) - pro.model_year::int)<=4 then 2
				when (extract('year' from visit_page_date) - pro.model_year::int)<=6 then 3
				when (extract('year' from visit_page_date) - pro.model_year::int)<=8 then 4
				when (extract('year' from visit_page_date) - pro.model_year::int)<=10 then 5
				else 6
				end as "ordem"

		from sales.funnel as fun
		left join sales.products as pro
			on fun.product_id = pro.product_id	
	)

select
	"idade do veículo",
	count(*)::float/(select count(*) from sales.funnel) as "veículos visitados (%)",
	ordem
from faixa_de_idade_dos_veiculos
group by "idade do veículo", ordem
order by ordem



-- (Query 7) Veículos mais visitados por marca
-- Colunas: brand, model, visitas (#)

select
	pro.brand,
	pro.model,
	count(*) as "visitas (#)"

from sales.funnel as fun
left join sales.products as pro
	on fun.product_id = pro.product_id
group by pro.brand, pro.model
order by pro.brand, pro.model, "visitas (#)"