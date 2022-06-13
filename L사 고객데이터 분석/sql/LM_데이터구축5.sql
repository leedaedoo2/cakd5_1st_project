select �Һ���з�, count(*) from purcust4 group by �Һ���з�;

create table �ݱ⺰���ž� as
select ������ȣ,
SUM(CASE WHEN �ݱ� = 1 THEN ���űݾ� END) "y14_1",
SUM(CASE WHEN �ݱ� = 2 THEN ���űݾ� END) "y14_2",
SUM(CASE WHEN �ݱ� = 3 THEN ���űݾ� END) "y15_1",
SUM(CASE WHEN �ݱ� = 4 THEN ���űݾ� END) "y15_2", 
SUM(CASE WHEN �ݱ� = 1 and "�Һ���з�"='����ǰ' THEN ���űݾ� END) "����ǰ_1",
SUM(CASE WHEN �ݱ� = 2 and "�Һ���з�"='����ǰ' THEN ���űݾ� END) "����ǰ_2",
SUM(CASE WHEN �ݱ� = 3 and "�Һ���з�"='����ǰ' THEN ���űݾ� END) "����ǰ_3",
SUM(CASE WHEN �ݱ� = 4 and "�Һ���з�"='����ǰ' THEN ���űݾ� END) "����ǰ_4",
SUM(CASE WHEN �ݱ� = 1 and "�Һ���з�"='����ǰ' THEN ���űݾ� END) "����ǰ_1",
SUM(CASE WHEN �ݱ� = 2 and "�Һ���з�"='����ǰ' THEN ���űݾ� END) "����ǰ_2",
SUM(CASE WHEN �ݱ� = 3 and "�Һ���з�"='����ǰ' THEN ���űݾ� END) "����ǰ_3",
SUM(CASE WHEN �ݱ� = 4 and "�Һ���з�"='����ǰ' THEN ���űݾ� END) "����ǰ_4",
SUM(CASE WHEN �ݱ� = 1 and "�Һ���з�"='����ǰ' THEN ���űݾ� END) "����ǰ_1",
SUM(CASE WHEN �ݱ� = 2 and "�Һ���з�"='����ǰ' THEN ���űݾ� END) "����ǰ_2",
SUM(CASE WHEN �ݱ� = 3 and "�Һ���з�"='����ǰ' THEN ���űݾ� END) "����ǰ_3",
SUM(CASE WHEN �ݱ� = 4 and "�Һ���з�"='����ǰ' THEN ���űݾ� END) "����ǰ_4",
SUM(CASE WHEN �ݱ� = 1 and "�Һ���з�"='��Ÿ' THEN ���űݾ� END) "��Ÿ_1",
SUM(CASE WHEN �ݱ� = 2 and "�Һ���з�"='��Ÿ' THEN ���űݾ� END) "��Ÿ_2",
SUM(CASE WHEN �ݱ� = 3 and "�Һ���з�"='��Ÿ' THEN ���űݾ� END) "��Ÿ_3",
SUM(CASE WHEN �ݱ� = 4 and "�Һ���з�"='��Ÿ' THEN ���űݾ� END) "��Ÿ_4"
FROM PURCUST4
group by ������ȣ
order by ������ȣ;

commit;

select count(*) from custdemo;

