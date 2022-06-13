SELECT COUNT(��������) FROM DATADD3 WHERE ����ȣ=17218;

SELECT �������� FROM DATADD3 WHERE ����ȣ=17218 GROUP BY ��������;


CREATE TABLE RFM AS  
SELECT D.����ȣ, count(P.��������)��, D.����з�,D.�Һ���з�, P.�ݱ�
FROM ����_���� D ,DATADD3 P
WHERE D.����ȣ = P.����ȣ AND D.����=P.���� AND D.���ɴ�=P.���ɴ� AND D.�������� =P.��������
AND D.���޻� = P.���޻� 
GROUP BY D.����ȣ,D.����з�,D.�Һ���з�, P.�ݱ� ;

CREATE TABLE RFM_2 AS
SELECT ����з�,��,����ȣ,�ݱ�,REQ
FROM RFM;

ALTER TABLE ����_���� DROP (���޻�,�Һ���з�,��ǰF,��������);
COMMIT;
select * from rfm;


alter table ����_���� ADD  req NUMBER;
--requency 
alter table ����_���� add req number;
update ����_���� set REQ = 
case 
    when recent<=1 then 4
    when 1<recent and recent <=2 then 3
    when 2<recent and recent<=4 then 2
    when 4<recent  and recent <=184 then 1
end;
--����_���� ���̺� ������ �߰� 
INSERT INTO ����_����(REQ) SELECT REQ FROM FREQ;
COMMIT;
ALTER TABLE ����_���� DROP COLUMN ��;
INSERT INTO ����_����(��) SELECT RECENT FROM FREQ;

SELECT COUNT(D.��������) FROM DATADD3 D, ����_���� R
WHERE R.����ȣ  =D.����ȣ AND D.����= R.���� AND D.��������=R.�������� AND D.���ɴ� = R.���ɴ� 
AND D.���޻� = R.���޻� AND ;

INSERT INTO DATADD3 D (����з�_2) SELECT ����з� FROM �з��۾� ;
COMMIT;
ALTER TABLE DATADD3 DROP COLUMN ����з�;
UPDATE ����_���� SET ����з� = (SELECT ����з� FROM PRODCL );
alter table ����_���� add �������� number;
alter table ����_���� DROP COLUMN ��;

insert into ����_����(��������) select �������� FROM DATADD3;
COMMIT;
alter table ����_���� add �������� number;
COMMIT;

alter table ����_���� add �� number;
insert into ����_����(��) select COUNT(��������) FROM ����_����;
alter table NEW_FREQ add ��ǰF number;
UPDATE NEW_FREQ set ��ǰF = 
case when ����з�='�ż���ǰ' and ��<=172 then 1
when ����з�='�ż���ǰ' and ��>172 and ��< 336 then 2
when ����з�='�ż���ǰ' and ��>336 and ��< 571 then 3
when ����з�='�ż���ǰ' and ��>571 then 4
end;

ALTER TABLE RFM_2 DROP COLUMN ����з�;

commit;



ALTER TABLE DATADD3 ADD ����з� VARCHAR2(50);
UPDATE DATADD3 D SET D.����з� = (SELECT ����з� FROM PRODCL P WHERE P.���޻� =D.���޻� AND D.��з��ڵ� = P.��з��ڵ�
AND D.�ߺз��ڵ� = P.�ߺз��ڵ� AND D.�Һз��ڵ� = P.�Һз��ڵ� );
commit;

ALTER TABLE RFM_2 ADD ����з� VARCHAR2(50);
UPDATE RFM_2  SET ����з� = (SELECT ����з� FROM prodcl  );
COMMIT;
ALTER TABLE RFM ADD �ݱ� NUMBER;


INSERT ALL RFM_2 R WHEN R.����ȣ = D.����ȣ THEN
INTO R.����з� VALUES(D.����з�) SELECT D.����з� FROM DATADD3 D ;

INSERT ALL RFM_2 R
INTO R.����з� VALUES(D.����з�) SELECT D.����з� FROM prodcl D ;



SELECT ����з�  FROM DATADD3  WHERE ����ȣ = ����ȣ;

UPDATE RFM_2 R SET R.����з� = (SELECT D.����з�  FROM DATADD3 D WHERE D.����ȣ = R.����ȣ );
COMMIT;

MERGE INTO RFM_2 R USING DATADD3 D ON  (D.����ȣ = R.����ȣ )
  WHEN MATCHED THEN
        UPDATE SET R.����з� = D.����з�;

MERGE INTO RFM_2 R USING (SELECT D.����з�_2 FROM DATADD3 D WHERE D.����ȣ = R.����ȣ ) 

;
CREATE TABLE RR AS 
SELECT D.����з�, COUNT(D.��������)��, D.����ȣ, D.�ݱ�
FROM DATADD3 D, RFM R
WHERE  D. ����ȣ =  R.����ȣ
GROUP BY  D.����з�, D.����ȣ, D.�ݱ�;


SELECT * FROM RR WHERE ����ȣ=17674;





SELECT ����з�,�� FROM RR WHERE ����з� = '��ǰ';



ALTER TABLE RR ADD ��ǰ_1 NUMBER;
UPDATE RR SET ��ǰ_1 = 1 where ����з�='��ǰ' and ��<=130;

