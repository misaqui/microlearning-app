import 'package:flutter/material.dart';

class FeedbackShare extends StatelessWidget {
  const FeedbackShare({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 40),
      child: Column(
        spacing: 18,
        mainAxisSize: MainAxisSize.min, 
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Feedback to share?",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text("You are invited to share any suggestion or issues you may have"),

              _feedbackMenuItem("report a bug", Icons.bug_report_outlined, Colors.red),
              _feedbackMenuItem("Share your feedback", Icons.comment, Colors.blue),
              _feedbackMenuItem("Suggest a feature", Icons.lightbulb_outline, Colors.amber.shade700),
            ],
          ),
        ],
      ),
    );
  }

  Widget _feedbackMenuItem(String name, IconData iconData, Color color){
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: Container(
        decoration: BoxDecoration(
          color: color, 
          shape: BoxShape.circle, 
        ),
        padding: EdgeInsets.all(8), 
        child: Icon(
          iconData,
          color: Colors.white, 
          size: 24.0,
        ),
      ),
      title: Text(name),
      trailing: Icon(Icons.chevron_right),
      onTap: (){},
    );
  }
}