DROP IF TABLE EXISTS employees;

CREATE TABLE employees(
    employees_id serial PRIMARY KEY,
    name text NOT NULL,
    job text NOT NULL,
    salary int NOT NULL
);

INSERT INTO employees (name,job,salary)
VALUES('LeBron James','Basketball Player','450000'),('Chester William','Police','500000'),
('stephen Curry','Basketball Player','600000'),('Will Smith','actor','780000'),
('Jackie Chan','actor','980000');

SELECT *
FROM employees ORDER BY name DESC;