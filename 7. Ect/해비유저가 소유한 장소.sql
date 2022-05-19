-- ������ �� �̻� ����� ����� "��� ����"��� �θ��ϴ�. 
-- ��� ������ ����� ������ ������ ���̵� ������ ��ȸ

-- CROSS JOIN Ȱ���
SELECT
	DISTINCT 
    A.ID,
	A.NAME,
	A.HOST_ID
FROM
	PLACES AS A,
	PLACES AS B
WHERE
	A.ID != B.ID
	AND A.HOST_ID = B.HOST_ID
ORDER BY
	A.ID;


-- ����������� ����
SELECT
	ID,
	NAME,
	HOST_ID
FROM PLACES A
WHERE
	(
	SELECT COUNT(HOST_ID) AS count
	FROM PLACES B
	WHERE A.HOST_ID = B.HOST_ID
	) > 1
ORDER BY 1;


-- ����������� HAVING ���
SELECT
	ID,
	NAME,
	HOST_ID
FROM PLACES
WHERE
	HOST_ID IN (
	SELECT HOST_ID
	FROM PLACES
	GROUP BY HOST_ID
	HAVING COUNT(HOST_ID) > 1
    )
ORDER BY ID;


-- �� ���� ��
WITH myCTE AS
(
SELECT
	ID,
	HOST_ID,
	count(HOST_ID)
FROM PLACES
GROUP BY 2
HAVING count(HOST_ID) > 1
)
SELECT
	p.id,
	p.name,
	p.host_id
FROM places p
LEFT JOIN myCTE m
        ON
	p.HOST_ID = m.HOST_ID
WHERE m.id IS NOT NULL
ORDER BY id;