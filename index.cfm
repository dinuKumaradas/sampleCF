<cfscript>
    utilitiesCFC = CreateObject("component","SampleCF.components.utilities");
</cfscript>
<!DOCTYPE html>
<html>
    <title>This is my tiny application in CF</title>
    <head>
        <link rel="stylesheet" type="text/css" href="css/jquery.dataTables.css">
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/jquery.dataTables.js"></script>
        <script type="text/javascript">
            $(document).ready( function () {
                $('#library_tbl').DataTable();
            } );
        </script>
    </head>
    <body>
        <h1>This is my tiny application in CF to display books.</h1>
        <div>You are the visitor number <cfoutput>#application.noVisitors#</cfoutput> to this site.</div>
        <br>
        <table id="library_tbl" class="display">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Author</th>
                    <th>Title</th>
                </tr>
            </thead>
            <tbody>
                <cfset variables.bookDetails = utilitiesCFC.getBooksDetails()>
                <cfloop query = "variables.bookDetails"> 
                    <tr>
                        <td><cfoutput>#id#</cfoutput></td>
                        <td><cfoutput>#title#</cfoutput></td>
                        <td><cfoutput>#author#</cfoutput></td>
                    </tr>
                </cfloop>
            </tbody>
        </table>
    </body>
</html>