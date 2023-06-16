import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedFloatingAction extends StatelessWidget {
  final IconData icon;
  final Widget destination;

  const AnimatedFloatingAction(
      {Key? key, required this.icon, required this.destination})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedBuilder: (BuildContext context, void Function() openContainer) =>
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).primaryColor,
            ),
            child: Icon(
                icon,
                color: Colors.white,
                size: 35.sp
            ),
          ),
      openBuilder: (BuildContext context, _) => destination,
      closedShape: const CircleBorder(),
      closedElevation: 6,
      openColor: Theme.of(context).primaryColor,
      closedColor: Theme.of(context).primaryColor,
      transitionDuration: const Duration(seconds: 1, milliseconds: 500),
      transitionType: ContainerTransitionType.fade,
    );
  }
}
