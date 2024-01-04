/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     04/01/2024 01:17:18                          */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_ENCOMEND_ENCOMENDA_FORNECED') then
    alter table ENCOMENDA
       delete foreign key FK_ENCOMEND_ENCOMENDA_FORNECED
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_ENCOMEND_FUNCIONAR_FUNCIONA') then
    alter table ENCOMENDA
       delete foreign key FK_ENCOMEND_FUNCIONAR_FUNCIONA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_LIVRO_AUTOR_LIV_AUTOR') then
    alter table LIVRO
       delete foreign key FK_LIVRO_AUTOR_LIV_AUTOR
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_LIVRO_LIVRO_MAT_MATERIAL') then
    alter table LIVRO
       delete foreign key FK_LIVRO_LIVRO_MAT_MATERIAL
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_LIVRO_UC_LIVRO_UNIDADE_') then
    alter table LIVRO
       delete foreign key FK_LIVRO_UC_LIVRO_UNIDADE_
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_MATERIAL_VENDA_MAT_VENDA') then
    alter table MATERIAL
       delete foreign key FK_MATERIAL_VENDA_MAT_VENDA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PROCESSO_APONTAMEN_APONTAME') then
    alter table PROCESSO_ENTREGA
       delete foreign key FK_PROCESSO_APONTAMEN_APONTAME
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PROCESSO_ENTREGUE__ESTUDANT') then
    alter table PROCESSO_ENTREGA
       delete foreign key FK_PROCESSO_ENTREGUE__ESTUDANT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_UC_APONT_UC_APONTA_UNIDADE_') then
    alter table UC_APONTAMENTO
       delete foreign key FK_UC_APONT_UC_APONTA_UNIDADE_
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_UC_APONT_UC_APONTA_APONTAME') then
    alter table UC_APONTAMENTO
       delete foreign key FK_UC_APONT_UC_APONTA_APONTAME
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_UNIDADE__UC_DOCENT_DOCENTES') then
    alter table UNIDADE_CURRICULAR
       delete foreign key FK_UNIDADE__UC_DOCENT_DOCENTES
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_VENDA_VENDA_FUN_FUNCIONA') then
    alter table VENDA
       delete foreign key FK_VENDA_VENDA_FUN_FUNCIONA
end if;

drop index if exists APONTAMENTOS.APONTAMENTOS_PK;

drop table if exists APONTAMENTOS;

drop index if exists AUTOR.AUTOR_PK;

drop table if exists AUTOR;

drop index if exists DOCENTES.DOCENTES_PK;

drop table if exists DOCENTES;

drop index if exists ENCOMENDA.ENCOMENDA_FORNECEDOR_FK;

drop index if exists ENCOMENDA.FUNCIONARIO_ENCOMENDA_FK;

drop index if exists ENCOMENDA.ENCOMENDA_PK;

drop table if exists ENCOMENDA;

drop index if exists ESTUDANTES.ESTUDANTES_PK;

drop table if exists ESTUDANTES;

drop index if exists FORNECEDOR.FORNECEDOR_PK;

drop table if exists FORNECEDOR;

drop index if exists FUNCIONARIO.FUNCIONARIO_PK;

drop table if exists FUNCIONARIO;

drop index if exists LIVRO.LIVRO_MATERIAL_FK;

drop index if exists LIVRO.AUTOR_LIVRO_FK;

drop index if exists LIVRO.UC_LIVRO_FK;

drop index if exists LIVRO.LIVRO_PK;

drop table if exists LIVRO;

drop index if exists MATERIAL.VENDA_MATERIAL_FK;

drop index if exists MATERIAL.MATERIAL_PK;

drop table if exists MATERIAL;

drop index if exists PROCESSO_ENTREGA.ENTREGUE_ESTUDANTE_FK;

drop index if exists PROCESSO_ENTREGA.APONTAMENTO_ENTREGUE_FK;

drop index if exists PROCESSO_ENTREGA.PROCESSO_ENTREGA_PK;

drop table if exists PROCESSO_ENTREGA;

drop index if exists UC_APONTAMENTO.UC_APONTAMENTO2_FK;

drop index if exists UC_APONTAMENTO.UC_APONTAMENTO_FK;

