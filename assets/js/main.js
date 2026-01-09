function toggleSearchResults(){
    const searchResults = document.getElementById('searchResults');
    const searchInput = document.getElementById('searchInput');
    if(searchResults.style.display === 'none'){
        searchResults.style.display = 'block';
    }else{
        searchResults.style.display = 'none';
    }
}

function performSearch() {
    const searchInput = document.getElementById('searchInput');
    const searchTerm = searchInput.value.toLowerCase();
    const searchResults = document.getElementById('searchResults');
    const searchResultsContainer = document.getElementById('searchResultsContainer');
    const noResults = document.getElementById('noResults');
    
    // Show search results container
    searchResults.style.display = 'block';
    
    // Sample data - replace with your actual data source
    const sampleResults = [
        {
            title: "Getting Started with ColdFusion",
            category: "Tutorials",
            author: "Alan John",
            description: "ColdFusion is a powerful web application development platform that enables rapid development of dynamic websites to...",
            views: "1.2k",
            updated: "2 days ago",
            url: "?page=full-content&slug=coldfusion-tutorial"
        },
        {
            title: "Advanced Database Techniques",
            category: "Development",
            author: "Ravi Dev",
            description: "Learn advanced database optimization and management techniques to improve your application's performance to...",
            views: "2.5k",
            updated: "1 week ago",
            url: "?page=full-content&slug=database-techniques"
        },
        {
            title: "Security Best Practices",
            category: "Security",
            author: "John Smith",
            description: "Essential security measures and best practices for protecting your web applications from common vulnerabilities to...",
            views: "3.1k",
            updated: "3 days ago",
            url: "?page=full-content&slug=security-best-practices"
        }
    ];

    // Filter results based on search term
    const filteredResults = sampleResults.filter(result => 
        result.title.toLowerCase().includes(searchTerm) || 
        result.description.toLowerCase().includes(searchTerm)
    );

    // Clear previous results
    searchResultsContainer.innerHTML = '';

    if (filteredResults.length === 0) {
        noResults.style.display = 'block';
        document.getElementById('resultCount').textContent = '0 results';
    } else {
        noResults.style.display = 'none';
        document.getElementById('resultCount').textContent = filteredResults.length + ' results';

        // Create and append result items
        filteredResults.forEach(result => {
            const resultItem = document.createElement('a');
            resultItem.href = result.url;
            resultItem.target = "_blank"; // Open in new tab
            resultItem.className = 'list-group-item list-group-item-action p-3 mb-3 rounded shadow-sm hover-lift';
            
            // Highlight search term in title and description
            const highlightedTitle = highlightText(result.title, searchTerm);
            const highlightedDescription = highlightText(result.description, searchTerm);

            resultItem.innerHTML = `
                <div class="d-flex w-100 justify-content-between align-items-start">
                    <div class="flex-grow-1">
                        <h5 class="mb-2 fw-bold text-primary">${highlightedTitle}</h5>
                        <div class="mb-2 d-flex justify-content-between align-items-center">
                            <div>
                                <span class="badge bg-info me-2">${result.category}</span>
                                <span class="badge bg-success">Updated ${result.updated}</span>
                            </div>
                            <div class="d-flex align-items-center">
                                <i class="icon cil-user me-1 text-danger"></i>
                                <span class="text-danger">${result.author}</span>
                            </div>
                        </div>
                        <p class="mb-2 text-muted">${highlightedDescription}</p>
                        <div class="d-flex align-items-center text-muted small">
                            <span class="me-3"><i class="icon cil-eye me-1"></i>${result.views} views</span>
                        </div>
                    </div>
                </div>
            `;
            
            searchResultsContainer.appendChild(resultItem);
        });
    }
}

function highlightText(text, searchTerm) {
    if (!searchTerm) return text;
    const regex = new RegExp(`(${searchTerm})`, 'gi');
    return text.replace(regex, '<mark>$1</mark>');
}

function showToast(title, message, type) {
    document.getElementById('toastTitle').textContent = title;
    document.getElementById('toastBody').textContent = message;
    var liveToast = document.getElementById('liveToast');
    liveToast.classList.add('show');
    var toastBody = document.getElementById('toastBody');
    if (type === 'danger') {
        toastBody.style.color = '#dc3545';
    } else if (type === 'success') {
        toastBody.style.color = '#198754';
    }
}
    var baseURL = document.getElementById("appConfig").getAttribute("data-baseurl");
    function logout() {
        $.ajax({
            url: baseURL + 'controllers/AuthController.cfm?method=logout',
            type: 'POST',
            success: function(response) {
                window.location.href = baseURL;
            },
            error: function(xhr, status, error) {
                alert('Error logging out: ' + error);
            }
        });
    }