/*
For this challenge you need to PIVOT data. You have two tables, products and details. Your task is to pivot the rows in products to produce a table of products which have rows of their detail. Group and Order by the name of the Product.

Tables and relationship below:

products
 Column     | Type                        | Modifiers
------------+-----------------------------+----------
id		    | integer                     | not null 
name 	    | character varying(45)       | not null

details
 Column     | Type                        | Modifiers
------------+-----------------------------+----------
id		    | integer                     | not null 
product_id  | integer			          | not null
detail      | character varying(500)	  | not null

You must use the CROSSTAB statement to create a table that has the schema as below:

CROSSTAB table.
	- name
	- good
	- ok
	- bad

Compare your table to the expected table to view the expected results.
*/
CREATE EXTENSION tablefunc;

SELECT * 
FROM crosstab(
    'SELECT p.name, d.detail, COUNT(d.id)
    FROM products p
    INNER JOIN details d ON p.id = d.product_id
    GROUP BY p.name, d.detail
    ORDER BY p.name, d.detail') 
AS result (name text, bad bigint, good bigint, ok bigint);