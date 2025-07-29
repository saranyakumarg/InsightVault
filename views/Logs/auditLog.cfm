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
                    </div>
                   <table id="LogsTable" class="display table table-striped table-hover">
                      <thead>
                        <tr>
                          <th scope="col">##</th>
                          <th scope="col">user_id</th>
                          <th scope="col">role_id</th>
                          <th scope="col">action</th>
                          <th scope="col">entity_type</th>
                          <th scope="col">access_level_id</th>
                          <th scope="col">details</th>
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
    <script src="assets/js/logs.js"></script>
    <script>
        $(document).ready(function(){
            viewLog();
        })
    </script>
  </body>
</html>