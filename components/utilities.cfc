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

    private query function getDefaultList() {
        var myDefaultData = queryNew(data=[
                                {"id":1, "title":"Title 1", "author":"Author 1"}
                                , {"id":2, "title":"Title 2", "author":"Author 2"}
                                , {"id":3, "title":"Title 3", "author":"Author 3"}
                                , {"id":4, "title":"Title 4", "author":"Author 4"}
                                , {"id":5, "title":"Title 5", "author":"Author 5"}
                                , {"id":6, "title":"Title 6", "author":"Author 6"}
                                , {"id":7, "title":"Title 7", "author":"Author 7"}
                                , {"id":8, "title":"Title 8", "author":"Author 8"}
                                , {"id":9, "title":"Title 9", "author":"Author 9"}
                                , {"id":10, "title":"Title 10", "author":"Author 10"}
                                , {"id":11, "title":"Title 11", "author":"Author 11"}
                                , {"id":12, "title":"Title 12", "author":"Author 12"}
                                , {"id":13, "title":"Title 13", "author":"Author 13"}
                                , {"id":14, "title":"Title 14", "author":"Author 14"}
                                , {"id":15, "title":"Title 15", "author":"Author 15"}
                                , {"id":16, "title":"Title 16", "author":"Author 16"}
                                , {"id":17, "title":"Title 17", "author":"Author 17"}
                                , {"id":18, "title":"Title 18", "author":"Author 18"}
                                , {"id":19, "title":"Title 19", "author":"Author 19"}
                                , {"id":20, "title":"Title 20", "author":"Author 20"}
                                , {"id":21, "title":"Title 21", "author":"Author 21"}
                                , {"id":22, "title":"Title 22", "author":"Author 22"}
                                , {"id":23, "title":"Title 23", "author":"Author 23"}
                                , {"id":24, "title":"Title 24", "author":"Author 24"}
                                , {"id":25, "title":"Title 25", "author":"Author 25"}

                            ]);
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