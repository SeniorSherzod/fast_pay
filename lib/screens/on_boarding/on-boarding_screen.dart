import 'package:fast_pay/screens/on_boarding/pages/boarding_page_four.dart';
import 'package:fast_pay/screens/on_boarding/pages/boarding_page_one.dart';
import 'package:fast_pay/screens/on_boarding/pages/boarding_page_three.dart';
import 'package:fast_pay/screens/on_boarding/pages/boarding_page_two.dart';
import 'package:flutter/material.dart';

import '../../data/local/storage_repositories.dart';
import '../../utils/styles/styles.dart';
import '../routes.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController controller = PageController();
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed:(){
                    activeIndex -= 1;
                    controller.animateToPage(
                      activeIndex,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.linear,
                    );
                  },
                  child: Text(
                    "BACK",
                    style: AppTextStyle.rubikMedium.copyWith(fontSize: 20),
                  ),
                ),
                TextButton(
                  onPressed:(){
                    // if (activeIndex == 0) {
                    //   StorageRepository.setBool(
                    //     key: "is_new_user",
                    //     value: true,
                    //   ).then(
                    //         (value) {
                    //       Navigator.pushReplacementNamed(
                    //           context, RouteNames.authRoute);
                    //     },
                    //   );
                    // }
                  },
                  child: Text(
                    "SKIP",
                    style: AppTextStyle.rubikMedium.copyWith(fontSize: 20),
                  ),
                ),
              ],
            ),
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (index) {},
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  BoardingOne(),
                  BoardingTwo(),
                  BoardingThree(),
                  BoardingFour(),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                if (activeIndex == 3) {
                  StorageRepository.setBool(
                    key: "is_new_user",
                    value: true,
                  ).then(
                        (value) {
                      Navigator.pushReplacementNamed(
                          context, RouteNames.authRoute);
                    },
                  );
                } else {
                  activeIndex += 1;
                  controller.animateToPage(
                    activeIndex,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.linear,
                  );
                }
              },
              child: const Text("Next"),
            )
          ],
        ),
      ),
    );
  }
}