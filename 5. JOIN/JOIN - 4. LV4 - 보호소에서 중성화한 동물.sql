-- (��ȣ�ҿ� ���� ��ÿ��� ANIMAL_INS) - (�߼�ȭ ���� �ʾ����� SEX_UPON_INTAKE), 
-- (��ȣ�Ҹ� ���� ��ÿ��� ANIMAL_OUTS)  - (�߼�ȭ�� ������ SEX_UPON_OUTCOME) 
-- ANIMAL_ID�� ANIMAL_TYPE, NAME�� ��ȸ�ϴ� ���̵� ������ ��ȸ

SELECT
	-- i.SEX_UPON_INTAKE,
	-- o.SEX_UPON_OUTCOME,
	i.ANIMAL_ID,
	i.ANIMAL_TYPE,
	i.NAME
FROM
	ANIMAL_INS AS i
LEFT JOIN ANIMAL_OUTS AS o
        ON
	i.ANIMAL_ID = o.ANIMAL_ID
WHERE
	i.SEX_UPON_INTAKE NOT IN (
        BINARY 'Spayed Female', 'Neutered Male'
    )
	AND 
    o.SEX_UPON_OUTCOME IN (
        BINARY 'Spayed Female', 'Neutered Male'
    );

SELECT
	-- i.SEX_UPON_INTAKE,
	-- o.SEX_UPON_OUTCOME,
	i.ANIMAL_ID,
	i.ANIMAL_TYPE,
	i.NAME
FROM
	ANIMAL_INS AS i
LEFT JOIN ANIMAL_OUTS AS o
        ON
	i.ANIMAL_ID = o.ANIMAL_ID
WHERE
	NOT
    (
        i.SEX_UPON_INTAKE LIKE 'Spayed Female'
		OR i.SEX_UPON_INTAKE LIKE 'Neutered Male'
    )
	AND 
    (
        o.SEX_UPON_OUTCOME LIKE 'Spayed Female'
		OR o.SEX_UPON_OUTCOME LIKE 'Neutered Male'
    );