-- 25. Provide a query that shows the top 5 most purchased tracks over all.

SELECT Track.Name AS 'Top Tracks' FROM Track
JOIN InvoiceLine ON Track.TrackId = InvoiceLine.TrackId
GROUP BY Track.Name ORDER BY COUNT (InvoiceLine.TrackId) DESC LIMIT 5;
