select count(*) from Track;
select count(*) from Artist;

/* Execute a `select` query */
select * from Album limit 5;

/* Execute a table join */
select Title, Name from Album
join Artist on Album.ArtistId = Artist.ArtistId
limit 5;
/* Execute an insert */
insert into Genre (Name) values ('Trad');

/* Show the last insert performed */
SELECT LAST_INSERT_ID();

/* Filter data using `where` */
select * from Genre where GenreId = 26;

/* Update a record */
update Genre set Name = 'Traditional' where Name = 'Trad';

/* Execute another select query */
select * from Genre;

/* Execute a delete query */
delete from Genre where Name = 'Traditional';

/* Try to select the record that was just deleted */
select * from Genre where Name = 'Traditional';

  
/*
Select all of the data for every `Track` record across 
both the `Track` and `Album` tables
*/
select * from Track
INNER JOIN Album on Track.AlbumId = Album.AlbumId;

/*
Select the Track's Name, the Album's Title and the Artist's ArtistId for every
`Track` record across both the `Track` and `Album` tables
*/
select Name, Title, ArtistId from Track
INNER JOIN Album on Track.AlbumId = Album.AlbumId;

/*
Use MySQL's aliases to display friendlier column names
*/
select Name as Track, Title as Album, ArtistId from Track
INNER JOIN Album on Track.AlbumId = Album.AlbumId;

/*
Instead of just getting the Artist's ID, we'll do an additional join
to get the Artist's name from the `Artist` table
*/
SELECT Track.Name as Track, Title as Album, Album.ArtistId, Artist.Name as Artist from Track
INNER JOIN Album on Track.AlbumId = Album.AlbumId
INNER JOIN Artist on Album.ArtistId = Artist.ArtistId;

/*
Show all of the Track names, album titles and artist name where the artist's name
is "U2"
*/
SELECT Track.Name as Track, Title as Album, Artist.Name as Artist FROM Track
INNER JOIN Album on Track.AlbumId = Album.AlbumId
INNER JOIN Artist on Album.ArtistId = Artist.ArtistId
WHERE Artist.Name = "U2";

/*
Show all of the Track names, album titles and artist name where the artist's name
is "U2" and the name of the track is "Pride (In The Name Of Love)"
*/
SELECT Track.Name as Track, Title as Album, Artist.Name as Artist FROM Track
INNER JOIN Album on Track.AlbumId = Album.AlbumId
INNER JOIN Artist on Album.ArtistId = Artist.ArtistId
WHERE Artist.Name = "U2" AND Track.Name = "Pride (In The Name Of Love)";

/*
Show all of the track names, album titles, and artist names where the track name
is "Believe"
*/
SELECT Track.Name as Track, Title as Album, Artist.Name as Artist FROM Track
INNER JOIN Album on Track.AlbumId = Album.AlbumId
INNER JOIN Artist on Album.ArtistId = Artist.ArtistId
WHERE Track.Name = "Believe";


/*
Order all of the `Album` records by the `Title` field in 
ascending order
*/
SELECT * FROM Album ORDER BY Title;

/*
Order all of the `Album` records by the `Title` field in
descending order
*/
SELECT * FROM Album ORDER BY Title DESC;

/*
Order all of the `Album` records by the `ArtistId` field in 
ascending order, and within that, order by `Title`
*/
SELECT * FROM Album ORDER BY ArtistId, Title;

/*
Select the Track name and the Album title and order them
by the Album title, and then by the track name
*/
SELECT Track.Name, Album.Title FROM Track
INNER JOIN Album on Track.AlbumId = Album.AlbumId
ORDER BY Album.Title, Track.Name;

/*
Select the `InvoiceDate`, `BillingCity` and `Total` from the
`Invoice` table. Order them descendingly and limit the results
to 5
*/
SELECT InvoiceDate, BillingCity, Total FROM Invoice
ORDER BY Total DESC
LIMIT 5;

/*
Get a count of all of the records in the `Customer` table
*/
SELECT COUNT(*) FROM Customer;

/*
Get a count of all of the records in the `Customer` table
*/
SELECT COUNT(FirstName) FROM Customer;

/*
Get a count of all of the records in the `Customer` table
where the customer's `FirstName` is "Frank"
*/
SELECT COUNT(*) FROM Customer WHERE FirstName = 'Frank';

SELECT COUNT(*) FROM  Track
GROUP BY AlbumId;

SELECT AlbumId, COUNT(*) FROM Track
GROUP BY AlbumId;

SELECT Album.Title, COUNT(*) FROM Track
INNER JOIN Album ON Track.AlbumId = Album.AlbumId
GROUP BY Track.AlbumId;

SELECT AlbumId, MIN(UnitPrice) FROM Track
GROUP BY AlbumId;

SELECT AlbumId, MAX(UnitPrice) FROM Track
GROUP BY AlbumId;

SELECT AlbumId, ROUND(SUM(UnitPrice), 2) FROM Track
GROUP BY AlbumId;

SELECT Album.Title, ROUND(SUM(UnitPrice), 2) FROM Track
INNER JOIN Album ON Track.AlbumId = Album.AlbumId
GROUP BY Track.AlbumId;

/*
Create a dummy `MediaType`
*/
INSERT INTO MediaType (Name)
VALUES ("Test Media 1");

/*
Create a new `Album` record with a name of "Boy" and an
ArtistId of 150. This ArtistId is for U2
*/
INSERT INTO Album (Title, ArtistId)
VALUES ("Boy", 150);

/*
Get all of the relevant information that we need to enter all of
tracks for U2's "Boy" album
*/
SELECT AlbumId FROM Album WHERE Title = "Boy";

SELECT MediaTypeId FROM MediaType WHERE Name = "Protected AAC audio file";

SELECT GenreId FROM Genre WHERE Name = "Rock";

/*
Use the above information to create the new tracks
*/
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
VALUES ("I Will Follow", 348, 2, 1, "U2", 220000, 1234, 0.99);

