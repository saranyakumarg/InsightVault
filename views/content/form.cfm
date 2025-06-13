<cfinclude  template="../shared/head.cfm">
  <body>
    <cfinclude  template="../shared/nav.cfm">

    <div class="wrapper d-flex flex-column min-vh-100">
      <cfinclude  template="../shared/header.cfm">

      <div class="body flex-grow-1">
        <div class="container-lg px-4">
            <div class="card">
                <div class="card-header">
                    <h6 class="card-title">Content Form</h6>
                </div>
                <div class="card-body">
                    <cfform action="#application.baseURL#?page=content-save" method="post" id="contentForm">
                        <cfif structKeyExists(url, "id")>
                            <cfinput type="hidden" name="id" value="#url.id#">
                        </cfif>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="title" class="form-label">Title</label>
                                <cfinput type="text" class="form-control" id="title" name="title"  required="true">
                            </div>
                            <div class="col-md-6">
                                <label for="slug" class="form-label">Slug</label>
                                <cfinput type="text" class="form-control" id="slug" name="slug" readonly="true">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="category" class="form-label">Category</label>
                                <cfselect name="category" class="form-select" required="true">
                                    <option value="">Select Category</option>
                                    <option value="tutorials">Tutorials</option>
                                    <option value="development">Development</option>
                                    <option value="security">Security</option>
                                    <option value="design">Design</option>
                                </cfselect>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="accessLevel" class="form-label">Access Level</label>
                                <cfselect name="accessLevel" class="form-select" multiple="true" required="true">
                                        <option value="all">All employees</option>
                                        <option value="hr">HR</option>
                                        <option value="developer">Developer</option>
                                        <option value="qa">QA</option>
                                        <option value="manager">Manager</option>
                                </cfselect>
                            </div>
                            <div class="col-md-6">
                                <label for="tags" class="form-label">Tags</label>
                                <cfselect name="tags" class="form-select" multiple="true" required="true">
                                        <option value="coldfusion">ColdFusion</option>
                                        <option value="javascript">JavaScript</option>
                                        <option value="html">HTML</option>
                                        <option value="css">CSS</option>
                                        <option value="sql">SQL</option>
                                        <option value="api">API</option>
                                </cfselect>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="content" class="form-label">Content</label>
                            <cftextarea class="form-control" id="content" name="content" style="height: 120px;" required="true"></cftextarea>
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
    <script src="https://cdn.ckeditor.com/ckeditor5/40.1.0/classic/ckeditor.js"></script>
    <script src="assets/js/content.js"></script>
  </body>
</html>