BEGIN;

/* Cria Base de Dados 'bd'
*/
DROP DATABASE IF EXISTS bd;
CREATE DATABASE bd;
USE bd;

/* Cria a tabela dos descontos
*/
DROP TABLE IF EXISTS descontos;

CREATE TABLE descontos
(escalao      smallint(2)	UNSIGNED AUTO_INCREMENT NOT NULL,
 salinf       int(7)      												NOT NULL,
 salsup       int(7)      												NOT NULL,

 PRIMARY KEY  (escalao)
) ENGINE=InnoDB;


/* Cria a tabela dos departamentos
 */
DROP TABLE IF EXISTS dep;

CREATE TABLE dep
(ndep         smallint(2)			UNSIGNED AUTO_INCREMENT NOT NULL, 
 nome         VARCHAR(15)   													NOT NULL,
 local        VARCHAR(15)   													NOT NULL,

 PRIMARY KEY (ndep)
) ENGINE=InnoDB;


/* Cria a tabela dos empregados
 */
DROP TABLE IF EXISTS emp;

CREATE TABLE emp
(nemp          int(4)      		UNSIGNED AUTO_INCREMENT	NOT NULL , 
 encar         int(4)      		UNSIGNED 								NULL,
 ndep          smallint(2)    UNSIGNED								NOT NULL, 
 nome          VARCHAR(20)   													NOT NULL, 
 funcao        VARCHAR(12)   													NOT	NULL, 
 data_entrada  DATE           												NOT NULL,                        
 sal           int(7)      		UNSIGNED 								NOT NULL,
 premios       int(7)      		DEFAULT NULL, 

 KEY EMP_EMP (encar),
 KEY EMP_DEP (ndep),

 FOREIGN KEY (encar) REFERENCES emp (nemp),
 FOREIGN KEY (ndep) REFERENCES dep (ndep),

 PRIMARY KEY (nemp)
) ENGINE=InnoDB;


/* Insere os departamentos
 */
DELETE FROM dep;

INSERT INTO dep VALUES (10, 'Contabilidade', 'Condeixa');
INSERT INTO dep VALUES (20, 'Investigação',  'Mealhada');
INSERT INTO dep VALUES (30, 'Vendas',        'Coimbra');
INSERT INTO dep VALUES (40, 'Planeamento',   'Montemor');

/* Insere os descontos
 */
DELETE FROM descontos;

INSERT INTO descontos VALUES (1,  55000,   99999);
INSERT INTO descontos VALUES (2, 100000,  210000);
INSERT INTO descontos VALUES (3, 210001,  350000);
INSERT INTO descontos VALUES (4, 350001,  550000);
INSERT INTO descontos VALUES (5, 550001, 9999999);

/* Insere os empregrados 
*/

DELETE FROM emp;

INSERT INTO emp (nemp, nome, funcao, encar, data_entrada, sal, premios, ndep) 
VALUES(1839, 'Jorge Sampaio',  'Presidente'  ,NULL, '1984.02.11', 890000,  NULL, 10);

INSERT INTO emp (nemp, nome, funcao, encar, data_entrada, sal, premios, ndep) 
VALUES(1566, 'Augusto Reis',   'Encarregado' ,1839, '1985.02.13', 450975,  NULL, 20);

INSERT INTO emp (nemp, nome, funcao, encar, data_entrada, sal, premios, ndep) 
VALUES(1698, 'Duarte Guedes',  'Encarregado' ,1839, '1991.11.25', 380850,  NULL, 30);

INSERT INTO emp (nemp, nome, funcao, encar, data_entrada, sal, premios, ndep) 
VALUES(1782, 'Silvia Teles',   'Encarregado' ,1839, '1986.11.03', 279450,  NULL, 10);

INSERT INTO emp (nemp, nome, funcao, encar, data_entrada, sal, premios, ndep) 
VALUES(1788, 'Maria Dias',     'Analista'  	 ,1566, '1982.11.07', 565000,  NULL, 20);

INSERT INTO emp (nemp, nome, funcao, encar, data_entrada, sal, premios, ndep) 
VALUES(1902, 'Catarina Silva', 'Analista'    ,1566, '1993.04.13', 435000,  NULL, 20);

INSERT INTO emp (nemp, nome, funcao, encar, data_entrada, sal, premios, ndep) 
VALUES(1499, 'Joana Mendes',   'Vendedor'    ,1698, '1984.10.04', 145600, 56300, 30);

INSERT INTO emp (nemp, nome, funcao, encar, data_entrada, sal, premios, ndep) 
VALUES(1521, 'Nelson Neves',   'Vendedor'    ,1698, '1983.02.27', 212250, 98500, 30);

INSERT INTO emp (nemp, nome, funcao, encar, data_entrada, sal, premios, ndep) 
VALUES(1654, 'Ana Rodrigues',  'Vendedor'    ,1698, '1990.12.17', 221250, 81400, 30);

INSERT INTO emp (nemp, nome, funcao, encar, data_entrada, sal, premios, ndep) 
VALUES(1844, 'Manuel Madeira', 'Vendedor'    ,1698, '1985.04.21', 157800,     0, 30);

INSERT INTO emp (nemp, nome, funcao, encar, data_entrada, sal, premios, ndep) 
VALUES(1900, 'Tome Ribeiro',   'Continuo'    ,1698, '1994.03.05',  56950,  NULL, 30);

INSERT INTO emp (nemp, nome, funcao, encar, data_entrada, sal, premios, ndep) 
VALUES(1876, 'Rita Pereira',   'Continuo'    ,1788, '1996.02.07', 65100,  NULL, 20);

INSERT INTO emp (nemp, nome, funcao, encar, data_entrada, sal, premios, ndep) 
VALUES(1934, 'Olga Costa',     'Continuo'    ,1782, '1986.06.22', 68300,  NULL, 10);

INSERT INTO emp (nemp, nome, funcao, encar, data_entrada, sal, premios, ndep) 
VALUES(1369, 'Antonio Silva',  'Continuo'    ,1902, '1996.12.22', 70800,  NULL, 20);

COMMIT;
