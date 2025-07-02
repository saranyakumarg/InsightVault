<cfif structKeyExists(url, "method")>
    <cfsetting enablecfoutputonly="true" />
    <cfsetting showDebugOutput="false">
</cfif>
<cfscript>
    // Get the access levels from the AccessLevelModel
    variables.accessLevelModel = createObject("component", application.baseURL & "models.AccessLevelModel");
    variables.accessLevels = variables.accessLevelModel.getAccessLevels();
    // Get the categories from the CategoriesModel
    variables.categoriesModel = createObject("component", application.baseURL & "models.CategoriesModel");
    variables.categories = variables.accessLevelModel.getCategories();
    // Get the audit log model
    variables.auditLogModel = createObject("component", application.baseURL & "models.AuditLogModel");

</cfscript>