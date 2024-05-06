import 'package:fast_pay/data/local/storage_repositories.dart';
import 'package:fast_pay/screens/auth/widgets/my_button.dart';
import 'package:fast_pay/screens/routes.dart';
import 'package:fast_pay/services/biometrics_services.dart';
import 'package:flutter/material.dart';

class TouchIdScreen extends StatefulWidget {
  const TouchIdScreen({super.key});

  @override
  State<TouchIdScreen> createState() => _TouchIdScreenState();
}

class _TouchIdScreenState extends State<TouchIdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Touch id"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Icon(
              Icons.fingerprint_outlined,
              size: 100,
              color: Colors.blueAccent,
            ),
            SizedBox(height: 20,),
            MyCustomButton(
              isLoading: false,
              title: "Biometrics Auth",
              onTab: enableBiometrics,
            ),
            SizedBox(height: 20,),
            MyCustomButton(
              isLoading: false,
                title: "Skip",
                onTab: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, RouteNames.tabRoute, (route) => false);
                })
          ],
        ),
      ),
    );
  }
  Future <void> enableBiometrics()async
  {
    bool authenticated = await BiometricAuthService.authenticate();
    if (authenticated) {
      await StorageRepository.setBool(
          key: "biometrics_enabled", value: true);
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Biometrics Enabled"),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Biometrics Error"),
        ),
      );
    }
    if(!context.mounted) return;
    Navigator.pushNamedAndRemoveUntil(
        context, RouteNames.tabRoute, (route) => false);
  }
}
