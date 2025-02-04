var questions = [
  {
    prompt: "a or b",
    answer: "a"
  },
  {
    prompt: "a or b",
    answer: "a"
  },
  {
    prompt: "a or b",
    answer: "a"
  },
  {
    prompt: "a or b",
    answer: "a"
  }
]
var score = 0;
for(var i = 0; i < questions.length;i++){
  var response = window.prompt(questions[i].prompt);
  if(response == questions[i].answer){
    score++;
    alert("Correct!");
  } else {
    alert("wrong");
  }
}
alert("you got " + score + "/" + questions.length);
