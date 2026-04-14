import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/invite_friend/invite_friend_screen.dart';
import 'package:flutter_application_1/screens/profile/widgets/feedback.dart';
import 'package:flutter_application_1/screens/profile/widgets/invite_friends.dart';
import 'package:flutter_application_1/screens/profile/widgets/setup.dart';
import 'package:flutter_application_1/screens/profile/widgets/share_user.dart';
import 'package:flutter_application_1/screens/profile/widgets/stats.dart';
import 'package:flutter_application_1/screens/profile/widgets/user.dart';
import 'package:flutter_application_1/screens/setting/setting_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => const InviteFriendScreen())
            );
          }, icon: Icon(Icons.group_add_outlined)),
          IconButton(onPressed: (){
            showModalBottomSheet(
              context: context,
              isScrollControlled: true, 
              builder: (context) {
                return ShareUser(); 
              },
            );
          }, icon: Icon(Icons.ios_share)),
          IconButton(onPressed: (){
            showModalBottomSheet(
              context: context,
              isScrollControlled: true, 
              builder: (context) {
                return FeedbackShare(); 
              },
            );
          }, icon: Icon(Icons.feedback_outlined)),
          IconButton(onPressed: (){
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (contex) => const SettingScreen())  
            );
          }, icon: Icon(Icons.settings)
        ),
        ],
      ),

      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 200),
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  top: -200,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceBright,
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(200)),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
                
                Column(
                  spacing: 18,
                  children: [
                    SizedBox(height: 0),
                    User(),
                    InviteFriends(),
                    Stats(),
                    Setup(),
                  ],
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}