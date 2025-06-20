$(document).ready(function() {
    var baseURL = document.getElementById("appConfig").getAttribute("data-baseurl");
    // create user
    $('#userForm').on('submit', function(e) {
        e.preventDefault();
        
        var formData = {
            firstName: $('#firstName').val(),
            lastName: $('#lastName').val(),
            email: $('#email').val(),
            role: $('#role').val(),
            accessLevel: $('#accessLevel').val()
        };
        
        if ($('input[name="id"]').length) {
            formData.id = $('input[name="id"]').val();
        }
        
        $.ajax({
            url: baseURL + 'controllers/AdminController.cfm?method=saveUser',
            type: 'POST',
            data: formData,
            success: function(response) {
                var jsonResponse = JSON.parse(response); 
                if (jsonResponse.SUCCESS) {
                    showSuccessToast("User", "User saved successfully!");
                    setTimeout(function () {
                        window.location.href = baseURL + '?page=users-pending';
                    }, 1000);
                } else {
                    alert('Error saving user: ' + jsonResponse.message);
                }
            },
            error: function(xhr, status, error) {
                alert('Error saving user: ' + error);
            }
        });
    });
    
    $('.btn-secondary').on('click', function() {
        window.location.href = baseURL + '?page=users-pending';
    });

    function showSuccessToast(title, message) {
        document.getElementById('toastTitle').textContent = title;
        document.getElementById('toastBody').textContent = message;
        document.getElementById('liveToast').classList.add('show');
    }
});