-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT backers_count, cf_id, outcome
FROM campaign
WHERE outcome = 'live'
GROUP BY cf_id, outcome
ORDER BY cf_id DESC;


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.

SELECT cf_id, COUNT (cf_id)
from backers
GROUP BY cf_id
ORDER BY cf_id DESC;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT con.first_name, con.last_name, con.email, 
cam.goal-cam.pledged AS "Amount left to reach goal", cam.outcome
INTO contact_table
FROM contacts AS con
INNER JOIN campaign AS cam
ON (con.contact_id = cam.contact_id)
WHERE cam.outcome = 'live'
ORDER BY "Amount left to reach goal";


-- Check the table

SELECT* FROM contact_table

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT bac.email, bac.first_name, bac.last_name, bac.cf_id, cam.company_name, cam.description, cam.end_date, cam.goal-cam.pledged AS "Left of Goal"
INTO email_backers_remaining_goal_amount
FROM backers AS bac
INNER JOIN campaign AS cam
ON (bac.cf_id = cam.cf_id)
ORDER BY bac.email DESC;

-- Check the table

SELECT* FROM email_backers_remaining_goal_amount