drop index if exists UC_APONTAMENTO.UC_APONTAMENTO_PK;

drop table if exists UC_APONTAMENTO;

drop index if exists UNIDADE_CURRICULAR.UC_DOCENTES_FK;

drop index if exists UNIDADE_CURRICULAR.UNIDADE_CURRICULAR_PK;

drop table if exists UNIDADE_CURRICULAR;

drop index if exists VENDA.VENDA_FUNCIONARIO_FK;

drop index if exists VENDA.VENDA_PK;

drop table if exists VENDA;

/*==============================================================*/
/* Table: APONTAMENTOS                                          */
/*==============================================================*/
create table APONTAMENTOS 
(
   ID_APONTAMENTOS      numeric(4)                     not null,
   AULA_TEORICA         smallint                       null,
   AULA_PRATICA         smallint                       null,
   FOLHA_EXERCICIOS     smallint                       null,
   OUTROS               char(50)                       null,
   PARTE_MODULO         numeric(3)                     null,
   constraint PK_APONTAMENTOS primary key (ID_APONTAMENTOS)
);

/*==============================================================*/
/* Index: APONTAMENTOS_PK                                       */
/*==============================================================*/
create unique index APONTAMENTOS_PK on APONTAMENTOS (
ID_APONTAMENTOS ASC
);

/*==============================================================*/
/* Table: AUTOR                                                 */
/*==============================================================*/
create table AUTOR 
(
   ID_AUTOR             numeric(5)                     not null,
   A_NOME               char(20)                       null,
   DATA_NASCIMENTO      date                           null,
   EMAIL_PESSOAL        varchar(50)                    null,
   INFOR_INSTIT         long varchar                   null,
   P_WEB                varchar(30)                    null,
   EMAIL_PROF           varchar(50)                    null,
   BIBLIOGRAFIA         long varchar                   null,
   MORADA_EDITOR        varchar(50)                    null,
   OBSERVACOES          long varchar                   null,
   FOTOGRAFIA           varchar(50)                    null,
   constraint PK_AUTOR primary key (ID_AUTOR)
);

/*==============================================================*/
/* Index: AUTOR_PK                                              */
/*==============================================================*/
create unique index AUTOR_PK on AUTOR (
ID_AUTOR ASC
);

/*==============================================================*/
/* Table: DOCENTES                                              */
/*==============================================================*/
create table DOCENTES 
(
   ID_DOCENTE           numeric(4)                     not null,
   D_NOME               char(20)                       null,
   N_DOCENTE            numeric(5)                     null,
   TELEFONE_DOCENTE     numeric(9)                     null,
   CATEGORIA_DOCENTE    char(10)                       null,
   GRAU_ACAD_DOCENTE    varchar(10)                    null,
   constraint PK_DOCENTES primary key (ID_DOCENTE)
);

/*==============================================================*/
/* Index: DOCENTES_PK                                           */
/*==============================================================*/
create unique index DOCENTES_PK on DOCENTES (
ID_DOCENTE ASC
);

/*==============================================================*/
/* Table: ENCOMENDA                                             */
/*==============================================================*/
create table ENCOMENDA 
(
   ID_ENCOMENDA         numeric(4)                     not null,
   ID_FUNCIONARIO       numeric(3)                     not null,
   ID_FORNECEDOR        numeric(4)                     not null,
   RECESSAO             smallint                       null,
   constraint PK_ENCOMENDA primary key (ID_ENCOMENDA)
);

/*==============================================================*/
/* Index: ENCOMENDA_PK                                          */
/*==============================================================*/
create unique index ENCOMENDA_PK on ENCOMENDA (
ID_ENCOMENDA ASC
);

/*==============================================================*/
/* Index: FUNCIONARIO_ENCOMENDA_FK                              */
/*==============================================================*/
create index FUNCIONARIO_ENCOMENDA_FK on ENCOMENDA (
ID_FUNCIONARIO ASC
);

/*==============================================================*/
/* Index: ENCOMENDA_FORNECEDOR_FK                               */
/*==============================================================*/
create index ENCOMENDA_FORNECEDOR_FK on ENCOMENDA (
ID_FORNECEDOR ASC
);

