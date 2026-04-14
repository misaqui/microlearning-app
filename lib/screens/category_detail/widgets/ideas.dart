import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/explore/widgets/read_audio_button.dart';
import 'package:flutter_application_1/screens/post/post_screen.dart';

class BookData {
  final String title;
  final String author;
  final String imageUrl;
  final Color themeColor;

  const BookData({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.themeColor,
  });
}

final List<BookData> recommendBooks = [
  const BookData(
    title: "Unlimited Power",
    author: "Tony Robbins",
    imageUrl: "https://m.media-amazon.com/images/I/71OJtpj-zLL._AC_UF1000,1000_QL80_.jpg",
    themeColor: Colors.amber,
  ),
  const BookData(
    title: "Atomic Habits",
    author: "James Clear",
    imageUrl: "https://m.media-amazon.com/images/I/91bYsX41DVL.jpg",
    themeColor: Colors.blueAccent,
  ),
  const BookData(
    title: "Deep Work",
    author: "Cal Newport",
    imageUrl: "https://m.media-amazon.com/images/I/71pqZChaJkL.jpg",
    themeColor: Colors.redAccent,
  ),
];

class Ideas extends StatefulWidget {
  const Ideas({super.key});

  @override
  State<Ideas> createState() => _IdeasState();
}

class _IdeasState extends State<Ideas> {
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(vertical: 24),
      width: double.infinity,
      decoration: BoxDecoration(
      ),
      child: Center(
        child: Column(
          spacing: 18,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ideas",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (){}, 
                    child: Text("New")
                  )
                ],
              ),
            ),

            Column(
              spacing: 48,
              children: [
                ...recommendBooks.map((book) {
                  return Column(
                    spacing: 12,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: book.themeColor,
                              blurRadius: 50,
                              offset: const Offset(0,0),
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            book.imageUrl,
                            width: 150,
                            height: 220,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      Column(
                        children: [
                          Text(
                            book.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 4,
                            children: [
                              Icon(Icons.edit),
                              Text(book.author),
                            ],
                          )
                        ],
                      ),

                      Row(
                        spacing: 12,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(onPressed: ()=>{}, icon: Icon(Icons.more_horiz)),
                          ReadAudioButton(onReadTap: ()=>{
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const PostScreen()))
                          }, onAudioTap: ()=>{}),
                          IconButton(onPressed: ()=>{}, icon: Icon(Icons.loop)),
                        ],
                      ),
                    ],
                  );
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}