import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/book/widgets/book_cover.dart';
import 'package:flutter_application_1/screens/book/widgets/book_detail.dart';
import 'package:flutter_application_1/screens/book/widgets/fixed_bottom.dart';
import 'package:flutter_application_1/screens/book/widgets/main_ideas.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFffede0),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: IconButton(
          icon: Container(
            decoration: BoxDecoration(
              color: Colors.white60,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Icon(Icons.chevron_left, color: Colors.black),
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),

      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 24, right: 24),
            child: DefaultTextStyle(
              style: TextStyle(color: Color(0xFF2D0C03)), 
              child: ListView(
                children: [
                  Column(
                    spacing: 24,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: BookCover(),
                      ),
                      BookDetail(),
                      MainIdeas(),
                    ],
                  ),
                  SizedBox(height: 200),
                ],
              ),
            )
          ),
          
          FixedBottom(),
        ],
      ),
    );
  }
}