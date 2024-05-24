import 'package:community_material_icon/community_material_icon.dart';
import 'package:ecommerceapp/models/sneaker_model.dart';
import 'package:ecommerceapp/services/helper.dart';
import 'package:ecommerceapp/views/shared/appstyle.dart';
import 'package:ecommerceapp/views/shared/bottom_nav.dart';
import 'package:ecommerceapp/views/shared/category_btn.dart';
import 'package:ecommerceapp/views/shared/custom_spacer.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../shared/latest_shoes.dart';
import '../shared/product_card.dart';

class ProductByCart extends StatefulWidget {
  const ProductByCart({super.key, required this.tabIndex});
  final int tabIndex;

  _ProductByCartState createState() => _ProductByCartState();
}

class _ProductByCartState extends State<ProductByCart>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  late Future<List<Sneakers>> _male;
  late Future<List<Sneakers>> _female;
  late Future<List<Sneakers>> _kids;
  void getMale() {
    _male = Helper().getMaleSneaker();
  }

  void getFemale() {
    _female = Helper().getFemaleSneaker();
  }

  void getKids() {
    _kids = Helper().getkidsSneaker();
  }

  @override
  void initState() {
    super.initState();
    getMale();
    getKids();
    getFemale();
  }

  List<String> brand = [
    'assets/images/adidas.png',
    'assets/images/gucci.png',
    'assets/images/jordan.png',
    'assets/images/nike.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE2E2E2),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(16, 45, 0, 0),
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/top_imagePIC.png'),
                      fit: BoxFit.fill)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(6, 5, 16, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child:
                              Icon(FontAwesomeIcons.close, color: Colors.white),
                        ),
                        GestureDetector(
                          child: Icon(
                            FontAwesomeIcons.sliders,
                            color: Colors.white,
                          ),
                          onTap: () {
                            filter();
                          },
                        ),
                      ],
                    ),
                  ),
                  TabBar(
                    padding: EdgeInsets.zero,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.transparent,
                    controller: _tabController,
                    isScrollable: true,
                    labelColor: Colors.white,
                    labelStyle: appstyle(24, Colors.white, FontWeight.bold),
                    unselectedLabelColor: Colors.grey.withOpacity(0.3),
                    tabs: const [
                      Tab(
                        text: "Men Shoes",
                      ),
                      Tab(
                        text: "Women Shoes",
                      ),
                      Tab(
                        text: "Kid Shoes",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.2,
                  left: 16,
                  right: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    latestShoes(male: _male),
                    latestShoes(male: _female),
                    latestShoes(male: _kids),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Future<dynamic> filter() {
    double _value = 100;
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.white54,
        builder: (context) => Container(
              height: MediaQuery.of(context).size.height * 0.84,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 5,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.black38,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.70,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CustomSpacer(),
                          Text("Filter",
                              style:
                                  appstyle(40, Colors.black, FontWeight.bold)),
                          CustomSpacer(),
                          Text("Gender",
                              style:
                                  appstyle(20, Colors.black, FontWeight.bold)),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CategoryBtn(
                                label: "Men",
                                buttonClr: Colors.black,
                              ),
                              CategoryBtn(
                                label: "Women",
                                buttonClr: Colors.grey,
                              ),
                              CategoryBtn(
                                label: "Kids",
                                buttonClr: Colors.grey,
                              ),
                            ],
                          ),
                          CustomSpacer(),
                          Text("Category",
                              style:
                                  appstyle(20, Colors.black, FontWeight.bold)),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CategoryBtn(
                                label: "Shoes",
                                buttonClr: Colors.black,
                              ),
                              CategoryBtn(
                                label: "Apparrels",
                                buttonClr: Colors.grey,
                              ),
                              CategoryBtn(
                                label: "Accessories",
                                buttonClr: Colors.grey,
                              ),
                            ],
                          ),
                          const CustomSpacer(),
                          Text("Price",
                              style:
                                  appstyle(20, Colors.black, FontWeight.bold)),
                          CustomSpacer(),
                          Slider(
                            value: _value,
                            activeColor: Colors.black,
                            inactiveColor: Colors.grey,
                            thumbColor: Colors.black,
                            max: 500,
                            divisions: 50,
                            label: _value.toString(),
                            secondaryTrackValue: 200,
                            onChanged: (double vlaue) {},
                          ),
                          CustomSpacer(),
                          Text(
                            "Brand",
                            style: appstyle(20, Colors.black, FontWeight.bold),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.all(8),
                            height: 80,
                            child: ListView.builder(
                                itemCount: brand.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12))),
                                      child: Image.asset(
                                        brand[index],
                                        height: 60,
                                        width: 80,
                                        color: Colors.black,
                                      ),
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ));
  }
}
