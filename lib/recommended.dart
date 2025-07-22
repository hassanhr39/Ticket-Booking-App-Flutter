class Recommended{

  String name;
  String genre;
  String description;
  String url;
  double price;
  String link;


  Recommended(this.name, this.price, this.genre, this.url, this.link, this.description);

  static List<Recommended> listOfRecommended = [

    Recommended("Deemak", 1000.00,"Thriller, Horror", "Assets/Recommended/deemak.jpg","https://youtu.be/_fqM-8D7rlQ?si=t80UZAUxES2FJYgf", "A family faces disturbing paranormal events that strain the bond between a mother-in-law and daughter-in-law, forcing them to confront whether the real horror is supernatural-or within their own home. Inspired by true events."),
    Recommended("Companion", 750.00,"Dark Comedy, Psychological", "Assets/Recommended/companion.jpg","https://youtu.be/Qr_kX0D3DNA?si=3k8iCJdlTcNNqQJs", "A weekend getaway with friends at a remote cabin turns into chaos after it's revealed that one of the guests is not what they seem."),
    Recommended("Sikander: Rebirth", 1500.00,"Tragedy, Action, Drama", "Assets/Recommended/sikander.jpg","https://youtu.be/in6mSwNbXS0?si=jW_JnkULb4Onc_Y0", "A fiery youth confronts a powerful network of corruption, challenging the status quo and fighting for the common people's rights in a nation gripped by injustice."),
    Recommended("Final Destination", 1500.00,"Supernatural Horror", "Assets/Recommended/final.jpg","https://youtu.be/UWMzKXsY9A4?si=3EFdwfirWrt52B_3", "Plagued by a recurring violent nightmare, a college student returns home to find the one person who can break the cycle and save her family from the horrific fate that inevitably awaits them."),
    Recommended("The Fantastic Four", 1000.00,"Superhero, Action, Sci-Fi", "Assets/Recommended/tf4.jpg","https://youtu.be/pAsmrKyMqaA?si=Blt7f7KZnAqKijVk", "Forced to balance their roles as heroes with the strength of their family bond, the Fantastic Four must defend Earth from a ravenous space god called Galactus and his enigmatic Herald, Silver Surfer."),

  ];

}