create table ���޻纰�ݱⱸ�ž� as
select ������ȣ,
SUM(CASE WHEN �ݱ� = 1 and ���޻� = 'A' THEN ���űݾ� END) "A_1",
SUM(CASE WHEN �ݱ� = 2 and ���޻� = 'A' THEN ���űݾ� END) "A_2",
SUM(CASE WHEN �ݱ� = 3 and ���޻� = 'A' THEN ���űݾ� END) "A_3",
SUM(CASE WHEN �ݱ� = 4 and ���޻� = 'A' THEN ���űݾ� END) "A_4",
SUM(CASE WHEN �ݱ� = 1 and ���޻� = 'B' THEN ���űݾ� END) "B_1",
SUM(CASE WHEN �ݱ� = 2 and ���޻� = 'B' THEN ���űݾ� END) "B_2",
SUM(CASE WHEN �ݱ� = 3 and ���޻� = 'B' THEN ���űݾ� END) "B_3",
SUM(CASE WHEN �ݱ� = 4 and ���޻� = 'B' THEN ���űݾ� END) "B_4",
SUM(CASE WHEN �ݱ� = 1 and ���޻� = 'C' THEN ���űݾ� END) "C_1",
SUM(CASE WHEN �ݱ� = 2 and ���޻� = 'C' THEN ���űݾ� END) "C_2",
SUM(CASE WHEN �ݱ� = 3 and ���޻� = 'C' THEN ���űݾ� END) "C_3",
SUM(CASE WHEN �ݱ� = 4 and ���޻� = 'C' THEN ���űݾ� END) "C_4",
SUM(CASE WHEN �ݱ� = 1 and ���޻� = 'D' THEN ���űݾ� END) "D_1",
SUM(CASE WHEN �ݱ� = 2 and ���޻� = 'D' THEN ���űݾ� END) "D_2",
SUM(CASE WHEN �ݱ� = 3 and ���޻� = 'D' THEN ���űݾ� END) "D_3",
SUM(CASE WHEN �ݱ� = 4 and ���޻� = 'D' THEN ���űݾ� END) "D_4"
from purcust4
group by "������ȣ"
order by "������ȣ";

select round(avg(���űݾ�)) from purcust4;

commit;
create table prodcost as
select �Һз��ڵ�, min(���űݾ�) ��ǰ�⺻�ݾ� from purprod group by �Һз��ڵ� order by �Һз��ڵ�;
create table prodcost2 as
select �Һз��ڵ�, ��ǰ�⺻�ݾ�, rank() over (order by ��ǰ�⺻�ݾ� desc) �⺻�ݾ׼��� from prodcost;

select count(*) from prodcost2;

alter table prodcost2 add �ݾ׵�� number(2);

update prodcost2 set �ݾ׵�� = 1 where ��ǰ�⺻�ݾ� >= 50000;
update prodcost2 set �ݾ׵�� = 2 where ��ǰ�⺻�ݾ� < 50000 and ��ǰ�⺻�ݾ�>=10000;
update prodcost2 set �ݾ׵�� = 3 where ��ǰ�⺻�ݾ� < 10000;

select * from prodcl where "�Һз��ڵ�" in (select �Һз��ڵ� from prodcost2 where �ݾ׵�� = 1);



select ������ȣ,
SUM(CASE WHEN �ݱ� = 1 and �ݾ׵�� = 1 THEN ���űݾ� END) "����_1",
SUM(CASE WHEN �ݱ� = 2 and �ݾ׵�� = 1 THEN ���űݾ� END) "����_2",
SUM(CASE WHEN �ݱ� = 3 and �ݾ׵�� = 1 THEN ���űݾ� END) "����_3",
SUM(CASE WHEN �ݱ� = 4 and �ݾ׵�� = 1 THEN ���űݾ� END) "����_4",
SUM(CASE WHEN �ݱ� = 1 and �ݾ׵�� = 2 THEN ���űݾ� END) "�߰�_1",
SUM(CASE WHEN �ݱ� = 2 and �ݾ׵�� = 2 THEN ���űݾ� END) "�߰�_2",
SUM(CASE WHEN �ݱ� = 3 and �ݾ׵�� = 2 THEN ���űݾ� END) "�߰�_3",
SUM(CASE WHEN �ݱ� = 4 and �ݾ׵�� = 2 THEN ���űݾ� END) "�߰�_4",
SUM(CASE WHEN �ݱ� = 1 and �ݾ׵�� = 3 THEN ���űݾ� END) "����_1",
SUM(CASE WHEN �ݱ� = 2 and �ݾ׵�� = 3 THEN ���űݾ� END) "����_2",
SUM(CASE WHEN �ݱ� = 3 and �ݾ׵�� = 3 THEN ���űݾ� END) "����_3",
SUM(CASE WHEN �ݱ� = 4 and �ݾ׵�� = 3 THEN ���űݾ� END) "����_4"
from purcust4
group by ������ȣ
order by ������ȣ;

select ����ʸ�, count(*) from membership group by ����ʸ�;

