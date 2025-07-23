<cfcomponent displayname="ContentModel" output="false">
    <cffunction  name="saveContent" access="public" returntype="struct">
        <cfargument name="contentData" type="struct" required="true">
        <cfif structKeyExists(contentData, "contentId") AND len(userData.contentId)>
        <cfelse>
            <cfquery name="qryContent" datasource="#application.datasource#">
                INSERT INTO contents (
                    title,
                    slug,
                    content,
                    category_id,
                    author_id,
                    status,
                    publish_date,
                    modified_date
                ) VALUES (
                    <cfqueryparam value="#contentData.title#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#contentData.slug#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#contentData.content#" cfsqltype="cf_sql_longvarchar">,
                    <cfqueryparam value="#contentData.category_id#" cfsqltype="cf_sql_integer">,
                    <cfqueryparam value="#contentData.author_id#" cfsqltype="cf_sql_integer">,
                    <cfqueryparam value="#contentData.status#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp">,
                    <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp">
                )
            </cfquery>
            <cfquery name="qryGetId" datasource="#application.datasource#">
                SELECT LAST_INSERT_ID() AS content_id
            </cfquery>
            <!---    content_tags insert      --->
            <cfset var contentId = qryGetId.content_id>
            <cfif structKeyExists(contentData, "tags") AND len(trim(contentData.tags))>
                <cfset var tagIds = listToArray(contentData.tags, ",")>
                <cfset var valuesList = []>
                <cfloop array="#tagIds#" index="tagId">
                    <cfif len(trim(tagId))>
                        <cfset arrayAppend(valuesList, "(#contentId#, #trim(tagId)#)")>
                    </cfif>
                </cfloop>
                <cfif arrayLen(valuesList)>
                    <cfquery datasource="#application.datasource#">
                        INSERT IGNORE INTO content_tags (content_id, tag_id)
                        VALUES #arrayToList(valuesList, ",")#
                    </cfquery>
                </cfif>
            </cfif>
            <cfif structKeyExists(contentData, "access_levels") AND len(trim(contentData.access_levels))>
                <cfset var accessLevelIds = listToArray(contentData.access_levels, ",")>
                <cfset var accessValuesList = []>
                <cfloop array="#accessLevelIds#" index="accessLevelId">
                    <cfif len(trim(accessLevelId))>
                        <cfset arrayAppend(accessValuesList, "(#contentId#, #trim(accessLevelId)#)")>
                    </cfif>
                </cfloop>
                <cfif arrayLen(accessValuesList)>
                    <cfquery datasource="#application.datasource#">
                        INSERT IGNORE INTO content_levels (content_id, access_level_id)
                        VALUES #arrayToList(accessValuesList, ",")#
                    </cfquery>
                </cfif>
            </cfif>
        </cfif>
        <cfset result.content_id = structKeyExists(contentData, "contentId") ? contentData.contentId : qryGetId.content_id>
        <cfset result.message = "Content saved successfully">
        <cfset result.success = true>
        <cfreturn result>
    </cffunction>
</cfcomponent>