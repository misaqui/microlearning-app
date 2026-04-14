import 'package:flutter/material.dart';

class InviteFriendScreen extends StatelessWidget {
  const InviteFriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(14),
        child: ListView(
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "X1 ", 
                    style: TextStyle(color: Colors.blue, fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "Invite for",
                    style: TextStyle(fontSize: 32),
                  ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "X1 ", 
                    style: TextStyle(color: Colors.blue, fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "Month Pro! 🎁",
                    style: TextStyle(fontSize: 32),
                  ),
                ],
              ),
            ),

            Text("For each friend you bring to Deepstash you get one month of Pro!"),
            
            SizedBox(height: 40,),

            Text(
              "Invite Your Friends",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
            Text("Allow access to your contacts in order to be able to invite your friends."),
            SizedBox(height: 12,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 12)
              ),
              onPressed: (){}, 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 8,
                children: [
                  Icon(Icons.settings, color: Colors.black, size: 32,),
                  Text("Open Settings", style: TextStyle(fontSize: 18),)
                ],
              )
            ),

            SizedBox(height: 40,),

            Text("Check Privacy Plicy for Contacts Sync Feature"),
            Text("INVITE VIA"),

            SizedBox(height: 12,),

            ElevatedButton(
              onPressed: (){}, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 12)
              ),
              child: Row(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.message, size: 32, color: Colors.white,),
                  Text("Text Message", style: TextStyle(fontSize: 18),)
                ],
              )
            ),

            SizedBox(height: 12,),

            Row(
              spacing: 12,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                  onPressed: (){}, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 22)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 8,
                      children: [
                        Icon(Icons.link, size: 32, color: Colors.black,),
                        Text("Copy Link", style: TextStyle(fontSize: 18))
                      ],
                    )
                  ),
                ),

                Expanded(
                  child: ElevatedButton(
                    onPressed: (){}, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 22)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 8,
                      children: [
                        Icon(Icons.more_horiz_outlined, size: 32, color: Colors.black,),
                        Text("Others", style: TextStyle(fontSize: 18))
                      ],
                    )
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}