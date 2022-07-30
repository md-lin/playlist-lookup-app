<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>CPSC 304 Project</title>
</head>

<body>
    <h2>Insert New Data</h2>

    <form method="POST" action="site.php">
        <!--refresh page when submitted-->
        <input type="hidden" id="insertQueryRequest" name="insertQueryRequest">
        Number: <input type="text" name="insNo"> <br /><br />
        Name: <input type="text" name="insName"> <br /><br />

        <input type="submit" value="Insert" name="insertSubmit"></p>
    </form>

    <hr />

    <h2>Delete Data</h2>

    <form method="POST" action="site.php">
        <!-- if you want another page to load after the button is clicked, you have to specify that page in the action parameter -->
        <input type="hidden" id="resetTablesRequest" name="resetTablesRequest">
        <p><input type="submit" value="Reset" name="reset"></p>
    </form>

</body>

</html>