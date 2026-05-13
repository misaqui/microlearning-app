import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/profile/profile_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class User extends ConsumerWidget {
  const User({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(profileProvider).user;
    return Container(
      alignment: Alignment.center,
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(user.avatarUrl),
          ),

          Column(
            children: [
              Text(
                user.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(user.username),
            ],
          ),

          Row(
            spacing: 12,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${user.followers} Followers"),
              Text("${user.following} Following"),
            ],
          )
        ],
      )
    );
  }
}