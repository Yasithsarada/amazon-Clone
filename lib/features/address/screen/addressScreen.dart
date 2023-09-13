import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GLobalVariables.appBarGradient),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(left: 15),
                  width: 120,
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                  ),
                ),
              ),
              Container(
                  color: Colors.transparent,
                  height: 42,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: const Icon(
                    Icons.mic,
                    color: Colors.black,
                    size: 25,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
