/* 1 */

SELECT *
FROM dep

--@block exercicio 2

SELECT nome, funcao, sal, ndep
from emp

--@block exercicio 3

SELECT nome, ndep, sal
from emp
WHERE sal BETWEEN 150000 and 300000

--@block exercicio 4

SELECT ndep, nome, local
from dep
ORDER BY ndep desc

--@block exercicio 5

SELECT funcao
from emp
GROUP BY funcao

--@block exercicio 10

SELECT nome, funcao
from emp
WHERE nome like 'A%us%'
OR nome like 'R%ei%'

--@block exercicio 11

SELECT nome, funcao, sal*14 + ifnull(premios, 0) as 'Remuneração Anual'
from emp

--@block exercicio 12

SELECT nome, sal*14 + ifnull(premios, 0)*0.1 as '10% do sal anual' ,premios
from emp
where funcao = 'Vencedor'
and ifnull(premios, 0) < (sal * 14 + ifnull(premios,0)) *0.1
ORDER BY 2 asc, nome

--@block ficha 3 exercicio 1

SELECT upper(e.nome), lower(funcao), concat( upper(substring(d.nome, 1, 1)), lower(substring(d.nome,2)) ) as 'Departamento'
from emp e, dep d
where e.ndep = d.ndep 
and funcao = 'Vendedor'

--@block exercicio 3

SELECT count(*)
from emp

--@block exercicio 4

SELECT count(*),
    avg(sal),
    sum(sal*14 + ifnull(premios, 0)) as 'Remuneração Anual'
from emp

--@block exercicio 5

SELECT nome, funcao, sal, round(sal+(sal*13.55),1)
from emp
where funcao = 'Continuo'

--@block exercicio 6

SELECT nome, funcao, sal, round(sal+(sal*13.55))
from emp
where funcao = 'Continuo'

--@block exercicio 7

SELECT nemp, nome,
    date_format(data_entrada, '%Y') as 'Ano',
    date_format(data_entrada, '%M') as 'Mes',
    date_format(data_entrada, '%d') as 'Dia',
    date_format(data_entrada, '%W') as 'Dia da semana'
from emp
where year(data_entrada) > 1985
ORDER BY 3,4,5

--@block exercicio 8

SELECT func.nemp, func.nome, func.data_entrada, 
  enc.nemp, enc.nome, enc.data_entrada,
  ABS( DATEDIFF(func.data_entrada , enc.data_entrada) ) AS "Diferença de dias"
FROM emp func, emp enc
  WHERE func.encar = enc.nemp
  AND  ABS( DATEDIFF(func.data_entrada , enc.data_entrada) ) >= 1000
  ORDER BY 7
