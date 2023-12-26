/* 0 */

CREATE TABLE emp2
(nemp int(4) PRIMARY KEY,
encar int(4),
ndep smallint(2) UNSIGNED NOT NULL,
nome VARCHAR(20) NOT NULL CHECK (nome = UPPER(nome)),
funcao VARCHAR(12),
data_entrada DATE,
sal int(7) CHECK (SAL > 70000),
premios int(7) DEFAULT NULL,
KEY EMP_EMP (encar),
KEY EMP_DEP (ndep),
FOREIGN KEY (encar) REFERENCES emp2 (nemp),
FOREIGN KEY (ndep) REFERENCES dep (ndep)
) ENGINE=InnoDB;

--@block exercicio 1
INSERT INTO emp2 (nemp, nome, funcao, encar, data_entrada, sal, premios, ndep)
VALUES (5555, ‘CHICO FININHO’, ‘Cantor’, null, SYSDATE(), 100000, null, 40);

--@block /* Versão alternativa 1 - NUNCA USAR */
INSERT INTO emp2 
VALUES (5555, ‘CHICO FININHO’, ‘Cantor’, null, SYSDATE(), 100000, null, 40);

--@block /* Versão alternativa 2 */
INSERT INTO emp2 (nemp, nome, funcao,  data_entrada, sal,  ndep)
VALUES (5555, ‘CHICO FININHO’, ‘Cantor’, SYSDATE(), 100000, 40);

--@block exercicio 2
SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO emp2 (nemp, nome, funcao, encar, data_entrada, sal, premios, ndep)
select nemp, UPPER(nome), funcao, encar, data_entrada, if(sal>70001, 70001, sal), premios, ndep
from emp 
where nemo not in (1902, 1369)

SET FOREIGN_KEY_CHECKS = 1;

--@block exercicio 3
DELETE from emp2
where ndep = 10

--@block exercicio 4

DELETE from emp2
where nemp = 1654

--@block exercicio 5

DELETE from emp2
where sal < (select avg(sal)
                from emp e
                where ndep = e.ndep)

--@block exercicio 6

DELETE from emp2

SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO emp2 (nemp, nome, funcao, encar, data_entrada, sal, premios, ndep)
select nemp, UPPER(nome), funcao, encar, data_entrada, if(sal>70001, 70001, sal), premios, ndep
from emp 

SET FOREIGN_KEY_CHECKS = 1;

UPDATE emp2 e
SET sal = (SELECT avg(sal)*1.1
            from emp
            where ndep = e.ndep),
    premios = (SELECT avg(premios)*1.5
                from emp
                where ndep = e.ndep),
    ndep = (if(ndep = 40, 40, ndep+10))
where sal != (select max(sal)
                from emp
                where ndep = e.ndep)

--@block exercicio 7

UPDATE emp2
set funcao = concat( substr(funcao, 1, 4), '. Senior' )
where DATEDIFF(SYSDATE, data_entrada) > 20*365

--@block exercicio 8

UPDATE emp2
set data_entrada = (date_sub(SYSDATE(), interval 1 year))
where nome like 'A%'
and ndep in (10, 30)
and premios is not null
and funcao != 'Presidente'

--@block exercicio 9

UPDATE emp2
SET premios = if(DATEDIFF(SYSDATE, data_entrada) > 25*365, 5000, 
                if(DATEDIFF(SYSDATE, data_entrada) > 20*365, 3000)
                if(DATEDIFF(SYSDATE, data_entrada) > 15*365, 2000)
                if(DATEDIFF(SYSDATE, data_entrada) > 10*365), 500)

--@block exercicio 10

UPDATE emp2 e
set sal = 1.1*(select avg(sal)
                from emp
                where ndep = e.ndep)
where sal < (select avg(sal)
                from emp
                where ndep = e.ndep)

--@block exercicio 11

UPDATE emp2 e
set premios = sal*0.1
where premios is null 
and sal != (select max(sal)
            from emp
            where ndep = e.ndep)

--@block exercicio 11.1

UPDATE emp2
set premios = sal*0.1
where premios is null 
and (sal, ndep) != (select max(sal), ndep
                    from emp
                    group by ndep)

--@block exercicio 12

UPDATE emp2 e
set premios = (select max(sal) - min  (sal)
                from emp
                where ndep = e.ndep)
where premios is null 
and sal < (select avg(sal)
            from emp
            where ndep = e.ndep)