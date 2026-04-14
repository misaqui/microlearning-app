import 'package:flutter/material.dart';

class PopularPodcast extends StatelessWidget {
  const PopularPodcast({super.key});

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
                "Popular Podcasts",
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
                          "https://i.pinimg.com/736x/ab/6e/5a/ab6e5a3ee95ae417bcf02a3304129d6d.jpg",
                          height: 120,
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