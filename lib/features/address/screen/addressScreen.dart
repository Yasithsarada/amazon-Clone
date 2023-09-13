// import 'package:flutter/material.dart';

// class AddressScreen extends StatefulWidget {
//   const AddressScreen({super.key});

//   @override
//   State<AddressScreen> createState() => _AddressScreenState();
// }

// class _AddressScreenState extends State<AddressScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(60),
//         child: AppBar(
//           flexibleSpace: Container(
//             decoration:
//                 const BoxDecoration(gradient: GLobalVariables.appBarGradient),
//           ),
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 child: Container(
//                   height: 42,
//                   margin: const EdgeInsets.only(left: 15),
//                   width: 120,
//                   child: Material(
//                     borderRadius: BorderRadius.circular(7),
//                     elevation: 1,
//                     child: TextFormField(
//                       onFieldSubmitted: navigateToSearchScreen,
//                       decoration: InputDecoration(
//                         prefixIcon: InkWell(
//                           onTap: () {},
//                           child: const Padding(
//                               padding: EdgeInsets.only(left: 6),
//                               child: Icon(
//                                 Icons.search,
//                                 color: Colors.black,
//                                 size: 23,
//                               )),
//                         ),
//                         filled: true,
//                         fillColor: Colors.white,
//                         contentPadding: const EdgeInsets.only(top: 10),
//                         border: const OutlineInputBorder(
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(7),
//                             ),
//                             borderSide:
//                                 BorderSide(color: Colors.black38, width: 1)),
//                         hintText: 'Search Amazon.in',
//                         hintStyle: const TextStyle(
//                             fontSize: 17, fontWeight: FontWeight.w500),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                   color: Colors.transparent,
//                   height: 42,
//                   margin: const EdgeInsets.symmetric(
//                     horizontal: 10,
//                   ),
//                   child: const Icon(
//                     Icons.mic,
//                     color: Colors.black,
//                     size: 25,
//                   ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
