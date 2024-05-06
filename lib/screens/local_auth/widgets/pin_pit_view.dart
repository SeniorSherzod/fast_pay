import 'package:fast_pay/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinPutTextView extends StatelessWidget {
  PinPutTextView({
    super.key,
    required this.pinPutFocusMode,
    required this.pinPutController,
    required this.isError,
    this.onCompleted,
  });

  final FocusNode pinPutFocusMode;
  final TextEditingController pinPutController;
  final bool isError;
  final ValueChanged<String>? onCompleted;

  @override
  Widget build(BuildContext context) {
     width = MediaQuery.of(context).size.width;
     height = MediaQuery.of(context).size.height;
   final defaultPnTheme = PinTheme(
     width: 42.w,
     height: 42.h,
     textStyle: TextStyle(
       fontSize: 36,
       color: Colors.black
     )
   );
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.38,
      child: Pinput(
        useNativeKeyboard: false,
        showCursor: false,
        length: 4,
        onCompleted: onCompleted,
        defaultPinTheme: defaultPnTheme,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        focusNode: pinPutFocusMode,
        controller: pinPutController,
        errorPinTheme: PinTheme(
          width: 42.w,
          height: 42.h,
          textStyle: TextStyle(fontSize: 36.w,color: Colors.black)
        ),
        preFilledWidget: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey
          ),
        ),
        obscureText: true,
        obscuringWidget: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isError ? Colors.red : Colors.green
          ),
        ),
        followingPinTheme: defaultPnTheme,
        pinAnimationType: PinAnimationType.scale,
      ),
    );
  }
}
