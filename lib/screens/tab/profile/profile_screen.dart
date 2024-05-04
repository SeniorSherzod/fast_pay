import 'package:fast_pay/blocs/user_profile/user_profile_bloc.dart';
import 'package:fast_pay/data/models/forms_status.dart';
import 'package:fast_pay/data/models/user_model.dart';
import 'package:fast_pay/screens/routes.dart';
import 'package:fast_pay/screens/widgets/textfield.dart';
import 'package:fast_pay/utils/extensions/extensions.dart';
import 'package:fast_pay/utils/images/images.dart';
import 'package:fast_pay/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../blocs/auth/auth_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final lastNameController = TextEditingController();

  // final Controller =TextEditingController();
  @override
  void initState() {
    // BlocProvider.of<UserProfileBloc>(context).add(GetCurrentEvent(uid:UserModel. ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Profile"),
        actions: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
            if(state.status == FormsStatus.unauthenticated){
              Navigator.pushNamed(context, RouteNames.authRoute);
            }
            },
            child: IconButton(onPressed: () {
              context.read<AuthBloc>().add(LogOutUserEvent());
              Navigator.pushNamed(context, RouteNames.authRoute);
            }, icon: Icon(Icons.logout)),
          )
        ],
      ),
      body: BlocBuilder<UserProfileBloc, UserProfileState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                      width: 30,
                      child: SvgPicture.asset(AppImages.profile,)),
                  Center(
                      child: Text(
                        state.userModel.username,
                        style: AppTextStyle.rubikMedium.copyWith(
                            fontSize: 25, color: Colors.black),
                      )),
              
                  Center(
                      child: Text(
                        state.userModel.lastname,
                        style: AppTextStyle.rubikMedium.copyWith(
                            fontSize: 25, color: Colors.black),
                      )),
                  50.getH(),
                  MyTextField(
                      controller: nameController,
                      hintText: state.userModel.username,
                      obscureText: true,
                      keyboardType: TextInputType.name),
                  15.getH(),
                  MyTextField(
                      controller: phoneController,
                      hintText: state.userModel.phoneNumber,
                      obscureText: true,
                      keyboardType: TextInputType.name),
                  15.getH(),
                  MyTextField(
                      controller: lastNameController,
                      hintText: state.userModel.lastname,
                      obscureText: true,
                      keyboardType: TextInputType.name),
                  15.getH(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
