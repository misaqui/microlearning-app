import 'package:flutter/material.dart';

class FixedBottom extends StatelessWidget {
  const FixedBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 24,
      right: 24,
      bottom: 32,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 80, offset: Offset(0, 40))],
        ),
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "#1",
                  style: TextStyle(
                    color: Color(0xFF2D0C03),
                    fontWeight: FontWeight.w500
                  ),
                ),
                Text(
                  "The 1% Rule",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF2D0C03),
                    fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
        
            Row(
              spacing: 12,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2D0C03),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    onPressed: (){}, 
                    child: Text("Continue Reading", style: TextStyle(fontSize: 16))
                  ),
                ),
        
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF2D0C03),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: (){}, 
                  child: Icon(Icons.headphones_outlined, color: Colors.white, size: 26,)
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}