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
                    <div class="search-results mt-4" id="searchResults" style="display: none;">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h4 class="text-primary mb-0">
                                <i class="icon cil-search me-2"></i>Search Results
                            </h4>
                            <div class="search-stats">
                                <span class="badge bg-primary rounded-pill" id="resultCount">0 results</span>
                            </div>
                        </div>
                        
                        <div class="list-group search-results-container">
                            <a href="#" class="list-group-item list-group-item-action p-3 mb-3 rounded shadow-sm hover-lift">
                                <div class="d-flex w-100 justify-content-between align-items-start">
                                    <div class="flex-grow-1">
                                        <h5 class="mb-2 fw-bold text-primary">Getting Started with ColdFusion</h5>
                                        <div class="mb-2 d-flex justify-content-between align-items-center">
                                            <div>
                                                <span class="badge bg-info me-2">Tutorials</span>
                                                <span class="badge bg-success">Updated 2 days ago</span>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <i class="icon cil-user me-1 text-danger"></i>
                                                <span class="text-danger">Alan John</span>
                                            </div>
                                        </div>
                                        <p class="mb-2 text-muted">ColdFusion is a powerful web application development platform that enables rapid development of dynamic websites...</p>
                                        <div class="d-flex align-items-center text-muted small">
                                            <span class="me-3"><i class="icon cil-eye me-1"></i>1.2k views</span>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="#" class="list-group-item list-group-item-action p-3 mb-3 rounded shadow-sm hover-lift">
                                <div class="d-flex w-100 justify-content-between align-items-start">
                                    <div class="flex-grow-1">
                                        <h5 class="mb-2 fw-bold text-primary">Advanced Database Techniques</h5>
                                        <div class="mb-2 d-flex justify-content-between align-items-center">
                                            <div>
                                                <span class="badge bg-info me-2">Development</span>
                                                <span class="badge bg-success">Updated 1 week ago</span>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <i class="icon cil-user me-1 text-danger"></i>
                                                <span class="text-danger">Ravi Dev</span>
                                            </div>
                                        </div>
                                        <p class="mb-2 text-muted">Learn advanced database optimization and management techniques to improve your application's performance...</p>
                                        <div class="d-flex align-items-center text-muted small">
                                            <span class="me-3"><i class="icon cil-eye me-1"></i>2.5k views</span>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="#" class="list-group-item list-group-item-action p-3 mb-3 rounded shadow-sm hover-lift">
                                <div class="d-flex w-100 justify-content-between align-items-start">
                                    <div class="flex-grow-1">
                                        <h5 class="mb-2 fw-bold text-primary">Security Best Practices</h5>
                                        <div class="mb-2 d-flex justify-content-between align-items-center">
                                            <div>
                                                <span class="badge bg-info me-2">Security</span>
                                                <span class="badge bg-success">Updated 3 days ago</span>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <i class="icon cil-user me-1 text-danger"></i>
                                                <span class="text-danger">John Smith</span>
                                            </div>
                                        </div>
                                        <p class="mb-2 text-muted">Essential security measures and best practices for protecting your web applications from common vulnerabilities...</p>
                                        <div class="d-flex align-items-center text-muted small">
                                            <span class="me-3"><i class="icon cil-eye me-1"></i>3.1k views</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="text-center mt-4" id="noResults" style="display: none;">
                            <div class="p-4">
                                <i class="icon cil-search mb-3" style="font-size: 3rem; color: #ccc;"></i>
                                <h5 class="text-muted">No results found</h5>
                                <p class="text-muted">Try adjusting your search criteria</p>
                            </div>
                        </div>
                    </div>
                </div>
              </div>
            </div>
            <!-- /.col-->
          </div>