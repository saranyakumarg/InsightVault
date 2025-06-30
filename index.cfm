<cfif structKeyExists(URL, "page")>
    <cfset variables.route = url.page>
<cfelse>
    <cfset variables.route = "login">
</cfif>

<cfif structKeyExists(session, "user")>
    <cfset variables.route = variables.route>
<cfelse>        
    <cfset variables.route = "login">
</cfif>
<cfset variables.title = "">

<cfswitch expression="#variables.route#"> 
    <cfcase value="dashboard">
        <cfset variables.title = "Dashboard">
        <cfinclude template="views/dashboard/dashboard.cfm">
    </cfcase>
    <cfcase value="users-all">
        <cfset variables.title = "All Users">
        <cfinclude template="views/users/list.cfm">
    </cfcase>
    <cfcase value="user-create">
        <cfset variables.title = "Create User">
        <cfinclude template="controllers/AdminController.cfm">
        <cfinclude template="views/users/form.cfm">
    </cfcase>
    <cfcase value="user-update">
        <cfset variables.title = "Update User">
        <cfset url.method = "user-update">
        <cfinclude template="controllers/AdminController.cfm">
        <cfinclude template="views/users/form.cfm">
    </cfcase>
    <cfcase value="content-all">
        <cfset variables.title = "All Contents">
        <cfinclude template="views/content/list.cfm">
    </cfcase>
    <cfcase value="content-pending">
        <cfset variables.title = "Pending Contents">
        <cfinclude template="views/content/list.cfm">
    </cfcase>
    <cfcase value="content-create">
        <cfset variables.title = "Create Content">
        <cfinclude template="views/content/form.cfm">
    </cfcase>
    <cfcase value="content-edit">
        <cfset variables.title = "Edit Content">
        <cfinclude template="views/content/form.cfm">
    </cfcase>
    <cfcase value="content">
        <cfset variables.title = "View Content">
        <cfinclude template="views/content/view.cfm">
    </cfcase>
    <cfcase value="tag-all">
        <cfset variables.title = "All Tags">
        <cfinclude template="views/tags/list.cfm">
    </cfcase>
    <cfcase  value="category-all">
        <cfset variables.title = "All Categories">
        <cfinclude template="views/categories/list.cfm">
    </cfcase>
    <cfcase value="full-content">
        <cfinclude template="views/content/content.cfm">
    </cfcase>
    <cfcase value="login">
        <cfinclude template="views/auth/login.cfm">
    </cfcase>
    <cfcase value="register">
        <cfinclude template="views/auth/register.cfm">
    </cfcase>
    <cfcase value="complete-registration">
        <cfset url.method = "complete-registration">
        <cfinclude template="controllers/AdminController.cfm">
    </cfcase>
    <cfcase value="set-password">
        <cfinclude template="views/auth/setPassword.cfm">
    </cfcase>
    <cfcase value="errors">
        <cfinclude template="views/errors/error.cfm">
    </cfcase>
    <cfdefaultcase>
        <cfinclude template="views/auth/login.cfm">
    </cfdefaultcase>
</cfswitch>