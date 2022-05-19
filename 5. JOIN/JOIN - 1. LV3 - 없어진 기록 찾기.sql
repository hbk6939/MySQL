-- ANIMAL_INS ���̺��� ���� ��ȣ�ҿ� ���� ������ ������ ���� ���̺��Դϴ�.
-- ANIMAL_OUTS ���̺��� ���� ��ȣ�ҿ��� �Ծ� ���� ������ ������ ���� ���̺��Դϴ�.
-- ANIMAL_OUTS ����� �ִµ�, ANIMAL_INS ����� ���� 
-- ������ ID�� �̸��� ID ������ ��ȸ ANIMAL_ID

-- join ����
SELECT
	ao.ANIMAL_ID,
	ao.NAME
FROM ANIMAL_OUTS ao
LEFT JOIN ANIMAL_INS ai
        ON
	ai.ANIMAL_ID = ao.ANIMAL_ID
WHERE ai.ANIMAL_ID IS NULL
ORDER BY ao.ANIMAL_ID;

-- �������� ����1
SELECT
	ao.ANIMAL_ID,
	ao.name
FROM ANIMAL_OUTS ao
WHERE
	ao.ANIMAL_ID NOT IN 
    (
	SELECT COALESCE(ai.ANIMAL_ID, 0)
	FROM ANIMAL_INS ai
    )
ORDER BY ao.ANIMAL_ID;
 
-- �������� ���2
SELECT
	ao.ANIMAL_ID,
	ao.NAME
FROM ANIMAL_OUTS ao
WHERE NOT EXISTS (
	SELECT 	ai.ANIMAL_ID
	FROM ANIMAL_INS ai
	WHERE ao.ANIMAL_ID = ai.ANIMAL_ID
)
ORDER BY ao.ANIMAL_ID;


-- In : ���ǿ� �����ϴ� row ã��
-- Exists : Exists���� ���� true���� �ƴ����� üũ

-- Not In �� Where ���� ������ �����ϴ��� ����� �÷��� Null���� ���� ��� ������� ���� �˴ϴ�.

-- Not Exists�� Not In�� �޸� Null���� ���� Row�鵵 ����� ���Ե˴ϴ�.
-- �̴� ����� ���� Null���� ������ Not In�� ���� ������ ���� �ʱ� ������ ������� ���ܵǸ�
-- Not Exists�� Exists ������ ���� False�� �����ϰ� �ű⿡ ���� 
-- Not�̱� ������ ��������� true�� �Ǿ� ����� ����
