import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/create/create_screen.dart';
import 'package:flutter_application_1/screens/explore/explore_screen.dart';
import 'package:flutter_application_1/screens/gift/gift_screen.dart';
import 'package:flutter_application_1/screens/home/home_screen.dart';
import 'package:flutter_application_1/screens/library/library_screen.dart';
import 'package:flutter_application_1/screens/profile/profile_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key, required this.title, this.pages});

  final String title;
  /// Optional test pages to verify navigation without external image requests.
  final List<Widget>? pages;

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const HomeScreen(title: "Microlearning"),
    const ExploreScreen(),
    const LibraryScreen(),
    const CreateScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    if(index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        ),
      );
    }else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: (widget.pages ?? _pages).elementAt(_selectedIndex),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).colorScheme.surface,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.auto_awesome_outlined), label: 'Discover'),
            BottomNavigationBarItem(icon: Icon(Icons.explore_outlined), label: 'Explore'),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark_outline), label: 'Library'),
            BottomNavigationBarItem(icon: Icon(Icons.edit_outlined), label: 'Create'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}