import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive_flutter/screens/widgets/signin_form.dart';

Future<Object?> customSigninDialog(BuildContext context,
    {required ValueChanged onclose}) {
  return showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: 'Sign In',
      context: context,
      transitionDuration: const Duration(milliseconds: 500),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        Tween<Offset> tween;
        tween = Tween(
          begin: const Offset(0, -1),
          end: Offset.zero,
        );
        return SlideTransition(
          position: tween.animate(
              CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
          child: child,
        );
      },
      pageBuilder: (context, _, __) => Center(
            child: Container(
              height: 620,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.94),
                borderRadius: const BorderRadius.all(Radius.circular(40)),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Sign In",
                            style: TextStyle(
                              fontSize: 34,
                              fontFamily: "Poppins",
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Text(
                              'Access to 240+ hours of content. Learn designs and code, by building real apps with Flutter and Swift.',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SignInForm(),
                          Row(
                            children: const [
                              Expanded(child: Divider()),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 16),
                                child: Text(
                                  "OR",
                                  style: TextStyle(
                                    color: Colors.black26,
                                  ),
                                ),
                              ),
                              Expanded(child: Divider()),
                            ],
                          ),
                          const Text(
                            'Sign up with Email, Apple or Google',
                            style: TextStyle(color: Colors.black54),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                      'assets/icons/email_box.svg',
                                      height: 64,
                                      width: 64,
                                    )),
                                IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                      'assets/icons/apple_box.svg',
                                      height: 64,
                                      width: 64,
                                    )),
                                IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                      'assets/icons/google_box.svg',
                                      height: 64,
                                      width: 64,
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                      const Positioned(
                        left: 0,
                        right: 0,
                        bottom: -68,
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )).then(onclose);
}
