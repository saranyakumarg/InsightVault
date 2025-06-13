<cfif structKeyExists(URL, "page")>
    <cfset variables.route = url.page>
<cfelse>
    <cfset variables.route = "login">
</cfif>
<cfset variables.title = "">

<cfswitch expression="#variables.route#"> 
    <cfcase value="admin-dashboard">
        <cfset variables.title = "Dashboard">
        <cfinclude template="views/dashboard/adminDashboard.cfm">
    </cfcase>
    <cfcase value="users-all">
        <cfset variables.title = "All Users">
        <cfinclude template="views/users/list.cfm">
    </cfcase>
    <cfcase value="user-create">
        <cfset variables.title = "Create User">
        <cfinclude template="views/users/form.cfm">
    </cfcase>
    <cfcase value="content-all">
        <cfset variables.title = "All Contents">
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
    <cfcase value="login">
        <cfinclude template="views/auth/login.cfm">
    </cfcase>
    <cfcase value="register">
        <cfinclude template="views/auth/register.cfm">
    </cfcase>
    <cfdefaultcase>
        <cfinclude template="views/auth/login.cfm">
    </cfdefaultcase>
</cfswitch>