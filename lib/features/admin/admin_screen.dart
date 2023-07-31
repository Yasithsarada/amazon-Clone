import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/admin/screens/post_Screen.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  double BottomBarWidth = 42;
  double BottomBorderBarWidth = 5;

  List<Widget> pageList = [
    const PostScreen(),
    const Center(
      child: Text("Analytics page"),
    ),
    const Center(
      child: Text("Cart page"),
    ),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GLobalVariables.appBarGradient),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: 120,
                height: 45,
                child: Image.asset('assets/images/amazon_in.png'),
                // color: Colors.black,
              ),
              const Text(
                'Admin',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
      body:
          // Center(child:  Text('Admin Screen')),
          pageList[_page],
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
              //post
              width: BottomBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(
                  color: _page == 0
                      ? GLobalVariables.selectedNavBarColor
                      : GLobalVariables.backgroundColor,
                  width: BottomBorderBarWidth,
                ),
              )),
              //home
              child: const Icon(Icons.home_outlined),
            ),
            label: '',
          ),
          //analytics
          BottomNavigationBarItem(
            icon: Container(
              width: BottomBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(
                  color: _page == 1
                      ? GLobalVariables.selectedNavBarColor
                      : GLobalVariables.backgroundColor,
                  width: BottomBorderBarWidth,
                ),
              )),
              child: const Icon(Icons.analytics_outlined),
            ),
            label: '',
          ),

          //Orders
          BottomNavigationBarItem(
            icon: Container(
              width: BottomBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(
                  color: _page == 2
                      ? GLobalVariables.selectedNavBarColor
                      : GLobalVariables.backgroundColor,
                  width: BottomBorderBarWidth,
                ),
              )),
              child: const Icon(Icons.all_inbox_outlined),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
