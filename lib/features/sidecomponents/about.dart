// import 'package:flutter/material.dart';
// import 'package:falconsathi/core/theme/app_pallete.dart';
// import 'package:falconsathi/features/auth/view/widgets/gradiant_btn.dart';

// class AboutUsPage extends StatelessWidget {
//   const AboutUsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var he = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: Pallete.blueDarkColor,
//       appBar: AppBar(
//         backgroundColor: Pallete.blueDarkColor,
//         title: const Text(
//           'About Us',
//           style: TextStyle(color: Colors.white),
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding:
//               EdgeInsets.symmetric(horizontal: he * 0.03, vertical: he * 0.02),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // App Logo and Name
//               Center(
//                 child: Column(
//                   children: [
//                     Container(
//                       height: 120,
//                       width: 120,
//                       decoration: BoxDecoration(
//                         color: Pallete.blueColor,
//                         shape: BoxShape.circle,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Pallete.gradient1.withOpacity(0.5),
//                             blurRadius: 20,
//                             spreadRadius: 5,
//                           ),
//                         ],
//                       ),
//                       child: Center(
//                         child: Image.asset(
//                           'assets/images/logo.png',
//                           height: 80,
//                           width: 80,
//                           // If you don't have a logo asset, use an icon instead:
//                           errorBuilder: (context, error, stackTrace) => Icon(
//                             Icons.school,
//                             size: 60,
//                             color: Pallete.textColor,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 15),
//                     Text(
//                       'falconsathi',
//                       style: TextStyle(
//                         fontSize: 28,
//                         fontWeight: FontWeight.bold,
//                         color: Pallete.titleTextColor,
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     Text(
//                       'Version 1.0.0',
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.white.withOpacity(0.7),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 30),

//               // Our Mission Section
//               _buildSectionHeader('Our Mission'),
//               _buildContentCard(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Empowering Education Through Technology',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Pallete.textColor,
//                       ),
//                     ),
//                     const SizedBox(height: 15),
//                     const Text(
//                       'falconsathi is dedicated to revolutionizing the way students prepare for exams. Our mission is to provide an accessible, engaging, and effective platform that helps students achieve academic excellence through personalized learning experiences.',
//                       style: TextStyle(
//                         fontSize: 15,
//                         color: Colors.white,
//                         height: 1.5,
//                       ),
//                     ),
//                     const SizedBox(height: 15),
//                     const Text(
//                       'We believe that quality education should be available to everyone, regardless of their background or location. Through innovative technology and thoughtful design, we aim to break down barriers to learning and create opportunities for all students to succeed.',
//                       style: TextStyle(
//                         fontSize: 15,
//                         color: Colors.white,
//                         height: 1.5,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 25),

//               // Key Features Section
//               _buildSectionHeader('Key Features'),
//               _buildContentCard(
//                 child: Column(
//                   children: [
//                     _buildFeatureItem(
//                       icon: Icons.quiz,
//                       title: 'Interactive Quizzes',
//                       description:
//                           'Engage with dynamic quizzes that adapt to your learning style and pace.',
//                     ),
//                     const Divider(color: Colors.white24, height: 30),
//                     _buildFeatureItem(
//                       icon: Icons.analytics,
//                       title: 'Performance Analytics',
//                       description:
//                           'Track your progress with detailed insights and personalized recommendations.',
//                     ),
//                     const Divider(color: Colors.white24, height: 30),
//                     _buildFeatureItem(
//                       icon: Icons.timer,
//                       title: 'Timed Practice Tests',
//                       description:
//                           'Prepare for the real exam environment with timed practice sessions.',
//                     ),
//                     const Divider(color: Colors.white24, height: 30),
//                     _buildFeatureItem(
//                       icon: Icons.people,
//                       title: 'Collaborative Learning',
//                       description:
//                           'Connect with peers and educators to enhance your learning experience.',
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 25),

