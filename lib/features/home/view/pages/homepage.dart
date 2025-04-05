// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:falconsathi/core/theme/app_pallete.dart';
// import 'package:falconsathi/features/home/view/pages/sidebar.dart';
// import 'package:falconsathi/features/services/view/pages/services.dart';
// import 'package:falconsathi/features/sidecomponents/profile.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<Map<String, String>> carouselItems = [
//       {
//         'image': 'assets/images/home-cleaning.jpg',
//         'title': 'Professional Cleaning Services'
//       },
//       {
//         'image': 'assets/images/water-tank-cleaning.jpg',
//         'title': 'Water Tank Solutions'
//       },
//       {'image': 'assets/images/water-ro.jpg', 'title': 'RO Services'},
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Pallete.blueDarkColor,
//         automaticallyImplyLeading: false,
//         title: IconButton(
//             onPressed: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => const Sidebar()));
//             },
//             icon: const Icon(
//               Icons.menu,
//               color: Colors.white,
//             )),
//         actions: [
//           IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.notifications,
//                 color: Colors.white,
//               )),
//           IconButton(
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const ProfilePage()));
//               },
//               icon: const Icon(
//                 Icons.person,
//                 color: Colors.white,
//               )),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Image Carousel
//             CarouselSlider(
//               options: CarouselOptions(
//                 height: 200,
//                 autoPlay: true,
//                 enlargeCenterPage: true,
//                 aspectRatio: 16 / 9,
//                 autoPlayCurve: Curves.fastOutSlowIn,
//                 enableInfiniteScroll: true,
//                 autoPlayAnimationDuration: const Duration(milliseconds: 800),
//                 viewportFraction: 0.8,
//               ),
//               items: carouselItems
//                   .map((item) => Container(
//                         margin: const EdgeInsets.all(5.0),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10.0),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.shade400,
//                               spreadRadius: 2,
//                               blurRadius: 5,
//                               offset: const Offset(0, 3),
//                             ),
//                           ],
//                         ),
//                         child: Stack(
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(10.0),
//                               child: Image.asset(
//                                 item['image']!,
//                                 fit: BoxFit.cover,
//                                 width: double.infinity,
//                               ),
//                             ),
//                             Positioned(
//                               bottom: 0,
//                               left: 0,
//                               right: 0,
//                               child: Container(
//                                 decoration: const BoxDecoration(
//                                   gradient: LinearGradient(
//                                     begin: Alignment.bottomCenter,
//                                     end: Alignment.topCenter,
//                                     colors: [
//                                       Colors.black87,
//                                       Colors.transparent,
//                                     ],
//                                   ),
//                                 ),
//                                 padding: const EdgeInsets.symmetric(
//                                     vertical: 10, horizontal: 20),
//                                 child: Text(
//                                   item['title']!,
//                                   style: const TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ))
//                   .toList(),
//             ),

//             // Services Section
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Our Services',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Pallete.blueDarkColor,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   GridView.count(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     crossAxisCount: 2,
//                     mainAxisSpacing: 15,
//                     crossAxisSpacing: 15,
//                     children: [
//                       _buildServiceCard('Water Tank Cleaning',
//                           Icons.water_outlined, Colors.blue, () {}),
//                       _buildServiceCard('Pipeline Cleaning', Icons.plumbing,
//                           const Color.fromARGB(255, 22, 52, 23), () {}),
//                       _buildServiceCard(
//                           'RO Repairing', Icons.build, Colors.orange, () {}),
//                       _buildServiceCard(
//                           'More Services', Icons.more_horiz, Colors.purple, () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const ServicesPage()));
//                       }),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             // Products Section
//             // Padding(
//             //   padding: const EdgeInsets.all(16.0),
//             //   child: Column(
//             //     crossAxisAlignment: CrossAxisAlignment.start,
//             //     children: [
//             //       Text(
//             //         'Purchase Products',
//             //         style: TextStyle(
//             //           fontSize: 24,
//             //           fontWeight: FontWeight.bold,
//             //           color: Pallete.blueDarkColor,
//             //         ),
//             //       ),
//             //       const SizedBox(height: 10),
//             //       GridView.count(
//             //         shrinkWrap: true,
//             //         physics: const NeverScrollableScrollPhysics(),
//             //         crossAxisCount: 2,
//             //         mainAxisSpacing: 15,
//             //         crossAxisSpacing: 15,
//             //         children: [
//             //           _buildProductCard(
//             //             'RO System',
//             //             'assets/images/ro.png',
//             //             '₹15,000',
//             //           ),
//             //           _buildProductCard(
//             //             'Water Alarm',
//             //             'assets/images/alarm.jpg',
//             //             '₹2,000',
//             //           ),
//             //           _buildProductCard(
//             //             'RO Filter',
//             //             'assets/images/filter.jpg',
//             //             '₹1,500',
//             //           ),
//             //           TextButton(
//             //             onPressed: () {
//             //               Navigator.push(
//             //                   context,
//             //                   MaterialPageRoute(
//             //                       builder: (context) => PurchasePage()));
//             //             },
//             //             child: Text(
//             //               'More Products',
//             //             ),
//             //             // child: _buildProductCard(
//             //             //   'More Products',
//             //             //   'assets/images/more.png',
//             //             //   'View All',
//             //             // ),
//             //           ),
//             //         ],
//             //       ),
//             //     ],
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildServiceCard(
//       String serviceName, IconData icon, Color color, VoidCallback onPressed) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: InkWell(
//         onTap: onPressed,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: color,
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(icon, size: 40, color: Colors.white),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               serviceName,
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Widget _buildProductCard(String productName, String imagePath, String price) {
//   //   return Card(
//   //     elevation: 4,
//   //     shape: RoundedRectangleBorder(
//   //       borderRadius: BorderRadius.circular(15),
//   //     ),
//   //     child: InkWell(
//   //       onTap: () {},
//   //       child: Column(
//   //         crossAxisAlignment: CrossAxisAlignment.start,
//   //         children: [
//   //           Expanded(
//   //             child: ClipRRect(
//   //               borderRadius:
//   //                   const BorderRadius.vertical(top: Radius.circular(15)),
//   //               child: Image.asset(
//   //                 imagePath,
//   //                 fit: BoxFit.cover,
//   //                 width: double.infinity,
//   //               ),
//   //             ),
//   //           ),
//   //           Padding(
//   //             padding: const EdgeInsets.all(8.0),
//   //             child: Column(
//   //               crossAxisAlignment: CrossAxisAlignment.start,
//   //               children: [
//   //                 Text(
//   //                   productName,
//   //                   style: const TextStyle(
//   //                     fontSize: 16,
//   //                     fontWeight: FontWeight.bold,
//   //                   ),
//   //                 ),
//   //                 const SizedBox(height: 4),
//   //                 Text(
//   //                   price,
//   //                   style: const TextStyle(
//   //                     color: Colors.green,
//   //                     fontWeight: FontWeight.bold,
//   //                   ),
//   //                 ),
//   //               ],
//   //             ),
//   //           ),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }
// }
