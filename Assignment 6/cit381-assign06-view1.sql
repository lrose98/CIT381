-- CIT 381
-- Assignment 06
-- Lillie Rose

-- Create a view to list all of the member's first name, last name, and email
CREATE VIEW vw_condensedMemberList
AS
SELECT
member_id
first_name,
last_name,
email_address
from member_list;