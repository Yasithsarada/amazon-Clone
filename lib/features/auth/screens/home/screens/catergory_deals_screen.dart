import 'package:amazon_clone/common/widgtes/loader.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/services/homeServices.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

class CatergoryDealsScreen extends StatefulWidget {
  static const String routeName = '/category-deals';
  final String category;
  const CatergoryDealsScreen({super.key, required this.category});

  @override
  State<CatergoryDealsScreen> createState() => _CatergoryDealsScreenState();
}

class _CatergoryDealsScreenState extends State<CatergoryDealsScreen> {
  List<Product> productList = [];
  final HomeServices homeServices = HomeServices();
  @override
  void initState() {
    super.initState();
    fetchCategoryProducts();
  }

  void fetchCategoryProducts() async {
    productList = await homeServices.fetchCategoryProducts(
      category: widget.category,
      context: context,
    );
    setState(() {});
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
          title: Text(widget
              .category), // widget property is updated when the parent widget updates the location in the widget tree.If the parent widget updates this location to a new widget with the same runtimeType and key as the current configuration, the framework will do the following: 1)Update the widget property of the State object to refer to the new widget.2)Call the didUpdateWidget method on the State object, passing the old configuration (the previous widget instance) as an argument.
          //This behavior allows the State object to handle changes in the widget configuration and react accordingly. For example, when the parent widget rebuilds and provides a new widget with updated data or properties, the State object can respond to those changes by implementing the didUpdateWidget method and updating its internal state based on the new widget's properties.
        ),
      ),
      body: productList == null
          ? const Loader()
          : Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  alignment: Alignment.topLeft,
                  child: Text('Keep shopping for ${widget.category}',
                      style: const TextStyle(fontSize: 20)),
                ),
                SizedBox(
                  height: 170,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 15),
                    itemCount: productList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 1.4,
                            mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      final product = productList[index];
                      return Column(
                        children: [
                          SizedBox(
                            height: 130,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 0.5,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Image.network(product.images[0]),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding:
                                const EdgeInsets.only(left: 0, top: 5, right: 15),
                            child: Text(
                              product.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
