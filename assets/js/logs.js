
$(document).ready(function(){
    var baseURL = document.getElementById("appConfig").getAttribute("data-baseurl");
    $('#LogsTable').DataTable({
        serverSide:true,
        processing:true,
        scrollY: "480px", 
        order: [[0, 'desc']],//sort by first column in desc order
        ajax:{
            url: baseURL + "controllers/AuditLogController.cfm?method=get-Logs",
            dataSrc: "data",
            error: function(xhr, error, thrown) {
            console.error("DataTables AJAX error:", error, thrown);
            console.log(xhr.responseText);
            }
        },
        columns:[
            {data:"log_id"},
            {data:"user_id"},
            {data:"role_id"},
            {data:"action"},
            {data:"entity_type"},
            {data:"access_level_id"},
            {data:"details"}
        ],
        language: {
            emptyTable: "<div style='height:200px;display:flex;align-items:center;justify-content:center;'>No data available in table</div>"
        }
    })
})