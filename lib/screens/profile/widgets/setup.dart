import 'package:flutter/material.dart';

class Setup extends StatelessWidget {
  const Setup({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: Colors.grey,
              width: 2
            )
          ),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Amplify your profile",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text("Set up your avatar, bio & more"),
                    Row(
                      spacing: 6,
                      children: [
                        Icon(Icons.arrow_forward, color: Colors.pinkAccent,),
                        Text(
                          "Amplify your profile",
                          style: TextStyle(color: Colors.pinkAccent),
                        ),
                      ],
                    )
                  ],
                ),

                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    "https://i.pinimg.com/1200x/72/e2/8d/72e28d233d2e37681d57d120dd0e84fb.jpg",
                    height: 100,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}