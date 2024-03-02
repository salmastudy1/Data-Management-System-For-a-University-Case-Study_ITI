create or replace procedure update_address(v_id students.id%type , v_address students.address%type)
is 
begin 
update students set address = v_address
where id = v_id;
end;

select*from students;

declare
begin update_address(2002, '14 sheraton, Cairo');
end;
select*from students;