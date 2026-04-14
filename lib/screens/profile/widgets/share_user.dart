import 'package:flutter/material.dart';

class ShareUser extends StatelessWidget {
  const ShareUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 40),
      child: Column(
        spacing: 18,
        mainAxisSize: MainAxisSize.min, 
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Share User",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white70
                ),
                child: Center(
                  child: Column(
                    spacing: 4,
                    children: [
                      CircleAvatar(backgroundImage: NetworkImage("https://i.pinimg.com/1200x/fc/7d/83/fc7d837c5c1e43f8cf81253e35b7806b.jpg"), radius: 50,),
                      Text("Krit", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                      Text("@krit348", style: TextStyle(color: Colors.black),)
                    ],
                  ),
                ),
              ),

              Text("SHARE TO"),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 12,
                  children: [
                    ...List.generate(8, (index) {
                      return Column(
                        spacing: 6,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blue, 
                              shape: BoxShape.circle, 
                            ),
                            padding: EdgeInsets.all(8), 
                            child: Icon(
                              Icons.facebook,
                              color: Colors.white, 
                            ),
                          ),
                          Text("Facebook")
                        ],
                      );
                    })
                  ],
                )
              ),

              Text("SHARE LINK"),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Color(0xFF3E4149), 
                  borderRadius: BorderRadius.circular(50), 
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'https://dsta.sh/498nKp',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black87,
                        shape: StadiumBorder(),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      ),
                      child: const Text(
                        'Copy',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}