-- ���� ��ȣ�ҿ� ���� ���� �̸� �� �� �� �̻� ���� �̸��� �ش� �̸��� ���� Ƚ���� ��ȸ
SELECT
    NAME,
    COUNT(NAME)
FROM ANIMAL_INS
GROUP BY 1
    HAVING COUNT(NAME) >= 2
ORDER BY 1;