select ����з�, count(*) from prodcl group by "����з�";
commit;
create table ����з����ݱⱸ�ž� as
select ������ȣ,
SUM(CASE WHEN �ݱ� = 1 and ����з� = '������ǰ' THEN ���űݾ� END) "������ǰ_1",
SUM(CASE WHEN �ݱ� = 2 and ����з� = '������ǰ' THEN ���űݾ� END) "������ǰ_2",
SUM(CASE WHEN �ݱ� = 3 and ����з� = '������ǰ' THEN ���űݾ� END) "������ǰ_3",
SUM(CASE WHEN �ݱ� = 4 and ����з� = '������ǰ' THEN ���űݾ� END) "������ǰ_4",
SUM(CASE WHEN �ݱ� = 1 and ����з� = '�ż���ǰ' THEN ���űݾ� END) "�ż���ǰ_1",
SUM(CASE WHEN �ݱ� = 2 and ����з� = '�ż���ǰ' THEN ���űݾ� END) "�ż���ǰ_2",
SUM(CASE WHEN �ݱ� = 3 and ����з� = '�ż���ǰ' THEN ���űݾ� END) "�ż���ǰ_3",
SUM(CASE WHEN �ݱ� = 4 and ����з� = '�ż���ǰ' THEN ���űݾ� END) "�ż���ǰ_4",
SUM(CASE WHEN �ݱ� = 1 and ����з� = '�ϻ��ǰ' THEN ���űݾ� END) "�ϻ��ǰ_1",
SUM(CASE WHEN �ݱ� = 2 and ����з� = '�ϻ��ǰ' THEN ���űݾ� END) "�ϻ��ǰ_2",
SUM(CASE WHEN �ݱ� = 3 and ����з� = '�ϻ��ǰ' THEN ���űݾ� END) "�ϻ��ǰ_3",
SUM(CASE WHEN �ݱ� = 4 and ����з� = '�ϻ��ǰ' THEN ���űݾ� END) "�ϻ��ǰ_4",
SUM(CASE WHEN �ݱ� = 1 and ����з� = '�Ƿ�' THEN ���űݾ� END) "�Ƿ�_1",
SUM(CASE WHEN �ݱ� = 2 and ����з� = '�Ƿ�' THEN ���űݾ� END) "�Ƿ�_2",
SUM(CASE WHEN �ݱ� = 3 and ����з� = '�Ƿ�' THEN ���űݾ� END) "�Ƿ�_3",
SUM(CASE WHEN �ݱ� = 4 and ����з� = '�Ƿ�' THEN ���űݾ� END) "�Ƿ�_4",
SUM(CASE WHEN �ݱ� = 1 and ����з� = '�м���ȭ' THEN ���űݾ� END) "�м���ȭ_1",
SUM(CASE WHEN �ݱ� = 2 and ����з� = '�м���ȭ' THEN ���űݾ� END) "�м���ȭ_2",
SUM(CASE WHEN �ݱ� = 3 and ����з� = '�м���ȭ' THEN ���űݾ� END) "�м���ȭ_3",
SUM(CASE WHEN �ݱ� = 4 and ����з� = '�м���ȭ' THEN ���űݾ� END) "�м���ȭ_4",
SUM(CASE WHEN �ݱ� = 1 and ����з� = '����������/����' THEN ���űݾ� END) "����������/����_1",
SUM(CASE WHEN �ݱ� = 2 and ����з� = '����������/����' THEN ���űݾ� END) "����������/����_2",
SUM(CASE WHEN �ݱ� = 3 and ����з� = '����������/����' THEN ���űݾ� END) "����������/����_3",
SUM(CASE WHEN �ݱ� = 4 and ����з� = '����������/����' THEN ���űݾ� END) "����������/����_4",
SUM(CASE WHEN �ݱ� = 1 and ����з� = '������/����' THEN ���űݾ� END) "������/����_1",
SUM(CASE WHEN �ݱ� = 2 and ����з� = '������/����' THEN ���űݾ� END) "������/����_2",
SUM(CASE WHEN �ݱ� = 3 and ����з� = '������/����' THEN ���űݾ� END) "������/����_3",
SUM(CASE WHEN �ݱ� = 4 and ����з� = '������/����' THEN ���űݾ� END) "������/����_4",
SUM(CASE WHEN �ݱ� = 1 and ����з� = '����/��ȭ��ǰ' THEN ���űݾ� END) "����/��ȭ��ǰ_1",
SUM(CASE WHEN �ݱ� = 2 and ����з� = '����/��ȭ��ǰ' THEN ���űݾ� END) "����/��ȭ��ǰ_2",
SUM(CASE WHEN �ݱ� = 3 and ����з� = '����/��ȭ��ǰ' THEN ���űݾ� END) "����/��ȭ��ǰ_3",
SUM(CASE WHEN �ݱ� = 4 and ����з� = '����/��ȭ��ǰ' THEN ���űݾ� END) "����/��ȭ��ǰ_4",
SUM(CASE WHEN �ݱ� = 1 and ����з� = '����/���׸���' THEN ���űݾ� END) "����/���׸���_1",
SUM(CASE WHEN �ݱ� = 2 and ����з� = '����/���׸���' THEN ���űݾ� END) "����/���׸���_2",
SUM(CASE WHEN �ݱ� = 3 and ����з� = '����/���׸���' THEN ���űݾ� END) "����/���׸���_3",
SUM(CASE WHEN �ݱ� = 4 and ����з� = '����/���׸���' THEN ���űݾ� END) "����/���׸���_4",
SUM(CASE WHEN �ݱ� = 1 and ����з� = '�ü�' THEN ���űݾ� END) "�ü�_1",
SUM(CASE WHEN �ݱ� = 2 and ����з� = '�ü�' THEN ���űݾ� END) "�ü�_2",
SUM(CASE WHEN �ݱ� = 3 and ����з� = '�ü�' THEN ���űݾ� END) "�ü�_3",
SUM(CASE WHEN �ݱ� = 4 and ����з� = '�ü�' THEN ���űݾ� END) "�ü�_4",
SUM(CASE WHEN �ݱ� = 1 and ����з� = '�Ǿ�ǰ/�Ƿ���' THEN ���űݾ� END) "�Ǿ�ǰ/�Ƿ���_1",
SUM(CASE WHEN �ݱ� = 2 and ����з� = '�Ǿ�ǰ/�Ƿ���' THEN ���űݾ� END) "�Ǿ�ǰ/�Ƿ���_2",
SUM(CASE WHEN �ݱ� = 3 and ����з� = '�Ǿ�ǰ/�Ƿ���' THEN ���űݾ� END) "�Ǿ�ǰ/�Ƿ���_3",
SUM(CASE WHEN �ݱ� = 4 and ����з� = '�Ǿ�ǰ/�Ƿ���' THEN ���űݾ� END) "�Ǿ�ǰ/�Ƿ���_4"
from purcust4
group by "������ȣ"
order by "������ȣ";

