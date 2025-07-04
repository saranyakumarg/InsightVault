<cfcomponent name="CategoryModel">

    <cffunction name="getTotalCategoryCount" access="public" returntype="numeric">
        <cfargument name="category_id" type="numeric" required="true">
        <cfquery name="qryCategory" datasource="#application.datasource#">
            SELECT COUNT(*) as total FROM categories
            WHERE category_id != <cfqueryparam value="#category_id#" cfsqltype="cf_sql_integer"> 
        </cfquery>
        <cfreturn qryCategory.total>
    </cffunction>
    <cffunction  name="getCategory" access="public" returnType="query">
        <cfargument  name="draw" type="numeric" required="true">
        <cfargument  name="start" type="numeric" required="true">
        <cfargument  name="length" type="numeric" required="true">
        <cfargument name="searchValue" type="string" required="true">
        <cfargument name="orderColumn" type="string" required="true">
        <cfargument name="orderDir" type="string" required="true">
        <cfargument name="totalRecords" type="numeric" required="true">
        <cfargument name="category_id" type="numeric" required="true">
        <cfquery name="qryCategory" datasource="#application.datasource#">
        select categories.category_id,categories.name,categories.slug from categories
        <cfif searchValue neq "">
                AND (categories.name LIKE '%#searchValue#%' OR categories.slug LIKE '%#searchValue#%')
            </cfif>
            ORDER BY #orderColumn# #orderDir#
            LIMIT #start#, #length#
        </cfquery>
        <cfreturn qryCategory>
    </cffunction>
</cfcomponent>