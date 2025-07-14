document.getElementById('name').addEventListener('input', function() {
    const title = this.value;
    const slug = title.toLowerCase().replace(/\s+/g, '-');
    document.getElementById('slug').value = slug;
});

$(document).ready(function() {
    var baseURL = document.getElementById("appConfig").getAttribute("data-baseurl");
   
    //category List
    $('#categoryTable').DataTable({
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
            slug:$('#slug').val(),
            categoryId:$('#category_id').val()
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
        } else {
            $(this).removeClass('is-valid').addClass('is-invalid');
        }
        })

        if(isValid){
            $.ajax({
                url: baseURL + 'controllers/CategoriesController.cfm?method=save-category',
                type: 'POST',
                data: formData,
                success: function(response) {
                    var jsonResponse = JSON.parse(response); 
                     const isEdit=formData.categoryId && formData.categoryId.trim().length > 0;
                        const message = isEdit ? "Category updated successfully!":"Category added successfully!";
                    if (jsonResponse.SUCCESS) {
                    showToast("category", message, "success");
                        setTimeout(function () {
                            window.location.href = baseURL + '?page=category-all';
                        }, 1000);
                    } else {
                        ("category", jsonResponse.message, "danger");
                    }
                },
                error: function(xhr, status, error) {
                    alert('Error saving category: ' + error);
                }
            });
        }
    
    });

    $(document).on('click', '.delete-btn', function () {
        var category_id = $(this).data('id');
        $('#category_id').val(category_id);
        $('#categorymodalConfirm').off('click').on('click', function() {console.log(1);
                deleteCategory(category_id);
        });
    })
    
     $('.add-btn').on('click', function () {
        $('#categoryFormElement')[0].reset();
        $('#categoryId').val('');   
        $('#categoryForm').modal('show');
    });
    
    //delete category

    function deleteCategory(category_id){console.log(2);
        $.ajax({  
            url: baseURL + 'controllers/CategoriesController.cfm?method=delete-category',
            type:'POST',
            dataType: 'json',
            data:{category_id:category_id},
            success: function(response) {
            if(response.success){
                console.log(3);
                    $('#categoryDeleteModal').modal('hide');
                    showToast("category", "category deleted successfully!","success");
                    setTimeout(function () {
                            window.location.href = baseURL + '?page=category-all';
                        }, 1000);
                } else {
                    showToast("User", response.message, "danger");
                }
            },
            error: function(xhr, status, error) {console.log(4);
                alert("An error occurred while deleting the category: " + error);
            }
        });
    }
    //edit category
   $(document).on('click', '.edit-btn', function () {
        const categoryId = $(this).data("id");
        const categoryName=$(this).data("name");
        const categorySlug=$(this).data("slug");
       
        $("#category_id").val(categoryId);
        $("#name").val(categoryName);
        $("#slug").val(categorySlug);
        $('#name').removeClass('is-invalid is-valid');
        $('#validationError').text('');
        $("#categoryForm").modal('show');
        $(".modal-title").text('Edit Category');
    });  
});
