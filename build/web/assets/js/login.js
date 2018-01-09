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

function signInSuccess(googleUser){
    var request = getHTTPObject();
    var profile = googleUser.getBasicProfile();
    
    request.open("POST", "gLoginProcess.jsp?gid="+googleUser.getAuthResponse().id_token, true);
    
    
    request.send();
    
}
function onSignIn(googleUser) {
    signInSuccess(googleUser);
        // Useful data for your client-side scripts:
        //var profile = googleUser.getBasicProfile();
        //console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        //console.log("Name: " + profile.getName());
        //console.log("Image URL: " + profile.getImageUrl());
        //console.log("Email: " + profile.getEmail());

        // The ID token you need to pass to your backend:
        //var id_token = googleUser.getAuthResponse().id_token;
        //console.log("ID Token: " + id_token);
      };
function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
});
}