// import 'package:flutter/material.dart';
// import 'package:falconsathi/core/theme/app_pallete.dart';

// class CustomUi {
//   static currentBox(String text, double width) {
//     return Container(
//       width: width,
//       height: 40,
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//         // gradient: LinearGradient(
//         //   colors: [Pallete.gradient1, Pallete.gradient2],
//         //   begin: Alignment.bottomLeft,
//         //   end: Alignment.topRight,
//         // ),
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Text(
//         text,
//         style: const TextStyle(
//             color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
//       ),
//     );
//   }

//   static homeHeading(String text) {
//     return Text(
//       text,
//       style: const TextStyle(
//           color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
//     );
//   }

//   static gkBox(String text, String imgurl) {
//     return Container(
//       width: 120,
//       height: 120,
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//         color: Pallete.blueColor,
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//                 clipBehavior: Clip.antiAlias,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: Image.asset("assets/images/$imgurl")),
//           ),
//           Text(
//             text,
//             style: const TextStyle(
//                 color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }

//   static quizBox(
//     String text,
//   ) {
//     return Container(
//       width: 150,
//       height: 90,
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//         gradient:
//             LinearGradient(colors: [Pallete.gradient3, Pallete.gradient4]),
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Text(
//         text,
//         style: const TextStyle(
//             color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
//       ),
//     );
//   }
// }
