          <div class="row">
            <div class="col-md-12">
              <div class="card mb-4">
                <div class="card-header">Find contents that you need!!!</div>
                <div class="card-body">
                    <div class="row g-3">
                        <div class="col">
                        <select class="form-select"  aria-label="multiple select example">
                            <option selected>Select Category</option>
                            <option value="1">HR</option>
                            <option value="2">OnBoarding</option>
                            <option value="3">Leave</option>
                            <option value="3">WHF</option>
                        </select>
                        </div>
                        <div class="col">
                        <select class="form-select" aria-label="multiple select example">
                            <option selected>Select Tags</option>
                            <option value="1">linux</option>
                            <option value="2">windows</option>
                            <option value="3">mac</option>
                            <option value="4">project</option>
                        </select>
                        </div>
                    </div>
                    </br>
                    <div class="input-group">
                        <input class="form-control" type="text" id="searchInput" aria-label="Search input" placeholder="Search here..." autocomplete="off">
                        <button class="btn btn-primary" type="button" id="searchButton" onclick="toggleSearchResults()">
                            <i class="icon cil-search"></i>
                        </button>
                    </div>
                    <div class="search-results mt-2" id="searchResults" style="display: none;">
                        <h5 class="mb-3 text-primary">Search Results</h5>
                        <div class="list-group">
                            <a href="#" class="list-group-item list-group-item-action hover-shadow">
                                <div class="d-flex w-100 justify-content-between">
                                    <h6 class="mb-1 fw-bold">Getting Started with ColdFusion</h6>
                                    <small class="text-muted badge bg-info">Tutorials</small>
                                </div>
                                <p class="mb-1 text-muted">ColdFusion is a powerful web application development platform...</p>
                            </a>
                            <a href="#" class="list-group-item list-group-item-action hover-shadow">
                                <div class="d-flex w-100 justify-content-between">
                                    <h6 class="mb-1 fw-bold">Advanced Database Techniques</h6>
                                    <small class="text-muted badge bg-info">Development</small>
                                </div>
                                <p class="mb-1 text-muted">Learn advanced database optimization and management...</p>
                            </a>
                            <a href="#" class="list-group-item list-group-item-action hover-shadow">
                                <div class="d-flex w-100 justify-content-between">
                                    <h6 class="mb-1 fw-bold">Security Best Practices</h6>
                                    <small class="text-muted badge bg-info">Security</small>
                                </div>
                                <p class="mb-1">Essential security measures for web applications...</p>
                            </a>
                        </div>
                    </div>
                </div>
              </div>
            </div>
            <!-- /.col-->
          </div>