create table �ݱ⺰�����ָ����ž� as
select ������ȣ,
SUM(CASE WHEN �ݱ� = 1 and ����_�ָ� = '����' THEN ���űݾ� END) "����_1",
SUM(CASE WHEN �ݱ� = 2 and ����_�ָ� = '����' THEN ���űݾ� END) "����_2",
SUM(CASE WHEN �ݱ� = 3 and ����_�ָ� = '����' THEN ���űݾ� END) "����_3",
SUM(CASE WHEN �ݱ� = 4 and ����_�ָ� = '����' THEN ���űݾ� END) "����_4",
SUM(CASE WHEN �ݱ� = 1 and ����_�ָ� = '�ָ�' THEN ���űݾ� END) "�ָ�_1",
SUM(CASE WHEN �ݱ� = 2 and ����_�ָ� = '�ָ�' THEN ���űݾ� END) "�ָ�_2",
SUM(CASE WHEN �ݱ� = 3 and ����_�ָ� = '�ָ�' THEN ���űݾ� END) "�ָ�_3",
SUM(CASE WHEN �ݱ� = 4 and ����_�ָ� = '�ָ�' THEN ���űݾ� END) "�ָ�_4"

from purcust4
group by ������ȣ
order by ������ȣ;

commit;
ALTER TABLE c0 ALTER COLUMN ������ȣ varchar(5);

