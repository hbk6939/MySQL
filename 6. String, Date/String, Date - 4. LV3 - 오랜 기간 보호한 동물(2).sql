-- �Ծ��� �� ���� ��, (��ȣ �Ⱓ�� ���� �����) ���� (�� ����)�� 
-- (���̵�� �̸�)�� ��ȸ. order by ��ȣ �Ⱓ�� desc �� ������ ��ȸ�ؾ� �մϴ�.

SELECT o.animal_id, o.name
FROM ANIMAL_OUTS o
    LEFT JOIN ANIMAL_INS i
        ON (o.animal_id = i.animal_id)
ORDER BY (o.datetime - i.datetime) DESC
LIMIT 2;



-- CTE���
with my as
(
    SELECT 
        o.ANIMAL_ID,
        o.NAME,
        (o.DATETIME - i.DATETIME) as 'diff'
    from ANIMAL_OUTS o
        inner join ANIMAL_INS i
            on o.ANIMAL_ID = i.ANIMAL_ID
)

select my.ANIMAL_ID, my.NAME
from my 
order by diff desc
limit 2;