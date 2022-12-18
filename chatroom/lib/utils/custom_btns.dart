// import 'package:flutter/material.dart';

// Widget socialBtn(
//     {bColor,
//     fColor,
//     brColor,
//     text,
//     icon,
//     iconColor,
//     isGoogle,
//     gap,
//     ontap,
//     trail}) {
//   return InkWell(
//     onTap: ontap,
//     child: Container(
//       height: 42,
//       width: 300,
//       decoration: BoxDecoration(
//         color: bColor,
//         borderRadius: BorderRadius.circular(30),
//         border: Border.all(color: brColor),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               isGoogle ? const SizedBox(width: 12) : const SizedBox(width: 16),
//               isGoogle
//                   ? Image.network(
//                       'http://pngimg.com/uploads/google/google_PNG19635.png',
//                       width: 31,
//                       height: 31,
//                     )
//                   : Icon(
//                       icon,
//                       color: iconColor,
//                     ),
//               SizedBox(width: gap),
//               Text(
//                 text,
//                 style: TextStyle(
//                   color: fColor,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.only(right: 25),
//             child: Icon(
//               trail,
//               color: Colors.amber,
//               size: 15,
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// Widget otpBTN({number, ontap}) {
//   return TextButton(
//     onPressed: ontap,
//     child: Text(
//       number.toString(),
//       style: TextStyle(fontSize: 30, color: Colors.grey[400]),
//     ),
//   );
// }

//  // Padding(
//             //   padding: const EdgeInsets.symmetric(horizontal: 40),
//             //   child: Column(
//             //     children: [
//             //       Row(
//             //         mainAxisAlignment: MainAxisAlignment.spaceAround,
//             //         children: [
//             //           otpBTN(
//             //             number: 1,
//             //             ontap: () {
//             //               _pinPutController.text += 1.toString();
//             //             },
//             //           ),
//             //           otpBTN(
//             //             number: 2,
//             //             ontap: () {
//             //               _pinPutController.text += 2.toString();
//             //             },
//             //           ),
//             //           otpBTN(
//             //             number: 3,
//             //             ontap: () {
//             //               _pinPutController.text += 3.toString();
//             //             },
//             //           ),
//             //         ],
//             //       ),
//             //       const SizedBox(height: 35),
//             //       Row(
//             //         mainAxisAlignment: MainAxisAlignment.spaceAround,
//             //         children: [
//             //           otpBTN(
//             //             number: 4,
//             //             ontap: () {
//             //               _pinPutController.text += 4.toString();
//             //             },
//             //           ),
//             //           otpBTN(
//             //             number: 5,
//             //             ontap: () {
//             //               _pinPutController.text += 5.toString();
//             //             },
//             //           ),
//             //           otpBTN(
//             //             number: 6,
//             //             ontap: () {
//             //               _pinPutController.text += 6.toString();
//             //             },
//             //           ),
//             //         ],
//             //       ),
//             //       const SizedBox(height: 35),
//             //       Row(
//             //         mainAxisAlignment: MainAxisAlignment.spaceAround,
//             //         children: [
//             //           otpBTN(
//             //             number: 7,
//             //             ontap: () {
//             //               _pinPutController.text += 7.toString();
//             //             },
//             //           ),
//             //           otpBTN(
//             //             number: 8,
//             //             ontap: () {
//             //               _pinPutController.text += 8.toString();
//             //             },
//             //           ),
//             //           otpBTN(
//             //             number: 9,
//             //             ontap: () {
//             //               _pinPutController.text += 9.toString();
//             //             },
//             //           ),
//             //         ],
//             //       ),
//             //       const SizedBox(height: 35),
//             //       Row(
//             //         mainAxisAlignment: MainAxisAlignment.center,
//             //         children: [
//             //           otpBTN(
//             //             number: 0,
//             //             ontap: () {
//             //               _pinPutController.text += 0.toString();
//             //             },
//             //           ),
//             //         ],
//             //       ),
//             //     ],
//             //   ),
//             // ),