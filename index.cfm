<cfif structKeyExists(URL, "page")>
    <cfset route = url.page>
<cfelse>
    <cfset route = "login">
</cfif>


<cfswitch expression="#route#"> 
    <cfcase value="admin-dashboard">
        <cfinclude template="views/dashboard/adminDashboard.cfm">
    </cfcase>
    <cfcase value="login">
        <cfinclude template="views/auth/login.cfm">
    </cfcase>
    <cfcase value="register">
        <cfinclude template="views/auth/register.cfm">
    </cfcase>
    <cfdefaultcase>
        <cfinclude template="views/dashboard/login.cfm">
    </cfdefaultcase>
</cfswitch>