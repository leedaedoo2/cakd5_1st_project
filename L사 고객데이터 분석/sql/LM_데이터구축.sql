alter table purprod add month number;
update purprod set year = substr(��������,5,2);


UPDATE ;  

CREATE TABLE RECENCY AS
SELECT ����ȣ, TO_DATE('2015-01-01','YYYY-MM-DD')- TO_DATE(MAX(��������),'YYYY-MM-DD') AS RECENCY
FROM PURPROD WHERE �������� < 20150101
GROUP BY ����ȣ
ORDER BY RECENCY DESC;

select ����ȣ, count(��������)
from purprod where ��������<20150101
GROUP BY ����ȣ;



alter table datadd3 drop column ����з�;\

alter table datadd3 add �ݱ� number(2);

update datadd3 set �ݱ� = 1 where �б� = 2 or �б� = 1;
update datadd3 set �ݱ� = 2 where �б� = 3 or �б� = 4;
update datadd3 set �ݱ� = 3 where �б� = 5 or �б� = 6;
update datadd3 set �ݱ� = 4 where �б� = 7 or �б� = 8;
commit;


insert into datadd3 
select p2.����з� 
from prodcl p2;



from datadd3 p1, prodcl p2 where p1.���޻� = p2.���޻� and 
p1.��з��ڵ� = p2.��з��ڵ� and p1.�ߺз��ڵ� = p2.�ߺз��ڵ� and p1.�Һз��ڵ� = p2.�Һз��ڵ�;



drop table pur_area31;

CREATE TABLE PUR_AREA31 AS SELECT custdemo.����ȣ,
COUNT(CASE WHEN �ݱ� = 1 THEN custdemo.����ȣ END) "14�� ��ݱ� ���ŰǼ�", 
COUNT(CASE WHEN �ݱ� = 2 THEN custdemo.����ȣ END) "14�� �Ϲݱ� ���ŰǼ�", 
COUNT(CASE WHEN �ݱ� = 3 THEN custdemo.����ȣ END) "15�� ��ݱ� ���ŰǼ�", 
COUNT(CASE WHEN �ݱ� = 4 THEN custdemo.����ȣ END) "15�� �Ϲݱ� ���ŰǼ�", 
SUM(CASE WHEN �ݱ� = 1 THEN ���űݾ� END) "14�� ��ݱ� �����Ѿ�",
SUM(CASE WHEN �ݱ� = 2 THEN ���űݾ� END) "14�� �Ϲݱ� �����Ѿ�",
SUM(CASE WHEN �ݱ� = 3 THEN ���űݾ� END) "15�� ��ݱ� �����Ѿ�",
SUM(CASE WHEN �ݱ� = 4 THEN ���űݾ� END) "15�� �Ϲݱ� �����Ѿ�" FROM datadd3
LEFT OUTER JOIN custdemo ON datadd3.����ȣ = custdemo.����ȣ where custdemo.����='F'
GROUP BY custdemo.����ȣ;

update pur_area31 set "14�� ��ݱ� ���ŰǼ�" = 1 where "14�� ��ݱ� ���ŰǼ�" > 0;
update pur_area31 set "14�� �Ϲݱ� ���ŰǼ�" = 1 where "14�� �Ϲݱ� ���ŰǼ�" > 0;
update pur_area31 set "15�� ��ݱ� ���ŰǼ�" = 1 where "15�� ��ݱ� ���ŰǼ�" > 0;
update pur_area31 set "15�� �Ϲݱ� ���ŰǼ�" = 1 where "15�� �Ϲݱ� ���ŰǼ�" > 0;

select * from purcust3;

drop table ��Ż��;

create table ������ as
select * from pur_area31 where "14�� ��ݱ� ���ŰǼ�"=1 and
"14�� �Ϲݱ� ���ŰǼ�"=1 and "15�� ��ݱ� ���ŰǼ�"=1 and "15�� �Ϲݱ� ���ŰǼ�"=1;


alter table pur_area31 add ���з��ڵ� number(10);
update pur_area31 set "���з��ڵ�" = "14�� ��ݱ� ���ŰǼ�"*1000 + "14�� �Ϲݱ� ���ŰǼ�"*100 + "15�� ��ݱ� ���ŰǼ�"*10 + "15�� �Ϲݱ� ���ŰǼ�";

select * from ������;

