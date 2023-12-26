--exercicio 1
SELECT MIN(sal)
FROM emp

--@block exercicio 2
SELECT nome, funcao, sal
FROM emp
WHERE sal = (SELECT min(sal)
            FROM emp)

--@block exercicio3
SELECT nome, funcao, sal
FROM emp 
WHERE funcao = (SELECT funcao
                FROM emp
                where nome = 'Olga Costa')

--@block exercicio4
SELECT nome, sal, ndep
FROM emp
WHERE (ndep, sal) IN (SELECT ndep, MAX(sal) 
                    FROM emp
                    GROUP BY ndep)

--@block exercicio5
SELECT nome, sal, funcao, ndep
FROM emp
where sal > any (SELECT (sal)
                FROM emo
                where ndep = 30)
ORDER BY sal desc

--@block exercicio6
SELECT nome, sal, funcao, ndep 
FROM emp
where sal > all (SELECT sal
                FROM emp e, dep d
                where d.nome = 'Vendas' 
                and e.ndep = d.ndep)

--@block exercicio7
SELECT d.nome, avg(sal)
FROM dep d, emp e
WHERE e.ndep = d.ndep
GROUP BY e.ndep
having  avg(sal) > (SELECT avg(sal)
                    FROM emp
                    where ndep = 30)

--@block exercicio8
SELECT
FROM
where

