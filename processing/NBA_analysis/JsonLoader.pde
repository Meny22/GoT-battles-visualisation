class InfoFeeder{
 
 JSONObject json;
 JSONArray quarters;
 InfoFeeder(String filename) {
   json = loadJSONObject(filename);
   quarters = json.getJSONArray("events");
   getCoordinates();
 }
 
 String getGameInfo() {
   JSONObject quarter = quarters.getJSONObject(0);
   String date = json.getString("gamedate");
   String visiting = quarter.getJSONObject("visitor").getString("name"); 
   String home = quarter.getJSONObject("home").getString("name");
   return (home + " vs " + visiting + " " + date); 
 }
 
 ArrayList<ArrayList<Player>> getPlayers(int quarternr) {
   JSONObject quarter = quarters.getJSONObject(quarternr);
   JSONArray visiting = quarter.getJSONObject("visitor").getJSONArray("players");
   JSONArray home = quarter.getJSONObject("home").getJSONArray("players");
   ArrayList<Player> visitingteam = new ArrayList<Player>();
   ArrayList<Player> hometeam = new ArrayList<Player>();
   for(int i = 0; i < visiting.size(); i++) {
       JSONObject object = visiting.getJSONObject(i);
       int playerid = object.getInt("playerid");
       String firstname = object.getString("firstname");
       String lastname = object.getString("lastname");
       int jersey = object.getInt("jersey");
       String position = object.getString("position");
       Player player = new Player(playerid,null,firstname,lastname,jersey,position);
       visitingteam.add(player);
   }
   for(int i = 0; i < home.size(); i++) {
       JSONObject object = home.getJSONObject(i);
       int playerid = object.getInt("playerid");
       String firstname = object.getString("firstname");
       String lastname = object.getString("lastname");
       int jersey = object.getInt("jersey");
       String position = object.getString("position");
       Player player = new Player(playerid,null,firstname,lastname,jersey,position);
       hometeam.add(player);
   }
   ArrayList<ArrayList<Player>> allplayers = new ArrayList<ArrayList<Player>>();
   allplayers.add(hometeam);
   allplayers.add(visitingteam);
   return allplayers;
 }
 
 JSONArray getCoordinates() {
   return quarters.getJSONObject(0).getJSONArray("moments");
 }
}