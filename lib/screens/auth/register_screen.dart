import 'package:fast_pay/blocs/auth/auth_bloc.dart';
import 'package:fast_pay/data/models/user_model.dart';
import 'package:fast_pay/screens/auth/widgets/password_contains.dart';
import 'package:fast_pay/screens/routes.dart';
import 'package:fast_pay/utils/connstants/app_const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/forms_status.dart';
import '../../utils/images/images.dart';
import '../widgets/textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  bool signUpRequired = false;
  UserModel userModel = UserModel.initial();
  bool obscurePassword = true;
  IconData iconPassword = CupertinoIcons.eye_fill;

  bool isValidLoginCredential() =>
      AppConstants.passwordRegExp.hasMatch(passwordController.text) &&
      AppConstants.textRegExp.hasMatch(nameController.text) &&
      AppConstants.textRegExp.hasMatch(lastNameController.text) &&
      AppConstants.phoneRegExp.hasMatch(phoneController.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
  builder: (context, state) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 250, left: 20, right: 20),
        child: Center(
          child: Column(
            children: [
              Image.asset(AppImages.bank),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: MyTextField(
                    controller: nameController,
                    hintText: 'Name',
                    obscureText: false,
                    keyboardType: TextInputType.name,
                    prefixIcon: const Icon(CupertinoIcons.person_fill),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Please fill in this field';
                      } else if (val.length > 30) {
                        return 'Name too long';
                      }
                      return null;
                    }),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: MyTextField(
                    controller: lastNameController,
                    hintText: 'Last Name',
                    obscureText: false,
                    keyboardType: TextInputType.name,
                    prefixIcon: const Icon(CupertinoIcons.person_fill),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Please fill in this field';
                      } else if (val.length > 30) {
                        return 'Name too long';
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
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Please fill in this field';
                      } else if (!AppConstants.passwordRegExp.hasMatch(val)) {
                        return 'Please enter a valid password';
                      }
                      return null;
                    }),
              ),
              const SizedBox(height: 10),
              const PasswordContains(),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: MyTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    obscureText: obscurePassword,
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: const Icon(CupertinoIcons.lock_fill),
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
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Please fill in this field';
                      } else if (!AppConstants.passwordRegExp.hasMatch(val)) {
                        return 'Please enter a valid password';
                      }
                      return null;
                    }),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: MyTextField(
                    controller: phoneController,
                    hintText: ' Phone Number',
                    obscureText: false,
                    keyboardType: TextInputType.phone,
                    prefixIcon: const Icon(CupertinoIcons.phone),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Please fill in this field';
                      } else if (val.length > 30) {
                        return 'Name too long';
                      }
                      return null;
                    }),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              !signUpRequired
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextButton(
                          onPressed: () {
                            UserModel userModel = UserModel.initial();
                            userModel = userModel.copyWith(
                              email: "",
                              password: passwordController.text,
                              lastname: lastNameController.text,
                              phoneNumber: phoneController.text,
                              username: nameController.text,
                            );
                            if (passwordController.text ==
                                confirmPasswordController.text) {
                              context.read<AuthBloc>().add(
                                    RegisterUserEvent(
                                      userModel: UserModel(
                                          image: "",
                                          userId: "",
                                          lastname: lastNameController.text,
                                          username: nameController.text,
                                          password: passwordController.text,
                                          email: "${nameController.text}@gmail.com",
                                          phoneNumber: phoneController.text,
                                          fsm: "",
                                          authId: ""),
                                    ),
                                  );
                            };
                          Navigator.pushNamed(context, RouteNames.tabRoute);
                          Navigator.pop(context);
                          },
                          style: TextButton.styleFrom(
                              elevation: 3.0,
                              backgroundColor: Colors.lightBlueAccent,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60))),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 5),
                            child: Text(
                              'Sign Up',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          )),
                    )
                  : const CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  },
          listener: (context, state) {
            if (state.status == FormsStatus.error) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
          },
));
  }
  @override
  void dispose() {
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    lastNameController.dispose();
    super.dispose();
  }
}
