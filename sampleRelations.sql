CREATE TABLE Listener
(
    UserID INTEGER PRIMARY KEY,
    Email VARCHAR(50),
    ListeningTime INTEGER,
    TopGenre VARCHAR(20)
);

CREATE TABLE Artist
(
    UserID INTEGER PRIMARY KEY,
    Email VARCHAR(50),
    MonthlyListeners INTEGER,
    StageName VARCHAR(30)
);

CREATE TABLE ProfileHas
(
    UserID INTEGER,
    Nickname VARCHAR(30),
    PRIMARY KEY (UserID, Nickname),
    FOREIGN KEY (UserID) REFERENCES Listener ON DELETE CASCADE
);

CREATE TABLE Song
(
    SongID INTEGER PRIMARY KEY,
    Title VARCHAR(200),
    Genre VARCHAR(20),
    Duration REAL
);

CREATE TABLE UserLikesSong
(
    UserID INTEGER,
    SongID INTEGER,
    PRIMARY KEY (UserID, SongID),
    FOREIGN KEY (UserID) REFERENCES Listener ON DELETE CASCADE,
    FOREIGN KEY (SongID) REFERENCES Song ON DELETE CASCADE
);

--CREATE TABLE StreamSongCertification
--(
--    NumStreams INTEGER PRIMARY KEY,
--    Certification VARCHAR(20)
--);

--CREATE TABLE LyricsTitle
--(
--  Lyrics VARCHAR(200) PRIMARY KEY,
--    Title VARCHAR(200)
--);

CREATE TABLE SongHasKeyword
(
    KeywordID INTEGER PRIMARY KEY,
    Keyword VARCHAR(30),
    SongID INTEGER,
    FOREIGN KEY (SongID) REFERENCES Song ON DELETE CASCADE
);

CREATE TABLE UserPlaylists
(
    PlaylistID INTEGER PRIMARY KEY,
    PlaylistName VARCHAR(30) UNIQUE
);

CREATE TABLE UserHasUserPlaylists
(
    UserID INTEGER,
    PlaylistID INTEGER,
    PRIMARY KEY (UserID, PlaylistID),
    FOREIGN KEY (UserID) REFERENCES Listener ON DELETE CASCADE,
    FOREIGN KEY (PlaylistID) REFERENCES UserPlaylists ON DELETE CASCADE
);

--CREATE TABLE PlaylistContent
--(
--    ContentID INTEGER PRIMARY KEY,
--    PlaylistID INTEGER,
--    UNIQUE (PlaylistID),
--    FOREIGN KEY (PlaylistID) REFERENCES UserPlaylists ON DELETE CASCADE
--);

CREATE TABLE PlaylistIncludesSong
(
    PlaylistID INTEGER,
    SongID INTEGER,
    PRIMARY KEY (PlaylistID, SongID),
    FOREIGN KEY (PlaylistID) REFERENCES UserPlaylists ON DELETE CASCADE,
    FOREIGN KEY (SongID) REFERENCES Song ON DELETE CASCADE
);

--CREATE TABLE StreamAlbumCertification
--(
--    NumStreams INTEGER PRIMARY KEY,
--    Certification VARCHAR(30)
--);

--CREATE TABLE TitleRelease
--(
--    Title VARCHAR(30),
--    AlbumVersion INTEGER,
--    ReleaseDate DATE,
--    NumSongs INTEGER,
--    PRIMARY KEY (Title, AlbumVersion)
--);

CREATE TABLE Album
(
    AlbumID INTEGER PRIMARY KEY,
    Title VARCHAR(20),
    NumSongs INTEGER
);

CREATE TABLE AlbumHasKeyword
(
    KeywordID INTEGER PRIMARY KEY,
    Keyword VARCHAR(30),
    AlbumID INTEGER,
    FOREIGN KEY (AlbumID) REFERENCES Album ON DELETE CASCADE
);

CREATE TABLE AlbumIncludesSong
(
    AlbumID INTEGER NOT NULL,
    SongID INTEGER,
    PRIMARY KEY (AlbumID, SongID),
    FOREIGN KEY (AlbumID) REFERENCES Album ON DELETE CASCADE,
    FOREIGN KEY (SongID) REFERENCES Song ON DELETE CASCADE
);

