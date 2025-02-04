import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 101, 14),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            // Title disappears on scroll
            SliverAppBar(
              backgroundColor: const Color.fromARGB(255, 11, 101, 14),
              automaticallyImplyLeading: false,
              pinned: false, // Title disappears when scrolling
              expandedHeight: 80,
              flexibleSpace: FlexibleSpaceBar(
                title: Container(
                  color: const Color.fromARGB(255, 11, 101, 14),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 33,
                          width: 33,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              color: const Color.fromARGB(255, 5, 69, 21),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Icon(
                            Icons.person,
                            size: 19,
                            color: Colors.white,
                          ))),
                      Text(
                        "Sticky Header Example",
                        style: TextStyle(fontSize: 15),
                      ),
                      Icon(Icons.alarm),
                    ],
                  ),
                ),
                centerTitle: true,
              ),
            ),

            // Search bar stays visible when scrolling
            SliverPersistentHeader(
              pinned: true, // Search bar stays when scrolling
              floating: false,
              delegate: _SearchBarDelegate(),
            ),

            // Sticky Header List
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
                childCount: 10, // Number of sticky sections
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Delegate for Search Bar
class _SearchBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 60; // Minimum height of search bar
  @override
  double get maxExtent => 60; // Fixed height of search bar

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 300,
      color: const Color.fromARGB(255, 11, 101, 14),
      // margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      alignment: Alignment.center,
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search...",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
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
