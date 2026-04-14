import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/library/widgets/ideas_content.dart';
import 'package:flutter_application_1/screens/library/widgets/saved_ideas.dart';
import 'package:flutter_application_1/screens/library/widgets/stashes.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface, 
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Library"),
            Text("4 idea Not synced", style: TextStyle(fontSize: 14),),
          ],
        ),
        actions: [
          IconButton(onPressed: ()=>{}, icon: Icon(Icons.search)),
          IconButton(onPressed: ()=>{}, icon: Icon(Icons.access_time))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 24,
          children: [
            Stashes(),
            SavedIdeas(),
            IdeasContent(),
          ],
        ),
      ),
    );
  }
}