import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/post/widgets/comment.dart';
import 'package:flutter_application_1/screens/profile/widgets/share_user.dart';

class BottomPost extends StatelessWidget {
  const BottomPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12, bottom: 24),
      child: Column(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 10,
            children: [
              ...List.generate(6, (index) {
                return Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: index % 2 == 0 ? Colors.green : Colors.grey,
                      borderRadius: BorderRadius.circular(2), 
                    ),
                    height: 4,
                  ),
                );
              })
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){
                Navigator.pop(context);
                }, 
                icon: Icon(Icons.chevron_left, size: 28,),
                padding: EdgeInsets.all(0),
              ),
              Row(
                children: [
                  IconButton(onPressed: (){
                    showModalBottomSheet(
                      context: context, 
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return DraggableScrollableSheet(
                          initialChildSize: 0.7, 
                          minChildSize: 0.4,
                          maxChildSize: 0.9,
                          expand: false,
                          builder: (context, scrollController) {
                            return Comment();
                          }
                        );
                      },
                    );
                  }, 
                    icon: Icon(Icons.message_outlined, size: 28,),
                    padding: EdgeInsets.all(0),
                  ),
                  Text("3")
                ],
              ),
              Row(
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                    }, 
                    icon: Icon(Icons.favorite_border, size: 28,),
                    padding: EdgeInsets.all(0),
                  ),
                  Text("31")
                ],
              ),
              IconButton(
                onPressed: (){
                  showModalBottomSheet(
                    context: context, 
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return DraggableScrollableSheet(
                        initialChildSize: 0.7, 
                        minChildSize: 0.4,
                        maxChildSize: 0.9,
                        expand: false,
                        builder: (context, scrollController) {
                          return ShareUser();
                        }
                      );
                    },
                  );
                }, 
                icon: Icon(Icons.ios_share_rounded, size: 28,),
                padding: EdgeInsets.all(0),
              ),
              IconButton(onPressed: (){
                Navigator.pop(context);
                }, 
                icon: Icon(Icons.headphones_outlined, size: 28,),
                padding: EdgeInsets.all(0),
              ),
              IconButton(onPressed: (){
                Navigator.pop(context);
                }, 
                icon: Icon(Icons.bookmark_border_outlined, size: 28,),
                padding: EdgeInsets.all(0),
              ),
            ],
          )
        ],
      ),
    );
  }
}