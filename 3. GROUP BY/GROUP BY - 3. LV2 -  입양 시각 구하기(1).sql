-- ��ȣ�ҿ����� �� �ÿ� �Ծ��� ���� Ȱ���ϰ� �Ͼ���� �˾ƺ��� �մϴ�. 
-- 09:00���� 19:59����, �� �ð��뺰�� �Ծ��� �� ���̳� �߻��ߴ��� ��ȸ
-- ����� �ð��� ������ ����

-- ������������ DATETIME�� �ð��� ���� �� WHERE�� �� ���͸�
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


-- WHERE ���� HOUR(DATETIME) ����ҽ� �������� ���ɼ��� ����
-- https://www.mssqltips.com/sqlservertutorial/3204/avoid-using-functions-in-where-clause/
SELECT
    HOUR(DATETIME) 'H',
    COUNT(HOUR(DATETIME)) 'COUNT'
FROM ANIMAL_OUTS
WHERE 9 <= HOUR(DATETIME) AND HOUR(DATETIME) < 20
-- HOUR(DATETIME) �� ��� ����� �ε����� ��� ���Ͽ� ���� ����
-- SELECT���� aliases �� WHERE������ ��� �Ұ���
-- GROUP BY, ORDER BY, or HAVING clauses. ������ ��� ����
GROUP BY 1
ORDER BY 1;


-- GROUP BY Ȱ��
SELECT
    HOUR(DATETIME) 'H',
    COUNT(HOUR(DATETIME)) 'COUNT'
FROM ANIMAL_OUTS
GROUP BY 1
    HAVING 9 <= H AND H < 20
-- SELECT���� aliases ��
-- GROUP BY, ORDER BY, or HAVING clauses. ������ ��� ����
ORDER BY 1;