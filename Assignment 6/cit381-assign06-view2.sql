-- CIT 381
-- Assignment 06
-- Lillie Rose

-- Create a view of contact information of all the members with success stories
CREATE VIEW vw_SuccessStoriesList
AS
SELECT 
    s.title,
    m.first_name,
    m.last_name,
    m.phone_number,
    m.email_address
FROM
    success_stories s
        INNER JOIN
    member_list m ON s.member_id = m.member_id;