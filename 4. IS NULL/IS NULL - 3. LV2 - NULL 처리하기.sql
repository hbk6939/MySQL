-- ������ ���� ��, �̸�, ���� �� �߼�ȭ ���θ� ���̵� ������ ��ȸ�ϴ� SQL���� �ۼ����ּ���. 
-- �̶� ���α׷����� �𸣴� ������� NULL�̶�� ��ȣ�� �𸣱� ������, 
-- �̸��� ���� ������ �̸��� "No name"���� ǥ���� �ּ���.

-- coalesce(��, null�ϰ�� ��ȯ��)�� ifnull(��, null�ϰ�� ��ȯ��) ���
-- coalesce�� ���� ���� ��� ���� + sqlǥ��, ifnull�� mysql���� �ִ� �Լ�
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