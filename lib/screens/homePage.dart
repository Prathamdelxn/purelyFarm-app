import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sticky_headers/sticky_headers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color bottomNavBgColor = Colors.blueGrey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 7, 77, 10),
      body: Padding(
        padding: const EdgeInsets.only(top: 14.0),
        child: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: const Color.fromARGB(255, 7, 77, 10),
                automaticallyImplyLeading: false,
                pinned: false,
                expandedHeight: 80,
                flexibleSpace: FlexibleSpaceBar(
                  title: Container(
                    color: const Color.fromARGB(255, 7, 77, 10),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(255, 245, 242, 242),
                                width: 1),
                            color: const Color.fromARGB(255, 5, 104, 30),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                              child: Icon(
                            Icons.person,
                            size: 18,
                            color: Colors.white,
                          )),
                        ),
                        Container(
                          height: 40,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/placeholder1.png",
                                    height: 10,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Location",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              Text(
                                "Katraj, Pune",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                ),
                              )
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                          "assets/notiy.svg",
                          width: 16,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  centerTitle: true,
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                floating: false,
                delegate: _SearchBarDelegate(),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => StickyHeader(
                    header: Container(
                      margin: EdgeInsets.only(top: 30),
                      height: 50,
                      color: Colors.blue,
                      alignment: Alignment.center,
                      child: Text(
                        'Header $index',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    content: Container(
                      height: 200,
                      color: Colors.grey[200],
                      alignment: Alignment.center,
                      child: Text('Content $index'),
                    ),
                  ),
                  childCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Delegate for Persistent Search Bar
class _SearchBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 60;
  @override
  double get maxExtent => 60;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: const Color.fromARGB(255, 7, 77, 10),
      padding: EdgeInsets.symmetric(horizontal: 26),
      alignment: Alignment.center,
      child: TextField(
        style: TextStyle(fontFamily: "Montserratmedium"),
        decoration: InputDecoration(
          hintText: "Search Your Groceries",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
