import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        OutlinedButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/login");
            },
            child: Text("Login")),
        OutlinedButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/register");
            },
            child: Text("Register"))
      ]),
    );
  }
}
