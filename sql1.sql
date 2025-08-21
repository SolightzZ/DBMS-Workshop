
SELECT * FROM Depatment;
Select * from employee;

-- Update --
UPDATE employee
set depid = 1 , 
    firsName = 'Paniti' , 
    lastName = 'jahem'
where empID = 'A001';

DELETE from employee
where empID = 'A001';
