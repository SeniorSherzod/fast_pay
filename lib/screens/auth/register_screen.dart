import 'package:fast_pay/blocs/auth/auth_bloc.dart';
import 'package:fast_pay/blocs/user_profile/user_profile_bloc.dart';
import 'package:fast_pay/data/models/user_model.dart';
import 'package:fast_pay/screens/auth/widgets/my_button.dart';
import 'package:fast_pay/screens/auth/widgets/password_contains.dart';
import 'package:fast_pay/screens/local_auth/method_one/set_pin_screen.dart';
import 'package:fast_pay/utils/colors/colors.dart';
import 'package:fast_pay/utils/connstants/app_const.dart';
import 'package:fast_pay/utils/styles/styles.dart';
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

  bool containsUpperCase = false;
  bool containsLowerCase = false;
  bool containsNumber = false;
  bool containsSpecialChar = false;
  bool contains8Length = false;
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
                            } else if (!AppConstants.passwordRegExp
                                .hasMatch(val)) {
                              return 'Please enter a valid password';
                            }
                            return null;
                          }),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "⚈  1 uppercase",
                              style: TextStyle(
                                  color: containsUpperCase
                                      ? Colors.green
                                      : Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                            ),
                            Text(
                              "⚈  1 lowercase",
                              style: TextStyle(
                                  color: containsLowerCase
                                      ? Colors.green
                                      : Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                            ),
                            Text(
                              "⚈  1 number",
                              style: TextStyle(
                                  color: containsNumber
                                      ? Colors.green
                                      : Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "⚈  1 special character",
                              style: TextStyle(
                                  color: containsSpecialChar
                                      ? Colors.green
                                      : Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                            ),
                            Text(
                              "⚈  8 minimum character",
                              style: TextStyle(
                                  color: contains8Length
                                      ? Colors.green
                                      : Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                            ),
                          ],
                        ),
                      ],
                    ),
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
                            } else if (!AppConstants.passwordRegExp
                                .hasMatch(val)) {
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
                    MyCustomButton(
                      title: "Register",
                      onTab: () {
                        if (isValidRegisterCredential()) {
                          context.read<AuthBloc>().add(
                                RegisterUserEvent(
                                  userModel: UserModel(
                                      image: "",
                                      userId: "",
                                      lastname: lastNameController.text,
                                      username: nameController.text,
                                      password: passwordController.text,
                                      email:
                                          "${nameController.text.toLowerCase()}@gmail.com",
                                      phoneNumber: phoneController.text,
                                      fsm: "",
                                      authId: ""),
                                ),
                              );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Parrollar mos emas",
                                style: AppTextStyle.rubikMedium
                                    .copyWith(color: AppColors.white),
                              ),
                            ),
                          );
                          return;
                        }
                      },
                      readyToSubmit: true,
                      isLoading: state.status == FormsStatus.loading,
                    ),
                    const SizedBox(height: 20),
                    MyCustomButton(
                      title: "Login Now",
                      onTab: () {
                        Navigator.pop(context);
                      },
                      isLoading: false,
                    )
                  ],
                ),
              ),
            ),
          );
        },
        listener: (BuildContext context, AuthState state) {
          if (state.status == FormsStatus.authenticated) {
            if (state.statusMessage == "registered") {
            debugPrint("Qonday------");
              context.read<UserProfileBloc>().add(
                    AddUserEvent(state.userModel),
                  );
            }
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const SetPinScreen(),
              ),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  bool isValidRegisterCredential() =>
      AppConstants.passwordRegExp.hasMatch(passwordController.text) &&
      AppConstants.textRegExp.hasMatch(nameController.text) &&
      AppConstants.textRegExp.hasMatch(lastNameController.text) &&
      AppConstants.phoneRegExp.hasMatch(phoneController.text) &&
      (passwordController.text == confirmPasswordController.text);
}
