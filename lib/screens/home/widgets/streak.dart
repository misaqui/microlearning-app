import 'package:flutter/material.dart';

class Streak extends StatelessWidget {
  const Streak({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          top: BorderSide(
            width: 1,
            color: Colors.grey
          )
        )
      ),
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        spacing: 20,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.chevron_left)),
              Text("Streak Milestones", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              IconButton(onPressed: (){}, icon: Icon(Icons.chevron_right))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.circle, color: Colors.orange, size: 12),
              SizedBox(width: 8),
              Container(width: 40, height: 2, color: Colors.grey),
              SizedBox(width: 8),
              Icon(Icons.circle_outlined, color: Colors.grey, size: 12),
            ],
          ),

          Divider(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...List.generate(3, (index) {
                return Column(
                  children: [
                    Row(
                      spacing: 2,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.workspace_premium, size: 28, color: Colors.amber,),
                        Text("2", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Text("max streak")
                  ],
                );
              }),
            ],
          ),

          Divider(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.chevron_left)),
              Text("Streak Milestones", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              IconButton(onPressed: (){}, icon: Icon(Icons.chevron_right))
            ],
          ),
        ],
      ),
    );
  }
}