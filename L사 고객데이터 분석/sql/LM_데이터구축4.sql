alter table cuspur2 add ���ŵ�� number(2);

update cuspur2 set "���ŵ��" = 1 where "�Ѽ���" <= 3230;
update cuspur2 set "���ŵ��" = 2 where "�Ѽ���" > 3230 and "�Ѽ���"<=6461;
update cuspur2 set "���ŵ��" = 3 where "�Ѽ���" > 6461 and "�Ѽ���"<=9692;
update cuspur2 set "���ŵ��" = 4 where "�Ѽ���" > 9692 and "�Ѽ���"<=12922;
update cuspur2 set "���ŵ��" = 5 where "�Ѽ���" > 12922 and "�Ѽ���"<=16152;
update cuspur2 set "���ŵ��" = 6 where "�Ѽ���" > 16152;

alter table �������Ұ�_�⵵����2 add ���ŵ�� number(2);

update �������Ұ�_�⵵����2 set ���ŵ�� = 1 where ����ȣ in (select ����ȣ from cuspur2 where ���ŵ�� = 1);
update �������Ұ�_�⵵����2 set ���ŵ�� = 2 where ����ȣ in (select ����ȣ from cuspur2 where ���ŵ�� = 2);
update �������Ұ�_�⵵����2 set ���ŵ�� = 3 where ����ȣ in (select ����ȣ from cuspur2 where ���ŵ�� = 3);
update �������Ұ�_�⵵����2 set ���ŵ�� = 4 where ����ȣ in (select ����ȣ from cuspur2 where ���ŵ�� = 4);
update �������Ұ�_�⵵����2 set ���ŵ�� = 5 where ����ȣ in (select ����ȣ from cuspur2 where ���ŵ�� = 5);
update �������Ұ�_�⵵����2 set ���ŵ�� = 6 where ����ȣ in (select ����ȣ from cuspur2 where ���ŵ�� = 6);

alter table �������Ұ�_��������2 add ���ŵ�� number(2);

update �������Ұ�_��������2 set ���ŵ�� = 1 where ����ȣ in (select ����ȣ from cuspur2 where ���ŵ�� = 1);
update �������Ұ�_��������2 set ���ŵ�� = 2 where ����ȣ in (select ����ȣ from cuspur2 where ���ŵ�� = 2);
update �������Ұ�_��������2 set ���ŵ�� = 3 where ����ȣ in (select ����ȣ from cuspur2 where ���ŵ�� = 3);
update �������Ұ�_��������2 set ���ŵ�� = 4 where ����ȣ in (select ����ȣ from cuspur2 where ���ŵ�� = 4);
update �������Ұ�_��������2 set ���ŵ�� = 5 where ����ȣ in (select ����ȣ from cuspur2 where ���ŵ�� = 5);
update �������Ұ�_��������2 set ���ŵ�� = 6 where ����ȣ in (select ����ȣ from cuspur2 where ���ŵ�� = 6);

commit;

select ����ȣ, "14�⵵�ѱ��ž�", "15�⵵�ѱ��ž�" from �������Ұ�_�⵵����2 where ���� = 'F';

alter table �������Ұ�_�⵵����2 add �ѱ��ž� number(20);

update �������Ұ�_�⵵����2 set �ѱ��ž� = "14�⵵�ѱ��ž�" + "15�⵵�ѱ��ž�";

select PERCENTILE_DISC(0.25) within group (order by �ѱ��ž�) as q1 from �������Ұ�_�⵵����2;

select PERCENTILE_DISC(0.75) within group (order by �ѱ��ž�) as q3 from �������Ұ�_�⵵����2;
create table �����_iqr as
select PERCENTILE_DISC(0.25) within group (order by �ѱ��ž�) as q1,
PERCENTILE_DISC(0.75) within group (order by �ѱ��ž�) as q3,
PERCENTILE_DISC(0.75) within group (order by �ѱ��ž�) - PERCENTILE_DISC(0.25) within group (order by �ѱ��ž�) as iqr from �������Ұ�_�⵵����2;

