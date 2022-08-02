INSERT INTO Listener (UserID,Email,ListeningTime,TopGenre) VALUES( 0, 'holyheck@gmail.com', 1359022,'Pop');
INSERT INTO Listener (UserID,Email,ListeningTime,TopGenre) VALUES( 1, 'reeeee@gmail.com', 300,'Rap');
INSERT INTO Listener (UserID,Email,ListeningTime,TopGenre) VALUES( 2, 'dolphinsareok@outlook.com', 65123,'K-Pop');
INSERT INTO Listener (UserID,Email,ListeningTime,TopGenre) VALUES( 52, 'apple@hotmail.com', 5,'Classical');
INSERT INTO Listener (UserID,Email,ListeningTime,TopGenre) VALUES( 69, 'nice@hotmail.com', 420,'Monkey-Trap');

INSERT INTO Artist (UserID, Email, MonthlyListeners)
VALUES
(
        0,
        'holyheck@gmail.com',
        1630928
    );
INSERT INTO Artist (UserID, Email, MonthlyListeners)
VALUES
    (
        3,
        'shandilya@gmail.com',
        250
    );
INSERT INTO Artist (UserID, Email, MonthlyListeners)
VALUES    (
        4,
        'ilovedolphins@outlook.com',
        1205304
    );
INSERT INTO Artist (UserID, Email, MonthlyListeners)
VALUES(
        5,
        'ihatedolphins@hotmail.com',
        340792
    );
INSERT INTO Artist (UserID, Email, MonthlyListeners)
VALUES(
        6,
        'imaboomer@yahoo.com',
        1
    );

INSERT INTO ProfileHas (UserID, Nickname)
VALUES(0, 'Melissa');
INSERT INTO ProfileHas (UserID, Nickname)
VALUES (1, 'Rahul');
INSERT INTO ProfileHas (UserID, Nickname)
VALUES    (2, 'Mark');
INSERT INTO ProfileHas (UserID, Nickname)
VALUES    (52, 'Michelle');
INSERT INTO ProfileHas (UserID, Nickname)
VALUES     (69, 'ironcat');

INSERT INTO StreamSongCertification (NumStreams, Certification) VALUES (10000000, 'Diamond');
INSERT INTO StreamSongCertification (NumStreams, Certification) VALUES (2000000, 'Multi-Platinum');
INSERT INTO StreamSongCertification (NumStreams, Certification) VALUES (500000, 'Gold');
INSERT INTO StreamSongCertification (NumStreams, Certification) VALUES (1000000, 'Platinum');
INSERT INTO StreamSongCertification (NumStreams, Certification) VALUES (100000, 'None');

INSERT INTO LyricsTitle(Lyrics, Title) VALUES
('Fly','Baby Shark');
INSERT INTO LyricsTitle(Lyrics, Title) VALUES
('Never','Never ');
INSERT INTO LyricsTitle(Lyrics, Title) VALUES
('Auuuugh','ARRRRRGH');
INSERT INTO LyricsTitle(Lyrics, Title) VALUES
('NAAAAAAAAAAAAAH','Trumpet Boiii');
INSERT INTO LyricsTitle(Lyrics, Title) VALUES
('Country','Country Road');

INSERT INTO
    Song (SongID, Genre,Duration,Lyrics,NumStreams)
VALUES (0, 'Pop', 3, 'Fly', 10000000);
 
INSERT INTO
    Song (SongID, Genre,Duration,Lyrics,NumStreams)
VALUES (1, 'Rap', 6, 'Never', 2000000);
 
INSERT INTO Song (SongID, Genre,Duration,Lyrics,NumStreams)
VALUES (2, 'Monkey-Trap', 4, 'Auuuugh', 500000);
 
INSERT INTO Song (SongID, Genre,Duration,Lyrics,NumStreams)
VALUES (3, 'Jazz', 1, 'NAAAAAAAAAAAAAH', 1000000);
 
INSERT INTO Song (SongID, Genre,Duration,Lyrics,NumStreams)
VALUES (4, 'Country', 5, 'Country', 100000);

INSERT INTO UserLikesSong (UserID, SongID)
VALUES(0, 0);
INSERT INTO UserLikesSong (UserID, SongID)
VALUES(0, 1);
INSERT INTO UserLikesSong (UserID, SongID)
VALUES (2, 2);
INSERT INTO UserLikesSong (UserID, SongID)
VALUES (52, 0);
INSERT INTO UserLikesSong (UserID, SongID)
VALUES(69, 0);

INSERT INTO SongHasKeyword (KeywordID, Keyword, SongID) VALUES (0, 'sociopath', 0);
INSERT INTO SongHasKeyword (KeywordID, Keyword, SongID) VALUES (1, 'apathy', 0);
INSERT INTO SongHasKeyword (KeywordID, Keyword, SongID) VALUES (2, 'turn', 2);
INSERT INTO SongHasKeyword (KeywordID, Keyword, SongID) VALUES (3, 'me', 2);
INSERT INTO SongHasKeyword (KeywordID, Keyword, SongID) VALUES (4, 'on', 2);

INSERT INTO UserPlaylists (PlaylistID) VALUES (0);
INSERT INTO UserPlaylists (PlaylistID) VALUES (1);
INSERT INTO UserPlaylists (PlaylistID) VALUES (2);
INSERT INTO UserPlaylists (PlaylistID) VALUES (3);
INSERT INTO UserPlaylists (PlaylistID) VALUES (444);

