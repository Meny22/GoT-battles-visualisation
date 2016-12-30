PImage court;
InfoFeeder feed;
ArrayList<ArrayList<Player>> allplayers;
JSONArray coordinates;
int index=0;
void setup() {
  feed = new InfoFeeder("12.25.2015.CLE.at.GSW.json");
  size(1300, 700);
  court = loadImage("court.png");
  getCoordinates();
}

void draw() {
  background(255);
  court.resize(width-300,height-75);
  image(court,150,75);
  writeGameInfo();
  plotCoordinates();
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
  textSize(15);
  fill(0);
  for(Player p : home) {
     text(p.getFirstName() + " " + p.getLastName(),20,100+(home.indexOf(p)*40)); 
  }
  for(Player p : visiting) {
     text(p.getFirstName() + " " + p.getLastName(),width-150,100+(visiting.indexOf(p)*40)); 
  }
}

void plotCoordinates(){
  if(coordinates != null) {
     if(index < coordinates.size()) {
       JSONArray play = coordinates.getJSONArray(index);
       JSONArray plays = play.getJSONArray(5); 
       for(int i = 0; i < plays.size(); i++) {
          JSONArray individualplays = plays.getJSONArray(i);
          float x = individualplays.getInt(2);
          float y = individualplays.getInt(3);
          float plotX = map(x,0,94,0,(float)court.width);
          float plotY = map(y,0,50,0,(float)court.height);
          ellipse(plotX,plotY,20,20);
        }
     }
     index++;
     delay(50);
  }
}

void getCoordinates() {
  coordinates = feed.getCoordinates(); 
}