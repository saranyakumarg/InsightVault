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
                  <div class="tab-pane active preview" role="tabpanel" id="preview-1007">
                    <div class="text-end mb-3">
                        <button type="button" class="btn btn-primary" data-coreui-toggle="modal" data-coreui-target="##tagForm">
                            <i class="icon cil-plus"></i> Add Tag
                        </button>
                        <cfinclude  template="form.cfm">
                    </div>
                    <table class="table table-striped table-hover">
                      <thead>
                        <tr>
                          <th scope="col">##</th>
                          <th scope="col">Tag</th>
                          <th scope="col">Action</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <th scope="row">1</th>
                          <td>ColdFusion</td>
                          <td>
                            <i class="icon cil-pencil"></i>
                            <i class="icon cil-trash" data-coreui-toggle="modal" data-coreui-target="##staticBackdrop"></i>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row">2</th>
                          <td>JavaScript</td>
                          <td>
                            <i class="icon cil-pencil"></i>
                            <i class="icon cil-trash"></i>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row">3</th>
                          <td >HTML</td>
                          <td>
                            <i class="icon cil-pencil"></i>
                            <i class="icon cil-trash"></i>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row">4</th>
                          <td >CSS</td>
                          <td>
                            <i class="icon cil-pencil"></i>
                            <i class="icon cil-trash"></i>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row">5</th>
                          <td >SQL</td>
                          <td>
                            <i class="icon cil-pencil"></i>
                            <i class="icon cil-trash"></i>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row">6</th>
                          <td >API</td>
                          <td>
                            <i class="icon cil-pencil"></i>
                            <i class="icon cil-trash"></i>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row">7</th>
                          <td >PHP</td>
                          <td>
                            <i class="icon cil-pencil"></i>
                            <i class="icon cil-trash"></i>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row">8</th>
                          <td >Python</td>
                          <td>
                            <i class="icon cil-pencil"></i>
                            <i class="icon cil-trash"></i>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row">9</th>
                          <td >Java</td>
                          <td>
                            <i class="icon cil-pencil"></i>
                            <i class="icon cil-trash"></i>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row">10</th>
                          <td >C++</td>
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
    <script src="assets/js/tags.js"></script>
  </body>
</html>