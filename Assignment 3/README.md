# CIT 381
### Assignment 3

Instructions below
-----
#### Part I
For this first part, you will be creating an EER Diagram using MySQL Workbench for a store with employees. Below are the requirements for this EER Diagram.

1. *Schema Name:* assign03
2. *Model Filename:* Save your model as **cit381-assign03-store.mwb.**
3. *Schema Filename:* Forward engineer your model and save the SQL that creates your model as cit381-assign03-store.sql.
4. *Image Filename:* Use Workbench to export an image (PNG) of your model (File | Export | Export as PNG) as **cit381-assign03-store.png.**

**Rules:**
- The store has employees (ID, last, first, hire date, release date, manager)
- All employees must work at a store
- An employee may have a manager
- An employee can be assigned to more than one store
- A store can have more than one employee
- All stores belong to a region
-  A store can be in only one region
- Remember to add relationship labels to All relationships


#### Part II
For this second part, you will be creating an EER Diagram using MySQL Workbench for auction web site. Below are the requirements for this EER Diagram.

1. *Schema Name:* assign03
2. *Model Filename:* Save your model as **cit381-assign03-auction.mwb.**
3. *Schema Filename:* Forward engineer your model and save the SQL that creates your model as **cit381-assign03-auction.sql.**
4. *Image Filename:* Use Workbench to export an image (PNG) of your model (File | Export | Export as PNG) as **cit381-assign03-auction.png.**

Rather than a list of bulleted rules, extract the rules from the following paragraph.

**An auction web site has items for sale that are provided by sellers. Each item has an opening price, a reserve price, a description, and an ending time. Customers submit bids. The highest, earliest bid submitted before the ending time is the winning bid and the item is sold to the bidder. The auction company wants to be able to analyze the sales behavior of its customers and sellers and so must keep track of all bids and sales.**

Hint: Suggested entities are customers, sellers, items, and bids, appropriately named.
