<cfcomponent displayname="UserModel">
    <cffunction name="saveUser" access="public" returntype="struct">
        <cfargument name="userData" type="struct" required="true">
        <cfset var result = {}>
        <cfquery name="qryUser" datasource="#application.datasource#">
            INSERT INTO users (
                first_name, 
                last_name, 
                email, 
                role_id, 
                access_level_id, 
                registration_token, 
                token_expiry, 
                is_registered
            ) VALUES (
                <cfqueryparam value="#userData.firstName#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#userData.lastName#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#userData.email#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#userData.role#" cfsqltype="cf_sql_integer">,
                <cfqueryparam value="#userData.accessLevel#" cfsqltype="cf_sql_integer">,
                <cfqueryparam value="#userData.registration_token#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#userData.token_expiry#" cfsqltype="cf_sql_timestamp">,
                <cfqueryparam value="#userData.is_registered#" cfsqltype="cf_sql_bit">
            )
        </cfquery>
        <cfquery name="qryGetId" datasource="#application.datasource#">
            SELECT LAST_INSERT_ID() AS user_id
        </cfquery>
        <cfset result.user_id = qryGetId.user_id>
        <cfset result.message = "User saved successfully">
        <cfset result.success = true>
        <cfreturn result>
    </cffunction>

    <cffunction name="getUserByToken" access="public" returntype="query">
        <cfargument name="token" type="string" required="true">
        <cfquery name="qryUser" datasource="#application.datasource#">
            SELECT * FROM users WHERE registration_token = <cfqueryparam value="#token#" cfsqltype="cf_sql_varchar">
        </cfquery>
        <cfreturn qryUser>
    </cffunction>

    <cffunction name="setPassword" access="public" returntype="struct">
        <cfargument name="userData" type="struct" required="true">
        <cfquery name="qryUser" datasource="#application.datasource#">
            UPDATE users SET password = <cfqueryparam value="#userData.password#" cfsqltype="cf_sql_varchar">, is_registered = 1 
                WHERE registration_token = <cfqueryparam value="#userData.registration_token#" cfsqltype="cf_sql_varchar">
        </cfquery>
        <cfset var result = {}>
        <cfset result.success = true>
        <cfset result.message = "Password updated successfully.">
        <cfreturn result>
    </cffunction>
</cfcomponent>