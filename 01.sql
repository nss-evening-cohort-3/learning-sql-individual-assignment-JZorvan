-- 1. Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.


SELECT CustomerId AS 'Customer Id#', Last Name || ', ' || FirstName AS 'Customer', Country AS 'Customer Country' FROM Customer WHERE Country != 'USA';
