alter table purprod add year number;
update purprod set year = substr(��������,1,4);

alter table purprod add month number;
update purprod set year = substr(��������,5,2);

select c.����ȣ, p.���޻�, p.��з��ڵ�, p.�ߺз��ڵ�, p.�Һз��ڵ�, p.��������, c.����, c.���ɴ�, c.��������, p.year, p.month from purprod p, custdemo c where p.����ȣ = c.����ȣ;

alter table purcust add �б� number(2);

update purprod set �б� = 1 where year = 2014 and month in (1,2,3);
update purprod set �б� = 2 where year = 2014 and month in (4,5,6);
update purprod set �б� = 3 where year = 2014 and month in (7,8,9);
update purprod set �б� = 4 where year = 2014 and month in (10,11,12);

update purprod set �б� = 5 where year = 2015 and month in (1,2,3);
update purprod set �б� = 6 where year = 2015 and month in (4,5,6);
update purprod set �б� = 7 where year = 2015 and month in (7,8,9);
update purprod set �б� = 8 where year = 2015 and month in (10,11,12);

create table purcust2 as
select ����ȣ, ���޻�, ��з��ڵ�, �ߺз��ڵ�, �Һз��ڵ�, ����, ���ɴ�, ��������, ���űݾ�, �б�
from purcust;

update purcust2 set ���űݾ� = ���űݾ�/0.944 where "�б�" = 1;
update purcust2 set ���űݾ� = ���űݾ�/0.976 where "�б�" = 2;
update purcust2 set ���űݾ� = ���űݾ�/0.908 where "�б�" = 3;
update purcust2 set ���űݾ� = ���űݾ�/1.172 where "�б�" = 4;
update purcust2 set ���űݾ� = ���űݾ�/0.972 where "�б�" = 5;
update purcust2 set ���űݾ� = ���űݾ�/0.976 where "�б�" = 6;
update purcust2 set ���űݾ� = ���űݾ�/0.916 where "�б�" = 7;
update purcust2 set ���űݾ� = ���űݾ�/1.136 where "�б�" = 8;

select �б�, sum(���űݾ�) from purcust2 group by �б� order by �б�;
commit;

alter table purcust2 add �ݱ� number(2);

update purcust2 set �ݱ� = 1 where �б� = 2 or �б� = 1;
update purcust2 set �ݱ� = 2 where �б� = 3 or �б� = 4;
update purcust2 set �ݱ� = 3 where �б� = 5 or �б� = 6;
update purcust2 set �ݱ� = 4 where �б� = 7 or �б� = 8;
commit;

create table purcust3 as
select p1.����ȣ, p1.���޻�, p1.����, p1.���ɴ�, p1.���űݾ�, p1.��������, p1.�б�,p1.�ݱ�, p2.����з� from purcust2 p1, prodcl p2 where p1.���޻� = p2.���޻� and p1.��з��ڵ� = p2.��з��ڵ� and p1.�ߺз��ڵ� = p2.�ߺз��ڵ� and p1.�Һз��ڵ� = p2.�Һз��ڵ�;

select ����з�, sum(���űݾ�) from purcust3 group by ����з�;

select �б�, ����з�, sum(���űݾ�) from purcust3 group by �б�, ����з� order by ����з�, �б�;

select ����з�, round(count(*) * 100.0 / sum(count(*)) over (),2) as ratio from purcust3 group by ����з� order by ratio;

create table purcust4 as
select a.����ȣ, a.����, a.���ɴ�, a.��������, a."14�⵵_��ݱ�",a."14�⵵_�Ϲݱ�",a."15�⵵_��ݱ�",a."15�⵵_�Ϲݱ�",  b."14�� ��ݱ� �����Ѿ�",b."14�� �Ϲݱ� �����Ѿ�", b."15�� ��ݱ� �����Ѿ�", b."15�� �Ϲݱ� �����Ѿ�"  from custdemo a, pur_area31 b where a.����ȣ = b.����ȣ;

CREATE TABLE PUR_AREA31 AS SELECT custdemo.����ȣ,
COUNT(CASE WHEN �ݱ� = 1 THEN custdemo.����ȣ END) "14�� ��ݱ� ���ŰǼ�", 
COUNT(CASE WHEN �ݱ� = 2 THEN custdemo.����ȣ END) "14�� �Ϲݱ� ���ŰǼ�", 
COUNT(CASE WHEN �ݱ� = 3 THEN custdemo.����ȣ END) "15�� ��ݱ� ���ŰǼ�", 
COUNT(CASE WHEN �ݱ� = 4 THEN custdemo.����ȣ END) "15�� �Ϲݱ� ���ŰǼ�", 
SUM(CASE WHEN �ݱ� = 1 THEN ���űݾ� END) "14�� ��ݱ� �����Ѿ�",
SUM(CASE WHEN �ݱ� = 2 THEN ���űݾ� END) "14�� �Ϲݱ� �����Ѿ�",
SUM(CASE WHEN �ݱ� = 3 THEN ���űݾ� END) "15�� ��ݱ� �����Ѿ�",
SUM(CASE WHEN �ݱ� = 4 THEN ���űݾ� END) "15�� �Ϲݱ� �����Ѿ�" FROM PURCUST3
LEFT OUTER JOIN custdemo ON PURCUST3.����ȣ = custdemo.����ȣ
GROUP BY custdemo.����ȣ;

