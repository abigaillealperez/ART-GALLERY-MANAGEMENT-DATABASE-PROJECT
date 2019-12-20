--RELASE YOU DATABASE BY SWITCHING TO ANOTHER ONE
USE master
GO

--DROP YOUR DATABASE ONLY IF EXISTS
DROP DATABASE IF EXISTS ArtGalleryManagement;
GO

--CREATE YOUR DATABASE
CREATE DATABASE ArtGalleryManagement;
GO

USE ArtGalleryManagement
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
	GalleryId tinyint PRIMARY KEY,
	GalleryName varchar (30) NOT NULL
)
GO

SELECT * FROM Museum.Galleries;
GO

--ARTISTS
CREATE TABLE People.Artists
(
	ArtistId int PRIMARY KEY,
	FirstName varchar (30) NOT NULL,
	LastName varchar (30) NOT NULL,
	Email varchar (30) NOT NULL,
	Telephone varchar (30)NOT NULL,
	BirthDate DATE NOT NULL,
	BirthPlace varchar (30) NOT NULL,
	Style varchar (60) NOT NULL
)
GO

SELECT * FROM People.Artists;
GO

--CUSTOMERS
CREATE TABLE People.Customers
(
	CustomerId int PRIMARY KEY,
	FirstName varchar (30) NOT NULL,
	LastName varchar (30) NOT NULL,
	Email varchar (30) NOT NULL,
	Telephone varchar (30)NOT NULL,
	AddressLine1 varchar (30) NOT NULL,
	City varchar (30) NOT NULL,
	Providence varchar (30) NOT NULL,
	PostalCode varchar (30) NOT NULL,
	BirthDate DATE NOT NULL,
	AmountSpent MONEY NOT NULL
)
GO

SELECT * FROM People.Customers;
GO

--ARTSTYLE ARTWORK
CREATE TABLE Art.ArtStyle
(
	StyleId tinyint PRIMARY KEY,
	StyleDescription varchar (40) NOT NULL
)
GO

SELECT * FROM Art.ArtStyle;
GO

--ARTSUBJECT ARTWORK
CREATE TABLE Art.ArtSubject
(
	SubjectId tinyint PRIMARY KEY,
	SubjectDescription varchar (40) NOT NULL
)
GO

SELECT * FROM Art.ArtSubject;
GO

--ARTMEDIUM ARTWORK
CREATE TABLE Art.ArtMedium
(
	MediumId tinyint PRIMARY KEY,
	MediumDescription varchar (40) NOT NULL
	)
GO

SELECT * FROM Art.ArtMedium;
GO

--TABLES WITH FOREING KEYS
--EXHIBITIONS
CREATE TABLE Museum.Exhibitions
(
	ExhibitionId int PRIMARY KEY,
	Dates DATE NOT NULL,
	ArtistId int NOT NULL,
	ArtworkId int NOT NULL
)
GO

SELECT * FROM Museum.Exhibitions;
GO


--ARTWORK
CREATE TABLE Art.Artwork
(
	ArtworkId int PRIMARY KEY,
	Tittle varchar (30) NOT NULL,
	PieceDate int NOT NULL,
	Country varchar (30) NOT NULL,
	StyleId tinyint NOT NULL,
	SubjectId tinyint NOT NULL,
	MediumId tinyint NOT NULL,
	Dimensions varchar (30) NOT NULL,
	Price MONEY NOT NULL
)
GO

SELECT * FROM Art.Artwork;
GO

--EXHIBITIONS-GALLERIES
CREATE TABLE Museum.ExhibitionsGalleries
(
	ExhibitionId int NOT NULL,
	GalleryId tinyint NOT NULL
)
GO

SELECT * FROM Museum.ExhibitionsGalleries;
GO

--ARTWORK-GALLERIES
CREATE TABLE Art.ArtworkGalleries
(
	GalleryId tinyint NOT NULL,
	ArtworkId int NOT NULL
)
GO

