import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../widgets/background_style.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundStyle(),
          Center(
            child: Lottie.asset(
              'assets/animation/clear.json',
              height: 350,
              width: MediaQuery.of(context).size.width,
            ),
          )
        ],
      ),
    );
  }
}
