PImage court;
InfoFeeder feed;
void setup() {
  feed = new InfoFeeder("12.25.2015.CLE.at.GSW/data.json");
  size(1200, 700);
  court = loadImage("court.png");
}

void draw() {
  court.resize(width,height-75);
  image(court,0,75);
  writeGameInfo();
}

void writeGameInfo() {
  float startX = width/4;
  float startY = 50;
  String gameinfo = feed.getGameInfo(); 
  textSize(28);
  text(gameinfo,startX,startY);
}