import 'package:flutter/material.dart';
import 'package:falconsathi/core/theme/app_pallete.dart';
import 'package:falconsathi/core/theme/theme.dart';
import 'package:falconsathi/features/auth/view/pages/login_page.dart';
import 'package:falconsathi/features/auth/view/widgets/gradiant_btn.dart';
import 'package:falconsathi/features/auth/view/widgets/text_btn.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    // Navigate to the next screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Spalash(),
    );
  }
}

class Spalash extends StatefulWidget {
  const Spalash({super.key});
  @override
  State<Spalash> createState() => _SpalashState();
}

class _SpalashState extends State<Spalash> {
  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: he * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: he * 0.1,
                ),
                const Icon(
                  Icons.language_rounded,
                  color: Color.fromRGBO(196, 81, 201, 1),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    "FalconSathi",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: he * 0.04),
              child: Stack(children: [
                // SizedBox(
                //     child: Image.asset(
                //   "assets/images/auth.png",
                //   color: const Color.fromRGBO(255, 255, 255, 0.07),
                //   fit: BoxFit.fill,
                // )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: he * 0.12),
                      child: const Text(
                        "Welcome to ",
                        style: TextStyle(fontSize: 45),
                      ),
                    ),
                    const Text("fastest services!",
                        style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(196, 81, 201, 1))),
                  ],
                ),
              ]),
            ),
            SizedBox(
              height: he * 0.015,
            ),
          ],
        ),
      ),
    );
  }
}
