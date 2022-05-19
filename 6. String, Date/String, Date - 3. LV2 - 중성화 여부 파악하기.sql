-- 중성화된 동물은 SEX_UPON_INTAKE 컬럼에 'Neutered' 또는 'Spayed'라는 단어가 들어있습니다.
-- SELECT 아이디와 이름, 중성화 여부를 ORDER BY 아이디 순으로 조회
-- 이때 중성화가 되어있다면 'O', 아니라면 'X'라고 표시해주세요.

-- 정규식
SELECT
	ANIMAL_ID,
	NAME,
	IF(SEX_UPON_INTAKE REGEXP '^Neutered|^Spayed','O','X') AS '중성화'
FROM ANIMAL_INS
ORDER BY 1;


-- 정규식 미사용시
SELECT
	ANIMAL_ID,
	NAME,
	IF(SEX_UPON_INTAKE LIKE 'Neutered%' OR SEX_UPON_INTAKE LIKE 'Spayed%'
       ,'O','X'
      ) AS '중성화'
FROM ANIMAL_INS
ORDER BY 1;



-- CTE(공통 테이블 표현식)
WITH MYCTE AS
(
SELECT
	ANIMAL_ID,
	SEX_UPON_INTAKE
FROM 
    ANIMAL_INS
WHERE
	SEX_UPON_INTAKE LIKE 'Neutered%'
	OR SEX_UPON_INTAKE LIKE 'Spayed%'
)

SELECT
	-- COUNT(*)
    A.ANIMAL_ID,
	A.NAME,
	IF(MY.SEX_UPON_INTAKE IS NULL,
	'X',
	'O') AS '중성화'
FROM
	ANIMAL_INS AS A
LEFT JOIN MYCTE AS MY
        ON
	A.ANIMAL_ID = MY.ANIMAL_ID
ORDER BY
	1