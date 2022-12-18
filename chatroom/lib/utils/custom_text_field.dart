// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:demo/utils/global.dart';
// import 'package:flutter/material.dart';

// Widget textField({controller, icon, text, label}) {
//   return SizedBox(
//     height: 44,
//     width: 300,
//     child: TextFormField(
//       controller: controller,
//       cursorColor: Colors.grey[700],
//       textAlign: TextAlign.left,
//       style: const TextStyle(fontSize: 15),
//       decoration: InputDecoration(
//           contentPadding: const EdgeInsets.only(left: 30, top: 15),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30),
//             borderSide: const BorderSide(color: Colors.white),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: Colors.white),
//             borderRadius: BorderRadius.circular(30),
//           ),
//           prefixIcon: Padding(
//             padding: const EdgeInsets.only(left: 10),
//             child: Icon(
//               icon,
//               size: 20,
//               color: Colors.grey[300],
//             ),
//           ),
//           hintText: text,
//           label: label,
//           floatingLabelStyle: const TextStyle(color: Colors.white)),
//     ),
//   );
// }

// Widget textFieldPhone({controller, icon, text}) {
//   return SizedBox(
//     height: 50,
//     width: double.infinity,
//     child: TextFormField(
//       keyboardType: TextInputType.phone,
//       controller: controller,
//       cursorColor: Colors.grey[700],
//       textAlign: TextAlign.left,
//       style: const TextStyle(fontSize: 16),
//       decoration: InputDecoration(
//         contentPadding: const EdgeInsets.only(top: 20),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30),
//           borderSide: const BorderSide(color: Colors.white),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Colors.white),
//           borderRadius: BorderRadius.circular(30),
//         ),
//         prefixIcon: SizedBox(
//           width: 128,
//           child: Row(
//             children: [
//               CountryCodePicker(
//                 textStyle: const TextStyle(
//                   fontSize: 18,
//                   color: Colors.white,
//                 ),
//                 barrierColor: Colors.grey[800],
//                 boxDecoration: BoxDecoration(color: Colors.black),
//                 initialSelection: "+92",
//                 onChanged: (code) {
//                   countryCode = code;
//                   print(countryCode!);
//                 },
//               ),
//               // const SizedBox(width: 5),
//               const Padding(
//                 padding: EdgeInsets.only(bottom: 3),
//                 child: Text(
//                   "|",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 30,
//                       fontWeight: FontWeight.w300),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         hintText: text,
//       ),
//     ),
//   );
// }
