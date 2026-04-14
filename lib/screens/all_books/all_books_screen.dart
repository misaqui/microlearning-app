import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/post/post_screen.dart';

class AllBooksScreen extends StatelessWidget {
  const AllBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text("All Books"),
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(20),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ),
          ),
        ),
      ),

      body: ListView(
        children: [
          LayoutBuilder(builder: (context, constraints) {
            final itemWidth = (constraints.maxWidth - 18) / 2;
            return Wrap(
              spacing: 12,
              runSpacing: 24,
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
                      width: itemWidth,
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

                          Text(
                            book.title,
                          ),
                        ],
                      ),
                    ),
                  );
                })
              ],
            );
          })
        ],
      )
    );
  }
}

class Book {
  final String title;
  final String imageUrl;

  const Book({
    required this.title,
    required this.imageUrl,
  });
}

const List<Book> books = [
  Book(title: "Atomic Habits", imageUrl: "https://i.pinimg.com/1200x/20/d1/a6/20d1a65703a999cd0b39f87d7bb41c1d.jpg"),
  Book(title: "Mindset", imageUrl: "https://i.pinimg.com/1200x/f9/8a/32/f98a32fb7fe51b1aaf5fbe74a878b40c.jpg"),
  Book(title: "Ego is The Enemy", imageUrl: "https://i.pinimg.com/736x/8d/93/68/8d9368b890477286dc40f8dbce974e84.jpg"),
  Book(title: "The Alchemist", imageUrl: "https://i.pinimg.com/736x/49/7f/22/497f22527c6c0b20fb0bbe814ab918b2.jpg"),
  Book(title: "The Book Thief", imageUrl: "https://i.pinimg.com/1200x/f2/2f/2e/f22f2e26f93de36fcaacd35daae5f040.jpg"),
  Book(title: "George Orwell 1984", imageUrl: "https://i.pinimg.com/736x/20/0c/a8/200ca82334dc0e9378d13c0c2f8cbc7d.jpg"),
  Book(title: "The 4-hour workweek", imageUrl: "https://i.pinimg.com/1200x/04/db/7f/04db7f880f8b3287e9071d0fefe1d2bc.jpg"),
  Book(title: "The 5am Club", imageUrl: "https://i.pinimg.com/1200x/b3/2e/71/b32e71908dac60fe09849f6d81f56597.jpg"),
];