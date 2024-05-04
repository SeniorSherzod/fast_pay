import 'package:fast_pay/utils/colors/colors.dart';
import 'package:fast_pay/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  const MyCustomButton({
    super.key, // corrected
     this.isLoading=true,
    required this.title,
    required this.onTab,
     this.readyToSubmit=true,
  }); // corrected

  final VoidCallback onTab;
  final bool readyToSubmit;
  final bool isLoading;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: readyToSubmit ? onTab : null,
        style: TextButton.styleFrom(
          elevation: 3.0,
          backgroundColor: readyToSubmit ? AppColors.c_1A72DD : AppColors.c_C4C4C4,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          child: Center(
            child: isLoading
                ? SizedBox(
              height: 30.h,
              width: 30.w,
              child: const CircularProgressIndicator.adaptive(strokeWidth: 5),
            )
                : Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
