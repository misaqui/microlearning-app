import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/explore/explore_viewmodel.dart';
import 'package:flutter_application_1/screens/explore/widgets/read_audio_button.dart';
import 'package:flutter_application_1/screens/post/post_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Recommend extends ConsumerStatefulWidget {
  const Recommend({super.key});

  @override
  ConsumerState<Recommend> createState() => _RecommendState();
}

class _RecommendState extends ConsumerState<Recommend> {
  final PageController _pageController = PageController(viewportFraction: 0.7);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final books = ref.watch(exploreProvider).recommendBooks;
    final currentBook = books[_currentPage];

    return Container(
      padding: EdgeInsets.symmetric(vertical: 24),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[700]
      ),
      child: Center(
        child: Column(
          spacing: 18,
          children: [
            Text(
              "BOOK BONANZA",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: currentBook.themeColor.withAlpha(180),
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 250,
                  child: PageView.builder(
                    clipBehavior: Clip.none,
                    controller: _pageController,
                    onPageChanged: (index) => setState(() => _currentPage = index),
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      final book = books[index];
                      // double scale = _currentPage == index ? 1.0 : 0.8;

                      return TweenAnimationBuilder(
                        duration: const Duration(milliseconds: 350),
                        tween: Tween(begin: 1.0, end: 1.0),
                        builder: (context, double value, child) {
                          return Transform.scale(
                            scale: value,
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: _currentPage == index ? book.themeColor.withValues(alpha: 0.2) : Colors.transparent,
                                      blurRadius: 100,
                                      offset: const Offset(0,0),
                                      spreadRadius: 100,
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    book.imageUrl,
                                    width: 150,
                                    height: 220,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),

                Positioned(
                  left: 10,
                  child: IconButton(
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.linear,
                      );
                    },
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
                  ),
                ),

                Positioned(
                  right: 10,
                  child: IconButton(
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.linear,
                      );
                    },
                    icon: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 30),
                  ),
                ),
              ],
            ),

            Column(
              children: [
                Text(
                  currentBook.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  ),
                ),
                Text(currentBook.author),
              ],
            ),

            Row(
              spacing: 12,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: ()=>{}, icon: Icon(Icons.shuffle)),
                ReadAudioButton(onReadTap: ()=>{
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PostScreen()))
                }, onAudioTap: ()=>{}),
                IconButton(onPressed: ()=>{}, icon: Icon(Icons.loop)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}