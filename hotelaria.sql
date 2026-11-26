#selecionar as casa com numeros iguas ou maiores que 150

select * from enderecos
where numero>= 150
order by numero asc
limit 10;

#função usada para filtrar duas colunas
select cidade,estado from enderecos;

#função utilizanda para filtrar a tabela inteira e ordenar em decrescente

select * from enderecos
order by numero desc;

# função utilizada para filtrar da tabela endereço os estados de al

select * from enderecos
where estado = "AL";

#função utilizandos dois filtros estado com numeros menores que 100

select * from enderecos
where estado = "PB" and numero < 100;

#apenas busca pelo 100

select * from enderecos
where numero = 100;

#pesquisa de endereços do bairro do centro com numeração em ordem decresente

select * from enderecos
where bairro = "centro"
order by numero desc;

#quais endereços ativos e inativos
select ativo
from hospedagens
inner join enderecos as enderecos_id
on endereco_id = endereco_id;

#Como pesquisar sobre o tickmedio

select * from alugueis;

select cliente_id, AVG(PRECO_TOTAL) AS TICKT_MEDIO FROM alugueis GROUP BY CLIENTE_ID;

select  cliente_id, AVG(datediff(data_fim,data_inicio))
as media_dias_estadias
from alugueis
group by cliente_id
order by media_dias_estadias desc;

#buscar proprietarios com hospedagens ativas

select * from proprietarios;
select * from hospedagens
where ativo = 1;

#
select p.nome as nome_proprietario
from proprietarios p;


select count(h.hospedagem_id) as total_hops_atv
from hospedagens h;

#usando o inner join
select p.nome as nome_proprietario,
count(h.hospedagem_id) as total_hosp_atv
from proprietarios p 
join hospedagens h
on p.proprietario_id = h.proprietario_id
where h.ativo = 1
group by p.nome
order by total_hosp_atv desc
limit 10;

#
select p.nome as nome_proprietario
from proprietarios p;


select count(h.hospedagem_id) as total_hops_atv
from hospedagens h;

#usando o inner join
select p.nome as nome_proprietario,
count(h.hospedagem_id) as total_hosp_atv
from proprietarios p 
join hospedagens h
on p.proprietario_id = h.proprietario_id
where h.ativo = 0
group by p.nome
order by total_hosp_atv desc
limit 10;

#consulte os meses com maior e menor demanda de alugueis

select year(data_inicio) as ano,
month(data_inicio) as mes,
count(*) total_alugueis
from alugueis
group by ano, mes
order by total_alugueis;

#17 DE NOVEMBRO VAMOS REALIZAR OS TESTES CERTINHO

#1 CONSULTA
#APÓS AS CONSULTADS ANTERIORES, A PLATAFORMA SOLICITOU ALGUMAS MUDANÇAS.
#FOI OBRSERVADO QUE NÃO TEMOS A QUANTIDADE DE PROPRIEDADES PRO PROPRIETARIOS
#TAMBEM FOI PEDIDO QUE ALTERASSEMOS A TABELA ALGUEIS PARA "RESERVAS", O QUE FAZ MAIS SENTIDO PARA O BANCO

ALTER TABLE proprietarios
ADD COLUMN QNT_HOSPEDAGEM INT;

#RENOMENADO A TABLE
ALTER TABLE alugueis
RENAME TO RESERVAS;

#RENOMEAR A COLUNA
ALTER TABLE RESERVAS
RENAME COLUMN ALUGUEL_ID TO RESERVA_ID;