import 'package:flutter/material.dart';

class InviteFriends extends StatelessWidget {
  const InviteFriends({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 28),
      width: double.infinity,
      color: Colors.blue,
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 12,
                  children: [
                    Icon(Icons.group_add, size: 42,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Invite Friends.", style: TextStyle(fontSize: 18, color: Colors.white),),
                        Text("Get Rewarded.", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                      ],
                    )
                  ],
                ),

                Row(
                  spacing: 8,
                  children: [
                    Icon(Icons.arrow_forward),
                    Text("View")
                  ],
                )
              ],
            ),

            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                "https://i.pinimg.com/736x/40/88/7e/40887e823d938eb52ae2618d30ab8034.jpg",
                height: 100,
              ),
            )
          ],
        ),
      )
    );
  }
}