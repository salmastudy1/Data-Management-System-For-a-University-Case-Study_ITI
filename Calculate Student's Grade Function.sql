create or replace function Calculate_Grade (v_id students.id%type)
return number
is
v_cp number(8,2) := 0;
v_ch number := 0;
v_grade number(8,2);
begin 
for v_grade_record in (
    select
      fname ||' '|| lname as "Student_Name",
      c.id,
      r.grade,
      c.credit_hours
    from students s, register r, courses c
    where s.id = r.student_id and r.course_id = c.id and s.id = v_id) loop
    --to check grade
    if v_grade_record.grade = 'A+' or v_grade_record.grade = 'A' then
    
    v_cp := v_cp + (v_grade_record.credit_hours * 4);
    v_ch:= v_ch + v_grade_record.credit_hours ;
    
    elsif v_grade_record.grade = 'A-'  then
    
    v_cp := v_cp + (v_grade_record.credit_hours * 3.7);
    v_ch:= v_ch + v_grade_record.credit_hours ;
     
    elsif  v_grade_record.grade = 'B+' then
    v_cp := v_cp+(v_grade_record.credit_hours * 3.3);
    v_ch:= v_ch + v_grade_record.credit_hours  ;
    
    elsif  v_grade_record.grade = 'B' then
    v_cp := v_cp+(v_grade_record.credit_hours * 3);
     v_ch:= v_ch +v_grade_record.credit_hours  ;
    
    
    elsif  v_grade_record.grade = 'B-' then
    v_cp := v_cp+(v_grade_record.credit_hours * 2.7);
     v_ch:= v_ch + v_grade_record.credit_hours  ;
    
     elsif  v_grade_record.grade = 'C+' then
    v_cp := v_cp+(v_grade_record.credit_hours * 2.3);
     v_ch:= v_ch + v_grade_record.credit_hours  ;
    
    elsif  v_grade_record.grade = 'C' then
    v_cp := v_cp+(v_grade_record.credit_hours * 2);
     v_ch:= v_ch + v_grade_record.credit_hours  ;
    
    elsif  v_grade_record.grade = 'C-' then
    v_cp := v_cp+(v_grade_record.credit_hours * 1.7);
    v_ch:= v_ch + v_grade_record.credit_hours  ;
    
     elsif  v_grade_record.grade = 'D+' then
    v_cp :=v_cp+( v_grade_record.credit_hours * 1.3);
    v_ch:= v_ch + v_grade_record.credit_hours  ;
    
    
     elsif  v_grade_record.grade = 'D' then
    v_cp :=v_cp+( v_grade_record.credit_hours * 1);
    v_ch:= v_ch + v_grade_record.credit_hours  ;
    
    elsif  v_grade_record.grade = 'F' then
    v_cp := v_cp;
    v_ch:= v_ch + v_grade_record.credit_hours  ;
     
     
    else 
     RAISE_APPLICATION_ERROR(-20001, 'Sorry! Data inserted is not valid.');
     
    
    end if;

  end loop;
  --calculating grade 
  if v_ch > 0 then
    v_grade := v_cp / v_ch;
  else
    v_grade := 0;
  end if;
  
  return v_grade;
end;

--calling function
set serveroutput on
declare
v_grade number;
begin
v_grade := Calculate_Grade(2001);
DBMS_OUTPUT.PUT_LINE('Function result = ' || v_grade);
--select 'Function result = ' || v_grade into DBMS_OUTPUT.PUT_LINE(v_grade) from dual;

end;
show errors;