-- ��ȣ�ҿ����� �� �ÿ� �Ծ��� ���� Ȱ���ϰ� �Ͼ���� �˾ƺ��� �մϴ�. 
-- 0�ú��� 23�ñ���, �� �ð��뺰�� �Ծ��� �� ���̳� �߻��ߴ��� ��ȸ�ϴ� SQL���� �ۼ����ּ���.
-- �̶� ����� �ð��� ������ �����ؾ� �մϴ�.
-- MySQL 8.0 �ű�� CTE(Common Table Expression)(���� ���̺� ǥ����) Ȱ��
WITH RECURSIVE cte AS
(
	SELECT 0 AS n
	UNION ALL
	SELECT n + 1
	FROM cte
	WHERE n < 23
)
-- SELECT n FROM cte;

SELECT
	c.n 'hour',
	count(HOUR(ao.datetime)) 'count'
FROM cte c
LEFT JOIN ANIMAL_OUTS ao
        ON
	c.n = HOUR(ao.DATETIME)
GROUP BY 1;