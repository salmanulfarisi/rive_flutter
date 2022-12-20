import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_flutter/screens/widgets/animated_btn.dart';
import 'package:rive_flutter/screens/widgets/custom_signin_dialouge.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late RiveAnimationController _controller;
  bool isSignInDialogOpen = false;
  @override
  void initState() {
    super.initState();
    _controller = OneShotAnimation('active', autoplay: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset('assets/Backgrounds/Spline.png'),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 30,
                sigmaY: 30,
              ),
            ),
          ),
          const RiveAnimation.asset('assets/RiveAssets/shapes.riv'),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 30,
                sigmaY: 30,
              ),
              child: const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 240),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            top: isSignInDialogOpen ? -50 : 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    SizedBox(
                      width: 260,
                      child: Column(
                        children: const [
                          Text(
                            'Learn design & code',
                            style: TextStyle(
                              fontSize: 60,
                              fontFamily: "Poppins",
                              height: 1.2,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Don\'t skip design. Learn design and code,by building real apps with Flutter and Swift. Complete courses about the best tools.',
                          ),
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    AnimatedButn(
                      controller: _controller,
                      press: () {
                        _controller.isActive = true;
                        Future.delayed(const Duration(milliseconds: 800), () {
                          setState(() {
                            isSignInDialogOpen = true;
                          });
                          customSigninDialog(context, onclose: (_) {
                            setState(() {
                              isSignInDialogOpen = false;
                            });
                          });
                        });
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                          'Purcahse includes access to 30+ courses, 240+ premium tutorials, 120+ hours videos, source files and certificates'),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
