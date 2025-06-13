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
                        <div class="text-end">
                            <a href="#application.baseURL#?page=content-create" class="btn btn-primary mb-3">
                                <i class="icon cil-plus"></i> Create Content
                            </a>
                        </div>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Title</th>
                                    <th>Author</th>
                                    <th>Category</th>
                                    <th>Publish Date</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Getting Started with ColdFusion</td>
                                    <td>John Smith</td>
                                    <td>Tutorials</td>
                                    <td>2024-03-15</td>
                                    <td><span class="badge bg-success">Published</span></td>
                                    <td>
                                        <a href="#application.baseURL#?page=content"><i class="icon cil-file" title="view"></i></a>
                                        <a href="#application.baseURL#?page=content-edit"><i class="icon cil-pencil" title="Edit"></i></a>
                                        <i class="icon cil-trash" data-coreui-toggle="modal" data-coreui-target="##staticBackdrop" title="Delete"></i>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Advanced Database Techniques</td>
                                    <td>Sarah Johnson</td>
                                    <td>Development</td>
                                    <td>2024-03-14</td>
                                    <td><span class="badge bg-warning">Draft</span></td>
                                    <td>
                                        <i class="icon cil-file" title="view"></i>
                                        <i class="icon cil-pencil" title="Edit"></i>
                                        <i class="icon cil-trash" data-coreui-toggle="modal" data-coreui-target="##staticBackdrop" title="Delete"></i>
                                        <i class="icon cil-check-circle text-success" title="Approve"></i>
                                        <i class="icon cil-x-circle text-danger" title="Reject"></i>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Security Best Practices</td>
                                    <td>Mike Wilson</td>
                                    <td>Security</td>
                                    <td>2024-03-10</td>
                                    <td><span class="badge bg-secondary">Archived</span></td>
                                    <td>
                                        <i class="icon cil-file" title="view"></i>
                                        <i class="icon cil-pencil" title="Edit"></i>
                                        <i class="icon cil-trash" data-coreui-toggle="modal" data-coreui-target="##staticBackdrop" title="Delete"></i>
                                    </td>
                                </tr>
                                <tr>
                                    <td>UI/UX Design Patterns</td>
                                    <td>Emily Brown</td>
                                    <td>Design</td>
                                    <td>2024-03-12</td>
                                    <td><span class="badge bg-success">Published</span></td>
                                    <td>
                                        <i class="icon cil-file" title="view"></i>
                                        <i class="icon cil-pencil" title="Edit"></i>
                                        <i class="icon cil-trash" data-coreui-toggle="modal" data-coreui-target="##staticBackdrop" title="Delete"></i>
                                    </td>
                                </tr>
                                <tr>
                                    <td>API Integration Guide</td>
                                    <td>David Lee</td>
                                    <td>Development</td>
                                    <td>2024-03-13</td>
                                    <td><span class="badge bg-warning">Draft</span></td>
                                    <td>
                                        <i class="icon cil-file" title="view"></i>
                                        <i class="icon cil-pencil" title="Edit"></i>
                                        <i class="icon cil-trash" data-coreui-toggle="modal" data-coreui-target="##staticBackdrop" title="Delete"></i>
                                        <i class="icon cil-check-circle text-success" title="Approve"></i>
                                        <i class="icon cil-x-circle text-danger" title="Reject"></i>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Cloud Migration Strategies</td>
                                    <td>Alex Turner</td>
                                    <td>DevOps</td>
                                    <td>2024-03-11</td>
                                    <td><span class="badge bg-success">Published</span></td>
                                    <td>
                                        <i class="icon cil-file" title="view"></i>
                                        <i class="icon cil-pencil" title="Edit"></i>
                                        <i class="icon cil-trash" data-coreui-toggle="modal" data-coreui-target="##staticBackdrop" title="Delete"></i>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Mobile App Development</td>
                                    <td>Lisa Chen</td>
                                    <td>Mobile</td>
                                    <td>2024-03-09</td>
                                    <td><span class="badge bg-secondary">Archived</span></td>
                                    <td>
                                        <i class="icon cil-file" title="view"></i>
                                        <i class="icon cil-pencil" title="Edit"></i>
                                        <i class="icon cil-trash" data-coreui-toggle="modal" data-coreui-target="##staticBackdrop" title
                                    </td>
                                </tr>
                                <tr>
                                    <td>Data Analytics Fundamentals</td>
                                    <td>Robert Kim</td>
                                    <td>Analytics</td>
                                    <td>2024-03-16</td>
                                    <td><span class="badge bg-warning">Draft</span></td>
                                    <td>
                                        <i class="icon cil-file" title="view"></i>
                                        <i class="icon cil-pencil" title="Edit"></i>
                                        <i class="icon cil-trash" title="Delete"></i>
                                        <i class="icon cil-check-circle text-success" title="Approve"></i>
                                        <i class="icon cil-x-circle text-danger" title="Reject"></i>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Machine Learning Basics</td>
                                    <td>Maria Garcia</td>
                                    <td>AI/ML</td>
                                    <td>2024-03-17</td>
                                    <td><span class="badge bg-success">Published</span></td>
                                    <td>
                                        <i class="icon cil-file" title="view"></i>
                                        <i class="icon cil-pencil" title="Edit"></i>
                                        <i class="icon cil-trash" title="Delete"></i>
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