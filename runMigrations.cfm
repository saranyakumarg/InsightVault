<cfset migrationFolder = expandPath("./migrations/")>

<!--- Get a list of all SQL files in the migrations folder --->
<cfdirectory action="list" directory="#migrationFolder#" name="fileList" filter="*.sql">

<cfloop query="fileList">
    <cfset sqlFilePath = migrationFolder & fileList.name>
    <cffile action="read" file="#sqlFilePath#" variable="sqlContent">

    <cftry>
        <cfquery datasource="#application.datasource#">
            #preserveSingleQuotes(sqlContent)#
        </cfquery>
        <cfoutput>Successfully ran migration: #fileList.name#<br></cfoutput>
        <cfcatch>
            <cfoutput>Error running #fileList.name#: #cfcatch.message#<br></cfoutput>
        </cfcatch>
    </cftry>
</cfloop>
