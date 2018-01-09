function getHTTPObject(){
    var ajaxRequest;  // The variable that makes Ajax possible!
	
 try{
   // Opera 8.0+, Firefox, Safari
   ajaxRequest = new XMLHttpRequest();
 }catch (e){
   // Internet Explorer Browsers
   try{
      ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
   }catch (e) {
      try{
         ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
      }catch (e){
         // Something went wrong
         alert("Your browser broke!");
         return false;
      }
   }
 }
    return ajaxRequest;
}

function like(blogId){
    var request = getHTTPObject();
    
    request.open("POST", "likeProcess.jsp?blogId="+blogId, true);
    
    
    request.send();
    
    request.onreadystatechange = function(){
        if(request.readyState === 4 && request.status === 200){
                document.getElementById("nolike").innerHTML = request.responseText;
                document.getElementById("uLiked").innerHTML = "you liked";
        }
    };
}

function loadComment(blogId, pageno){
    var request = getHTTPObject();
    
    request.open("GET", "feedComment.jsp?blogId="+blogId+"&pageno="+pageno, true);
    
    request.send();
    
    request.onreadystatechange = function (){
        if(request.readyState === 4 && request.status === 200){
            console.log(request.responseText);
            document.getElementById("comments").innerHTML=request.responseText;
            document.getElementById("comments").style.visibility = "visible";
        }
    };
}
