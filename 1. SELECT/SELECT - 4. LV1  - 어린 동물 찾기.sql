-- ���� ��ȣ�ҿ� ���� ���� �� ���� ������ ���̵�� �̸��� ��ȸ
SELECT ANIMAL_ID, name
FROM ANIMAL_INS
WHERE INTAKE_CONDITION NOT LIKE 'aged'
ORDER BY ANIMAL_ID;