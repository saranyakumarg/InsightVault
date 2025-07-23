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
                        <button type="button" class="btn btn-primary add-btn" data-coreui-toggle="modal" data-coreui-target="##tagForm">
                            <i class="icon cil-plus"></i> Add Tag
                        </button>
                        <cfinclude  template="form.cfm">
                    </div>
                   <table id="TagsTable" class="display table table-striped table-hover">
                      <thead>
                        <tr>
                          <th scope="col">##</th>
                          <th scope="col">Tag</th>
                          <th scope="col">Action</th>
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
    <script src="assets/js/tags.js"></script>
  </body>
</html>