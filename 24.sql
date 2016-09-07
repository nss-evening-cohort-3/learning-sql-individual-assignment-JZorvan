-- 24. Provide a query that shows the most purchased track of 2013.

SELECT Track.Name AS 'Track' FROM Track
JOIN InvoiceLine ON Track.TrackId = InvoiceLine.TrackId
JOIN Invoice ON InvoiceLine.InvoiceId = Invoice.InvoiceId
WHERE Invoice.InvoiceDate LIKE '2013%'
GROUP BY Track.Name
ORDER BY COUNT (InvoiceLine.TrackId) DESC LIMIT 9;
