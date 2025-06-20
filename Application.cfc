
component{
    this.name = "InsightVault";
    this.sessionManagement = "yes";
    this.sessionTimeout = createTimeSpan(0, 0, 30, 0);
    this.showDebugOutput = "yes";
    this.datasource = "insight_vault_dsn";
    // this.ormEnabled = true;
    // this.ormSettings = {
    //     dbCreate = "update", // or "create", "none"
    //     dialect = "MySQL"
    // };
    
    function onApplicationStart() {
        application.pageTitle = "Welcome to InsightVault";
        application.baseUrl = "/myprojects/InsightVault/";
        application.year = Year(Now());
        application.datasource = this.datasource;
        return true;
    }
}