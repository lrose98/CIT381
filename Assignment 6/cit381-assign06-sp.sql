-- CIT 381
-- Assignment 06
-- Lillie Rose

-- Create procesure that deletes a row from the member_list table
DELIMITER // 
CREATE PROCEDURE sp_deleteMembers(in MEMBER_ID int)
BEGIN
    DELETE FROM MEMBER_LIST
    WHERE MEMBER_ID = MEMBER_ID
END 
DELIMITER ;