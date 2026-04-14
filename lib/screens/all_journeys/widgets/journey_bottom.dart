import 'package:flutter/material.dart';

class JourneyBottom extends StatelessWidget {
  const JourneyBottom({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(100),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 32),

                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red.withValues(alpha: 1),
                            blurRadius: 100,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          imageUrl,
                          width: 120,
                          height: 140,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    const Text(
                      "Productivity Hacks",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        Icon(Icons.lightbulb_outline, color: Colors.grey, size: 18),
                        SizedBox(width: 4),
                        Text("109 ideas", style: TextStyle(color: Colors.grey)),
                        SizedBox(width: 16),
                        Icon(Icons.access_time, color: Colors.grey, size: 18),
                        SizedBox(width: 4),
                        Text("37 mins", style: TextStyle(color: Colors.grey)),
                        Spacer(),
                        Icon(Icons.share_outlined, color: Colors.white),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Description
                    Text(
                      "Leave work feeling satisfied with what you've accomplished, with help of a few \"productivity hacks\".",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withAlpha(180),
                        fontSize: 15,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 32),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "KEY LEARNINGS",
                        style: TextStyle(
                          color: Colors.white.withAlpha(180),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    _buildLearningItem("How to delegate tasks efficiently"),
                    _buildLearningItem("How to use technology to your advantage"),
                    _buildLearningItem("How to optimize your work environment"),
                    _buildLearningItem("How to prioritize tasks effectively"),

                    SizedBox(height: 32),

                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        spacing: 12,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Topics"),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                _buildTopicChip("📖", "Books"),
                                _buildTopicChip("💡", "Problem Solving"),
                                _buildTopicChip("⚕️", "Health"),
                              ],
                            ),
                          ),
                          Text("CONTENT"),
                          _buildContentItem(
                            imageUrl: "https://m.media-amazon.com/images/S/compressed.photo.goodreads.com/books/1385213494i/18904539.jpg",
                            title: "How to Prioritize Work: 7 Practical Methods for When \"Everything is Important\"",
                            subtitle: "rescuetime.com",
                            isWeb: true,
                          ),
                          _buildContentItem(
                            imageUrl: "https://m.media-amazon.com/images/I/71pqZChaJkL.jpg",
                            title: "Deep Work",
                            subtitle: "Cal Newport",
                            isWeb: false,
                          ),
                          _buildContentItem(
                            imageUrl: "https://m.media-amazon.com/images/I/51zwfHCh3uL._AC_UF1000,1000_QL80_.jpg", 
                            title: "Why music affects your productivity",
                            subtitle: "qz.com",
                            isWeb: true,
                          ),
                          _buildContentItem(
                            imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7n-pk9wfBa4prO4wU5jEDaX5GF39qB1YRIA&s", 
                            title: "Why music affects your productivity",
                            subtitle: "qz.com",
                            isWeb: true,
                          ),
                          _buildContentItem(
                            imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2KuFBHfsxQZK3XSsXtiRqaXOWcRn2MId1Tw&s", 
                            title: "Why music affects your productivity",
                            subtitle: "qz.com",
                            isWeb: true,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          Row(
            children: [
              Expanded(
                flex: 1,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.headphones_outlined, color: Colors.white,),
                  label: const Text("Listen"),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: StadiumBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: StadiumBorder(),
                  ),
                  child: const Text(
                    "Start Journey",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ]
      ),
    );
  }

  Widget _buildLearningItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(
            Icons.circle,
            size: 10,
            color: Colors.red,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color:Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopicChip(String emoji, String label) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(20),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Text(emoji),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildContentItem({required String imageUrl, required String title, required String subtitle, required bool isWeb}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0),
      child: Row(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 24, height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white24, width: 2),
            ),
          ),
          // Thumbnail Image
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(imageUrl, width: 45, height: 70, fit: BoxFit.cover),
          ),
          Expanded(
            child: Column(
              spacing: 6,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Icon(isWeb ? Icons.public : Icons.edit_note, size: 14, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(subtitle, style: TextStyle(color: Colors.grey, fontSize: 13)),
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