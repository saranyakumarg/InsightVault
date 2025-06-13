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
                    <div class="text-end mb-3">
                        <a href="#application.baseURL#?page=user-create" class="btn btn-primary">
                            <i class="icon cil-plus"></i> Add User
                        </a>
                    </div>
                    <table class="table table-striped table-hover">
                      <thead>
                        <tr>
                          <th scope="col">##</th>
                          <th scope="col">First</th>
                          <th scope="col">Last</th>
                          <th scope="col">Role</th>
                          <th scope="col">Access Level</th>
                          <th scope="col">Action</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <th scope="row">1</th>
                          <td>Mark</td>
                          <td>Otto</td>
                          <td>Admin</td>
                          <td>CEO</td>
                          <td>
                            <i class="icon cil-pencil"></i>
                            <i class="icon cil-trash" data-coreui-toggle="modal" data-coreui-target="##staticBackdrop"></i>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row">2</th>
                          <td>Jacob</td>
                          <td>Thornton</td>
                          <td>Contibuter</td>
                          <td>Manager</td>
                          <td>
                            <i class="icon cil-pencil"></i>
                            <i class="icon cil-trash"></i>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row">3</th>
                          <td >Larry</td>
                          <td>Thornton</td>
                          <td>User</td>
                          <td>Developer</td>
                          <td>
                            <i class="icon cil-pencil"></i>
                            <i class="icon cil-trash"></i>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row">4</th>
                          <td >Sam</td>
                          <td>Jacob</td>
                          <td>User</td>
                          <td>QA</td>
                          <td>
                            <i class="icon cil-pencil"></i>
                            <i class="icon cil-trash"></i>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row">5</th>
                          <td >Linda </td>
                          <td>Harry</td>
                          <td>User</td>
                          <td>Developer</td>
                          <td>
                            <i class="icon cil-pencil"></i>
                            <i class="icon cil-trash"></i>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row">6</th>
                          <td >Dan</td>
                          <td>Lopez</td>
                          <td>User</td>
                          <td>HR</td>
                          <td>
                            <i class="icon cil-pencil"></i>
                            <i class="icon cil-trash"></i>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row">7</th>
                          <td >Tom</td>
                          <td>Hilton</td>
                          <td>User</td>
                          <td>Developer</td>
                          <td>
                            <i class="icon cil-pencil"></i>
                            <i class="icon cil-trash"></i>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row">8</th>
                          <td >John</td>
                          <td>J</td>
                          <td>Contributer</td>
                          <td>Finance</td>
                          <td>
                            <i class="icon cil-pencil"></i>
                            <i class="icon cil-trash"></i>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row">9</th>
                          <td >Lena</td>
                          <td>Tom</td>
                          <td>User</td>
                          <td>QA</td>
                          <td>
                            <i class="icon cil-pencil"></i>
                            <i class="icon cil-trash"></i>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row">10</th>
                          <td >Ivan</td>
                          <td>Lopez</td>
                          <td>User</td>
                          <td>Developer</td>
                          <td>
                            <i class="icon cil-pencil"></i>
                            <i class="icon cil-trash"></i>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>

                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        <li class="page-item disabled">
                        <a class="page-link">Previous</a>
                        </li>
                        <li class="page-item"><a class="page-link" href="##">1</a></li>
                        <li class="page-item"><a class="page-link" href="##">2</a></li>
                        <li class="page-item"><a class="page-link" href="##">3</a></li>
                        <li class="page-item">
                        <a class="page-link" href="##">Next</a>
                        </li>
                    </ul>
                </nav>

            </div>

        </div>
      </div>
      </cfoutput>
      <cfinclude  template="../shared/modal.cfm">
      <cfinclude  template="../shared/toast.cfm">
      <cfinclude  template="../shared/footer.cfm">
    </div>
    <cfinclude  template="../shared/scripts.cfm">
  </body>
</html>