alter table rr drop (�Ǽ��縮_1,�Ǽ��縮_2,�Ǽ��縮_3,�Ǽ��縮_4);
alter table rr drop (��ȭ_1,��ȭ_2,��ȭ_3,��ȭ_4,����������_1,����������_2,����������_3,
����������_4,�ü�_1,�ü�_2,�ü�_3,�ü�_4,�Ƿ�_1,�Ƿ�_2,�Ƿ�_3,�Ƿ�_4);
commit;
alter table rr drop column ��ǰ_1;
alter table rr add ��ǰ_1 number;
UPDATE RR SET ��ǰ_1 = 1 where ����з�='��ǰ' and ��<=130 ;
alter table rr add ��ǰ_2 number;
UPDATE RR SET ��ǰ_2 = 2 where ����з�='��ǰ' and ��>130 and ��<=258 ;
alter table rr add ��ǰ_3 number;
UPDATE RR SET ��ǰ_3 = 3 where ����з�='��ǰ' and ��>258 and ��<=416;
alter table rr add ��ǰ_4 number;
UPDATE RR SET ��ǰ_4 = 4 where ����з�='��ǰ' and ��>416 and ��<=2915;
commit;


ALTER TABLE RR ADD ��Ȱ_1 NUMBER;
UPDATE RR SET ��Ȱ_1 = 1 where ����з�='��Ȱ' and ��<=14;
alter table rr add ��Ȱ_2 number;
UPDATE RR SET ��Ȱ_2 = 2 where ����з�='��Ȱ' and ��>14 and ��<=25;
alter table rr add ��Ȱ_3 number;
UPDATE RR SET ��Ȱ_3 = 3 where ����з�='��Ȱ' and ��>25 and ��<=42;
alter table rr add ��Ȱ_4 number;
UPDATE RR SET ��Ȱ_4 = 4 where ����з�='��Ȱ' and ��>42 and ��<=360;
commit;

ALTER TABLE RFM_2 ADD ��ȰF NUMBER;
UPDATE rfm_2 set ��ȰF = 
case when ����з�='��Ȱ' and ��<=14 then 1
when ����з�='��Ȱ' and ��>14 and ��< 25 then 2
when ����з�='��Ȱ' and ��>25 and ��< 42 then 3
when ����з�='��Ȱ' and ��>42 then 4
end;



ALTER TABLE RR ADD �Ƿ�_1 NUMBER;
UPDATE RR SET �Ƿ�_1 = 1 where ����з�='�Ƿ�' and ��<=7;
alter table rr add �Ƿ�_2 number;
UPDATE RR SET �Ƿ�_2 = 2 where ����з�='�Ƿ�' and ��>7 and ��<=16;
alter table rr add �Ƿ�_3 number;
UPDATE RR SET �Ƿ�_3 = 3 where ����з�='�Ƿ�' and ��>16 and ��<=32;
alter table rr add �Ƿ�_4 number;
UPDATE RR SET �Ƿ�_4 = 4 where ����з�='�Ƿ�' and ��>33;
commit;

alter table rfm_2 drop column �Ƿ�F;
ALTER TABLE RFM_2 ADD �Ƿ�F NUMBER;
UPDATE rfm_2 set �Ƿ�F = 
case when ����з�='�Ƿ�' and ��<=7 then 1
when ����з�='�Ƿ�' and ��>7 and ��<= 16 then 2
when ����з�='�Ƿ�' and ��>16 and ��<= 32 then 3
when ����з�='�Ƿ�' and ��>32 then 4
end;


ALTER TABLE RR ADD �ü�_1 NUMBER;
UPDATE RR SET �ü�_1 = 1 where ����з�='�ü�' and ��<=4;
alter table rr add �ü�_2 number;
UPDATE RR SET �ü�_2 = 2 where ����з�='�ü�' and ��>4 and ��<=9;
alter table rr add �ü�_3 number;
UPDATE RR SET �ü�_3 = 3 where ����з�='�ü�' and ��>9 and ��<=16;
alter table rr add �ü�_4 number;
UPDATE RR SET �ü�_4 = 4 where ����з�='�ü�' and ��>16;
commit;

ALTER TABLE RFM_2 ADD �ü�F NUMBER;
UPDATE rfm_2 set �ü�F = 
case when ����з�='�ü�' and ��<=4 then 1
when ����з�='�ü�' and ��>4 and ��<=9 then 2
when ����з�='�ü�' and ��>9 and ��< 16 then 3
when ����з�='�ü�' and ��>16 then 4
end;

ALTER TABLE RR ADD ȭ��ǰ_1 NUMBER;
UPDATE RR SET ȭ��ǰ_1 = 1 where ����з�='ȭ��ǰ' and ��<=4;
alter table rr add ȭ��ǰ_2 number;
UPDATE RR SET ȭ��ǰ_2 = 2 where ����з�='ȭ��ǰ' and ��>4 and ��<=8;
alter table rr add ȭ��ǰ_3 number;
UPDATE RR SET ȭ��ǰ_3 = 3 where ����з�='ȭ��ǰ' and ��>8 and ��<=14;
alter table rr add ȭ��ǰ_4 number;
UPDATE RR SET ȭ��ǰ_4 = 4 where ����з�='ȭ��ǰ' and ��>14;
commit;

ALTER TABLE RFM_2 ADD ȭ��ǰF NUMBER;
UPDATE rfm_2 set ȭ��ǰF = 
case when ����з�='ȭ��ǰ' and ��<=4 then 1
when ����з�='ȭ��ǰ' and ��>4 and ��<=8 then 2
when ����з�='ȭ��ǰ' and ��>8 and ��< 14 then 3
when ����з�='ȭ��ǰ' and ��>14 then 4
end;

ALTER TABLE RR ADD ��ȭ_1 NUMBER;
UPDATE RR SET ��ȭ_1 = 1 where ����з�='��ȭ' and ��<=3;
alter table rr add ��ȭ_2 number;
UPDATE RR SET ��ȭ_2 = 2 where ����з�='��ȭ' and ��>3 and ��<=5;
alter table rr add ��ȭ_3 number;
UPDATE RR SET ��ȭ_3 = 3 where ����з�='��ȭ' and ��>5 and ��<=11;
alter table rr add ��ȭ_4 number;
UPDATE RR SET ��ȭ_4 = 4 where ����з�='��ȭ' and ��>11;
commit;

