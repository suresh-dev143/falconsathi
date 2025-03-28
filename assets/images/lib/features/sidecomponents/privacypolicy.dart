// import 'package:flutter/material.dart';
// import 'package:falconsathi/core/theme/app_pallete.dart';
// import 'package:falconsathi/features/auth/view/widgets/gradiant_btn.dart';

// class PrivacyPolicyPage extends StatelessWidget {
//   const PrivacyPolicyPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var he = MediaQuery.of(context).size.height;
//     var wi = MediaQuery.of(context).size.width;

//     return Scaffold(
//       backgroundColor: Pallete.blueDarkColor,
//       appBar: AppBar(
//         backgroundColor: Pallete.blueDarkColor,
//         title: const Text(
//           'Privacy Policy',
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
//               // Header
//               Center(
//                 child: Column(
//                   children: [
//                     Container(
//                       height: 80,
//                       width: 80,
//                       decoration: BoxDecoration(
//                         color: Pallete.blueColor,
//                         shape: BoxShape.circle,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Pallete.gradient1.withOpacity(0.3),
//                             blurRadius: 15,
//                             spreadRadius: 2,
//                           ),
//                         ],
//                       ),
//                       child: Center(
//                         child: Icon(
//                           Icons.privacy_tip,
//                           size: 40,
//                           color: Pallete.textColor,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 15),
//                     Text(
//                       'Privacy Policy',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: Pallete.titleTextColor,
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     Text(
//                       'Last Updated: ${_getFormattedDate()}',
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.white.withOpacity(0.7),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 25),

//               // Introduction
//               _buildSectionHeader('Introduction'),
//               _buildContentCard(
//                 child: const Text(
//                   'Welcome to falconsathi. We respect your privacy and are committed to protecting your personal data. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application.\n\n'
//                   'Please read this Privacy Policy carefully. If you do not agree with the terms of this Privacy Policy, please do not access the application.',
//                   style: TextStyle(
//                     fontSize: 15,
//                     color: Colors.white,
//                     height: 1.5,
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 20),

//               // Information We Collect
//               _buildSectionHeader('Information We Collect'),
//               _buildContentCard(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _buildSubsectionHeader('Personal Data'),
//                     const Text(
//                       'When you register an account with us, we may collect the following types of personal information:',
//                       style: TextStyle(
//                         fontSize: 15,
//                         color: Colors.white,
//                         height: 1.5,
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     _buildBulletPoint('Full name'),
//                     _buildBulletPoint('Email address'),
//                     _buildBulletPoint('Phone number'),
//                     _buildBulletPoint('Profile picture'),
//                     _buildBulletPoint('Educational background'),
//                     const SizedBox(height: 20),
//                     _buildSubsectionHeader('Usage Data'),
//                     const Text(
//                       'We may also collect information that your device sends whenever you access our application:',
//                       style: TextStyle(
//                         fontSize: 15,
//                         color: Colors.white,
//                         height: 1.5,
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     _buildBulletPoint('Device type and model'),
//                     _buildBulletPoint('Operating system'),
//                     _buildBulletPoint('IP address'),
//                     _buildBulletPoint('Time spent on the application'),
//                     _buildBulletPoint('Features used and content viewed'),
//                     _buildBulletPoint('Error logs and performance data'),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 20),

//               // How We Use Your Information
//               _buildSectionHeader('How We Use Your Information'),
//               _buildContentCard(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'We use the information we collect for various purposes, including:',
//                       style: TextStyle(
//                         fontSize: 15,
//                         color: Colors.white,
//                         height: 1.5,
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     _buildBulletPoint('To provide and maintain our service'),
//                     _buildBulletPoint(
//                         'To personalize your learning experience'),
//                     _buildBulletPoint(
//                         'To analyze usage patterns and improve our application'),
//                     _buildBulletPoint(
//                         'To communicate with you about updates and new features'),
//                     _buildBulletPoint('To provide customer support'),
//                     _buildBulletPoint(
//                         'To detect, prevent, and address technical issues'),
//                     _buildBulletPoint('To comply with legal obligations'),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 20),

//               // Data Security
//               _buildSectionHeader('Data Security'),
//               _buildContentCard(
//                 child: const Text(
//                   'The security of your data is important to us. We implement appropriate technical and organizational measures to protect your personal information from unauthorized access, alteration, disclosure, or destruction.\n\n'
//                   'However, please be aware that no method of transmission over the internet or electronic storage is 100% secure. While we strive to use commercially acceptable means to protect your personal data, we cannot guarantee its absolute security.',
//                   style: TextStyle(
//                     fontSize: 15,
//                     color: Colors.white,
//                     height: 1.5,
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 20),

