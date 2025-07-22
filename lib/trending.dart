class Trending{

  String name;
  String genre;
  String description;
  String url;
  double price;
  String link;

  Trending(this.name, this.price, this.genre, this.url, this.link, this.description);

  static List<Trending> listOfTrending = [

    Trending("28 Years Later", 1000.00, "Zombie, Horror, Thriller", "Assets/Trending/28YearsLater.jpg","https://youtu.be/mcvLKldPM08?si=LTPiPbBI13w2HWyN", "A group of survivors of the rage virus live on a small island. When one of the group leaves the island on a mission into the mainland, he discovers secrets, wonders, and horrors that have mutated not only the infected but other survivors."),
    Trending("M3GAN 2.0", 650.00,"Sci-Fi, Horror, Thriller", "Assets/Trending/megan2.0.jpg","https://youtu.be/IYLHdEzsk1s?si=vxnYTkNuR_d2aR4B", "Two years after M3GAN's rampage, her creator, Gemma, resorts to resurrecting her infamous creation in order to take down Amelia, the military-grade weapon who was built by a defense contractor who stole M3GAN's underlying tech."),
    Trending("Jurassic World: Rebirth", 1200.00,"Action, Adventure", "Assets/Trending/jurassicWorld.jpg","https://youtu.be/jan5CFWs9ic?si=xBqS5qLadK6yZ2KW", "Five years post-Jurassic World: Dominion (2022), an expedition braves isolated equatorial regions to extract DNA from three massive prehistoric creatures for a groundbreaking medical breakthrough."),
    Trending("Lilo & Stitch", 900.00,"Comedy, Space Sci-Fi, Drama", "Assets/Trending/liloStitch.jpg","https://youtu.be/VWqJifMMgZE?si=01z_vTtV_8OWmsyo", "A lonely Hawaiian girl befriends a runaway alien, helping to mend her fragmented family."),
    Trending("How Train Dragon", 1000.00,"Action, Adventure", "Assets/Trending/trainDragon.jpg","https://youtu.be/22w7z_lT6YM?si=jl4bepJuDTyQqZ2V", "As an ancient threat endangers both Vikings and dragons alike on the isle of Berk, the friendship between Hiccup, an inventive Viking, and Toothless, a Night Fury dragon, becomes the key to both species forging a new future together."),

  ];

}