import 'package:flutter/material.dart';

class IdeasContent extends StatelessWidget {
  const IdeasContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          Column(
            spacing: 12,
            children: [
              Row(
                spacing: 8,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage("https://i.pinimg.com/736x/40/98/2a/40982a8167f0a53dedce3731178f2ef5.jpg"),
                  ),
                  Text("Connor Lambert"),
                  Icon(Icons.shield),
                  Icon(Icons.local_fire_department),
                ],
              ),

              Row(
                spacing: 6,
                children: [
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Image.network(
                        "https://digital.library.tu.ac.th/tu_dc/digital/file_upload/biblio/cover/178780.jpg",
                        height: 60,
                        width: 40,
                      ),
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Atomic Habits", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      Row(
                        spacing: 4,
                        children: [
                          Icon(Icons.draw),
                          Text("James Clear"),
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),

          LayoutBuilder(
            builder: (context, constraints){
              final itemWidth = (constraints.maxWidth - 18) / 2;
              return Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ...List.generate(4, (index) {
                    return SizedBox(
                      width: itemWidth,
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          children: [
                            Image.network("https://i.pinimg.com/736x/28/10/0d/28100d716fa03037abd370c9e4286306.jpg"),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                spacing: 8,
                                children: [
                                  Text(
                                    "Habits are mental shortcuts", 
                                    style: TextStyle(
                                      fontSize: 15, 
                                      fontWeight: FontWeight.bold),
                                    ),
                                  Text(
                                    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).", 
                                    maxLines: 10,
                                    overflow: TextOverflow.fade,
                                    softWrap: true,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  })
                ],
              );
            }
          ),
        ],
      ),
    );
  }
}