create table �������Ұ�_�⵵����_�̻�ġ���� as
select r.* from �������Ұ�_�⵵����2 r, �����_iqr s where r.�ѱ��ž� > (s.q1 - 1.5*s.iqr) and r.�ѱ��ž� < (s.q3 + 1.5*s.iqr);

select count(*) from �������Ұ�_�⵵����_�̻�ġ���� where ���� = 'F';

create table �������Ұ�_��������2_�̻�ġ���� as
select r.* from �������Ұ�_��������2 r where ����ȣ in (select ����ȣ from �������Ұ�_�⵵����_�̻�ġ����);

select count(*) from �������Ұ�_��������2_�̻�ġ����;

select * from �������Ұ�_�⵵����_�̻�ġ���� where ���ŵ�� = 1;

select count(*) from �������Ұ�_��������;

select t2.����ȣ, sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t2.�ݱ� = 1 and t2.����з� ='��ǰ' group by t2.����ȣ order by t2."����ȣ";

alter table �������Ұ�_�⵵���� add ��ǰ_1 number(20);
update �������Ұ�_�⵵���� t1 set t1.��ǰ_1 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 1 and t2.����з� ='��ǰ');

alter table �������Ұ�_�⵵���� add ��ǰ_2 number(20);
update �������Ұ�_�⵵���� t1 set t1.��ǰ_2 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 2 and t2.����з� ='��ǰ');

alter table �������Ұ�_�⵵���� add ��ǰ_3 number(20);
update �������Ұ�_�⵵���� t1 set t1.��ǰ_3 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 3 and t2.����з� ='��ǰ');

alter table �������Ұ�_�⵵���� add ��ǰ_4 number(20);
update �������Ұ�_�⵵���� t1 set t1.��ǰ_4 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 4 and t2.����з� ='��ǰ');

alter table �������Ұ�_�⵵���� add ��Ȱ_1 number(20);
update �������Ұ�_�⵵���� t1 set t1.��Ȱ_1 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 1 and t2.����з� ='��Ȱ');

alter table �������Ұ�_�⵵���� add ��Ȱ_2 number(20);
update �������Ұ�_�⵵���� t1 set t1.��Ȱ_2 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 2 and t2.����з� ='��Ȱ');

alter table �������Ұ�_�⵵���� add ��Ȱ_3 number(20);
update �������Ұ�_�⵵���� t1 set t1.��Ȱ_3 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 3 and t2.����з� ='��Ȱ');

alter table �������Ұ�_�⵵���� add ��Ȱ_4 number(20);
update �������Ұ�_�⵵���� t1 set t1.��Ȱ_4 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 4 and t2.����з� ='��Ȱ');

alter table �������Ұ�_�⵵���� add ��ȭ_1 number(20);
update �������Ұ�_�⵵���� t1 set t1.��ȭ_1 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 1 and t2.����з� ='��ȭ');

alter table �������Ұ�_�⵵���� add ��ȭ_2 number(20);
update �������Ұ�_�⵵���� t1 set t1.��ȭ_2 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 2 and t2.����з� ='��ȭ');

alter table �������Ұ�_�⵵���� add ��ȭ_3 number(20);
update �������Ұ�_�⵵���� t1 set t1.��ȭ_3 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 3 and t2.����з� ='��ȭ');

alter table �������Ұ�_�⵵���� add ��ȭ_4 number(20);
update �������Ұ�_�⵵���� t1 set t1.��ȭ_4 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 4 and t2.����з� ='��ȭ');

alter table �������Ұ�_�⵵���� add ȭ��ǰ_1 number(20);
update �������Ұ�_�⵵���� t1 set t1.ȭ��ǰ_1 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 1 and t2.����з� ='ȭ��ǰ');

