import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  const Comment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 24, left: 24, right: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("2 Comments", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz))
            ],
          ),
        ),
        Divider(),
        
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Column(
                spacing: 18,
                children: [
                  ...List.generate(6, (index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start, // ให้ Avatar อยู่บนสุดของ Card
                      children: [
                        const CircleAvatar(
                          backgroundImage: NetworkImage("https://i.pinimg.com/736x/38/5b/f1/385bf135d2248704a163b95314da6a12.jpg"),
                        ),
                        const SizedBox(width: 12), // เพิ่มระยะห่างระหว่าง Avatar กับ Card
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min, // ให้ขยายเท่าที่จำเป็น
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text("George Hampton", style: TextStyle(fontWeight: FontWeight.bold)),
                                  const SizedBox(width: 6),
                                  Text("@georhampton", style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                                  const Spacer(),
                                  Text("159 w", style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                                ],
                              ),
                              const SizedBox(height: 4),
                              // เอา Expanded ออกจากตรงนี้ เพื่อให้มันสูงตามเนื้อหาจริง (Fit Content)
                              const Text(
                                "We have access to a vast amount of online information, but our brains are not wired to process them effectively. The Smarter Screen advocates for better design that improves our ability to make good decisions.",
                                style: TextStyle(height: 1.4), // เพิ่มระยะห่างบรรทัดให้โปร่งขึ้น
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  })
                ],
              ),
            ),
          ),
        ),

        Divider(),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            spacing: 8,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface, 
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: "Add a comment...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              // ปุ่มส่ง (Send Button)
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: IconButton(
                  icon: const Icon(Icons.send, color: Colors.white, size: 20),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}