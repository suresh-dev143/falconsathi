import 'package:falconsathi/features/home/view/pages/bottom_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:falconsathi/core/common/widgets/custom_fields.dart';
import 'package:falconsathi/core/theme/app_pallete.dart';
import 'package:falconsathi/core/theme/theme.dart';
import 'package:falconsathi/features/auth/view/pages/login_page.dart';
import 'package:falconsathi/features/auth/view/widgets/gradiant_btn.dart';
import 'package:falconsathi/features/auth/view/widgets/text_btn.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});
  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size.height;
    TextEditingController emailcontroler = TextEditingController();
    TextEditingController passcontroler = TextEditingController();
    TextEditingController namecontroler = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              // SizedBox(
              //     child: Image.asset(
              //   "assets/images/auth.png",
              //   color: const Color.fromRGBO(255, 255, 255, 0.07),
              // )),
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: he * 0.05, left: he * 0.04, right: he * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        color: Pallete.titleTextColor,
                      ),
                      SizedBox(
                        height: he * 0.05,
                      ),
                      const Text(
                        "Create an",
                        style: TextStyle(fontSize: 45),
                      ),
                      Text("Account!",
                          style: TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                              color: Pallete.textColor)),
                      Padding(
                        padding: EdgeInsets.only(top: he * 0.03),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 60,
                              child: CustomFields(
                                  fillColor: Pallete.textFieldColor,
                                  controller: namecontroler,
                                  hintText: 'Name',
                                  icon: const Icon(
                                    CupertinoIcons.person,
                                    color: Colors.white,
                                  ),
                                  textinputtype: TextInputType.text),
                            ),
                            SizedBox(
                              height: he * 0.04,
                            ),
                            SizedBox(
                              height: 60,
                              child: CustomFields(
                                  fillColor: Pallete.textFieldColor,
                                  controller: emailcontroler,
                                  hintText: 'Email Address',
                                  icon: const Icon(CupertinoIcons.mail_solid,
                                      color: Colors.white),
                                  textinputtype: TextInputType.emailAddress),
                            ),
                            SizedBox(
                              height: he * 0.04,
                            ),
                            SizedBox(
                              height: 60,
                              child: CustomFields(
                                  fillColor: Pallete.textFieldColor,
                                  controller: passcontroler,
                                  hintText: 'Password',
                                  isObscureText: true,
                                  icon: const Icon(CupertinoIcons.lock,
                                      color: Colors.white),
                                  iconSuffix: const Icon(CupertinoIcons.eye,
                                      color: Colors.white),
                                  textinputtype: TextInputType.visiblePassword),
                            ),
                            SizedBox(
                              height: he * 0.04,
                            ),
                            SizedBox(
                              height: 60,
                              child: CustomFields(
                                  fillColor: Pallete.textFieldColor,
                                  controller: passcontroler,
                                  hintText: 'Confirm Password',
                                  isObscureText: true,
                                  icon: const Icon(CupertinoIcons.lock,
                                      color: Colors.white),
                                  iconSuffix: const Icon(CupertinoIcons.eye,
                                      color: Colors.white),
                                  textinputtype: TextInputType.visiblePassword),
                            ),
                            SizedBox(
                              height: he * 0.06,
                            ),
                            GradiantButton(
                                buttonText: 'SIGN UP',
                                buttonWidth: double.infinity,
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const BottomNav()));
                                }),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: he * 0.015, top: he * 0.03),
                              child: Row(
                                children: [
                                  Text(
                                    "Already have an account?",
                                    style: TextStyle(
                                        color: Pallete.textColor,
                                        fontSize: 15,
                                        fontStyle: FontStyle.italic),
                                  ),
                                  TextBtn(
                                    btnText: 'Login',
                                    btnColor: Pallete.textColor,
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginPage()));
                                    },
                                    textDecoration: TextDecoration.underline,
                                    decorationColor: Pallete.textColor,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
