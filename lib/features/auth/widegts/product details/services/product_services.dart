import 'dart:convert';
import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:amazon_clone/provider/user_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ProductDetailServices {
  void addToCart({
    required BuildContext context,
    required Product product,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    print('oooooo');
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/add-to-cart'),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'X-auth-token': userProvider.user.token,
        },
        body: jsonEncode(
          {
            'id': product.id!,
          },
        ),
      );
      print(product.id);
      // print(res);
      // ignore: use_build_context_synchronously
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          User user =
              userProvider.user.copyWith(cart: jsonDecode(res.body)['cart']);
          userProvider.setUserFromModel(user);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e);
    }
  }

  void rateProduct({
    required BuildContext context,
    required Product product,
    required double rating,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    print('oooooo');
    try {
      print(rating);
      print(product);
      http.Response res = await http.post(
        Uri.parse('$uri/api/rate-product'),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'X-auth-token': userProvider.user.token,
        },
        body: jsonEncode(
          {
            'id': product.id!,
            'rating': rating,
          },
        ),
      );
      print(product.id);
      print(res);
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          print('success');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e);
    }
  }
}
