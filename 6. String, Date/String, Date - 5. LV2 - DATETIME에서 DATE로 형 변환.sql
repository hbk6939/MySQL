-- ANIMAL_INS ���̺� ��ϵ� ��� ���ڵ忡 ����, 
-- �� ������ ���̵�� �̸�, ���� ��¥�� ��ȸ 
-- order by ���̵� ������ ��ȸ�ؾ� �մϴ�.

SELECT
	ANIMAL_ID,
	NAME,
	DATE_FORMAT(DATETIME,'%Y-%m-%d')
FROM
	ANIMAL_INS
ORDER BY
	1;