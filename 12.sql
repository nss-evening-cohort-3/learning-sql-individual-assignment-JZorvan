-- 12. Provide a query that includes the track name with each invoice line item.

SELECT InvoiceLine.InvoiceLineId, Track.Name
FROM InvoiceLine
INNER JOIN Track
ON InvoiceLine.TrackId = Track.TrackId;