//               // Our Team Section
//               _buildSectionHeader('Our Team'),
//               _buildContentCard(
//                 child: Column(
//                   children: [
//                     _buildTeamMember(
//                       name: 'Sarah Johnson',
//                       role: 'Founder & CEO',
//                       bio:
//                           'Former educator with 15+ years of experience in educational technology.',
//                     ),
//                     const Divider(color: Colors.white24, height: 30),
//                     _buildTeamMember(
//                       name: 'Michael Chen',
//                       role: 'Chief Technology Officer',
//                       bio:
//                           'Software engineer passionate about creating intuitive learning platforms.',
//                     ),
//                     const Divider(color: Colors.white24, height: 30),
//                     _buildTeamMember(
//                       name: 'Priya Patel',
//                       role: 'Head of Content',
//                       bio:
//                           'Curriculum specialist focused on creating engaging educational materials.',
//                     ),
//                     const Divider(color: Colors.white24, height: 30),
//                     _buildTeamMember(
//                       name: 'David Okafor',
//                       role: 'UX/UI Designer',
//                       bio:
//                           'Designer dedicated to creating accessible and beautiful learning experiences.',
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 25),

//               // Contact Us Section
//               _buildSectionHeader('Contact Us'),
//               _buildContentCard(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _buildContactItem(
//                       icon: Icons.email,
//                       title: 'Email',
//                       detail: 'support@falconsathi.com',
//                     ),
//                     const SizedBox(height: 20),
//                     _buildContactItem(
//                       icon: Icons.phone,
//                       title: 'Phone',
//                       detail: '+1 (555) 123-4567',
//                     ),
//                     const SizedBox(height: 20),
//                     _buildContactItem(
//                       icon: Icons.location_on,
//                       title: 'Address',
//                       detail: '123 Education Lane, Tech City, CA 94043',
//                     ),
//                     const SizedBox(height: 25),
//                     GradiantButton(
//                       buttonText: 'SEND US A MESSAGE',
//                       buttonWidth: double.infinity,
//                       onTap: () {
//                         // Navigate to contact form or open email app
//                         _showContactDialog(context);
//                       },
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 25),

//               // Social Media Links
//               _buildSectionHeader('Follow Us'),
//               Container(
//                 padding: const EdgeInsets.symmetric(vertical: 20),
//                 decoration: BoxDecoration(
//                   color: Pallete.blueColor,
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     _buildSocialButton(Icons.facebook, 'Facebook', () {}),
//                     _buildSocialButton(Icons.camera_alt, 'Instagram', () {}),
//                     // _buildSocialButton(Icons.twitter, 'Twitter', () {}),
//                     _buildSocialButton(Icons.video_library, 'YouTube', () {}),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 30),