CREATE TABLE ArtistCreatesSong
(
    UserID INTEGER,
    SongID INTEGER,
    PRIMARY KEY (UserID, SongID),
    FOREIGN KEY (UserID) REFERENCES Artist ON DELETE CASCADE,
    FOREIGN KEY (SongID) REFERENCES Song ON DELETE CASCADE
);

CREATE TABLE ArtistHasAlbum
(
    UserID INTEGER,
    AlbumID INTEGER,
    PRIMARY KEY (UserID, AlbumID),
    FOREIGN KEY (UserID) REFERENCES Artist ON DELETE CASCADE,
    FOREIGN KEY (AlbumID) REFERENCES Album ON DELETE CASCADE
);    

INSERT INTO Listener
    (UserID,Email,ListeningTime,TopGenre)
VALUES( 0, 'holyheck@gmail.com', 1359022, 'Pop');
INSERT INTO Listener
    (UserID,Email,ListeningTime,TopGenre)
VALUES( 1, 'reeeee@gmail.com', 300, 'Rap');
INSERT INTO Listener
    (UserID,Email,ListeningTime,TopGenre)
VALUES( 2, 'dolphinsareok@outlook.com', 65123, 'K-Pop');
INSERT INTO Listener
    (UserID,Email,ListeningTime,TopGenre)
VALUES( 52, 'apple@hotmail.com', 5, 'Classical');
INSERT INTO Listener
    (UserID,Email,ListeningTime,TopGenre)
VALUES( 69, 'nice@hotmail.com', 420, 'Monkey-Trap');

INSERT INTO Artist
    (UserID, Email, MonthlyListeners, StageName)
VALUES
    (
        0,
        'holyheck@gmail.com',
        1630928,
        'Rahul Shandilya'
    );
INSERT INTO Artist
    (UserID, Email, MonthlyListeners, StageName)
VALUES
    (
        1,
        'k@gmail.com',
        168,
        'Charlie Puth'
    );
INSERT INTO Artist
    (UserID, Email, MonthlyListeners, StageName)
VALUES
    (
        2,
        'he@gmail.com',
        928,
        'Dua Lipa'
    );        
INSERT INTO Artist
    (UserID, Email, MonthlyListeners, StageName)
VALUES
    (
        3,
        'shandilya@gmail.com',
        250,
        'Fujii Kaze'
    );
INSERT INTO Artist
    (UserID, Email, MonthlyListeners, StageName)
VALUES
    (
        4,
        'ilovedolphins@outlook.com',
        1205304,
        'Zion. T'
    );
INSERT INTO Artist
    (UserID, Email, MonthlyListeners, StageName)
VALUES(
        5,
        'ihatedolphins@hotmail.com',
        340792,
        'Eminem'
    );
INSERT INTO Artist
    (UserID, Email, MonthlyListeners, StageName)
VALUES(
        6,
        'imaboomer@yahoo.com',
        1,
        'Lil Nas X'
    );

INSERT INTO ProfileHas
    (UserID, Nickname)
VALUES(0, 'Melissa');
INSERT INTO ProfileHas
    (UserID, Nickname)
VALUES
    (1, 'Rahul');
INSERT INTO ProfileHas
    (UserID, Nickname)
VALUES
    (2, 'Mark');
INSERT INTO ProfileHas
    (UserID, Nickname)
VALUES
    (52, 'Michelle');
INSERT INTO ProfileHas
    (UserID, Nickname)
VALUES
    (69, 'ironcat');

-- INSERT INTO StreamSongCertification (NumStreams, Certification) VALUES (10000000, 'Diamond');
-- INSERT INTO StreamSongCertification (NumStreams, Certification) VALUES (2000000, 'Multi-Platinum');
-- INSERT INTO StreamSongCertification (NumStreams, Certification) VALUES (500000, 'Gold');
-- INSERT INTO StreamSongCertification (NumStreams, Certification) VALUES (1000000, 'Platinum');
-- INSERT INTO StreamSongCertification (NumStreams, Certification) VALUES (100000, 'None');

