import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/all_topics/all_topics_screen.dart';
import 'package:flutter_application_1/screens/topic/topic_screen.dart';

class ExploreTopic extends StatelessWidget {
  const ExploreTopic({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      width: double.infinity,
      padding: EdgeInsets.all(14),
      child: Column(
        spacing: 8,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const AllTopicsScreen())
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Explore by Topic",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 20,
              children: [
                for (int i = 0; i < topics.length; i += 2)
                  Column(
                    spacing: 12,
                    children: [
                      _buildTopicCard(context, topics[i]),
                      if (i + 1 < topics.length)
                        _buildTopicCard(context, topics[i + 1]),
                    ],
                  ),

                _buildViewAllButton(context),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildTopicCard(BuildContext context, TopicData topic) {
  return GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TopicScreen(topic: topic.title, emoji: topic.emojiAsset,))
      );
    },

    child: Container(
      margin: EdgeInsets.only(bottom: 4),
      width: 160,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(color: Colors.white38),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade800,
            offset: Offset(0, 4)
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                topic.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              right: -10,
              bottom: -10,
              child: Transform.rotate(
                angle: -0.1,
                child: Text(
                  topic.emojiAsset,
                  style: TextStyle(fontSize: 60),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildViewAllButton(BuildContext context) {
  return GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AllTopicsScreen()),
    ),
    child: Container(
      width: 100,
      height: 212, 
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.arrow_forward, color: Colors.white, size: 32),
          const SizedBox(height: 8),
          const Text("View All", style: TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    ),
  );
}

class TopicData {
  final String title;
  final String emojiAsset;

  const TopicData(this.title, this.emojiAsset);
}

const List<TopicData> topics = [
    TopicData("Science & Nature", "🧬"),
    TopicData("History", "🗿"),
    TopicData("Philosophy", "🏛️"),
    TopicData("Startups", "🚀"),
    TopicData("Health", "🐍"),
    TopicData("Technology & The Future", "📡"),
  ];