create table �ű԰� as
select * from pur_area31 where "���з��ڵ�" = 10 or "���з��ڵ�" = 1 or "���з��ڵ�"= 11;

create table ��Ż�� as
select * from pur_area31 where "���з��ڵ�" = 1000 or "���з��ڵ�" = 1100 or "���з��ڵ�" = 1110 or "���з��ڵ�" = 1010 or "���з��ڵ�"=100 or "���з��ڵ�" = 110;


--create table �������������� as
select d.����ȣ, d.���޻�, d.����, d.���ɴ�, d.���űݾ�, d.��������, d.�б� ,pl.����з� from datadd3 d
inner join prodcl pl on pl.���޻� = d.���޻� and pl.����ȣ = d.����ȣ
where "����ȣ" in (select ����ȣ from ������);

create table �������������� as
select d.����ȣ, d.���޻�, d.����, d.���ɴ�, d.���űݾ�, d.��������, pl.����з�, d.�б� 
from datadd3 d , prodcl pl where "����ȣ" in (select ����ȣ from ������);

select �б�,����з�, sum(���űݾ�), count(*) from �������������� group by �б�, ����з� order by ����з�,  �б�;
commit;

create table �ű԰��������� as
select d.����ȣ, d.���޻�, d.����, d.���ɴ�, d.���űݾ�, d.��������, pl.����з�, d.�б� 
from datadd3 d , prodcl pl where D.���޻�= PL.���޻� ;

select �б�, sum(���űݾ�),count(*) from �ű԰��������� group by �б� order by �б�;
commit;

create table ��Ż���������� as
select d.����ȣ, d.���޻�, d.����, d.���ɴ�, d.���űݾ�, d.��������, pl.����з�, d.�б� 
from datadd3 d , prodcl pl where "����ȣ" in (select ����ȣ from ��Ż��);

select �б�, sum(���űݾ�),count(*) from ��Ż���������� group by �б� order by �б�;
commit;

DROP TABLE �ű԰���������;

alter table ������ add "14�⵵�ѱ��ž�" number(20);
alter table ������ add "15�⵵�ѱ��ž�" number(20);

update ������ set "14�⵵�ѱ��ž�" = "14�� ��ݱ� �����Ѿ�"+"14�� �Ϲݱ� �����Ѿ�";
update ������ set "15�⵵�ѱ��ž�" = "15�� ��ݱ� �����Ѿ�"+"15�� �Ϲݱ� �����Ѿ�";

SELECT COUNT(*) FROM PUR_AREA32;
WHERE NOT "15�⵵�ѱ��ž�"<"14�⵵�ѱ��ž�";

SELECT count(*) from �ű԰���������;

select ����з�,�б�,sum(���űݾ�)�ѱ��ž�
from �ű԰���������
group by ����з�,�б�
order by �ѱ��ž� desc;

create view �������Ұ�_�⵵���� as
select a.����ȣ,a."14�⵵�ѱ��ž�",a."15�⵵�ѱ��ž�",d.�ݱ�
from ������ a,datadd3 d
where "15�⵵�ѱ��ž�"<"14�⵵�ѱ��ž�" ;

create table �������Ұ�_�������� as
select d.���޻�, d.���ɴ�, d.���űݾ�, d.��������, pl.����з�, d.�б� 
from datadd3 d , prodcl pl where ����ȣ in (select ����ȣ from �������Ұ�_�⵵���� where "����"='F');

drop table ������_���Ұ�;

select �б�, ����з�, sum(���űݾ�) from �������Ұ�_�������� group by �б�, ����з� order by ����з�, �б�;

select "14�⵵�ѱ��ž�",�ݱ� from �������Ұ�_�⵵���� order by  "14�⵵�ѱ��ž�" desc;


SELECT "14�� ��ݱ� �����Ѿ�","14�� �Ϲݱ� �����Ѿ�","15�� ��ݱ� �����Ѿ�","15�� �Ϲݱ� �����Ѿ�", "14�⵵�ѱ��ž�","15�⵵�ѱ��ž�"
FROM ������;

CREATE VIEW ����������
AS select d.���޻�, d.���ɴ�, d.���űݾ�, d.��������, pl.����з�, d.�б� 
from datadd3 d , prodcl pl where ����ȣ in (select ����ȣ from �������Ұ�_�⵵���� where "����"='F');

