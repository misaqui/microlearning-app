import 'package:flutter/material.dart';

class SavedIdeas extends StatelessWidget {
  const SavedIdeas({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 14, top: 14, right: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Saved Ideas", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              Row(
                children: [
                  IconButton(onPressed: ()=>{}, icon: Icon(Icons.view_stream)),
                  IconButton(onPressed: ()=>{}, icon: Icon(Icons.grid_view_rounded)),
                  ElevatedButton(onPressed: (){}, child: Text("Recent First"))
                ],
              )
            ],
          ), 
        ),
    
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              spacing: 8,
              children: [
                ...List.generate(3, (index) {
                  return ElevatedButton(
                    onPressed: (){}, 
                    child: Row(
                      spacing: 6,
                      children: [
                        Text("📖", style: TextStyle(fontSize: 24),),
                        Text("Books", style: TextStyle(color: Colors.white),),
                        Badge(label: Text("4"), backgroundColor: Theme.of(context).colorScheme.inversePrimary, textColor: Colors.white,)
                      ],
                    ),
                  );
                })
              ],
            ),
          )
        )
      ],
    );
  }
}