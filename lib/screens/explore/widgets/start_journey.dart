import 'package:flutter/material.dart';

class StartJourney extends StatelessWidget {
  const StartJourney({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Card(
        color: Color(0xFF2f97d2),
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                      child: ClipRect( 
                        child: OverflowBox(
                          maxWidth: double.infinity,
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(4, (index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: Container(
                                  height: 100,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 4,
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "https://i.pinimg.com/1200x/c6/20/8a/c6208a60b1378e940bad2fb6f087982b.jpg",
                                  ),
                                    )
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Start 100+ Journeys",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text("Dive into over 50 topics"),
                ],
              ),
              Row(
                spacing: 4,
                children: [
                  Icon(Icons.shield),
                  Text("Get access"),
                  Icon(Icons.arrow_forward_ios)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}