SELECT �ݱ�,"14�⵵�ѱ��ž�" 
FROM DATADD3 
WHERE �ݱ�=4;



CREATE TABLE ������_���Ұ� AS
SELECT A.����ȣ, D.���޻�,D.���ɴ�,D.��������,D.�ݱ�,B.����з�,A."14�⵵�ѱ��ž�",A."15�⵵�ѱ��ž�"
FROM ������ A, DATADD3 D, PRODCL B
WHERE "14�� ��ݱ� �����Ѿ�"*1.126>"15�� �Ϲݱ� �����Ѿ�" AND A.����ȣ=D.����ȣ AND B.���޻�=D.���޻� AND
B.��з��ڵ�= D.��з��ڵ� AND B.�ߺз��ڵ�= D.�ߺз��ڵ� AND B.�Һз��ڵ�= D.�Һз��ڵ�
GROUP BY A.����ȣ, D.���޻�,D.���ɴ�,D.��������,D.�ݱ�,B.����з�,A."14�⵵�ѱ��ž�",A."15�⵵�ѱ��ž�";

SELECT  
 SUM(SUM("14�� ��ݱ� �����Ѿ�")) OVER(partition by "14�� ��ݱ� �����Ѿ�" order by "14�� ��ݱ� �����Ѿ�" desc) AS ��ݱ�14,
 SUM(SUM("14�� �Ϲݱ� �����Ѿ�")) OVER(partition by "14�� �Ϲݱ� �����Ѿ�" order by "14�� �Ϲݱ� �����Ѿ�" desc) AS �Ϲݱ�14,
SUM(SUM("15�� ��ݱ� �����Ѿ�")) OVER(partition by "15�� ��ݱ� �����Ѿ�" order by "15�� ��ݱ� �����Ѿ�" desc) AS ��ݱ�15,
SUM(SUM("15�� �Ϲݱ� �����Ѿ�")) OVER(partition by "15�� �Ϲݱ� �����Ѿ�" order by "15�� �Ϲݱ� �����Ѿ�"desc) AS �Ϲݱ�15
FROM ������ 
group by  "14�� ��ݱ� �����Ѿ�","14�� �Ϲݱ� �����Ѿ�","15�� ��ݱ� �����Ѿ�","15�� �Ϲݱ� �����Ѿ�";


sELECT sum("15�� ��ݱ� �����Ѿ�")gk�ݱ�14
--sum("14�� �Ϲݱ� �����Ѿ�")�Ϲݱ�14,
--sum("15�� ��ݱ� �����Ѿ�")��ݱ�15,sum("15�� �Ϲݱ� �����Ѿ�")�Ϲݱ�15
FROM ������ ;
--group by  "14�� ��ݱ� �����Ѿ�";

SELECT * FROM ������_���Ұ�;
SELECT ����з�,SUM("14�⵵�ѱ��ž�"),SUM("15�⵵�ѱ��ž�"),
ROUND(RATIO_TO_REPORT(SUM(("15�⵵�ѱ��ž�"-"14�⵵�ѱ��ž�")/"14�⵵�ѱ��ž�")) OVER (),2)*100 ||'% 'AS PERCENTAGE
FROM ������_���Ұ�
GROUP BY ����з�;

select ��������,sum("14�⵵�ѱ��ž�")�ѱ���14,sum("15�⵵�ѱ��ž�")
from ������_���Ұ�
group by ��������
order by �ѱ���14 desc;





ALTER TABLE ������_���Ұ� DROP (��з�);

ALTER TABLE ������_���Ұ� ADD ��з� VARCHAR2(50);

UPDATE ������_���Ұ� SET ��з� ='�񳻱���' WHERE
����з� = '��ǰ' OR ����з� = '��Ȱ' OR ����з� = '�ü�' OR ����з� = 'ȭ��ǰ' OR ����з� = '��ȭ' ;   

UPDATE ������_���Ұ� SET ��з� ='�س�����' WHERE
����з� = '�Ƿ�' OR ����з� = '�Ǽ��縮' OR ����з� = '������_����' OR ����з� = '�Ƶ�' OR ����з� = '��ȭ' ;   

UPDATE ������_���Ұ� SET ��з� ='������' WHERE
����з� = '����' OR ����з� = '������ǰ';
COMMIT;



