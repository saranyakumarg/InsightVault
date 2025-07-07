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
                    <div class="mb-3 d-flex justify-content-end align-items-center gap-3">
                        <button type="button" class="btn btn-primary" data-coreui-toggle="modal" data-coreui-target="##categoryForm">
                            <i class="icon cil-plus"></i> Add Category
                        </button>
                        <cfinclude  template="form.cfm">
                    </div>
                    <table id="categoryTable" class="display table table-striped table-hover">
                      <thead>
                        <tr>
                          <th scope="col">##</th>
                          <th scope="col">name</th>
                          <th scope="col">slug</th>
                        </tr>
                      </thead>
                      <tbody>
                      </tbody>
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
    <script src="assets/js/category.js"></script>
  </body>
</html>