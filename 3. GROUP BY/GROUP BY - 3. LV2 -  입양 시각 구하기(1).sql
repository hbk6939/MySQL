-- 보호소에서는 몇 시에 입양이 가장 활발하게 일어나는지 알아보려 합니다. 
-- 09:00부터 19:59까지, 각 시간대별로 입양이 몇 건이나 발생했는지 조회
-- 결과는 시간대 순으로 정렬

-- 서브쿼리에서 DATETIME의 시간을 추출 후 WHERE로 행 필터링
SELECT
    A.HOUR,
    COUNT(A.HOUR)
FROM 
    (
        SELECT HOUR(DATETIME) 'HOUR'
        FROM ANIMAL_OUTS
    ) A
WHERE 9<=A.HOUR AND A.HOUR<20
GROUP BY 1
ORDER BY 1;


-- WHERE 절에 HOUR(DATETIME) 사용할시 성능저하 가능성이 높음
-- https://www.mssqltips.com/sqlservertutorial/3204/avoid-using-functions-in-where-clause/
SELECT
    HOUR(DATETIME) 'H',
    COUNT(HOUR(DATETIME)) 'COUNT'
FROM ANIMAL_OUTS
WHERE 9 <= HOUR(DATETIME) AND HOUR(DATETIME) < 20
-- HOUR(DATETIME) 를 계속 사용인 인덱스를 사용 못하여 성능 저하
-- SELECT문의 aliases 는 WHERE에서는 사용 불가능
-- GROUP BY, ORDER BY, or HAVING clauses. 에서만 사용 가능
GROUP BY 1
ORDER BY 1;


-- GROUP BY 활용
SELECT
    HOUR(DATETIME) 'H',
    COUNT(HOUR(DATETIME)) 'COUNT'
FROM ANIMAL_OUTS
GROUP BY 1
    HAVING 9 <= H AND H < 20
-- SELECT문의 aliases 는
-- GROUP BY, ORDER BY, or HAVING clauses. 에서만 사용 가능
ORDER BY 1;