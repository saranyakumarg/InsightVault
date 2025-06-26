<cfcomponent displayname="UserModel">

    <cffunction name="emailExists" access="public" returntype="boolean">
        <cfargument name="email" type="string" required="true">
        <cfquery name="qryEmail" datasource="#application.datasource#">
            SELECT COUNT(*) as count FROM users WHERE email = <cfqueryparam value="#email#" cfsqltype="cf_sql_varchar">
        </cfquery>
        <cfreturn qryEmail.count GT 0>
    </cffunction>

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

    <cffunction name="authenticate" access="public" returntype="query">
        <cfargument name="username" type="string" required="true">
        <cfargument name="password" type="string" required="true">
        <cfquery name="qryUser" datasource="#application.datasource#">
            SELECT 
                users.user_id, 
                users.first_name, 
                users.last_name, 
                users.email,
                users.is_registered, 
                roles.name as role, 
                roles.role_id as role_id, 
                access_levels.access_level_id as access_level_id,
                access_levels.name as access_level
            FROM users
            LEFT JOIN roles ON users.role_id = roles.role_id
            LEFT JOIN access_levels ON users.access_level_id = access_levels.access_level_id
            WHERE users.email = <cfqueryparam value="#username#" cfsqltype="cf_sql_varchar">
            AND users.password = <cfqueryparam value="#password#" cfsqltype="cf_sql_varchar">
        </cfquery>
        <cfreturn qryUser>
    </cffunction>

    <cffunction name="getTotalUserCount" access="public" returntype="numeric">
        <cfargument name="user_id" type="numeric" required="true">
        <cfargument name="type" type="string" required="true">
        <cfquery name="qryUser" datasource="#application.datasource#">
            SELECT COUNT(*) as total FROM users
            WHERE user_id != <cfqueryparam value="#user_id#" cfsqltype="cf_sql_integer"> 
            <cfif type eq "pending">
                AND is_registered = 0
            <cfelseif type eq "completed">
                AND is_registered = 1
            </cfif>
        </cfquery>
        <cfreturn qryUser.total>
    </cffunction>

    <cffunction name="getFilteredUserCount" access="public" returntype="numeric">
        <cfargument name="searchValue" type="string" required="true">
        <cfargument name="user_id" type="numeric" required="true">
        <cfargument name="type" type="string" required="true">
        <cfquery name="qryUser" datasource="#application.datasource#">
            SELECT COUNT(*) as total FROM users 
            WHERE user_id != <cfqueryparam value="#user_id#" cfsqltype="cf_sql_integer">
            <cfif type eq "pending">
                AND is_registered = 0
            <cfelseif type eq "completed">
                AND is_registered = 1
            </cfif>
            AND (first_name LIKE '%#searchValue#%' OR last_name LIKE '%#searchValue#%' OR email LIKE '%#searchValue#%')
        </cfquery>
        <cfreturn qryUser.total>
    </cffunction>

    <cffunction name="getUsers" access="public" returntype="query">
        <cfargument name="draw" type="numeric" required="true">
        <cfargument name="start" type="numeric" required="true">    
        <cfargument name="length" type="numeric" required="true">
        <cfargument name="searchValue" type="string" required="true">
        <cfargument name="orderColumn" type="string" required="true">
        <cfargument name="orderDir" type="string" required="true">
        <cfargument name="totalRecords" type="numeric" required="true">
        <cfargument name="filteredRecords" type="numeric" required="true">
        <cfargument name="user_id" type="numeric" required="true">
        <cfargument name="type" type="string" required="true">
        <cfquery name="qryUser" datasource="#application.datasource#">
            SELECT
                users.user_id,
                users.first_name,
                users.last_name,
                users.email,
                roles.name as role,
                access_levels.name as access_level,
                users.is_registered
            FROM users
            LEFT JOIN roles ON users.role_id = roles.role_id
            LEFT JOIN access_levels ON users.access_level_id = access_levels.access_level_id
            WHERE users.user_id != <cfqueryparam value="#user_id#" cfsqltype="cf_sql_integer">
            <cfif type eq "pending">
                AND users.is_registered = 0
            <cfelseif type eq "completed">
                AND users.is_registered = 1
            </cfif>
            <cfif searchValue neq "">
                AND (users.first_name LIKE '%#searchValue#%' OR users.last_name LIKE '%#searchValue#%' OR users.email LIKE '%#searchValue#%')
            </cfif>
            ORDER BY #orderColumn# #orderDir#
            LIMIT #start#, #length#
        </cfquery>
        <cfreturn qryUser>
    </cffunction>
</cfcomponent>