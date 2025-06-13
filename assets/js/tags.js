// to generate tags for the tag form

document.getElementById('tags').addEventListener('keydown', function(e) {
    if (e.key === ',') {
        e.preventDefault();
        const input = this.value.trim();
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