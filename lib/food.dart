class Food {

  String name;
  String url;
  double price;

  Food(this.name, this.price, this.url);

  static List<Food> Deals = [

    Food("Deal 1", 950.00 , "Assets/Food/deal.jpg"),
    Food("Deal 2", 2250.00 , "Assets/Food/deal.jpg"),
    Food("Deal 3", 5500.00 , "Assets/Food/deal.jpg"),

  ];

  static List<Food> Popcorn = [

    Food("Small Popcorn", 400.00 , "Assets/Food/popcorn.jpg"),
    Food("Medium Popcorn", 450.00 , "Assets/Food/popcorn.jpg"),
    Food("Large Popcorn", 500.00 , "Assets/Food/popcorn.jpg"),

  ];

  static List<Food> Snacks = [

    Food("Nachos", 1200.00 , "Assets/Food/nachos.jpg"),
    Food("Chips", 100.00 , "Assets/Food/chips.jpg"),
    Food("New York Hot Dog", 950.00 , "Assets/Food/hotdog.jpg"),
    Food("M&Ms", 500.00 , "Assets/Food/mnms.jpg"),
    Food("Cocomo Large", 250.00 , "Assets/Food/cocomo.jpg"),

  ];

  static List<Food> Hot = [

    Food("Black Coffee", 550.00 , "Assets/Food/coffee.jpg"),
    Food("Cappuccino", 500.00 , "Assets/Food/coffee.jpg"),
    Food("Latte", 500.00 , "Assets/Food/coffee.jpg"),
    Food("Tea", 400.00 , "Assets/Food/coffee.jpg"),
    Food("Green Tea", 350.00 , "Assets/Food/coffee.jpg"),

  ];

  static List<Food> Cold = [

    Food("Water Bottle", 200.00 , "Assets/Food/water.jpg"),
    Food("Pepsi", 300.00 , "Assets/Food/pepsi.jpg"),

  ];
}