import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/category_detail/widgets/curator_item.dart';
import 'package:flutter_application_1/screens/category_detail/widgets/ideas.dart';
import 'package:flutter_application_1/screens/category_detail/widgets/journey_card.dart';

const List<Map<String, dynamic>> curators = [
  {
    "rank": "1", 
    "name": "Prince Rahul", 
    "handle": "@prince_rahul", 
    "isBlueBadge": true, 
    "imageUrl": 'https://i.pinimg.com/1200x/80/49/b5/8049b58cd17dcd1ce97941f8348c1076.jpg',
  },
  {
    "rank": "2", 
    "name": "Suman Saha", 
    "handle": "@ssuman24", 
    "isBlueBadge": false, 
    "imageUrl": 'https://i.pinimg.com/736x/c5/75/a4/c575a4c2370bd46c3d84e44def369cd4.jpg'
  },
  {
    "rank": "3", 
    "name": "Anup Chouhan", 
    "handle": "@anupchouhan", 
    "isBlueBadge": false, 
    "imageUrl": 'https://i.pinimg.com/736x/f5/d0/12/f5d0121eadab5dacd9c4cfe9d55a6eb0.jpg'
  }
];

class TopicScreen extends StatefulWidget {
  const TopicScreen({super.key, required this.topic, required this.emoji});

  final String topic;
  final String emoji;

  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {

  double _opacity = 0;
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _opacity = (_controller.offset / 140).clamp(0, 1).toDouble();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(widget.topic, style: TextStyle(color: Colors.white.withValues(alpha: _opacity)),),
        backgroundColor: Theme.of(context).colorScheme.surfaceBright.withValues(alpha: _opacity),
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: StadiumBorder(),
              ),
              child: Text("Follow"),
            ),
          )
        ],
      ),
       body: ListView(
        controller: _controller,
        padding: EdgeInsets.zero,
        clipBehavior: Clip.none,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.red.shade900,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(100)),
                  shape: BoxShape.rectangle
                ),
              ),

              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 18, right: 18, bottom: 18, top: MediaQuery.of(context).padding.top + 32),
                      child: Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 8,
                            children: [
                              Text(widget.emoji, style: TextStyle(fontSize: 80)),
                              Text(widget.topic, style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold)),
                              Text("73K ideas  •  1.3M Followers", style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildStatColumn("4", "saved"),
                              Container(width: 2, height: 30, color: Colors.white.withAlpha(100)),
                              _buildStatColumn("⭐ 2", "level"),
                            ],
                          ),

                          SizedBox(height: 32),
                          
                          _buildSectionHeader("Top Curators"),
                          ...curators.map((curator) {
                            return CuratorItem(rank: curator["rank"], name: curator["name"], handle: curator["handle"], isBlueBadge: curator["isBlueBadge"], imageUrl: curator["imageUrl"]);
                          }),

                          SizedBox(height: 32),
                          _buildSectionHeader("Journeys"),
                        ],
                      ),
                  ),

                  SizedBox(
                    height: 250,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          children: [
                            JourneyCard(image: "https://i.pinimg.com/1200x/53/cd/64/53cd64728bdb6fbb209af779edfcb796.jpg", title: "What Top CEO's Read"),
                            JourneyCard(image: "https://i.pinimg.com/1200x/b0/8e/50/b08e5085a3e91f9aae7a433f3b183b8d.jpg", title: "Best Seller - NY Times"),
                            JourneyCard(image: "https://i.pinimg.com/1200x/85/51/f8/8551f8a1b03f1bcfaaa6e49351cf6975.jpg", title: "Soft Resilience"),
                          ],
                        ),
                      )
                    ),
                  ),

                  Ideas(),
                ],
              )
            ],
          ),
        ],
       )
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        Icon(Icons.chevron_right, color: Colors.grey),
      ],
    );
  }

  Widget _buildStatColumn(String val, String label) {
    return Column(
      children: [
        Text(val, style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}