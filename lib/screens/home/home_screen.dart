import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/book/book_screen.dart';
import 'package:flutter_application_1/screens/home/home_viewmodel.dart';
import 'package:flutter_application_1/widgets/camera.dart';
import 'package:flutter_application_1/screens/home/widgets/community_card.dart';
import 'package:flutter_application_1/screens/home/widgets/streak.dart';
import 'package:flutter_application_1/screens/notification/notification_screen.dart';
import 'package:flutter_application_1/widgets/book_card.dart';
import 'package:flutter_application_1/widgets/continue_reading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  final String title;
  const HomeScreen({super.key, required this.title});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeProvider);

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
                    Icon(Icons.local_fire_department, color: Colors.red),
                    Text(widget.title, style: TextStyle(color: Colors.red)),
                  ],
                ),
                Row(
                  spacing: 6,
                  children: [
                    IconButton(
                      onPressed: () =>
                          ref.read(homeProvider.notifier).toggleStreak(),
                      icon: Icon(Icons.local_fire_department),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NotificationScreen()),
                        );
                      },
                      icon: Icon(Icons.notifications),
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) => Camera(),
                        );
                      },
                      icon: Icon(Icons.document_scanner_outlined),
                    ),
                  ],
                ),
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
                      ...state.readingProgress.map((entry) {
                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BookScreen()),
                            );
                          },
                          child: SizedBox(
                            width: 300,
                            child: ContinueReadingCard(
                              title: entry.book.title,
                              author: entry.book.author,
                              nextChapter: entry.nextChapter,
                              progress: entry.progress,
                              imageUrl: entry.book.imageUrl,
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
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

                    ...state.featuredBooks.map((book) {
                      return FeaturedBookCard(
                        headline: book.headline,
                        title: book.title,
                        readCount: book.readCount,
                        imageUrl: book.imageUrl,
                        firstColor: book.firstColor,
                        secondColor: book.secondColor,
                        onReadTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BookScreen()),
                          );
                        },
                      );
                    }),

                    Container(
                      alignment: Alignment.center,
                      child: Text("New books added every day 📚✨"),
                    ),

                    CommunityCard(),
                  ],
                ),
              ),
            ],
          ),
        ),

        if (state.isStreakOpen)
          Positioned.fill(
            top: kToolbarHeight + MediaQuery.of(context).padding.top,
            child: Column(
              children: [
                Streak(),
                Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () =>
                        ref.read(homeProvider.notifier).closeStreak(),
                    child: Container(color: Colors.black45),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}