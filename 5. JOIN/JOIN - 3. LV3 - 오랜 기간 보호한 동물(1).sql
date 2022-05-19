-- 아직 입양을 못 간 동물 중, 가장 오래 보호소에 있었던 동물 3마리의 NAME과 보호 DATETIME을 조회
-- 이때 결과는 보호 시작일 순으로 조회해야 합니다.
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