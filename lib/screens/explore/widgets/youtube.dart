import 'package:flutter/material.dart';

class Youtube extends StatelessWidget {
  const Youtube({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14),
      child: Column(
        spacing: 14,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text( 
                "Fresh from YouTube",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 8,
              children: [
                ...List.generate(6, (index) {
                  return Column(
                    spacing: 8,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          "https://i.pinimg.com/1200x/2f/0d/24/2f0d24028772172987794dd94181b22f.jpg",
                          height: 80,
                          width: 120,
                        ),
                      ),
                      Text("The Imposter Cure")
                    ],
                  );
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}