update pur_area31 set "14�� ��ݱ� ���ŰǼ�" = 1 where "14�� ��ݱ� ���ŰǼ�" > 0;
update pur_area31 set "14�� �Ϲݱ� ���ŰǼ�" = 1 where "14�� �Ϲݱ� ���ŰǼ�" > 0;
update pur_area31 set "15�� ��ݱ� ���ŰǼ�" = 1 where "15�� ��ݱ� ���ŰǼ�" > 0;
update pur_area31 set "15�� �Ϲݱ� ���ŰǼ�" = 1 where "15�� �Ϲݱ� ���ŰǼ�" > 0;

create table ������ as
select * from pur_area31 where "14�� ��ݱ� ���ŰǼ�"=1 and "14�� �Ϲݱ� ���ŰǼ�"=1 and "15�� ��ݱ� ���ŰǼ�"=1 and "15�� �Ϲݱ� ���ŰǼ�"=1;

alter table pur_area31 add ���з��ڵ� number(10);

update pur_area31 set "���з��ڵ�" = "14�� ��ݱ� ���ŰǼ�"*1000 + "14�� �Ϲݱ� ���ŰǼ�"*100 + "15�� ��ݱ� ���ŰǼ�"*10 + "15�� �Ϲݱ� ���ŰǼ�";

create table �ű԰� as
select * from pur_area31 where "���з��ڵ�" = 10 or "���з��ڵ�" = 1 or "���з��ڵ�"= 11;

create table ��Ż�� as
select * from pur_area31 where "���з��ڵ�" = 1000 or "���з��ڵ�" = 1100 or "���з��ڵ�" = 1110 or "���з��ڵ�" = 1010 or "���з��ڵ�"=100 or "���з��ڵ�" = 110;

select count(*) from ������;

select count(*) from �ű԰�;

select count(*) from ��Ż��;

select "���з��ڵ�", count(*) from pur_area31 group by "���з��ڵ�";

--  ������ ������ Ž��
create table �������������� as
select ����ȣ, ���޻�, ����, ���ɴ�, ���űݾ�, ��������, ����з�, �б� from purcust3 where "����ȣ" in (select ����ȣ from ������);

select �б�, sum(���űݾ�) from �������������� group by �б� order by �б�;

select ����з�, sum(���űݾ�) �ѱ��ž� from �������������� group by ����з� order by �ѱ��ž� desc;

select �б�,����з�, sum(���űݾ�), count(*) from �������������� group by �б�, ����з� order by ����з�,  �б�;
commit;

create table �ű԰��������� as
select ����ȣ, ���޻�, ����, ���ɴ�, ���űݾ�, ��������, ����з�, �б� from purcust3 where "����ȣ" in (select ����ȣ from �ű԰�);

select �б�, sum(���űݾ�),count(*) from �ű԰��������� group by �б� order by �б�;
commit;

create table ��Ż���������� as
select ����ȣ, ���޻�, ����, ���ɴ�, ���űݾ�, ��������, ����з�, �б� from purcust3 where "����ȣ" in (select ����ȣ from ��Ż��);

select �б�, sum(���űݾ�),count(*) from ��Ż���������� group by �б� order by �б�;
commit;
create table ������2 as
select a.����ȣ,c.����,c.���ɴ�,c.��������, a."14�� ��ݱ� �����Ѿ�", a."14�� �Ϲݱ� �����Ѿ�",a."15�� ��ݱ� �����Ѿ�",a."15�� �Ϲݱ� �����Ѿ�" from ������ a, custdemo c where a.����ȣ = c.����ȣ;

create table �ű԰�2 as
select a.����ȣ,c.����,c.���ɴ�,c.��������, a."14�� ��ݱ� �����Ѿ�", a."14�� �Ϲݱ� �����Ѿ�",a."15�� ��ݱ� �����Ѿ�",a."15�� �Ϲݱ� �����Ѿ�" from �ű԰� a, custdemo c where a.����ȣ = c.����ȣ;

create table ��Ż��2 as
select a.����ȣ,c.����,c.���ɴ�,c.��������, a."14�� ��ݱ� �����Ѿ�", a."14�� �Ϲݱ� �����Ѿ�",a."15�� ��ݱ� �����Ѿ�",a."15�� �Ϲݱ� �����Ѿ�" from ��Ż�� a, custdemo c where a.����ȣ = c.����ȣ;

alter table ������2 add "14�⵵�ѱ��ž�" number(20);
alter table ������2 add "15�⵵�ѱ��ž�" number(20);

update ������2 set "14�⵵�ѱ��ž�" = "14�� ��ݱ� �����Ѿ�"+"14�� �Ϲݱ� �����Ѿ�";
update ������2 set "15�⵵�ѱ��ž�" = "15�� ��ݱ� �����Ѿ�"+"15�� �Ϲݱ� �����Ѿ�";

select count(*) from ������2 where ���� = 'F';

select count(*) from �ű԰�2 where ���� = 'F';

select count(*) from ��Ż��2 where ���� = 'F';


create table �������Ұ�_�⵵���� as
select * from ������2 where "15�⵵�ѱ��ž�"<"14�⵵�ѱ��ž�";

select count(*) from �������Ұ�_�⵵���� where "����"='F';
create table �������Ұ�_�������� as
select * from purcust3 where ����ȣ in (select ����ȣ from �������Ұ�_�⵵���� where "����"='F');

select �б�, ����з�, sum(���űݾ�) from �������Ұ�_�������� group by �б�, ����з� order by ����з�, �б�;