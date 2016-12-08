class Player {
  private int id; 
  private Team team; 
  private String firstname;
  private String lastname;
  private int jersey;
  private String position;
  private ArrayList<PVector> coordinates;
  
  Player(int id, Team team, String firstname, String lastname, int jersey, String position) {
     this.id = id;
     this.team = team;
     this.firstname = firstname;
     this.lastname = lastname;
     this.jersey = jersey;
     this.position = position;
  }
  
  public String getFirstName() {
    return firstname; 
  }
  
  public String getLastName() {
    return lastname; 
  }
  
}