-- ���� ��ȣ�ҿ� ���� ������ �̸��� �� ������ ��ȸ�ϴ� SQL ���� �ۼ����ּ���. 
-- �̶� �̸��� NULL�� ���� �������� ������ �ߺ��Ǵ� �̸��� �ϳ��� Ĩ�ϴ�.

SELECT COUNT(DISTINCT NAME) 'COUNT'
FROM ANIMAL_INS
WHERE NAME IS NOT NULL;
