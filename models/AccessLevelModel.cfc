<cfcomponent displayname="AccessLevelModel" output="false">
    <cffunction name="getAccessLevels" access="public" returntype="query">
        <cfquery name="qryAccessLevels" datasource="#application.datasource#">
            SELECT * FROM access_levels
        </cfquery>
        <cfreturn qryAccessLevels>
    </cffunction>
</cfcomponent>