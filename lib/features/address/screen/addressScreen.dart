import 'package:amazon_clone/common/widgtes/custom_textfields.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class AddressScreen extends StatefulWidget {
  static const String routeName = '/address';
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  TextEditingController flatController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    flatController.dispose();
    areaController.dispose();
    pinController.dispose();
    cityController.dispose();
  }

  List<PaymentItem> paymentItems = [];

  void onApplePayResult(res) {}

  final _addressKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // var address = context.watch<UserProvider>().user.address;
    var address = 'fake address';

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GLobalVariables.appBarGradient),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if (address.isNotEmpty)
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.black12,
                      )),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          address,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('OR'),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              Form(
                key: _addressKey,
                child: Column(children: [
                  CustomTextField(
                    controller: flatController,
                    hintText: "Flat ,House No, Building",
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomTextField(
                    controller: areaController,
                    hintText: "Area , Street",
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomTextField(
                    controller: cityController,
                    hintText: "Town / City",
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomTextField(
                    controller: pinController,
                    hintText: "Area , Street",
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  // ApplePayButton(
                  //   paymentConfigurationAsset: 'applepay.json',
                  //   onPaymentResult: onApplePayResult,
                  //   paymentItems: paymentItems,
                  // ),

                  GooglePayButton(
                    width: double.infinity,
                    type: GooglePayButtonType.buy,
                    onPaymentResult: onApplePayResult,
                    paymentItems: paymentItems,
                    paymentConfigurationAsset: "gpay.json",
                    loadingIndicator:
                        const Center(child: CircularProgressIndicator()),
                    height: 50,
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
