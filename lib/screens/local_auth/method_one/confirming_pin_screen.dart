import 'dart:async';
import 'package:fast_pay/data/local/storage_repositories.dart';
import 'package:fast_pay/screens/local_auth/widgets/custom_keyboard_view.dart';
import 'package:fast_pay/screens/local_auth/widgets/pin_pit_view.dart';
import 'package:fast_pay/services/biometrics_services.dart';
import 'package:fast_pay/utils/extensions/extensions.dart';
import 'package:fast_pay/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../../routes.dart';

class ConfirmPinScreen extends StatefulWidget {
  const ConfirmPinScreen({super.key, required this.previousPin});

  final String previousPin;

  @override
  State<ConfirmPinScreen> createState() => _ConfirmPinScreenState();
}

class _ConfirmPinScreenState extends State<ConfirmPinScreen> {
  final TextEditingController pinPutController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  bool isError = false;
  bool isBiometricsEnabled = false;

  @override
  void initState() {
    BiometricAuthService.canAuthenticate().then(
      (value) {
        if (value) {
          isBiometricsEnabled = true;
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirm pin"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          60.getH(),
          Text(
            "Pin kodni qayta kiriting !",
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
                if (widget.previousPin == pinPutController.text) {
                  _setPin(pinPutController.text);
                } else {
                  isError = true;
                  pinPutController.clear();
                }
                pinPutController.text = "";
              }
              setState(() {});
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

  Future<void> _setPin(String pin) async {
    await StorageRepository.setString(key: "pin_code", value: pin);
    if (!mounted) return;
    Navigator.pushNamedAndRemoveUntil(
        context,
        isBiometricsEnabled ? RouteNames.touchId : RouteNames.tabRoute,
        (route) => false);
  }
}
