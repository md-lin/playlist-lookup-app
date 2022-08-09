<!DOCTYPE html>
<html>

<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
</style>

<head>
    <meta charset="utf-8">
    <title>CPSC 304 Project</title>
</head>

<body>
    <h1> Hello, Guest! </h1>
    <!-- add a variable for user nickname later  -->
    <!--update to User once user creates a nickname -->

    <h2>Upload Song</h2>

    <form method="POST" action="site.php">
        <!--refresh page when submitted-->
        <input type="hidden" id="insertQueryRequest" name="insertQueryRequest">
        Title: <input type="text" name="insTitle"> <br /><br />
        Duration (in minutes): <input type="text" name="insDuration"> <br /><br />
        Genre: <input type="text" name="insGenre"> <br /><br />

        <input type="submit" value="Insert" name="insertSubmit"></p>
    </form>

    <hr />

    <h2>Delete Playlist</h2>

    <form method="GET" action="site.php">
        <!--refresh page when submitted-->
        <input type="hidden" id="printPlaylistsRequest" name="printPlaylistsRequest">
        <input type="submit" value="Show All Playlists" name="printPlaylists"></p>
    </form>

    <form method="POST" action="site.php">
        <!-- if you want another page to load after the button is clicked, you have to specify that page in the action parameter -->
        <input type="hidden" id="deletePlaylistRequest" name="deletePlaylistRequest">
        Playlist Name: <input type="text" name="deletePlaylistName"> <br />
        <p><input type="submit" value="Delete" name="deleteSubmit"></p>
    </form>

    <hr />

    <h2>Update Song</h2>

    <form method="GET" action="site.php">
        <!--refresh page when submitted-->
        <input type="hidden" id="printTuplesRequest" name="printTuplesRequest">
        <input type="submit" value="Show Songs" name="printTuples"></p>
    </form>
    <form method="POST" action="site.php">
        <!--refresh page when submitted-->

        <input type="hidden" id="updateQueryRequest" name="updateQueryRequest">
        <pre>
				                            Select to update <br/><br/>
        Enter ID of song to update: <input type="text" name="songID_upd"> <br /><br />
        Title:	                    <input type="text" name="new_Title">      <input type="checkbox" name="formUpdate[]" value="Title" /> <br /><br />
        Genre:		            <input type="text" name="new_Genre">      <input type="checkbox" name="formUpdate[]" value="Genre" /> <br /><br />
        Duration:	            <input type="text" name="new_Duration">      <input type="checkbox" name="formUpdate[]" value="Duration" /> <br /><br />
                                        <input type="submit" value="Update" name="updateSubmit"></p>    
        </pre>


    </form>

    <hr />

    <h2>Selection </h2>

    <form method="POST" action="site.php">
        <input type="hidden" id="selectionRequest" name="selectionRequest">
        <label for="tables">Choose to view:</label>
        <select name="table-select" id="table-select">
        <option value="song">Songs</option>
        <option value="album">Albums</option>
        <option value="userplaylists">Playlists</option>
        </select>
        <br/>
        Select attributes to view and potential search criteria below:
        <br/>
        <table>
  <tr>
    <td><b><ins>Song</ins></b></td>
    <td><b><input type="checkbox" name="formSong[]" value="title"> Title </b></td>
    <td><b><input type="checkbox" name="formSong[]" value="genre">Genre </b></td>
    <td><b><input type="checkbox" name="formSong[]" value="duration">Duration (Minutes) </b></td>
  </tr>
  <tr>
    <td></td>
    <td>Search: <input type="text" name="selectSongTitleLike"></td>
    <td>Search: <input type="text" name="selectGenre"></td>
    <td>0-3 <input type="radio" name="selectDuration" value=""> 
    <!-- TODO include values for selectduration so that the button can go directly into the query
        i.e. <= 3 / >=3 AND <5 / >= 5 -->
        3-5 <input type="radio" name="selectDuration" value="">
        5+<input type="radio" name="selectDuration" value=""></td>
  </tr>
  <tr>
    <td><b><ins>Album</ins></b></td>
    <td><b><input type="checkbox" name="formAlbum[]" value="title">Title</b></td>
    <td><b><input type="checkbox" name="formAlbum[]" value="numSongs">Number of Songs</b></td>
    <td></td>
  </tr>
  <tr>
    <td>  </td>
    <td>Search: <input type="text" name="selectAlbumTitleLike"></td>
    <td>1<input type="radio" name="selectNumSongs" value="=1"> 
    <!-- TODO include values for selectduration so that the button can go directly into the query
        i.e. <= 3 / >=3 AND <5 / >= 5 -->
        2-5 <input type="radio" name="selectNumSongs" value=">2 AND numSongs <6" >
        6+<input type="radio" name="selectNumSongs" value="> 5"></td>
    <td></td>