ALTER TABLE RFM_2 ADD ��ȭF NUMBER;
UPDATE rfm_2 set ��ȭF = 
case when ����з�='��ȭ' and ��<=3 then 1
when ����з�='��ȭ
' and ��>3 and ��<=5 then 2
when ����з�='��ȭ' and ��>5 and ��< 11 then 3
when ����з�='��ȭ' and ��>11 then 4
end;




ALTER TABLE RR ADD �Ǽ��縮_1 NUMBER;
UPDATE RR SET �Ǽ��縮_1 = 1 where ����з�='�Ǽ��縮' and ��<=1;
alter table rr add �Ǽ��縮_2 number;
UPDATE RR SET �Ǽ��縮_2 = 2 where ����з�='�Ǽ��縮' and ��>1 and ��<=2;
alter table rr add �Ǽ��縮_3 number;
UPDATE RR SET �Ǽ��縮_3 = 3 where ����з�='�Ǽ��縮' and ��>2 and ��<=5;
alter table rr add �Ǽ��縮_4 number;
UPDATE RR SET �Ǽ��縮_4 = 4 where ����з�='�Ǽ��縮' and ��>5;
commit;

ALTER TABLE RFM_2 ADD �Ǽ��縮F NUMBER;
UPDATE rfm_2 set �Ǽ��縮F = 
case when ����з�='�Ǽ��縮' and ��<=1 then 1
when ����з�='�Ǽ��縮' and ��>1 and ��<=2 then 2
when ����з�='�Ǽ��縮' and ��>2 and ��<=5 then 3
when ����з�='�Ǽ��縮' and ��>5 then 4
end;




ALTER TABLE RR ADD ����������_1 NUMBER;
UPDATE RR SET ����������_1 = 1 where ����з�='������_����' and ��<=1;
alter table rr add ����������_2 number;
UPDATE RR SET ����������_2 = 2 where ����з�='������_����' and ��>1 and ��<=2;
alter table rr add ����������_3 number;
UPDATE RR SET ����������_3 = 3 where ����з�='������_����' and ��>2 and ��<=3;
alter table rr add ����������_4 number;
UPDATE RR SET ����������_4 = 4 where ����з�='������_����' and ��>3;
commit;

ALTER TABLE RFM_2 ADD ����������F NUMBER;
UPDATE rfm_2 set ����������F = 
case when ����з�='������_����' and ��<=1 then 1
when ����з�='������_����' and ��>1 and ��<=2 then 2
when ����з�='������_����' and ��>2 and ��<=3 then 3
when ����з�='������_����' and ��>3 then 4
end;



ALTER TABLE RR ADD ������ǰ_1 NUMBER;
UPDATE RR SET ������ǰ_1 = 1 where ����з�='������ǰ' and ��<=1;
alter table rr add ������ǰ_2 number;
UPDATE RR SET ������ǰ_2 = 2 where ����з�='������ǰ' and ��>1 and ��<=2;
alter table rr add ������ǰ_3 number;
UPDATE RR SET ������ǰ_3 = 3 where ����з�='������ǰ' and ��>2 and ��<=3;
alter table rr add ������ǰ_4 number;
UPDATE RR SET ������ǰ_4 = 4 where ����з�='������ǰ' and ��>3;
commit;


ALTER TABLE RR DROP (������ǰ_1,������ǰ_2,������ǰ_3,������ǰ_4);



ALTER TABLE RFM_2 ADD ������ǰF NUMBER;
UPDATE rfm_2 set ������ǰF = 
case when ����з�='������ǰ' and ��<=1 then 1
when ����з�='������ǰ' and ��>1 and ��<=2 then 2
when ����з�='������ǰ' and ��>2 and ��<=3 then 3
when ����з�='������ǰ' and ��>3 then 4
end;




ALTER TABLE RR ADD �Ƶ�_1 NUMBER;
UPDATE RR SET �Ƶ�_1 = 1 where ����з�='�Ƶ�' and ��<=2;
alter table rr add �Ƶ�_2 number;
UPDATE RR SET �Ƶ�_2 = 2 where ����з�='�Ƶ�' and ��>2 and ��<=4;
alter table rr add �Ƶ�_3 number;
UPDATE RR SET �Ƶ�_3 = 3 where ����з�='�Ƶ�' and ��>4 and ��<=10;
alter table rr add �Ƶ�_4 number;
UPDATE RR SET �Ƶ�_4 = 4 where ����з�='�Ƶ�' and ��>10;
commit;


ALTER TABLE RFM_2 ADD �Ƶ�F NUMBER;
UPDATE rfm_2 set �Ƶ�F = 
case when ����з�='�Ƶ�' and ��<=2 then 1
when ����з�='�Ƶ�' and ��>2 and ��<=4 then 2
when ����з�='�Ƶ�' and ��>4 and ��<=10 then 3
when ����з�='�Ƶ�' and ��>10 then 4
end;



alter table rr drop (�Ƶ�_1,�Ƶ�_2,�Ƶ�_3,�Ƶ�_4);

ALTER TABLE RR ADD ��ȭ_1 NUMBER;
UPDATE RR SET ��ȭ_1 = 1 where ����з�='��ȭ' and ��<=1;
alter table rr add ��ȭ_2 number;
UPDATE RR SET ��ȭ_2 = 2 where ����з�='��ȭ' and ��>1 and ��<=2;
alter table rr add ��ȭ_3 number;
UPDATE RR SET ��ȭ_3 = 3 where ����з�='��ȭ' and ��>2 and ��<=4;
alter table rr add ��ȭ_4 number;
UPDATE RR SET ��ȭ_4 = 4 where ����з�='��ȭ' and ��>4;
commit;


