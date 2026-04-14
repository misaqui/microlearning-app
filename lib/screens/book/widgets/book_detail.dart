import 'package:flutter/material.dart';

class BookDetail extends StatelessWidget {
  const BookDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFfff7f0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 12, left: 12, bottom: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 6,
                        children: [
                          Text("Key ideas", style: TextStyle(color: Color(0xFFd44d10)),),
                          Text(
                            "13",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(right: 8),
                      child: Icon(Icons.card_giftcard, color: Colors.deepOrangeAccent, size: 48,),
                    )
                  ],
                ),
              ),
            ),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFfff7f0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 12, left: 12, bottom: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 6,
                          children: [
                            Text("Time per idea", style: TextStyle(color: Color(0xFFd44d10)),),
                            Text(
                              "4-5 min",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(right: 8),
                      child: Icon(Icons.access_time_rounded, color: Colors.deepOrangeAccent, size: 48,),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),

        Text("Description", style: TextStyle(fontWeight: FontWeight.bold),),
        
        Container(
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Color(0xFFfef5f0),
            borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: [
              Text("Ever feel stuck repeating the same patterns? In Atomic Habits, James Clear shows how tiny changes create massive progress by redesigning your environment and identity, not relying on discipline. Learn how small improvements compound into breakthroughs."),
              Text("Ready to unlock habits that stick for good?"),
            ],
          ),
        ),
      ],
    );
  }
}