SELECT * FROM Art.ArtworkGalleries;
GO

--ARTIST-GALLERIES
CREATE TABLE People.ArtistsGalleries
(
	GalleryId tinyint NOT NULL,
	ArtistId int NOT NULL
)
GO

SELECT * FROM People.ArtistsGalleries;
GO

--CUSTOMERS-GALLERIES
CREATE TABLE People.CustomersGalleries
(
	GalleryId tinyint NOT NULL,
	CustomerId int NOT NULL
)
GO

SELECT * FROM People.CustomersGalleries;
GO

--ARTWORK-ARTISTS
CREATE TABLE Art.ArtworkArtists
(
	ArtistId int NOT NULL,
	ArtworkId int NOT NULL
)
GO

SELECT * FROM Art.ArtworkArtists;
GO

--ALTER TABLES
--CONSTRAINTS/FOREING KEYS
--EXHIBITIONS GALLERIES
ALTER TABLE Museum.ExhibitionsGalleries
ADD CONSTRAINT FKExhibitionsGalleries_ExhibitionId
FOREIGN KEY (ExhibitionId) REFERENCES Museum.Exhibitions (ExhibitionId);
GO

ALTER TABLE Museum.ExhibitionsGalleries
ADD CONSTRAINT FKExhibitionsGalleries_GalleryId
FOREIGN KEY (GalleryId) REFERENCES Museum.Galleries (GalleryId);
GO

--EXHIBITIONS
ALTER TABLE Museum.Exhibitions
ADD CONSTRAINT FKExhibitions_ArtistId
FOREIGN KEY (ArtistId) REFERENCES People.Artists (ArtistId);
GO

ALTER TABLE Art.Artwork
ADD CONSTRAINT FKArtwork_ArtworkId
FOREIGN KEY (ArtworkId) REFERENCES Art.Artwork (ArtworkId);
GO

--ALTER TABLE Museum.Exhibitions
ALTER TABLE Museum.Exhibitions
ADD CONSTRAINT FKExhibitons_ArtistID
FOREIGN KEY (ArtistId) REFERENCES People.Artists (ArtistId);
GO

--ARTWORK-GALLERIES
ALTER TABLE Art.ArtworkGalleries
ADD CONSTRAINT FKArtworkGalleries_GalleryId
FOREIGN KEY (GalleryId) REFERENCES Museum.Galleries (GalleryId);
GO

ALTER TABLE Art.ArtworkGalleries
ADD CONSTRAINT FKArtworkGalleries_ArtworkID
FOREIGN KEY (ArtworkId) REFERENCES Art.Artwork (ArtworkId);
GO

--ARTWORK-GALLERY
ALTER TABLE People.ArtistsGalleries
ADD CONSTRAINT FKArtistsGalleries_GalleryId
FOREIGN KEY (GalleryId) REFERENCES Museum.Galleries (GalleryId);
GO

ALTER TABLE People.ArtistsGalleries
ADD CONSTRAINT FKArtistsGalleries_ArtistId
FOREIGN KEY (ArtistId) REFERENCES People.Artists (ArtistId);
GO

--CUSTOMER-GALLERY
ALTER TABLE People.CustomersGalleries
ADD CONSTRAINT FKCustomersGalleries_GalleryId
FOREIGN KEY (GalleryId) REFERENCES Museum.Galleries (GalleryId);
GO

ALTER TABLE People.CustomersGalleries
ADD CONSTRAINT FKCustomersGalleries_CustomerId
FOREIGN KEY (CustomerId) REFERENCES People.Customers (CustomerId);
GO

--ARTWORK-ARTISTS
ALTER TABLE Art.ArtworkArtists
ADD CONSTRAINT FKArtworkArtists_ArtistId
FOREIGN KEY (ArtistId) REFERENCES People.Artists (ArtistId);
GO

ALTER TABLE Art.ArtworkArtists
ADD CONSTRAINT FKArtworkArtists_ArtworkId
FOREIGN KEY (ArtworkId) REFERENCES Art.Artwork (ArtworkId);
GO

