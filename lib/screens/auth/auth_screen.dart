import 'package:fast_pay/blocs/auth/auth_bloc.dart';
import 'package:fast_pay/blocs/user_profile/user_profile_bloc.dart';
import 'package:fast_pay/data/models/forms_status.dart';
import 'package:fast_pay/screens/auth/widgets/my_button.dart';
import 'package:fast_pay/screens/routes.dart';
import 'package:fast_pay/utils/connstants/app_const.dart';
import 'package:fast_pay/utils/images/images.dart';
import 'package:fast_pay/utils/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/textfield.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  String? _errorMsg;
  bool obscurePassword = true;
  IconData iconPassword = CupertinoIcons.eye_fill;

  bool isValidCredentials() =>
      AppConstants.emailRegExp.hasMatch(usernameController.text) &&
      AppConstants.passwordRegExp.hasMatch(passwordController.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 160,
              ),
              child: Column(
                children: [
                  Image.asset(AppImages.bank),
                  Text(
                    "LOG IN",
                    style: AppTextStyle.rubikMedium.copyWith(fontSize: 30),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: MyTextField(
                        controller: usernameController,
                        hintText: 'name',
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        errorMsg: _errorMsg,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please fill in this field';
                          } else if (!AppConstants.textRegExp.hasMatch(val)) {
                            return 'Please enter a  username';
                          }
                          return null;
                        }),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: MyTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: obscurePassword,
                      keyboardType: TextInputType.visiblePassword,
                      prefixIcon: const Icon(CupertinoIcons.lock_fill),
                      errorMsg: _errorMsg,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please fill in this field';
                        } else if (!AppConstants.passwordRegExp.hasMatch(val)) {
                          return 'Please enter a valid password';
                        }
                        return null;
                      },
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                            if (obscurePassword) {
                              iconPassword = CupertinoIcons.eye_fill;
                            } else {
                              iconPassword = CupertinoIcons.eye_slash_fill;
                            }
                          });
                        },
                        icon: Icon(iconPassword),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  MyCustomButton(
                    onTab: () {
                      context.read<AuthBloc>().add(LoginUserEvent(
                          username: usernameController.text,
                          password: passwordController.text));
                    },
                    title: "login",
                    readyToSubmit: isValidCredentials(),
                    isLoading: state.status == FormsStatus.loading,
                  ),
                  const SizedBox(height: 20),
                  MyCustomButton(title: "Register",
                      isLoading: false,
                      onTab: () {
                    Navigator.pushNamed(context, RouteNames.register);
                      }),
                  const SizedBox(height: 20),
                  MyCustomButton(title: "Sign in with Google",
                      isLoading: false,
                      onTab: () {
                        context.read<AuthBloc>().add(SignInWithGoogleEvent());
                        Navigator.pushNamed(context, RouteNames.setPinRoute);
                      }),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state.status == FormsStatus.error) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
          if(state.status == FormsStatus.authenticated){
            if(state.statusMessage =="registered"){
              BlocProvider.of<UserProfileBloc>(context).add(
                AddUserEvent(state.userModel)
              );
            }else{
              BlocProvider.of<UserProfileBloc>(context).add(
                  GetCurrentEvent(state.userModel.authId,));
            }
            Navigator.pushNamedAndRemoveUntil(context, RouteNames.tabRoute,
                (route)=>false);
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }
}
