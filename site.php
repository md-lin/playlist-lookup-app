<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>CPSC 304 Project</title>
</head>

<body>
    <h1> Hello, Guest! </h1>
    <!-- add a variable for user nickname later  -->
    <!--update to User once user creates a nickname -->

    <h2>Upload Song</h2>
    <h4> Starred fields are mandatory.</h4>

    <form method="POST" action="site.php">
        <!--refresh page when submitted-->
        <input type="hidden" id="insertQueryRequest" name="insertQueryRequest">
        Title*: <input type="text" name="insTitle"> <br /><br />
        Duration (in minutes): <input type="text" name="insDuration"> <br /><br />
        Genre: <input type="text" name="insGenre"> <br /><br />

        <input type="submit" value="Insert" name="insertSubmit"></p>
    </form>

    <hr />

    <h2>Delete Playlist</h2>

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
        // foreach (array_keys($row) as $array_key) {
        //     if ((string)(int)$array_key != $array_key) {
        //         echo "</th><th>$array_key";
        //     }
        // }
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

            //print_r($row);

            echo "<tr>";
            echo "<td>";
            echo implode("</td><td>", $row);
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

    function handleResetRequest()
    {
        global $db_conn;
        // Drop old table
        executePlainSQL("DROP TABLE demoTable");

        // Create new table
        echo "<br> creating new table <br>";
        executePlainSQL("CREATE TABLE demoTable (id int PRIMARY KEY, name char(30))");
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

        executeBoundSql("delete from playlist p where p.playlistname= (:bind1)", $alltuples);
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

        $result = executePlainSQL("SELECT * FROM Song");

        printResult($result);
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

        //echo ($new_att);
        //echo ("SELECT $new_att FROM Song");

        $result = executePlainSQL("SELECT $new_att FROM Song");

        //echo ($result[0]);
        printCustomResult($result);
        // printResult($result);
        //echo build_table($result);
    }

    // HANDLE ALL POST ROUTES
    // A better coding practice is to have one method that reroutes your requests accordingly. It will make it easier to add/remove functionality.
    function handlePOSTRequest()
    {
        if (connectToDB()) {
            if (array_key_exists('resetTablesRequest', $_POST)) {
                handleResetRequest();
            } else if (array_key_exists('updateQueryRequest', $_POST)) {
                handleUpdateRequest();
            } else if (array_key_exists('insertQueryRequest', $_POST)) {
                handleInsertRequest();
            } else if (array_key_exists('deletePlaylistRequest', $_POST)) {
                handleDeleteRequest();
            } else if (array_key_exists('projectSongRequest', $_POST)) {
                handleProjectRequest();
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
            }


            disconnectFromDB();
        }
    }


    if (isset($_POST['reset']) || isset($_POST['updateSubmit']) || isset($_POST['insertSubmit']) || isset($_POST['projectSubmit'])) {
        handlePOSTRequest();
    } else if (isset($_GET['countTupleRequest']) || isset($_GET['printTuples'])) {
        handleGETRequest();
    }
    ?>
</body>

</html>