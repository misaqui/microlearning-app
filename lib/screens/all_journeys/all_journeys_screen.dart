import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/all_journeys/widgets/journey_bottom.dart';

class AllJourneysScreen extends StatelessWidget {
  const AllJourneysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF232931), // สีพื้นหลัง Dark แบบในรูป
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "All Journeys",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              "Start Reading",
              style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          ...mockJourneys.map((journey) => GestureDetector(
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
            child: _buildJourneyItem(journey)),
          ),
        ],
      ),
    );
  }

  Widget _buildJourneyItem(JourneyData journey) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              journey.imageUrl,
              width: 120,
              height: 140,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 120, height: 140, color: Colors.grey.shade800,
                child: const Icon(Icons.image, color: Colors.white24),
              ),
            ),
          ),
          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  journey.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  journey.description,
                  style: TextStyle(
                    color: Colors.white.withAlpha(180),
                    fontSize: 14,
                    height: 1.4,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(
                  width: 60,
                  child: Divider(),
                ),

                Row(
                  children: [
                    Text(
                      "${journey.ideasCount} ideas",
                      style: const TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      child: Icon(Icons.circle, size: 4, color: Colors.grey),
                    ),
                    const Icon(Icons.access_time, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      "${journey.durationMinutes} mins",
                      style: const TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
          ),
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