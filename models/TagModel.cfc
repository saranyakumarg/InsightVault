<cfcomponent displayname="TagModel">

<cffunction  name="getTotalTagsCount" access="public" returnType="numeric" >
    <cfquery name="getTagsCount" datasource="#application.datasource#">
        select count(*) as total from tags
    </cfquery>
    <cfreturn getTagsCount.total>
</cffunction>
<cffunction  name="getTags" access="public" returnType="query">
        <cfargument  name="draw" type="numeric" required="true">
        <cfargument  name="start" type="numeric" required="true">
        <cfargument  name="length" type="numeric" required="true">
        <cfargument name="searchValue" type="string" required="true">
        <cfargument name="orderColumn" type="string" required="true">
        <cfargument name="orderDir" type="string" required="true">
        <cfargument name="totalRecords" type="any" required="true">
        <cfargument name="tag_id" type="numeric" required="true">
        <cfquery name="qryTags" datasource="#application.datasource#">
        select tags.tag_id,tags.slug from tags
        <cfif searchValue neq "">
                AND (tags.name LIKE '%#searchValue#%')
        </cfif>
            ORDER BY #orderColumn# #orderDir#
            LIMIT #start#, #length#
        </cfquery>
        <cfreturn qryTags>
</cffunction>

<cffunction  name="saveTags" access="public" returnType="struct">
    <cfargument  name="TagData" type="any" required="true">
    <cfset result={success:false, message=""}>
    <cfif structKeyExists(TagData, "tags") and arrayLen(TagData.tags) NEQ "">
        <cfloop array="#TagData.tags#" index="tag">
        <cfquery name="checkSlug" datasource="#application.datasource#">
            select slug from tags where
            slug=<cfqueryparam value="#tag#" cfsqltype="cf_sql_varchar">
        </cfquery>
        <cfif checkSlug.recordCount GT 0>
            <cfset result.message="Tag is already used.Please use another">
            <cfreturn result>
        </cfif>
        <cfquery name="qryTags" datasource="#application.datasource#">
            insert into tags(slug) values(
                <cfqueryparam value="#tag#" cfsqltype="cf_sql_varchar">
            )
        </cfquery>
        </cfloop>
        <cfset result.message="Tags added successfully">
        <cfset result.success=true>
        <cfelse>
            <cfset result.message="">
    </cfif>
    <cfreturn result>
</cffunction>
</cfcomponent>