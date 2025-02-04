var password = "wordpass";
var response;
var entryCount = 0;
var entryLimit = 3;
var error = false;
while(response != password && !error){
  if(entryCount < entryLimit){
    response = window.prompt("Enter Password");
    entryCount++;
  } else {
    error = true;
  }
}
if(error){
  alert("Too many entries");
} else {
  alert("You got it!");
}

var friends = ["a","b","k"];
for(var i = 0; i < friends.length; i++){
  document.write(friends[i] + "<br/>");
}