//               // Data Sharing and Disclosure
//               _buildSectionHeader('Data Sharing and Disclosure'),
//               _buildContentCard(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'We may share your information in the following situations:',
//                       style: TextStyle(
//                         fontSize: 15,
//                         color: Colors.white,
//                         height: 1.5,
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     _buildBulletPoint(
//                         'With service providers who perform services on our behalf'),
//                     _buildBulletPoint(
//                         'With analytics providers to help us improve our application'),
//                     _buildBulletPoint(
//                         'If required by law or in response to valid legal requests'),
//                     _buildBulletPoint(
//                         'To protect our rights, privacy, safety, or property'),
//                     _buildBulletPoint(
//                         'In connection with a business transaction such as a merger or acquisition'),
//                     const SizedBox(height: 15),
//                     const Text(
//                       'We do not sell your personal information to third parties.',
//                       style: TextStyle(
//                         fontSize: 15,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         height: 1.5,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 20),

//               // Your Rights
//               _buildSectionHeader('Your Rights'),
//               _buildContentCard(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'Depending on your location, you may have certain rights regarding your personal information:',
//                       style: TextStyle(
//                         fontSize: 15,
//                         color: Colors.white,
//                         height: 1.5,
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     _buildBulletPoint('Access your personal data'),
//                     _buildBulletPoint('Correct inaccurate or incomplete data'),
//                     _buildBulletPoint('Request deletion of your personal data'),
//                     _buildBulletPoint('Object to our processing of your data'),
//                     _buildBulletPoint('Request restriction of processing'),
//                     _buildBulletPoint('Request transfer of your data'),
//                     _buildBulletPoint('Withdraw consent at any time'),
//                     const SizedBox(height: 15),
//                     const Text(
//                       'To exercise any of these rights, please contact us using the information provided in the "Contact Us" section.',
//                       style: TextStyle(
//                         fontSize: 15,
//                         color: Colors.white,
//                         height: 1.5,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 20),

//               // Children's Privacy
//               _buildSectionHeader('Children\'s Privacy'),
//               _buildContentCard(
//                 child: const Text(
//                   'Our application is not intended for children under 13 years of age. We do not knowingly collect personal information from children under 13. If you are a parent or guardian and believe your child has provided us with personal information, please contact us so we can take necessary actions.',
//                   style: TextStyle(
//                     fontSize: 15,
//                     color: Colors.white,
//                     height: 1.5,
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 20),

//               // Changes to Privacy Policy
//               _buildSectionHeader('Changes to This Privacy Policy'),
//               _buildContentCard(
//                 child: const Text(
//                   'We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page and updating the "Last Updated" date.\n\n'
//                   'You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.',
//                   style: TextStyle(
//                     fontSize: 15,
//                     color: Colors.white,
//                     height: 1.5,
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 20),

//               // Contact Us
//               _buildSectionHeader('Contact Us'),
//               _buildContentCard(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'If you have any questions about this Privacy Policy or our data practices, please contact us:',
//                       style: TextStyle(
//                         fontSize: 15,
//                         color: Colors.white,
//                         height: 1.5,
//                       ),
//                     ),
//                     const SizedBox(height: 15),
//                     _buildContactDetail('Email:', 'privacy@falconsathi.com'),
//                     const SizedBox(height: 10),
//                     _buildContactDetail('Address:',
//                         'falconsathi Inc., 123 Education Lane, Tech City, CA 94043'),
//                     const SizedBox(height: 10),
//                     _buildContactDetail('Phone:', '+1 (555) 123-4567'),
//                     const SizedBox(height: 20),
//                     GradiantButton(
//                       buttonText: 'CONTACT SUPPORT',
//                       buttonWidth: double.infinity,
//                       onTap: () {
//                         // Navigate to contact form or open email app
//                         _launchEmail(context);
//                       },
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 30),

//               // Accept Button
//               Center(
//                 child: GradiantButton(
//                   buttonText: 'I UNDERSTAND AND ACCEPT',
//                   buttonWidth: wi * 0.8,
//                   onTap: () {
//                     Navigator.pop(context);
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content: Text('Privacy Policy accepted'),
//                         backgroundColor: Colors.green,
//                       ),
//                     );
//                   },
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

//   // Helper method to build subsection headers
//   Widget _buildSubsectionHeader(String title) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10),
//       child: Text(
//         title,
//         style: TextStyle(
//           fontSize: 17,
//           fontWeight: FontWeight.bold,
//           color: Pallete.textColor,
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

//   // Helper method to build bullet points
//   Widget _buildBulletPoint(String text) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             '•  ',
//             style: TextStyle(
//               fontSize: 15,
//               color: Pallete.textColor,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           Expanded(
//             child: Text(
//               text,
//               style: const TextStyle(
//                 fontSize: 15,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Helper method to build contact details
//   Widget _buildContactDetail(String label, String value) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 15,
//             color: Pallete.textColor,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(width: 5),
//         Expanded(
//           child: Text(
//             value,
//             style: const TextStyle(
//               fontSize: 15,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   // Helper method to get formatted date
//   static String _getFormattedDate() {
//     final now = DateTime.now();
//     final months = [
//       'January',
//       'February',
//       'March',
//       'April',
//       'May',
//       'June',
//       'July',
//       'August',
//       'September',
//       'October',
//       'November',
//       'December'
//     ];
//     return '${months[now.month - 1]} ${now.day}, ${now.year}';
//   }

//   // Helper method to launch email
//   void _launchEmail(BuildContext context) {
//     // In a real app, you would use url_launcher package to open email client
//     // For now, we'll just show a dialog
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         backgroundColor: Pallete.blueDarkColor,
//         title: Text(
//           'Contact Support',
//           style: TextStyle(color: Pallete.titleTextColor),
//         ),
//         content: const Text(
//           'Would you like to send an email to privacy@falconsathi.com?',
//           style: TextStyle(color: Colors.white),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text(
//               'Cancel',
//               style: TextStyle(color: Pallete.textColor),
//             ),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(
//                   content: Text('Opening email client...'),
//                   backgroundColor: Colors.blue,
//                 ),
//               );
//             },
//             child: const Text(
//               'Yes',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