--ARTWORK
ALTER TABLE Art.Artwork
ADD CONSTRAINT FKArtwork_StyleId
FOREIGN KEY (StyleId) REFERENCES Art.ArtStyle (StyleId);
GO

ALTER TABLE Art.Artwork
ADD CONSTRAINT FKArtwork_SubjectId
FOREIGN KEY (SubjectId) REFERENCES Art.ArtSubject (SubjectId);
GO

ALTER TABLE Art.Artwork
ADD CONSTRAINT FKArtwork_MediumId
FOREIGN KEY (MediumId) REFERENCES Art.ArtMedium (MediumId);
GO

--ALTER TABLES
--CONSTRAINTS/DEFAULT
--CUSTOMERS
ALTER TABLE People.Customers
ADD CONSTRAINT DFTLCustomers_Email
DEFAULT ('NONE') FOR Email
GO

ALTER TABLE People.Customers
ADD CONSTRAINT DFTLCustomers_Telephone
DEFAULT ('(000)-000-0000') FOR Telephone
GO

ALTER TABLE People.Customers
ADD CONSTRAINT DFTLCustomers_AddressLine1
DEFAULT ('NONE') FOR AddressLine1
GO

ALTER TABLE People.Customers
ADD CONSTRAINT DFTLCustomers_City
DEFAULT ('NONE') FOR City
GO

ALTER TABLE People.Customers
ADD CONSTRAINT DFTLCustomers_Providence
DEFAULT ('NONE') FOR Providence
GO

ALTER TABLE People.Customers
ADD CONSTRAINT DFLTCustomers_PostalCode
DEFAULT ('000 000') FOR PostalCode
GO

ALTER TABLE People.Customers
ADD CONSTRAINT DFTLCustomers_BirthDate
DEFAULT ('NONE') FOR BirthDate
GO

--ARTISTS
ALTER TABLE People.Artists
ADD CONSTRAINT DFLTArtists_LastName
DEFAULT ('NONE') FOR LastName
GO

ALTER TABLE People.Artists
ADD CONSTRAINT DFTLArtists_Email
DEFAULT ('NONE') FOR Email
GO

ALTER TABLE People.Artists
ADD CONSTRAINT DFTLArtists_Telephone
DEFAULT ('(000)-000-0000') FOR Telephone
GO

ALTER TABLE People.Artists
ADD CONSTRAINT DFTLArtists_BirthDate
DEFAULT ('NONE') FOR BirthDate
GO

ALTER TABLE People.Artists
ADD CONSTRAINT DFTLArtists_StyleId
DEFAULT ('VARIABLE') FOR StyleId
GO

--ARTWORK
ALTER TABLE Art.Artwork
ADD CONSTRAINT DFTLArtwork_Tittle
DEFAULT ('NO TITTLE') FOR Tittle
GO

ALTER TABLE Art.Artwork
ADD CONSTRAINT DFTLArtwork_PieceDate
DEFAULT ('NOT SPECIFIED') FOR PieceDate
GO

ALTER TABLE Art.Artwork
ADD CONSTRAINT DFTLArtwork_Country
DEFAULT ('NOT SPECIFIED') FOR Country
GO

--ALTER TABLES
--CONSTRAINTS/CHECK
ALTER TABLE Art.Artwork
ADD CONSTRAINT CHKArtwork_Price
CHECK (Price > 0 AND Price <= 1000000)
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
CREATE VIEW People.NewstArtists
AS
SELECT TOP 10 *
FROM People.Artists
ORDER BY ArtistID DESC
GO

CREATE VIEW
AS
SELECT TOP
FROM
ORDER BY DESC
GO

CREATE VIEW
AS
SELECT TOP
ORDER BY DESC
GO

--INDEXES
CREATE INDEX


GO

CREATE INDEX

GO

CREATE INDEX

GO



--STORED PROCEDURES