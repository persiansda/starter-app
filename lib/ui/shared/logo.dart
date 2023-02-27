import 'package:flutter/material.dart';
import 'package:starter/ui/styles/borders.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'app-logo',
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: borderRadiusRound,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
      ),
    );
  }
}
