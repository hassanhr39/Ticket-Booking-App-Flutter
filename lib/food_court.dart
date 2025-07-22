import 'package:flutter/material.dart';
import 'food.dart';

class FoodCourtScreen extends StatelessWidget {
  const FoodCourtScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Food & Drinks',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.red[900],
      ),
      body: ListView(
        children: [
          buildSection("Deals & Meals", Food.Deals),
          buildSection("Popcorn", Food.Popcorn),
          buildSection("Snacks & Desserts", Food.Snacks),
          buildSection("Hot Beverages", Food.Hot),
          buildSection("Cold Beverages", Food.Cold),
        ],
      ),
    );
  }

  Widget buildSection(String title, List<Food> list) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        Row(
          children: [
            SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: buildFoodCard(list[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildFoodCard(Food food) {
    return Card(
      color: Colors.grey[900],
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
              child: Image.asset(
                food.url,
                height: 170,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food.name,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Rs. ${food.price.toStringAsFixed(0)}",
                    style: TextStyle(fontSize: 10, color: Colors.yellow),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
