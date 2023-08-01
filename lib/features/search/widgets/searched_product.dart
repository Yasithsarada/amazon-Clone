import 'package:amazon_clone/common/widgtes/stars.dart';
import 'package:amazon_clone/features/product%20details/screens/product_detail_screen.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/provider/user_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchedProduct extends StatelessWidget {
  final Product product;
  const SearchedProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double avgRating = 0;
    double myRating = 0;

    double starsCalc() {
      double totalRating = 0;
      for (var i = 0; i < product.rating!.length; i++) {
        totalRating += product.rating![i].rating;
        if (product.rating![i].userId ==
            Provider.of<UserProvider>(context, listen: false).user.id) {
          myRating = product.rating![i].rating;
        }
        if (totalRating != 0) {
          avgRating = totalRating / product.rating!.length;
          print("avgRating");
          print(avgRating);
        }
      }

      return avgRating;
    }

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ProductDetailScreen.routeName,
                arguments: product);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Image.network(
                  product.images[0],
                  fit: BoxFit.contain,
                  height: 135,
                  width: 135,
                ),
                Column(
                  children: [
                    Container(
                      width: 235,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        product.name,
                        style: const TextStyle(fontSize: 16),
                        maxLines: 2,
                      ),
                    ),
                    Container(
                      width: 235,
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: Stars(rating: starsCalc()),
                    ),
                    Container(
                      width: 235,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        '\$${product.price}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                      ),
                    ),
                    Container(
                      width: 235,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: const Text(
                        'Elegible for Free shipping',
                        // style: TextStyle(fontSize: 16),
                        maxLines: 2,
                      ),
                    ),
                    Container(
                      width: 235,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: const Text(
                        'In stock',
                        style: TextStyle(
                          color: Colors.teal,
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
