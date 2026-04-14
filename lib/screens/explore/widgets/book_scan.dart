import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/camera.dart';

class BookScan extends StatelessWidget {
  const BookScan({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.green
      ),
      child: Padding(
        padding: EdgeInsets.all(18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 6,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Book Scan",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Holding a book you like?",
                        style: TextStyle(
                          color: Colors.black
                        ),
                      ),
                      Text("just scan it & read its ideas!"),
                    ],
                  ),
                  IntrinsicWidth(
                    child: ElevatedButton(
                      onPressed: ()=>{
                        showDialog(
                          barrierDismissible: false,
                          context: context, 
                          builder: (BuildContext context) {
                            return Camera();
                          }
                        )
                      }, 
                      child: Row(
                        spacing: 6,
                        children: [
                          Icon(
                            Icons.qr_code_scanner,
                            color: Colors.white,
                          ),
                          Text(
                            "Try it now",
                            style: TextStyle(
                              color: Colors.white
                            ),
                          )
                        ],
                      )
                    ),
                  )
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                "https://m.media-amazon.com/images/I/91bYsX41DVL._AC_UF1000,1000_QL80_.jpg",
                width: 150,
                height: 200,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}