CREATE TABLE ����� AS
SELECT PERCENTILE_DISC(0.25) WITHIN GROUP ( ORDER BY "14�⵵�ѱ��ž�"+"15�⵵�ѱ��ž�") AS Q1,
PERCENTILE_DISC(0.75) WITHIN GROUP (ORDER BY "14�⵵�ѱ��ž�"+"15�⵵�ѱ��ž�") AS Q3,
PERCENTILE_DISC(0.75) WITHIN GROUP (ORDER BY "14�⵵�ѱ��ž�"+"15�⵵�ѱ��ž�")
-PERCENTILE_DISC(0.25) WITHIN GROUP ( ORDER BY "14�⵵�ѱ��ž�"+"15�⵵�ѱ��ž�") AS IQR
FROM ������_���Ұ�_����;

CREATE TABLE ������_���Ұ�_�̻�ġ���� AS
SELECT r.* from ������_���Ұ�_���� r, ����� s
where  r."14�⵵�ѱ��ž�"+"15�⵵�ѱ��ž�" > (s.q1-1.5*iqr) and
r."14�⵵�ѱ��ž�"+"15�⵵�ѱ��ž�" <(s.q3+1.5*iqr);


drop table ������_���Ұ�_�̻�ġ����;
select * from ������_���Ұ�_�̻�ġ���� ;

select * from ������_���Ұ�_�̻�ġ���� where ����ȣ =17667;




create table ��ǰ as
select a.����ȣ,b."14�� ��ݱ� �����Ѿ�",b."14�� �Ϲݱ� �����Ѿ�",b."15�� ��ݱ� �����Ѿ�",b."15�� �Ϲݱ� �����Ѿ�",a."�ݱ�"
from ������_���Ұ�_�̻�ġ���� a,������ b
where a.����з�='��ǰ' and a.����ȣ =b.����ȣ;

drop table purprod;

create table ��ǰ_�з� as
select ����ȣ,"14�� ��ݱ� �����Ѿ�","14�� �Ϲݱ� �����Ѿ�","15�� ��ݱ� �����Ѿ�","15�� �Ϲݱ� �����Ѿ�",
width_bucket("14�� ��ݱ� �����Ѿ�",59583,68211952,5)��14�� ,
 width_bucket("14�� �Ϲݱ� �����Ѿ�",5695,46133853,5)��14��,
 width_bucket("15�� ��ݱ� �����Ѿ�",7000,60671404,5)��15�� ,
 width_bucket("15�� �Ϲݱ� �����Ѿ�",2859,32400627,5)��15�� 
from ��ǰ group by ����ȣ,"14�� ��ݱ� �����Ѿ�","14�� �Ϲݱ� �����Ѿ�","15�� ��ݱ� �����Ѿ�","15�� �Ϲݱ� �����Ѿ�";

select min("15�� �Ϲݱ� �����Ѿ�")
from ��ǰ;
select count(*)
from ��ǰ_�з� where ��15��=1;
select count(*)
from ��ǰ_�з� where ��14��=5;



drop table ������_���Ұ�_����;
select max("15�� �Ϲݱ� �����Ѿ�")
from ��ǰ;

select count(*) from ������_���Ұ�_����;


create table ������_���Ұ�_���� as 
select a.����ȣ,a."14�⵵�ѱ��ž�",a."15�⵵�ѱ��ž�",a."14�� ��ݱ� �����Ѿ�",a."14�� �Ϲݱ� �����Ѿ�",a."15�� ��ݱ� �����Ѿ�",
a."15�� �Ϲݱ� �����Ѿ�"
from ������ a
where  a."14�� ��ݱ� �����Ѿ�"*1.126>a."15�� �Ϲݱ� �����Ѿ�"  
group by a.����ȣ,a."14�⵵�ѱ��ž�",a."15�⵵�ѱ��ž�",a."14�� ��ݱ� �����Ѿ�",a."14�� �Ϲݱ� �����Ѿ�",a."15�� ��ݱ� �����Ѿ�",
a."15�� �Ϲݱ� �����Ѿ�"
order by a."14�⵵�ѱ��ž�",a."15�⵵�ѱ��ž�";

select count(*) from ������_���Ұ�_�̻�ġ����;
select * from ������_���Ұ�  where ����ȣ=15756;
drop table ������_���Ұ�_����;


