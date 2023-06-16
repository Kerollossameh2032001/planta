import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controller/layout_cubit/layout_cubit.dart';

class BottomAppBarItem extends StatelessWidget {
  const BottomAppBarItem({
    super.key,
    required this.cubit,
    required this.text,
    required this.index,
    required this.icon,
  });

  final LayoutCubit cubit;
  final String text;
  final int index;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 40.w,
      onPressed: () {
        cubit.changeButtonNav(index: index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: cubit.currentTab == index
                ? Theme.of(context).primaryColor
                : Colors.grey,
          ),
          Text(
            text,
            style: TextStyle(
                color: cubit.currentTab == index
                    ? Theme.of(context).primaryColor
                    : Colors.grey),
          ),
        ],
      ),
    );
  }
}