ALTER TABLE RFM_2 ADD ��ȭF NUMBER;
UPDATE rfm_2 set ��ȭF = 
case when ����з�='��ȭ' and ��<=1 then 1
when ����з�='��ȭ' and ��>1 and ��<=2 then 2
when ����з�='��ȭ' and ��>2 and ��<=4 then 3
when ����з�='��ȭ' and ��>4 then 4
end;
commit;

ALTER TABLE RR ADD ����_1 NUMBER;
UPDATE RR SET ����_1 = 1 where ����з�='����' and ��<=1;
alter table rr add ����_2 number;
UPDATE RR SET ����_2 = 2 where ����з�='����' and ��<=1;
alter table rr add ����_3 number;
UPDATE RR SET ����_3 = 3 where ����з�='����' and ��>1 and ��<=2;
alter table rr add ����_4 number;
UPDATE RR SET ����_4 = 4 where ����з�='����' and ��>2;
commit;

ALTER TABLE RFM_2 ADD ����F NUMBER;
UPDATE rfm_2 set ����F = 
case when ����з�='����' and ��<=1 then 1
when ����з�='����' and ��<=1 then 2
when ����з�='����' and ��>1 and ��<=2 then 3
when ����з�='����' and ��>2 then 4
end;
commit;


DROP TABLE RFM;
CREATE TABLE RFM AS
SELECT RR.*,R.REQ FROM RR JOIN REQUENCY R ON RR.����ȣ =  R.����ȣ ;


rfm



SELECT * FROM RFM;

ALTER TABLE RFM  DROP COLUMN ����з�;
ALTER TABLE RFM ADD ����з� VARCHAR2(50);
UPDATE t1
SET t1.COL1 = t2.COL1, t1.COL2 = t2.COL2
FROM MY_TABLE AS t1
JOIN MY_OTHER_TABLE AS t2 ON t1.COLID = t2.ID
WHERE t1.COL3 = 'OK';


UPDATE RFM T1 SET T1.�ݱ� = T2.�ݱ�
FROM RFM T1 JOIN DATADD3 T2 ON T1.����ȣ = T2.����ȣ;
�� 
select R.����ȣ, count(*) from datadd3 d, rfm r where r.����ȣ =  d.����ȣ and 
d.����з� = '��Ȱ' and d.�ݱ� = 1 GROUP BY R.����ȣ;





SELECT COUNT(*) FROM RFM;

ALTER TABLE RFM DROP COLUMN ��ǰ1_F;
alter table rfm add ��ǰ1_F number(10);
update rfm t1 set  t1.��ǰ1_F = (select COUNT(*) from DATADD3 t2,RFM T1 where t1.����ȣ=t2.����ȣ and t2.�ݱ� = 1 
and t2.����з� ='��ǰ' ) ;
COMMIT;


