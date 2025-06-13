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
                    <cfform action="#application.baseURL#?page=user-save" method="post" id="userForm">
                        <cfif structKeyExists(url, "id")>
                            <cfinput type="hidden" name="id" value="#url.id#">
                        </cfif>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="firstName" class="form-label">First Name</label>
                                <cfinput type="text" class="form-control" id="firstName" name="firstName" required="true">
                            </div>
                            <div class="col-md-6">
                                <label for="lastName" class="form-label">Last Name</label>
                                <cfinput type="text" class="form-control" id="lastName" name="lastName" required="true">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="email" class="form-label">Email</label>
                                <cfinput type="email" class="form-control" id="email" name="email" required="true">
                            </div>
                            <div class="col-md-6">
                                <label for="role" class="form-label">Role</label>
                                <cfselect name="role" class="form-select" required="true">
                                    <option value="">Select Role</option>
                                    <option value="admin">Admin</option>
                                    <option value="contributor">Contributor</option>
                                    <option value="user">User</option>
                                </cfselect>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="accessLevel" class="form-label">Access Level</label>
                                <cfselect name="accessLevel" class="form-select" required="true">
                                    <option value="">Select Access Level</option>
                                    <option value="developer">Developer</option>
                                    <option value="qa">QA</option>
                                    <option value="manager">Manager</option>
                                    <option value="finance">Finance</option>
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
    </div>
    <cfinclude  template="../shared/scripts.cfm">
  </body>
</html>