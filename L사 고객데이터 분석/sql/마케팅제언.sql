--c0
SELECT * FROM C0;

SELECT SUM(P.���űݾ�), S.�ð�, RATIO_TO_REPORT(COUNT(S.�ð�)) OVER () 
FROM PURPROD P, �ð� S
WHERE P.���޻� = S.���޻� AND "����ȣ" IN (SELECT ����ȣ FROM C0)
GROUP BY P.���űݾ�, S.�ð�;

ALTER TABLE PURPROD ADD �ð� VARCHAR2(20);
ALTER TABLE PURPROD DROP COLUMN �ð�;

COMMIT;
UPDATE PURPROD SET �ð� = '����'  WHERE  ���Žð� <=12;
UPDATE PURPROD SET �ð� = '����'  WHERE  ���Žð� >12;

COMMIT;

DROP TABLE �ð�;


RATIO_TO_REPORT(SUM(P.���űݾ�)) OVER() 
,AVG(P.���űݾ�),

SELECT C.���޻�,avg(C.�̿�Ƚ��)
FROM CHANNEL C
WHERE ����ȣ IN (SELECT ����ȣ FROM C0 GROUP BY ����ȣ) 
GROUP BY  C.���޻�;



SELECT PL.����з�,SUM(P.���űݾ�),ROUND(AVG(P.���űݾ�),2), RATIO_TO_REPORT(SUM(P.���űݾ�)) OVER () 
FROM PRODCL_2 PL, PURPROD P
WHERE P.����ȣ IN (SELECT ����ȣ FROM C0 GROUP BY ����ȣ) AND P.���޻� = PL.���޻� AND P.��з��ڵ� =PL.��з��ڵ� AND
P.�ߺз��ڵ� = PL.�ߺз��ڵ�  AND P.�Һз��ڵ� = PL.�Һз��ڵ�
GROUP BY PL.����з�
ORDER BY SUM(P.���űݾ�) DESC;

select * from c1;

--c1
SELECT C.���޻�,avg(C.�̿�Ƚ��),count(c.�̿�Ƚ��)
FROM CHANNEL C
WHERE ����ȣ IN (SELECT ����ȣ FROM C2_cluster GROUP BY ����ȣ) 
GROUP BY  C.���޻�
order by sum(c.�̿�Ƚ��) desc;
--ä�� �̿� ����
SELECT C.���޻�,count(c.�̿�Ƚ��),ratio_to_report(count(c.�̿�Ƚ��)) over ()
FROM CHANNEL C
WHERE ����ȣ IN (SELECT ����ȣ FROM C2_cluster GROUP BY ����ȣ) 
GROUP BY  C.���޻�
order by sum(c.�̿�Ƚ��) desc;

--���޻� �̿� ����
select p.���޻� ,count(p.���޻�),ratio_to_report(count(p.���޻�)) over () 
FROM purprod p
WHERE ����ȣ IN (SELECT ����ȣ FROM C0_cluster GROUP BY ����ȣ) 
GROUP BY  p.���޻�;



--� ��ǰ ���� �����ϴ���
SELECT PL.����з�,SUM(P.���űݾ�),ROUND(AVG(P.���űݾ�),2), RATIO_TO_REPORT(SUM(P.���űݾ�)) OVER () 
FROM PRODCL_2 PL, PURPROD P
WHERE P.����ȣ IN (SELECT ����ȣ FROM C2_cluster GROUP BY ����ȣ) AND P.���޻� = PL.���޻� AND P.��з��ڵ� =PL.��з��ڵ� AND
P.�ߺз��ڵ� = PL.�ߺз��ڵ�  AND P.�Һз��ڵ� = PL.�Һз��ڵ�
GROUP BY PL.����з�
ORDER BY SUM(P.���űݾ�) DESC;

--���� ����
SELECT P.�ð�,COUNT(P.�ð�),RATIO_TO_REPORT(COUNT(P.�ð�)) OVER ()
FROM PURPROD P
WHERE  P.����ȣ IN (SELECT ����ȣ FROM C2_cluster GROUP BY ����ȣ)
GROUP BY P.�ð�;

SELECT * FROM C0_CLUSTER;
SELECT RECENCY,COUNT(RECENCY) FROM C0_CLUSTER GROUP BY RECENCY ORDER BY RECENCY DESC;
drop table c0;

SELECT ���ɴ�,COUNT(���ɴ�),RATIO_TO_REPORT(COUNT(���ɴ�))  OVER () FROM C2_CLUSTER GROUP BY ���ɴ�
ORDER BY ���ɴ� DESC ;

SELECT COUNT(*), AVG(P.���űݾ�)
FROM PURPROD P
WHERE ����ȣ IN(SELECT ����ȣ FROM C2_CLUSTER GROUP BY ����ȣ);