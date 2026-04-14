import 'package:flutter/material.dart';

class BookCover extends StatelessWidget {
  const BookCover({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      children: [
        Container(
          width: 180,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 197, 155, 138),
                blurRadius: 100,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://m.media-amazon.com/images/I/91bYsX41DVL._AC_UF1000,1000_QL80_.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),

        SizedBox(height: 0,),

        Column(
          spacing: 10,
          children: [
            SizedBox(
              width: 200,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: 0.05,
                      backgroundColor: Colors.white,
                      color: Colors.green,
                      minHeight: 18,
                    ),
                  ),
                  Text('5%')
                ],
              ),
            ),

            Column(
              children: [
                Text(
                  "How tiny changes create",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "remarkable results",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text("Atomic Habits by James Clear"),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.red
              ),
              child: Text("HABITS", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
            )
          ],
        ),
      ],
    );
  }
}