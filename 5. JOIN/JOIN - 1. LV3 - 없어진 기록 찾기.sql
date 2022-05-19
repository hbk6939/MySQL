-- ANIMAL_INS 테이블은 동물 보호소에 들어온 동물의 정보를 담은 테이블입니다.
-- ANIMAL_OUTS 테이블은 동물 보호소에서 입양 보낸 동물의 정보를 담은 테이블입니다.
-- ANIMAL_OUTS 기록은 있는데, ANIMAL_INS 기록이 없는 
-- 동물의 ID와 이름을 ID 순으로 조회 ANIMAL_ID

-- join 사용시
SELECT
	ao.ANIMAL_ID,
	ao.NAME
FROM ANIMAL_OUTS ao
LEFT JOIN ANIMAL_INS ai
        ON
	ai.ANIMAL_ID = ao.ANIMAL_ID
WHERE ai.ANIMAL_ID IS NULL
ORDER BY ao.ANIMAL_ID;

-- 서브쿼리 사용시1
SELECT
	ao.ANIMAL_ID,
	ao.name
FROM ANIMAL_OUTS ao
WHERE
	ao.ANIMAL_ID NOT IN 
    (
	SELECT COALESCE(ai.ANIMAL_ID, 0)
	FROM ANIMAL_INS ai
    )
ORDER BY ao.ANIMAL_ID;
 
-- 서브쿼리 사용2
SELECT
	ao.ANIMAL_ID,
	ao.NAME
FROM ANIMAL_OUTS ao
WHERE NOT EXISTS (
	SELECT 	ai.ANIMAL_ID
	FROM ANIMAL_INS ai
	WHERE ao.ANIMAL_ID = ai.ANIMAL_ID
)
ORDER BY ao.ANIMAL_ID;


-- In : 조건에 만족하는 row 찾기
-- Exists : Exists이하 절이 true인지 아닌지를 체크

-- Not In 은 Where 절의 조건이 만족하더라도 연결고리 컬럼이 Null값을 갖는 경우 결과에서 제외 됩니다.

-- Not Exists는 Not In과 달리 Null값을 가진 Row들도 결과에 포함됩니다.
-- 이는 연결고리 값이 Null값을 가질때 Not In은 조인 연산을 하지 않기 때문에 결과에서 제외되며
-- Not Exists는 Exists 이하의 절이 False를 리턴하고 거기에 대한 
-- Not이기 때문에 결과적으로 true가 되어 결과에 포함
