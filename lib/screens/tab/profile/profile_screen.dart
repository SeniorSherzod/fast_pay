import 'package:fast_pay/screens/widgets/textfield.dart';
import 'package:fast_pay/utils/extensions/extensions.dart';
import 'package:fast_pay/utils/images/images.dart';
import 'package:fast_pay/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              width: 30,
                child: SvgPicture.asset(AppImages.profile,)),
            Center(
                child: Text(
              "Edit Profile",
              style: AppTextStyle.rubikMedium.copyWith(fontSize: 25),
            )),
            MyTextField(
                controller: nameController,
                hintText: "Name",
                obscureText: true,
                keyboardType: TextInputType.name),
            15.getH(),
            MyTextField(
                controller: phoneController,
                hintText: "phone",
                obscureText: true,
                keyboardType: TextInputType.name),
            15.getH(),
            MyTextField(
                controller: lastNameController,
                hintText: "address",
                obscureText: true,
                keyboardType: TextInputType.name),
            15.getH(),
          ],
        ),
      ),
    );
  }
}
