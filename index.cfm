<cfif structKeyExists(URL, "page")>
    <cfset variables.route = url.page>
<cfelse>
    <cfset variables.route = "login">
</cfif>

<!--- Define route access rules for each role --->
<cfset variables.publicRoutes = [
    "login", "register", "complete-registration", "set-password", "errors"
]>
<cfset variables.adminRoutes = [
    "dashboard", "users-all", "user-create", "edit-user", "tag-all", "category-all", "content-all", "content-pending", "content-create", "content-edit", "content", "full-content"
]>
<cfset variables.contributorRoutes = [
    "dashboard", "content-all", "content-pending", "content-create", "content-edit", "content", "full-content"
]>
<cfset variables.userRoutes = [
    "dashboard", "content", "full-content"
]>

<cfif !structKeyExists(session, "user")>
    <cfif !arrayFindNoCase(variables.publicRoutes, variables.route)>
        <cfset variables.route = "login">
    </cfif>
<cfelse>
    <cfset variables.userRole = lcase(session.user.role)>
    <cfif variables.userRole EQ "admin">
        <cfif !arrayFindNoCase(variables.adminRoutes, variables.route) && !arrayFindNoCase(variables.publicRoutes, variables.route)>
            <cfset variables.route = "errors">
        </cfif>
    <cfelseif variables.userRole EQ "contributor">
        <cfif !arrayFindNoCase(variables.contributorRoutes, variables.route) && !arrayFindNoCase(variables.publicRoutes, variables.route)>
            <cfset variables.route = "errors">
        </cfif>
    <cfelseif variables.userRole EQ "user">
        <cfif !arrayFindNoCase(variables.userRoutes, variables.route) && !arrayFindNoCase(variables.publicRoutes, variables.route)>
            <cfset variables.route = "errors">
        </cfif>
    <cfelse>
        <cfset variables.route = "errors">
    </cfif>
</cfif>

<cfset variables.title = "">

<cfswitch expression="#variables.route#"> 
    <cfcase value="dashboard">
        <cfset variables.title = "Dashboard">
        <cfinclude template="views/dashboard/dashboard.cfm">
        <cfinclude  template="controllers/DashboardController.cfm">
    </cfcase>
    <cfcase value="users-all">
        <cfset variables.title = "All Users">
        <cfinclude template="views/users/list.cfm">
    </cfcase>
    <cfcase value="user-create">
        <cfset variables.title = "Create User">
        <cfinclude template="controllers/AdminUserController.cfm">
        <cfinclude template="views/users/form.cfm">
    </cfcase>
    <cfcase value="edit-user">
        <cfset variables.title = "Update User">
        <cfset url.method = "edit-user">
        <cfinclude template="controllers/AdminUserController.cfm">
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
        <cfinclude template="controllers/AuthController.cfm">
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