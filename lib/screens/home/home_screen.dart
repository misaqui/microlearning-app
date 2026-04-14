import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/book/book_screen.dart';
import 'package:flutter_application_1/widgets/camera.dart';
import 'package:flutter_application_1/screens/home/widgets/community_card.dart';
import 'package:flutter_application_1/screens/home/widgets/streak.dart';
import 'package:flutter_application_1/screens/notification/notification_screen.dart';
import 'package:flutter_application_1/widgets/book_card.dart';
import 'package:flutter_application_1/widgets/continue_reading.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({super.key, required this.title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  bool _isStreakOpen = false;

  final List<Map<String, dynamic>> books = [
    {
      "headline": "Build habits that actually stick",
      "title": "Atomic Habits",
      "readCount": "358.2k reads",
      "imageUrl": "https://m.media-amazon.com/images/I/91bYsX41DVL._AC_UF1000,1000_QL80_.jpg",
      "firstColor": const Color(0xFFf1bfa6),
      "secondColor": const Color(0xFFe6946d),
    },
    {
      "headline": "Wake up to the only moment that matters",
      "title": "The Power of Now",
      "readCount": "71.3k reads",
      "imageUrl": "https://m.media-amazon.com/images/I/91eGsYabODL._AC_UF894,1000_QL80_.jpg",
      "firstColor": const Color(0xFFe5cda2),
      "secondColor": const Color(0xFFd0ac6a),
    },
    {
      "headline": "Master yourself before mastering anything else",
      "title": "Ego Is The Enemy",
      "readCount": "89.8k reads",
      "imageUrl": "https://m.media-amazon.com/images/I/71z70m5r7OL._AC_UF1000,1000_QL80_.jpg",
      "firstColor": const Color(0xFFa5d4f5),
      "secondColor": const Color(0xFF6eb7ee),
    },
    {
      "headline": "Transform how you learn with science-backed techniques that actually work",
      "title": "Make It Stick",
      "readCount": "55.1k reads",
      "imageUrl": "https://m.media-amazon.com/images/I/81v0NxNkKSL.jpg",
      "firstColor": const Color(0xFFdcc6f4),
      "secondColor": const Color(0xFFc19eec),
    },
    {
      "headline": "Build wealth with simple steps that actually work",
      "title": "The Barefoot Investor",
      "readCount": "39.5k reads",
      "imageUrl": "https://images.squarespace-cdn.com/content/v1/5eb4889e5e47b4255c41009e/5a9071ed-f597-4cc9-a3ef-46827bbe97b4/Barefoot+Kids+-+Front+Cover.jpg",
      "firstColor": const Color(0xFFe2d1a0),
      "secondColor": const Color(0xFFcab068),
    },
    {
      "headline": "Discover how shared stories conquered the world",
      "title": "Sapiens",
      "readCount": "39.3k reads",
      "imageUrl": "https://api.chulabook.com/images/pid-5025.jpg",
      "firstColor": const Color(0xFFf1bea5),
      "secondColor": const Color(0xFFe6936c),
    },
    {
      "headline": "Recognize cognitive traps and make smarter decisions",
      "title": "The Art of Thinking Clearly",
      "readCount": "80.7k reads",
      "imageUrl": "https://m.media-amazon.com/images/I/71z-Dx8B20L.jpg",
      "firstColor": const Color(0xFFe5cda2),
      "secondColor": const Color(0xFFd1ad6b),
    },
  ];
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0,
            backgroundColor: Theme.of(context).colorScheme.surface,  
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  spacing: 4,
                  children: [
                    Icon(Icons.local_fire_department, color: Colors.red,),
                    Text(widget.title, style: TextStyle(color: Colors.red),),
                  ],
                ),
                Row(
                  spacing: 6,
                  children: [
                    IconButton(onPressed: (){
                      setState(() {
                        _isStreakOpen = !_isStreakOpen;
                      });
                    }, icon: Icon(Icons.local_fire_department)),
                    IconButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NotificationScreen())
                      );
                    }, icon: Icon(Icons.notifications)),
                    IconButton(onPressed: (){
                      showDialog(
                        barrierDismissible: false,
                        context: context, 
                        builder: (BuildContext context) {
                          return Camera();
                        }
                      );
                    }, icon: Icon(Icons.document_scanner_outlined)),
                  ],
                )
              ],
            ),
          ),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 24,
                  children: [
                    Text(
                      "Continue reading", 
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    spacing: 12,
                    children: [
                      ...List.generate(3, (index) {
                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context) => const BookScreen())
                            );
                          },
                          child: SizedBox(
                            width: 300,
                            child: ContinueReadingCard(
                              title: 'Atomic Habits',
                              author: 'James Clear',
                              nextChapter: 'The 1% Rule',
                              progress: 0.05, // 5%
                              imageUrl: 'https://m.media-amazon.com/images/I/91bYsX41DVL._AC_UF1000,1000_QL80_.jpg',
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                )
              ),

              Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  spacing: 24,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Continue reading",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    ...books.map((book) {
                      return FeaturedBookCard(
                        headline: book["headline"],
                        title: book["title"],
                        readCount: book["readCount"],
                        imageUrl: book["imageUrl"],
                        firstColor: book["firstColor"],
                        secondColor: book["secondColor"],
                        onReadTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const BookScreen()),
                          );
                        },
                      );
                    }),

                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "New books added every day 📚✨",
                      ),
                    ),

                    CommunityCard(),
                  ],
                ),
              )
            ],
          )
        ),

        if (_isStreakOpen)
        Positioned.fill( 
          top: kToolbarHeight + MediaQuery.of(context).padding.top, // start under AppBar
          child: Column(
            children: [
              Streak(),

              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => setState(() => _isStreakOpen = false),
                  child: Container(
                    color: Colors.black45,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}