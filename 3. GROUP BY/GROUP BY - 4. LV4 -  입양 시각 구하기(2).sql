-- 보호소에서는 몇 시에 입양이 가장 활발하게 일어나는지 알아보려 합니다. 
-- 0시부터 23시까지, 각 시간대별로 입양이 몇 건이나 발생했는지 조회하는 SQL문을 작성해주세요.
-- 이때 결과는 시간대 순으로 정렬해야 합니다.
-- MySQL 8.0 신기능 CTE(Common Table Expression)(공통 테이블 표현식) 활용
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