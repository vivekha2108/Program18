
INSERT INTO Student VALUES (102, 'Bala', 10);
INSERT INTO Student VALUES (103, 'Kumar', 20);
INSERT INTO Student VALUES (104, 'Priya', 10);
COMMIT;
Now the table contains:
STUDENTID STUDENTNAME DEPARTMENTID
--------- ----------- ------------
101 Arun 10
102 Bala 10
103 Kumar 20
104 Priya 10 Step 2: Create the function
CREATE OR REPLACE FUNCTION count_students (
p_department_id IN NUMBER
)
RETURN NUMBER
IS
v_count NUMBER;
BEGIN
SELECT COUNT(*)
INTO v_count
FROM Student
WHERE DepartmentID = p_department_id;
RETURN v_count;
END;
/
SET SERVEROUTPUT ON;
DECLARE
v_total NUMBER;
BEGIN
v_total := count_students(10);
DBMS_OUTPUT.PUT_LINE(
'Number of students in Department 10 = ' || v_total
);
END;
/
