import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BodyBackgroud extends StatelessWidget {
  const BodyBackgroud({super.key,required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          'assets/images/background.svg',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        child,
      ],
    );
  }
}
