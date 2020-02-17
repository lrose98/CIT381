# CIT 381
### Assignment 5

Instructions below
-----
#### Alumni Website REST Service
For Assignment 4 you created a list of tables to control the website. You were required to implement three of those tables with properties, and two of the tables were required to have a relationship. You were also required to implement five queries.

For Lab 6, you were required to duplicate code to create a working REST service using Node JS for the COLOR database table.

For this assignment, you will combine the efforts of Assignment 4 and Lab 6 and create a REST service for ONE of  your Assignment 4 tables. Below are the required elements.
- Do NOT use a table with a JOIN to avoid complicated queries
- Copy the Lab 6 **server-color.js** file and name the new file **alumni-server.js**
- Update the GET, POST, DELETE and PUT routes in alumni-server.js to work with your table
- Remove ALL references to color in **alumni-server.js**, and update with references to your new table or Alumni
- Test your REST routes using Postman, and document the following information in alumni-server-postman.txt
- **GET**
     - The GET URL to retrieve ALL rows from your table
     - The JSON result from Postman for all your rows
     - The GET URL to retrieve the first row by primary key from your table
     - The JSON result from Postman for your first row
- **POST**
     - The POST URL to insert a new row into your table
     - The JSON sent in Postman
     - The JSON result from Postman from POST action
- **Optional: PUT and DELETE**
     - Use Postman to perform DELETE and PUT actions
     - Below are two useful tutorials on using Postman:
