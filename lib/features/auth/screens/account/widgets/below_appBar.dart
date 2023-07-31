// ignore_for_file: file_names

import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/provider/user_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BelowAppBar extends StatelessWidget {
  const BelowAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    // print("hereeeeeeeee");
    // print(user.name);
    return Container(
      decoration: const BoxDecoration(
        gradient: GLobalVariables.appBarGradient,
      ),
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Row(children: [
        RichText(
          text: TextSpan(
              text: 'Hello, ',
              style: const TextStyle(
                fontSize: 22,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                    text: user.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black)
                    // style: Colors.black,
                    ),
              ]),
        ),
      ]),
    );
  }
}