update rfm set ��ǰ1_f = (select count(t2.��������) from datadd2 t2 ,rfm t1 where t1.����ȣ=t2.����ȣ and t2.�ݱ� = 1 
and t2.����з� ='��ǰ'
;
create table ��ǰ1 as 
select  COUNT(*)��ǰ from rfm t1, datadd3 t2 where t1.����ȣ=t2.����ȣ and t2.�ݱ� = 1 
and t2.����з� ='��ǰ' 
GROUP BY T2.��������
;

SELECT �� FROM RFM r1, datadd3 t2 where t2.����ȣ = r1.����ȣ and t2.����з�='��ǰ' and t2.�ݱ�=1  ;
select * from ����_���� r, datadd3 d where d.����ȣ = r.����ȣ and r.����ȣ=17675;

alter table rfm add ��ǰ2_F number(10);
update rfm t1 set t1.��ǰ2_F = (select COUNT(*) from DATADD3 t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 2
and t2.����з� ='��ǰ');

alter table rfm add ��ǰ3_F number(10);
update rfm t1 set t1.��ǰ3_F = (select COUNT(T2.��������) from DATADD3 t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 3
and t2.����з� ='��ǰ');

alter table rfm add ��ǰ4_F number(10);
update rfm t1 set t1.��ǰ4_F = (select COUNT(T2.��������) from DATADD3 t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 4
and t2.����з� ='��ǰ');

alter table rfm add ��Ȱ1_F number(10);
update rfm t1 set t1.��Ȱ1_F = (select COUNT(T2.��������) from DATADD3 t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 1 
and t2.����з� ='��Ȱ');

alter table rfm add ��Ȱ2_F number(10);
update rfm t1 set t1.��Ȱ2_F = (select COUNT(T2.��������) from DATADD3 t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 2
and t2.����з� ='��Ȱ');

alter table rfm add ��Ȱ3_F number(10);
update rfm t1 set t1.��Ȱ3_F = (select COUNT(T2.��������) from DATADD3 t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 3
and t2.����з� ='��Ȱ');

alter table rfm add ��Ȱ4_F number(10);
update rfm t1 set t1.��Ȱ4_F = (select COUNT(T2.��������) from DATADD3 t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 4
and t2.����з� ='��Ȱ');

alter table rfm add ��ȭ1_F number(10);
update rfm t1 set t1.��ȭ1_F = (select COUNT(T2.��������) from DATADD3 t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 1 
and t2.����з� ='��ȭ');

alter table rfm add ��ȭ2_F number(10);
update rfm t1 set t1.��ȭ2_F = (select COUNT(T2.��������) from DATADD3 t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 2
and t2.����з� ='��ȭ');

alter table rfm add ��ȭ3_F number(10);
update rfm t1 set t1.��ȭ3_F = (select COUNT(T2.��������) from DATADD3 t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 3
and t2.����з� ='��ȭ');

alter table rfm add ��ȭ4_F number(10);
update rfm t1 set t1.��ȭ4_F = (select COUNT(T2.��������) from DATADD3 t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 4
and t2.����з� ='��ȭ');

commit;

alter table rfm add ȭ��ǰ1_F number(10);
update rfm t1 set t1.ȭ��ǰ1_F = (select COUNT(T2.��������) from DATADD3 t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 1 
and t2.����з� ='ȭ��ǰ');

alter table rfm add ȭ��ǰ2_F number(10);
update rfm t1 set t1.ȭ��ǰ2_F = (select COUNT(T2.��������) from DATADD3 t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 2
and t2.����з� ='ȭ��ǰ');

alter table rfm add ȭ��ǰ3_F number(10);
update rfm t1 set t1.ȭ��ǰ3_F = (select COUNT(T2.��������) from DATADD3 t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 3
and t2.����з� ='ȭ��ǰ');

alter table rfm add ȭ��ǰ4_F number(10);
update rfm t1 set t1.ȭ��ǰ4_F = (select COUNT(T2.��������) from DATADD3 t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 4
and t2.����з� ='ȭ��ǰ');

alter table rfm add �ü�1_F number(10);
update rfm t1 set t1.�ü�1_F = (select COUNT(T2.��������) from DATADD3 t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 1 
and t2.����з� ='�ü�');

alter table rfm add �ü�2_F number(10);
update rfm t1 set t1.�ü�2_F = (select COUNT(T2.��������) from DATADD3 t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 2
and t2.����з� ='�ü�');

alter table rfm add �ü�3_F number(10);
update rfm t1 set t1.�ü�3_F = (select COUNT(T2.��������) from DATADD3 t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 3
and t2.����з� ='�ü�');

alter table rfm add �ü�4_F number(10);
update rfm t1 set t1.�ü�4_F = (select COUNT(T2.��������) from DATADD3 t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 4
and t2.����з� ='�ü�');

alter table rfm add ��ȭ1_F number(10);
update rfm t1 set t1.��ȭ1_F = (select COUNT(T2.��������) from DATADD3 t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 1 
and t2.����з� ='��ȭ');

alter table rfm add ��ȭ2_F number(10);
update rfm t1 set t1.��ȭ2_F = (select COUNT(T2.��������) from DATADD3 t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 2
and t2.����з� ='��ȭ');

alter table rfm add ��ȭ3_F number(10);
update rfm t1 set t1.��ȭ3_F = (select COUNT(T2.��������) from DATADD3 t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 3
and t2.����з� ='��ȭ');

alter table rfm add ��ȭ4_F number(10);
update rfm t1 set t1.��ȭ4_F = (select COUNT(T2.��������) from DATADD3 t2 where t1."����ȣ"=t2."����ȣ" and t2.�ݱ� = 4
and t2.����з� ='��ȭ');

commit;

SELECT * FROM RR;


DROP TABLE REQUENCY;

SELECT �Ǽ��縮F from rfm_2 where �Ǽ��縮F is not null;
ALTER TABLE RFM_2 ADD "14�� ��ݱ� �����Ѿ�" NUMBER;

UPDATE RFM_2 R SET R."14�� ��ݱ� �����Ѿ�" = (SELECT R2."14�� ��ݱ� �����Ѿ�" FROM ����_���� R2 WHERE R2.����ȣ = R.����ȣ);

ALTER TABLE RFM_2 ADD "14�� �Ϲݱ� �����Ѿ�" NUMBER;

UPDATE RFM_2 R SET R."14�� �Ϲݱ� �����Ѿ�" = (SELECT R2."14�� �Ϲݱ� �����Ѿ�" FROM ����_���� R2 WHERE R2.����ȣ = R.����ȣ);

ALTER TABLE RFM_2 ADD "15�� ��ݱ� �����Ѿ�" NUMBER;

UPDATE RFM_2 R SET R."15�� ��ݱ� �����Ѿ�" = (SELECT R2."15�� ��ݱ� �����Ѿ�" FROM ����_���� R2 WHERE R2.����ȣ = R.����ȣ);

ALTER TABLE RFM_2 ADD "15�� �Ϲݱ� �����Ѿ�" NUMBER;

UPDATE RFM_2 R SET R."15�� �Ϲݱ� �����Ѿ�" = (SELECT R2."15�� �Ϲݱ� �����Ѿ�" FROM ����_���� R2 WHERE R2.����ȣ = R.����ȣ);

COMMIT;
ALTER TABLE RFM_2 ADD "14�⵵�ѱ��ž�" NUMBER;

UPDATE RFM_2 R SET R."14�⵵�ѱ��ž�" = (SELECT R2."14�⵵�ѱ��ž�" FROM ����_���� R2 WHERE R2.����ȣ = R.����ȣ);

ALTER TABLE RFM_2 ADD "15�⵵�ѱ��ž�" NUMBER;

UPDATE RFM_2 R SET R."15�⵵�ѱ��ž�" = (SELECT R2."15�⵵�ѱ��ž�" FROM ����_���� R2 WHERE R2.����ȣ = R.����ȣ);

COMMIT;
--�� ���� ����з� ���۾� ��
alter table new_freq drop COLUMN ������ǰf;

alter table NEW_FREQ add �ż���ǰF number;
UPDATE NEW_FREQ set �ż���ǰF = 
case when ����з�='�ż���ǰ' and ��<=172 then 1
when ����з�='�ż���ǰ' and ��>172 and ��<= 336 then 2
when ����з�='�ż���ǰ' and ��>336 and ��<= 571 then 3
when ����з�='�ż���ǰ' and ��>571 then 4
end;

alter table NEW_FREQ add ������ǰF number;
UPDATE NEW_FREQ set ������ǰF = 
case when ����з�='������ǰ' and ��<=353 then 1
when ����з�='������ǰ' and ��>353 and ��<= 629 then 2
when ����з�='������ǰ' and ��>629 and ��<= 997 then 3
when ����з�='������ǰ' and ��>997 then 4
end;

alter table NEW_FREQ add �ϻ��ǰF number;
UPDATE NEW_FREQ set �ϻ��ǰF = 
case when ����з�='�ϻ��ǰ' and ��<=84 then 1
when ����з�='�ϻ��ǰ' and ��>84 and ��<= 145 then 2
when ����з�='�ϻ��ǰ' and ��>145 and ��<= 237 then 3
when ����з�='�ϻ��ǰ' and ��>237 then 4
end;
COMMIT;


alter table NEW_FREQ add �Ƿ�F number;
UPDATE NEW_FREQ set �Ƿ�F = 
case when ����з�='�Ƿ�' and ��<=21 then 1
when ����з�='�Ƿ�' and ��>21 and ��<= 50 then 2
when ����з�='�Ƿ�' and ��>50 and ��<= 101 then 3
when ����з�='�Ƿ�' and ��>101 then 4
end;
COMMIT;

alter table NEW_FREQ add �м���ȭf number;
UPDATE NEW_FREQ set �м���ȭf = 
case when ����з�='�м���ȭ' and ��<=10 then 1
when ����з�='�м���ȭ' and ��>10 and ��<= 22 then 2
when ����з�='�м���ȭ' and ��>22 and ��<= 40 then 3
when ����з�='�м���ȭ' and ��>40 then 4
end;

alter table NEW_FREQ add ����������_����f number;
UPDATE NEW_FREQ set ����������_����f = 
case when ����з�='����������/����' and ��<=5 then 1
when ����з�='����������/����' and ��>5 and ��<= 11 then 2
when ����з�='����������/����' and ��>11 and ��<= 24 then 3
when ����з�='����������/����' and ��>24 then 4
end;


alter table NEW_FREQ add ������_����f number;
UPDATE NEW_FREQ set ������_����f = 
case when ����з�='������/����' and ��<=7 then 1
when ����з�='������/����' and ��>7 and ��<= 15 then 2
when ����з�='������/����' and ��>15 and ��<= 49 then 3
when ����з�='������/����' and ��>49 then 4
end;


alter table NEW_FREQ add ����_��ȭf number;
UPDATE NEW_FREQ set ����_��ȭf = 
case when ����з�='����/��ȭ��ǰ' and ��<=3 then 1
when ����з�='����/��ȭ��ǰ' and ��>3 and ��<= 10 then 2
when ����з�='����/��ȭ��ǰ' and ��>10 and ��<= 29 then 3
when ����з�='����/��ȭ��ǰ' and ��>29 then 4
end;

alter table NEW_FREQ add ����_���׸���F number;
UPDATE NEW_FREQ set ����_���׸���F = 
case when ����з�='����/���׸���' and ��<=5 then 1
when ����з�='����/���׸���' and ��>5 and ��<= 11 then 2
when ����з�='����/���׸���' and ��>11 and ��<= 22 then 3
when ����з�='����/���׸���' and ��>22 then 4
end;

alter table NEW_FREQ add �ü�F number;
UPDATE NEW_FREQ set �ü�F = 
case when ����з�='�ü�' and ��<=2 then 1
when ����з�='�ü�' and ��>2 and ��<= 4 then 2
when ����з�='�ü�' and ��>4 and ��< =13 then 3
when ����з�='�ü�' and ��>13 then 4
end;
commit;


alter table NEW_FREQ add �Ƿ�_�Ǿ�F number;
UPDATE NEW_FREQ set �Ƿ�_�Ǿ�F = 
case when ����з�='�Ǿ�ǰ/�Ƿ���' and ��<=1 then 1
when ����з�='�Ǿ�ǰ/�Ƿ���' and ��>1 and ��<= 3 then 2
when ����з�='�Ǿ�ǰ/�Ƿ���' and ��>3 and ��< =8 then 3
when ����з�='�Ǿ�ǰ/�Ƿ���' and ��>8 then 4
end;
commit;

alter table NEW_FREQ add ��ŸF number;
UPDATE NEW_FREQ set ��Ÿf = 
case when ����з�='��Ÿ' and ��<=1 then 1
when ����з�='��Ÿ' and ��>1 and ��<= 2 then 2
when ����з�='��Ÿ' and ��>2 and ��< =3 then 3
when ����з�='��Ÿ' and ��>3 then 4
end;
commit;

create table new_frm as
select new_freq.* , freq.req
from new_freq,freq
where new_freq.����ȣ = freq.����ȣ;

drop table �з�;

create table new_frm2 as
select r."14�� ��ݱ� �����Ѿ�",r."14�� �Ϲݱ� �����Ѿ�",r."15�� ��ݱ� �����Ѿ�",r."15�� �Ϲݱ� �����Ѿ�",
n.*
from ����_���� r, new_frm n
where n.����ȣ = r.����ȣ;




create table �ð� as
select ���޻�,�ð�,����з�
from datadd3
group by ���޻�,�ð�,����з�;





select * from purprod
;
select p.���޻�, sum(p.���űݾ�),pl.����з�,RATIO_TO_REPORT(SUM(P.���űݾ�)) OVER ()* 100||'%' AS RATIO
from purprod p , prodcl_2 pl
where p.���޻� = pl.���޻� and p.��з��ڵ� = pl.��з��ڵ� and p.�ߺз��ڵ� = pl.�ߺз��ڵ� and
p.�Һз��ڵ� =pl.�Һз��ڵ� and P.���޻� = 'D'
group by  p.���޻�,pl.����з�
ORDER BY RATIO DESC
;


alter table pur_area31 add ���з��ڵ� number(10);

update pur_area31 set "���з��ڵ�" = "14�� ��ݱ� ���ŰǼ�"*1000 + "14�� �Ϲݱ� ���ŰǼ�"*100 + "15�� ��ݱ� ���ŰǼ�"*10 + "15�� �Ϲݱ� ���ŰǼ�";

create table �ű԰� as
select * from pur_area31 where "���з��ڵ�" = 10 or "���з��ڵ�" = 1 or "���з��ڵ�"= 11;

create table �ű԰� as
select * from pur_area31 where "���з��ڵ�" = 10 or "���з��ڵ�" = 1 or "���з��ڵ�"= 11;

create table ��Ż�� as
select * from pur_area31 where "���з��ڵ�" = 1000 or "���з��ڵ�" = 1100 or "���з��ڵ�" = 1110 or "���з��ڵ�" = 1010 or "���з��ڵ�"=100 or "���з��ڵ�" = 110;

select count(*) from ������;

select count(*) from �ű԰�;

select count(*) from ��Ż��;
DROP TABLE ��Ż��;


SELECT ROUND( AVG(��������),2) FROM PURPROD GROUP BY YEAR;


update purprod set year = substr(��������,1,4);

SELECT ����з�,COUNT(*) FROM PRODCL_2 GROUP BY ����з� ;
SELECT �Һ���з�,COUNT(*) FROM �Һ���з� GROUP BY �Һ���з� ;

select r.�Һ���з�,sum(p.���űݾ�)
from �Һ���з� r, purprod p
where p.���޻� =r.���޻� and p.��з��ڵ�  = r.��з��ڵ� and  p.�ߺз��ڵ� = r.�ߺз��ڵ�  and 
p.�Һз��ڵ� = r.�Һз��ڵ� 
group by r.�Һ���з�
order by sum(p.���űݾ�) desc;


select p.����з�, sum(c.���űݾ�),round(ratio_to_report(sum(c.���űݾ�)) over (),2) *100||'%' as ����
from prodcl_2 p, purprod c
where p.���޻� = c.���޻� and p.��з��ڵ� = c.��з��ڵ� and p.�ߺз��ڵ� = c.�ߺз��ڵ� and
p.�Һз��ڵ�  =c.�Һз��ڵ� 
group by p.����з�
order by sum(c.���űݾ�) desc;


CREATE TABLE PURCUST AS
SELECT P.����ȣ ,S.����з�,P.���޻�,P.��������,P.���űݾ�
FROM PURPROD P, PRODCL_2 S
WHERE P.���޻� = S.���޻� AND P.��з��ڵ� = S.��з��ڵ� AND P.�ߺз��ڵ�  =S.�ߺз��ڵ�  AND
P.�Һз��ڵ� = S.�Һз��ڵ�
GROUP BY  P.����ȣ ,S.����з�,P.���޻�,P.��������,P.���űݾ� ;

SELECT * FROM PURCUST;

SELECT ����,COUNT(����)
FROM CUSTDEMO
GROUP BY ����;

--�������� �׷���
SELECT COUNT(��������),ROUND(RATIO_TO_REPORT(COUNT(��������)) OVER() ,2)*100 ||'%' AS ����,
CASE WHEN �������� = '100' THEN  '���'
 WHEN �������� BETWEEN 010 AND 099 THEN  '����'
 WHEN ��������  = '460' THEN '�λ�'
 WHEN �������� BETWEEN 210 AND 239 THEN '��õ'
 WHEN �������� BETWEEN 240 AND 269 THEN '����'
 WHEN �������� BETWEEN 270 AND 299 THEN '���'
 WHEN �������� BETWEEN 300 AND 309 THEN '����'
 WHEN �������� BETWEEN 310 AND 339 THEN '�泲'
 WHEN �������� BETWEEN 340 AND 359 THEN '����'
 WHEN �������� BETWEEN 360 AND 409 THEN '���'
 WHEN �������� BETWEEN 410 AND 439 THEN '�뱸'
 WHEN �������� BETWEEN 440 AND 459 THEN '���'
 WHEN �������� BETWEEN 460 AND 499 THEN '�λ�'
 WHEN �������� BETWEEN 500 AND 539 THEN '�泲'
 WHEN �������� BETWEEN 540 AND 569 THEN '����'
 WHEN �������� BETWEEN 570 AND 609 THEN '����'
 WHEN �������� BETWEEN 610 AND 629 THEN '����'
 WHEN �������� BETWEEN 630 AND 639 THEN '����'
END 
FROM CUSTDEMO
GROUP BY ��������
ORDER BY COUNT(��������)DESC;

GROUP BY ��������;

SELECT * FROM PURPROD;

alter table purprod add month number;
update purprod set MONTH = substr(��������,5,2);


--�ݱ⺰�� ����� ����
CREATE TABLE ��ݱ�RE AS
SELECT ����ȣ,TO_DATE('2014-07-01','YYYY-MM-DD') - TO_DATE(MAX(��������),'YYYY-MM-DD') AS ��ݱ�RE
FROM PURPROD
WHERE ��������>=20140701
GROUP BY ����ȣ;


CREATE TABLE �Ϲݱ�RE AS
SELECT ����ȣ,TO_DATE('2015-01-01','YYYY-MM-DD') - TO_DATE(MAX(��������),'YYYY-MM-DD') AS �Ϲݱ�RE
FROM PURPROD
WHERE ��������<20140701  AND ��������<20150101
GROUP BY ����ȣ;

DROP TABLE �Ϲݱ�RE;


SELECT p.���޻�,c.����,count(��������),ROUND(RATIO_TO_REPORT(count(��������)) OVER() ,2)*100 ||'%' AS ����
FROM PURPROD p ,custdemo c
where p.����ȣ = c.����ȣ
GROUP BY p.���޻�,c.����
ORDER BY ���� DESC;

select sum(���űݾ�),avg(���űݾ�)
from purprod
where year=2015 and month between 1 and 6 ;

select avg(count(*))
from purprod
where year=2015 and month between 7 and 12;


select c.���޻�,sum(c.�̿�Ƚ��),p.year
from channel c, purprod p
where p.����ȣ = c.����ȣ and p.year=2015 and p.month between 7 and 12
group by c.���޻�,p.year
order by sum(c.�̿�Ƚ��)desc;

select sum(���űݾ�)��ݱ�14
from purprod
where month between 1 and 6  and year=2014;


select sum(���űݾ�)�Ϲݱ�15
from purprod
where month between 7 and 12  and year=2015;

select sum("14�⵵�ѱ��ž�"+"15�⵵�ѱ��ž�")
from ����_����;

select sum(���űݾ�)
from purprod;


CREATE TABLE PUR_AREA31 AS SELECT custdemo.����ȣ,
COUNT(CASE WHEN month between 1 and 6 and year=2014 THEN custdemo.����ȣ END) "14�� ��ݱ� ���ŰǼ�", 
COUNT(CASE WHEN month between 7 and 12 and year=2014 THEN custdemo.����ȣ END) "14�� �Ϲݱ� ���ŰǼ�", 
COUNT(CASE WHEN month between 1 and 6  and year=2015 THEN custdemo.����ȣ END) "15�� ��ݱ� ���ŰǼ�", 
COUNT(CASE WHEN month between 7 and 12  and year=2015 THEN custdemo.����ȣ END) "15�� �Ϲݱ� ���ŰǼ�", 
SUM(CASE WHEN  month between 1 and 6 and year=2014 THEN ���űݾ� END) "14�� ��ݱ� �����Ѿ�",
SUM(CASE WHEN month between 7 and 12 and year=2014 THEN ���űݾ� END) "14�� �Ϲݱ� �����Ѿ�",
SUM(CASE WHEN month between 1 and 6  and year=2015 THEN ���űݾ� END) "15�� ��ݱ� �����Ѿ�",
SUM(CASE WHEN month between 7 and 12  and year=2015 THEN ���űݾ� END) "15�� �Ϲݱ� �����Ѿ�" FROM purprod
LEFT OUTER JOIN custdemo ON purprod.����ȣ = custdemo.����ȣ
GROUP BY custdemo.����ȣ;

update pur_area31 set "14�� ��ݱ� ���ŰǼ�" = 1 where "14�� ��ݱ� ���ŰǼ�" > 0;
update pur_area31 set "14�� �Ϲݱ� ���ŰǼ�" = 1 where "14�� �Ϲݱ� ���ŰǼ�" > 0;
update pur_area31 set "15�� ��ݱ� ���ŰǼ�" = 1 where "15�� ��ݱ� ���ŰǼ�" > 0;
update pur_area31 set "15�� �Ϲݱ� ���ŰǼ�" = 1 where "15�� �Ϲݱ� ���ŰǼ�" > 0;
commit;

create table ������ as
select * from pur_area31 where "14�� ��ݱ� ���ŰǼ�"=1 and "14�� �Ϲݱ� ���ŰǼ�"=1 and "15�� ��ݱ� ���ŰǼ�"=1 and "15�� �Ϲݱ� ���ŰǼ�"=1;

drop table ������;

select count(*) from ������;

alter table ������ add "14�⵵�ѱ��ž�" number(20);
alter table ������ add "15�⵵�ѱ��ž�" number(20);

update ������ set "14�⵵�ѱ��ž�" = "14�� ��ݱ� �����Ѿ�"+"14�� �Ϲݱ� �����Ѿ�";
update ������ set "15�⵵�ѱ��ž�" = "15�� ��ݱ� �����Ѿ�"+"15�� �Ϲݱ� �����Ѿ�";
select count(*) from ������;
select sum("14�⵵�ѱ��ž�"+"15�⵵�ѱ��ž�") from ������;




create table �������Ұ� as
select * from ������ where "15�⵵�ѱ��ž�"<"14�⵵�ѱ��ž�"*1.126;

select sum(���űݾ�) ;


select sum("14�⵵�ѱ��ž�"+"15�⵵�ѱ��ž�") from �������Ұ�;


SELECT SUM(���űݾ�) 
FROM PURPROD;

SELECT SUM("14�⵵�ѱ��ž�"+"15�⵵�ѱ��ž�")
FROM ����_����;

SELECT COUNT(*) FROM �������Ұ� ;
SELECT SUM("14�⵵�ѱ��ž�"+"15�⵵�ѱ��ž�") FROM �������Ұ�;
SELECT COUNT(*) FROM ����_���� GROUP BY ����_����.*;


SELECT * FROM PURPROD WHERE ����ȣ = 00001;
SELECT P.���޻�,P.���űݾ�,PL.�ߺз���,PL.�Һз���,PL.����з�,COUNT(*)Ƚ�� FROM PRODCL_2 PL, PURPROD P WHERE P.����ȣ = 00001 AND P.���޻� = PL.���޻� AND
P.��з��ڵ� = PL.��з��ڵ� AND P.�ߺз��ڵ� = PL.�ߺз��ڵ� AND P.�Һз��ڵ� = PL.�Һз��ڵ�
GROUP BY P.���޻�,P.���űݾ�,PL.�ߺз���,PL.�Һз���,PL.����з�
ORDER BY Ƚ�� DESC
;

 TABLE ��ǰ��õ_0 AS
SELECT P.����ȣ,S.���޻�,S.�ߺз���,S.��ǰ�з�,S.�Һ���з�
FROM �Һ���з� S,PURPROD P,c0_cluster c
where s.���޻� = p.���޻� and s.��з��ڵ� = p.��з��ڵ� and  s.�ߺз��ڵ� = p.�ߺз��ڵ�
and s.�Һз��ڵ�= p.�Һз��ڵ� and c.����ȣ= p.����ȣ;

SELECT ����ȣ,�ߺз���,��ǰ�з�,�Һ���з�
FROM ��ǰ��õ_0
WHERE ��ǰ�з� = '�м�/�Ƿ�';