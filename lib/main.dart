import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/create/create_screen.dart';
import 'package:flutter_application_1/screens/explore/explore_screen.dart';
import 'package:flutter_application_1/screens/gift/gift_screen.dart';
import 'package:flutter_application_1/screens/home/home_screen.dart';
import 'package:flutter_application_1/screens/library/library_screen.dart';
import 'package:flutter_application_1/screens/profile/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          brightness: Brightness.dark
        ),
        useMaterial3: true,
      ),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.trackpad, 
        },
      ),
      home: const MainNavigation(title: 'Deepstash'),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key, required this.title});
  final String title;

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const HomeScreen(title: "Deepstash"),
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
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            color: Colors.blue[700],
            child: Row(
              children: [
                const Icon(Icons.shield, color: Colors.white, size: 20),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    "We want to help reach your potential",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const GiftScreen())
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                  ),
                  child: Text("Claim Now", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,

            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.explore),label: 'Explore',),
              BottomNavigationBarItem(icon: Icon(Icons.library_books), label: 'Library'),
              BottomNavigationBarItem(icon: Icon(Icons.create), label: 'Create'),
              BottomNavigationBarItem(icon: CircleAvatar(
                backgroundImage: NetworkImage("https://i.pinimg.com/1200x/fc/7d/83/fc7d837c5c1e43f8cf81253e35b7806b.jpg"),
              ), label: "Profile"),
            ],
            currentIndex: _selectedIndex,
            // selectedItemColor: Theme.of(context).colorScheme.inversePrimary,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey[600],
            onTap: _onItemTapped,
          ),
        ],
      ),
    );
  }
}
