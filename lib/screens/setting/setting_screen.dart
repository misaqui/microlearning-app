import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _isDarkMode = false;

  final Map<String, List<Map<String, dynamic>>> _settingsData = {
    "Subscription": [
      {"title": "My Subscription: Free", "icon": Icons.shield_outlined, "trailing": true},
      {"title": "Restore Purchases", "icon": Icons.restore, "trailing": false},
    ],
    "Content": [
      {"title": "Followed Topics", "icon": Icons.tag, "trailing": true},
      {"title": "Followed Authors", "icon": Icons.person_outline, "trailing": true},
      {"title": "Followed Youtube Channels", "icon": Icons.play_circle_outline, "trailing": true},
      {"title": "Followed Spotify Shows", "icon": Icons.podcasts, "trailing": true},
      {"title": "Notifications", "icon": Icons.notifications_none, "trailing": true},
      {"title": "Email Subscriptions", "icon": Icons.email_outlined, "trailing": true},
      {"title": "Export Library", "icon": Icons.file_upload_outlined, "trailing": true},
    ],
    "Account": [
      {"title": "Personal Information", "icon": Icons.person_outline, "trailing": true},
      {"title": "App Preferences", "icon": Icons.tune, "trailing": true},
      {"title": "App Icon", "icon": Icons.image_outlined, "trailing": true},
      {"title": "Change Password", "icon": Icons.lock_outline, "trailing": true},
    ],
    "Support": [
      {"title": "Rate Us", "icon": Icons.star_border, "trailing": true},
      {"title": "Invite Friends", "icon": Icons.group_add_outlined, "trailing": true},
      {"title": "Contact Us", "icon": Icons.smartphone_rounded, "trailing": true},
      {"title": "Help Center", "icon": Icons.info_outline, "trailing": true},
    ],
    "Legal": [
      {"title": "Personal Information", "icon": Icons.person_outline, "trailing": true},
      {"title": "Personal Information", "icon": Icons.person_outline, "trailing": true},
    ],
  };

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: false,
      ),

      body: ListView(
        children: [
          _buildSectionHeader("Appearance"),
          SwitchListTile(
            title: const Text('Dark Mode'),
            secondary: const Icon(Icons.brightness_6),
            value: _isDarkMode,
            onChanged: (bool value) {
              setState(() => _isDarkMode = value);
            },
          ),
          SizedBox(height: 20,),

          _buildSectionHeader("System"),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Language'),
            trailing: const Text('English (US)', style: TextStyle(color: Colors.grey)),
            onTap: () { /* Language Picker */ },
          ),
          Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.red),
            title: const Text('Logout', style: TextStyle(color: Colors.red)),
            onTap: () { /* Handle Logout */ },
          ),
          Divider(),
          SizedBox(height: 20,),

          ..._settingsData.entries.map((section) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionHeader(section.key),
                ...section.value.map((item) => _buildMenuItem(item)),
                SizedBox(height: 20), // Space between sections
              ],
            );
          }),
        ]
      ),
    );
  }

  Widget _buildMenuItem(Map<String, dynamic> item){
    return Column(
      children: [
        ListTile(
          onTap: () {},
          leading: Icon(item['icon']),
          title: Text(item['title']),
          trailing: item['trailing'] == true 
            ? Icon(Icons.chevron_right) 
            : null,
        ),
        const Divider(),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }
}