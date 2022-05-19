-- 동물 보호소에 가장 먼저 들어온 동물의 이름을 조회
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