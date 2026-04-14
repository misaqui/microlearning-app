import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/category_detail/category_detail_screen.dart';

const List<Map<String, String>> contents = [
  {
    "text": "Books",
    "emoji": "📖"
  },
  {
    "text": "Padcasts",
    "emoji": "🎧"
  },
  {
    "text": "Videos",
    "emoji": "🎞️"
  },
];

class DiveDeeper extends StatelessWidget {
  const DiveDeeper({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18),
      width: double.infinity,
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              "Dive Deeper into...",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: EdgeInsets.only(right: 14, left: 14, bottom: 20),
              child: Row(
                spacing: 12,
                children: [
                  ...contents.map((content) {
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryDetailScreen(topic: content["text"]!, emoji: content["emoji"]!)));
                      },
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surfaceContainer,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            width: 2,
                            color: Colors.grey.shade800,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade800,
                              offset: Offset(0, 4)
                            )
                          ]
                        ),
                        child: Padding(
                            padding: EdgeInsets.only(top: 12, left: 12),
                            child: SizedBox(
                              height: 120, 
                              width: 120,
                              child: Stack(
                                clipBehavior: Clip.none, 
                                children: [
                                  Text(content["text"]!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                  Positioned(
                                    bottom: -30, 
                                    right: 0,
                                    child: Text(
                                      content["emoji"]!,
                                      style: TextStyle(fontSize: 84),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          )
                      ),
                    );
                  })
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}