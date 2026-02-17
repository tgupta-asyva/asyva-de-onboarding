-- deduplication.sql
-- Add your queries here

Deduplication means removing duplicate records while keeping one correct row.

Very common in:

ETL pipelines
Data warehouse (SCD handling)
Data cleaning

ways to remove duplicate records in sql are:

1. Using DISTINCT
	select distinct from employees;
✔ Removes exact duplicate rows
❌ Cannot control which row to keep

2. Using GROUP BY
	select email
	FROM users
	GROUP BY email;

3. Using ROW_NUMBER()

This is the best method when you want to:
(a) Keep latest record
(b) Keep smallest id
(c) Keep highest salary
(d) Control which duplicate survives

	select *,
		ROW_NUMBER() OVER (PARTITION BY email
	        ORDER BY created_at DESC) AS rn
	from users;

✔ Deduplicated
✔ Keeps latest record

4. Delete Duplicates
	
	DELETE u
	FROM users u
	JOIN users u2
  	ON u.email = u2.email
 	AND u.id > u2.id;
Meaning:
(a) If two emails same
(b) Delete the row with larger id

5. Using CTE (Modern & Clean Way)

	WITH cte AS (
    		SELECT *,
           	ROW_NUMBER() OVER (PARTITION BY email
               ORDER BY id) AS rn
    	FROM users
	)
	DELETE FROM cte
	WHERE rn > 1;


