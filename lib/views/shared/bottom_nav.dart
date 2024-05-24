import 'package:ecommerceapp/views/shared/bottom_nav_widget.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:ecommerceapp/controllers/mainscreen_provider.dart';
import 'package:ecommerceapp/views/ui/mainscreen.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
        builder: (context, mainscreenNotifier, child) {
      return SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BottomNavWidget(
                    icon: mainscreenNotifier.pageIndex == 0
                        ? Ionicons.home
                        : Ionicons.home_outline,
                    onTap: () {
                      mainscreenNotifier.pageIndex = 0;
                    },
                  ),
                  BottomNavWidget(
                    icon: mainscreenNotifier.pageIndex == 1
                        ? Ionicons.search
                        : Ionicons.search_outline,
                    onTap: () {
                      mainscreenNotifier.pageIndex = 1;
                    },
                  ),
                  BottomNavWidget(
                    icon: mainscreenNotifier.pageIndex == 2
                        ? Ionicons.heart
                        : Ionicons.heart_circle_outline,
                    onTap: () {
                      mainscreenNotifier.pageIndex = 2;
                    },
                  ),
                  BottomNavWidget(
                    icon: mainscreenNotifier.pageIndex == 3
                        ? Ionicons.cart
                        : Ionicons.cart_outline,
                    onTap: () {
                      mainscreenNotifier.pageIndex = 3;
                    },
                  ),
                  BottomNavWidget(
                    icon: mainscreenNotifier.pageIndex == 4
                        ? Ionicons.person
                        : Ionicons.person_outline,
                    onTap: () {
                      mainscreenNotifier.pageIndex = 4;
                    },
                  ),
                ],
              ),
            )),
      );
    });
  }
}
