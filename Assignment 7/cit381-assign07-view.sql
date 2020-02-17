-- CIT 381
-- Assignment 7
-- r/girlsgonewired Database
-- Lillie Rose

-- Create a view that houses the posts with an above 20 score, and their author, title, url, and score
CREATE VIEW vw_ScoreAboveTwenty
AS
SELECT u.author, p.title, p.url, CONCAT(a.ups - a.downs) AS 'SCORE' FROM users u
inner join posts p on p.author_fullname = u.author_fullname
inner join analytics a on a.id = p.id
WHERE a.score > 20
order by a.score ASC;
