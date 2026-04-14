import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/following/following_screen.dart';
import 'package:flutter_application_1/screens/post/post_screen.dart';

class FollowingFeed extends StatelessWidget {
  const FollowingFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF5e1158), Color(0xFF360b81)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        )
      ),
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 18, left: 18, right: 18),
            child: Row(
              spacing: 6,
              children: [
                SizedBox(
                  height: 40,
                  width: 40 + (profiles.length * 25.0),
                  child: Stack(
                    children: profiles.asMap().entries.map((profile) {
                      int index = profile.key;
                      String imageUrl = profile.value;

                      return Positioned(
                        height: 40,
                        left: index * 30,
                        child: Container(
                          padding: const EdgeInsets.all(2), 
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(imageUrl),
                          ),
                        )
                      );
                    }).toList(),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Following Feed",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "5 New Posts",
                      style: TextStyle(

                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: EdgeInsets.only(left: 18, right: 18),
              child: Row(
                spacing: 10,
                children: [
                  ...books.map((book) {
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PostScreen(),
                          ),
                        );
                      },
                      child: SizedBox(
                        width: 190,
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.all(24),
                            child: Column(
                              spacing: 16,
                              children: [
                                Image.network(
                                  book["image"],
                                  height: 120,
                                  width: 100,
                                ),
                                
                                Column(
                                  spacing: 6,
                                  children: [
                                    Text(
                                      book["name"],
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),

                                    Row(
                                      spacing: 4,
                                      children: [
                                        Icon(Icons.edit_outlined, size: 18,),
                                        Text(book["author"]),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ),
                      ),
                    );
                  })
                ],
              ),
            )
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => FollowingScreen())
              );
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 18, left: 18, right: 18, top: 12),
              child: Row(
                spacing: 6,
                children: [
                  Icon(Icons.arrow_right_alt),
                  Text("View All"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

const List<String> profiles = [
  "https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/ChatGPT_logo.svg/1280px-ChatGPT_logo.svg.png",
  "https://i.pinimg.com/1200x/4d/14/89/4d1489adc39294dcc6307f007456f135.jpg",
  "https://i.pinimg.com/1200x/5d/0a/bc/5d0abca406b3d7449de0af15615c2e9a.jpg"
];

const List<Map<String, dynamic>> books = [
  {
    "image": "https://bci.kinokuniya.com/jsp/images/book-img/97805/97805450/9780545010221.JPG",
    "name": "Harry Potter and the Deathly Hallows",
    "author": "J.K. Rowling"
  },
  {
    "image": "https://m.media-amazon.com/images/I/51kFGG67bVL._AC_UF1000,1000_QL80_.jpg",
    "name": "Why is DNA important?",
    "author": "J.K. Rowling"
  },
  {
    "image": "https://m.media-amazon.com/images/I/71lDUGfRa8L._AC_UF1000,1000_QL80_.jpg",
    "name": "The Momentum Equation: How to Start When You Have Zero Motivation",
    "author": "J.K. Rowling"
  },
  {
    "image": "https://m.media-amazon.com/images/I/51uaTe7NjsL._AC_UF1000,1000_QL80_.jpg",
    "name": 'The Philosophy of "Hell Yes" or "NO"',
    "author": "J.K. Rowling"
  }
];