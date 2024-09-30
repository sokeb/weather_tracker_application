import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundStyle extends StatelessWidget {
  const BackgroundStyle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: const AlignmentDirectional(4, -0.2),
          child: Container(
            height: 300,
            width: 300,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.blueAccent),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(-4, -0.2),
          child: Container(
            height: 300,
            width: 300,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.deepPurpleAccent),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(0, -1.2),
          child: Container(
            height: 300,
            width: 300,
            decoration: const BoxDecoration(color: Colors.blueAccent),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(-1,0.5),
          child: Container(
            height: 300,
            width: 300,
            decoration: const BoxDecoration(color: Colors.deepPurpleAccent),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 100.0, sigmaX: 100.0),
          child: Container(
            color: Colors.transparent,
          ),
        )
      ],
    );
  }
}
