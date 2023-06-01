import 'package:flutter/material.dart';
import 'package:store/Logic/ApIHelper.dart';
import 'package:store/Models/user.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var api = AuthApiHelper();
  var user = User(email: "", name: "", password: "", phoneNumber: "");
  bool isVisable = true;
  var fromKey = GlobalKey<FormState>();
  saveForm() {
    if (fromKey.currentState!.validate()) {
      fromKey.currentState?.save();
      // print(user)
      api.register(user).then((value) {
        print(value);
        if (value["success"] == true) {
          return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text("Successfully Registered "),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            fromKey.currentState?.reset();
                            Navigator.of(context).pushNamed("/login");
                          },
                          child: Text("Go to Login"))
                    ],
                  ));
        } else {
          return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text("Try Again "),
                    content: Text(value["message"]),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("close"))
                    ],
                  ));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create an Account"), actions: [
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
                  user.name = newValue!;
                });
              },
              validator: (value) {
                if (value == "" || value == null) {
                  return "enter a vaild User Name";
                } else if (value.length < 3) {
                  return "User Name must have more than 3 letters";
                }
                return null;
              },
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                suffix: Icon(Icons.abc),
                helperText: "Like: user_name",
                label: Text("User Name"),
                icon: Icon(Icons.edit),
              ),
            ),
          ),
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
              onSaved: (newValue) {
                setState(() {
                  user.phoneNumber = newValue!;
                });
              },
              validator: (value) {
                if (value == "" || value == null) {
                  return "enter a vaild Phone Number";
                } else if (value.length < 12) {
                  return "Phone Number must have more than 12 number";
                }
                return null;
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                suffix: Icon(Icons.abc),
                helperText: "Like: 011111111111",
                label: Text("Phone Number"),
                icon: Icon(Icons.phone),
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
