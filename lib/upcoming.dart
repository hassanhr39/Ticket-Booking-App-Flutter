class Upcoming{

  String name;
  String genre;
  String url;

  Upcoming(this.name, this.genre, this.url);

  static List<Upcoming> listOfUpcoming = [

    Upcoming("Superman", "Superhero, Action", "Assets/UpComing/superman.jpg"),
    Upcoming("Chainsaw Man - The Movie: Reze Arc", "Anime, Shōnen", "Assets/UpComing/chainsaw.jpg"),
    Upcoming("The Strangers - Chapter 2", "Slasher Horror, Mystery", "Assets/UpComing/theStrangers.jpg"),
    Upcoming("Weapons", "Horror, Mystery", "Assets/UpComing/weapons.jpg"),
    Upcoming("Black Phone 2", "Horror, Suspense", "Assets/UpComing/blackPhone.jpg"),

  ];

}