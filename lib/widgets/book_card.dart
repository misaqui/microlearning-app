import 'package:flutter/material.dart';

class FeaturedBookCard extends StatelessWidget {
  final String headline;
  final String title;
  final String readCount;
  final String imageUrl;
  final Color firstColor;
  final Color secondColor;
  final VoidCallback onReadTap;

  const FeaturedBookCard({
    super.key,
    required this.headline,
    required this.title,
    required this.readCount,
    required this.imageUrl,
    required this.firstColor,
    required this.secondColor,
    required this.onReadTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            firstColor,
            secondColor,
          ]
        ), // สีพื้นหลังส้มอิฐตามภาพ
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ข้อความ Headline ด้านบน
          Text(
            headline,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2D3436),
              height: 1.2,
            ),
          ),
          const SizedBox(height: 25),
          
          // รูปภาพหนังสือพร้อมเงา (Shadow)
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl,
                height: 220, // ปรับความสูงตามความเหมาะสม
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 25),

          // ชื่อหนังสือ
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3436),
            ),
          ),
          const SizedBox(height: 4),
          
          // จำนวนคนอ่าน
          Text(
            '$readCount reads',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 20),

          SizedBox(
            width: 140,
            height: 50,
            child: ElevatedButton(
              onPressed: onReadTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5D4E46), 
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Read',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}