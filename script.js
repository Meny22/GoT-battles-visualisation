d3.json("http://athena.fhict.nl/users/i298242/DV/small_data.json", function(data){
    gameData(data);
});

var browserWidth = $(window).width()
var browserHeight = $(window).height()

var svgContainer = d3.select("body").append("svg")
                                     .attr("width", browserWidth)
                                     .attr("height", browserHeight);

var imageattr = svgContainer.append("svg:image")
   .attr('x',350)
   .attr('y',25)
   .attr('width',browserWidth-700)
   .attr('height',browserHeight-100)
   .attr("xlink:href","court.png");

// var rectangles = grouping.selectAll("rect")
//                              .data(jsonRectangles)
//                             .enter()
//                             .append("rect");

// var rectangleAttributes = rectangles
//                           .attr("x", function (d) { return d.x_axis; })
//                           .attr("y", function (d) { return d.y_axis; })
//                           .attr("height", function (d) { return d.height; })
//                           .attr("width", function (d) { return d.width; })
//                           .style("fill", function(d) { return d.color; });

function gameData(data) {
  var hometeam = data.events[0].visitor.name
  var awayteam = data.events[1].home.name
  var date = data.gamedate
  var gameText = date + ": " + hometeam + " vs " + awayteam
  var text = svgContainer.selectAll("text").data([gameText]).enter().append("text");
  text.attr("x",browserWidth/2)
      .attr("y",40)
      .text(function(d) {return d})
      .attr("font-size", "40px")
      .attr("text-anchor", "middle")
  playerData(data);
}

function playerData(data) {
  var hometeam_group = svgContainer.append("g");
  var awayteam_group = svgContainer.append("g");
  var home = data.events[0].visitor.players
  var away = data.events[0].home.players
  var startY = 125

  // hometeam_group.attr("width",400).attr("height",500);
  var homeplayers = hometeam_group.selectAll("text").data(home).enter().append("text");
  homeplayers.text(function(d){return d.firstname + " " + d.lastname + " #" + d.jersey})
             .attr("x",70)
             .attr("y",function(d,i){return startY + i*50})
             .attr("font-size", "20px");

  var awayplayers = awayteam_group.selectAll("text").data(away).enter().append("text");
  awayplayers.text(function(d){return d.firstname + " " + d.lastname + " #" + d.jersey})
             .attr("x",browserWidth - 250)
             .attr("y",function(d,i){return startY + i*50})
             .attr("font-size", "20px");
}