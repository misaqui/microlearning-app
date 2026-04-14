import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/post/post_screen.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key, required this.title, required this.ideas, required this.reads, required this.shadowColor, required this.imageUrl});

  final String title; 
  final String ideas;
  final String reads;
  final String imageUrl;
  final Color shadowColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => PostScreen())
        );
      },
      child: SizedBox(
        width: 120,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: shadowColor,
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                    imageUrl, 
                    fit: BoxFit.cover,
                    height: 160,
                    width: 120,
                  ),
              ),
            ),

            SizedBox(height: 8,),

            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                Text(
                  "$ideas ideas",
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 12,
                  ),
                ),
                Text(
                  '・',
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "$reads reads",
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}