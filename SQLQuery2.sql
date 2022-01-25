CREATE DATABASE NationalLibrary

USE NationalLibrary

CREATE TABLE Authors(
	Id int primary key identity,
	Fullname nvarchar(100),
	FromWhichCountry nvarchar(100),
	WhenWasBorn nvarchar(25)
)

INSERT INTO Authors( Fullname, FromWhichCountry,WhenWasBorn)
VALUES ('Yann Martel','Canada','25 June 1963'),
	   ('Alexandre Dumas','France','24 July 1802'),
	   ('Jack London','San-Francisco','12 January  1876'),
	   ('Harper Li','U.S','28 April 1926'),
	   ('J. Courtney Sullivan','U.S','29 March 1982'),
	   ('Robert Kirkman ','U.S','24 September 1985'),
	   ('Carlic Mackery','Italy','12 October 1976'),
	   ('Michael Connelly','U.S','29 April 1978'),
	   ('Agatha Christie','England','15 September 1890'),
	   ('Madeline Miller','France','24 January 1972'),
	   ('Gabrial Garcie','U.S','22 April 1985'),
	   ('Shirley Jakcson','San-Francisco','12 January 1876'),
	   ('Josh Malerman','U.S','24 September 1985'),
	   ('Maya Angelou','France','28 January 1970'),
	   ('Ronan Farrow','France','24 July 1802'),
	   ('Vincent Bugliosi','U.S','22 April 1985')

CREATE TABLE BookDetails(
	Id int primary key identity,
	Pages int,
	PublicationData nvarchar(25),
)	

INSERT INTO BookDetails(Pages,PublicationData)
VALUES (100,'02/12/2005'),
		(200,'02/12/2015'),
		(300,'02/12/2012'),
		(400,'02/12/2021'),
		(100,'02/12/2001'),
		(200,'02/12/2002'),
		(300,'02/12/2003'),
		(200,'02/12/2005'),
		(200,'02/12/2006'),
		(200,'02/12/2007'),
		(200,'02/12/2008'),
		(200,'02/12/2009'),
		(200,'02/12/2010'),
		(200,'02/12/2005'),
		(250,'02/12/2005'),
		(200,'02/12/2005'),
		(150,'14/10/2012')

ALTER TABLE BookDetails
ADD BooksId int references Books(Id)

CREATE TABLE Books(
	Id int primary key identity,
	Name nvarchar(60) not null,
	Price decimal(8,2),
	AuthorId int references Authors(Id),
	BookDetailsId int references BookDetails(Id)
)

INSERT INTO Books(Name, Price)
Values ('Life of Pi', 16),
	   ('The Three Musketeers',28),
	   ('The Call of the Wild',12),
	   ('To Kill a Mockingbird',15),
	   ('Little Women',28),
	   ('The Walking Dead: Compendium One',50),
	   ('The Boy, the Mole, the Fox and the Horse',20),
	   ('The Night Fire', 20),
	   ('And Then There Were None',14),
	   ('Circe', 22),
	   ('One Hundred Years of Solitude',28),
	   ('The Haunting of Hill House',26),
	   ('Bird Box',20),
	   ('I Know Why the Caged Bird Sings',22),
	   ('Catch and Kill',29),
	   ('Helter Skelter',26)


CREATE TABLE Genres(
	Id int primary key identity,
	Type nvarchar(50)
)

INSERT INTO Genres(Type)
VALUES ('Action and Adventure'),
       ('Classics'),
	   ('Comic Book'),
	   ('Graphic Novel'),
	   ('Detective'),
	   ('Mystery'),
	   ('Fantasy'),
	   ('Historical Fiction'),
	   ('Horror'),
	   ('Biographies'),
	   ('Autobiographies'),
	   ('True Crime')

CREATE TABLE AuthorsGenres(
	Id int primary key identity,
	AuthorId int references Authors(Id),
	GenreId int references Genres(Id)
)

INSERT INTO AuthorsGenres(AuthorId, GenreId)
VALUES (1,1),
	   (2,1),
	   (3,1),
	   (4,2),
	   (5,2),
	   (6,3),
	   (7,3),
	   (8,5),
	   (9,6),
	   (10,7)

CREATE TABLE BooksGenres(
	Id int primary key identity,
	BookId int references Books(Id),
	GenreId int references Genres(Id)
)

CREATE TABLE Customers(
	Id int primary key identity,
	Name nvarchar(25),
	Surname nvarchar(50),
	Age int
)

INSERT INTO Customers(Name, Surname, Age)
VALUES('Matanat','Alakbarova',24),
	  ('Idris','Jafarzade',25),
	  ('Efsane','Mamadli',28),
	  ('Guler','Ehmedli',26),
	  ('Zehra','Mustafayeva',27),
	  ('Nermin','Huseynzade',30)


CREATE TABLE BooksCustomers(
	Id int primary key identity,
	BookId int references Books(Id),
	CustomerId int references Customers(Id)
)

SELECT b.Name 'Book',g.Type 'Genres' FROM BooksGenres bg
INNER JOIN Books b
On bg.BookId=b.Id
INNER JOIN Genres g
On bg.GenreId=g.Id

SELECT a.Fullname 'Author',b.Name 'Book' FROM Books b
INNER JOIN Authors a
On b.AuthorId=a.Id

SELECT b.Name 'Book',Price,c.Name,c.Surname,c.Age FROM BooksCustomers bc
INNER JOIN Books b
ON bc.BookId=b.Id
INNER JOIN Customers c
ON bc.CustomerId=c.Id


SELECT Fullname,Type FROM AuthorsGenres ag
INNER JOIN Authors a
ON ag.AuthorId=a.Id
INNER JOIN Genres g
ON ag.GenreId=g.Id


