-- �̸��� "EL"�� ���� DOG�� ���̵�� �̸��� ��ȸ ��ҹ��ڴ� �������� �ʽ��ϴ�
-- ����� �̸� ������ ��ȸ
SELECT
    -- ANIMAL_TYPE,
    ANIMAL_ID,
    NAME
FROM ANIMAL_INS
WHERE NAME LIKE '%EL%' AND ANIMAL_TYPE LIKE 'DOG'
ORDER BY 2;