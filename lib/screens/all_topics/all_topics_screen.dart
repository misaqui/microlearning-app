import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/topic/topic_screen.dart';

class AllTopicsScreen extends StatelessWidget {
  const AllTopicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        shape: Border(
          bottom: BorderSide(
            color: Colors.grey.shade800,
            width: 1,
          ),
        ),
        title: Text(
          "All Topics",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(20),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Categories
            _buildCategorySection(context, "CONTENT", [
              _Topic("📚", "Books"),
              _Topic("🎞️", "Videos"),
              _Topic("🎧", "Podcasts"),
            ]),

            _buildCategorySection(context, "PERSONAL GROWTH", [
              _Topic("🪴", "Personal Development"),
              _Topic("🔥", "Motivation & Inspiration"),
              _Topic("📑", "Productivity"),
              _Topic("⏰", "Time Management"),
              _Topic("📅", "Habits"),
            ]),

            _buildCategorySection(context, "LIBERAL ARTS", [
              _Topic("🏛️", "Philosophy"),
              _Topic("⚖️", "Politics"),
              _Topic("🎭", "Society, Arts & Culture"),
              _Topic("🗿", "History"),
              _Topic("💸", "Economics"),
              _Topic("💰", "Money & Investments"),
            ]),

            _buildCategorySection(context, "SCIENCE", [
              _Topic("📡", "Technology & The Future"),
              _Topic("⌨️", "Computer Science"),
              _Topic("👤", "Software Engineering"),
              _Topic("🧮", "Artificial Intelligence"),
              _Topic("🧬", "Science & Nature"),
              _Topic("🪐", "Space"),
              _Topic("🔒", "Cybersecurity"),
              _Topic("🔗", "Cryptocurrency"),
            ]),

            _buildCategorySection(context, "EMOTIONS & CARE", [
              _Topic("🧠", "Psychology"),
              _Topic("❤️", "Love & Relationships"),
              _Topic("🎒", "Parenting"),
            ]),

            _buildCategorySection(context, "SOFT SKILLS", [
              _Topic("🎓", "Learning & Education"),
              _Topic("💬", "Communication"),
              _Topic("🪶", "Reading & Writing"),
              _Topic("💡", "Problem Solving"),
              _Topic("🎨", "Creativity"),
            ]),

            _buildCategorySection(context, "WORK", [
              _Topic("🛍️", "Business"),
              _Topic("💥", "Entrepreneurship"),
              _Topic("🚀", "Startups"),
              _Topic("💼", "Career"),
              _Topic("🛒", "Marketing & Sales"),
              _Topic("👥", "Human Resources"),
              _Topic("📐", "Product & Design"),
              _Topic("♟️", "Strategy"),
              _Topic("👑", "Leadership & Management"),
              _Topic("🧩", "Teamwork"),
              _Topic("🏝️", "Remote Work"),
              _Topic("🗃️", "Corporate Culture"),
            ]),

            _buildCategorySection(context, "MIND & BODY", [
              _Topic("⚕️", "Health"),
              _Topic("🍏", "Food"),
              _Topic("👟", "Exercise & Fitness"),
              _Topic("🌳", "Longevity"),
              _Topic("⭐", "Mental Health"),
              _Topic("☀️", "Mindfulness"),
              _Topic("🌀", "Meditation"),
              _Topic("🕯️", "Religion & Spirituality"),
            ]),

            _buildCategorySection(context, "LEISURE", [
              _Topic("🎳", "Entertainment"),
              _Topic("🏀", "Sports"),
              _Topic("🎬", "Movies & Shows"),
              _Topic("🥁", "Music"),
              _Topic("🛸", "Science Fiction"),
              _Topic("🧑‍🎤", "Anime"),
              _Topic("👜", "Fashion & Beauty"),
              _Topic("✈️", "Travel"),
            ]),
            
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySection(BuildContext context, String title, List<_Topic> topics) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 12),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ),
        Wrap(
          spacing: 10, 
          runSpacing: 10, 
          children: topics.map((topic) => _buildTopicChip(context, topic)).toList(),
        ),
      ],
    );
  }

  Widget _buildTopicChip(BuildContext context, _Topic topic) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TopicScreen(topic: topic.name, emoji: topic.emoji,))
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(20),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(topic.emoji, style: const TextStyle(fontSize: 16)),
            const SizedBox(width: 8),
            Text(
              topic.name,
              style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}

class _Topic {
  final String emoji;
  final String name;
  _Topic(this.emoji, this.name);
}