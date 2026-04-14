import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/author/author_screen.dart';

class AllAuthorScreen extends StatelessWidget {
  const AllAuthorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text("All Author"),
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
          LayoutBuilder(
            builder: (context, constraints) {
            final itemWidth = (constraints.maxWidth - 18) / 2;
            return Wrap(
              spacing: 18,
              runSpacing: 18,
              children: [
                ...authors.map((author) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => AuthorScreen(name: author.name, imageUrl: author.imageUrl,))
                      );
                    },
                    child: SizedBox(
                      width: itemWidth,
                      child: Column(
                        spacing: 8,
                        children: [
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                author.imageUrl
                              ),
                            ),
                          ),
                          Text(author.name)
                        ],
                      ),
                    )
                  );
                }),
              ],
            );
          }),
        ],
      )
    );
  }
}

class Author {
  final String name;
  final String imageUrl;

  const Author({
    required this.name,
    required this.imageUrl,
  });
}

const List<Author> authors = [
  Author(name: "Lusia Cook", imageUrl: "https://i.pinimg.com/1200x/d9/4c/e2/d94ce20bdd4af1662606c600339c0278.jpg"),
  Author(name: "Ayishas", imageUrl: "https://i.pinimg.com/736x/95/ec/4c/95ec4c53c5f78c71f58e7333c3f904f4.jpg"),
  Author(name: "Miyuki 54", imageUrl: "https://i.pinimg.com/736x/87/8c/d0/878cd0edd9047c60a2248e81e364a9f1.jpg"),
  Author(name: "JHAM", imageUrl: "https://i.pinimg.com/1200x/1e/82/4c/1e824cfafe07da7df718c79f512d04c9.jpg"),
  Author(name: "Skkam", imageUrl: "https://i.pinimg.com/736x/d3/f8/23/d3f823361e52481f9325510b98ecfe09.jpg"),
  Author(name: "SEAN", imageUrl: "https://i.pinimg.com/736x/eb/89/42/eb89420c1789576ceeb660a40b6a0104.jpg"),
];