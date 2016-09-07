-- 27. Provide a query that shows the most purchased Media Type.

SELECT MediaType.Name AS 'Most Purchased Media Type' FROM MediaType
JOIN Track ON MediaType.MediaTypeId = Track.MediaTypeId
JOIN InvoiceLine ON Track.TrackId = InvoiceLine.TrackId
GROUP BY MediaType.Name
ORDER BY COUNT (InvoiceLine.TrackId) DESC LIMIT 1;
