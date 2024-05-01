import 'package:fast_pay/utils/extensions/extensions.dart';
import 'package:fast_pay/utils/images/images.dart';
import 'package:fast_pay/utils/styles/styles.dart';
import 'package:flutter/cupertino.dart';

class BoardingTwo extends StatelessWidget {
  const BoardingTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20,10,20,20),
      child: Column(
        children: [
          Image.asset(AppImages.img),
          30.getH(),
          Text(
            "Your Financial Partner for Life:\n "
                "                 Citibank",
            style: AppTextStyle.rubikMedium.copyWith(fontSize: 23),
          ),
          10.getH(),
          Text(
            "Where Your Financial Goals Become Reality",
            style: AppTextStyle.rubikMedium.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
