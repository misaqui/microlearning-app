import 'package:flutter/material.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 8,
            children: [
              Row(
                spacing: 4,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage("https://i.pinimg.com/1200x/0a/62/f6/0a62f64e013f6a3715c1743adc55b12e.jpg"),
                    maxRadius: 14,
                  ),
                  Text("George Hampton", style: TextStyle(fontSize: 12),),
                  Icon(Icons.shield, color: Colors.blue,),
                  Icon(Icons.local_fire_department, color: Colors.amber,)
                ],
              ),
      
              Row(
                spacing: 4,
                children: [
                  Icon(Icons.remove_red_eye_outlined),
                  Text("2.4k reads", style: TextStyle(fontSize: 12),),
                  IconButton(
                    onPressed: (){}, 
                    icon: Icon(Icons.more_horiz)
                  )
                ],
              )
            ],
          ),
        ),
    
        SizedBox(
          height: 150,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.topLeft,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -15, 
                left: -10,
                child: Icon(
                  Icons.format_quote_rounded,
                  size: 100, 
                  color: Colors.grey.shade800, 
                ),
              ),
      
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 20, 18, 0), 
                child: Text(
                  "We have access to a vast amount of online information, but our brains are not wired to process them effectively. The Smarter Screen advocates for better design that improves our ability to make good decisions.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.5, // Improves readability
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}