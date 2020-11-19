/*
For this challenge you need to create a RECURSIVE Hierarchical query. You have a table employees of employees, you must order each employee by level. You must use a WITH statement and name it employee_levels after that has been defined you must select from it.

A Level is in correlation what manager managers the employee. e.g. an employee with a manager_id of NULL is at level 1 and then direct employees with the employee at level 1 will be level 2.

employees table schema
	- id
	- first_name
	- last_name
	- manager_id (can be NULL)

resultant schema
	- level
	- id
	- first_name
	- last_name
	- manager_id (can be NULL)

NOTE: refer to the Results: expected table if you're stuck with how it should be displayed.
*/
WITH RECURSIVE employee_levels AS (
  SELECT
      1 AS level
    , id
    , first_name
    , last_name
    , manager_id
  FROM employees e
  WHERE manager_id IS NULL
  UNION
  SELECT
      level + 1 AS level
    , e.id
    , e.first_name
    , e.last_name
    , e.manager_id
  FROM employees e
  INNER JOIN employee_levels s ON s.id = e.manager_id
)
SELECT * FROM employee_levels