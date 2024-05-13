import 'package:fast_pay/screens/auth/widgets/my_button.dart';
import 'package:fast_pay/screens/widgets/textfield.dart';
import 'package:fast_pay/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/user_profile/user_profile_bloc.dart';
import '../../../data/models/user_model.dart';
import '../../../utils/connstants/app_const.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key, required this.userModel});

  final UserModel userModel;

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  late UserModel userModel;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();

  @override
  void initState() {
    userModel = widget.userModel;
    emailController.text = userModel.email;
    fullNameController.text = "${userModel.username} ${userModel.lastname}";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 90.h,
                width: width,
              ),
              Container(
                width: 150.w,
                height: 150.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 20,
                        spreadRadius: 3),
                  ],
                  // image: DecorationImage(
                  //   image: userModel.imageUrl.isEmpty
                  //       ? const AssetImage("assets/images/profile.png")
                  //       : NetworkImage(userModel.imageUrl) as ImageProvider,
                  // ),
                ),
              ),
              SizedBox(height: 20.h),
              MyTextField(
                controller: emailController,
                hintText: "Email",
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20.h),
              MyTextField(
                controller: fullNameController,
                hintText: "Full name",
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20.h),
              MyCustomButton(
                isLoading: false,
                onTab: () {
                  context
                      .read<UserProfileBloc>()
                      .add(UpdateUserEvent(userModel: userModel));
                  Navigator.pop(context);
                },
            title: 'Save',
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool get checkInput {
    return AppConstants.emailRegExp.hasMatch(emailController.text) &&
        AppConstants.textRegExp.hasMatch(fullNameController.text);
  }

  @override
  void dispose() {
    emailController.dispose();
    fullNameController.dispose();

    super.dispose();
  }
}
