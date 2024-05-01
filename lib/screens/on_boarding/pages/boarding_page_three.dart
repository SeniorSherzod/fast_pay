import 'package:fast_pay/utils/extensions/extensions.dart';
import 'package:fast_pay/utils/images/images.dart';
import 'package:fast_pay/utils/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoardingThree extends StatelessWidget {
  const BoardingThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Image.asset(AppImages.img_1),
          ),
          Text(
            "Your Comprehensive Resource \n     for Financial Success",
            style: AppTextStyle.rubikMedium.copyWith(fontSize: 25),
          ), 10.getH(),
          Text(
            "Choosing the Right Bank for Your Financial\n  "
                "                               Goals",
            style: AppTextStyle.rubikMedium.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
