-- ����(Milk)�� ���Ʈ(Yogurt)�� ���ÿ� ������ ��ٱ��ϰ� �ִ���
-- ������ ���Ʈ�� ���ÿ� ������ [��ٱ����� ���̵�(CART_ID)]�� ��ȸ
-- ORDER BY [��ٱ����� ���̵�(CART_ID)] ������ ���;� �մϴ�.

SELECT DISTINCT A.CART_ID
FROM 
    (
        SELECT CART_ID
        FROM CART_PRODUCTS
        WHERE NAME LIKE 'Milk'
    ) A
    INNER JOIN
    (
        SELECT CART_ID
        FROM CART_PRODUCTS
        WHERE NAME LIKE 'Yogurt'
    ) B
        ON A.CART_ID = B.CART_ID
ORDER BY A.CART_ID;

-- 
-- 
-- 
-- SELECT 
--     CART_ID,
--     COUNT(CART_ID)
-- FROM CART_PRODUCTS
-- WHERE NAME IN ('Milk', 'Yogurt')
-- GROUP BY 1
-- 
-- 
-- 
-- -- 
-- SELECT DISTINCT A.CART_ID
-- FROM CART_PRODUCTS A
-- where CART_ID IN 
-- (
--     select DISTINCT B.CART_ID 
--     FROM CART_PRODUCTS B
--     WHERE 
--            B.NAME LIKE 'Milk'AND B.NAME LIKE 'Yogurt'
--     # NAME�� �� �࿡�� 'Milk'�� 'Yogurt'�� �� �࿡ ���ÿ� ������ �־�� �Ѵٴ� �ǹ�
--     # ���� �����ϴ� ���� ����
-- )
-- order by CART_ID asc
-- 
-- SELECT DISTINCT A.CART_ID
-- FROM CART_PRODUCTS A
-- WHERE A.CART_ID IN (
--     SELECT CART_ID
--     FROM CART_PRODUCTS
--     WHERE NAME IN ('Yogurt', 'Milk')
--     GROUP BY CART_ID
--     HAVING COUNT(NAME) >=2
--     ORDER BY 1
-- )
-- 
-- SELECT DISTINCT CART_ID  
-- FROM CART_PRODUCTS 
-- WHERE NAME = "Yogurt"
--     AND CART_ID IN 
--     (
--         SELECT CART_ID
--         FROM CART_PRODUCTS AS c
--         WHERE NAME = "Milk"
--     )
-- ORDER BY CART_ID;
-- 
-- SELECT *
-- FROM CART_PRODUCTS
-- WHERE CART_ID=1048 AND NAME LIKE 'MILK'
-- UNION
-- SELECT *
-- FROM CART_PRODUCTS
-- WHERE CART_ID=1048 AND NAME LIKE 'Yogurt'