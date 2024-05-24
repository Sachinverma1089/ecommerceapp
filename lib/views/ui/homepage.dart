import 'package:ecommerceapp/models/sneaker_model.dart';
import 'package:ecommerceapp/services/helper.dart';
import 'package:ecommerceapp/views/shared/appstyle.dart';
import 'package:ecommerceapp/views/shared/home_widget.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE2E2E2),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(10, 45, 0, 5),
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/top_imagePIC.png'),
                          fit: BoxFit.fill)),
                  child: Container(
                    padding: EdgeInsets.only(left: 2, bottom: 15),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Athletics Shoes Collection",
                          style: appstyleWithHeight(
                              42, Colors.white, FontWeight.bold, 1.2),
                        ),
                        TabBar(
                            padding: EdgeInsets.zero,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: Colors.transparent,
                            controller: _tabController,
                            isScrollable: true,
                            labelColor: Colors.white,
                            labelStyle:
                                appstyle(24, Colors.white, FontWeight.bold),
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
                            ]),
                      ],
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.315),
                child: Container(
                  padding: const EdgeInsets.only(left: 12),
                  child: TabBarView(controller: _tabController, children: [
                    HomeWidget(
                      male: _male,
                      tabIndex: 0,
                    ),
                    HomeWidget(
                      male: _female,
                      tabIndex: 1,
                    ),
                    HomeWidget(
                      male: _kids,
                      tabIndex: 2,
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