alter table �������Ұ�_�⵵���� add ȭ��ǰ_2 number(20);
update �������Ұ�_�⵵���� t1 set t1.ȭ��ǰ_2 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 2 and t2.����з� ='ȭ��ǰ');

alter table �������Ұ�_�⵵���� add ȭ��ǰ_3 number(20);
update �������Ұ�_�⵵���� t1 set t1.ȭ��ǰ_3 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 3 and t2.����з� ='ȭ��ǰ');

alter table �������Ұ�_�⵵���� add ȭ��ǰ_4 number(20);
update �������Ұ�_�⵵���� t1 set t1.ȭ��ǰ_4 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 4 and t2.����з� ='ȭ��ǰ');

alter table �������Ұ�_�⵵���� add �ü�_1 number(20);
update �������Ұ�_�⵵���� t1 set t1.�ü�_1 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 1 and t2.����з� ='�ü�');

alter table �������Ұ�_�⵵���� add �ü�_2 number(20);
update �������Ұ�_�⵵���� t1 set t1.�ü�_2 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 2 and t2.����з� ='�ü�');

alter table �������Ұ�_�⵵���� add �ü�_3 number(20);
update �������Ұ�_�⵵���� t1 set t1.�ü�_3 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 3 and t2.����з� ='�ü�');

alter table �������Ұ�_�⵵���� add �ü�_4 number(20);
update �������Ұ�_�⵵���� t1 set t1.�ü�_4 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 4 and t2.����з� ='�ü�');

alter table �������Ұ�_�⵵���� add ��ȭ_1 number(20);
update �������Ұ�_�⵵���� t1 set t1.��ȭ_1 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 1 and t2.����з� ='��ȭ');

alter table �������Ұ�_�⵵���� add ��ȭ_2 number(20);
update �������Ұ�_�⵵���� t1 set t1.��ȭ_2 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 2 and t2.����з� ='��ȭ');

alter table �������Ұ�_�⵵���� add ��ȭ_3 number(20);
update �������Ұ�_�⵵���� t1 set t1.��ȭ_3 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 3 and t2.����з� ='��ȭ');

alter table �������Ұ�_�⵵���� add ��ȭ_4 number(20);
update �������Ұ�_�⵵���� t1 set t1.��ȭ_4 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 4 and t2.����з� ='��ȭ');

alter table �������Ұ�_�⵵���� add �Ƿ�_1 number(20);
update �������Ұ�_�⵵���� t1 set t1.�Ƿ�_1 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 1 and t2.����з� ='�Ƿ�');

alter table �������Ұ�_�⵵���� add �Ƿ�_2 number(20);
update �������Ұ�_�⵵���� t1 set t1.�Ƿ�_2 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 2 and t2.����з� ='�Ƿ�');

alter table �������Ұ�_�⵵���� add �Ƿ�_3 number(20);
update �������Ұ�_�⵵���� t1 set t1.�Ƿ�_3 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 3 and t2.����з� ='�Ƿ�');

alter table �������Ұ�_�⵵���� add �Ƿ�_4 number(20);
update �������Ұ�_�⵵���� t1 set t1.�Ƿ�_4 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 4 and t2.����з� ='�Ƿ�');

alter table �������Ұ�_�⵵���� add ����_1 number(20);
update �������Ұ�_�⵵���� t1 set t1.����_1 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 1 and t2.����з� ='����');

alter table �������Ұ�_�⵵���� add ����_2 number(20);
update �������Ұ�_�⵵���� t1 set t1.����_2 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 2 and t2.����з� ='����');

alter table �������Ұ�_�⵵���� add ����_3 number(20);
update �������Ұ�_�⵵���� t1 set t1.����_3 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 3 and t2.����з� ='����');

alter table �������Ұ�_�⵵���� add ����_4 number(20);
update �������Ұ�_�⵵���� t1 set t1.����_4 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 4 and t2.����з� ='����');