/*==============================================================*/
/* Table: ESTUDANTES                                            */
/*==============================================================*/
create table ESTUDANTES 
(
   ID_ESTUDANTE         numeric(5)                     not null,
   E_NOME               char(20)                       null,
   N_ESTUDANTE          numeric(5)                     null,
   EMAIL                varchar(50)                    null,
   TELEFONE_ESTUDANTE   numeric(9)                     null,
   MORADA_ESTUDANTE     varchar(50)                    null,
   constraint PK_ESTUDANTES primary key (ID_ESTUDANTE)
);

/*==============================================================*/
/* Index: ESTUDANTES_PK                                         */
/*==============================================================*/
create unique index ESTUDANTES_PK on ESTUDANTES (
ID_ESTUDANTE ASC
);

/*==============================================================*/
/* Table: FORNECEDOR                                            */
/*==============================================================*/
create table FORNECEDOR 
(
   ID_FORNECEDOR        numeric(4)                     not null,
   DESIGNACAO           char(20)                       null,
   MORADA               varchar(50)                    null,
   TELEFONE             numeric(9)                     null,
   NIF                  numeric(9)                     null,
   CATEGORIA            char(10)                       null,
   constraint PK_FORNECEDOR primary key (ID_FORNECEDOR)
);

/*==============================================================*/
/* Index: FORNECEDOR_PK                                         */
/*==============================================================*/
create unique index FORNECEDOR_PK on FORNECEDOR (
ID_FORNECEDOR ASC
);

/*==============================================================*/
/* Table: FUNCIONARIO                                           */
/*==============================================================*/
create table FUNCIONARIO 
(
   ID_FUNCIONARIO       numeric(3)                     not null,
   F_NOME               char(20)                       null,
   TELEFONE_FUNCIONARIO numeric(9)                     null,
   N_FUNCIONARIO        numeric(3)                     null,
   GRAU_ACADEMICO       varchar(10)                    null,
   SALARIO              decimal(4)                     null,
   DATA_CONTRATO        date                           null,
   ESCALAO              numeric(1)                     null,
   CATEGORIA_FUNCIONARIO char(10)                       null,
   constraint PK_FUNCIONARIO primary key (ID_FUNCIONARIO)
);

/*==============================================================*/
/* Index: FUNCIONARIO_PK                                        */
/*==============================================================*/
create unique index FUNCIONARIO_PK on FUNCIONARIO (
ID_FUNCIONARIO ASC
);

/*==============================================================*/
/* Table: LIVRO                                                 */
/*==============================================================*/
create table LIVRO 
(
   ID_LIVRO             numeric(5)                     not null,
   ID_MATERIAL          numeric(4)                     not null,
   ID_UC                numeric(4)                     null,
   ID_AUTOR             numeric(5)                     null,
   TITULO               char(20)                       null,
   EDITOR               char(20)                       null,
   AREA_CIENTIFICA      char(20)                       null,
   N_EDICAO             numeric(2)                     null,
   ISBN                 numeric(13)                    null,
   CUSTO_LIVRO          decimal(3,2)                   null,
   PRECO_LIVRO          decimal(3,2)                   null,
   RESUMO               long varchar                   null,
   N_PAGINAS            numeric(4)                     null,
   FORMATO              char(20)                       null,
   constraint PK_LIVRO primary key (ID_LIVRO)
);

/*==============================================================*/
/* Index: LIVRO_PK                                              */
/*==============================================================*/
create unique index LIVRO_PK on LIVRO (
ID_LIVRO ASC
);

/*==============================================================*/
/* Index: UC_LIVRO_FK                                           */
/*==============================================================*/
create index UC_LIVRO_FK on LIVRO (
ID_UC ASC
);

/*==============================================================*/
/* Index: AUTOR_LIVRO_FK                                        */
/*==============================================================*/
create index AUTOR_LIVRO_FK on LIVRO (
ID_AUTOR ASC
);

/*==============================================================*/
/* Index: LIVRO_MATERIAL_FK                                     */
/*==============================================================*/
create index LIVRO_MATERIAL_FK on LIVRO (
ID_MATERIAL ASC
);

