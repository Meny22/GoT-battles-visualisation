PImage court;
InfoFeeder feed;
ArrayList<ArrayList<Player>> allplayers;
void setup() {
  feed = new InfoFeeder("12.25.2015.CLE.at.GSW.json");
  size(1200, 700);
  court = loadImage("court.png");
}

void draw() {
  court.resize(width-200,height-75);
  image(court,100,75);
  writeGameInfo();
}

void writeGameInfo() {
  //Gametext
  float startX = width/4-70;
  float startY = 50;
  String gameinfo = feed.getGameInfo(); 
  textSize(28);
  text(gameinfo,startX,startY);
  //Playerstext
  if(allplayers == null)
    allplayers = feed.getPlayers(0);
  ArrayList<Player> home = allplayers.get(0);
  ArrayList<Player> visiting = allplayers.get(1);
  textSize(20);
  fill(0);
  for(Player p : home) {
     text(p.getFirstName() + " " + p.getLastName(),50,100+(home.indexOf(p)*40)); 
  }
  for(Player p : visiting) {
     text(p.getFirstName() + " " + p.getLastName(),width-200,100+(visiting.indexOf(p)*40)); 
  }
}