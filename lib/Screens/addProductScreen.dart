import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:store/Logic/ApIHelper.dart';
import 'package:store/Models/product.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  var picker = ImagePicker();
  var api = AuthApiHelper();
  File? image;
  String filename = '';
  var formKey = GlobalKey<FormState>();
  Product product = Product(
      id: "",
      name: "",
      price: 1,
      quantity: 1,
      categoryID: 1,
      description: "",
      imgURL: "",
      colors: [],
      status: "");

  takephoto() async {
    var temp = await picker.pickImage(source: ImageSource.camera);
    print(temp?.path);
    setState(() {
      image = File(temp!.path);
      filename = temp.name;
    });
  }

  choosefromgallary() async {
    var temp = await picker.pickImage(source: ImageSource.gallery);
    print(temp?.path);
    print(temp?.name);
    setState(() {
      image = File(temp!.path);
      filename = temp.name;
    });
  }

  saveForm() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState?.save();

      await api.AddProduct(product, image!.path, filename);
      Navigator.of(context).pushNamed("/products");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              onSaved: (newValue) {
                setState(() {
                  product.name = newValue!;
                });
              },
              validator: (value) {
                if (value == "" || value == null) {
                  return "enter a vaild Name";
                }
                return null;
              },
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                suffix: Icon(Icons.abc),
                label: Text("Name"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              onSaved: (newValue) {
                setState(() {
                  product.description = newValue!;
                });
              },
              validator: (value) {
                if (value == "" || value == null) {
                  return "enter a vaild description";
                }
                return null;
              },
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                label: Text("description"),
                suffix: Icon(Icons.abc),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              onSaved: (newValue) {
                setState(() {
                  var temp = int.parse(newValue!);
                  product.price = temp;
                });
              },
              validator: (value) {
                if (value == "" || value == null) {
                  return "enter a vaild Price";
                }
                return null;
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                suffix: Icon(Icons.monetization_on),
                label: Text("Price"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              onSaved: (newValue) {
                setState(() {
                  var temp = int.parse(newValue!);
                  product.quantity = temp;
                });
              },
              validator: (value) {
                if (value == "" || value == null) {
                  return "enter a vaild quantity";
                }
                return null;
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                suffix: Icon(Icons.numbers),
                label: Text("quantity"),
              ),
            ),
          ),
          Center(
            child: Column(children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: (image == null) ? null : FileImage(image!),
                child: (image == null) ? Icon(Icons.add) : null,
              ),
              OutlinedButton.icon(
                  onPressed: takephoto,
                  icon: Icon(Icons.camera),
                  label: Text("Take photo")),
              OutlinedButton.icon(
                  onPressed: choosefromgallary,
                  icon: Icon(Icons.photo_outlined),
                  label: Text("Choose from gallary"))
            ]),
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
