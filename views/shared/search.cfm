<cfoutput>          
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
                        <button class="btn btn-primary" type="button" id="searchButton" onclick="performSearch()">
                            <i class="icon cil-search"></i>
                        </button>
                    </div>
                    <div class="search-results mt-4" id="searchResults" style="display: none;">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h4 class="text-primary mb-0">
                                <i class="icon cil-search me-2"></i>Search Results
                            </h4>
                            <div class="search-stats">
                                <span class="badge bg-primary rounded-pill" id="resultCount">3 results</span>
                            </div>
                        </div>
                        
                        <div class="list-group search-results-container" id="searchResultsContainer">
                            <!-- Search results will be dynamically inserted here -->
                        </div>

                        <div class="text-center mt-4" id="noResults" style="display: none;">
                            <div class="p-4">
                                <i class="icon cil-search mb-3" style="font-size: 3rem; color: ##ccc;"></i>
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
          </cfoutput>