-- �߼�ȭ�� ������ SEX_UPON_INTAKE �÷��� 'Neutered' �Ǵ� 'Spayed'��� �ܾ ����ֽ��ϴ�.
-- SELECT ���̵�� �̸�, �߼�ȭ ���θ� ORDER BY ���̵� ������ ��ȸ
-- �̶� �߼�ȭ�� �Ǿ��ִٸ� 'O', �ƴ϶�� 'X'��� ǥ�����ּ���.

-- ���Խ�
SELECT
	ANIMAL_ID,
	NAME,
	IF(SEX_UPON_INTAKE REGEXP '^Neutered|^Spayed','O','X') AS '�߼�ȭ'
FROM ANIMAL_INS
ORDER BY 1;


-- ���Խ� �̻���
SELECT
	ANIMAL_ID,
	NAME,
	IF(SEX_UPON_INTAKE LIKE 'Neutered%' OR SEX_UPON_INTAKE LIKE 'Spayed%'
       ,'O','X'
      ) AS '�߼�ȭ'
FROM ANIMAL_INS
ORDER BY 1;



-- CTE(���� ���̺� ǥ����)
WITH MYCTE AS
(
SELECT
	ANIMAL_ID,
	SEX_UPON_INTAKE
FROM 
    ANIMAL_INS
WHERE
	SEX_UPON_INTAKE LIKE 'Neutered%'
	OR SEX_UPON_INTAKE LIKE 'Spayed%'
)

SELECT
	-- COUNT(*)
    A.ANIMAL_ID,
	A.NAME,
	IF(MY.SEX_UPON_INTAKE IS NULL,
	'X',
	'O') AS '�߼�ȭ'
FROM
	ANIMAL_INS AS A
LEFT JOIN MYCTE AS MY
        ON
	A.ANIMAL_ID = MY.ANIMAL_ID
ORDER BY
	1