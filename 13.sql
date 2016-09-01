-- 13. Provide a query that includes the purchased track name AND artist name with each invoice line item.

SELECT Track.Name, Artist.Name, InvoiceLine.* FROM InvoiceLine
JOIN Track ON InvoiceLine.TrackId = Track.TrackId
JOIN Album ON Track.AlbumId = Album.AlbumId
JOIN Artist ON Album.ArtistId = Artist.ArtistId;
