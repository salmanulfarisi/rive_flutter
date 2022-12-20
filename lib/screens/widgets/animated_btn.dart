import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';

class AnimatedButn extends StatelessWidget {
  const AnimatedButn({
    Key? key,
    required RiveAnimationController controller,
    required this.press,
  })  : _controller = controller,
        super(key: key);

  final RiveAnimationController _controller;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.isActive = true;
        press();
      },
      child: SizedBox(
        height: 64,
        width: 260,
        child: Stack(
          children: [
            RiveAnimation.asset(
              'assets/RiveAssets/button.riv',
              controllers: [_controller],
            ),
            Positioned.fill(
              top: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(CupertinoIcons.arrow_right),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Start the course',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
