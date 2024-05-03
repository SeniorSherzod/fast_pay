import 'package:flutter/material.dart';

import '../../routes.dart';

class SetpinScreen extends StatefulWidget {
  const SetpinScreen({super.key});

  @override
  State<SetpinScreen> createState() => _SetpinScreenState();
}

class _SetpinScreenState extends State<SetpinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(title: Text("Entry pin"),),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.confirmPinRoute);
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