/*==============================================================*/
/* Table: MATERIAL                                              */
/*==============================================================*/
create table MATERIAL 
(
   ID_MATERIAL          numeric(4)                     not null,
   ID_VENDA             numeric(4)                     not null,
   COD_INTERNO          numeric(4)                     null,
   COD_FABRICANTE       numeric(4)                     null,
   STOCK                numeric(4)                     null,
   PRECO_MATERIAL       decimal(3,2)                   null,
   CUSTO_MATERIAL       decimal(3,2)                   null,
   FABRICANTE           char(20)                       null,
   LOCALIZACAO          char(20)                       null,
   CATEGORIA_MATERIAL   char(10)                       null,
   DESIGNACAO_MATERIA   char(20)                       null,
   constraint PK_MATERIAL primary key (ID_MATERIAL)
);

/*==============================================================*/
/* Index: MATERIAL_PK                                           */
/*==============================================================*/
create unique index MATERIAL_PK on MATERIAL (
ID_MATERIAL ASC
);

/*==============================================================*/
/* Index: VENDA_MATERIAL_FK                                     */
/*==============================================================*/
create index VENDA_MATERIAL_FK on MATERIAL (
ID_VENDA ASC
);

/*==============================================================*/
/* Table: PROCESSO_ENTREGA                                      */
/*==============================================================*/
create table PROCESSO_ENTREGA 
(
   ID_APONTAMENTOS      numeric(4)                     not null,
   ID_ESTUDANTE         numeric(5)                     not null,
   ID_ENTREGA           numeric(4)                     not null,
   DATA_POC_ENTREGA     date                           null,
   constraint PK_PROCESSO_ENTREGA primary key (ID_APONTAMENTOS, ID_ESTUDANTE, ID_ENTREGA)
);

/*==============================================================*/
/* Index: PROCESSO_ENTREGA_PK                                   */
/*==============================================================*/
create unique index PROCESSO_ENTREGA_PK on PROCESSO_ENTREGA (
ID_APONTAMENTOS ASC,
ID_ESTUDANTE ASC,
ID_ENTREGA ASC
);

/*==============================================================*/
/* Index: APONTAMENTO_ENTREGUE_FK                               */
/*==============================================================*/
create index APONTAMENTO_ENTREGUE_FK on PROCESSO_ENTREGA (
ID_APONTAMENTOS ASC
);

/*==============================================================*/
/* Index: ENTREGUE_ESTUDANTE_FK                                 */
/*==============================================================*/
create index ENTREGUE_ESTUDANTE_FK on PROCESSO_ENTREGA (
ID_ESTUDANTE ASC
);

/*==============================================================*/
/* Table: UC_APONTAMENTO                                        */
/*==============================================================*/
create table UC_APONTAMENTO 
(
   ID_UC                numeric(4)                     not null,
   ID_APONTAMENTOS      numeric(4)                     not null,
   constraint PK_UC_APONTAMENTO primary key clustered (ID_UC, ID_APONTAMENTOS)
);

/*==============================================================*/
/* Index: UC_APONTAMENTO_PK                                     */
/*==============================================================*/
create unique clustered index UC_APONTAMENTO_PK on UC_APONTAMENTO (
ID_UC ASC,
ID_APONTAMENTOS ASC
);

/*==============================================================*/
/* Index: UC_APONTAMENTO_FK                                     */
/*==============================================================*/
create index UC_APONTAMENTO_FK on UC_APONTAMENTO (
ID_UC ASC
);

/*==============================================================*/
/* Index: UC_APONTAMENTO2_FK                                    */
/*==============================================================*/
create index UC_APONTAMENTO2_FK on UC_APONTAMENTO (
ID_APONTAMENTOS ASC
);

/*==============================================================*/
/* Table: UNIDADE_CURRICULAR                                    */
/*==============================================================*/
create table UNIDADE_CURRICULAR 
(
   ID_UC                numeric(4)                     not null,
   ID_DOCENTE           numeric(4)                     null,
   UC_NOME              char(20)                       null,
   SIGLA                char(5)                        null,
   CURSO                char(50)                       null,
   ANO_CURSO            numeric(1)                     null,
   SEMESTRE             numeric(1)                     null,
   ECTS                 numeric(2)                     null,
   constraint PK_UNIDADE_CURRICULAR primary key (ID_UC)
);

