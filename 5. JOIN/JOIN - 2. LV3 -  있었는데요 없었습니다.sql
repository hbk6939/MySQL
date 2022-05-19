-- (��ȣ �����Ϻ��� ANIMAL_INS) > (�Ծ����� ANIMAL_OUTS) �� ���� ������ ���̵�� �̸��� ��ȸ
-- ����� ��ȣ �������� ���� ������ ��ȸ  DATETIME
SELECT
	-- o.DATETIME '�Ծ���',
	-- i.DATETIME '��ȣ ������',
	o.ANIMAL_ID,
	o.NAME
FROM ANIMAL_OUTS AS o
LEFT JOIN ANIMAL_INS AS i
        ON
	o.ANIMAL_ID = i.ANIMAL_ID
WHERE i.DATETIME > o.DATETIME
ORDER BY i.DATETIME;