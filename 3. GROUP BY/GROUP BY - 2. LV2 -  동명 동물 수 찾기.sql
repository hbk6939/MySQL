-- 동물 보호소에 들어온 동물 이름 중 두 번 이상 쓰인 이름과 해당 이름이 쓰인 횟수를 조회
SELECT
    NAME,
    COUNT(NAME)
FROM ANIMAL_INS
GROUP BY 1
    HAVING COUNT(NAME) >= 2
ORDER BY 1;