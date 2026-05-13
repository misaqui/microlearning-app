import 'package:flutter/material.dart';

class Book {
  final String id;
  final String title;
  final String author;
  final String imageUrl;
  final String readCount;
  final String headline;
  final Color firstColor;
  final Color secondColor;
  final Color themeColor;
  final String description;
  final int keyIdeasCount;
  final String timePerIdea;

  const Book({
    required this.id,
    required this.title,
    required this.author,
    required this.imageUrl,
    this.readCount = '',
    this.headline = '',
    this.firstColor = const Color(0xFFf1bfa6),
    this.secondColor = const Color(0xFFe6946d),
    this.themeColor = Colors.blueAccent,
    this.description = '',
    this.keyIdeasCount = 0,
    this.timePerIdea = '4-5 min',
  });
}