alter table purcust4 add ���ŵ�� varchar(10);
update purcust4 set ���ŵ�� = '����' where ���űݾ� > 2*23678;
update purcust4 set ���ŵ�� = '�߰�' where ���űݾ� <= 2*23678 and ���űݾ� > 0.5*23678;
update purcust4 set ���ŵ�� = '����' where ���űݾ� <= 0.5*23678;

create table c0_new as
select to_char(������ȣ) ������ȣ from c0;

update c0_new set ������ȣ = concat('0000',������ȣ) where length(������ȣ) = 1;
update c0_new set ������ȣ = concat('000',������ȣ) where length(������ȣ) = 2;
update c0_new set ������ȣ = concat('00',������ȣ) where length(������ȣ) = 3;
update c0_new set ������ȣ = concat('0',������ȣ) where length(������ȣ) = 4;


create table c1_new as
select to_char(������ȣ) ������ȣ from c1;

update c1_new set ������ȣ = concat('0000',������ȣ) where length(������ȣ) = 1;
update c1_new set ������ȣ = concat('000',������ȣ) where length(������ȣ) = 2;
update c1_new set ������ȣ = concat('00',������ȣ) where length(������ȣ) = 3;
update c1_new set ������ȣ = concat('0',������ȣ) where length(������ȣ) = 4;

create table c2_new as
select to_char(������ȣ) ������ȣ from c2;

update c2_new set ������ȣ = concat('0000',������ȣ) where length(������ȣ) = 1;
update c2_new set ������ȣ = concat('000',������ȣ) where length(������ȣ) = 2;
update c2_new set ������ȣ = concat('00',������ȣ) where length(������ȣ) = 3;
update c2_new set ������ȣ = concat('0',������ȣ) where length(������ȣ) = 4;


select ������ȣ from c0_new order by ������ȣ;
select ������ȣ from c1_new order by ������ȣ;
select ������ȣ from c2_new order by ������ȣ;


select * from purcust4 where ������ȣ in (select ������ȣ from c0_new) order by ������ȣ;
select * from channel where ������ȣ in (select ������ȣ from c0_new) order by ������ȣ;
select count(*) from channel where ������ȣ in (select ������ȣ from c0_new);
select ���޻�, count(���޻�) from channel where ������ȣ in (select ������ȣ from c0_new) group by ���޻�;
select ���޻�, count(���޻�) from channel where ������ȣ in (select ������ȣ from c1_new) group by ���޻�;
select ���޻�, count(���޻�) from channel where ������ȣ in (select ������ȣ from c2_new) group by ���޻�;

select ���ŵ��, count(���ŵ��) from purcust4 where ������ȣ in (select ������ȣ from c0_new) group by ���ŵ��;
select ���ŵ��, count(���ŵ��) from purcust4 where ������ȣ in (select ������ȣ from c1_new) group by ���ŵ��;
select ���ŵ��, count(���ŵ��) from purcust4 where ������ȣ in (select ������ȣ from c2_new) group by ���ŵ��;

select ���ɴ�, count(���ɴ�), round(ratio_to_report(count(���ɴ�)) over (),3 )  as ���� from purcust4 where ������ȣ in (select ������ȣ from c0_new) group by ���ɴ� order by ���� desc;
select ���ɴ�, count(���ɴ�), round(ratio_to_report(count(���ɴ�)) over (),3 )  as ���� from purcust4 where ������ȣ in (select ������ȣ from c1_new) group by ���ɴ� order by ���� desc;
select ���ɴ�, count(���ɴ�), round(ratio_to_report(count(���ɴ�)) over (),3 )  as ���� from purcust4 where ������ȣ in (select ������ȣ from c2_new) group by ���ɴ� order by ���� desc;

