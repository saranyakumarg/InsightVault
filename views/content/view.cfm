<cfinclude  template="../shared/head.cfm">
  <body>
    <cfinclude  template="../shared/nav.cfm">

    <div class="wrapper d-flex flex-column min-vh-100">
      <cfinclude  template="../shared/header.cfm">

      <div class="body flex-grow-1">
        <div class="container-lg px-4">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h6 class="card-title mb-0">Content Details</h6>
                    <div>
                        <a href="?page=content-all" class="btn btn-secondary btn-sm">
                            <i class="icon cil-arrow-left"></i> Back to List
                        </a>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row mb-4">
                        <div class="col-md-6">
                            <h4 class="mb-3">Getting Started with ColdFusion</h4>
                            <div class="mb-3">
                                <label class="text-muted">Author</label>
                                <p class="mb-0">John Smith</p>
                            </div>
                            <div class="mb-3">
                                <label class="text-muted">Category</label>
                                <p class="mb-0">Tutorials</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="text-muted">Publish Date</label>
                                <p class="mb-0">2024-03-15</p>
                            </div>
                            <div class="mb-3">
                                <label class="text-muted">Status</label>
                                <p class="mb-0"><span class="badge bg-success">Published</span></p>
                            </div>
                            <div class="mb-3">
                                <label class="text-muted">Access Level</label>
                                <p class="mb-0">
                                    <span class="badge bg-info me-1">All employees</span>
                                    <span class="badge bg-info me-1">Developer</span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="mb-4">
                        <label class="text-muted">Tags</label>
                        <div>
                            <span class="badge bg-secondary me-1">ColdFusion</span>
                            <span class="badge bg-secondary me-1">Development</span>
                            <span class="badge bg-secondary me-1">Tutorial</span>
                        </div>
                    </div>
                    <div class="mb-4">
                        <label class="text-muted">Content</label>
                        <div class="border rounded p-3 ">
                            <div id="content-viewer">
                                <h2>Introduction to ColdFusion</h2>
                                <p>ColdFusion is a powerful web application development platform that allows developers to create dynamic websites and applications quickly and efficiently.</p>
                                
                                <h3>Key Features</h3>
                                <ul>
                                    <li>Rapid Application Development</li>
                                    <li>Built-in Security Features</li>
                                    <li>Database Integration</li>
                                    <li>Cross-platform Compatibility</li>
                                </ul>

                                <h3>Getting Started</h3>
                                <p>To begin working with ColdFusion, you'll need to:</p>
                                <ol>
                                    <li>Install ColdFusion Server</li>
                                    <li>Set up your development environment</li>
                                    <li>Create your first application</li>
                                </ol>

                                <blockquote class="border-start border-primary ps-3">
                                    <p class="mb-0">ColdFusion makes web development faster and more efficient than ever before.</p>
                                </blockquote>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex justify-content-end gap-2">
                        <a href="?page=content-edit" class="btn btn-primary">
                            Edit Content <i class="icon cil-arrow-right"></i>
                        </a>
                    </div>
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