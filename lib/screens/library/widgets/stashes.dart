import 'package:flutter/material.dart';

class Stashes extends StatelessWidget {
  const Stashes({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        spacing: 12,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 14, top: 14, right: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Stashes", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),

          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  spacing: 12,
                  children: [
                    ...List.generate(3, (index) {
                      return Column(
                        spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 140,
                            width: 120,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.green, Colors.greenAccent],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight
                              ),
                              borderRadius: BorderRadius.circular(12)
                            ),
                          ),

                          Text("Read Later", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                        ],
                      );
                    })
                  ],
                ),
              )
            )
          )
        ],
      ),
    );
  }
}