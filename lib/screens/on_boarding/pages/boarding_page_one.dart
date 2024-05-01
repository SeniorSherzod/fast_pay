import 'package:fast_pay/utils/extensions/extensions.dart';
import 'package:fast_pay/utils/images/images.dart';
import 'package:fast_pay/utils/styles/styles.dart';
import 'package:flutter/material.dart';

class BoardingOne extends StatelessWidget {
  const BoardingOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Image.asset(AppImages.img_2),
          30.getH(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "The right relationship \n         is everything.",
              style: AppTextStyle.rubikMedium.copyWith(fontSize: 30),
            ),
          ),Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Your Trusted Partner in Financial Success",
              style: AppTextStyle.rubikMedium.copyWith(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
