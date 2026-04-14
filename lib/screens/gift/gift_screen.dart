import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/gift/widgets/benefit.dart';
import 'package:flutter_application_1/screens/gift/widgets/bottom_gift.dart';

class BenefitData {
  final String title;
  final String subTitle;
  final IconData iconData;
  final Color color;

  const BenefitData({
    required this.title,
    required this.subTitle,
    required this.iconData,
    required this.color,
  });
}

final List<BenefitData> proBenefits = [
  const BenefitData(
    title: 'Personalized Learning',
    subTitle: 'Get tailored recommendations from all 50+ topics & amp up your growth.',
    iconData: Icons.dashboard_customize,
    color: Colors.green,
  ),
  const BenefitData(
    title: 'Unlimited Learning Journeys',
    subTitle: 'Start as many journeys as you wish, concurrently. This unlocks the full power.',
    iconData: Icons.auto_stories,
    color: Colors.amber,
  ),
  const BenefitData(
    title: 'Save Unlimited Ideas',
    subTitle: 'Save every idea you like & find it later, organized.',
    iconData: Icons.bookmark,
    color: Colors.orange,
  ),
  const BenefitData(
    title: 'Read Later',
    subTitle: 'Finding something cool with no time for it now? Save it for later.',
    iconData: Icons.access_time_filled,
    color: Colors.deepOrange,
  ),
  const BenefitData(
    title: 'Remove All Ads',
    subTitle: 'Get more of the content you like, and none of the pesky distractions.',
    iconData: Icons.block,
    color: Colors.redAccent,
  ),
  const BenefitData(
    title: 'No Internet? No Problem.',
    subTitle: 'Download your ideas so you can keep reading even on the subway.',
    iconData: Icons.cloud_download,
    color: Colors.purple,
  ),
  const BenefitData(
    title: 'Full Reading History',
    subTitle: 'Looking for something you came across last week? Look no further.',
    iconData: Icons.article_rounded,
    color: Color(0xFF63B9E1), // Sky Blue
  ),
  const BenefitData(
    title: 'Listening to Ideas',
    subTitle: "Can't read now? Just press play and put your phone in your pocket.",
    iconData: Icons.library_music_rounded,
    color: Color(0xFF4C87B5), // Steel Blue
  ),
  const BenefitData(
    title: 'Profile Badge',
    subTitle: 'Make your contribution visible & give your profile a shiny badge to stand out.',
    iconData: Icons.verified_user_rounded,
    color: Color(0xFF7CB6E1), // Light Blue
  ),
  const BenefitData(
    title: 'Extra Streak Freezes',
    subTitle: 'Less stress, longer streak. Get extra freezes so you can keep your streak for longer.',
    iconData: Icons.ac_unit_rounded,
    color: Color(0xFF75D1D1), // Teal/Aqua
  ),
];

class GiftScreen extends StatelessWidget {
  const GiftScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfbe3b6),
      extendBody: true,
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: (){
                  Navigator.pop(context);
                }, 
                color: Colors.black,
                icon: Icon(Icons.chevron_left)
              ),
              Row(
                spacing: 6,
                children: [
                  Icon(Icons.local_fire_department, color: Colors.red, size: 32,),
                  Text("Deepstash", style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Text("PRO", style: TextStyle(fontWeight: FontWeight.bold),)
                  )
                ],
              ),
              SizedBox(width: 24,)
            ],
          ),

          Column(
            spacing: 18,
            children: [
              Text("We want to help reach your potential", style: TextStyle(color: Colors.black, fontSize: 16),),
              Image.network("https://i.pinimg.com/1200x/e9/4a/b1/e94ab1e47e8abbebd4787c79c4126d78.jpg"),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  spacing: 18,
                  children: [
                    Divider(
                      color: Colors.grey,
                      indent: 50,
                      endIndent: 50,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFf9d186),
                        borderRadius: BorderRadius.circular(18)
                      ),
                      padding: EdgeInsets.all(12),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Color(0xFFfbe3b6),
                            width: 4,
                          ),
                        ),
                        padding: EdgeInsets.all(18),
                        child: Row(
                          spacing: 12,
                          children: [
                            Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(50)
                              ),
                              child: Icon(Icons.lightbulb),
                            ),
                            Expanded(
                              child: Text(
                                "Pro members are 4.3x more likely to keep their reading habit!",
                                style: TextStyle(
                                  color: Color(0xFF585f68)
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ),
                    
                    Divider(
                      color: Colors.grey,
                      indent: 50,
                      endIndent: 50,
                    ),

                    Text(
                      "What you get with Pro",
                      style: TextStyle(
                        color: Color(0xFF3b3f44),
                        fontSize: 20
                      ),
                    ),
                    ...proBenefits.map((benefit) {
                      return Benefit(
                        title: benefit.title, 
                        subTitle: benefit.subTitle, 
                        iconData: benefit.iconData, 
                        color: benefit.color
                      );
                    })
                  ],
                ),
              )
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomGift()
    );
  }
}