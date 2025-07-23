// CKEditor configuration
    let editorInstance;
    ClassicEditor
        .create(document.querySelector('#content'), {
            toolbar: ['heading', '|', 'bold', 'italic', 'link', 'bulletedList', 'numberedList', '|', 'outdent', 'indent', '|', 'blockQuote', 'insertTable', 'undo', 'redo']
        })
        .then(editor => {
            editorInstance = editor;
        })
        .catch(error => {
            console.error(error);
        });

// slug generation
    document.getElementById('title').addEventListener('input', function() {
            const title = this.value;
            const slug = title.toLowerCase().replace(/\s+/g, '-');
            document.getElementById('slug').value = slug;
        });

// Save content
    var baseURL = document.getElementById("appConfig").getAttribute("data-baseurl");
    // Content Save
    $('#contentForm').on('submit', function(e) {
        e.preventDefault();

        // Gather form data
        var formData = {
            title: $('#title').val(),
            slug: $('#slug').val(),
            category: $('select[name="category"]').val(),
            accessLevel: $('select[name="accessLevel"]').val(),
            tags: $('select[name="tags"]').val(),
            content: editorInstance.getData()
        };

        var method = "save-content";
        if ($('input[name="id"]').length) {
            formData.id = $('input[name="id"]').val();
            var method = "update-content";
        }

        $.ajax({
            url: baseURL + 'controllers/ContentController.cfm?method=' + method,
            type: 'POST',
            "Content-Type": "application/x-www-form-urlencoded",
            data: formData,
            success: function(response) {
                var jsonResponse = JSON.parse(response); 
                if (jsonResponse.SUCCESS) {
                    showToast("Content", "Content saved successfully!", "success");
                    setTimeout(function () {
                        window.location.href = baseURL + '?page=content-all';
                    }, 1000);
                } else {
                    showToast("Content", jsonResponse.message, "danger");
                }
            },
            error: function(xhr, status, error) {
                alert('Error saving content: ' + error);
            }
        });
    });
