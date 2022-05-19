-- ���� �Ծ��� �� �� ���� ��, ���� ���� ��ȣ�ҿ� �־��� ���� 3������ NAME�� ��ȣ DATETIME�� ��ȸ
-- �̶� ����� ��ȣ ������ ������ ��ȸ�ؾ� �մϴ�.
SELECT
	i.NAME,
	i.DATETIME
FROM ANIMAL_INS AS i
LEFT JOIN ANIMAL_OUTS AS o
        ON
	i.ANIMAL_ID = o.ANIMAL_ID
WHERE o.ANIMAL_ID IS NULL
ORDER BY DATETIME
LIMIT 3;