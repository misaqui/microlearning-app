import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/explore/widgets/read_audio_button.dart';
import 'package:flutter_application_1/screens/post/post_screen.dart';

class FollowingScreen extends StatelessWidget {
  const FollowingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Following"),
        centerTitle: false,
      ),
      
      body: ListView(
        padding: EdgeInsets.only(bottom: 18, right: 18, left: 18, top: 64),
        children: [
          ...mockFollowing.map((following) {
            return Column(
              spacing: 12,
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: following.color,
                        blurRadius: 50,
                        offset: const Offset(0,0),
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      following.imageUrl,
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Column(
                  spacing: 6,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 6,
                      children: [
                        Icon(Icons.check_circle_outline_rounded, color: Colors.grey,),
                        Text(
                          "${following.count} by ${following.author}",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                    Text(
                      following.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 4,
                      children: [
                        Icon(Icons.edit, color: Colors.grey,),
                        Text(following.author, style: TextStyle(color: Colors.grey),),
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

                SizedBox(height: 32,)
              ],
            );
          })
        ],
      )
    );
  }
}

class FollowingData {
  final String imageUrl;
  final Color color;
  final int count;
  final String write;
  final String name;
  final String author;
  final bool isRead;

  const FollowingData({
    required this.imageUrl,
    required this.color,
    required this.count,
    required this.write,
    required this.name,
    required this.author,
    required this.isRead,
  });
}

final List<FollowingData> mockFollowing = [
  const FollowingData(
    imageUrl: "https://i.pinimg.com/736x/27/e8/f7/27e8f7e5cde73cef92f561051b72101a.jpg",
    color: Colors.blue,
    count: 320,
    write: "The Art of Stoicism",
    name: "Marcus Aurelius",
    author: "Gregory Hays",
    isRead: true,
  ),
  const FollowingData(
    imageUrl: "https://i.pinimg.com/1200x/bd/21/8d/bd218d39ec8c1556621066c73473653d.jpg",
    color: Colors.blue,
    count: 15,
    write: "Morning Routine",
    name: "Personal Growth",
    author: "Self",
    isRead: false,
  ),
  const FollowingData(
    imageUrl: "https://i.pinimg.com/736x/dd/c4/c6/ddc4c6428d5d8506930f8dc066a10bba.jpg",
    color: Colors.deepPurple,
    count: 450,
    write: "Beyond the Horizon",
    name: "Adventure Chronicles",
    author: "Elara Vance",
    isRead: true,
  ),
  const FollowingData(
    imageUrl: "https://i.pinimg.com/1200x/57/74/b4/5774b4feaa0fff6cca8d360516975550.jpg",
    color: Colors.teal,
    count: 89,
    write: "Minimalist Living",
    name: "Simple Life",
    author: "Leo Babauta",
    isRead: false,
  ),
  const FollowingData(
    imageUrl: "https://i.pinimg.com/1200x/8d/e5/9d/8de59dfd676d788b5d26a86359838072.jpg",
    color: Colors.redAccent,
    count: 1200,
    write: "Epic Legends",
    name: "The First Realm",
    author: "Brandon Sanderson",
    isRead: true,
  ),
];