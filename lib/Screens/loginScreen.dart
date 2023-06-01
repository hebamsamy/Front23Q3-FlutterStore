import 'package:flutter/material.dart';
import 'package:store/Logic/ApIHelper.dart';
import 'package:store/Models/user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var api = AuthApiHelper();
  var user = User(email: "", name: "", password: "", phoneNumber: "");
  bool isVisable = true;
  var fromKey = GlobalKey<FormState>();
  saveForm() async {
    if (fromKey.currentState!.validate()) {
      fromKey.currentState?.save();
      var resp = await api.login(user);
      print(resp);
      Navigator.of(context).pushNamed("/products");
      ////to do save token in mobile storage
      ///https://pub.dev/packages/shared_preferences
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Join Us"), actions: [
        IconButton(
            onPressed: () {
              fromKey.currentState?.reset();
            },
            icon: Icon(Icons.refresh))
      ]),
      body: Form(
        key: fromKey,
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              onSaved: (newValue) {
                setState(() {
                  user.email = newValue!;
                });
              },
              validator: (value) {
                RegExp pattern =
                    RegExp(r"^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$");
                if (value == "" || value == null) {
                  return "enter a vaild Email";
                } else if (!pattern.hasMatch(value)) {
                  return "Email must be like :example@gggg.com";
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                suffix: Icon(Icons.abc),
                helperText: "Like: like :example@gggg.com",
                label: Text("Email"),
                icon: Icon(Icons.email),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              obscureText: isVisable,
              onSaved: (newValue) {
                setState(() {
                  user.password = newValue!;
                });
              },
              validator: (value) {
                if (value == "" || value == null) {
                  return "enter a vaild Password";
                } else if (value.length < 8) {
                  return "Password must have more than 8 letters";
                }
                return null;
              },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        isVisable = !isVisable;
                      });
                    },
                    icon: Icon(Icons.remove_red_eye)),
                helperText: "Like: asdasdasd",
                label: Text("Password"),
                icon: Icon(Icons.no_encryption_gmailerrorred_sharp),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: OutlinedButton(onPressed: saveForm, child: Text("Save")),
          )
        ]),
      ),
    );
  }
}
