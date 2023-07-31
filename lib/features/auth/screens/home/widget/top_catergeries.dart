import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/screens/home/screens/catergory_deals_screen.dart';
import 'package:flutter/material.dart';

class TopCatergeries extends StatelessWidget {
  const TopCatergeries({super.key});

  void navigateToCategory(BuildContext context, category) {
    Navigator.pushNamed(context, CatergoryDealsScreen.routeName,
        arguments: category);
  }

  @override
  Widget build(context) {
    return SizedBox(
      // color: Colors.white,
      height: 60,
      child: ListView.builder(
        itemCount: GLobalVariables.categoryImages.length,
        scrollDirection: Axis.horizontal,
        itemExtent: 75,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => navigateToCategory(
                context, GLobalVariables.categoryImages[index]['title']!),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      GLobalVariables.categoryImages[index]['image']!,
                      fit: BoxFit.cover,
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
                Text(
                  GLobalVariables.categoryImages[index]['title']!,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
