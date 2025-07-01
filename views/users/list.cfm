<cfinclude  template="../shared/head.cfm">
  <body>
    <cfinclude  template="../shared/nav.cfm">

    <div class="wrapper d-flex flex-column min-vh-100">
      <cfinclude  template="../shared/header.cfm">
      <cfoutput>
      <div class="body flex-grow-1">
        <div class="container-lg px-4">

            <div class="">
                
                <div class="tab-content rounded-bottom">
                  <div class="tab-pane p-3 active preview" role="tabpanel" id="preview-1007">
                    <div class="mb-3 d-flex justify-content-end align-items-center gap-3">
                        <div class="d-flex align-items-center">
                            <label for="list_status" class="form-label mb-0 me-2">Registration Status:</label>
                            <select id="list_status" class="form-select w-auto" style="min-width: 180px;">
                                <option value="all" selected>All</option>
                                <option value="pending">Pending</option>
                                <option value="completed">Completed</option>
                                <option value="rejected">Rejected</option>
                            </select>
                        </div>
                        <a href="#application.baseURL#?page=user-create" class="btn btn-primary">
                            <i class="icon cil-plus"></i> Add User
                        </a>
                    </div>
                    <table id="usersTable" class="display table table-striped table-hover">
                      <thead>
                        <tr>
                          <th scope="col">##</th>
                          <th scope="col">First</th>
                          <th scope="col">Last</th>
                          <th scope="col">Email</th>
                          <th scope="col">Role</th>
                          <th scope="col">Access Level</th>
                          <th scope="col">Registration Status</th>
                          <th scope="col">Action</th>
                        </tr>
                      </thead>
                      <tbody></tbody>
                    </table>
                  </div>
                </div>
            </div>

        </div>
      </div>
      </cfoutput>
      <cfinclude  template="../shared/modal.cfm">
      <cfinclude  template="../shared/toast.cfm">
      <cfinclude  template="../shared/footer.cfm">
    </div>
    <cfinclude  template="../shared/scripts.cfm">
    <script src="assets/js/adminUser.js"></script> 
  </body>
</html>