<cfcomponent displayname="CategoryModel" output="false">
    <cffunction name="getCategories" access="public" returntype="query">
        <cfquery name="qryCategories" datasource="#application.datasource#">
            SELECT category_id, name, slug FROM categories
        </cfquery>
        <cfreturn qryCategories>
    </cffunction>
</cfcomponent>