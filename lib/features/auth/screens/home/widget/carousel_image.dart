import 'package:amazon_clone/constants/global_variables.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselImage extends StatelessWidget {
  const CarouselImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: GLobalVariables.carouselImages.map((i) {
        return Builder(
            builder: (BuildContext context) =>
                Image.network(i, fit: BoxFit.cover, height: 200));
        // if (i == 2) {
        //   print("it's 2");
        // }
      }).toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        height: 200,
      ),
    );
  }
}
