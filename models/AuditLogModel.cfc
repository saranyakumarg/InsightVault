<cfcomponent displayname="AuditLogModel">
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