/*==============================================================*/
/* Index: UNIDADE_CURRICULAR_PK                                 */
/*==============================================================*/
create unique index UNIDADE_CURRICULAR_PK on UNIDADE_CURRICULAR (
ID_UC ASC
);

/*==============================================================*/
/* Index: UC_DOCENTES_FK                                        */
/*==============================================================*/
create index UC_DOCENTES_FK on UNIDADE_CURRICULAR (
ID_DOCENTE ASC
);

/*==============================================================*/
/* Table: VENDA                                                 */
/*==============================================================*/
create table VENDA 
(
   ID_VENDA             numeric(4)                     not null,
   ID_FUNCIONARIO       numeric(3)                     not null,
   PAGAMENTO            char(20)                       null,
   DATA_VENDA           date                           null,
   PRECO_VENDA          decimal(3,2)                   null,
   constraint PK_VENDA primary key (ID_VENDA)
);

/*==============================================================*/
/* Index: VENDA_PK                                              */
/*==============================================================*/
create unique index VENDA_PK on VENDA (
ID_VENDA ASC
);

/*==============================================================*/
/* Index: VENDA_FUNCIONARIO_FK                                  */
/*==============================================================*/
create index VENDA_FUNCIONARIO_FK on VENDA (
ID_FUNCIONARIO ASC
);

alter table ENCOMENDA
   add constraint FK_ENCOMEND_ENCOMENDA_FORNECED foreign key (ID_FORNECEDOR)
      references FORNECEDOR (ID_FORNECEDOR)
      on update restrict
      on delete restrict;

alter table ENCOMENDA
   add constraint FK_ENCOMEND_FUNCIONAR_FUNCIONA foreign key (ID_FUNCIONARIO)
      references FUNCIONARIO (ID_FUNCIONARIO)
      on update restrict
      on delete restrict;

alter table LIVRO
   add constraint FK_LIVRO_AUTOR_LIV_AUTOR foreign key (ID_AUTOR)
      references AUTOR (ID_AUTOR)
      on update restrict
      on delete restrict;

alter table LIVRO
   add constraint FK_LIVRO_LIVRO_MAT_MATERIAL foreign key (ID_MATERIAL)
      references MATERIAL (ID_MATERIAL)
      on update restrict
      on delete restrict;

alter table LIVRO
   add constraint FK_LIVRO_UC_LIVRO_UNIDADE_ foreign key (ID_UC)
      references UNIDADE_CURRICULAR (ID_UC)
      on update restrict
      on delete restrict;

alter table MATERIAL
   add constraint FK_MATERIAL_VENDA_MAT_VENDA foreign key (ID_VENDA)
      references VENDA (ID_VENDA)
      on update restrict
      on delete restrict;

alter table PROCESSO_ENTREGA
   add constraint FK_PROCESSO_APONTAMEN_APONTAME foreign key (ID_APONTAMENTOS)
      references APONTAMENTOS (ID_APONTAMENTOS)
      on update restrict
      on delete restrict;

alter table PROCESSO_ENTREGA
   add constraint FK_PROCESSO_ENTREGUE__ESTUDANT foreign key (ID_ESTUDANTE)
      references ESTUDANTES (ID_ESTUDANTE)
      on update restrict
      on delete restrict;

alter table UC_APONTAMENTO
   add constraint FK_UC_APONT_UC_APONTA_UNIDADE_ foreign key (ID_UC)
      references UNIDADE_CURRICULAR (ID_UC)
      on update restrict
      on delete restrict;

alter table UC_APONTAMENTO
   add constraint FK_UC_APONT_UC_APONTA_APONTAME foreign key (ID_APONTAMENTOS)
      references APONTAMENTOS (ID_APONTAMENTOS)
      on update restrict
      on delete restrict;

alter table UNIDADE_CURRICULAR
   add constraint FK_UNIDADE__UC_DOCENT_DOCENTES foreign key (ID_DOCENTE)
      references DOCENTES (ID_DOCENTE)
      on update restrict
      on delete restrict;

alter table VENDA
   add constraint FK_VENDA_VENDA_FUN_FUNCIONA foreign key (ID_FUNCIONARIO)
      references FUNCIONARIO (ID_FUNCIONARIO)
      on update restrict
      on delete restrict;

