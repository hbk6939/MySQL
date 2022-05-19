-- 동물 보호소에 들어온 동물 중 고양이와 개가 각각 몇 마리인지 조회
-- 이때 고양이를 개보다 먼저 조회
SELECT
	ANIMAL_TYPE,
	COUNT(1) 'count'
FROM ANIMAL_INS
GROUP BY 1
ORDER BY 1;