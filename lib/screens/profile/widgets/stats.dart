import 'package:flutter/material.dart';

class Stats extends StatelessWidget {
  const Stats({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Column(
            spacing: 12,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 14, top: 18, right: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Your Stats", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
          
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    spacing: 12,
                    children: [
                      ...List.generate(3, (index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            side: BorderSide(
                              color: Colors.grey,
                              width: 2,
                            )
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 12, top: 12, right: 12),
                            child: Column(
                              spacing: 14,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.workspace_premium, size: 38,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Achievements", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                            Text("3/36 unlocked"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 50,),
                                    Icon(Icons.arrow_forward_ios),
                                  ],
                                ),
          
                                SizedBox(
                                  height: 80,
                                  width: 180,
                                  child: Stack(
                                    children: [
                                      ...List.generate(3, (index) {
                                        return Positioned(
                                          bottom: -15,
                                          left: index * 50,
                                          child: CircleAvatar(
                                            radius: 40,
                                            backgroundImage: NetworkImage(
                                              "https://i.pinimg.com/736x/bf/6d/54/bf6d54b98243e6bf250a89f0e2b6a708.jpg",
                                            ),
                                          ),
                                        );
                                      })
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}