-- INSERT INTO LyricsTitle(Lyrics, Title) VALUES
-- ('Fly','Baby Shark');
-- INSERT INTO LyricsTitle(Lyrics, Title) VALUES
-- ('Never','Never ');
-- INSERT INTO LyricsTitle(Lyrics, Title) VALUES
-- ('Auuuugh','ARRRRRGH');
-- INSERT INTO LyricsTitle(Lyrics, Title) VALUES
-- ('NAAAAAAAAAAAAAH','Trumpet Boiii');
-- INSERT INTO LyricsTitle(Lyrics, Title) VALUES
-- ('Country','Country Road');

INSERT INTO
    Song
    (SongID, Genre,Duration, Title)
VALUES
    (2, 'Pop', 4.21, 'Despacito');
INSERT INTO
    Song
    (SongID, Genre,Duration, Title)
VALUES
    (3, 'Rap', 3.23, 'Yeah');
INSERT INTO
    Song
    (SongID, Genre,Duration, Title)
VALUES
    (4, 'Pop', 5.6, 'Hello');
INSERT INTO
    Song
    (SongID, Genre,Duration, Title)
VALUES
    (5, 'Pop', 3.7, 'Baby');
INSERT INTO
    Song
    (SongID, Genre,Duration, Title)
VALUES
    (6, 'Pop', 2.21, 'Stay');
INSERT INTO
    Song
    (SongID, Genre,Duration, Title)
VALUES
    (7, 'Disco', 4.2, 'Journey');
INSERT INTO
    Song
    (SongID, Genre,Duration, Title)
VALUES
    (8, 'Jazz', 6.9, 'Blues');
INSERT INTO
    Song
    (SongID, Genre,Duration, Title)
VALUES
    (9, 'Pop', 3, 'Fly');

INSERT INTO
    Song
    (SongID, Genre,Duration, Title)
VALUES
    (10, 'Rap', 6, 'Never');

INSERT INTO Song
    (SongID, Genre,Duration, Title)
VALUES
    (11, 'Monkey-Trap', 4, 'Auuuugh');

INSERT INTO Song
    (SongID, Genre,Duration, Title)
VALUES
    (12, 'Jazz', 1, 'NAAAAAAAAAAAAAH');

INSERT INTO Song
    (SongID, Genre,Duration, Title)
VALUES
    (13, 'Country', 5, 'Country');

INSERT INTO UserLikesSong
    (UserID, SongID)
VALUES(0, 3);
INSERT INTO UserLikesSong
    (UserID, SongID)
VALUES(0, 2);
INSERT INTO UserLikesSong
    (UserID, SongID)
VALUES
    (2, 7);
INSERT INTO UserLikesSong
    (UserID, SongID)
VALUES
    (52, 4);
INSERT INTO UserLikesSong
    (UserID, SongID)
VALUES(69, 2);

INSERT INTO SongHasKeyword
    (KeywordID, Keyword, SongID)
VALUES
    (0, 'sociopath', 5);
INSERT INTO SongHasKeyword
    (KeywordID, Keyword, SongID)
VALUES
    (1, 'apathy', 6);
INSERT INTO SongHasKeyword
    (KeywordID, Keyword, SongID)
VALUES
    (2, 'turn', 2);
INSERT INTO SongHasKeyword
    (KeywordID, Keyword, SongID)
VALUES
    (3, 'me', 2);
INSERT INTO SongHasKeyword
    (KeywordID, Keyword, SongID)
VALUES
    (4, 'on', 2);

INSERT INTO UserPlaylists
    (PlaylistID, PlaylistName)
VALUES
    (0, 'melissaplaylist');
INSERT INTO UserPlaylists
    (PlaylistID, PlaylistName)
VALUES
    (1, 'sad');
INSERT INTO UserPlaylists
    (PlaylistID, PlaylistName)
VALUES
    (2, 'happy');
INSERT INTO UserPlaylists
    (PlaylistID, PlaylistName)
VALUES
    (3, 'breakup');
