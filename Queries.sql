-- 1. Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.

SELECT CustomerId AS 'Customer Id#', Last Name || ', ' || FirstName AS 'Customer', Country AS 'Customer Country' FROM Customer WHERE Country != 'USA';

-- 2. Provide a query only showing the Customers from Brazil.

SELECT * FROM Customer WHERE Country = "Brazil";

-- 3. Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.

SELECT Customer.FirstName || ' ' || Customer.LastName AS Customer, Invoice.InvoiceId AS 'Invoice ID', Invoice.InvoiceDate AS 'Invoice Date', Invoice.BillingCountry AS 'Billing Country'
FROM Customer
INNER JOIN Invoice
ON Customer.CustomerId = Invoice.CustomerId
WHERE Customer.Country = 'Brazil';

-- 4. Provide a query showing only the Employees who are Sales Agents.

SELECT LastName || ", " || FirstName AS 'Sales Agents' FROM Employee WHERE Title = 'Sales Support Agent';

-- 5. Provide a query showing a unique list of billing countries from the Invoice table.

SELECT DISTINCT BillingCountry AS 'Billing Countries' FROM Invoice;

-- 6. Provide a query showing the invoices of customers who are from Brazil.

SELECT Customer.FirstName || ' ' || Customer.LastName AS 'Customer', Invoice.*
FROM Customer
INNER JOIN Invoice
ON Customer.CustomerId = Invoice.CustomerId
WHERE Customer.Country = 'Brazil';

-- 7. Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.

SELECT Employee.LastName || ', ' || Employee.FirstName AS 'Sales Agent', Invoice.*
FROM Employee, Customer
JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId
WHERE Employee.EmployeeId = Customer.SupportRepId
ORDER BY Employee.LastName;

-- 8. Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.

SELECT Invoice.Total AS 'Invoice Total', Customer.FirstName || ' ' || Customer.LastName AS 'Customer', Customer.Country, Employee.FirstName || ' ' || Employee.LastName AS 'Sales Agent'
FROM Employee, Customer
INNER JOIN Invoice
ON Customer.CustomerId = Invoice.CustomerId
WHERE Employee.EmployeeId = Customer.SupportRepId
ORDER BY Customer.LastName;

-- 9. How many Invoices were there in 2009 and 2011? What are the respective total sales for each of those years?

SELECT COUNT (InvoiceDate) AS 'Number of Invoices Between 2009 and 2011' FROM Invoice WHERE InvoiceDate BETWEEN '2009-01-01' AND '2011-12-31';
Answer:  249

SELECT SUM (Total) AS 'Total Sales in 2009' FROM Invoice WHERE InvoiceDate BETWEEN '2009-01-01' AND '2009-12-31';
Answer:  $449.46

SELECT SUM (Total) AS 'Total Sales in 2010' FROM Invoice WHERE InvoiceDate BETWEEN '2010-01-01' AND '2010-12-31';
Answer:  $481.45

SELECT SUM (Total) AS 'Total Sales in 2011' FROM Invoice WHERE InvoiceDate BETWEEN '2011-01-01' AND '2011-12-31';
Answer:  $469.58

-- 10. Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.

SELECT COUNT (InvoiceLineId) AS '# of line items for Invoice 37' FROM InvoiceLine WHERE InvoiceId = 37;

Answer:  4;
