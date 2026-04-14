import 'package:flutter/material.dart';

class User extends StatelessWidget {
  const User({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              "https://i.pinimg.com/736x/ef/f6/a5/eff6a59646f0c300b817c0e384972f83.jpg",
            ),
          ),

          Column(
            children: [
              Text(
                "Krit",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("@krit348",)
            ],
          ),

          Row(
            spacing: 12,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("0 Followers"),
              Text("0 Following")
            ],
          )
        ],
      )
    );
  }
}