import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/explore/widgets/book_scan.dart';
import 'package:flutter_application_1/screens/explore/widgets/dive_deeper.dart';
import 'package:flutter_application_1/screens/explore/widgets/explore_topic.dart';
import 'package:flutter_application_1/screens/explore/widgets/following_feed.dart';
import 'package:flutter_application_1/screens/explore/widgets/heavy_book.dart';
import 'package:flutter_application_1/screens/explore/widgets/highlight.dart';
import 'package:flutter_application_1/screens/explore/widgets/new_journey.dart';
import 'package:flutter_application_1/screens/explore/widgets/noteworthy.dart';
import 'package:flutter_application_1/screens/explore/widgets/people.dart';
import 'package:flutter_application_1/screens/explore/widgets/popular_podcast.dart';
import 'package:flutter_application_1/screens/explore/widgets/recommend.dart';
import 'package:flutter_application_1/screens/explore/widgets/start_journey.dart';
import 'package:flutter_application_1/screens/explore/widgets/youtube.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,  
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(100),
          ),
          child: SearchBar(
            hintText: "Search Book...",
            padding: const WidgetStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16.0),
            ),
            onTap: () {},
            onChanged: (_) {},
            leading: const Icon(Icons.search),
          ),
        ),
        actions: [
          ElevatedButton(onPressed: ()=>{}, 
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
          child: Row(
            spacing: 6,
            children: [
              Icon(
                Icons.qr_code_scanner_outlined,
                color: Colors.black,
              ), 
              Text("Scan Book")
            ],
          )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 24,
          children: [
            Recommend(),
            DiveDeeper(),
            BookScan(),
            FollowingFeed(),
            ExploreTopic(),
            NewJourney(),
            Noteworthy(),
            HeavyBook(),
            People(),
            Highlight(),
            PopularPodcast(),
            Youtube(),
            StartJourney(),
          ],
        ),
      ),
    );
  }
}