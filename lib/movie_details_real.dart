import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MovieDetailsPage extends StatefulWidget {
  final String name;
  final String genre;
  final String description;
  final String url;
  final double price;

  const MovieDetailsPage({
    super.key,
    required this.name,
    required this.genre,
    required this.description,
    required this.url,
    required this.price,
  });

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  List<String> getFormattedDates() {
    final now = DateTime.now();
    final formatter = DateFormat('EEE d');
    return List.generate(7, (index) {
      final date = now.add(Duration(days: index));
      return formatter.format(date);
    });
  }

  int track = 0, quantity = 1;
  bool eight = false;
  bool ten = false;
  bool six = false;

  @override
  Widget build(BuildContext context) {
    final dates = getFormattedDates();
    final screenHeight = MediaQuery.of(context).size.height;
    final total = widget.price * quantity;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.name,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red[900],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: screenHeight * 0.4,
            width: double.infinity,
            child: Image.asset(widget.url, fit: BoxFit.cover),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Card(
              elevation: 4,
              color: Colors.grey[900],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Genre: ${widget.genre}",
                      style: TextStyle(fontSize: 16, color: Colors.red[400]),
                    ),
                    Divider(color: Colors.white54, thickness: 0.5, height: 24),
                    Text(
                      widget.description,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[300],
                        height: 1.5,
                      ),
                    ),
                    Divider(color: Colors.white54, thickness: 0.5, height: 24),
                    Text(
                      "Select Date",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: dates.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              track = index;
                              setState(() {});
                            },
                            child: Container(
                              width: 100,
                              margin: EdgeInsets.only(right: 20.0),
                              decoration: BoxDecoration(
                                color: Color(0xffeed51e),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: track == index ? Colors.white : Colors.black,
                                  width: 5.0,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  dates[index],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Select Time",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              six = true;
                              eight = false;
                              ten = false;
                            });
                          },
                          child: six
                              ? Material(
                            elevation: 10.0,
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Color(0xffeed51e),
                                  width: 5.0,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "06:00 PM",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                              : Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xffeed51e),
                                width: 3.0,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "06:00 PM",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              six = false;
                              eight = true;
                              ten = false;
                            });
                          },
                          child: eight
                              ? Material(
                            elevation: 10.0,
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Color(0xffeed51e),
                                  width: 5.0,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "08:00 PM",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                              : Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xffeed51e),
                                width: 3.0,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "08:00 PM",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              six = false;
                              eight = false;
                              ten = true;
                            });
                          },
                          child: ten
                              ? Material(
                            elevation: 10.0,
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Color(0xffeed51e),
                                  width: 5.0,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "10:00 PM",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                              : Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xffeed51e),
                                width: 3.0,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "10:00 PM",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },
                                child: Icon(Icons.add, color: Colors.white),
                              ),
                              Text(
                                quantity.toString(),
                                style: TextStyle(
                                  color: Color(0xffeed51e),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (quantity > 1) {
                                    setState(() {
                                      quantity--;
                                    });
                                  }
                                },
                                child: Icon(Icons.remove, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 30.0),
                        Container(
                          width: 200,
                          decoration: BoxDecoration(
                            color: Color(0xffeed51e),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white, width: 3.0),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Amount : Rs.${total.toStringAsFixed(0)}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Book Now",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
