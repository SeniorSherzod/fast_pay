import 'package:flutter/material.dart';

class PasswordContains extends StatelessWidget {
  const PasswordContains({super.key});

  @override
  Widget build(BuildContext context) {
    bool containsUpperCase = false;
    bool containsLowerCase = false;
    bool containsNumber = false;
    bool containsSpecialChar = false;
    bool contains8Length = false;
    return    Row(
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
    );
  }
}
