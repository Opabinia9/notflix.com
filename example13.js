var numGrid = [
  [1,2,3],
  [4,5,6],
  [7,8,9],
  [0]
];
var object = [
  {
    title: blah1,
    yhin: bblach1
  },
  {
    title: blah2,
    yhin: bblach2
  },
  {
    title: blah3,
    yhin: bblach3
  },
  [0]
];

for(var i = 0; i < numGrid.length; i++){
  for(var j= 0; j < numGrid.length; j++){
    document.write(numGrid[i][j]);
  }
  document.write("<br/>")
}

object.forEach(function(obj){
  document.write(object.title + "<br/>")
  document.write(object.yhin + "<br/><br/>")
});
