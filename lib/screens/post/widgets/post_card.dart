import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 4)
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          Text(
            "The dilemma of digital choices",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const Text(
            "“The lesson is simple: human attention has become the sweet crude oil of the twenty-first century.”",
            style: TextStyle(color: Colors.white),
          ),
          const Row(
            spacing: 6,
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 16),
              Text("744 (9)", style: TextStyle(color: Colors.white60)),
              Spacer(),
              Icon(Icons.more_horiz),
              Icon(Icons.ios_share_rounded, color: Colors.white60),
              Icon(Icons.bookmark_border, color: Colors.white60),
            ],
          )
        ],
      ),
    );
  }
}