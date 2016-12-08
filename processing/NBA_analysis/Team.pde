class Team{
   private Long id;
   private String name;
   private String abbreviation;
   private ArrayList<Player> players;
   
   public Team(Long id, String name, String abbreviation, ArrayList<Player> players) {
      this.id = id;
      this.name = name;
      this.abbreviation = abbreviation;
      this.players = players;
   }
  
}