INSERT INTO UserPlaylists
    (PlaylistID, PlaylistName)
VALUES
    (4, 'fine');

INSERT INTO UserPlaylists
VALUES
    (5, 'happy times');

INSERT INTO UserHasUserPlaylists
    (UserID, PlaylistID)
VALUES
    (0, 0);
INSERT INTO UserHasUserPlaylists
    (UserID, PlaylistID)
VALUES
    (0, 1);
INSERT INTO UserHasUserPlaylists
    (UserID, PlaylistID)
VALUES
    (2, 2);
INSERT INTO UserHasUserPlaylists
    (UserID, PlaylistID)
VALUES
    (52, 3);
INSERT INTO UserHasUserPlaylists
    (UserID, PlaylistID)
VALUES
    (52, 4);
INSERT INTO UserHasUserPlaylists
VALUES  
    (52, 5);

-- INSERT INTO PlaylistContent (ContentID, PlaylistID) VALUES (0, 0);
-- INSERT INTO PlaylistContent (ContentID, PlaylistID) VALUES (1, 1);
-- INSERT INTO PlaylistContent (ContentID, PlaylistID) VALUES (2, 2);
-- INSERT INTO PlaylistContent (ContentID, PlaylistID) VALUES (3, 3);
-- INSERT INTO PlaylistContent (ContentID, PlaylistID) VALUES (444, 4);

INSERT INTO PlaylistIncludesSong
    (PlaylistID, SongID)
VALUES
    (0, 2);
INSERT INTO PlaylistIncludesSong
    (PlaylistID, SongID)
VALUES
    (0, 3);
INSERT INTO PlaylistIncludesSong
    (PlaylistID, SongID)
VALUES
    (0, 4);
INSERT INTO PlaylistIncludesSong
    (PlaylistID, SongID)
VALUES
    (1, 2);
INSERT INTO PlaylistIncludesSong
    (PlaylistID, SongID)
VALUES
    (1, 3);
INSERT INTO PlaylistIncludesSong
    (PlaylistID, SongID)
VALUES
    (1, 4);
INSERT INTO PlaylistIncludesSong
    (PlaylistID, SongID)
VALUES
    (2, 2);
INSERT INTO PlaylistIncludesSong
    (PlaylistID, SongID)
VALUES
    (2, 3);
INSERT INTO PlaylistIncludesSong
    (PlaylistID, SongID)
VALUES
    (2, 4);
INSERT INTO PlaylistIncludesSong
    (PlaylistID, SongID)
VALUES
    (3, 2);
INSERT INTO PlaylistIncludesSong
    (PlaylistID, SongID)
VALUES
    (3, 3);
INSERT INTO PlaylistIncludesSong
    (PlaylistID, SongID)
VALUES
    (3, 4);
INSERT INTO PlaylistIncludesSong
    (PlaylistID, SongID)
VALUES
    (4, 2);
INSERT INTO PlaylistIncludesSong
    (PlaylistID, SongID)
VALUES
    (4, 3);
INSERT INTO PlaylistIncludesSong
    (PlaylistID, SongID)
VALUES
    (4, 4);
INSERT INTO PlaylistIncludesSong
VALUES
    (5, 2);
INSERT INTO PlaylistIncludesSong
VALUES
    (5, 3);
INSERT INTO PlaylistIncludesSong
VALUES
    (5, 4);


-- INSERT INTO StreamAlbumCertification (NumStreams, Certification) VALUES (10000000, 'Diamond');
-- INSERT INTO StreamAlbumCertification (NumStreams, Certification) VALUES (2000000, 'Multi-Platinum');
-- INSERT INTO StreamAlbumCertification (NumStreams, Certification) VALUES (500000, 'Gold');
-- INSERT INTO StreamAlbumCertification (NumStreams, Certification) VALUES (1000000, 'Platinum');
-- INSERT INTO StreamAlbumCertification (NumStreams, Certification) VALUES (100000, 'None');

