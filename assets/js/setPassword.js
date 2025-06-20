$(document).ready(function() {
    var baseURL = document.getElementById("appConfig").getAttribute("data-baseurl");
    // create user
    $('#setPasswordForm').on('submit', function(e) {
        e.preventDefault();
        
        var formData = {
            password: $('#password').val(),
            repeatPassword: $('#repeatPassword').val(),
            token: $('#token').val()
        };
        if (formData.password !== formData.repeatPassword) {
            showToast("Password", "Password and repeat password do not match", "danger");
            return;
        }
        // check password length
        // if (formData.password.length < 8) {
        //     showToast("Password", "Password must be at least 8 characters long", "danger");
        //     return;
        // }
        // check password contains at least one uppercase letter
        $.ajax({
            url: baseURL + 'controllers/AdminController.cfm?method=setPassword',
            type: 'POST',
            data: formData,
            success: function(response) {
                var jsonResponse = JSON.parse(response); 
                if (jsonResponse.SUCCESS) {
                    showToast("Password", "Password set successfully!", "success");
                    setTimeout(function () {
                        window.location.href = baseURL + '?page=login';
                    }, 1000);
                } else {
                    showToast("Password", jsonResponse.message, "danger");
                }
            },
            error: function(xhr, status, error) {
                alert('Error setting password: ' + error);
            }
        });
    });
    
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
});