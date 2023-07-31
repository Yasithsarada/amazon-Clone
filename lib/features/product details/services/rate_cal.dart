
// import 'package:amazon_clone/models/product.dart';
// import 'package:flutter/material.dart'; 
// import 'package:amazon_clone/provider/user_Provider.dart';
// import 'package:provider/provider.dart';

// class AvgRateCalculate {
//   late Product product;
//    double starsCalc(
//       {
//       required BuildContext context,
//       required double myRating,
//       required Product product
//       }
//       ) {
//     double totalRating = 0;
//     for (var i = 0; i < widget.product.rating!.length; i++) {
//       totalRating += widget.product.rating![i].rating;
//       if (widget.product.rating![i].userId ==
//           Provider.of<UserProvider>(context, listen: false).user.id) {
//         myRating = widget.product.rating![i].rating;
//       }
//       if (totalRating != 0) {
//         avgRating = totalRating / widget.product.rating!.length;
//         print("avgRating");
//         print(avgRating);
//       }
//     }
   
//     return 2.0;
//   }
// }