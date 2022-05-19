-- 입양을 간 동물 중, (보호 기간이 가장 길었던) 동물 (두 마리)의 
-- (아이디와 이름)을 조회. order by 보호 기간이 desc 긴 순으로 조회해야 합니다.

SELECT o.animal_id, o.name
FROM ANIMAL_OUTS o
    LEFT JOIN ANIMAL_INS i
        ON (o.animal_id = i.animal_id)
ORDER BY (o.datetime - i.datetime) DESC
LIMIT 2;



-- CTE사용
with my as
(
    SELECT 
        o.ANIMAL_ID,
        o.NAME,
        (o.DATETIME - i.DATETIME) as 'diff'
    from ANIMAL_OUTS o
        inner join ANIMAL_INS i
            on o.ANIMAL_ID = i.ANIMAL_ID
)

select my.ANIMAL_ID, my.NAME
from my 
order by diff desc
limit 2;