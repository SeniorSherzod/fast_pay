import 'package:fast_pay/utils/extensions/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/auth/auth_bloc.dart';
import '../../../blocs/user_profile/user_profile_bloc.dart';
import '../../routes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.updateUser,
                  arguments: context.read<UserProfileBloc>().state.userModel);
            },
            icon: Icon(
              Icons.settings,
              size: 24.w,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, RouteNames.authRoute, (route) => false);
              context.read<AuthBloc>().add(LogOutUserEvent());
            },
            icon: Icon(
              Icons.exit_to_app,
              size: 24.w,
            ),
          ),
        ],
      ),
      body: BlocConsumer<UserProfileBloc, UserProfileState>(
        builder: (BuildContext context, UserProfileState state) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 20.h),
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
                    //   image: state.userModel.imageUrl.isEmpty
                    //       ? const AssetImage("assets/images/profile.png")
                    //       : NetworkImage(state.userModel.imageUrl)
                    //   as ImageProvider,
                    // ),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "${state.userModel.lastname} ${state.userModel.username}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.w,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: Container(
                    padding:
                    EdgeInsets.only(left: 10.w, right: 10.w, top: 30.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.w),
                        topRight: Radius.circular(30.w),
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 10,
                            spreadRadius: 3),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: double.infinity),
                          Text(
                            "Email: ${state.userModel.email}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.w,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "Last name: ${state.userModel.lastname}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.w,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "First name: ${state.userModel.username}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.w,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "Phone number: ${state.userModel.phoneNumber}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.w,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        listener: (BuildContext context, UserProfileState state) {},
      ),
    );
  }
}