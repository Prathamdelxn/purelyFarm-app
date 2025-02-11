import 'package:carousel_slider/carousel_slider.dart';
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
  // CarouselSlider carouselSlider;
  int _current = 0;
  List imgList = [
    'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1502943693086-33b5b1cfdf2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80'
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: const Color.fromARGB(255, 7, 77, 10),
      body: Padding(
        padding: const EdgeInsets.only(top: 14.0),
        child: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.white,
                // backgroundColor: const Color.fromARGB(255, 7, 77, 10),
                automaticallyImplyLeading: false,
                pinned: false,
                expandedHeight: 80,
                flexibleSpace: FlexibleSpaceBar(
                  title: Container(
                    color: Colors.white,
                    // color: const Color.fromARGB(255, 7, 77, 10),
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
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromARGB(
                                            255, 7, 77, 10)),
                                  ),
                                ],
                              ),
                              Text(
                                "Katraj, Pune",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                  color: const Color.fromARGB(255, 7, 77, 10),
                                  fontFamily: 'Montserrat',
                                ),
                              )
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                          "assets/notiy.svg",
                          width: 16,
                          color: const Color.fromARGB(255, 7, 77, 10),
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
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 200.0,
                        initialPage: 0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        enableInfiniteScroll: true,
                        autoPlayInterval: Duration(seconds: 2),
                        autoPlayAnimationDuration: Duration(milliseconds: 2000),
                        pauseAutoPlayOnTouch: true,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
                      items: imgList.map((imgUrl) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  imgUrl,
                                  fit: BoxFit.fill,
                                  height: 100,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: map<Widget>(imgList, (index, url) {
                        return Container(
                          width: 10.0,
                          height: 10.0,
                          margin: EdgeInsets.symmetric(horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == index
                                ? const Color.fromARGB(255, 7, 77, 10)
                                : Colors.green,
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 20.0),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                  child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 205,
                width: 199,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          "Categories",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 24),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            width: 150,
                            height: 150,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 115,
                                  child: Image.network(
                                    "https://www.simplotfoods.com/_next/image?url=https%3A%2F%2Fimages.ctfassets.net%2F0dkgxhks0leg%2F4LaYoCoepR6ZwEkAmQFh2F%2Fe82fa8e3c87f0e4cdb3e914b3e766fa0%2Fblog-large-2020veg.jpg%3Ffm%3Dwebp&w=1920&q=75",
                                    fit: BoxFit.cover,
                                  ),
                                  color: Colors.red,
                                ),
                                Container(
                                  color: const Color.fromARGB(255, 7, 77, 10),
                                  height: 35,
                                  child: Center(
                                    child: Text(
                                      "Vegetables",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                          color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            width: 150,
                            height: 150,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 115,
                                  child: Image.network(
                                    "https://sonkan.in/wp-content/uploads/2023/07/Wholesome-Alternatives-to-Refined-Grains-2.webp",
                                    fit: BoxFit.fill,
                                  ),
                                  color: Colors.red,
                                ),
                                Container(
                                  color: const Color.fromARGB(255, 7, 77, 10),
                                  height: 35,
                                  child: Center(
                                    child: Text(
                                      "Grains",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                          color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            width: 150,
                            height: 150,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 115,
                                  child: Image.network(
                                    "https://nutribinge.in/cdn/shop/articles/image3.jpg?v=1713258139",
                                    fit: BoxFit.cover,
                                  ),
                                  color: Colors.amber,
                                ),
                                Container(
                                  color: const Color.fromARGB(255, 7, 77, 10),
                                  height: 35,
                                  child: Center(
                                    child: Text(
                                      "Dry Fruits",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                          color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            width: 150,
                            height: 150,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 115,
                                  child: Image.network(
                                    "https://static.theprint.in/wp-content/uploads/2024/10/ANI-20241028174831.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                  color: Colors.amber,
                                ),
                                Container(
                                  color: const Color.fromARGB(255, 7, 77, 10),
                                  height: 35,
                                  child: Center(
                                    child: Text(
                                      "Fruits",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                          color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
              SliverToBoxAdapter(
                  child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 40,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            "Populars",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 24),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        height: 600,
                        child: GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          primary: false,
                          childAspectRatio: 1.5,
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          crossAxisSpacing: 7,
                          mainAxisSpacing: 7,
                          crossAxisCount: 2,
                          children: <Widget>[
                            Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.teal[100],
                              ),
                              child: Image.network(
                                "https://media.post.rvohealth.io/wp-content/uploads/2021/05/apples-1200x628-facebook.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.teal[100],
                                ),
                                child: Image.network(
                                    "https://images.pexels.com/photos/235294/pexels-photo-235294.jpeg?cs=srgb&dl=pexels-asphotograpy-235294.jpg&fm=jpg")),
                            Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.teal[100],
                                ),
                                child: Image.network(
                                  "https://hips.hearstapps.com/hmg-prod/images/full-frame-shot-of-kiwi-slices-royalty-free-image-742260967-1564092068.jpg?crop=1xw:0.66682xh;center,top&resize=980:*",
                                  fit: BoxFit.cover,
                                )),
                            Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.teal[100],
                              ),
                              child: Image.network(
                                "https://media.istockphoto.com/id/475574472/photo/exotic-fruit-salad.jpg?s=612x612&w=0&k=20&c=l48p9_ecDgjPh8BPgxazcNYJD6_1WyYxtzLvlt2x4BQ=",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.teal[100],
                              ),
                              child: Image.network(
                                "https://prorganiq.com/cdn/shop/articles/dry-fruits-with-high-protein.jpg?v=1675599605",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.teal[100],
                              ),
                              child: Image.network(
                                "https://d1ixo36kppfedg.cloudfront.net/faceview/jb/ff/f5e/c9b/imgs/pd/1691652177583_dry_fruit_2.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.teal[100],
                              ),
                              child: Image.network(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-3c6Y8pHJHnkN4eRdHzW_eUqhYyOsxhCQtQ&s",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.teal[100],
                              ),
                              child: Image.network(
                                "https://images.healthshots.com/healthshots/en/uploads/2021/10/18181054/basic-rules-about-eating-fruits-1600x900.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              )),
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
      color: Colors.white,
      // color: const Color.fromARGB(255, 7, 77, 10),
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
