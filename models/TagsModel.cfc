<cfcomponent displayname="TagsModel" output="false">
    <cffunction name="getTags" access="public" returntype="query">
        <cfquery name="qryTags" datasource="#application.datasource#">
            SELECT tag_id, slug FROM Tags
        </cfquery>
        <cfreturn qryTags>
    </cffunction>
</cfcomponent>