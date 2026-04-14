import 'package:flutter/material.dart';

class BottomGift extends StatelessWidget {
  const BottomGift({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFfbe3b6), const Color.fromARGB(0, 255, 255, 255)],
          begin: Alignment.center,
          end: Alignment.topCenter,
        ),
      ),
      padding: EdgeInsets.fromLTRB(24, 32, 24, 24),
      child:
        Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 12,
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF302002)
                ),
                onPressed: (){}, 
                child: Text(
                  "Save 60% today",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                )
              ),
            ),
            Text("Only 739 THB/year", style: TextStyle(color: Colors.black)),
            DefaultTextStyle(
              style: TextStyle(
                color: Colors.black
              ), 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Terms of Service"),
                  VerticalDivider(
                    color: Colors.black,
                    thickness: 1,
                    indent: 8,   
                    endIndent: 8, 
                    width: 1,
                  ),
                  Text("Privacy"),
                  VerticalDivider(),
                  Text("FAQ Subscription")
                ],
              )
            )
          ],
        )
      ,
    );
  }
}