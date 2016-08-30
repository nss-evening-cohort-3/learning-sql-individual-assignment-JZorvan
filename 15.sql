-- 15. Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resulant table.

SELECT Playlist.Name AS 'Playlist Name', (SELECT COUNT (PlaylistTrack.TrackId)) AS 'Number of Tracks'
FROM Playlist
INNER JOIN PlaylistTrack
ON PlaylistTrack.PlaylistId = Playlist.PlaylistId
GROUP BY Playlist.PlaylistId;
