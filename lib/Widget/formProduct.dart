import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pigment/models/product.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../main.dart';

class formProduct extends StatelessWidget {
  const formProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/v1.jpg'), fit: BoxFit.cover)),
          ),
          Positioned(
            left: 15,
            top: 10 + MediaQuery.of(context).padding.top,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () => {
                Navigator.pop(context),
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(0, -4),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: form(),
            ),
          )
        ],
      ),
    );
  }
}

class form extends StatefulWidget {
  const form({Key? key}) : super(key: key);

  @override
  State<form> createState() => _formState();
}

class _formState extends State<form> {
  final formKey = GlobalKey<FormState>();
  product myProduct = product(image: '', name: '', price: '');
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  CollectionReference _productCollection =
      FirebaseFirestore.instance.collection("product");

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebase,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("${snapshot.error}"),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            padding: EdgeInsets.all(30),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    Center(
                      child: Text(
                        "Add Image",
                        style: TextStyle(
                          fontSize: 25,
                          color: Color(0xFF1c0a45),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: "Enter Image",
                        prefixIcon: Icon(Icons.image),
                      ),
                      validator: RequiredValidator(
                          errorText: "Please enter image files."),
                      onSaved: (String? image) {
                        myProduct.image = image!;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: "Enter Name",
                        prefixIcon: Icon(Icons.drive_file_rename_outline),
                      ),
                      validator: RequiredValidator(
                          errorText: "Please enter image name."),
                      onSaved: (String? name) {
                        myProduct.name = name!;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: "Enter Price",
                        prefixIcon: Icon(Icons.local_offer),
                      ),
                      validator:
                          RequiredValidator(errorText: "Please enter price."),
                      onSaved: (String? price) {
                        myProduct.price = price!;
                      },
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 45),
                    Center(
                      child: SizedBox(
                        width: 210,
                        height: 47,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(15),
                            ),
                            primary: Color(0xFF39a9ff),
                          ),
                          child: Text(
                            "+ Add to Cart",
                            style: TextStyle(fontSize: 18),
                          ),
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              await _productCollection.add({
                                "Image": myProduct.image,
                                "Name": myProduct.name,
                                "Price": myProduct.price,
                              });
                              formKey.currentState?.reset();
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return MyApp();
                              }));
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
