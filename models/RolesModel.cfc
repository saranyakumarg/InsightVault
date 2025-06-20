<cfcomponent displayname="RolesModel" output="false">
    <cffunction name="getRoles" access="public" returntype="query">
        <cfquery name="qryRoles" datasource="#application.datasource#">
            SELECT * FROM roles
        </cfquery>
        <cfreturn qryRoles>
    </cffunction>
</cfcomponent>