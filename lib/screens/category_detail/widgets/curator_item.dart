import 'package:flutter/material.dart';

class CuratorItem extends StatelessWidget {
  const CuratorItem({super.key, required this.rank, required this.name, required this.handle, required this.isBlueBadge, required this.imageUrl});

  final String rank;
  final String name;
  final String handle;
  final bool isBlueBadge;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 8),
      leading: Stack(
        children: [
          CircleAvatar(backgroundImage: NetworkImage(imageUrl), radius: 25, backgroundColor: Colors.grey[800]),
          Positioned(
            left: 0,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.white,
              child: Text(rank, style: TextStyle(fontSize: 12, color: Colors.black)),
            ),
          )
        ],
      ),
      title: Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
      subtitle: Text(handle, style: TextStyle(color: Colors.grey)),
      trailing: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          side: BorderSide(color: Colors.white),
          shape: StadiumBorder(),
        ),
        child: const Text("Follow"),
      ),
    );
  }
}