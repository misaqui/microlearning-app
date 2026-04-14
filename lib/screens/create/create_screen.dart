import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/create/widgets/new_post.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface, 
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Create Post"),
            Text("Step 1 of 3", style: TextStyle(fontSize: 14),),
          ],
        ),
        actions: [
          IconButton(onPressed: ()=>{}, icon: Icon(Icons.feedback_outlined)),
          IconButton(onPressed: ()=>{}, icon: Icon(Icons.info_outline))
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          spacing: 24,
          children: [
            NewPost()
          ],
        ),
      ),
    );
  }
}
