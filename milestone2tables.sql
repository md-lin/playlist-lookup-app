CREATE TABLE Listener(UserID INTEGER PRIMARY KEY,
                    Email VARCHAR(50),
                    ListeningTime INTEGER,
                    TopGenre VARCHAR(20));

CREATE TABLE Artist(UserID INTEGER PRIMARY KEY,
                    Email VARCHAR(50),
                    MonthlyListeners INTEGER);

CREATE TABLE ProfileHas(UserID INTEGER,
                        Nickname VARCHAR(30),
                        PRIMARY KEY (UserID, Nickname),
                        FOREIGN KEY (UserID) REFERENCES Listener);                                                                        

CREATE TABLE Song(SongID INTEGER PRIMARY KEY,
                    Genre VARCHAR(20),
                    Duration REAL,
                    Lyrics VARCHAR(200),
                    NumStreams INTEGER,
                    FOREIGN KEY (Lyrics) REFERENCES LyricsTitle(Lyrics),
                    FOREIGN KEY (NumStreams) REFERENCES StreamSongCertification(NumStreams));

CREATE TABLE UserLikesSong(UserID INTEGER,
                            SongID INTEGER,
                            PRIMARY KEY (UserID, SongID),
                            FOREIGN KEY (UserID) REFERENCES Listener,
                            FOREIGN KEY (SongID) REFERENCES Song); 

CREATE TABLE StreamSongCertification(NumStreams INTEGER PRIMARY KEY,
                                Certification VARCHAR(20));

CREATE TABLE LyricsTitle(Lyrics VARCHAR(200) PRIMARY KEY,
                        Title VARCHAR(200));

CREATE TABLE SongHasKeyword(KeywordID INTEGER PRIMARY KEY,
                            Keyword VARCHAR(30),
                            SongID INTEGER,
                            FOREIGN KEY (SongID) REFERENCES Song);

CREATE TABLE UserPlaylists(PlaylistID INTEGER PRIMARY KEY,
                            PlaylistName UNIQUE);

CREATE TABLE UserHasUserPlaylists(UserID INTEGER,
                                PlaylistID INTEGER,
                                PRIMARY KEY (UserID, PlaylistID),
                                FOREIGN KEY (UserID) REFERENCES Listener,
                                FOREIGN KEY (PlaylistID) REFERENCES UserPlaylists);

CREATE TABLE PlaylistContent(ContentID INTEGER PRIMARY KEY,
                            PlaylistID INTEGER,
                            UNIQUE (PlaylistID),
                            FOREIGN KEY (PlaylistID) REFERENCES UserPlaylists);

CREATE TABLE PlaylistContentIncludesSong(ContentID INTEGER,
                                        SongID INTEGER,
                                        PRIMARY KEY (ContentID, SongID),
                                        FOREIGN KEY (ContentID) REFERENCES PlaylistContent,
                                        FOREIGN KEY (SongID) REFERENCES Song);   

CREATE TABLE StreamAlbumCertification(NumStreams INTEGER PRIMARY KEY,
                                    Certification VARCHAR(30));

CREATE TABLE TitleRelease(Title VARCHAR(30),
                            AlbumVersion INTEGER,
                            ReleaseDate DATE,
                            NumSongs INTEGER,
                            PRIMARY KEY (Title, AlbumVersion));

CREATE TABLE Album(AlbumID INTEGER PRIMARY KEY,
                    Title VARCHAR(20),
                    AlbumVersion INTEGER,
                    NumStreams INTEGER,
                    FOREIGN KEY (Title, AlbumVersion) REFERENCES TitleRelease,
                    FOREIGN KEY (NumStreams) REFERENCES StreamAlbumCertification);

CREATE TABLE AlbumHasKeyword(KeywordID INTEGER PRIMARY KEY,
                            Keyword VARCHAR(30),
                            AlbumID INTEGER,
                            FOREIGN KEY (AlbumID) REFERENCES Album);

CREATE TABLE AlbumIncludesSong(AlbumID INTEGER NOT NULL,
                                SongID INTEGER,
                                PRIMARY KEY (AlbumID, SongID),
                                FOREIGN KEY (AlbumID) REFERENCES Album,
                                FOREIGN KEY (SongID) REFERENCES Song);

CREATE TABLE ArtistCreatesSong(UserID INTEGER,
                                SongID INTEGER,
                                PRIMARY KEY (UserID, SongID),
                                FOREIGN KEY (UserID) REFERENCES Artist,
                                FOREIGN KEY (SongID) REFERENCES Song);

CREATE TABLE ArtistHasAlbum(UserID INTEGER,
                            AlbumID INTEGER,
                            PRIMARY KEY (UserID, AlbumID),
                            FOREIGN KEY (UserID) REFERENCES Artist,
                            FOREIGN KEY (AlbumID) REFERENCES Album);                                                                                     