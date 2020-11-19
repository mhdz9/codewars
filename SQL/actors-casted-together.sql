/*
Given the the schema presented below find two actors who cast together the most and list titles of only those movies they were casting together. Order the result set alphabetically by the movie title.

Table film_actor
 Column     | Type                        | Modifiers
------------+-----------------------------+----------
actor_id    | smallint                    | not null
film_id     | smallint                    | not null
...

Table actor
 Column     | Type                        | Modifiers
------------+-----------------------------+----------
actor_id    | integer                     | not null 
first_name  | character varying(45)       | not null
last_name   | character varying(45)       | not null
...

Table film
 Column     | Type                        | Modifiers
------------+-----------------------------+----------
film_id     | integer                     | not null
title       | character varying(255)      | not null
...

The desired output:
first_actor | second_actor | title
------------+--------------+--------------------
John Doe    | Jane Doe     | The Best Movie Ever
...
	- first_actor - Full name (First name + Last name separated by a space)
	- second_actor - Full name (First name + Last name separated by a space)
	- title - Movie title
Note: actor_id of the first_actor should be lower then actor_id of the second_actor
*/
WITH cte AS (
  SELECT a1.actor_id AS first_actor, 
    a2.actor_id AS second_actor, 
    STRING_AGG(a2.film_id::text, ',') OVER (PARTITION BY a1.actor_id, a2.actor_id) AS film_id, 
    COUNT(a2.actor_id) OVER (PARTITION BY a1.actor_id, a2.actor_id) AS count
  FROM film_actor a1
  INNER JOIN film_actor a2 ON a2.film_id = a1.film_id AND a2.actor_id <> a1.actor_id
  ORDER BY 4 DESC, a1.actor_id
  LIMIT 1
)
SELECT a1.first_name || ' ' || a1.last_name AS first_actor
  , a2.first_name || ' ' || a2.last_name AS second_actor
  , f.title
FROM film f, cte c, actor a1, actor a2
WHERE c.first_actor = a1.actor_id
AND c.second_actor = a2.actor_id
AND f.film_id IN (SELECT fa1.film_id
          FROM film_actor fa1, film_actor fa2
          WHERE fa1.film_id = fa2.film_id
          AND fa1.actor_id = a1.actor_id
          AND fa2.actor_id = a2.actor_id)