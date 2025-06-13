ClassicEditor
    .create(document.querySelector('#content'), {
        toolbar: ['heading', '|', 'bold', 'italic', 'link', 'bulletedList', 'numberedList', '|', 'outdent', 'indent', '|', 'blockQuote', 'insertTable', 'undo', 'redo']
    })
    .catch(error => {
        console.error(error);
    });
document.getElementById('title').addEventListener('input', function() {
        const title = this.value;
        const slug = title.toLowerCase().replace(/\s+/g, '-');
        document.getElementById('slug').value = slug;
    });
