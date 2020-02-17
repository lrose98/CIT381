-- CIT 381 Fall 2019
-- Assignment #2
-- October 18th
-- Lillie Rose

-- A query to list all persons with family relationships using joins between person, family and relationship
select p.first_name, p.last_name, f.person_1, f.person_2 from relationship r
inner join family f on r.id = f.relationship_id
inner join person p on p.id = f.person_id;

-- A query to list all persons with friendship relationships using joins between person, friend and relationship
select p.first_name, p.last_name, f.person_1, f.person_2 from relationship r
inner join friend f on r.id = f.relationship_id
inner join person p on p.id = f.person_id;

-- A query to list all person, with or without a relationship of any kind, and any family relationships (hint: left join)
select p.first_name, p.last_name, f.person_1, f.person_2 from person p
left join family f on p.id = f.person_id;



