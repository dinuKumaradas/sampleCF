component {
    this.name = 'mySampleApp';
    this.sessionManagement = true;
    this.applicationTimeout = createTimeSpan(1,0,0,0);
    this.sessionTimeout = createTimeSpan(1,0,0,0);

    function onApplicationStart() {
        application.adminPassword = 'admin';
        application.dsn = 'mySampleDataSource';
        application.language = "EN";
        application.noVisitors = 0;
    }

    function onApplicationEnd() {}

    function onSessionStart() {
        application.noVisitors += 1;
    } 

    function onSessionEnd() {}

    function onRequestStart() { return true;}

    function onRequest(required string targetPage) {
        include arguments.targetPage;
    }

    function onRequestEnd() {}

    function onError(required any exception, required string eventName) {
        writeDump(exception);
        abort;
    }

    function onMissingTemplate(required string targetPage) {
        writeOutput('Missing File:' & targetPage );
        abort;
    }

}