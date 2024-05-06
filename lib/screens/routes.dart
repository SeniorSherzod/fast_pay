import 'package:fast_pay/blocs/user_profile/user_profile_bloc.dart';
import 'package:fast_pay/screens/auth/register_screen.dart';
import 'package:fast_pay/screens/local_auth/method_one/confirming_pin_screen.dart';
import 'package:fast_pay/screens/local_auth/method_one/entry_pin_screen.dart';
import 'package:fast_pay/screens/local_auth/method_one/set_pin_screen.dart';
import 'package:fast_pay/screens/local_auth/method_two/touch_id_screen.dart';
import 'package:fast_pay/screens/payment/payment_screen.dart';
import 'package:fast_pay/screens/splash/splash.dart';
import 'package:fast_pay/screens/tab/profile/update_screen.dart';
import 'package:fast_pay/screens/tab/tab_screen.dart';
import 'package:fast_pay/screens/transfer/transfer_screen.dart';
import 'package:flutter/material.dart';

import 'auth/auth_screen.dart';
import 'no_internet/no_internet_screen.dart';
import 'on_boarding/on-boarding_screen.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return navigate(SplashScreen());

      case RouteNames.tabRoute:
        return navigate(const TabScreen());

      case RouteNames.noInternetRoute:
        return navigate(NoInternetScreen(
            onInternetComeBack: settings.arguments as VoidCallback));

      case RouteNames.transferRoute:
        return navigate(const TransferScreen());
      case RouteNames.paymentRoute:
        return navigate(const PaymentScreen());
      case RouteNames.authRoute:
        return navigate(const AuthScreen());
      case RouteNames.onBoardingRoute:
        return navigate(const OnBoardingScreen());
      case RouteNames.logIN:
        return navigate(const AuthScreen());
      case RouteNames.register:
        return navigate(const RegisterScreen());
      case RouteNames.setPinRoute:
        return navigate(const SetPinScreen());
      case RouteNames.confirmPinRoute:
        return navigate(ConfirmPinScreen(
          previousPin: settings.arguments as String,
        ));
      case RouteNames.entryPinRoute:
        return navigate(const EntryPinScreen());
      case RouteNames.touchId:
        return navigate(const TouchIdScreen());
      case RouteNames.updateUser:
        return navigate(const Updatescreen());

      default:
        return navigate(
          const Scaffold(
            body: Center(
              child: Text("This kind of rout does not exist!"),
            ),
          ),
        );
    }
  }

  static navigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}

class RouteNames {
  static const String splashScreen = "/";
  static const String tabRoute = "/tab_route";
  static const String authRoute = "/auth_route";
  static const String noInternetRoute = "/no_internet_route";
  static const String paymentRoute = "/payment_route";
  static const String transferRoute = "/transfer_route";
  static const String onBoardingRoute = "/on_boarding_route";
  static const String logIN = "/log_In_route";
  static const String register = "/register_route";
  static const String setPinRoute = "/setPinRoute_route";
  static const String confirmPinRoute = "/confirmPinRoute_route";
  static const String entryPinRoute = "/entryPinRoute_route";
  static const String touchId = "/touchId_route";
  static const String updateUser = "/updateUser_route";
}
