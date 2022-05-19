-- (보호소에 들어올 당시에는 ANIMAL_INS) - (중성화 되지 않았지만 SEX_UPON_INTAKE), 
-- (보호소를 나갈 당시에는 ANIMAL_OUTS)  - (중성화된 동물의 SEX_UPON_OUTCOME) 
-- ANIMAL_ID와 ANIMAL_TYPE, NAME을 조회하는 아이디 순으로 조회

SELECT
	-- i.SEX_UPON_INTAKE,
	-- o.SEX_UPON_OUTCOME,
	i.ANIMAL_ID,
	i.ANIMAL_TYPE,
	i.NAME
FROM
	ANIMAL_INS AS i
LEFT JOIN ANIMAL_OUTS AS o
        ON
	i.ANIMAL_ID = o.ANIMAL_ID
WHERE
	i.SEX_UPON_INTAKE NOT IN (
        BINARY 'Spayed Female', 'Neutered Male'
    )
	AND 
    o.SEX_UPON_OUTCOME IN (
        BINARY 'Spayed Female', 'Neutered Male'
    );

SELECT
	-- i.SEX_UPON_INTAKE,
	-- o.SEX_UPON_OUTCOME,
	i.ANIMAL_ID,
	i.ANIMAL_TYPE,
	i.NAME
FROM
	ANIMAL_INS AS i
LEFT JOIN ANIMAL_OUTS AS o
        ON
	i.ANIMAL_ID = o.ANIMAL_ID
WHERE
	NOT
    (
        i.SEX_UPON_INTAKE LIKE 'Spayed Female'
		OR i.SEX_UPON_INTAKE LIKE 'Neutered Male'
    )
	AND 
    (
        o.SEX_UPON_OUTCOME LIKE 'Spayed Female'
		OR o.SEX_UPON_OUTCOME LIKE 'Neutered Male'
    );