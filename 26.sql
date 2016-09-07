-- 26. Provide a query that shows the top 3 best selling artists.

SELECT Artist.Name AS 'Top 3 Best-Selling Artists' FROM Artist
JOIN Album ON Artist.ArtistId = Album.ArtistId
JOIN Track ON Album.AlbumId = Track.AlbumId
JOIN InvoiceLine ON Track.TrackId = InvoiceLine.TrackId
GROUP BY Artist.Name
ORDER BY COUNT (InvoiceLine.TrackId) DESC LIMIT 3;