alter table ������_���� add ��ǰ_1F number(20);

update �������Ұ�_�⵵���� t1 set t1.��ǰ_1 = 
(select sum(t2.���űݾ�) from �������Ұ�_�������� t2 Where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 1 and t2.����з� ='��ǰ');
alter table ������_���� add ��ǰ_��1 number(20);




update ������_���� set ��ǰ_1F = sum("14�� ��ݱ� ���ŰǼ�")  WHERE EXISTS SELECT 
FROM ��������_�������� T2, ������_���� T1 WHERE  T2.����з� ='��ǰ'



DROP TABLE ;

SELECT R.* FROM ������_���� R
FULL OUTER JOIN ��������_�������� P ON P.����ȣ = R.����ȣ;


--create table ��������_�������� as
select D.����ȣ, P.����з�, D.�ݱ� 
from DATADD3 D 
inner join PRODCL P where "����ȣ" in (select ����ȣ from ������) AND
D.���޻� =P.���޻�
GROUP BY D.����ȣ, P.����з�, D.�ݱ� ;

CREATE TEMPORARY TABLESPACE temp01 TEMPFILE '/app/oracle/temp01.dbf' size 5600M;
alter tablespace LOG_SPACE add datafile '/u02/oradata/log_space2.dbf' size 1024M;
alter database datafile '/oracle_db/oradata/XE/TEMP01.dbf' autoextend on;

update ������_���� T1 set T1.��ǰ_1F = (SELECT SUM(T1."14�� ��ݱ� ���ŰǼ�") FROM ������_���� T1,
DATADD3 D WHERE D.����ȣ = T1.����ȣ AND D.�ݱ� = 1 AND 
WHERE T1.����ȣ = T2.����ȣ;

CREATE TEMPORARY TABLESPACE TEMP2

    TEMPFILE 'D:\oracle_db\oradata\XE\TEMP2.DBF' SIZE 500M REUSE

    AUTOEXTEND ON NEXT 100M MAXSIZE unlimited

    EXTENT MANAGEMENT LOCAL UNIFORM SIZE 1M;

DROP  TABLE ������_����;

create table ������_���� as
select R.����ȣ, R."14�� ��ݱ� ���ŰǼ�",  R."14�� �Ϲݱ� ���ŰǼ�", R."15�� ��ݱ� ���ŰǼ�",  R."15�� �Ϲݱ� ���ŰǼ�",
R."14�� ��ݱ� �����Ѿ�",  R."14�� �Ϲݱ� �����Ѿ�", R."15�� ��ݱ� �����Ѿ�",  R."15�� �Ϲݱ� �����Ѿ�"
from ������ R
where R."14�� ��ݱ� �����Ѿ�"*1.126 >R."15�� �Ϲݱ� �����Ѿ�"
GROUP BY R.����ȣ, R."14�� ��ݱ� ���ŰǼ�",  R."14�� �Ϲݱ� ���ŰǼ�", R."15�� ��ݱ� ���ŰǼ�",  R."15�� �Ϲݱ� ���ŰǼ�",
R."14�� ��ݱ� �����Ѿ�",  R."14�� �Ϲݱ� �����Ѿ�", R."15�� ��ݱ� �����Ѿ�",  R."15�� �Ϲݱ� �����Ѿ�";

SELECT COUNT(*) FROM ������_���� ;


create table ���Ұ�_���� as
select R.����ȣ,P.����з�, D.����,D.��������,D.�ð�,D.���ɴ�
from ������ R,PRODCL P, DATADD3 D
WHERE D.���޻� = P.���޻� AND D.��з��ڵ� = P.��з��ڵ� AND D.�ߺз��ڵ� = P.�ߺз��ڵ� AND D.�Һз��ڵ� = P.�Һз��ڵ�
AND R.����ȣ = D.����ȣ
GROUP BY R.����ȣ,P.����з�,D.����,D.��������,D.�ð�,D.���ɴ�;

DROP TABLE ��������_��������;
ALTER TABLE ���Ұ�_���� ADD ��ǰ1_F NUMBER(10);

UPDATE ���Ұ�_���� T1 SET T1.��ǰ1_F = (SELECT SUM(T2."14�� ��ݱ� ���ŰǼ�") FROM ������_���� T2
WHERE  T1.����з�='��ǰ' AND T1.����ȣ =T2.����ȣ);
COMMIT;
update �������Ұ�_�⵵���� t1 set t1.��ǰ_1 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 
where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 1 and t2.����з� ='��ǰ');

