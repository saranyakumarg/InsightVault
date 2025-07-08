document.getElementById('name').addEventListener('input', function() {
    const title = this.value;
    const slug = title.toLowerCase().replace(/\s+/g, '-');
    document.getElementById('slug').value = slug;
});

$(document).ready(function() {
    var baseURL = document.getElementById("appConfig").getAttribute("data-baseurl");
    $('#categoryTable').DataTable({
        // "retrieve": true,
        serverSide: true, 
        processing:true, 
        scrollY: "480px", // Set fixed table height
         ajax: {
            url: baseURL + "controllers/CategoriesController.cfm?method=get-category",
            dataSrc: "data",
            error: function(xhr, error, thrown) {
            console.error("DataTables AJAX error:", error, thrown);
            console.log(xhr.responseText);
            }
        },
        columns: [
            { data: "category_id" },
            { data: "name" },
            { data: "slug" },
            { data: "actions", orderable: false}
        ],
        language: {
            emptyTable: "<div style='height:200px;display:flex;align-items:center;justify-content:center;'>No data available in table</div>"
        }
    });

    $('#categoryFormElement').on("submit", function (event) {
         event.preventDefault();

        const nameInput=$('#name');
        const formData={
           Name: $('#name').val(),
            slug:$('#slug').val()
        }

        let isValid = true;
        if(!formData.Name.trim()){
            nameInput.addClass('is-invalid');
            $('#validationError').text("Please enter name");
            isValid=false;
        }
        else{
            nameInput.removeClass('is-invalid').addClass('is-valid');
        }

        $('#closeBtn').click(function(){
            nameInput.removeClass('is-invalid');
        })

        //Real time validation      
        nameInput.on("input", function () {
        const value = $(this).val().trim();
        if (value) {
            $(this).removeClass('is-invalid').addClass('is-valid');
            errorText.text('');
        } else {
            $(this).removeClass('is-valid').addClass('is-invalid');
            errorText.text('Please enter name');
        }
        })

        if(isValid){
            $.ajax({
                url: baseURL + 'controllers/CategoriesController.cfm?method=save-category',
                type: 'POST',
                data: formData,
                success: function(response) {
                    var jsonResponse = JSON.parse(response); 
                    if (jsonResponse.SUCCESS) {
                        showToast("category", "category added successfully!","success");
                        setTimeout(function () {
                            window.location.href = baseURL + '?page=category-all';
                        }, 1000);
                    } else {
                        showToast("category", jsonResponse.message, "danger");
                    }
                },
                error: function(xhr, status, error) {
                    alert('Error saving category: ' + error);
                }
            });
        }
        
    
    });
});
