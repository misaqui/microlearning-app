import 'package:flutter/material.dart';

class Benefit extends StatelessWidget {
  const Benefit({
    super.key,
    required this.title,
    required this.subTitle,
    required this.iconData,
    required this.color
  });

  final String title;
  final String subTitle;
  final IconData iconData;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: SizedBox(
        width: 70,
        child: Row(
          spacing: 8,
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color.lerp(color, Colors.white, 0.9),
              ),
              child: Icon(
                Icons.check, 
                size: 20, 
                weight: 700,
                color: color.withAlpha(100),
              ),
            ),
            Icon(
              iconData, 
              size: 32, 
              color: color,
            ),
          ],
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w500
        ),
      ),
      subtitle: Text(
        subTitle,
        style: TextStyle(
          color: Color(0xFF585f68)
        ),
      ),
    );
  }
}