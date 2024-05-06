import 'package:fast_pay/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/user_profile/user_profile_bloc.dart';
import '../../widgets/textfield.dart';

class Updatescreen extends StatefulWidget {
  const Updatescreen({super.key});

  @override
  State<Updatescreen> createState() => _UpdatescreenState();
}

class _UpdatescreenState extends State<Updatescreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("update"),
      ),
      body: BlocBuilder<UserProfileBloc, UserProfileState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
               SizedBox(height: 50,),
                MyTextField(
                    controller: nameController,
                    hintText: state.userModel.username,
                    obscureText: true,
                    keyboardType: TextInputType.name),
                SizedBox(height: 15,),
                MyTextField(
                    controller: phoneController,
                    hintText: state.userModel.phoneNumber,
                    obscureText: true,
                    keyboardType: TextInputType.name),
                SizedBox(height: 15,),
                MyTextField(
                    controller: lastNameController,
                    hintText: state.userModel.lastname,
                    obscureText: true,
                    keyboardType: TextInputType.name),
                SizedBox(height: 15,),
              ],
            ),
          );
        },
      ),
    );
  }
}
