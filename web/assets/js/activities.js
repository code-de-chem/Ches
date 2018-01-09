function display(currentClass , currentId){
    var objects = document.getElementsByClassName(currentClass);
    for(i=0; i < objects.length; i++){
        var current = objects[i];
        current.style.display = 'none';
    }
    document.getElementById(currentId).style.display = 'block';
}

function showActivity(current){
    document.getElementById("activity_home").style.display = 'none';
    document.getElementById("ChES_events").style.display = 'none';
    document.getElementById("Guest_Lectures").style.display = 'none';
    document.getElementById("Concetto_2015").style.display = 'none';
    document.getElementById("Concetto_2014").style.display = 'none';
    document.getElementById("Concetto_2013").style.display = 'none';
    document.getElementById("Concetto_2012").style.display = 'none';
    document.getElementById(current).style.display = 'block';
}

