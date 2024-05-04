import 'dart:math';

import 'package:fast_pay/screens/local_auth/widgets/custom_keyboard_view.dart';
import 'package:fast_pay/screens/local_auth/widgets/pin_pit_view.dart';
import 'package:fast_pay/utils/extensions/extensions.dart';
import 'package:fast_pay/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../routes.dart';

class SetPinScreen extends StatefulWidget {
  const SetPinScreen({super.key});

  @override
  State<SetPinScreen> createState() => _SetPinScreenState();
}

class _SetPinScreenState extends State<SetPinScreen> {
  final TextEditingController pinPutController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entry pin"),
      ),
      body: Column(
        children: [
          60.getH(),
          Text(
            "Pin kodni O'rnating!",
            style: AppTextStyle.rubikMedium.copyWith(fontSize: 20),
          ),
          32.getH(),
          SizedBox(
            width: width / 2,
            child: PinPutTextView(
                pinPutFocusMode: focusNode,
                pinPutController: pinPutController,
                isError: isError),
          ),
          32.getH(),
          CustomKeyboardView(
            number: (number) {
              if (pinPutController.length < 4) {
                pinPutController.text = "${pinPutController.text}$number";
              }
              if (pinPutController.length == 4) {
                Navigator.pushNamed(context, RouteNames.confirmPinRoute,
                    arguments: pinPutController.text);
                pinPutController.text = "";
              }
            },
            isBiometricsEnabled: false,
            onClearButtonTap: () {
              if (pinPutController.length > 0) {
                pinPutController.text = pinPutController.text
                    .substring(0, pinPutController.text.length - 1);
              }
            },
          )
        ],
      ),
    );
  }
}
