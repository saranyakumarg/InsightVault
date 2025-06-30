<cfoutput>
<cfinclude  template="../shared/head.cfm">

  <body>
    <cfinclude  template="../shared/nav.cfm">

    <div class="wrapper d-flex flex-column min-vh-100">
     <cfinclude  template="../shared/header.cfm">
      
      <div class="body flex-grow-1">
        <div class="container-lg px-4">
            <div class="card">
                <div class="card-header">
                    <h6 class="card-title">User Form</h6>
                </div>
                <div class="card-body">
                    <cfform action="" method="post" id="userForm">
                        
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="firstName" class="form-label">First Name</label>
                                <cfinput type="text" class="form-control" id="firstName" name="firstName" >
                            </div>
                            <div class="col-md-6">
                                <label for="lastName" class="form-label">Last Name</label>
                                <cfinput type="text" class="form-control" id="lastName" name="lastName" >
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="email" class="form-label">Email</label>
                                <cfinput type="email" class="form-control" id="email" name="email" >
                            </div>
                            <div class="col-md-6">
                                <label for="role" class="form-label">Role</label>
                                <cfselect name="role" class="form-select" >
                                    <option value="" disabled selected>Select Role</option>
                                    <cfloop query="variables.roles">
                                        <option value="#variables.roles.role_id#">#variables.roles.name#</option>
                                    </cfloop>
                                </cfselect>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="accessLevel" class="form-label">Access Level</label>
                                <cfselect name="accessLevel" class="form-select" >
                                    <option value="" disabled selected>Select Access Level</option>
                                    <cfloop query="variables.accessLevels">
                                        <option value="#variables.accessLevels.access_level_id#">#variables.accessLevels.name#</option>
                                    </cfloop>
                                </cfselect>
                            </div>
                        </div>
                        <div class="d-flex justify-content-end gap-2">
                            <button type="button" class="btn btn-secondary">Cancel</button>
                            <button type="submit" class="btn btn-primary">Save</button>
                        </div>
                    </cfform>
                </div>
            </div>
        </div>
      </div>
     
      <cfinclude  template="../shared/footer.cfm">
      <cfinclude  template="../shared/toast.cfm">
    </div>
    <cfinclude  template="../shared/scripts.cfm">
    <script src="assets/js/adminUser.js"></script>
  </body>
</html>

</cfoutput>