alter table �������Ұ�_�⵵���� add �Ƶ�_1 number(20);
update �������Ұ�_�⵵���� t1 set t1.�Ƶ�_1 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 1 and t2.����з� ='�Ƶ�');

alter table �������Ұ�_�⵵���� add �Ƶ�_2 number(20);
update �������Ұ�_�⵵���� t1 set t1.�Ƶ�_2 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 2 and t2.����з� ='�Ƶ�');

alter table �������Ұ�_�⵵���� add �Ƶ�_3 number(20);
update �������Ұ�_�⵵���� t1 set t1.�Ƶ�_3 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 3 and t2.����з� ='�Ƶ�');

alter table �������Ұ�_�⵵���� add �Ƶ�_4 number(20);
update �������Ұ�_�⵵���� t1 set t1.�Ƶ�_4 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 4 and t2.����з� ='�Ƶ�');

alter table �������Ұ�_�⵵���� add ������_����_1 number(20);
update �������Ұ�_�⵵���� t1 set t1.������_����_1 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 1 and t2.����з� ='������_����');

alter table �������Ұ�_�⵵���� add ������_����_2 number(20);
update �������Ұ�_�⵵���� t1 set t1.������_����_2 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 2 and t2.����з� ='������_����');

alter table �������Ұ�_�⵵���� add ������_����_3 number(20);
update �������Ұ�_�⵵���� t1 set t1.������_����_3 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 3 and t2.����з� ='������_����');

alter table �������Ұ�_�⵵���� add ������_����_4 number(20);
update �������Ұ�_�⵵���� t1 set t1.������_����_4 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 4 and t2.����з� ='������_����');

alter table �������Ұ�_�⵵���� add �Ǽ��縮_1 number(20);
update �������Ұ�_�⵵���� t1 set t1.�Ǽ��縮_1 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 1 and t2.����з� ='�Ǽ��縮');

alter table �������Ұ�_�⵵���� add �Ǽ��縮_2 number(20);
update �������Ұ�_�⵵���� t1 set t1.�Ǽ��縮_2 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 2 and t2.����з� ='�Ǽ��縮');

alter table �������Ұ�_�⵵���� add �Ǽ��縮_3 number(20);
update �������Ұ�_�⵵���� t1 set t1.�Ǽ��縮_3 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 3 and t2.����з� ='�Ǽ��縮');

alter table �������Ұ�_�⵵���� add �Ǽ��縮_4 number(20);
update �������Ұ�_�⵵���� t1 set t1.�Ǽ��縮_4 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 4 and t2.����з� ='�Ǽ��縮');

alter table �������Ұ�_�⵵���� add ������ǰ_1 number(20);
update �������Ұ�_�⵵���� t1 set t1.������ǰ_1 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 1 and t2.����з� ='������ǰ');

alter table �������Ұ�_�⵵���� add ������ǰ_2 number(20);
update �������Ұ�_�⵵���� t1 set t1.������ǰ_2 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 2 and t2.����з� ='������ǰ');

alter table �������Ұ�_�⵵���� add ������ǰ_3 number(20);
update �������Ұ�_�⵵���� t1 set t1.������ǰ_3 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 3 and t2.����з� ='������ǰ');

alter table �������Ұ�_�⵵���� add ������ǰ_4 number(20);
update �������Ұ�_�⵵���� t1 set t1.������ǰ_4 = (select sum(t2.���űݾ�) from �������Ұ�_�������� t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 4 and t2.����з� ='������ǰ');

select ���޻�, count(*) from prodcl group by ���޻�;

select ��з��ڵ�, count(��з��ڵ�) from prodcl where ���޻� = 'C' group by "��з��ڵ�";

select * from prodcl where ���޻� = 'B' order by �Һз��ڵ�;

select * from purcust3 where ����ȣ = '00003' and �Һ���з� = '����ǰ'