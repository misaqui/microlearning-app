import 'package:flutter/material.dart';

class ReadAudioButton extends StatelessWidget {
  final VoidCallback onReadTap;
  final VoidCallback onAudioTap;

  const ReadAudioButton({
    super.key,
    required this.onReadTap,
    required this.onAudioTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFDDE3E9),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: onReadTap,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(100),
                bottomLeft: Radius.circular(100),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  "Read",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            
            VerticalDivider(
              color: Colors.black.withAlpha(40),
              thickness: 1,
              indent: 8,   
              endIndent: 8, 
              width: 1,
            ),
            
            InkWell(
              onTap: onAudioTap,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Icon(
                  Icons.headphones_outlined,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}