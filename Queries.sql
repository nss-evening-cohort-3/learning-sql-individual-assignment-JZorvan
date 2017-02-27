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

-- 11. Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice.

SELECT InvoiceId AS 'Invoice ID#', (SELECT COUNT (InvoiceLineId)) AS 'Number of Line Items'
FROM InvoiceLine
GROUP BY InvoiceId;

-- 12. Provide a query that includes the track name with each invoice line item.

SELECT InvoiceLine.InvoiceLineId AS 'Invoice Line #', Track.Name AS 'Track Name'
FROM InvoiceLine
JOIN Track
ON InvoiceLine.TrackId = Track.TrackId
ORDER BY InvoiceLine.InvoiceLineId;

-- 13. Provide a query that includes the purchased track name AND artist name with each invoice line item.

SELECT Track.Name AS 'Track', Artist.Name AS 'Artist', InvoiceLine.* FROM InvoiceLine
JOIN Track ON InvoiceLine.TrackId = Track.TrackId
JOIN Album ON Track.AlbumId = Album.AlbumId
JOIN Artist ON Album.ArtistId = Artist.ArtistId;

-- 14. Provide a query that shows the # of invoices per country.

SELECT BillingCountry AS 'Country', (SELECT COUNT (BillingCountry)) AS '# of Invoices'
FROM Invoice
GROUP BY BillingCountry;

-- 15. Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resulant table.

SELECT Playlist.Name AS 'Playlist Name', (SELECT COUNT (PlaylistTrack.TrackId)) AS 'Number of Tracks'
FROM Playlist
JOIN PlaylistTrack
ON PlaylistTrack.PlaylistId = Playlist.PlaylistId
GROUP BY Playlist.PlaylistId;

-- 16. Provide a query that shows all the Tracks, but displays no IDs. The resultant table should include the Album name, Media type and Genre.

SELECT Genre.Name, Track.Name, Album.Title, Composer, MediaType.Name, Milliseconds, Bytes, UnitPrice FROM Track
JOIN Genre ON Track.GenreId = Genre.GenreId
JOIN Album ON Track.AlbumId = Album.AlbumId
JOIN MediaType ON Track.MediaTypeId = MediaType.MediaTypeId;

-- 17. Provide a query that shows all Invoices but includes the # of invoice line items.

SELECT Invoice.*, (SELECT COUNT (InvoiceLine.InvoiceId)) AS '# of Line Items' FROM Invoice
JOIN InvoiceLine WHERE Invoice.InvoiceId = InvoiceLine.InvoiceId
GROUP BY Invoice.InvoiceId;

-- 18. Provide a query that shows total sales made by each sales agent.

SELECT Employee.FirstName || ' ' || Employee.LastName AS 'Sales Rep', (SELECT SUM (Invoice.Total)) AS 'Total Sales' FROM Invoice
JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
JOIN Employee ON Customer.SupportRepId = Employee.EmployeeId
GROUP BY Employee.LastName;

-- 19. Which sales agent made the most in sales in 2009?

SELECT Employee.FirstName || ' ' || Employee.LastName AS 'Sales Rep' FROM Invoice
JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
JOIN Employee ON Customer.SupportRepId = Employee.EmployeeId
WHERE Invoice.InvoiceDate BETWEEN '2009-01-01' AND '2009-12-31'
GROUP BY Employee.LastName ORDER BY SUM (Invoice.Total) DESC LIMIT 1;

-- 20. Which sales agent made the most in sales in 2010?

SELECT Employee.FirstName || ' ' || Employee.LastName AS 'Sales Rep' FROM Invoice
JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
JOIN Employee ON Customer.SupportRepId = Employee.EmployeeId
WHERE Invoice.InvoiceDate BETWEEN '2010-01-01' AND '2010-12-31'
GROUP BY Employee.LastName ORDER BY SUM (Invoice.Total) DESC LIMIT 1;

-- 21. Which sales agent made the most in sales over all?

SELECT Employee.FirstName || ' ' || Employee.LastName AS 'Sales Rep' FROM Invoice
JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
JOIN Employee ON Customer.SupportRepId = Employee.EmployeeId
WHERE Invoice.InvoiceDate
GROUP BY Employee.LastName ORDER BY SUM (Invoice.Total) DESC LIMIT 1;

-- 22. Provide a query that shows the # of customers assigned to each sales agent.

SELECT Employee.FirstName || ' ' || Employee.LastName AS 'Sales Agent', (SELECT COUNT (Customer.SupportRepId)) AS 'Number of Customers' FROM Employee, Customer
WHERE Employee.EmployeeId = Customer.SupportRepId
GROUP BY Employee.LastName;

-- 23. Provide a query that shows the total sales per country. Which country's customers spent the most?

SELECT Customer.Country, (SELECT SUM (Invoice.Total)) AS 'Total Sales' FROM Invoice
JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
GROUP BY Customer.Country;

-- 24. Provide a query that shows the most purchased track of 2013.

SELECT Track.Name AS 'Track' FROM Track
JOIN InvoiceLine ON Track.TrackId = InvoiceLine.TrackId
JOIN Invoice ON InvoiceLine.InvoiceId = Invoice.InvoiceId
WHERE Invoice.InvoiceDate LIKE '2013%'
GROUP BY Track.Name
ORDER BY COUNT (InvoiceLine.TrackId) DESC LIMIT 9;

-- 25. Provide a query that shows the top 5 most purchased tracks over all.

SELECT Track.Name AS 'Top Tracks' FROM Track
JOIN InvoiceLine ON Track.TrackId = InvoiceLine.TrackId
GROUP BY Track.Name ORDER BY COUNT (InvoiceLine.TrackId) DESC LIMIT 5;

-- 26. Provide a query that shows the top 3 best selling artists.

SELECT Artist.Name AS 'Top 3 Best-Selling Artists' FROM Artist
JOIN Album ON Artist.ArtistId = Album.ArtistId
JOIN Track ON Album.AlbumId = Track.AlbumId
JOIN InvoiceLine ON Track.TrackId = InvoiceLine.TrackId
GROUP BY Artist.Name
ORDER BY COUNT (InvoiceLine.TrackId) DESC LIMIT 3;

-- 27. Provide a query that shows the most purchased Media Type.

SELECT MediaType.Name AS 'Most Purchased Media Type' FROM MediaType
JOIN Track ON MediaType.MediaTypeId = Track.MediaTypeId
JOIN InvoiceLine ON Track.TrackId = InvoiceLine.TrackId
GROUP BY MediaType.Name
ORDER BY COUNT (InvoiceLine.TrackId) DESC LIMIT 1;
