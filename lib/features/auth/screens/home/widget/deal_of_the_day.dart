import 'package:amazon_clone/common/widgtes/loader.dart';
import 'package:amazon_clone/features/auth/services/homeServices.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

class DealOfTheDay extends StatefulWidget {
  const DealOfTheDay({super.key});

  @override
  State<DealOfTheDay> createState() => _DealOThefDayState();
}

class _DealOThefDayState extends State<DealOfTheDay> {
  Product? product;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchDealOfTheDay();
  }

  void fetchDealOfTheDay() async {
    product = await homeServices.fetchDealOfTheDay(context: context);
    if (mounted) {
      setState(() {
        // Your state change code goes here
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return product == null
        ? const Loader()
        : product!.name.isEmpty
            ? const SizedBox()
            : Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 10, top: 15),
                    child: const Text(
                      'Deal of the day',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Image.network(
                    product!.images[0],
                    height: 240,
                    fit: BoxFit.contain,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    alignment: Alignment.topLeft,
                    child: const Text(
                      '\$100',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(
                      left: 15,
                      top: 5,
                      right: 40,
                    ),
                    child: const Text(
                      'frock',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: product!.images
                          .map(
                            (e) => Image.network(
                              e,
                              fit: BoxFit.fitWidth,
                              width: 100,
                              height: 100,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ).copyWith(left: 15),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'see all deals',
                      style: TextStyle(color: Colors.cyan[800]),
                    ),
                  )
                ],
              );
  }
}
