import 'package:flutter/material.dart';

class People extends StatelessWidget {
  const People({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.blue, const Color.fromARGB(255, 29, 87, 186)])
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 18, left: 18, bottom: 18),
            child: Column(
              spacing: 6,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    Icon(Icons.more_horiz),
                    Text("WHO TO FOLLOW")
                  ],
                ),
                Text(
                  "Soyam Kapasiya",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("@ismenaw."),
                SizedBox(
                  height: 60,
                ),
                Row(
                  spacing: 8,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white
                      ),
                      onPressed: ()=>{}, 
                      child: Text(
                        "Follow",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      )
                    ),
                    Row(
                      spacing: 4,
                      children: [
                        Text("View More"),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: -30,
            bottom: -20,
            child: Transform.rotate(
              angle: -0.1, 
              child: Container(
                width: 160,
                height: 220,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('https://i.pinimg.com/736x/e9/3c/27/e93c27ffbb611b5480d50e3227219e25.jpg'),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(80),
                      blurRadius: 10,
                      offset: const Offset(-5, 5),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}