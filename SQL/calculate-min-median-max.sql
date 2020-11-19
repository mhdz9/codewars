/*
For this challenge you need to create a simple SELECT statement. Your task is to calculate the MIN, MEDIAN and MAX scores of the students from the results table.

Tables and relationship below:

student
 Column     | Type                        | Modifiers
------------+-----------------------------+----------
id		    | integer                     | not null 
name 	    | character varying(45)       | not null

result
 Column     | Type                        | Modifiers
------------+-----------------------------+----------
id		    | integer                     | not null 
student_id  | integer			          | not null
scores      | numeric					  | not null

Resultant table:
	- min
	- median
	- max
*/
CREATE OR REPLACE FUNCTION _final_median(numeric[])
   RETURNS numeric AS
$$
   SELECT AVG(val)
   FROM (
     SELECT val
     FROM unnest($1) val
     ORDER BY 1
     LIMIT  2 - MOD(array_upper($1, 1), 2)
     OFFSET CEIL(array_upper($1, 1) / 2.0) - 1
   ) sub;
$$
LANGUAGE 'sql' IMMUTABLE;

CREATE AGGREGATE median(numeric) (
  SFUNC=array_append,
  STYPE=numeric[],
  FINALFUNC=_final_median,
  INITCOND='{}'
);

SELECT MIN(score) AS min, MEDIAN(score)::FLOAT AS median, MAX(score) AS max
FROM result