import 'package:flutter/material.dart';

class CommunityCard extends StatelessWidget {
  const CommunityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.blue[300],
        child: Padding(
            padding: EdgeInsets.all(12),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "From the Community",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Discover what others are reading.",
                              style: TextStyle(color: Colors.grey[800]),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(0),
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                          onPressed: ()=>{}, 
                          child: Row(
                            spacing: 6,
                            children: [
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.black,
                              ),
                              Text(
                                "Explore more",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          )
                        )
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      "https://m.media-amazon.com/images/I/716hMrmP-KL._AC_UF1000,1000_QL80_.jpg",
                      height: 120,
                      width: 100,
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              ),
            )));
  }
}
