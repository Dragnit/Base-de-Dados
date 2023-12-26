SELECT nome
FROM emp e
WHERE sal = (SELECT max(sal)
            FROM emp
            WHERE ndep = e.ndep)

--@block
SELECT nome, e.ndep, sal_max
FROM emp e, (SELECT ndep, MAX(sal) as 'sal_max'
                from emp
                GROUP BY ndep) s
WHERE e.ndep = s.ndep