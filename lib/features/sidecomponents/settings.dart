// import 'package:flutter/material.dart';
// import 'package:falconsathi/core/theme/app_pallete.dart';
// import 'package:falconsathi/features/auth/view/widgets/gradiant_btn.dart';

// class SettingsPage extends StatefulWidget {
//   const SettingsPage({super.key});

//   @override
//   State<SettingsPage> createState() => _SettingsPageState();
// }

// class _SettingsPageState extends State<SettingsPage> {
//   // Notification settings
//   bool emailNotifications = true;
//   bool pushNotifications = true;
//   // Theme settings
//   bool darkMode = true;
//   // Text controllers for form fields
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     // Initialize with user's email if available
//     _emailController.text = "user@example.com";
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var he = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: Pallete.blueDarkColor,
//       appBar: AppBar(
//         backgroundColor: Pallete.blueDarkColor,
//         title: const Text(
//           'Settings',
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
//               // Notification Settings
//               _buildSectionHeader('Notification Settings'),
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Pallete.blueColor,
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: Column(
//                   children: [
//                     _buildSwitchTile(
//                       'Email Notifications',
//                       'Receive notifications via email',
//                       emailNotifications,
//                       (value) {
//                         setState(() {
//                           emailNotifications = value;
//                         });
//                       },
//                     ),
//                     const Divider(color: Colors.white24),
//                     _buildSwitchTile(
//                       'Push Notifications',
//                       'Receive push notifications on your device',
//                       pushNotifications,
//                       (value) {
//                         setState(() {
//                           pushNotifications = value;
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 25),

//               // App Settings
//               _buildSectionHeader('App Settings'),
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Pallete.blueColor,
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: Column(
//                   children: [
//                     _buildSwitchTile(
//                       'Dark Mode',
//                       'Enable dark theme for the app',
//                       darkMode,
//                       (value) {
//                         setState(() {
//                           darkMode = value;
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 25),

//               // About Section
//               _buildSectionHeader('About'),
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Pallete.blueColor,
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: Column(
//                   children: [
//                     _buildListTile(
//                       'App Version',
//                       'v1.0.0',
//                       Icons.info_outline,
//                       () {},
//                     ),
//                     const Divider(color: Colors.white24),
//                     _buildListTile(
//                       'Terms of Service',
//                       'Read our terms and conditions',
//                       Icons.description_outlined,
//                       () {},
//                     ),
//                     const Divider(color: Colors.white24),
//                     _buildListTile(
//                       'Privacy Policy',
//                       'Read our privacy policy',
//                       Icons.privacy_tip_outlined,
//                       () {},
//                     ),
//                     const Divider(color: Colors.white24),
//                     _buildListTile(
//                       'Contact Support',
//                       'Get help with any issues',
//                       Icons.support_agent_outlined,
//                       () {},
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 30),

//               // Logout Button
//               Center(
//                 child: GradiantButton(
//                   buttonText: 'LOGOUT',
//                   buttonWidth: he * 0.3,
//                   onTap: () {
//                     // Show confirmation dialog
//                     showDialog(
//                       context: context,
//                       builder: (context) => AlertDialog(
//                         backgroundColor: Pallete.blueColor,
//                         title: const Text('Logout',
//                             style: TextStyle(color: Colors.white)),
//                         content: const Text('Are you sure you want to logout?',
//                             style: TextStyle(color: Colors.white70)),
//                         actions: [
//                           TextButton(
//                             onPressed: () => Navigator.pop(context),
//                             child: Text('Cancel',
//                                 style: TextStyle(color: Pallete.textColor)),
//                           ),
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                               // Add logout logic here
//                             },
//                             child: const Text('Logout',
//                                 style: TextStyle(color: Colors.red)),
//                           ),
//                         ],
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

//   // Helper method to build switch tiles
//   Widget _buildSwitchTile(
//       String title, String subtitle, bool value, Function(bool) onChanged) {
//     return ListTile(
//       title: Text(
//         title,
//         style: const TextStyle(color: Colors.white, fontSize: 16),
//       ),
//       subtitle: Text(
//         subtitle,
//         style: const TextStyle(color: Colors.white60, fontSize: 12),
//       ),
//       trailing: Switch(
//         value: value,
//         onChanged: onChanged,
//         activeColor: Pallete.textColor,
//         activeTrackColor: Pallete.gradient1.withOpacity(0.5),
//       ),
//       contentPadding: EdgeInsets.zero,
//     );
//   }

//   // Helper method to build list tiles
//   Widget _buildListTile(
//       String title, String subtitle, IconData icon, VoidCallback onTap) {
//     return ListTile(
//       leading: Icon(icon, color: Colors.white70),
//       title: Text(
//         title,
//         style: const TextStyle(color: Colors.white, fontSize: 16),
//       ),
//       subtitle: Text(
//         subtitle,
//         style: const TextStyle(color: Colors.white60, fontSize: 12),
//       ),
//       trailing:
//           const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 16),
//       onTap: onTap,
//       contentPadding: EdgeInsets.zero,
//     );
//   }
// }
