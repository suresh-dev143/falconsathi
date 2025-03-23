import 'package:flutter/material.dart';
import 'package:falconsathi/core/theme/app_pallete.dart';
import 'package:falconsathi/features/sidecomponents/about.dart';
import 'package:falconsathi/features/sidecomponents/privacypolicy.dart';
import 'package:falconsathi/features/sidecomponents/profile.dart';
import 'package:falconsathi/features/sidecomponents/settings.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Pallete.blueDarkColor,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: ListView(children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close_rounded,
                  color: Colors.white,
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          const CircleAvatar(
            radius: 100, // Image radius
            backgroundImage: AssetImage('assets/images/static.png'),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'User Name',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomBtn.iconButton(
              'Policy Privacy',
              const Icon(
                Icons.policy,
                color: Colors.white,
              ), () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => const PrivacyPolicyPage()));
          }),
          CustomBtn.iconButton(
              'Edit Profile', const Icon(Icons.edit, color: Colors.white), () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProfilePage()));
          }),
          CustomBtn.iconButton(
              'Settings', const Icon(Icons.settings, color: Colors.white), () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SettingsPage()));
          }),
          CustomBtn.iconButton('Share the App',
              const Icon(Icons.share, color: Colors.white), () {}),
          CustomBtn.iconButton('About Us',
              const Icon(Icons.cast_for_education, color: Colors.white), () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AboutUsPage()));
          }),
          CustomBtn.iconButton(
              'Logout', const Icon(Icons.logout, color: Colors.white), () {}),
        ]),
      ),
    );
  }
}

class CustomBtn {
  static iconButton(String text, Icon icon, VoidCallback onTap) {
    return TextButton(
      onPressed: onTap,
      child: Row(
        children: <Widget>[
          icon,
          const SizedBox(
            width: 5,
          ),
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 16))
        ],
      ),
    );
  }
}
