// to generate tags for the tag form

document.getElementById('tags').addEventListener('keydown', function(e) {
    if (e.key === ',') {
        e.preventDefault();
        const input = this.value.trim();//get input value entered
        if (input) {
            const tag = document.createElement('span');
            tag.className = 'badge bg-primary me-1';
            
            // Create tag text
            const tagText = document.createElement('span');
            tagText.textContent = input;
            tag.appendChild(tagText);
            
            // Create close icon
            const closeIcon = document.createElement('i');
            closeIcon.className = 'icon cil-x ms-1';
            closeIcon.style.cursor = 'pointer';
            
            // Add click event to remove tag
            closeIcon.addEventListener('click', function() {
                tag.remove();
            });
            
            tag.appendChild(closeIcon);
            this.parentNode.insertBefore(tag, this);
            this.value = '';
        }
    }
});

$(document).ready(function(){
    var baseURL = document.getElementById("appConfig").getAttribute("data-baseurl");
    $('#TagsTable').DataTable({
        serverSide:true,
        processing:true,
        scrollY: "480px", 
        order: [[0, 'desc']],//sort by first column in desc order
        ajax:{
            url: baseURL + "controllers/TagsController.cfm?method=get-Tags",
            dataSrc: "data",
            error: function(xhr, error, thrown) {
            console.error("DataTables AJAX error:", error, thrown);
            console.log(xhr.responseText);
            }
        },
        columns: [
            { data: "tag_id" },
            { data: "slug" },
            { data: "actions", orderable: false}
        ],
        language: {
            emptyTable: "<div style='height:200px;display:flex;align-items:center;justify-content:center;'>No data available in table</div>"
        }

    })

    $('#tagFormElement').on("submit",function(event){
        event.preventDefault();
        const tagId=$('#tag_id').val();
        const isEdit = tagId.length > 0;
        const $tagInput = isEdit ? $('#update_tag') : $('#tags');
        const $tagSpans = $tagInput.parent().find('.badge');
        let tagsArray = $tagSpans.map(function() {
            return $(this).text().trim();
        }).get().filter(function(tag) {
            return tag.length > 0;
        });

        const inputValue = $tagInput.val().trim();
        if (inputValue.length > 0 && !tagsArray.includes(inputValue)) {
            tagsArray.push(inputValue);
        }


        const regex = /^[a-zA-Z0-9_-]+$/;
        let isValid = true;
        if (!tagsArray.length) {
            $tagInput.addClass('is-invalid');
            $('#validationError').text("Please enter tag");
             isValid=false;
        } else{
            for(tag of tagsArray){
                if(!regex.test(tag)){
                    $tagInput.addClass('is-invalid');
                    $('#validationError').text("Tags must only contain letters, numbers, hyphens, or underscores.");
                    isValid=false;
                    break;
                }
            }
            
            if(isValid){
                $tagInput.removeClass('is-invalid').addClass('is-valid');
            }
        }

         $('#closeBtn').click(function(){
            $tagInput.removeClass('is-invalid');
        })

        
        //Real time validation      
        $tagInput.on("input", function () {
        const value = $(this).val().trim();
        if (value) {
            $(this).removeClass('is-invalid').addClass('is-valid');
        } else {
            $(this).removeClass('is-valid').addClass('is-invalid');
        }
        })


        var tags="";
        if(isEdit) {
            tags = $('#update_tag').val();
             
        } else {
            tags = tagsArray.join(',');
        }

        if(isValid){
            $.ajax({
                url: baseURL + 'controllers/TagsController.cfm?method=save-Tags',
                type: 'POST',
                dataType:'JSON',    
                data:{Tags:tags,
                    tagId:tagId
                },
                success: function(response) {
                    const message =isEdit ? "Tag updated successfully!": "Tag added successfully";
                    if(response.SUCCESS){
                    showToast("Tags", message, "success");
                        setTimeout(function () {
                            window.location.href = baseURL + '?page=tag-all';
                        }, 1000);
                    } else {
                        showToast("Tags", "failed to save tags", "danger");
                    }
                    
                }
                
            });
        }
    })


    //delete tag

    $(document).on('click', '.delete-btn', function () {
        var tag_id = $(this).data('id');
        $('#tag_id').val(tag_id);
        $('#tagmodalConfirm').off('click').on('click', function() {
                deleteTag(tag_id);
        });
    })

     $('.add-btn').on('click', function () {
         $('#tags').css('display', 'block');
         $('#update_tag').css('display', 'none');
        $(".modal-title").text('Add Tag');
        $("#tag_id").val('');
        $('#tagFormElement')[0].reset();
        $('#tagForm').modal('show');
        $('.form-text.comment').show();
    });
    
    function deleteTag(tag_id){
        $.ajax({  
            url: baseURL + 'controllers/TagsController.cfm?method=delete-Tag',
            type:'POST',
            dataType: 'json',
            data:{tag_id:tag_id},
            success: function(response) {
                console.log(response.success);
            if(response.success){
                    $('#TagDeleteModal').modal('hide');
                    showToast("Tags", "Tag deleted successfully!","success");
                    setTimeout(function () {
                            window.location.href = baseURL + '?page=tag-all';
                        }, 1000);
                } else {
                    showToast("Tags", response.message, "danger");
                }
            },
            error: function(xhr, status, error) {
                alert("An error occurred while deleting the tag: " + error);
            }
        });
    }

    //edit tag
    $(document).on('click','.edit-btn',function(){
        $('#update_tag').css('display', 'block');
        $('#tags').css('display', 'none');
        $('.form-text.comment').hide();
        const tagId=$(this).data("id");
        const tagSlug=$(this).data("slug");

        $("#tag_id").val(tagId);
        $("#update_tag").val(tagSlug);
        $('#update_tag').removeClass('is-invalid is-valid');
        $('#validationError').text('');
        $("#tagForm").modal('show');
        $(".modal-title").text('Edit Tag');
    })
})

