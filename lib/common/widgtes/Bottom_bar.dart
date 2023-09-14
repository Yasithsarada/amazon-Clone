import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/screens/account/screens/account_Screen.dart';
import 'package:amazon_clone/features/auth/screens/home/screens/home_Screen.dart';
import 'package:amazon_clone/features/cart/screens/cart_screens.dart';
import 'package:amazon_clone/provider/user_Provider.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});
  static const String routeName = '/not-actual-home';

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBorderBarWidth = 5;

  List<Widget> pageList = [
    const HomeScreen(),
    const AccountScreen(),
    const CartScreen()
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;
    return Scaffold(
      body: pageList[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GLobalVariables.selectedNavBarColor,
        unselectedItemColor: GLobalVariables.unselectedNavBarColor,
        backgroundColor: GLobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              //home
              width: bottomBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(
                  color: _page == 0
                      ? GLobalVariables.selectedNavBarColor
                      : GLobalVariables.backgroundColor,
                  width: bottomBorderBarWidth,
                ),
              )),
              //home
              child: const Icon(Icons.home_outlined),
            ),
            label: '',
          ),
          //account
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(
                  color: _page == 1
                      ? GLobalVariables.selectedNavBarColor
                      : GLobalVariables.backgroundColor,
                  width: bottomBorderBarWidth,
                ),
              )),
              child: const Icon(Icons.person_outline_outlined),
            ),
            label: '',
          ),

          //cart
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(
                  color: _page == 2
                      ? GLobalVariables.selectedNavBarColor
                      : GLobalVariables.backgroundColor,
                  width: bottomBorderBarWidth,
                ),
              )),
              child: badges.Badge(
                badgeStyle: const badges.BadgeStyle(
                  badgeColor: Colors.blue,
                ),
                position: badges.BadgePosition.topEnd(top: -14),
                badgeContent: Text(
                  // '3',
                  userCartLen.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                child: const Icon(Icons.shopping_cart),
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
