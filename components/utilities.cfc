component displayname="user defined functions" output="false" { 

    public query function getBooksDetails() {
        var qryBooks = "";
        try {
            if(isDSNExists(application.dsn)) {
                qryBooks = QueryExecute("Select id, author, title from books order by title"
                                , {} 
                                , {datasource=application.dsn}
                            );
                if( NOT qryBooks.recordCount) {
                    qryBooks = getDefaultList();
                }
            } else {
                qryBooks = getDefaultList();
            }
        } 
        catch(any excpt) { 
            qryBooks = getDefaultList();
        } 
       
        return qryBooks;
    }

    private query function getDefaultList(numeric noOfRows = 10) {

        var myDefaultData = queryNew("id, title, author", "integer, varchar, varchar");

        if (arguments.noOfRows GT 0) {
            for (i=1; i <= arguments.noOfRows; i++) {
                queryAddRow(myDefaultData);
                querySetCell(myDefaultData, "id", i);
                querySetCell(myDefaultData, "title", "Title " & i);
                querySetCell(myDefaultData, "author", "Author " & i);
            }
        }

        return myDefaultData;
    }

    private string function isDSNExists ( required string dsn) {
        if(Len(Trim(arguments.dsn))) {
            var adminObj = createObject("component","cfide.adminapi.administrator");
            adminObj.login(application.adminPassword);
            var datasource = createObject("component", "cfide.adminapi.datasource");
            return datasource.verifyDSN(arguments.dsn, true);
        } else {
            return false;
        }
        
    }
}
