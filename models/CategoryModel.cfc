<cfcomponent name="CategoryModel">

    <cffunction name="getTotalCategoryCount" access="public" returntype="numeric">
        <cfquery name="qryCategory" datasource="#application.datasource#">
            SELECT COUNT(*) as total FROM categories
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
        <cfargument name="totalRecords" type="any" required="true">
        <cfargument name="category_id" type="numeric" required="true">
        <cfquery name="qryCategory" datasource="#application.datasource#">
        select categories.category_id,categories.name,categories.slug from categories where 1=1
        <cfif searchValue neq "">
                AND (categories.name LIKE '%#searchValue#%' OR categories.slug LIKE '%#searchValue#%' OR categories.category_id LIKE '%#searchValue#%')
        </cfif>
            ORDER BY #orderColumn# #orderDir#
            LIMIT #start#, #length#
        </cfquery>
        <cfreturn qryCategory>
    </cffunction>

    <cffunction  name="saveCategory" access="public" returnType="struct">
        <cfargument name="userData" type="struct" required="true">
        <cfset var result={success=false,message = "" }>
        
        <cfif structKeyExists(userData, "categoryId")and len(trim(userData.categoryId))>
            <cfquery name="qryCategory" datasource="#application.datasource#">
                UPDATE categories SET
                name=<cfqueryparam value="#userData.name#" cfsqltype="cf_sql_varchar">,
                slug=<cfqueryparam value="#userData.slug#" cfsqltype="cf_sql_varchar">
                WHERE category_id = <cfqueryparam value="#userData.categoryId#" cfsqltype="cf_sql_integer">
            </cfquery>
            <cfset result.message = "category updated successfully">
            <cfset result.success = true>
        <cfelse>
            <cfif structKeyExists(userData, "name")and structKeyExists(userData, "slug") and trim(userData.name) NEQ "" and trim(userData.slug) NEQ "">
                <cfif NOT structKeyExists(userData, "slug") OR trim(userData.slug) EQ "">
                    <cfset result.message = "Slug is required and cannot be empty.">
                <cfreturn result>
                </cfif>

                <cfquery name="checkslug" datasource="#application.datasource#">
                    select slug from categories where 
                    slug=<cfqueryparam value="#userData.slug#" cfsqltype="cf_sql_varchar">  
                </cfquery>
                <cfif checkslug.recordCount GT 0>
                    <cfset result.message="slug already exists.Please use another">
                    <cfreturn result>  
                </cfif>
                <cfquery name="qryCategory"  datasource="#application.datasource#">
                        insert into categories(name,slug) values(
                            <cfqueryparam value="#userData.name#" cfsqltype="cf_sql_varchar">,
                            <cfqueryparam value="#userData.slug#" cfsqltype="cf_sql_varchar">     
                        )
                </cfquery> 
            <cfset result.message = "category saved successfully">
            <cfset result.success = true>
            <cfelse>
                <cfset result.message="">
            </cfif>    
        </cfif>  
        <cfreturn result> 
    </cffunction>

    <cffunction  name="getCategoryById" access="public" returnType="query">
        <cfargument  name="id" type="numeric" required="true">
        <cfquery name="qryCategory" datasource="#application.datasource#">
            select * from categories where 
            category_id=<cfqueryparam value="#id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn qryCategory>
    </cffunction>


    <cffunction  name="deleteCategory">
        <cfargument name="category_id" type="numeric" required="true">
        <cfset var result = { "success" = false, "message" = "" }>
        <cftry>
            <cfquery name="qryDelete" datasource="#application.datasource#">
                DELETE FROM categories
                WHERE category_id = <cfqueryparam value="#arguments.category_id#" cfsqltype="cf_sql_integer">
            </cfquery>
                <cfset result.success = true>
                <cfset result.message = "Category deleted successfully.">
            <cfcatch>
                <cfset result.message = "Error deleting category: #cfcatch.message#">
            </cfcatch>
        </cftry>
        <cfoutput>#serializeJSON(result)#</cfoutput>
    </cffunction>

</cfcomponent>