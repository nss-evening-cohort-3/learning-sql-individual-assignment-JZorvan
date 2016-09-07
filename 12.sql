-- 12. Provide a query that includes the track name with each invoice line item.

SELECT InvoiceLine.InvoiceLineId AS 'Invoice Line #', Track.Name AS 'Track Name'
FROM InvoiceLine
JOIN Track
ON InvoiceLine.TrackId = Track.TrackId
ORDER BY InvoiceLine.InvoiceLineId;

