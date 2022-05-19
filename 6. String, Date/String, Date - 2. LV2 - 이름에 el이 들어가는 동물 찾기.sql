-- 이름에 "EL"이 들어가는 DOG의 아이디와 이름을 조회 대소문자는 구분하지 않습니다
-- 결과는 이름 순으로 조회
SELECT
    -- ANIMAL_TYPE,
    ANIMAL_ID,
    NAME
FROM ANIMAL_INS
WHERE NAME LIKE '%EL%' AND ANIMAL_TYPE LIKE 'DOG'
ORDER BY 2;