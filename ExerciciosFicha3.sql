--exercicio 1 modo oracle
SELECT upper(e.nome), lower(funcao), initcap(d.nome)
from emp e, dep d
WHERE e.ndep = d.ndep
AND funcao = 'Vendedor'
;
--@block exercicio 1 modo mysql

SELECT upper(e.nome), lower(funcao), concat(upper(substr(d.nome,1,1)), lower(substr(d.nome,2)) ) as "departamento"
from emp e, dep d
WHERE e.ndep = d.ndep
AND funcao = 'Vendedor'

--@block exercicio 2

SELECT count(*)
from emp

--@block exercicio 3

SELECT count(*)
from emp
where premios is null 

--@block exercicio 3 segunda alternativa

SELECT count(*) - count(premios)
from emp 

--@block exercicios 4

SELECT COUNT(*) AS "Total de Empregados", 
  AVG(sal) AS "Salário médio mensal", 
  SUM(sal*14 + IFNULL(premios, 0)) AS "Remuneração Anual"
FROM emp

--@block exercicio 5

SELECT nome, funcao, sal, round(sal*1.1355, 1)
from emp
where funcao = 'Continuo'

--@block exercicio 6

SELECT nome, funcao, sal, round(sal*1.1355)
from emp
where funcao = 'Continuo'

--@block exercicio 7 com erros

SELECT nemp, nome, 
    date_format(data_entrada, '%Y') as "ano", 
    date_format(data_entrada, '%M') as "mes", 
    date_format(data_entrada, '%d') as "dia", 
    date_format(data_entrada, '%W') as "dia da semana"
from emp
where year(data_entrada) > 1985
order BY 3,4,5

--@block exercicio 7 sem erros

SELECT nemp, nome, 
  DATe_FORMAT(data_entrada, '%Y') AS "Ano",
  DATe_FORMAT(data_entrada, '%M') AS "Mês",
  DATe_FORMAT(data_entrada, '%d') AS "Dia",
  DATe_FORMAT(data_entrada, '%W') AS "Dia da Semana"
FROM emp
  WHERE YEAR(data_entrada) > 1985
  ORDER BY 3, 4, 5
;

--@block exercicio 8
SELECT func.nemp, func.nome, encar.nemp, encar.nome, func.data_entrada, encar.data_entrada, abs(datediff(func.data_entrada, encar.data_entrada)) as "diferenca de dias"
from emp func, emp encar
where func.encar = encar.nemp
and abs(datediff(func.data_entrada, encar.data_entrada)) >= 1000
order by 7


--@block exercicio 9

SELECT nemp, nome, data_entrada, 
    DATEDIFF(DATE_ADD(SYSDATE(), INTERVAL 1 YEAR) , data_entrada)
FROM emp
where datediff(DATE_ADD(sysdate(), INTERVAL 1 YEAR), data_entrada) > 35 * 365

--@block exercicio 10

SELECT nemp, nome, data_entrada, DATEDIFF(SYSDATE(), data_entrada),
  if(datediff(sysdate(), data_entrada) > 30 * 365, 'Platina',
    if(datediff(sysdate(), data_entrada) > 25 * 365, 'Ouro',
        if(datediff(sysdate(), data_entrada) > 20 * 365, 'Prata',
            if(datediff(sysdate(),data_entrada) > 15 * 365, 'Bronze', 'sem premio')))) as "Premio"
FROM emp
ORDER BY 4

--@block exercicio 11

SELECT max(sal), min(sal), avg(sal)
from emp

--@block exercicio 12

SELECT max(sal) - min(sal), avg(sal), ndep
from emp
group by ndep

--@block exercicio 13

SELECT funcao, count(*)
from emp
group by funcao
order by funcao

--@block exercicio 14

SELECT funcao, count(*)
from emp
where funcao = 'Analista'
or funcao like '%o'
group by funcao
order by funcao

--@block exercicio 15
SELECT year(data_entrada) 
from emp
GROUP BY year(data_entrada)
ORDER BY year(data_entrada) 