import 'package:fast_pay/utils/extensions/extensions.dart';
import 'package:fast_pay/utils/images/images.dart';
import 'package:flutter/cupertino.dart';

import '../../../utils/styles/styles.dart';

class BoardingFour extends StatelessWidget {
  const BoardingFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Image.asset(AppImages.img_4),
          Text(
            "Welcome",
            style: AppTextStyle.rubikMedium.copyWith(fontSize: 25),
          ), 10.getH(),
          Text(
            "Stay on top by effortlessly tracking your subscriptions & bills",
            style: AppTextStyle.rubikMedium.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
