import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_pay/blocs/auth/auth_bloc.dart';
import 'package:fast_pay/blocs/user_profile/user_profile_bloc.dart';
import 'package:fast_pay/data/models/forms_status.dart';
import 'package:fast_pay/utils/images/images.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../data/local/storage_repositories.dart';
import '../../utils/extensions/extensions.dart';
import '../routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _init(bool isAuthenticated) async {
    debugPrint("mana bu auth : $isAuthenticated");
    await Future.delayed(
      const Duration(seconds: 2),
    );

    if (!mounted) return;
    if (isAuthenticated == false) {
      bool isNewUser = StorageRepository.getBool(key: "is_new_user");
      if (isNewUser) {
        Navigator.pushReplacementNamed(context, RouteNames.authRoute);
      } else {
        Navigator.pushReplacementNamed(context, RouteNames.onBoardingRoute);
      }
    } else {
      Navigator.pushReplacementNamed(context, RouteNames.tabRoute);
    }
  }

  //
  @override
  void initState() {
    _init(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == FormsStatus.authenticated) {
          BlocProvider.of<UserProfileBloc>(context).add(
              GetCurrentEvent(uid: FirebaseAuth.instance.currentUser!.uid));
          print("true ee");
          _init(true);
          // setState(() {});
        } else {
          print("false ee");
          // setState(() {});
          _init(false);
        }
      },
      child: Center(child: Lottie.asset(AppImages.lotty)),
    ));
  }
}
