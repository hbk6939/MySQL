-- ���� ��ȣ�ҿ� ���� ���� ���� ������ �̸��� ��ȸ
WITH my AS
(
	SELECT
		min(DATETIME) DAY
	FROM
		ANIMAL_INS
)

SELECT name
FROM ANIMAL_INS a, my
WHERE my.day = a.datetime