//               // Copyright and Legal
//               Center(
//                 child: Column(
//                   children: [
//                     Text(
//                       '© ${DateTime.now().year} falconsathi. All rights reserved.',
//                       style: TextStyle(
//                         color: Colors.white.withOpacity(0.7),
//                         fontSize: 14,
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         TextButton(
//                           onPressed: () {},
//                           child: const Text(
//                             'Privacy Policy',
//                             style: TextStyle(color: Colors.white70),
//                           ),
//                         ),
//                         const Text('|',
//                             style: TextStyle(color: Colors.white70)),
//                         TextButton(
//                           onPressed: () {},
//                           child: const Text(
//                             'Terms of Service',
//                             style: TextStyle(color: Colors.white70),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Helper method to build section headers
//   Widget _buildSectionHeader(String title) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: Text(
//         title,
//         style: TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//           color: Pallete.titleTextColor,
//         ),
//       ),
//     );
//   }

//   // Helper method to build content cards
//   Widget _buildContentCard({required Widget child}) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: Pallete.blueColor,
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: child,
//     );
//   }

//   // Helper method to build feature items
//   Widget _buildFeatureItem({
//     required IconData icon,
//     required String title,
//     required String description,
//   }) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           padding: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             color: Pallete.blueDarkColor,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Icon(
//             icon,
//             color: Pallete.textColor,
//             size: 24,
//           ),
//         ),
//         const SizedBox(width: 15),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               const SizedBox(height: 5),
//               Text(
//                 description,
//                 style: const TextStyle(
//                   fontSize: 14,
//                   color: Colors.white70,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   // Helper method to build team member items
//   Widget _buildTeamMember({
//     required String name,
//     required String role,
//     required String bio,
//   }) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         CircleAvatar(
//           radius: 30,
//           backgroundColor: Pallete.blueDarkColor,
//           child: Text(
//             name.substring(0, 1),
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: Pallete.textColor,
//             ),
//           ),
//         ),
//         const SizedBox(width: 15),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 name,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               Text(
//                 role,
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Pallete.textColor,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               const SizedBox(height: 5),
//               Text(
//                 bio,
//                 style: const TextStyle(
//                   fontSize: 14,
//                   color: Colors.white70,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   // Helper method to build contact items
//   Widget _buildContactItem({
//     required IconData icon,
//     required String title,
//     required String detail,
//   }) {
//     return Row(
//       children: [
//         Container(
//           padding: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             color: Pallete.blueDarkColor,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Icon(
//             icon,
//             color: Pallete.textColor,
//             size: 24,
//           ),
//         ),
//         const SizedBox(width: 15),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 14,
//                 color: Colors.white70,
//               ),
//             ),
//             Text(
//               detail,
//               style: const TextStyle(
//                 fontSize: 16,
//                 color: Colors.white,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   // Helper method to build social media buttons
//   Widget _buildSocialButton(IconData icon, String label, VoidCallback onTap) {
//     return InkWell(
//       onTap: onTap,
//       child: Column(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: Pallete.blueDarkColor,
//               shape: BoxShape.circle,
//             ),
//             child: Icon(
//               icon,
//               color: Pallete.textColor,
//               size: 24,
//             ),
//           ),
//           const SizedBox(height: 5),
//           Text(
//             label,
//             style: const TextStyle(
//               fontSize: 12,
//               color: Colors.white70,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Contact dialog
//   void _showContactDialog(BuildContext context) {
//     final TextEditingController nameController = TextEditingController();
//     final TextEditingController emailController = TextEditingController();
//     final TextEditingController messageController = TextEditingController();

//     showDialog(
//       context: context,
//       builder: (context) => Dialog(
//         backgroundColor: Pallete.blueDarkColor,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 'Contact Us',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Pallete.titleTextColor,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 controller: nameController,
//                 style: const TextStyle(color: Colors.white),
//                 decoration: InputDecoration(
//                   hintText: 'Your Name',
//                   hintStyle: const TextStyle(color: Colors.white54),
//                   filled: true,
//                   fillColor: Pallete.blueColor,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 15),
//               TextField(
//                 controller: emailController,
//                 style: const TextStyle(color: Colors.white),
//                 decoration: InputDecoration(
//                   hintText: 'Your Email',
//                   hintStyle: const TextStyle(color: Colors.white54),
//                   filled: true,
//                   fillColor: Pallete.blueColor,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 15),
//               TextField(
//                 controller: messageController,
//                 style: const TextStyle(color: Colors.white),
//                 maxLines: 4,
//                 decoration: InputDecoration(
//                   hintText: 'Your Message',
//                   hintStyle: const TextStyle(color: Colors.white54),
//                   filled: true,
//                   fillColor: Pallete.blueColor,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               GradiantButton(
//                 buttonText: 'SEND',
//                 buttonWidth: double.infinity,
//                 onTap: () {
//                   // Process the contact form
//                   Navigator.pop(context);
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content:
//                           Text('Message sent! We\'ll get back to you soon.'),
//                       backgroundColor: Colors.green,
//                     ),
//                   );
//                 },
//               ),
//               const SizedBox(height: 10),
//               TextButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: Text(
//                   'Cancel',
//                   style: TextStyle(color: Pallete.textColor),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
