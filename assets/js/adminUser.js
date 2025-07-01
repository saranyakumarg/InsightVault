$(document).ready(function() {
    var baseURL = document.getElementById("appConfig").getAttribute("data-baseurl");
    // User Creation
    $('#userForm').on('submit', function(e) {
        e.preventDefault();
        
        var formData = {
            firstName: $('#firstName').val(),
            lastName: $('#lastName').val(),
            email: $('#email').val(),
            role: $('#role').val(),
            accessLevel: $('#accessLevel').val(),
        };

        var method = "save-user";
        if ($('input[name="id"]').length) {
            formData.id = $('input[name="id"]').val();
            var method = "update-user";
        }
        
        $.ajax({
            url: baseURL + 'controllers/AdminUserController.cfm?method=' + method,
            type: 'POST',
            data: formData,
            success: function(response) {
                var jsonResponse = JSON.parse(response); 
                if (jsonResponse.SUCCESS) {
                    showToast("User", "User saved successfully!","success");
                    setTimeout(function () {
                        window.location.href = baseURL + '?page=users-all';
                    }, 1000);
                } else {
                    showToast("User", jsonResponse.message, "danger");
                }
            },
            error: function(xhr, status, error) {
                alert('Error saving user: ' + error);
            }
        });
    });

    // User List
    $('#usersTable').DataTable({
        "processing": true, 
        "serverSide": true,  
        "scrollY": "480px", // Set fixed table height
        "ajax": baseURL + "controllers/AdminUserController.cfm?method=get-users",  
        "columns": [
            { "data": "user_id" },
            { "data": "first_name" },
            { "data": "last_name" },
            { "data": "email" },
            { "data": "role" },
            { "data": "access_level" },
            { "data": "is_registered" },
            { "data": "actions", "orderable": false }
        ],
        "language": {
            "emptyTable": "<div style='height:200px;display:flex;align-items:center;justify-content:center;'>No data available in table</div>"
        }
    });

    // User List Status Filter
    var statusDropdown = document.getElementById("list_status");
    var usersTable = $('#usersTable').DataTable();

    // User List Status Filter
    statusDropdown.addEventListener("change", function() {
        var selectedStatus = this.value;
        var ajaxUrl = baseURL + "controllers/AdminUserController.cfm?method=get-users";
        if(selectedStatus !== "all") {
            ajaxUrl += "&type=" + selectedStatus;
        }
        usersTable.ajax.url(ajaxUrl).load();
    });

    
    $('.btn-secondary').on('click', function() {
        window.location.href = baseURL + '?page=users-pending';
    });

});

    var baseURL = document.getElementById("appConfig").getAttribute("data-baseurl");
    var section = "user";

    function confirmModal(type,user_id) {
        $('#user_id').val(user_id);
        $('#modal_body').text('Are you sure you want to '+type+' this ' + section + '?');
        $('#staticBackdropLabel').text(section.charAt(0).toUpperCase() + section.slice(1));

        $('#modalConfirm').off('click').on('click', function() {
            if(type == 'delete') {
                deleteUser(user_id);
            } else {
                var approval_status = (type === 'approve') ? 1 : 2;
                handleUserApproval(user_id, approval_status);
            }
            
        });
    }

    function deleteUser(user_id) {
        $.ajax({
            url: baseURL + "controllers/AdminUserController.cfm?method=delete-user",
            type: "POST",
            data: { user_id: user_id },
            success: function(response) {
                var jsonResponse = JSON.parse(response); 
                if (jsonResponse.SUCCESS) {
                    $('#staticBackdrop').modal('hide');
                    showToast("User", "User deleted successfully!","success");
                    setTimeout(function () {
                        $('#usersTable').DataTable().ajax.reload(null, false);
                    }, 1000);
                } else {
                    showToast("User", jsonResponse.message, "danger");
                }
            },
            error: function(xhr, status, error) {
                alert("An error occurred while deleting the user: " + error);
            }
        });
    }

    function handleUserApproval(user_id, approval_status) {
        $.ajax({
            url: baseURL + "controllers/AdminUserController.cfm?method=handle-user-approval",
            type: "POST",
            data: { user_id: user_id, approval_status: approval_status},
            success: function(response) {
                var jsonResponse = JSON.parse(response); 
                if (jsonResponse.SUCCESS) {
                    $('#staticBackdrop').modal('hide');
                    var successText = (approval_status === 1) ? "User approved successfully!" : "User rejected successfully!";
                    showToast("User", successText,"success");
                    setTimeout(function () {
                        $('#usersTable').DataTable().ajax.reload(null, false);
                    }, 1000);
                } else {
                    showToast("User", jsonResponse.message, "danger");
                }
            },
            error: function(xhr, status, error) {
                alert("An error occurred while deleting the user: " + error);
            }
        });
    }