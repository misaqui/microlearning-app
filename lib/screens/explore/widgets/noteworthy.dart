import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/all_journeys/all_journeys_screen.dart';
import 'package:flutter_application_1/screens/all_journeys/widgets/journey_bottom.dart';

class Noteworthy extends StatelessWidget {
  const Noteworthy({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14),
      child: Column(
        spacing: 14,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AllJourneysScreen()) 
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text( 
                  "New & Noteworthy",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                ...mockNoteworthy.map((noteworthy) {
                  return GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return DraggableScrollableSheet(
                            initialChildSize: 0.8, 
                            minChildSize: 0.4,
                            maxChildSize: 0.9,
                            expand: false,
                            builder: (context, scrollController) {
                              return JourneyBottom(imageUrl: noteworthy.imageUrl,);
                            }
                          );
                        },
                      );
                    },
                    child: SizedBox(
                      width: 130,
                      child: Column(
                        spacing: 8,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              noteworthy.imageUrl,
                              height: 160,
                              width: 130,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: Text(noteworthy.title)
                          )
                        ],
                      ),
                    ),
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

class JourneyData {
  final String title;
  final String imageUrl;

  const JourneyData({
    required this.title,
    required this.imageUrl,
  });
}

final List<JourneyData> mockNoteworthy = [
  const JourneyData(
    title: "Introduction to Web 3.0",
    imageUrl: "https://i.pinimg.com/1200x/7c/b6/e2/7cb6e21cdee3dbfbc39fad23fb531977.jpg",
  ),
  const JourneyData(
    title: "How to Cope With Intrusive Thoughts",
    imageUrl: "https://i.pinimg.com/736x/30/bc/23/30bc234f31bc76cee5f4b0af41afce88.jpg",
  ),
  const JourneyData(
    title: "How to Live Sustainably",
    imageUrl: "https://i.pinimg.com/736x/28/5e/d9/285ed9be300bf1c265a2793de0283306.jpg",
  ),
  const JourneyData(
    title: "Countering The Great Resignation",
    imageUrl: "https://i.pinimg.com/1200x/18/af/7c/18af7c3fcadc1e851d39708fa8038c64.jpg",
  ),
];