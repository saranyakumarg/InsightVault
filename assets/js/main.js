function toggleSearchResults(){
    const searchResults = document.getElementById('searchResults');
    const searchInput = document.getElementById('searchInput');
    if(searchResults.style.display === 'none'){
        searchResults.style.display = 'block';
    }else{
        searchResults.style.display = 'none';
    }
}