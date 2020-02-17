# CIT 381
### Assignment 1

Instructions below
-----
#### Part I
Based on your major or area of interest, identify a relevant "thing" (an object in the real world) that has multiple unique instances. List at least five properties unique to this "thing." At least two of the properties should be repeatable properties. For example, consider a basketball and possible properties shown below. Manufacturer would repeat (as might other fields). You must produce your own list.

With this information, execute the following tasks:
1. Record the list of columns, the type of data (string, integer, float, boolean, date/time) and save this information in a file called **thing_schema_notes.txt.** Append the list of five instances data to the bottom of this file.
2. Create a table called thing and based on the sample data create the five columns of appropriate data type and size.
3. Use Workbench to show the SQL to create your "thing" table. Save this SQL as a text file called **thing_create.sql.**
4. Insert at least five rows of data into the "thing" database using insert statements. Save these SQL insert queries into a single file called **thing_insert.sql.**
5. Create a query to list all of the entities in the "thing" table ordered by one of the columns in descending order, and save this query to a file called **thing_select_desc.sql.**
6. Create a query to delete one unique row from the "thing" table and save this query to a file called **thing_delete.sql.**
7.  Identify columns with repeating data. Save the names of these columns in a file called **thing_repeat.txt.** For example, in the sample data the Manufacturer and Indoor/Outdoor/Both columns repeat.
8. Identify one or more columns that if used would present unique data that could be used to identify one and only one entity. Save the name(s) of the column(s) in a file called thing_keys.txt. For example, we could use the Model column, but it is possible that two different manufactures have the same model name. From the example data, Manufacturer and Model together would form a unique identifier.

#### Part II
1. Use the Internet to lookup definitions for the following terms. Your answers must be in your own words and not directly copied from the Internet. Save your definitions to a file called **definitions.txt.**

*database schema
DBMS
primary key
foreign key
surrogate key
entity integrity
referential integrity
weak entity*
