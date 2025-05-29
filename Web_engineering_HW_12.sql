/*1 Вывести id департамента , в котором работает сотрудник, в зависимости от Id сотрудника*/

SELECT department_id
FROM employees
WHERE id = 3; 

/*2 Создайте хранимую процедуру get_employee_age, которая принимает id сотрудника (IN-параметр) и возвращает его возраст через OUT-параметр.*/

DELIMITER $$

CREATE PROCEDURE get_employee_age(
    IN emp_id INT,
    OUT emp_age INT
)
BEGIN
    SELECT age
    INTO emp_age
    FROM employees
    WHERE id = emp_id;
END$$

DELIMITER ;

CALL get_employee_age(1, @age);
SELECT @age AS employee_age;

/*3 Создайте хранимую процедуру increase_salary, которая принимает зарплату сотрудника (INOUT-параметр) и уменьшает ее на 10%.*/

DELIMITER $$

CREATE PROCEDURE increase_salary(
    INOUT emp_salary DECIMAL(10,2)
)
BEGIN
    SET emp_salary = emp_salary * 0.9;
END$$

DELIMITER ;

SET @salary = 3700.00;
CALL increase_salary(@salary);
SELECT @salary;

