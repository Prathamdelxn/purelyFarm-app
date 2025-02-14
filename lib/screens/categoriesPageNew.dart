import 'package:ecom/screens/CustomPageRoute.dart';
import 'package:ecom/screens/categoriesDetails.dart';
import 'package:ecom/screens/productDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class NewCategoryPage extends StatefulWidget {
  const NewCategoryPage({super.key});

  @override
  State<NewCategoryPage> createState() => _NewCategoryPageState();
}

class _NewCategoryPageState extends State<NewCategoryPage> {
  final List<Map<String, String>> categories = [
    {
      'name': 'Vegetables',
      'image': "assets/categoriesImg/vegetablesImage/Broccoli (1).png",
    },
    {
      'name': 'Dry Fruits',
      'image': "assets/categoriesImg/DryFruitsImages/Almond.png"
    },
    {'name': 'Grains', 'image': "assets/categoriesImg/GrainsImages/Rice.png"},
    {'name': 'Fruits', 'image': "assets/categoriesImg/FruitsImage/Apple.png"},
  ];

  final List<String> productImages = [
    'assets/banner.png',
    'assets/images/onion.png',
    'assets/images/tomato.png',
  ];
  final List<Map<String, dynamic>> allCategoriesItems = [
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ868djAR5mIlAFnnjF---4paarCg48aQTr-g&s",
      "name": "Apple",
      "relevantImages": [
        "https://plus.unsplash.com/premium_photo-1661322640130-f6a1e2c36653?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YXBwbGV8ZW58MHx8MHx8fDA%3D",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcLKgYcFPMQYkeF3c4D8yomvPeDH9fBnJbkKK6VkTK-yWQw0GTc75hxs2x_nqDVsQeIQc&usqp=CAU",
        "https://i5.walmartimages.com/asr/35257a70-6d96-40fc-94e4-5e27b2dd4195.ea3985d9f7a6579b2e01329dff80e27f.jpeg?odnHeight=768&odnWidth=768&odnBg=FFFFFF"
      ],
      "category": "Fruits",
      "newPrice": "60",
      "Quantity": "250 gm",
      "oldPrice": "85",
      "description":
          "Apples are round fruits that are mainly made up of water and carbohydrates. They are a good source of fiber, vitamin C, and potassium. "
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyDaMy2lyeF2zABj70jMpWuOjLLeS2ZSGL4w&s",
      "name": "Banana",
      "relevantImages": [
        "https://nutritionsource.hsph.harvard.edu/wp-content/uploads/2018/08/bananas-1354785_1920.jpg",
        "https://hips.hearstapps.com/hmg-prod/images/ripe-yellow-bananas-at-the-shopping-market-fruits-royalty-free-image-1712833209.jpg?crop=0.66635xw:1xh;center,top&resize=640:*",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVPq9agX9xfIskW55jvtpxNOqwyaR0Y8ZFww&s"
      ],
      "category": "Fruits",
      "newPrice": "60",
      "Quantity": "250 gm",
      "oldPrice": "85",
      "description":
          "Bananas are a fruit that grow on plants in the genus Musa. They are long, curved, and covered in a peel. Bananas are a good source of potassium, fiber, and vitamins B6 and C"
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYpvXV8yAk_S1ZAWaquCgj-zx-U9wLeFvDDg&s",
      "name": "Carrot",
      "relevantImages": [
        "https://www.trustbasket.com/cdn/shop/articles/Carrot.jpg?v=1688378789",
        "https://media.istockphoto.com/id/1432845374/photo/carrots.jpg?s=612x612&w=0&k=20&c=c-u_98TP1ZALqlZ1QieB-nfSmbGl4bfCHwJWWOJ91K4=",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNn6d9TbCv4s8YV-O4PjOhql6hNC61Y9J_SA&s"
      ],
      "category": "Vegetables",
      "newPrice": "60",
      "Quantity": "250 gm",
      "oldPrice": "85",
      "description":
          "Carrots are a root vegetable that are crunchy, sweet, and nutritious. They are commonly orange, but can also be white, yellow, purple, or red. "
    },
    {
      "image":
          "https://st2.depositphotos.com/1030113/10488/i/450/depositphotos_104882238-stock-photo-ripe-tomato-cluster-in-greenhouse.jpg",
      "name": "Tomato",
      "relevantImages": [
        "https://www.avogel.ca/images/recipe-page/tomato-main.jpg",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGLE_9efL_V8dVR9KuWSLzAy_X6KQmcqMP4Q&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLcBzRmeUgnzXREjhXrIdLlVtt2UA1ITGAnA&s"
      ],
      "category": "Vegetables",
      "newPrice": "60",
      "Quantity": "250 gm",
      "oldPrice": "85",
      "description":
          "Tomatoes are a fruit that are a major ingredient in many cuisines around the world. They come in many colors, and are a good source of vitamins and antioxidants."
    },
    {
      "image":
          "https://cdn.britannica.com/80/157180-050-7B906E02/Heads-wheat-grains.jpg",
      "name": "Whole Wheat",
      "relevantImages": [
        "https://cdn.britannica.com/80/157180-050-7B906E02/Heads-wheat-grains.jpg",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4wAjAO298t11xOtnEF7oKEq7MW8tolPasOQ&s",
        "https://www.asiafarming.com/wp-content/uploads/2017/03/Wheat-Grains..jpg"
      ],
      "category": "Grains",
      "newPrice": "60",
      "Quantity": "250 gm",
      "oldPrice": "85",
      "description":
          "Wheat is a grass that is widely grown for its seed, a cereal grain that is a common diet all over the world. The genus Triticum is made up of numerous kinds of wheat. Around 9600 BCE, according to the archaeological record, wheat cultivation began in the Fertile Crescent."
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9ovkCH6HKmu15PB6fRcHO6dceK2krsMvoHw&s",
      "name": "Basmati Rice",
      "relevantImages": [
        "https://5.imimg.com/data5/SELLER/Default/2023/5/305896416/CT/ZH/WX/71203728/basmati-rice.webp",
        "https://lsmedia.linker-cdn.net/1004395/2024/13781890.jpeg",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQV4h8fdJY-T7zCMdUHoix_N43SjGOVh4t-jIXS-sz9pYxkEVM-D7ZY7s9ANWPo9vmGvqM&usqp=CAU"
      ],
      "category": "Grains",
      "newPrice": "60",
      "Quantity": "250 gm",
      "oldPrice": "85",
      "description":
          "Basmati rice is a type of long-grain rice, and the starch granules contain a large proportion of a starch molecule called amylose (basmati and jasmine rice have about 73% amylose) and a smaller quantity of another type of starch called amylopectin."
    },
    {
      "image":
          "https://cdn.britannica.com/04/194904-050-1B92812A/Raw-Food-Almond-food-Nut-Snack.jpg",
      "name": "Almonds",
      "relevantImages": [
        "https://t3.ftcdn.net/jpg/09/38/12/94/360_F_938129436_Y8oCbbUAMrR8tOokbsYglNKvEcbkgYSM.jpg",
        "https://d3kgrlupo77sg7.cloudfront.net/media/chococoorgspice.com/images/products/whole-almond-coorg-almond-buy-online.20220910001647.webp",
        "https://d3kgrlupo77sg7.cloudfront.net/media/chococoorgspice.com/images/products/whole-almond-coorg-almond-buy-online.20220910001647.webp"
      ],
      "category": "Dry Fruits",
      "newPrice": "60",
      "Quantity": "250 gm",
      "oldPrice": "85",
      "description":
          "Almond milk is made from almonds blended with water (and sometimes sugar) and strained. It's used as a replacement for dairy or soy milk. Almond meal is made from almonds ground with their skins on, while almond flour is made from ground, blanched almonds"
    },
    {
      "image":
          "https://mahajanstore.com/wp-content/uploads/2022/12/Cashewnuts-Plian-1.jpg",
      "name": "Cashew Nuts",
      "relevantImages": [
        "https://t4.ftcdn.net/jpg/04/93/35/61/360_F_493356198_Ccc057yE3YM1LCQ4JeOvAFfuF7USlhTB.jpg",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvWtf1iixS4AXpzSsbT9ZYbNTBUruwaoUgBQ&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRX0r4HXUbtPawuAlC31otbyJTYRMEzYNLOPZC6xrS4SM5emTJ8SrcgigKHx9V0YUIeziI&usqp=CAU"
      ],
      "category": "Dry Fruits",
      "newPrice": "60",
      "Quantity": "250 gm",
      "oldPrice": "85",
      "description":
          "Cashew is the common name of a tropical evergreen tree Anacardium occidentale, in the family Anacardiaceae. It is native to South America and is the source of the cashew nut and the cashew apple, an accessory fruit."
    },
    {
      "image":
          "https://www.health.com/thmb/vyI49td0j52IBWf_vHVE_DGVZcU=/3950x0/filters:no_upscale():max_bytes(150000):strip_icc()/Health-Stocksy_txp5e95690asrw300_Medium_934585-e870449543284eed8aa4be52fc09a4ed.jpg",
      "name": "Orange",
      "relevantImages": [
        "https://upload.wikimedia.org/wikipedia/commons/thumb/4/43/Ambersweet_oranges.jpg/640px-Ambersweet_oranges.jpg",
        "https://m.media-amazon.com/images/I/51qFSdheDPL._AC_UF1000,1000_QL80_.jpg",
        "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/Orange-Fruit-Pieces.jpg/320px-Orange-Fruit-Pieces.jpg"
      ],
      "category": "Fruits",
      "newPrice": "60",
      "Quantity": "250 gm",
      "oldPrice": "85",
      "description":
          "Oranges are a citrus fruit that are high in vitamin C and other nutrients. They are a popular food that can be eaten whole, juiced, or used in marmalades and desserts."
    },
    {
      "image":
          "https://media.istockphoto.com/id/535910387/photo/ripe-organic-green-salad-romano.jpg?s=612x612&w=0&k=20&c=9GTcj_WqUk9LWkzUb6g4MCnLTPAapT_hNMZCHRd3C1U=",
      "name": "Lettuce",
      "relevantImages": [
        "https://cdn.britannica.com/77/170677-050-F7333D51/lettuce.jpg",
        "https://trikaya.net/cdn/shop/products/LettuceLeafytabletop_800x.jpg?v=1594756664",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQkym2BFCtpK1etDMciFrYw8gwx9W-bI_aBA&s"
      ],
      "newPrice": "30",
      "Quantity": "1 Kg",
      "oldPrice": "50",
      "category": "Vegetables",
      "description":
          "Lettuce, except iceberg, is also a moderately good source of vitamin C, calcium, iron and copper. Look for salad greens that are darker green in color. Iceberg lettuce has little nutritional value. One cup of raw leaf lettuce has 9 calories, 1 gram of protein, and 1.3 grams of fiber."
    },
    {
      "image":
          "https://cdn.create.vista.com/api/media/small/86610186/stock-photo-fresh-raw-organic-broccoli-in-bowl-closeup",
      "name": "Broccoli",
      "relevantImages": [
        "https://cdn.britannica.com/25/78225-050-1781F6B7/broccoli-florets.jpg",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoW5SSVP8uwmxIAsHl1HveAsiTgGHhNjoYHQ&s",
        "https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/health-benefits-of-broccoli-1296x728-feature.jpg?w=1155&h=1528"
      ],
      "newPrice": "120",
      "Quantity": "2 Kg",
      "oldPrice": "220",
      "category": "Vegetables",
      "description":
          "It contains glucosinolates, which the body can convert into substances that fight cancer. Broccoli's anti-inflammatory, antioxidant, and fiber-rich properties support heart health."
    },
    {
      "image":
          "https://plus.unsplash.com/premium_photo-1675365779531-031dfdcdf947?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cG90YXRvfGVufDB8fDB8fHww",
      "name": "Potato",
      "relevantImages": [
        "https://5.imimg.com/data5/SELLER/Default/2021/2/FG/MB/LY/98166444/whatsapp-image-2021-02-04-at-8-05-27-pm-1--500x500.jpeg",
        "https://media.sciencephoto.com/image/h1103538/800wm",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROM3MfF2y8cBIFFFA--ek-jOzjc4KqADb8pw&s"
      ],
      "newPrice": "20",
      "Quantity": "100 gm",
      "oldPrice": "35",
      "category": "Vegetables",
      "description":
          "The potato is a starchy tuberous vegetable native to the Americas that is consumed as a staple food in many parts of the world. Potatoes are underground tubers of the plant Solanum tuberosum, a perennial in the nightshade family Solanaceae."
    },
    {
      "image":
          "https://media.istockphoto.com/id/492528037/photo/fresh-kohlrabi-on-the-wooden-table-closeup.jpg?s=612x612&w=0&k=20&c=5aaWZ5sG-fd2nWvGSdywmNsFNzS74HF4eL8f2vUzPfw=",
      "name": "Kohlrabi",
      "newPrice": "45",
      "Quantity": "500 gm",
      "oldPrice": "70",
      "category": "Vegetables"
    },
    {
      "image":
          "https://5.imimg.com/data5/FL/HY/QP/SELLER-90465243/artichoke.jpeg",
      "name": "Artichoke",
      "newPrice": "75",
      "Quantity": "750 gm",
      "oldPrice": "100",
      "category": "Vegetables"
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0TLQ-TatGslPnS8LwNMnQzkymUZI3Q-_-gw&s",
      "name": "Spinach",
      "newPrice": "25",
      "Quantity": "500 gm",
      "oldPrice": "40",
      "category": "Vegetables"
    },
    {
      "image":
          "https://images.pexels.com/photos/2329440/pexels-photo-2329440.jpeg",
      "name": "Cucumber",
      "newPrice": "35",
      "Quantity": "1 Kg",
      "oldPrice": "55",
      "category": "Vegetables"
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTpxkGAiIHrq6vQTIHBnnqLvT-B5p3Ar421w&s",
      "name": "Bell Pepper",
      "newPrice": "60",
      "Quantity": "250 gm",
      "oldPrice": "85",
      "category": "Vegetables"
    },
  ];
  List<Map<String, dynamic>> filterByCategory(
      List<Map<String, dynamic>> allCategoriesItems, String category) {
    return allCategoriesItems
        .where((item) => item["category"] == category)
        .toList();
  }

  Future<void> data() async {
    final datas =
        await http.get(Uri.parse("https://fakestoreapi.com/products/"));
    print(datas.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 420,
              color: Colors.red,
              child: Stack(
                children: [
                  CategoriesCarosel(images: productImages),
                  Positioned(
                    bottom: -20,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Container(
                        width: 300,
                        // color: Colors.red,
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 150,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: categories.length,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              List<Map<String, dynamic>>
                                                  filterItems =
                                                  filterByCategory(
                                                      allCategoriesItems,
                                                      categories[index]
                                                          ["name"]!);
                                              data();

                                              Navigator.push(
                                                context,
                                                CustomPageRoute(
                                                    child: Categoriesdetails(
                                                        categoryName:
                                                            categories[index]
                                                                ["name"],
                                                        arrayodproduct:
                                                            filterItems)),
                                              );
                                            },
                                            child: Container(
                                              height: 65,
                                              width: 65,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 0.19),
                                                      blurRadius: 20,
                                                      spreadRadius: 0,
                                                      offset: Offset(
                                                        0,
                                                        10,
                                                      ),
                                                    ),
                                                    BoxShadow(
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 0.23),
                                                      blurRadius: 6,
                                                      spreadRadius: 0,
                                                      offset: Offset(
                                                        0,
                                                        6,
                                                      ),
                                                    ),
                                                  ],
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                              child: Center(
                                                child: Image.asset(
                                                  categories[index]["image"]!,
                                                  width: 35,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            categories[index]["name"]!,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16),
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "All Categories",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
                )),
            Container(
              height: 450,
              // color: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 items per row
                  crossAxisSpacing: 9,
                  mainAxisSpacing: 9,
                  childAspectRatio: 0.7,
                ),
                itemCount: allCategoriesItems.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.19),
                          blurRadius: 20,
                          spreadRadius: 0,
                          offset: Offset(
                            0,
                            10,
                          ),
                        ),
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.23),
                          blurRadius: 6,
                          spreadRadius: 0,
                          offset: Offset(
                            0,
                            6,
                          ),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 72, 82, 81),
                    ),
                    child: Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Opacity(
                          opacity: 0.7,
                          child: Image.network(
                            allCategoriesItems[index]["image"]!,
                            fit: BoxFit.cover, // Fill container properly
                            width: double.infinity, // Ensure it expands fully
                            height: double.infinity,
                          ),
                        ),
                      ),
                      Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            height: 50,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.amber.withOpacity(0.8),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20))),
                            child: Center(
                              child: Text(
                                "+",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 28,
                                    color: Colors.white),
                              ),
                            ),
                          )),
                      Positioned(
                          bottom: 10,
                          left: 10,
                          child: Container(
                            width: 100,
                            child: Text(
                              allCategoriesItems[index]["name"]!,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ))
                    ]),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CategoriesCarosel extends StatefulWidget {
  final List<String> images;

  const CategoriesCarosel({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  State<CategoriesCarosel> createState() => _CategoriesCaroselState();
}

class _CategoriesCaroselState extends State<CategoriesCarosel> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height * 0.4;

    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 35),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      widget.images[index],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 100,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.images.length,
              (index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? Colors.white
                      : Colors.white.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
