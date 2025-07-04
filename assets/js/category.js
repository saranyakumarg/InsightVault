document.getElementById('name').addEventListener('input', function() {
    const title = this.value;
    const slug = title.toLowerCase().replace(/\s+/g, '-');
    document.getElementById('slug').value = slug;
});
$(document).ready(function() {
    var baseURL = document.getElementById("appConfig").getAttribute("data-baseurl");
 $('#categoryTable').DataTable({
        // "retrieve": true,
        "serverSide": true, 
        "processing":true, 
        "scrollY": "480px", // Set fixed table height
         "ajax":{
            "url":baseURL + "controllers/CategoriesController.cfm?method=get-category",
            "type":"GET"
         },
        "columns": [
            { "data": "category_id" },
            { "data": "slug" },
            { "data": "name" },
           { "data": null, "orderable": false, "defaultContent": "" }
        ],
        "language": {
            "emptyTable": "<div style='height:200px;display:flex;align-items:center;justify-content:center;'>No data available in table</div>"
        }
    });
});
