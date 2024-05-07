import 'package:fast_pay/utils/images/images.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/user_profile/user_profile_bloc.dart';
import '../../data/local/storage_repositories.dart';
import '../../data/models/forms_status.dart';
import '../routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key}); // Corrected constructor syntax

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool hasPin = false;

  _init(bool isAuthenticated) async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    if (isAuthenticated == false) {
      bool isNewUser =  StorageRepository.getBool(
          key:
              "is_new_user"); // Corrected syntax for calling asynchronous method
      if (isNewUser) {
        Navigator.pushReplacementNamed(
            context, RouteNames.authRoute); // Corrected route name
      } else {
        Navigator.pushReplacementNamed(
            context, RouteNames.onBoardingRoute); // Corrected route name
      }
    } else {
      Navigator.pushReplacementNamed(
          context,
          hasPin
              ? RouteNames.entryPinRoute
              : RouteNames.setPinRoute); // Corrected route name
    }
  }

  @override
  void initState() {
    _init(false);
    hasPin=StorageRepository.getString(key: "pin_code").isNotEmpty;
    // Initially assuming the user is not authenticated
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == FormsStatus.authenticated) {
            BlocProvider.of<UserProfileBloc>(context).add(GetCurrentEvent(
                FirebaseAuth.instance.currentUser!
                    .uid)); // Corrected syntax for adding an event to Bloc
            _init(true);
          } else {
            _init(false);
          }
        },
        child: Center(child: Lottie.asset(AppImages.lotty)),
      ),
    );
  }
}