INSERT INTO UserHasUserPlaylists (UserID, PlaylistID) VALUES (0, 0);
INSERT INTO UserHasUserPlaylists (UserID, PlaylistID) VALUES (0, 1);
INSERT INTO UserHasUserPlaylists (UserID, PlaylistID) VALUES (2, 2);
INSERT INTO UserHasUserPlaylists (UserID, PlaylistID) VALUES (52, 3);
INSERT INTO UserHasUserPlaylists (UserID, PlaylistID) VALUES (52, 444);

INSERT INTO PlaylistContent (ContentID, PlaylistID) VALUES (0, 0);
INSERT INTO PlaylistContent (ContentID, PlaylistID) VALUES (1, 1);
INSERT INTO PlaylistContent (ContentID, PlaylistID) VALUES (2, 2);
INSERT INTO PlaylistContent (ContentID, PlaylistID) VALUES (3, 3);
INSERT INTO PlaylistContent (ContentID, PlaylistID) VALUES (444, 444);
    
INSERT INTO PlaylistContentIncludesSong (ContentID, SongID) VALUES (0, 0);
INSERT INTO PlaylistContentIncludesSong (ContentID, SongID) VALUES (0, 1);
INSERT INTO PlaylistContentIncludesSong (ContentID, SongID) VALUES (2, 3);
INSERT INTO PlaylistContentIncludesSong (ContentID, SongID) VALUES (2, 2);
INSERT INTO PlaylistContentIncludesSong (ContentID, SongID) VALUES (444, 2);
    
INSERT INTO StreamAlbumCertification (NumStreams, Certification) VALUES (10000000, 'Diamond');
INSERT INTO StreamAlbumCertification (NumStreams, Certification) VALUES (2000000, 'Multi-Platinum');
INSERT INTO StreamAlbumCertification (NumStreams, Certification) VALUES (500000, 'Gold');
INSERT INTO StreamAlbumCertification (NumStreams, Certification) VALUES (1000000, 'Platinum');
INSERT INTO StreamAlbumCertification (NumStreams, Certification) VALUES (100000, 'None');

INSERT INTO TitleRelease(Title, AlbumVersion, ReleaseDate, NumSongs) VALUES ('032 Funk', 1, '01-APR-21', 5);
INSERT INTO TitleRelease(Title, AlbumVersion, ReleaseDate, NumSongs) VALUES ('30', 1, '16-MAY-20', 10);
INSERT INTO TitleRelease(Title, AlbumVersion, ReleaseDate, NumSongs) VALUES ('Light Switch', 1, '30-MAR-22', 1);
INSERT INTO TitleRelease(Title, AlbumVersion, ReleaseDate, NumSongs) VALUES ('Pigeon!', 1, '25-FEB-22', 8);
INSERT INTO TitleRelease(Title, AlbumVersion, ReleaseDate, NumSongs) VALUES ('ZZZ', 1, '16-NOV-18', 9);

INSERT INTO Album(AlbumID, Title, AlbumVersion, NumStreams) VALUES (0, '032 Funk', 1, 2000000);
INSERT INTO Album(AlbumID, Title, AlbumVersion, NumStreams) VALUES (1, '30', 1, 10000000);
INSERT INTO Album(AlbumID, Title, AlbumVersion, NumStreams) VALUES (2, 'Light Switch', 1, 500000);
INSERT INTO Album(AlbumID, Title, AlbumVersion, NumStreams) VALUES (5, 'Pigeon!', 1, 100000);
INSERT INTO Album(AlbumID, Title, AlbumVersion, NumStreams) VALUES (99, 'ZZZ', 1, 1000000);

INSERT INTO AlbumHasKeyword (KeywordID, Keyword, AlbumID) VALUES (0, 'Funk', 0);
INSERT INTO AlbumHasKeyword (KeywordID, Keyword, AlbumID) VALUES (1, 'Celebration', 0);
INSERT INTO AlbumHasKeyword (KeywordID, Keyword, AlbumID) VALUES (2, 'Incheon Airport Freestyle', 0);
INSERT INTO AlbumHasKeyword (KeywordID, Keyword, AlbumID) VALUES (3, 'Sad', 1);
INSERT INTO AlbumHasKeyword (KeywordID, Keyword, AlbumID) VALUES (4, 'Upbeat', 2);

INSERT INTO AlbumIncludesSong (AlbumID, SongID) VALUES (0, 0);
INSERT INTO AlbumIncludesSong (AlbumID, SongID) VALUES (0, 1);
INSERT INTO AlbumIncludesSong (AlbumID, SongID) VALUES (1, 3);
INSERT INTO AlbumIncludesSong (AlbumID, SongID) VALUES (2, 2);
INSERT INTO AlbumIncludesSong (AlbumID, SongID) VALUES (2, 4);
    
INSERT INTO ArtistHasAlbum (UserID, AlbumID) VALUES (0, 0);
INSERT INTO ArtistHasAlbum (UserID, AlbumID) VALUES (0, 1);
INSERT INTO ArtistHasAlbum (UserID, AlbumID) VALUES (3, 2);
INSERT INTO ArtistHasAlbum (UserID, AlbumID) VALUES (4, 5);
INSERT INTO ArtistHasAlbum (UserID, AlbumID) VALUES (5, 99);
    
    
    
    
    