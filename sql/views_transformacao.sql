#Rol dos dados (conjunto dos dados ordenados)

select * from amostra_dados
order by valor;


#Distribuição das frequências(absolutas e relativas)

create view vw_frequencias as
with frequencia_abs as (
	select
	*,
	count(valor) as frequencia_absoluta
    from amostra_dados
    group by valor
), frequencia_rel as (
	select 
    *,
    round((frequencia_absoluta / sum(frequencia_absoluta) over()) * 100) as frequencia_relativa
    from frequencia_abs
    order by valor
), frequencias as (
	select
    *,
    sum(frequencia_absoluta) over(order by id) as frequencia_absoluta_absoluta,
    sum(frequencia_relativa) over(order by id) as frequencia_absoluta_relativa
    from frequencia_rel
)
select * from frequencias;