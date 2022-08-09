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