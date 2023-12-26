SELECT nome
FROM emp
WHERE sal = (SELECT max(sal)
            FROM emp)

--@block
SELECT d.nome
FROM dep d, emp e
WHERE e.ndep = d.ndep
GROUP BY d.ndep
HAVING count(*) >= ALL (SELECT count(*)
                        FROM emp
                        GROUP BY ndep)
