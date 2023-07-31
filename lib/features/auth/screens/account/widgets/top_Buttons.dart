// ignore_for_file: file_names

import 'package:amazon_clone/features/auth/screens/account/widgets/account_button.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({super.key});

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              text: "Your Orders",
              onTap: () {},
            ),
            AccountButton(
              text: "Turn seller",
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            AccountButton(
              text: "Logout",
              onTap: () {},
            ),
            AccountButton(
              text: "Your wishlist",
              onTap: () {},
            ),
          ],
        )
      ],
    );
  }
}
