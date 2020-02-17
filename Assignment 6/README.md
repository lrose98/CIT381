# CIT 381
### Assignment 6

Instructions below
-----
#### SQL Views
Create two SQL views that work with your Assignment 5 alumni database. Both of your views must start with the vw_ prefix.

**View #1:** Create a simple view that returns data from one of your tables. Export the SQL to create this view to a file called **cit381-assign06-view1.sql.**

**View #2:** Create a view that returns data from two tables using a JOIN statement. Export the SQL to create this view to a file called **cit381-assign06-view2.sql.**

Add a new GET route to your NodeJS code to use the second view (the view with the JOIN statement). Remember you will have to ensure the new route is not the same as any other GET route.

#### Stored Procedure
Create a stored procedure that deletes a row from one of your tables. The stored procedure must take an appropriate primary key parameter to determine which row to delete. The stored procedure name must start with the sp_ prefix. Export the SQL to create this stored procedure to a file called **cit381-assign06-sp.sql.**

Add a new DELETE route to your NodeJS code to use the stored procedure to delete a row. You will need to adjust your SQL to call the stored procedure, and supply the primary key as an argument to the stored procedure. Remember you will have to ensure the new route is not the same as any other DELETE route.
