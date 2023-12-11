function showComment(state){
    var comment = document.getElementById("Comment-Contain");
    
    if(state === true){
        comment.style.display = "block"; 
    }
    if(state === false){
        comment.style.display = "none";
    }
}


