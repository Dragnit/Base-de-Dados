/* exercicio 1*/
SELECT    e.nome, funcao, d.nome AS "nome empregado"
FROM    emp e, dep d
WHERE e.ndep = d.ndep
ORDER BY d.nome, e.nome

--@block
/* exercicio 2*/
SELECT e.nome, sal, d.ndep, d.nome
FROM emp e, dep d
WHERE e.ndep = d.ndep
AND e.nome LIKE 'A% R%'

--@block
SELECT e.nome, sal, d.nome, local
from emp e, dep d
WHERE e.ndep = d.ndep
AND sal < 150000

--@block
SELECT funcao, escalao
from emp, descontos
WHERE sal between salinf AND salsup
ORDER BY escalao, funcao

--@block
SELECT nome, funcao, sal
from emp, descontos
WHERE sal between salinf AND salsup
AND escalao = 4
ORDER BY nome

--@block
SELECT e.nome, funcao, sal, d.nome
from emp e, descontos, dep d
WHERE sal between salinf AND salsup
AND e.ndep = d.ndep
AND escalao = 4
ORDER BY e.nome

--@block
SELECT e.nome, funcao, sal, local
from emp e, dep d
WHERE e.ndep = d.ndep
AND local = 'Coimbra'
AND sal > 150000

--@block exercicio 13
SELECT func.nemp, func.nome, encar.nemp, encar.nome
from emp func, emp encar
WHERE func.encar = encar.nemp
ORDER BY func.nome, encar.nome

--@block 
SELECT func.nemp, func.nome, func.sal, encar.nemp, encar.nome, encar.sal
from emp func, emp encar
WHERE func.encar = encar.nemp
AND func.sal > encar.sal
ORDER BY func.nome, encar.nome

--@block
SELECT e.nome, funcao, escalao, d.nome
from emp e, descontos, dep d
WHERE sal between salinf AND salsup
AND e.ndep = d.ndep
AND funcao != 'Continuo'
ORDER BY escalao desc 

--@block
SELECT e.nome, nemp, sal, d.nome, escalao
from emp e, descontos, dep d
WHERE e.ndep = d.ndep
AND sal between salinf and salsup
AND sal between 100000 and 200000
ORDER BY escalao, e.ndep, e.nome

--@block
SELECT e.nome, nemp, sal, d.nome, local, escalao, premios
FROM emp e, dep d, descontos 
WHERE e.ndep = d.ndep
AND sal BETWEEN salinf AND salsup
AND sal > 100000
AND e.ndep IN (10, 30)
AND local LIKE 'C%'
AND premios IS NOT null
AND  premios < (sal*14)*0.03
AND encar IS NOT null
AND escalao IN (1, 2, 3)
