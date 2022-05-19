-- (보호 시작일보다 ANIMAL_INS) > (입양일이 ANIMAL_OUTS) 더 빠른 동물의 아이디와 이름을 조회
-- 결과는 보호 시작일이 빠른 순으로 조회  DATETIME
SELECT
	-- o.DATETIME '입양일',
	-- i.DATETIME '보호 시작일',
	o.ANIMAL_ID,
	o.NAME
FROM ANIMAL_OUTS AS o
LEFT JOIN ANIMAL_INS AS i
        ON
	o.ANIMAL_ID = i.ANIMAL_ID
WHERE i.DATETIME > o.DATETIME
ORDER BY i.DATETIME;