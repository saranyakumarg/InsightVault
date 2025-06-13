document.getElementById('name').addEventListener('input', function() {
    const title = this.value;
    const slug = title.toLowerCase().replace(/\s+/g, '-');
    document.getElementById('slug').value = slug;
});