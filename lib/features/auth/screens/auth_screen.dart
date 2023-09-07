import 'package:amazon_clone/common/widgtes/custom_button.dart';
import 'package:amazon_clone/common/widgtes/custom_textfields.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/services/auth_serevices.dart';
import 'package:flutter/material.dart';

//yasith
enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  static const String routeName = "/auth-screen";
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

//yasith
class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text);
  }

  void signInUser() {
    // print('8.28');
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ignore: prefer_const_constructors
            Text(
              "Welcome",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            ListTile(
                tileColor: _auth == Auth.signup
                    ? GLobalVariables.backgroundColor
                    : GLobalVariables.greyBackgroundCOlor,
                title: const Text(
                  "Create a account",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                )),
            if (_auth == Auth.signup)
              Container(
                padding: const EdgeInsets.all(8),
                color: GLobalVariables.backgroundColor,
                child: Form(
                  key: _signUpFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _nameController,
                        hintText: "Name",
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      CustomTextField(
                        controller: _emailController,
                        hintText: "Email",
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: "Password",
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      CustomButton(
                        text: 'Sign up',
                        onTap: () {
                          if (_signUpFormKey.currentState!.validate()) {
                            signUpUser();
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),

            ListTile(
              tileColor: _auth == Auth.signin
                  ? GLobalVariables.backgroundColor
                  : GLobalVariables.greyBackgroundCOlor,
              title: const Text(
                "Sign in",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Radio(
                value: Auth.signin,
                groupValue: _auth,
                onChanged: (Auth? val) {
                  setState(() {
                    _auth = val!;
                  });
                },
              ),
            ),
            if (_auth == Auth.signin)
              Form(
                key: _signInFormKey,
                child: Column(children: [
                  CustomTextField(
                    controller: _emailController,
                    hintText: "Email",
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomTextField(
                    controller: _passwordController,
                    hintText: "Password",
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomButton(
                    text: 'Sign in',
                    onTap: () {
                      if (_signInFormKey.currentState!.validate()) {
                        signInUser();
                      }
                    },
                  ),
                ]),
              )
          ],
        ),
      )),
    );
  }
}
