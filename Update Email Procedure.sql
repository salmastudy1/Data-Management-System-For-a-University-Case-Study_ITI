create or replace procedure update_email(v_id students.id%type , v_email students.email%type)
is 
begin 
update students set email = v_email
where id = v_id;
end;

select*from students;

declare
begin update_email(2001, 'amira2@gmail.com');
end;
select*from students;