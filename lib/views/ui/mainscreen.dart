import 'package:ecommerceapp/controllers/mainscreen_provider.dart';

import 'package:ecommerceapp/views/shared/bottom_nav.dart';
import 'package:ecommerceapp/views/ui/cartpage.dart';
import 'package:ecommerceapp/views/ui/favorites.dart';

import 'package:ecommerceapp/views/ui/homepage.dart';

import 'package:ecommerceapp/views/ui/profile.dart';
import 'package:ecommerceapp/views/ui/searchpage.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  List<Widget> pageList = [
    HomePage(),
    SearchPage(),
    Favorites(),
    CartPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
        builder: (context, mainscreenNotifier, child) {
      return Scaffold(
        backgroundColor: Color(0xFFE2E2E2),
        body: pageList[mainscreenNotifier.pageIndex],
        bottomNavigationBar: const BottomNavBar(),
      );
    });
  }
}
