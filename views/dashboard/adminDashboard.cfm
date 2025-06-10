<cfinclude  template="../shared/head.cfm">
  <body>
    <cfinclude  template="../shared/nav.cfm">

    <div class="wrapper d-flex flex-column min-vh-100">
      <cfinclude  template="../shared/header.cfm">

      <div class="body flex-grow-1">
        <div class="container-lg px-4">
          <div class="row g-4 mb-4">
            <div class="col-sm-6 col-xl-3">
              <div class="card text-white bg-primary">
                <div class="card-body pb-0 d-flex justify-content-between align-items-start">
                  <div>
                    <div class="fs-4 fw-semibold"> 26K Users</div>
                    <div>10 Approval Pending</div>
                  </div>
                  <div class="dropdown">
                    <button class="btn btn-transparent text-white p-0" type="button" data-coreui-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <svg class="icon">
                        <use xlink:href="assets/coreui/node_modules/@coreui/icons/sprites/free.svg#cil-options"></use>
                      </svg>
                    </button>
                    <div class="dropdown-menu dropdown-menu-end"><a class="dropdown-item" href="#">Action</a><a class="dropdown-item" href="#">Another action</a><a class="dropdown-item" href="#">Something else here</a></div>
                  </div>
                </div>
                  <i class="icon icon-xxl mt-5 mb-2 cil-user"></i>
              </div>
            </div>
            <!-- /.col-->
            <div class="col-sm-6 col-xl-3">
              <div class="card text-white bg-info">
                <div class="card-body pb-0 d-flex justify-content-between align-items-start">
                  <div>
                    <div class="fs-4 fw-semibold">6200 Contents</div>
                    <div>5 Approval Pending</div>
                  </div>
                  <div class="dropdown">
                    <button class="btn btn-transparent text-white p-0" type="button" data-coreui-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <svg class="icon">
                        <use xlink:href="assets/coreui/node_modules/@coreui/icons/sprites/free.svg#cil-options"></use>
                      </svg>
                    </button>
                    <div class="dropdown-menu dropdown-menu-end"><a class="dropdown-item" href="#">Action</a><a class="dropdown-item" href="#">Another action</a><a class="dropdown-item" href="#">Something else here</a></div>
                  </div>
                </div>
                    <i class="icon icon-xxl mt-5 mb-2 cil-file"></i>
              </div>
            </div>
            <!-- /.col-->
            <div class="col-sm-6 col-xl-3">
              <div class="card text-white bg-warning">
                <div class="card-body pb-0 d-flex justify-content-between align-items-start">
                  <div>
                    <div class="fs-4 fw-semibold">249</div>
                    <div>Categories</div>
                  </div>
                  <div class="dropdown">
                    <button class="btn btn-transparent text-white p-0" type="button" data-coreui-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <svg class="icon">
                        <use xlink:href="assets/coreui/node_modules/@coreui/icons/sprites/free.svg#cil-options"></use>
                      </svg>
                    </button>
                    <div class="dropdown-menu dropdown-menu-end"><a class="dropdown-item" href="#">Action</a><a class="dropdown-item" href="#">Another action</a><a class="dropdown-item" href="#">Something else here</a></div>
                  </div>
                </div>
                <i class="icon icon-xxl mt-5 mb-2 cil-sort-alpha-down"></i>
              </div>
            </div>
            <!-- /.col-->
            <div class="col-sm-6 col-xl-3">
              <div class="card text-white bg-danger">
                <div class="card-body pb-0 d-flex justify-content-between align-items-start">
                  <div>
                    <div class="fs-4 fw-semibold">44000</div>
                    <div>Tags</div>
                  </div>
                  <div class="dropdown">
                    <button class="btn btn-transparent text-white p-0" type="button" data-coreui-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <svg class="icon">
                        <use xlink:href="assets/coreui/node_modules/@coreui/icons/sprites/free.svg#cil-options"></use>
                      </svg>
                    </button>
                    <div class="dropdown-menu dropdown-menu-end"><a class="dropdown-item" href="#">Action</a><a class="dropdown-item" href="#">Another action</a><a class="dropdown-item" href="#">Something else here</a></div>
                  </div>
                </div>
                    <i class="icon icon-xxl mt-5 mb-2 cil-tags"></i>
              </div>
            </div>
            <!-- /.col-->
          </div>
        <cfinclude  template="../shared/search.cfm">

        </div>
      </div>
      <cfinclude  template="../shared/footer.cfm">
    </div>
    <cfinclude  template="../shared/scripts.cfm">
  </body>
</html>