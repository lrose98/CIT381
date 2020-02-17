-- CIT 381
-- Fall 2019
-- Assignment 4
-- Lillie Rose

-- Select all blog articles that were written by an alumni member (TABLES WITH RELATIONSHIP)
SELECT 
    b.article_id, a.author_id, b.title
FROM
    blog_article b,
    member_list m
        INNER JOIN
    blog_authors a ON a.author_id = m.member_id;

-- Output all members that are registered to the "CIT Minor Reunion" Event (SUBQUERY)
SELECT 
    m.member_id, m.first_name, m.last_name, m.phone_number
FROM
    member_list m
        INNER JOIN
    event_regisration e ON m.member_id = e.member_id
WHERE
    e.event_id IN (SELECT 
            v.title
        FROM
            events v
        WHERE
            v.title = 'CIT Minor Reunion');

-- Select alumni members and their emails that graduated in 2018 or earlier
SELECT 
    member_id, first_name, last_name, email_address
FROM
    member_list
WHERE
    graduation_date < '2018-12-31';

-- Output all contact inquires of non-alumni members
SELECT 
    m.first_name,
    m.last_name,
    c.email_address,
    c.question_summary,
    c.question_detailed
FROM
    contact c,
    member_list m
WHERE
    c.email_address != m.email_address;

-- Find the contact information of all the members with success stories
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