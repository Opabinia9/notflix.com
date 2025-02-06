/*var isMale = false
var isTall = true
if(isMale && isTall){
  document.write("You are a tall male");
} else if(isMale && !isTall){
  document.write("you are a short male");
} else if(!isMale && isTall){
  document.write("you are not male but are tall");
} else {
  document.write("You are neither male nor tall");
}

document.write("<br/>");

if(isMale || isTall){
  document.write("You are either male or tall or both");
} else {
  document.write("You are not tall or male");
}

function max(num1, num2, num3){
  if(num1 >= num2 && num1 >= num3){
    return num1;
  } else if (num2 >= num1 && num2 >= num3) {
    return num2;
  } else {
    return num3;
  }
}
document.write(max(3,5,1));
*//*
function getDayName(dayNum){
  var day;
  switch (dayNum) {
    case 0:
      day = "Sunday";
      break;
    case 1:
      day = "Monday";
      break;
    case 2:
      day = "Tuesday";
      break;
    case 3:
      day = "Wednsday";
      break;
    case 4:
      day = "Thursday";
      break;
    case 5:
      day = "Friday";
      break;
    case 6:
      day = "Saturday";
      break;
    default:
      day = "Not Week Day";
  }
  return day;
}
document.write(getDayName(e));
*//*
var person = {
  name: "Seb",
  age: 17,
  isMale: true,
  occupation: "pentester",
  printName: function(){
    document.write("<h1>"+this.name+"</h1>");
  }
}
person.printName();
person.age =18;
document.write(person.age);
*//*
var theXfiles = {
  title: "The X-Files",
  realeaseYear: 1993,
  duration: 45,
  type: "Series",
  nos: 11,
  season: [
    {
      no: 1,
      ep: 24
    },
    {
      no: 2,
      ep: 24
    },
    {
      no: 3,
      ep: 24
    }
  ]
}
*/
var i = 11;
while(i <= 10){
  document.write(i + "<br/>");
  i++;
}
do{
  document.write(i + "<br/>");
  i++;
}while(i <= 10)
