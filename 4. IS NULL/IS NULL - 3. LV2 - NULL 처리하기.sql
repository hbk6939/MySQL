-- 동물의 생물 종, 이름, 성별 및 중성화 여부를 아이디 순으로 조회하는 SQL문을 작성해주세요. 
-- 이때 프로그래밍을 모르는 사람들은 NULL이라는 기호를 모르기 때문에, 
-- 이름이 없는 동물의 이름은 "No name"으로 표시해 주세요.

-- coalesce(열, null일경우 반환값)나 ifnull(열, null일경우 반환값) 사용
-- coalesce는 여러 값을 사용 가능 + sql표준, ifnull은 mysql에만 있는 함수
SELECT
    ANIMAL_TYPE,
    # ifnull(NAME, 'No name') 'NAME',
    coalesce(NAME, 'No name') 'NAME',
    SEX_UPON_INTAKE
FROM ANIMAL_INS;



SELECT
	ANIMAL_TYPE,
	CASE
		WHEN NAME IS NULL 
        THEN 'No name'
		ELSE NAME
    END 'NAME',
		SEX_UPON_INTAKE
FROM ANIMAL_INS;