<cfif structKeyExists(url, "status_code")>
    <cfswitch expression="#url.status_code#">
        <cfcase value="1">
            <cfset errorMessage = "The link you used has expired. Please request a new link.">
        </cfcase>
        <cfcase value="2">
            <cfset errorMessage = "The link you used is invalid. Please request a new link.">
        </cfcase>
        <cfcase value="3">
            <cfset errorMessage = "You have already completed registration. Please login to continue.">
        </cfcase>
    </cfswitch>
</cfif>

<cfinclude  template="../shared/head.cfm">
<cfoutput>
  <div class="bg-body-tertiary min-vh-100 d-flex flex-row align-items-center">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-6">
            <div class="clearfix">
              <h4 class="pt-3">Oops!</h4>
              <p class="text-body-secondary">#errorMessage#</p>
            </div>
            <div class="mt-4">
                <a href="#application.baseURL#?page=login" class="btn btn-primary">Go to Login Page</a>
            </div>
          </div>
        </div>
      </div>
    </div>
    </cfoutput>
  <cfinclude  template="../shared/scripts.cfm">
  </body>
</html>
