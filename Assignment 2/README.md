# CIT 381
### Assignment 2

Instructions below
-----
#### Part I
Use any drawing program (including MySQL Model if you want to explore ahead) to illustrate your tables, the table properties, property data types, and any relationships. Clearly mark which column is the primary key or keys, and which columns are foreign keys. You are welcome to use surrogate columns for primary keys.

Below is a list of required tables. The columns are not provided so you will need to determine which columns you need. If you choose to use a surrogate primary key column with a table, then that table MUST have at least one non-null column. An exception to this rule is any many to many tables. Included with each required table specification is the type of table if a M:N table and the number of minimum columns and rows.

*person - 3 columns minimum and 10 rows minimum
relationship - 1 column minimum and 10 rows minimum
family - M:N, 3 columns minimum and 5 rows minimum
friend - M:N, 3 columns minimum and 5 rows minimum*
**Note:** We have not yet covered how to create relationships, so you're table will not enforce referential integrity, only entity integrity.

When entering data for the tables, note that you will need to use the relationship table to not only include relationships describing family, but also relationships describing friendship.

All of the relationships between tables are 1:M, but note that the relationships between person and relationship are M:N where family is an M:N table and friend is an M:N table.

The deliverables for Part I are:
1. A PDF of your entity relationship (ER) diagram named **er_diagram.pdf**
2. The SQL to create your four tables in a single SQL file named **schema.sql**
3. Four csv exports of the data of each of your four tables named **person_data.csv, relationship_data.csv, family_data.csv and friend_data.csv** (use Workbench Table Data Export Wizard)

#### Part II
You were about impress the bride's father with your database schema when you realize that perhaps you should test your model by writing a few SQL queries.

Create a file called **queries.sql**, construct the following queries, and the queries to the SQL file. Include the query description below before each query as a query comment, and separate each query with a blank line. Remember to end each query with a semi-colon.

- A query to list all persons with family relationships using joins between person, family and relationship
- A query to list all persons with friendship relationships using joins between person, friend and relationship
- A query to list all person, with or without a relationship of any kind, and any family relationships (hint: left join)