</tr>
<tr>
    <td><b><ins>Playlist</ins></b></td>
    <td><b><input type="checkbox" name="formPlaylist[]" value="name">Playlist Name</b></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <td></td>
    <td>Search: <input type="text" name="selectNameLike"></td>
    <td></td>
    <td></td>
</tr>
</table>
        <p><input type="submit" value="Show" name="selectionSubmit"></p>
    </form>

    <hr />

    <h2>Projection from Song table</h2>

    <form method="POST" action="site.php">
        <input type="hidden" id="projectSongRequest" name="projectSongRequest">
        Select song attributes to project: <br /><br />
        <pre>
        Song ID:  <input type="checkbox" name="formProject[]" value="SongID" /> <br />
        Title:    <input type="checkbox" name="formProject[]" value="Title" /> <br />
        Genre:    <input type="checkbox" name="formProject[]" value="Genre" /> <br />
        Duration: <input type="checkbox" name="formProject[]" value="Duration" /> <br />
                <p>         <input type="submit" value="Project" name="projectSubmit"></p>
        </pre>
    </form>

    <hr />

    <h2>Join</h2>

    <form method="POST" action="site.php">
        <input type="hidden" id="joinRequest" name="joinRequest">
        Find all playlist having songs with a genre: <input type="text" name="playlistGenre">
        <p><input type="submit" value="Search" name="joinSubmit"></p>
    </form>

    <hr />


    <h2>Aggregation with Group By</h2>

    <form method="POST" action="site.php">
        <input type="hidden" id="groupByRequest" name="groupByRequest">
        Average duration of songs per genre (in minutes): <br /><br />
        <p> <input type="submit" value="Show" name="groupBySubmit"></p>
    </form>

    <hr />

    <h2>Aggregation with Having</h2>

    <form method="POST" action="site.php">
        <input type="hidden" id="havingRequest" name="havingRequest">
        Find average duration of songs by artists who have created more than one song: <br /><br />
        <p> <input type="submit" value="Find" name="havingSubmit"></p>

        <hr />

        <h2>Nested Aggregation</h2>

        <form method="POST" action="site.php">
            <input type="hidden" id="nestedRequest" name="nestedRequest">
            Find the monthly listener of the most listened artist with monthly listener > 100000,
            for each genre for which the average monthly listener of the artists who have monthly listeners>100000
            is higher than the average monthly listeners of all artists across all genres. <br /><br />
            <p> <input type="submit" value="Find" name="nestedSubmit"></p>

        </form>

        <hr />

        <h2>Division</h2>

        <form method="POST" action="site.php">
            <input type="hidden" id="divisionRequest" name="divisionRequest">
            Find titles of songs that are present in all playlists. <br /><br />
            <p> <input type="submit" value="Find" name="divisionSubmit"></p>
        </form>

        <hr />

        <?php
        //this tells the system that it's no longer just parsing html; it's now parsing PHP

        $success = True; //keep track of errors so it redirects the page only if there are no errors
        $db_conn = NULL; // edit the login credentials in connectToDB()
        $show_debug_alert_messages = False; // set to True if you want alerts to show you which methods are being triggered (see how it is used in debugAlertMessage())

        function debugAlertMessage($message)
        {
            global $show_debug_alert_messages;

            if ($show_debug_alert_messages) {
                echo "<script type='text/javascript'>alert('" . $message . "');</script>";
            }
        }

        function executePlainSQL($cmdstr)
        { //takes a plain (no bound variables) SQL command and executes it
            //echo "<br>running ".$cmdstr."<br>";
            global $db_conn, $success;

            $statement = OCIParse($db_conn, $cmdstr);
            //There are a set of comments at the end of the file that describe some of the OCI specific functions and how they work

            if (!$statement) {
                echo "<br>Cannot parse the following command: " . $cmdstr . "<br>";
                $e = OCI_Error($db_conn); // For OCIParse errors pass the connection handle
                echo htmlentities($e['message']);
                $success = False;
            }

            $r = OCIExecute($statement, OCI_DEFAULT);
            if (!$r) {
                echo "<br>Cannot execute the following command: " . $cmdstr . "<br>";
                $e = oci_error($statement); // For OCIExecute errors pass the statementhandle
                echo htmlentities($e['message']);
                $success = False;
            }

            return $statement;
        }

        function executeBoundSQL($cmdstr, $list)
        {
            /* Sometimes the same statement will be executed several times with different values for the variables involved in the query.
		In this case you don't need to create the statement several times. Bound variables cause a statement to only be
		parsed once and you can reuse the statement. This is also very useful in protecting against SQL injection.
		See the sample code below for how this function is used */

            global $db_conn, $success;
            $statement = OCIParse($db_conn, $cmdstr);

            if (!$statement) {
                echo "<br>Cannot parse the following command: " . $cmdstr . "<br>";
                $e = OCI_Error($db_conn);
                echo htmlentities($e['message']);
                $success = False;
            }

            foreach ($list as $tuple) {
                foreach ($tuple as $bind => $val) {
                    //echo $val;
                    //echo "<br>".$bind."<br>";
                    OCIBindByName($statement, $bind, $val);
                    unset($val); //make sure you do not remove this. Otherwise $val will remain in an array object wrapper which will not be recognized by Oracle as a proper datatype
                }

                $r = OCIExecute($statement, OCI_DEFAULT);
                if (!$r) {
                    echo "<br>Cannot execute the following command: " . $cmdstr . "<br>";
                    $e = OCI_Error($statement); // For OCIExecute errors, pass the statementhandle
                    echo htmlentities($e['message']);
                    echo "<br>";
                    $success = False;
                }
            }
        }

        function printResult($result)
        { //prints results from a select statement
            echo "<br/>Retrieved data from table Song:<br/><br/>";
            echo "<table border='1' width='600' cellpadding='3' cellspacing='3'>";
            echo "<tr><th>SongID</th><th>Title</th><th>Genre</th><th>Duration</th></tr>";

            while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
                echo "<tr><td>" . $row[0] . "</td><td>" . $row[1] . "</td><td>" . $row[2] . "</td><td>" . $row[3] . "</td></tr>";
            }

            echo "</table>";
        }


        function build_table($array)
        {
            // start table
            $html = '<table>';
            // header row
            $html .= '<tr>';
            foreach ($array[0] as $key => $value) {
                $html .= '<th>' . htmlspecialchars($key) . '</th>';
            }
            $html .= '</tr>';

            // data rows
            foreach ($array as $key => $value) {
                $html .= '<tr>';
                foreach ($value as $key2 => $value2) {
                    $html .= '<td>' . htmlspecialchars($value2) . '</td>';
                }
                $html .= '</tr>';
            }

            // finish table and return it

            $html .= '</table>';
            return $html;
        }

        function printCustomResult($result)
        {
            echo "<br/>Retrieved data:<br/><br/>";
            $row = oci_fetch_assoc($result);
            echo "<table border='1' width='600' cellpadding='3' cellspacing='3'>";
            echo "<thead>";
            echo  "<tr>";
            echo  "<th>";
            echo implode("</th><th>", array_keys($row));
            echo "</th>";
            echo "</tr>";
            echo "</thead>";
            echo "<tbody>";
            echo "<tr>";
            echo "<td>";
            echo implode("</td><td>", $row);
            echo "</td>";

            while ($row = oci_fetch_assoc($result)) {
                echo "<tr>";
                echo "<td>";
                echo implode("</td><td>", $row);
                echo "</td>";
                echo "</tr>";
            }
            echo "</tbody>";
            echo "</table>";
        }

        function printTwoTables($result1, $result2) {
            echo "<br/>Retrieved user playlists:<br/><br/>";
            $row1 = oci_fetch_assoc($result1);
            echo "<table border='1' width='600' cellpadding='3' cellspacing='3'>";
            echo "<thead>";
            echo  "<tr>";
            echo  "<th>";
            echo implode("</th><th>", array_keys($row1));
            echo "</th>";
            echo "</tr>";
            echo "</thead>";
            echo "<tbody>";
            echo "<tr>";
            echo "<td>";
            echo implode("</td><td>", $row1);
            echo "</td>";

            while ($row1 = oci_fetch_assoc($result1)) {
                echo "<tr>";
                echo "<td>";
                echo implode("</td><td>", $row1);
                echo "</td>";
                echo "</tr>";
            }
            echo "</tbody>";
            echo "</table>";

            echo "<br/>Retrieved playlist-song associations:<br/><br/>";
            $row2 = oci_fetch_assoc($result2);
            echo "<table border='1' width='600' cellpadding='3' cellspacing='3'>";
            echo "<thead>";
            echo  "<tr>";
            echo  "<th>";
            echo implode("</th><th>", array_keys($row2));
            echo "</th>";
            echo "</tr>";
            echo "</thead>";
            echo "<tbody>";
            echo "<tr>";
            echo "<td>";
            echo implode("</td><td>", $row2);
            echo "</td>";

            while ($row2 = oci_fetch_assoc($result2)) {
                echo "<tr>";
                echo "<td>";
                echo implode("</td><td>", $row2);
                echo "</td>";
                echo "</tr>";
            }
            echo "</tbody>";
            echo "</table>";
        }

        function connectToDB()
        {
            global $db_conn;

            // Your username is ora_(CWL_ID) and the password is a(student number). For example,
            // ora_platypus is the username and a12345678 is the password.
            $db_conn = OCILogon("ora_srahul14", "a63475768", "dbhost.students.cs.ubc.ca:1522/stu");

            if ($db_conn) {
                debugAlertMessage("Database is Connected");
                return true;
            } else {
                debugAlertMessage("Cannot connect to Database");
                $e = OCI_Error(); // For OCILogon errors pass no handle
                echo htmlentities($e['message']);
                return false;
            }
        }

        function disconnectFromDB()
        {
            global $db_conn;

            debugAlertMessage("Disconnect from Database");
            OCILogoff($db_conn);
        }

        function IsChecked($chkname, $value)
        {
            if (!empty($_POST[$chkname])) {
                foreach ($_POST[$chkname] as $chkval) {
                    if ($chkval == $value) {
                        return true;
                    }
                }
            }
            return false;
        }

        function handleUpdateRequest()
        {
            global $db_conn;

            $tuple = array(
                ":bind1" => $_POST['songID_upd'],
                ":bind2" => $_POST['new_Title'],
                ":bind3" => $_POST['new_Genre'],
                ":bind4" => $_POST['new_Duration']
            );

            $alltuples = array(
                $tuple
            );

            if (IsChecked('formUpdate', 'Title')) executeBoundSQL("update Song set Title=:bind2 where SONGID=:bind1", $alltuples);
            if (IsChecked('formUpdate', 'Genre')) executeBoundSQL("update Song set Genre=:bind3 where SONGID=:bind1", $alltuples);
            if (IsChecked('formUpdate', 'Duration')) executeBoundSQL("update Song set Duration=:bind4 where SONGID=:bind1", $alltuples);
            OCICommit($db_conn);
        }

        function handleDeleteRequest()
        {
            global $db_conn;

            $tuple = array(
                ":bind1" => $_POST['deletePlaylistName']
            );

            $alltuples = array(
                $tuple
            );

            executeBoundSql("delete from userplaylists p where p.playlistname= (:bind1)", $alltuples);
            OCICommit($db_conn);
        }

        function handleInsertRequest()
        {
            global $db_conn, $success;

            //Getting the values from user and insert data into the table
            $tuple = array(
                ":bind1" => $_POST['insTitle'],
                ":bind2" => $_POST['insDuration'],
                ":bind3" => $_POST['insGenre']
            );

            $alltuples = array(
                $tuple
            );


            executeBoundSQL("insert into song (SongID, Title, Duration, Genre) values (song_seq.nextval,:bind1, :bind2, :bind3)", $alltuples);

            OCICommit($db_conn);
        }

        function handleJoinRequest()
        {
            global $db_conn;
            //finish
            $genre = $_POST['playlistGenre'];

            $result = executePlainSQL("select distinct playlistname, up.playlistID from userplaylists up, playlistincludessong pis, song s where s.genre = '$genre' AND up.playlistID = pis.playlistID AND pis.songID = s.songID");

            printCustomResult($result);
        }

        function handleCountRequest()
        {
            global $db_conn;

            $result = executePlainSQL("SELECT Count(*) FROM Song");

            if (($row = oci_fetch_row($result)) != false) {
                echo "<br> The number of tuples in Song table: " . $row[0] . "<br>";
            }
        }

        function handleDisplayRequest()
        {
            global $db_conn;

            $result = executePlainSQL("SELECT * FROM Song Order BY SongID");

            printResult($result);
        }

        function handlePlaylistDisplayRequest()
        {
            global $db_conn;

            $result = executePlainSQL("select * from userplaylists");

            $result1 = executePlainSQL("select * from userplaylists up, userhasuserplaylists uhup WHERE
                uhup.playlistID = up.playlistID");

            $result2 = executePlainSQL("select * from userplaylists up, playlistincludessong pis WHERE
                up.playlistID = pis.playlistID");

            printCustomResult($result);
            printTwoTables($result1, $result2);
        }

        function handleProjectRequest()
        {

            global $db_conn;

            $attributes = array();

            if (IsChecked('formProject', 'SongID')) array_push($attributes, 'SongID');
            if (IsChecked('formProject', 'Title')) array_push($attributes, 'Title');
            if (IsChecked('formProject', 'Genre')) array_push($attributes, 'Genre');
            if (IsChecked('formProject', 'Duration')) array_push($attributes, 'Duration');

            $new_att = join(",", $attributes);

            $result = executePlainSQL("SELECT $new_att FROM Song");

            printCustomResult($result);
        }

        function handleGroupByRequest()
        {
            global $db_conn;
            $result = executePlainSQL("Select Genre, Avg(Duration) as Average_Duration From Song Group By Genre");
            printCustomResult($result);
        }

        function handleHavingRequest()
        {
            global $db_conn;
            $result = executePlainSQL("SELECT a.USERID AS \" UserID \", a.STAGENAME AS \" Artist Name \", AVG(s.DURATION) AS \"Average Song Duration (Minutes) \"
            FROM ARTIST a, ARTISTCREATESSONG acs, SONG s 
            WHERE a.USERID = acs.USERID AND s.SONGID = acs.SONGID 
            GROUP BY a.USERID, a.STAGENAME
            HAVING COUNT(acs.SONGID) > 1 ");
            printCustomResult($result);
        }

        function handleDivisionRequest()
        {
            global $db_conn;
            $result = executePlainSQL("SELECT title
                                    FROM Song S WHERE NOT EXISTS((SELECT P.PlaylistID FROM UserPlaylists P)
                                    MINUS (SELECT PS.PlaylistID FROM PlaylistIncludesSong PS WHERE PS.SONGID = S.SONGID))");
            printCustomResult($result);
        }

        function handleNestedRequest()
        {
            global $db_conn;

            $result = executePlainSQL("WITH artist_song as(SELECT * FROM ARTIST a , ARTISTCREATESSONG a2 , SONG s WHERE a.USERID = a2.USERID AND a2.SONGID = s.SONGID)
                SELECT A.genre, MAX(A.MONTHLYLISTENERS) AS Max_Listeners
                FROM artist_song A
                WHERE A.MONTHLYLISTENERS > 100000
                GROUP BY A.Genre
                HAVING avg(A.MONTHLYLISTENERS) > (Select avg(MONTHLYLISTENERS) From Artist)");

            printCustomResult($result);
        }

        function handleSelectionRequest()
        {
            global $db_conn;

            $table = $_POST['table-select'];
            $result;
            $playlistName = $_POST['selectNameLike'];
            $albumName = $_POST['selectAlbumTitleLike'];
            $albumNumSongs = $_POST['selectNumSongs'];

            if ($table == "userplaylists") {
                $attributes = array("playlistid");

                if (IsChecked('formPlaylist', 'name')) array_push($attributes, 'playlistname AS "Playlist Names"');

                $attributes = join(",", $attributes);
                if (!empty($playlistName)) {
                    $result = executePlainSQL("select $attributes FROM userplaylists
                        WHERE playlistname LIKE '%$playlistName%'");
                } else {
                    $result = executePlainSQL("select $attributes from userplaylists");
                }
            } else if ($table == "song") {
                $result = executePlainSQL("select * from song");
                //TODO: complete options for song handling
            } else if ($table == "album") {
                $attributes = array("albumid");

                if (IsChecked('formAlbum', 'title')) array_push($attributes, 'title');
                if (IsChecked('formAlbum', 'numSongs')) array_push($attributes, 'numsongs');

                $attributes = join(",", $attributes);
                if (!empty($albumName)) {
                    if (isset($albumNumSongs)) {
                        $result = executePlainSQL("select $attributes from album WHERE numsongs $albumNumSongs AND title LIKE '%$albumName%'");
                    } else {
                        $result = executePlainSQL("select $attributes from album WHERE title LIKE '%$albumName%'");
                    }
                } else {
                    if (isset($albumNumSongs)) {
                        $result = executePlainSQL("select $attributes from album WHERE numsongs $albumNumSongs");
                    } else {
                        $result = executePlainSQL("select $attributes from album");
                    }
                }
            }
            printCustomResult($result);
        }

        // HANDLE ALL POST ROUTES
        // A better coding practice is to have one method that reroutes your requests accordingly. It will make it easier to add/remove functionality.
        function handlePOSTRequest()
        {
            if (connectToDB()) {
                if (array_key_exists('updateQueryRequest', $_POST)) {
                    handleUpdateRequest();
                } else if (array_key_exists('insertQueryRequest', $_POST)) {
                    handleInsertRequest();
                } else if (array_key_exists('deletePlaylistRequest', $_POST)) {
                    handleDeleteRequest();
                } else if (array_key_exists('projectSongRequest', $_POST)) {
                    handleProjectRequest();
                } else if (array_key_exists('groupByRequest', $_POST)) {
                    handleGroupByRequest();
                } else if (array_key_exists('divisionRequest', $_POST)) {
                    handleDivisionRequest();
                } else if (array_key_exists('joinRequest', $_POST)) {
                    handleJoinRequest();
                } else if (array_key_exists('havingRequest', $_POST)) {
                    handleHavingRequest();
                } else if (array_key_exists('nestedRequest', $_POST)) {
                    handleNestedRequest();
                } else if (array_key_exists('selectionRequest', $_POST)) {
                    handleSelectionRequest();
                }

                disconnectFromDB();
            }
        }

        // HANDLE ALL GET ROUTES
        // A better coding practice is to have one method that reroutes your requests accordingly. It will make it easier to add/remove functionality.
        function handleGETRequest()
        {
            if (connectToDB()) {
                if (array_key_exists('countTuples', $_GET)) {
                    handleCountRequest();
                } else if (array_key_exists('printTuples', $_GET)) {
                    handleDisplayRequest();
                } else if (array_key_exists('printPlaylists', $_GET)) {
                    handlePlaylistDisplayRequest();
                }


                disconnectFromDB();
            }
        }


        if (
            isset($_POST['updateSubmit']) || isset($_POST['insertSubmit']) || isset($_POST['selectionSubmit'])
            || isset($_POST['projectSubmit']) || isset($_POST['groupBySubmit']) || isset($_POST['deleteSubmit'])
            || isset($_POST['divisionSubmit']) || isset($_POST['joinSubmit']) || isset($_POST['havingSubmit'])
            || isset($_POST['nestedSubmit'])
        ) {
            handlePOSTRequest();
        } else if (isset($_GET['countTupleRequest']) || isset($_GET['printTuples']) || isset($_GET['printPlaylists'])) {
            handleGETRequest();
        }
        ?>
</body>

</html>