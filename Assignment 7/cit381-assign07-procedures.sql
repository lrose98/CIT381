-- CIT 381
-- Assignment 7
-- r/girlsgonewired Database
-- Lillie Rose

--  inserts user IDs and any other user information you can find into the user table
DELIMITER //
CREATE PROCEDURE sp_insertUserIds(in author int(11), in subreddit_id varchar(11),in author_id varchar(45))
BEGIN
SELECT 
  author, subreddit_id, author_fullname
FROM
  assign07.users
ORDER BY author;
END //
DELIMITER ;

-- inserts data into the posting table and must include a user ID value in addition to all of the data required by the posting table
DELIMITER //
CREATE PROCEDURE sp_insertPostingTable(
	in id varchar(7),
    in subreddit_id varchar(11),
    in title varchar(255),
    in created_utc decimal(15, 2),
    in edited tinyint(4),
    in removed_by varchar(45),
    in url varchar(500),
    in num_comments int(11),
    in permalink varchar(500)
    )
BEGIN
SELECT 
  *
FROM
  assign07.posts
ORDER BY title;
END //
DELIMITER ;