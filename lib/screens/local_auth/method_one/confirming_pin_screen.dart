import 'package:flutter/material.dart';

import '../../routes.dart';

class ConfirmPinScreen extends StatefulWidget {
  const ConfirmPinScreen({super.key});

  @override
  State<ConfirmPinScreen> createState() => _ConfirmPinScreenState();
}

class _ConfirmPinScreenState extends State<ConfirmPinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Confirm pin"),),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.tabRoute);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor:
                Colors.lightBlueAccent.withOpacity(0.8),
                // Text color
                padding: EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10),
                // Button padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      30), // Button border radius
                ),
              ),
              child: Text(
                "Confrirm",
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