WHERE T2.����ȣ =T1.����ȣ AND T2.����з�='��ǰ';

select count(*) from rfm;


select datadd3.����ȣ,prodcl.�ߺз���
from datadd3, prodcl
group by datadd3.����ȣ,prodcl.�ߺз���;




MERGE 
 INTO ����_���� A
USING DATADD3 D
   ON (A.����ȣ = D.����ȣ AND A.����=D.���� AND A.���ɴ� = D.���ɴ� AND A.�������� = D.��������)
 WHEN MATCHED THEN
      UPDATE 
         SET A.���Žð� = D.��������;
        
ALTER TABLE ����_���� ADD �������� NUMBER(20);
ALTER TABLE ����_���� DROP COLUMN ��������;
INSERT INTO ����_����(��������) SELECT �������� FROM DATADD3 WHERE DATADD3.����ȣ =����_����.����ȣ;

UPDATE ����_���� A
SET A.�������� = (SELECT A.�������� FROM DATADD3 D WHERE 
A.����ȣ = D.����ȣ AND A.����=D.���� AND A.���ɴ� = D.���ɴ� AND A.�������� = D.�������� AND  ROWNUM = 1);

update �������Ұ�_�⵵���� t1 set t1.��ǰ_1 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 
where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 1 and t2.����з� ='��ǰ');
--RECENCY 

CREATE TABLE FREQ AS
SELECT D.����ȣ,
(TO_DATE('2016-01-01','YYYY-MM-DD') -TO_DATE(MAX(D.��������),'YYYY-MM-DD')) AS RECENT
FROM DATADD3 D, ����_���� R
WHERE R.����ȣ = D.����ȣ AND R.����=D.���� AND R.���ɴ� = D.���ɴ� AND R.�������� = D.��������
GROUP BY D.����ȣ;

SELECT RECENT FROM FREQ WHERE RECENT>365;


CREATE  TABLE REQUENCY AS
--SELECT * FROM FREQ  OUTER JOIN ����_���� ON ����_����.����ȣ = FREQ.����ȣ;
SELECT * FROM FREQ  OUTER JOIN ����_���� USING(����ȣ);
 
 DROP TABLE REQUENCY;
 SELECT * FROM REQUENCY WHERE RECENT>370;
 SELECT TO_DATE('2016-01-01','YYYY-MM-DD') -TO_DATE(MAX(D.��������),'YYYY-MM-DD')
 FROM FREQ WHERE ;
 
 
 create table new_freq as
 select d.����ȣ,p. ����з�, count(d.��������)�� 
 from prodcl_2 p, datadd3 d
 where p.���޻� = d.���޻� and p.��з��ڵ� = d.��з��ڵ� and p.�ߺз��ڵ� =d.�ߺз��ڵ� and p.�Һз��ڵ� = d.�Һз��ڵ�
 and d."����ȣ" in (select ����ȣ from ����_����)
 group by d.����ȣ,p.����з�;
 
 drop table new_freq;
CREATE TABLE NEW_FREQ AS 
select d.����ȣ, count(d.��������)�� , p.����з�
from prodcl_2 p, datadd3 d
where p.���޻� = d.���޻� and p.��з��ڵ� = d.��з��ڵ� and p.�ߺз��ڵ� =d.�ߺз��ڵ� and p.�Һз��ڵ� = d.�Һз��ڵ�
and d."����ȣ" in (select ����ȣ from ����_����)
 group by d.����ȣ,p.����з�
 ;
 
 select ����з�,count(*)��,round(ratio_to_report(count(*)) over(),2) *100 || '%' as ratio from prodcl_2  group by ����з� order by �� desc;
 
drop table prodcl;
select * from new_frm3;

create table new_frm3 as
select r.* , q."14�� ��ݱ� �����Ѿ�",q."14�� �Ϲݱ� �����Ѿ�",q."15�� ��ݱ� �����Ѿ�",q."15�� �Ϲݱ� �����Ѿ�"
from new_freq r, ����_���� q
where r.����ȣ = q.����ȣ ;

create table new_rfm3 as
select r.* , q.req
from new_frm3 r, freq q
where r.����ȣ = q.����ȣ;