
// ignore_for_file: file_names

import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/screens/account/widgets/below_appBar.dart';
import 'package:amazon_clone/features/auth/screens/account/widgets/orders.dart';
import 'package:amazon_clone/features/auth/screens/account/widgets/top_Buttons.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(gradient: GLobalVariables.appBarGradient),
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
              Container(
                padding: const EdgeInsets.only(right: 15),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(Icons.notifications_outlined),
                    ),
                    Icon(
                      Icons.search,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: const Column(children: [
        BelowAppBar(),
        SizedBox(
          height: 10,
        ),
        TopButtons(),
        SizedBox(height: 20),
        Orders(),
      ]),
    );
  }
}
