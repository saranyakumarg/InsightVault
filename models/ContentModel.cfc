<cfcomponent displayname="ContentModel" output="false">
    <cffunction  name="saveContent" access="public" returntype="struct">
        <cfargument name="contentData" type="struct" required="true">
<!---         <cfif structKeyExists(contentData, "contentId") AND len(userData.contentId)> --->
<!---         <cfelse> --->
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
<!---         </cfif> --->
        <cfset result.content_id = structKeyExists(contentData, "contentId") ? contentData.contentId : qryGetId.content_id>
        <cfset result.message = "Content saved successfully">
        <cfset result.success = true>
        <cfreturn result>
    </cffunction>

    <cffunction  name="updateContent" access="public" returntype="struct">
        <cfargument name="contentData" type="struct" required="true">
        <cfset var result = structNew()>
        <cfset var contentId = contentData.id>
        <!--- Update the main content record --->
        <cfquery datasource="#application.datasource#">
            UPDATE contents
            SET
                title = <cfqueryparam value="#contentData.title#" cfsqltype="cf_sql_varchar">,
                slug = <cfqueryparam value="#contentData.slug#" cfsqltype="cf_sql_varchar">,
                category_id = <cfqueryparam value="#contentData.category_id#" cfsqltype="cf_sql_integer">,
                content = <cfqueryparam value="#contentData.content#" cfsqltype="cf_sql_longvarchar">,
                status = <cfqueryparam value="#contentData.status#" cfsqltype="cf_sql_varchar">,
                updated_at = <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp">
            WHERE content_id = <cfqueryparam value="#contentId#" cfsqltype="cf_sql_integer">
        </cfquery>

        <!--- Update tags --->
        <cfif structKeyExists(contentData, "tags")>
            <!--- Remove current tags --->
            <cfquery datasource="#application.datasource#">
                DELETE FROM content_tags WHERE content_id = <cfqueryparam value="#contentId#" cfsqltype="cf_sql_integer">
            </cfquery>
            <!--- Insert the new tags --->
            <cfif len(trim(contentData.tags))>
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
        </cfif>

        <!--- Update access levels --->
        <cfif structKeyExists(contentData, "access_levels")>
            <!--- Remove current access levels --->
            <cfquery datasource="#application.datasource#">
                DELETE FROM content_levels WHERE content_id = <cfqueryparam value="#contentId#" cfsqltype="cf_sql_integer">
            </cfquery>
            <!--- Insert the new access levels --->
            <cfif len(trim(contentData.access_levels))>
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

        <cfset result.content_id = contentId>
        <cfset result.message = "Content updated successfully">
        <cfset result.success = true>
        <cfreturn result>
    </cffunction>

    <cffunction name="getContentById" access="public" returntype="struct">
        <cfargument name="id" type="numeric" required="true">
        <cfset var result = structNew()>

        <!--- Get main content --->
        <cfquery name="qryContent" datasource="#application.datasource#">
            SELECT * FROM contents WHERE content_id = <cfqueryparam value="#id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfif qryContent.recordCount EQ 0>
            <cfset result.success = false>
            <cfset result.message = "Content not found">
            <cfreturn result>
        </cfif>

        <!--- Get tags for this content --->
        <cfquery name="qryTags" datasource="#application.datasource#">
            SELECT t.tag_id, t.slug
            FROM content_tags ct
            INNER JOIN tags t ON ct.tag_id = t.tag_id
            WHERE ct.content_id = <cfqueryparam value="#id#" cfsqltype="cf_sql_integer">
        </cfquery>

        <!--- Get access levels for this content --->
        <cfquery name="qryAccessLevels" datasource="#application.datasource#">
            SELECT al.access_level_id, al.name
            FROM content_levels cl
            INNER JOIN access_levels al ON cl.access_level_id = al.access_level_id
            WHERE cl.content_id = <cfqueryparam value="#id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfset result.content = qryContent>
        <cfset result.tags = qryTags>
        <cfset result.accessLevels = qryAccessLevels>
        <cfreturn result>
    </cffunction>
</cfcomponent>