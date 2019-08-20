----Criar Tabelas Oracle
create table funcionarios 
(
matricula INT NOT NULL,
nome VARCHAR2(50) NOT NULL,
sobrenome VARCHAR2(100),
data_nasc DATE,
PRIMARY KEY(matricula)
)
--Criar Sequence Oracle
CREATE SEQUENCE matricula
START WITH 1
INCREMENT BY 1
NOCACHE

create table departamento
(
id_departamento integer,
nome_departamento varchar2(100),
matricula int not null,
foreign key (matricula) references funcionarios(matricula) 
);

CREATE SEQUENCE id_departamento
START WITH 1
INCREMENT BY 1
NOCACHE;

--Alterar Tabelas
ALTER TABLE funcionarios rename column genero to sexo;

--Comando select basico
select * from funcionarios

--Insert basico
insert all
--funcionarios(matricula,nome,sobrenome,data_nasc,sexo) values (1,'Bruno','Campos',to_date('1995-10-05','yyyy-mm-dd'),'m') 
into funcionarios(matricula,nome,sobrenome,data_nasc,sexo) values (2,'Maria','Campos',to_date('1995-10-05','yyyy-mm-dd'),'m') 
into funcionarios(matricula,nome,sobrenome,data_nasc,sexo) values (3,'Lourdes','Campos',to_date('1995-10-05','yyyy-mm-dd'),'m')
select * from dual;

insert into departamento(id_departamento,nome_departamento,matricula) values (id_departamento.nextval,'Financeiro',1)

select * from departamento

--Update de tabelas
update funcionarios
set sobrenome = 'Campos',
nome = 'Adalto'
where matricula = 2;

-------------------------- Order By -----------------------------
SELECT * FROM PRODUCT ORDER BY NAME DESC

---------------Funções de agregação(COUNT,SUM,AVG,MIN,MAX)------------------------
SELECT COUNT(ACCOUNT_ID) FROM ACCOUNT
SELECT COUNT(DISTINCT ACCOUNT_ID) FROM ACC_TRANSACTION
SELECT SUM(AVAIL_BALANCE) FROM ACCOUNT
SELECT SUM(AVAIL_BALANCE) FROM ACCOUNT WHERE CUST_ID = 1
SELECT AVG(AVAIL_BALANCE) FROM ACCOUNT WHERE PRODUCT_CD = 'SAV'
SELECT MIN(AVAIL_BALANCE) FROM ACCOUNT WHERE PRODUCT_CD = 'SAV'
SELECT MAX(AVAIL_BALANCE) FROM ACCOUNT WHERE PRODUCT_CD = 'SAV'
-------------------Group By------------------------------
SELECT PRODUCT_CD,COUNT(PRODUCT_CD),SUM(AVAIL_BALANCE),AVG(AVAIL_BALANCE) FROM ACCOUNT GROUP BY PRODUCT_CD
SELECT CUST_ID,COUNT(ACCOUNT_ID) FROM ACCOUNT WHERE CUST_ID = 1 GROUP BY CUST_ID
------------------HAVING------------------------------------
SELECT PRODUCT_CD,COUNT(PRODUCT_CD),SUM(AVAIL_BALANCE),AVG(AVAIL_BALANCE) FROM ACCOUNT GROUP BY PRODUCT_CD HAVING COUNT(PRODUCT_CD) > 3
SELECT PRODUCT_CD,COUNT(PRODUCT_CD),SUM(AVAIL_BALANCE),AVG(AVAIL_BALANCE) FROM ACCOUNT WHERE OPEN_BRANCH_ID = 1 GROUP BY PRODUCT_CD HAVING COUNT(PRODUCT_CD) > 1
---------------------INNER JOIN---------------------------------
SELECT EMP.FIRST_NAME,EMP.LAST_NAME,EMP.DEPT_ID,DEP.NAME FROM EMPLOYEE EMP
INNER JOIN DEPARTMENT DEP
ON EMP.DEPT_ID = DEP.DEPT_ID
------------------LEFT JOIN-------------------------------------
SELECT CUST.CUST_ID,CUST.STATE,CUST.FED_ID,OFC.CUST_ID,OFC.OFFICER_ID,OFC.START_DATE,OFC.TITLE FROM CUSTOMER CUST
LEFT JOIN OFFICER OFC
ON CUST.CUST_ID = OFC.CUST_ID
-------------RIGHT JOIN----------------------------------------
SELECT CUST.CUST_ID,CUST.STATE,CUST.FED_ID,OFC.CUST_ID,OFC.OFFICER_ID,OFC.START_DATE,OFC.TITLE FROM CUSTOMER CUST
RIGHT JOIN OFFICER OFC
ON CUST.CUST_ID = OFC.CUST_ID




