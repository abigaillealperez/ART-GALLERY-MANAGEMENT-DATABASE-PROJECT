--RELASE YOU DATABASE BY SWITCHING TO ANOTHER ONE
USE master
GO

--DROP YOUR DATABASE ONLY IF EXISTS
DROP DATABASE IF EXISTS ArtGalleryManagement;
GO

--CREATE YOUR DATABASE
CREATE DATABASE ArtGalleryManagement;
GO

USE ArtGalleryManagement;
GO

--SCHEMAS
CREATE SCHEMA Museum;
GO

CREATE SCHEMA Art;
GO

CREATE SCHEMA People;
GO

--TABLES WITH PRIMARIES KEYS
--GALLERIES
CREATE TABLE Museum.Galleries
(
	GalleryID int PRIMARY KEY,
	GName varchar(30) NOT NULL,
	Room tinyint NOT NULL
)
GO
SELECT * FROM Museum.Galleries;
GO

--ARTISTS
CREATE TABLE People.Artists
(
	ArtistsID int PRIMARY KEY,
	ANameID varchar (30) NOT NULL,
	ALastname varchar (30) NOT NULL,
	Birthdate DATE NOT NULL,
	Birthplace varchar (30) NOT NULL,
	StyleID tinyint NOT NULL
)
GO

SELECT * FROM People.Artists;
GO

--CUSTOMERS
CREATE TABLE People.Customers
(
	CustomerID int PRIMARY KEY,
	CName varchar (30) NOT NULL,
	CLastname varchar (30) NOT NULL,
	CTelephone varchar (30)NOT NULL,
	CAddressLine1 varchar (30) NOT NULL,
	CCity varchar (30) NOT NULL,
	CProvidence varchar (30) NOT NULL,
	CPostCode varchar (30) NOT NULL,
	Birthdate DATE NOT NULL,
	AmountSpent MONEY NOT NULL
)
GO

SELECT * FROM People.Customers;
GO

--ARTSTYLE ARTWORK
CREATE TABLE Art.ArtStyle
(
	StyleID tinyint PRIMARY KEY,
	SDescription varchar (40) NOT NULL
)
GO

SELECT * FROM Art.ArtStyle;
GO

--ARTSUBJECT ARTWORK
CREATE TABLE Art.ArtSubject
(
	SubjectID tinyint PRIMARY KEY,
	SDescription varchar (40) NOT NULL
)
GO

SELECT * FROM Art.ArtSubject;
GO

--ARTMEDIUM ARTWORK
CREATE TABLE Art.ArtMedium
(
	MediumID tinyint PRIMARY KEY,
	MDescription varchar (40) NOT NULL
	)
GO

SELECT * FROM Art.ArtMedium;
GO

--TABLES WITH FOREING KEYS
--EXHIBITIONS
CREATE TABLE Museum.Exhibitions
(
	ExhibitionID int PRIMARY KEY,
	RoomID tinyint NOT NULL,
	Dates DATE NOT NULL,
	GalleryID tinyint NOT NULL,
	ArtistID int NOT NULL,
	Pieces tinyint NOT NULL
)
GO

SELECT * FROM Museum.Exhibitions;
GO


--ARTWORK
CREATE TABLE Art.Artwork
(
	ArtworkID int PRIMARY KEY,
	AName varchar (30) NOT NULL,
	ALastname varchar (30) NOT NULL,
	Tittle varchar (30) NOT NULL,
	PieceYear int NOT NULL,
	MediumID tinyint NOT NULL,
	StyleID tinyint NOT NULL,
	SubjectID tinyint NOT NULL,
	
)
GO

SELECT * FROM Art.Artwork;
GO

--EXHIBITIONS-GALLERIES
CREATE TABLE Museum.ExhibitionsGalleries
(
	ExhibitionID int,
	GalleryID tinyint
)
GO

SELECT * FROM Museum.ExhibitionsGalleries;
GO

--ARTWORK-GALLERIES
CREATE TABLE Art.ArtworkGalleries
(
	GalleryID tinyint,
	ArtworkID int
)
GO

SELECT * FROM Art.ArtworkGalleries;
GO

--ARTIST-GALLERIES
CREATE TABLE People.ArtistsGalleries
(
	GalleryID tinyint NOT NULL,
	ArtistID int NOT NULL
)
GO

SELECT * FROM People.ArtistsGalleries;
GO

--CUSTOMERS-GALLERIES
CREATE TABLE People.Customersgalleries
(
	GalleryID tinyint NOT NULL,
	CustomersID int NOT NULL
)
GO

SELECT * FROM People.Customersgalleries;
GO

--ARTWORK-ARTISTS
CREATE TABLE Art.ArtworkArtists
(
	ArtistID int NOT NULL,
	ArtworkID int NOT NULL
)
GO

