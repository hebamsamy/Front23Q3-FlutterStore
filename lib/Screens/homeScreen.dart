import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
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
        ),
      ),
    );
  }
}
