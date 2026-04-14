import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/all_books/all_books_screen.dart';
import 'package:flutter_application_1/screens/post/post_screen.dart';

class HeavyBook extends StatelessWidget {
  const HeavyBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14),
      child: Column(
        spacing: 14,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => AllBooksScreen())
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text( 
                  "Heavy-Hitting Books",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12,
              children: [
                ...books.map((book) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => PostScreen())
                      );
                    },
                    child: SizedBox(
                      width: 110,
                      child: Column(
                        spacing: 8,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              book.imageUrl,
                              height: 160,
                              width: 110,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: Text(book.title),
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Book {
  final String title;
  final String imageUrl;

  const Book ({
    required this.title,
    required this.imageUrl,
  });
}

final List<Book> books = [
  const Book(title: "The Imposter Cure", imageUrl: "https://i.pinimg.com/736x/39/4a/17/394a1739c3bf37960881d3038caa19fb.jpg"),
  const Book(title: "0705 DESIGN", imageUrl: "https://i.pinimg.com/736x/f8/4c/fe/f84cfec1bf9bf886eaab0023926dd2e9.jpg"),
  const Book(title: "Unseen World", imageUrl: "https://i.pinimg.com/1200x/11/09/4a/11094ab67e5e5c342f70d1112f7562ec.jpg"),
  const Book(title: "The Invisible Boy", imageUrl: "https://i.pinimg.com/736x/ac/ed/5d/aced5d7e31a96e0947765b44b42c81a1.jpg"),
  const Book(title: "Siddhartha", imageUrl: "https://i.pinimg.com/736x/03/e2/bc/03e2bc900e9d44cde0a7625cd7c6c356.jpg"),
  const Book(title: "Mono Michael End", imageUrl: "https://i.pinimg.com/1200x/96/ac/5e/96ac5e6ffdcf39d3ca68baa890c58aa1.jpg"),
];