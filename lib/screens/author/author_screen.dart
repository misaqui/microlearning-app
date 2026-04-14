import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/author/widgets/author_follow.dart';
import 'package:flutter_application_1/screens/author/widgets/book_item.dart';

class AuthorScreen extends StatefulWidget {
  const AuthorScreen({super.key, required this.name, required this.imageUrl});

  final String name;
  final String imageUrl;

  @override
  State<AuthorScreen> createState() => _AuthorScreenState();
}

class _AuthorScreenState extends State<AuthorScreen> {
  double _opacity = 0;
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _opacity = (_controller.offset / 50).clamp(0, 1).toDouble();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(widget.name, style: TextStyle(color: Colors.white.withValues(alpha: _opacity)),),
        centerTitle: false,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.close)),
        backgroundColor: Theme.of(context).colorScheme.surfaceBright.withValues(alpha: _opacity),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),

      body: ListView(
        controller: _controller,
        padding: EdgeInsets.zero,
        clipBehavior: Clip.none,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(100)),
                  shape: BoxShape.rectangle
                ),
              ),

              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 18, right: 18, bottom: 18, top: MediaQuery.of(context).padding.top + 32),
                    child: Column(
                      spacing: 32,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 65,
                              backgroundImage: NetworkImage(
                                widget.imageUrl, 
                              ),
                            ),
              
                            SizedBox(height: 18,),
              
                            Text(
                              widget.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
              
                            Text(
                              'Author',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
              
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Kiyosaki is best known for his book Rich Dad, Poor Dad, the #1 New York Times bestseller. Kiyosaki followed with Rich Dad\'s CASHFLOW Quadrant and Rich Dad\'s Guide to Investing.',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
              
                        SizedBox( 
                          height: 64,
                          child: Row(
                            spacing: 32,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildStatItem('898K', 'reads'),
                              const VerticalDivider(
                                color: Colors.grey,
                                thickness: 2, 
                                indent: 10,
                                endIndent: 10,
                              ),
                              _buildStatItem('8', 'published'),
                            ],
                          ),
                        ),
              
                        AuthorFollow(),
              
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Books',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            // 'Most Popular' Sort Dropdown Button
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: const Color(0xFF242C36),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'Most Popular',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.white70,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ),
              
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      margin: EdgeInsets.symmetric(horizontal: 18),
                      child: Row(
                        spacing: 24,
                        children: [
                          BookItem(title: "Rich Dad's Cashflow", ideas: "4", reads: "405", shadowColor: Colors.red, imageUrl: 'https://i.pinimg.com/736x/79/f4/0d/79f40d7ed5ba34cb83da7a90b647d00b.jpg',),
                          BookItem(title: "Rich Dad Poor", ideas: "4", reads: "405", shadowColor: Colors.grey, imageUrl: 'https://i.pinimg.com/736x/fd/f4/53/fdf4538a04bacaad6eeee3183f236322.jpg',),
                          BookItem(title: "Papa Rico", ideas: "4", reads: "405", shadowColor: Colors.white, imageUrl: 'https://i.pinimg.com/736x/f1/38/f9/f138f94e90b13a9a2020548876be6845.jpg',),
                          BookItem(title: "Second Chance", ideas: "4", reads: "405", shadowColor: Colors.amber, imageUrl: 'https://i.pinimg.com/1200x/0b/f0/f4/0bf0f41be93a660f7f3a6697d001a137.jpg',),
                        ],
                      ),
                    )
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}