-- INSERT INTO TitleRelease(Title, AlbumVersion, ReleaseDate, NumSongs) VALUES ('032 Funk', 1, '01-APR-21', 5);
-- INSERT INTO TitleRelease(Title, AlbumVersion, ReleaseDate, NumSongs) VALUES ('30', 1, '16-MAY-20', 10);
-- INSERT INTO TitleRelease(Title, AlbumVersion, ReleaseDate, NumSongs) VALUES ('Light Switch', 1, '30-MAR-22', 1);
-- INSERT INTO TitleRelease(Title, AlbumVersion, ReleaseDate, NumSongs) VALUES ('Pigeon!', 1, '25-FEB-22', 8);
-- INSERT INTO TitleRelease(Title, AlbumVersion, ReleaseDate, NumSongs) VALUES ('ZZZ', 1, '16-NOV-18', 9);

INSERT INTO Album
    (AlbumID, Title, NumSongs)
VALUES
    (0, '032 Funk', 5);
INSERT INTO Album
    (AlbumID, Title, NumSongs)
VALUES
    (1, '30', 10);
INSERT INTO Album
    (AlbumID, Title, NumSongs)
VALUES
    (2, 'Light Switch', 1);
INSERT INTO Album
    (AlbumID, Title, NumSongs)
VALUES
    (5, 'Pigeon!', 8);
INSERT INTO Album
    (AlbumID, Title, NumSongs)
VALUES
    (99, 'ZZZ', 9);
INSERT INTO Album
Values (6, 'Funky Business', 1);

INSERT INTO AlbumHasKeyword
    (KeywordID, Keyword, AlbumID)
VALUES
    (0, 'Funk', 0);
INSERT INTO AlbumHasKeyword
    (KeywordID, Keyword, AlbumID)
VALUES
    (1, 'Celebration', 0);
INSERT INTO AlbumHasKeyword
    (KeywordID, Keyword, AlbumID)
VALUES
    (2, 'Incheon Airport Freestyle', 0);
INSERT INTO AlbumHasKeyword
    (KeywordID, Keyword, AlbumID)
VALUES
    (3, 'Sad', 1);
INSERT INTO AlbumHasKeyword
    (KeywordID, Keyword, AlbumID)
VALUES
    (4, 'Upbeat', 2);

INSERT INTO AlbumIncludesSong
    (AlbumID, SongID)
VALUES
    (0, 5);
INSERT INTO AlbumIncludesSong
    (AlbumID, SongID)
VALUES
    (0, 6);
INSERT INTO AlbumIncludesSong
    (AlbumID, SongID)
VALUES
    (1, 3);
INSERT INTO AlbumIncludesSong
    (AlbumID, SongID)
VALUES
    (2, 2);
INSERT INTO AlbumIncludesSong
    (AlbumID, SongID)
VALUES
    (2, 4);

INSERT INTO ArtistCreatesSong
    (UserID, SongID)
VALUES
    (0, 2);
INSERT INTO ArtistCreatesSong
    (UserID, SongID)
VALUES
    (5, 8);
INSERT INTO ArtistCreatesSong
    (UserID, SongID)
VALUES
    (1, 13);
INSERT INTO ArtistCreatesSong
    (UserID, SongID)
VALUES
    (2, 7);
INSERT INTO ArtistCreatesSong
    (UserID, SongID)
VALUES
    (4, 3);
INSERT INTO ArtistCreatesSong
    (UserID, SongID)
VALUES
    (5, 12);
INSERT INTO ArtistCreatesSong
    (UserID, SongID)
VALUES
    (4, 10);
INSERT INTO ArtistCreatesSong
    (UserID, SongID)
VALUES
    (0, 6);

INSERT INTO ArtistHasAlbum
    (UserID, AlbumID)
VALUES
    (0, 0);
INSERT INTO ArtistHasAlbum
    (UserID, AlbumID)
VALUES
    (0, 1);
INSERT INTO ArtistHasAlbum
    (UserID, AlbumID)
VALUES
    (3, 2);
INSERT INTO ArtistHasAlbum
    (UserID, AlbumID)
VALUES
    (4, 5);
INSERT INTO ArtistHasAlbum
    (UserID, AlbumID)
VALUES
    (5, 99);
    