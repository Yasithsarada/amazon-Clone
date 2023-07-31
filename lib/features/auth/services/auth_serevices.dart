import 'dart:convert';
import 'package:amazon_clone/common/widgtes/Bottom_bar.dart';
import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:amazon_clone/provider/user_Provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

//yasith
class AuthService {
  void signUpUser(
      {required BuildContext context,
      required String email,
      required String password,
      required String name}) async {
    try {
      User user = User(
          id: '',
          name: name,
          password: password,
          email: email,
          address: '',
          type: '',
          token: '');
      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=utf-8'
        },
      );
      // print(res.body);
      // ignore: use_build_context_synchronously
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
              context, 'Account created !! Login with same credentials');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      // print("working");
      // print(res.body);
      // if (!context.mounted) {
      //   return;
      // }
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences pref = await SharedPreferences.getInstance();
          // if (!context.mounted) return;
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await pref.setString('X-auth-token', jsonDecode(res.body)['token']);

          // if (!context.mounted) {
          //   return;
          // }
          Navigator.pushNamedAndRemoveUntil(
            context,
            BottomBar.routeName,
            (route) => false,
          );
        },
      );
      print(res.body);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void getUserData({BuildContext? context}) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('X-auth-token');

      if (token == null) {
        pref.setString('X-auth-token', '');
      }
      var tokenRes = await http.get(
        Uri.parse('$uri/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'X-auth-token': token!
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        //get user data
        http.Response userRes = await http.get(
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'X-auth-token': token
          },
        );
        var userProvider = Provider.of<UserProvider>(context!, listen: false);
        // print('user res :');
        // print(userRes.body);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context!, e.toString());
    }
  }
}
