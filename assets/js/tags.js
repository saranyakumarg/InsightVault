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

    $('#tagForm').on("submit",function(event){
        event.preventDefault();

        const $tagContainer = $('#tags');
        const $tagSpans = $tagContainer.parent().find('.badge');

        const tagsArray = $tagSpans.map(function() {
            return $(this).children().first().text().trim();
        }).get().filter(function(tag) {
            return tag.length > 0;
        });
        if (tagsArray.length === 0) {
            alert("Please enter at least one tag.");
            return;
        }


        $.ajax({
                url: baseURL + 'controllers/TagsController.cfm?method=save-Tags',
                type: 'POST',
                dataType: 'json',
                data:{ Tags: tagsArray.join(',') },
                success: function(response) { 
                    const message = "Tag added successfully!";
                   if(response.success){
                    showToast("Tags", message, "success");
                        setTimeout(function () {
                            window.location.href = baseURL + '?page=tag-all';
                        }, 1000);
                    } else {
                        showToast("Tags", "failed to save tags", "danger");
                    }
                },
                error: function(xhr, status, error) {
                    alert('Error in saving Tag: ' + error);
                }
            });
    })
})

