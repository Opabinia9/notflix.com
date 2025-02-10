create table Media (
SeriesID int primary key auto_increment,
Title varchar(50),
ReleaseYear int,
Length varchar(7),
NOS int default 0 CHECK (NOS >= 0),
Available boolean default FALSE
);
create table Season (
SeriesID int,
SeasonID int,
NOE int,
FOREIGN KEY (SeriesID) REFERENCES Media(SeriesID),
PRIMARY KEY (SeriesID, SeasonID)
);
create table Episode (
SeriesID int,
SeasonID int,
EpisodeID int,
EpisodeTitle varchar(50),
Length varchar(7),
Available boolean default FALSE,
URL varchar(255),
FOREIGN KEY (SeriesID) REFERENCES Media(SeriesID),
FOREIGN KEY (SeasonID) REFERENCES Season(SeasonID),
PRIMARY KEY (SeriesID, SeasonID, EpisodeID)
);
