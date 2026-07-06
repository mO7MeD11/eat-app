import 'dart:ui';

import 'package:eat/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Gap(80),
          Spacer(),
          Center(
            child: SvgPicture.asset(
              'assets/logo/logo.svg',
              width: screenWidth * 0.7,
            ),
          ),
          Spacer(flex: 1),

          Image.asset(
            'assets/splash/splash.png',
            width: screenWidth * .9,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
