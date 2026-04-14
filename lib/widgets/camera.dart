import 'package:flutter/material.dart';

class Camera extends StatelessWidget {
  const Camera({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.cancel_outlined, color: Colors.grey,))
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 24,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(Icons.camera_alt, size: 88,),
              Positioned(
                bottom: 0,
                right: -10,
                child: Icon(Icons.check_circle, color: Colors.green, size: 38,),
              )
            ],
          ),
          Text(
            'Allow Deepstash to access'
            ' your camera',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "This lets you capture the book that you're looking for.",
            textAlign: TextAlign.center,
          )
        ],
      ),

      actionsAlignment: MainAxisAlignment.center,
      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Open Settings'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}