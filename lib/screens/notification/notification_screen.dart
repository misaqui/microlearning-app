import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        centerTitle: false,
      ),

      body: ListView(
        children: [
          ...List.generate(20, (index) {
            return Column(
              children: [
                ListTile(
                  titleAlignment: ListTileTitleAlignment.top,
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage("https://i.pinimg.com/736x/34/33/9a/34339a6816b5b25e472117cac4791c68.jpg"),
                  ),
                  title: Text("🚀 Be Your Future Self Now", style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text("Act today like the person you want to become"),
                  trailing: Column(
                    children: [
                      Text("10 h"),
                      Icon(Icons.more_horiz)
                    ],
                  ),
                  onTap: (){},
                ),
                Divider(),
              ],
            );
          })
        ],
      ),
    );
  }
}