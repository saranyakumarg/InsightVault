<cfoutput>
<!---                                         <cfdump  var="#variables.etags#" > --->
<!---                                         <cfdump  var="#variables.tags#" abort="true"> --->
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
                            <cfinput type="hidden" id="id" name="id" value="#url.id#">
                        </cfif>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="title" class="form-label">Title</label>
                                <cfinput type="text" class="form-control" id="title" name="title" value="#variables.etitle#" >
                            </div>
                            <div class="col-md-6">
                                <label for="slug" class="form-label">Slug</label>
                                <cfinput type="text" class="form-control" id="slug" name="slug" value="#variables.eslug#" readonly="true">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="category" class="form-label">Category</label>
                                <cfselect name="category" class="form-select" >
                                    <option value="" disabled selected>Select Categories</option>
                                    <cfloop query="variables.categories">
                                        <option value="#variables.categories.category_id#" <cfif variables.ecategory EQ variables.categories.category_id> selected</cfif>>#variables.categories.name#</option>
                                    </cfloop>
                                </cfselect>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="accessLevel" class="form-label">Access Level</label>
                                <cfselect name="accessLevel" class="form-select" multiple="true">
                                    <cfloop query="variables.accessLevels">
                                        <cfif isQuery(variables.eaccess_levels)>
                                            <option value="#variables.accessLevels.access_level_id#" <cfif variables.eaccess_levels.recordCount GT 0 AND variables.eaccess_levels.access_level_id CONTAINS variables.accessLevels.access_level_id>selected</cfif>>#variables.accessLevels.name#</option>
                                        <cfelse>
                                            <option value="#variables.accessLevels.access_level_id#" <cfif variables.eaccess_levels EQ variables.accessLevels.access_level_id>selected</cfif>>#variables.accessLevels.name#</option>
                                        </cfif>
                                    </cfloop>
                                </cfselect>
                            </div>
                            <div class="col-md-6">
                                <label for="tags" class="form-label">Tags</label>
                                <cfselect name="tags" class="form-select" multiple="true">
                                    <cfloop query="variables.tags">
                                        <option value="#variables.tags.tag_id#"
                                            <cfif structKeyExists(variables.selectedTagIds, variables.tags.tag_id)>selected</cfif>>
                                            #encodeForHTML(variables.tags.slug)#
                                        </option>
                                    </cfloop>
                                </cfselect>

                                
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="content" class="form-label">Content</label>
                            <cftextarea class="form-control" value="#variables.econtent#" id="content" name="content" style="height: 120px;"></cftextarea>
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
    <script src="https://cdn.ckeditor.com/ckeditor5/40.1.0/classic/ckeditor.js"></script>
    <script src="assets/js/content.js"></script>
  </body>
</html>
</cfoutput>