<cfcomponent displayname="AuditLogModel">

    <cffunction  name="getTotalLogsCount" access="public" returnType="numeric" >
    <cfquery name="getLogsCount" datasource="#application.datasource#">
        select count(*) as total from audit_log
    </cfquery>
    <cfreturn getLogsCount.total>
    </cffunction>

    <cffunction  name="getLogs" access="public" returnType="query">
        <cfargument  name="draw" type="numeric" required="true">
        <cfargument  name="start" type="numeric" required="true">
        <cfargument  name="length" type="numeric" required="true">
        <cfargument name="searchValue" type="string" required="true">
        <cfargument name="orderColumn" type="string" required="true">
        <cfargument name="orderDir" type="string" required="true">
        <cfargument name="totalRecords" type="any" required="true">
        <cfargument name="log_id" type="numeric" required="true">
        <cfquery name="qryLogs" datasource="#application.datasource#">
        select a.log_id,a.user_id,a.role_id,a.action,a.entity_type,a.access_level_id,a.details,u.first_name,u.last_name,r.name,ac.name from audit_log as a
        join users as u
        on a.user_id=u.user_id
        join roles as r
        on a.role_id=r.role_id
        join access_levels as ac 
        on a.access_level_id=ac.access_level_id
        <cfif searchValue neq "">
                where a.entity_type LIKE <cfqueryparam value= "%#searchValue#%" cfsqltype="cf_sql_varchar">
        </cfif>
            ORDER BY #orderColumn# #orderDir#
            LIMIT #start#, #length#
        </cfquery>
        <cfreturn qryLogs>
    </cffunction>

    <cffunction name="saveAuditLog" access="public" returntype="void">
        <cfargument name="auditData" type="struct" required="true">
        <cfquery datasource="#application.datasource#">
            INSERT INTO audit_log (user_id, role_id, action, entity_type, access_level_id, details, created_at) VALUES (
                <cfqueryparam value="#auditData.user_id#" cfsqltype="cf_sql_integer">,
                <cfqueryparam value="#auditData.role_id#" cfsqltype="cf_sql_integer">,
                <cfqueryparam value="#auditData.action#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#auditData.entity_type#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#auditData.access_level_id#" cfsqltype="cf_sql_integer">,
                <cfqueryparam value="#auditData.details#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp">
            )
        </cfquery>
    </cffunction>
</cfcomponent>