import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/post/widgets/bottom_post.dart';
import 'package:flutter_application_1/screens/post/widgets/post_card.dart';
import 'package:flutter_application_1/screens/post/widgets/post_header.dart';
import 'package:flutter_application_1/screens/post/widgets/post_profile.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            spacing: 18,
            children: [
              const SizedBox(height: 18),
              Image.network("https://images.penguinrandomhouse.com/cover/9780143108757", height: 220, width: 160,),
              const SizedBox(height: 18),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("The Smarter Screen", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.mode_edit_outline_outlined),
                        SizedBox(width: 6),
                        Text("Shlomo Benartzi")
                      ],
                    )
                  ],
                ),
              ),

              PostHeader(),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  spacing: 18,
                  children: [
                    ...List.generate(6, (index) {
                      return PostCard(); 
                    })
                  ],
                ),
              ), 

              Padding(
                padding: EdgeInsets.only(bottom: 18),
                child: PostProfile(),
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: const BottomPost(),
    );
  }
}