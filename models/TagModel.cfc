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
                where tags.slug LIKE <cfqueryparam value= "%#searchValue#%" cfsqltype="cf_sql_varchar">
        </cfif>
            ORDER BY #orderColumn# #orderDir#
            LIMIT #start#, #length#
        </cfquery>
        <cfreturn qryTags>
</cffunction>

<cffunction  name="getTagById" access="public" returnType="query">
        <cfargument  name="id" type="numeric" required="true">
        <cfquery name="qryTag" datasource="#application.datasource#">
            select * from tags where 
            tag_id=<cfqueryparam value="#id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn qryTag>
</cffunction>

<cffunction  name="saveTags" access="public" returnType="struct">
    <cfargument  name="TagData" type="any" required="true">
    <cfset result={success:false, message=""}>
    <cfif structKeyExists(TagData, "tagId")and len(trim(TagData.tagId))>
            <cfset TagData.tags = ( structKeyExists(form, "tags") AND isSimpleValue(form.tags) AND len(trim(form.tags))) 
                            ? listFirst(form.tags) : ""> 
<!---      <cfdump  var="#TagData.tags#" abort> --->
            <cfquery name="qryTags" datasource="#application.datasource#">
                UPDATE tags SET
                slug=<cfqueryparam value="#TagData.tags#" cfsqltype="cf_sql_varchar">
                WHERE tag_id = <cfqueryparam value="#TagData.tagId#" cfsqltype="cf_sql_integer">
            </cfquery>
            <cfset result.message = "Tag updated successfully">
            <cfset result.success = true>
    <cfelse>
        <cfif structKeyExists(TagData, "tags")>
            <cfif NOT isArray(TagData.tags)>
                <cfif len(trim(TagData.tags))>
                <cfset TagData.tags = listToArray(TagData.tags, ",")>
                <cfelse>
                    <cfset result.message="No tags provided">
                    <cfset result.success=true>
                    <cfreturn result>
                </cfif>
            </cfif>
            <cfif arraylen(TagData.tags)>
                <cfset TagData.slug = arrayToList(TagData.tags, ",")>
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
                <cfset result.message="No valid tag to add">
            </cfif>
        <cfelse>
            <cfset result.message="">
        </cfif>
    </cfif>
    <cfreturn result>
</cffunction>

<cffunction  name="deleteTag">
        <cfargument name="tag_id" type="numeric" required="true">
        <cfset var result = { "success" = false, "message" = "" }>
        <cftry>
            <cfquery name="qryDelete" datasource="#application.datasource#">
                DELETE FROM tags
                WHERE tag_id = <cfqueryparam value="#arguments.tag_id#" cfsqltype="cf_sql_integer">
            </cfquery>
                <cfset result.success = true>
                <cfset result.message = "tag deleted successfully.">
            <cfcatch>
                <cfset result.message = "Error deleting tag: #cfcatch.message#">
            </cfcatch>
        </cftry>
        <cfoutput>#serializeJSON(result)#</cfoutput>
</cffunction>
</cfcomponent>