import 'package:flutter/material.dart';

class PostProfile extends StatelessWidget {
  const PostProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        spacing: 18,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              spacing: 18,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ideas curated by",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      leading: CircleAvatar(backgroundImage: NetworkImage("https://i.pinimg.com/736x/8c/4b/0f/8c4b0f8005787d04ce97c42f22a3eff2.jpg"),),
                      title: Row(
                        spacing: 4,
                        children: [
                          Text("George Hamton", style: TextStyle(fontWeight: FontWeight.bold),),
                          Icon(Icons.shield, color: Colors.blue,)
                        ],
                      ),
                      trailing: ElevatedButton(
                        onPressed: (){},
                        child: Text("Following"),
                      ),
                    ),

                    Text("Surveyor in commercial/residential")
                  ],
                ),

                Text("From book author", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),

                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: CircleAvatar(backgroundImage: NetworkImage("https://i.pinimg.com/736x/8c/4b/0f/8c4b0f8005787d04ce97c42f22a3eff2.jpg")),
                  title: Text("Shlomo Benartzi", style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text("1 Book"),
                  trailing: ElevatedButton(
                    onPressed: (){}, 
                    child: Text("Follow")
                  ),
                ),

                Text("More like this", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              ],
            ),
          ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 18),
              padding: EdgeInsets.only(bottom: 48),
              child: Row(
                spacing: 12,
                children: [
                  ...List.generate(3, (index){
                    return Container(
                      margin: EdgeInsets.only(top: 30),
                      width: 150,
                      child: Column(
                        spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white70,
                                  spreadRadius: 1,
                                  blurRadius: 30,
                                )
                              ]
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network("https://i.pinimg.com/736x/a9/a6/f3/a9a6f3c554d9fc2114217cdcdffb65f0.jpg", height: 100, width: 100, fit: BoxFit.cover,),
                            ),
                          ),
                          Text("What Happens to Your Eyes When You", textAlign: TextAlign.center,),
                          Row(
                            spacing: 4,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.wordpress_outlined),
                              Text("lifehacker.com")
                            ],
                          )
                        ],
                      ),
                    );
                  })
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}