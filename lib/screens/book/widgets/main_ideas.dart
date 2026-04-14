import 'package:flutter/material.dart';

// 1. สร้าง Model เพื่อความง่ายในการจัดการข้อมูล
class IdeaItem {
  final String title;
  final String duration;
  final bool isLocked;
  final double progress; // 0.0 - 1.0

  IdeaItem(this.title, this.duration, this.isLocked, this.progress);
}

class MainIdeas extends StatelessWidget {
  MainIdeas({super.key});

  final List<IdeaItem> ideas = [
    IdeaItem("The 1% Rule", "5 min", false, 0.7),
    IdeaItem("Systems over Goals", "5 min", true, 0.0),
    IdeaItem("Identity-Based Habits", "4 min", true, 0.0),
    IdeaItem("Atomic Habits", "4 min", true, 0.0),
    IdeaItem("The Habit Loop", "5 min", true, 0.0),
    IdeaItem("The 4 Laws of Behavior Change", "4 min", true, 0.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Text(
            "Main Ideas",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3E1C14),
            ),
          ),
        ),
        ...ideas.map((idea) => _buildIdeaCard(idea)),
      ],
    );
  }

  Widget _buildIdeaCard(IdeaItem idea) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20), 
        border: Border.all(
          color: idea.isLocked ? Colors.transparent : const Color(0xFFf79978),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFffc0a5),
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        leading: _buildCircularProgressImage(idea),
        title: Text(
          idea.title,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF3E1C14)),
        ),
        subtitle: Text(
          idea.duration,
          style: const TextStyle(color: Color(0xFF3E1C14)),
        ),
        trailing: Icon(
          idea.isLocked ? Icons.lock_outline : Icons.chevron_right,
          color: Color(0xFF4f0704),
        ),
        onTap: () {},
      ),
    );
  }

  Widget _buildCircularProgressImage(IdeaItem idea) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(
            value: idea.progress,
            strokeWidth: 4,
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ),
        ),
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage("https://i.pinimg.com/736x/38/54/00/3854000d6fdd66deef88f662d68015d9.jpg"),
        ),
      ],
    );
  }
}