select ����з�, count(����з�), round(ratio_to_report(count(����з�)) over (),3 )  as ���� from purcust4 where ������ȣ in (select ������ȣ from c0_new) group by ����з� order by ���� desc;
select ����з�, count(����з�), round(ratio_to_report(count(����з�)) over (),3 )  as ���� from purcust4 where ������ȣ in (select ������ȣ from c1_new) group by ����з� order by ���� desc;
select ����з�, count(����з�), round(ratio_to_report(count(����з�)) over (),3 )  as ���� from purcust4 where ������ȣ in (select ������ȣ from c2_new) group by ����з� order by ���� desc;

select ���ŵ��, count(���ŵ��), round(ratio_to_report(count(���ŵ��)) over (),3 )  as ���� from purcust4 where ������ȣ in (select ������ȣ from c0_new) group by ���ŵ�� order by ���� desc;
select ���ŵ��, count(���ŵ��), round(ratio_to_report(count(���ŵ��)) over (),3 )  as ���� from purcust4 where ������ȣ in (select ������ȣ from c1_new) group by ���ŵ�� order by ���� desc;
select ���ŵ��, count(���ŵ��), round(ratio_to_report(count(���ŵ��)) over (),3 )  as ���� from purcust4 where ������ȣ in (select ������ȣ from c2_new) group by ���ŵ�� order by ���� desc;

select ���޻�, count(���޻�), round(ratio_to_report(count(���޻�)) over (),3 )  as ���� from purcust4 where ������ȣ in (select ������ȣ from c0_new) group by ���޻� order by ���� desc;
select ���޻�, count(���޻�), round(ratio_to_report(count(���޻�)) over (),3 )  as ���� from purcust4 where ������ȣ in (select ������ȣ from c1_new) group by ���޻� order by ���� desc;
select ���޻�, count(���޻�), round(ratio_to_report(count(���޻�)) over (),3 )  as ���� from purcust4 where ������ȣ in (select ������ȣ from c2_new) group by ���޻� order by ���� desc;

select ����_�ָ�, count(����_�ָ�), round(ratio_to_report(count(����_�ָ�)) over (),3 )  as ���� from purcust4 where ������ȣ in (select ������ȣ from c0_new) group by ����_�ָ� order by ���� desc;
select ����_�ָ�, count(����_�ָ�), round(ratio_to_report(count(����_�ָ�)) over (),3 )  as ���� from purcust4 where ������ȣ in (select ������ȣ from c1_new) group by ����_�ָ� order by ���� desc;
select ����_�ָ�, count(����_�ָ�), round(ratio_to_report(count(����_�ָ�)) over (),3 )  as ���� from purcust4 where ������ȣ in (select ������ȣ from c2_new) group by ����_�ָ� order by ���� desc;

select ���ŵ��, count(���ŵ��) from purcust4 group by ���ŵ��;

select sum(������ǰ_4 - ������ǰ_1) ����, sum(�ż���ǰ_4 - �ż���ǰ_1) �ż�, sum(�ϻ��ǰ_4 - �ϻ��ǰ_1) �ϻ�, sum(�Ƿ�_4 - �Ƿ�_1) �Ƿ�, sum(�м���ȭ_4 - �м���ȭ_1) �м�, sum("����������/����_4" - "����������/����_1") ������, sum("������/����_4"-"������/����_1") ����, sum("����/��ȭ��ǰ_4" - "����/��ȭ��ǰ_1") ��ȭ, sum("����/���׸���_4"-"����/���׸���_1") ����, sum(�ü�_4-�ü�_1) �ü�, sum("�Ǿ�ǰ/�Ƿ���_4"-"�Ǿ�ǰ/�Ƿ���_1") �Ǿ� from ����з����ݱⱸ�ž� where ������ȣ in (select ������ȣ from c2_new);

select sum(A_4 - A_1) A, sum(B_4 - B_1) B , sum(C_4 - C_1) C, sum(D_4 -D_1) D from ���޻纰�ݱⱸ�ž� where ������ȣ in (select ������ȣ from c0_new);

alter table prodcl add ���ߺз��ڵ� varchar(20);

update prodcl set ���ߺз��ڵ� = concat("���޻�", "�ߺз��ڵ�");

alter table purprod add ���ߺз��ڵ� varchar(20);

update purprod set ���ߺз��ڵ� = concat("���޻�", "�ߺз��ڵ�");

commit;