SELECT * FROM Art.ArtworkArtists;
GO

--ALTER TABLES
--CONSTRAINTS/FOREING KEYS
--EXHIBITIONS GALLERIES
ALTER TABLE Museum.ExhibitionsGalleries
ADD CONSTRAINT FKExhibitionID
FOREIGN KEY (ExhibitionID) REFERENCES Museum.Exhibitions (ExhibitionsID);
GO

ALTER TABLE Museum.ExhibitionsGalleries
ADD CONSTRAINT FKGalleryID
FOREIGN KEY (GalleryID) REFERENCES Museum.Galleries (GalleryID);
GO

--EXHIBITIONS
ALTER TABLE Museum.Exhibitions
ADD CONSTRAINT FKGalleryID
FOREIGN KEY (GalleryID) REFERENCES Museum.Galleries (GalleryID);
GO

ALTER TABLE Museum.Exhibitions
ADD CONSTRAINT FKArtistID
FOREIGN KEY (ArtistsID) REFERENCES People.Artists (ArtistsID);
GO

--ARTWORK-GALLERIES
ALTER TABLE Art.ArtworkGalleries
ADD CONSTRAINT FKGalleryID
FOREIGN KEY (GalleryID) REFERENCES Museum.Galleries (GalleryID);
GO

ALTER TABLE Art.ArtworkGalleries
ADD CONSTRAINT FKArtworkID
FOREIGN KEY (ArtworkID) REFERENCES Art.Artwork (ArtworkID);
GO

--ARTWORK-GALLERY
ALTER TABLE People.ArtistsGalleries
ADD CONSTRAINT FKGalleryID
FOREIGN KEY (GalleryID) REFERENCES Museum.Galleries (GalleryID);
GO

ALTER TABLE People.ArtistsGalleries
ADD CONSTRAINT FKArtistsID
FOREIGN KEY (ArtistsID) REFERENCES People.Artists (ArtistsID);
GO

--CUSTOMER-GALLERY
ALTER TABLE People.CustomersGalleries
ADD CONSTRAINT FKGalleryID
FOREIGN KEY (GalleryID) REFERENCES Museum.Galleries (GalleryID);
GO

ALTER TABLE People.CustomersGalleries
ADD CONSTRAINT FKCustomerID
FOREIGN KEY (CustomerID) REFERENCES People.Customers (CustomerID);
GO

--ARTWORK-ARTISTS
ALTER TABLE Art.ArtworkArtists
ADD CONSTRAINT FKArtistsID
FOREIGN KEY (ArtistsID) REFERENCES Art.Artists (ArtistsID);
GO

ALTER TABLE Art.ArtworkArtists
ADD CONSTRAINT FKArtworkID
FOREIGN KEY (ArtworkID) REFERENCES Art.Artwork (ArtworkID);

--ARTWORK
ALTER TABLE Art.Artwork
ADD CONSTRAINT FKStyleID
FOREIGN KEY (StyleID) REFERENCES Art.ArtStyle (StyleID);
GO

ALTER TABLE Art.Artwork
ADD CONSTRAINT FKSubjectID
FOREIGN KEY (SubjectID) REFERENCES Art.ArtSubject (SubjectID);
GO

ALTER TABLE Art.Artwork
ADD CONSTRAINT FKMediumID
FOREIGN KEY (MediumID) REFERENCES Art.ArtMedium (MediumID);
GO

--ALTER TABLES
--DEFAULT/FOREING KEYS
ALTER TABLE People.Customers
ADD CONSTRAINT DFTLCustomers_CTelephone
DEFAULT ('(000)-000-0000') FOR CTelephone
GO

ALTER TABLE 
ADD CONSTRAINT
DEFAULT FOR
GO

ALTER TABLE
ADD CONSTRAINT
DEFAULT FOR
GO

ALTER TABLE
ADD CONSTRAINT
DEFAULT FOR 
GO

ALTER TABLE
ADD CONSTRAINT
DEFAULT FOR
GO

ALTER TABLE 
ADD CONSTRAINT
DEFAULT FOR
GO

--ALTER TABLES
--CHECK/FOREING KEYS
ALTER TABLE 
ADD CONSTRAINT
CHECK
GO

ALTER TABLE 
ADD CONSTRAINT
CHECK
GO

ALTER TABLE
ADD CONSTRAINT
CHECK
GO

ALTER TABLE
ADD CONSTRAINT
CHECK
GO

--VIEWS
CREATE VIEW
GO

CREATE VIEW
GO

CREATE VIEW
GO

--INDEXES
CREATE INDEX
GO

CREATE INDEX
GO

CREATE INDEX
GO

CREATE INDEX
GO


--REPORTS