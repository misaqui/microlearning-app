import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/all_journeys/all_journeys_screen.dart';
import 'package:flutter_application_1/screens/all_journeys/widgets/journey_bottom.dart';

class NewJourney extends StatelessWidget {
  const NewJourney({super.key});

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
                  "Pick a New Journey",
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
              spacing: 8,
              children: [
                ...mockJourneys.map((journey) {
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
                              return JourneyBottom(imageUrl: journey.imageUrl,);
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
                              journey.imageUrl,
                              height: 160,
                              width: 130,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: Text(journey.title),
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
  final String description;
  final String imageUrl;
  final int ideasCount;
  final int durationMinutes;

  const JourneyData({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.ideasCount,
    required this.durationMinutes,
  });
}

final List<JourneyData> mockJourneys = [
  const JourneyData(
    title: "Productivity Hacks",
    description: "Leave work feeling satisfied with what you've accomplished, with help of a few \"productivity hacks\".",
    imageUrl: "https://i.pinimg.com/1200x/56/23/46/5623464dc03e01b13f44c757d8aeb8db.jpg",
    ideasCount: 109,
    durationMinutes: 37,
  ),
  const JourneyData(
    title: "Beat Procrastination",
    description: "A round-up of useful sources to refer to when willpower gets low.",
    imageUrl: "https://i.pinimg.com/736x/40/17/f1/4017f1a554b36be0edd71253b0c0ef15.jpg",
    ideasCount: 99,
    durationMinutes: 33,
  ),
  const JourneyData(
    title: "Making Remote Work, Work",
    description: "We've compiled some hacks to help you embrace flexible work arrangements (and ace them)",
    imageUrl: "https://i.pinimg.com/736x/5c/9f/75/5c9f75891111ddd446c380070d8efbe9.jpg",
    ideasCount: 32,
    durationMinutes: 11,
  ),
  const JourneyData(
    title: "Managing Time Like a Pro",
    description: "This collection will help you make easy routine changes and take back control of your time.",
    imageUrl: "https://i.pinimg.com/736x/75/f0/d6/75f0d6e4b7b285a2b4135c5e8a282353.jpg",
    ideasCount: 88,
    durationMinutes: 30,
  ),
];