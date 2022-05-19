-- ANIMAL_INS 테이블에 등록된 모든 레코드에 대해, 
-- 각 동물의 아이디와 이름, 들어온 날짜를 조회 
-- order by 아이디 순으로 조회해야 합니다.

SELECT
	ANIMAL_ID,
	NAME,
	DATE_FORMAT(DATETIME,'%Y-%m-%d')
FROM
	ANIMAL_INS
ORDER BY
	1;