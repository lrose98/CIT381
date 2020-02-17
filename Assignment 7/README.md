# CIT 381
### Assignment 7

Instructions below
-----
#### Step 1: Identify JSON Data Source
Reddit contains a large number of categorized topics. Find a topic of interest by navigating to the reddit website (Links to an external site.), enter a topic of interest, and search for a reddit in the search results Communities and Users section. You will need to find a reddit with at least 20 postings, so select a reddit with a large number of subscribers.

Each reddit URL consists of the reddit domain name, followed by an r, then the name of the reddit. For example, for the security reddit: www.reddit.com/r/security/ (Links to an external site.).

Every reddit includes a JSON version of the postings. To view the JSON version, remove the trailing slash, and append.json. The security reddit becomes: www.reddit.com/r/security.json (Links to an external site.). The display of the JSON data will depend upon the browser you are using. Some browsers will help with JSON formatting.

You will need to extract the raw JSON data, and save the data to a file called **cit381-assign07-reddit.json.**

#### Step 2: Create a model to hold your JSON data
You will need to design a database to store the reddit information. Analyze the JSON, and determine what tables you will need, and the primary keys for each table. You must store enough information to provide most of the information visible for a non-promotional reddit posting. The required data items are:
- Posted by, and/or cross posted
- Date/time of posting
- Title of posting
- Score
- Link to original article
- Number of comments
- Number of cross posts
- Links to comments (you will need to analyze the original web page to determine what property contains the comment link)
*Note:* Include the comments table in your schema, but don't worry about populating this table. Only individual reddit posting contain links to comments, so will not be parsing out this data.

You will also need to store user IDs in a user table, and relate the user table to the posting table.

When modeling your database tables for a reddit posting, you need to apply the normalization rules.

Save your database model as **cit381-assign07-schema.sql.** Export an image of your schema as a png file and save as **cit381-assign07-schema.png.**

#### Step 3: Manually enter a few rows of JSON data into MySQL
You will need to eventually load all of your JSON into your database tables, but for now, manually enter in a couple of entries.

Export the manually entered data from all of the tables using the Export recordset to an external file button above the results in the Result Grid. You will need to export each table as a csv file, then combine all of the data into a single file called **cit381-assign07-data.csv.**

#### Step 4: Create SQL View

Create one meaningful view for your data. Do not simply create a select statement that returns all columns from one table: you MUST use a join, and include a computed field, such as the age of the posting.

Save the SQL to create the view in a file called **cit381-assign07-view.sql.**

#### Step 5: Create stored procedures

Create the following two stored procedures without using a view, only base tables:
The *first stored procedure* inserts user IDs and any other user information you can find into the user table.
The *second stored procedure* inserts data into the posting table and must include a user ID value in addition to all of the data required by the posting table.
Save the SQL to create both stored procedures in a file called **cit381-assign07-procedures.sql.**
