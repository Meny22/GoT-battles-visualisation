class InfoFeeder{
 
 JSONObject json;
 JSONArray quarters;
 InfoFeeder(String filename) {
   json = loadJSONObject(filename);
   quarters = json.getJSONArray("events");
 }
 
 String getGameInfo() {
   JSONObject quarter = quarters.getJSONObject(0);
   String date = json.getString("gamedate");
   String visiting = quarter.getJSONObject("visitor").getString("name"); 
   String home = quarter.getJSONObject("home").getString("name");
   return (home + " vs " + visiting + " " + date); 
 }
}