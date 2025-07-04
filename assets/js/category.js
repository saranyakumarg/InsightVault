document.getElementById('name').addEventListener('input', function() {
    const title = this.value;
    const slug = title.toLowerCase().replace(/\s+/g, '-');
    document.getElementById('slug').value = slug;
});
$(document).ready(function() {
    var baseURL = document.getElementById("appConfig").getAttribute("data-baseurl");
 $('#categoryTable').DataTable({
        "retrieve": true,
        "serverSide": true,  
        "scrollY": "480px", // Set fixed table height
         "ajax": {
            "url": baseURL + "controllers/CategoriesController.cfm?method=get-category",
            "type": "GET", // 👈 Set the request method to GET

             "dataSrc": function (json) {
            console.log("AJAX Success Response:", json);
            return json.data;
            },
            "error": function (xhr, error, thrown) {
                console.error("AJAX Error:", xhr.responseText);
            }
        },
        "columns": [
            { "data": "category_id" },
            { "data": "name" },
            { "data": "slug" },
            { "data": "actions","orderable": false }
        ],
        "language": {
            "emptyTable": "<div style='height:200px;display:flex;align-items:center;justify-content:center;'>No data available in table</div>"
        }
    });
});

    var categoryTable = $('#categoryTable').DataTable();
    var section = "admin";