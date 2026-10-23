import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/main_navigation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const ink = Color(0xFF193E43);
    return MaterialApp(
      title: 'Microlearning Hub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: ink,
          brightness: Brightness.light,
          surface: const Color(0xFFF9F9F5),
        ),
        scaffoldBackgroundColor: const Color(0xFFF9F9F5),
        useMaterial3: true,
      ),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.trackpad,
        },
      ),
      home: const MainNavigation(title: 'Microlearning Hub'),
    );
  }
}
