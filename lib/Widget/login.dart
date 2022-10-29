import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:pigment/Widget/register.dart';
import 'package:pigment/Widget/user.dart';
import 'package:pigment/models/profile.dart';

import '../main.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

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
                    image: AssetImage('images/bg5.jpg'), fit: BoxFit.cover)),
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
              child: StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    return user();
                  }else{
                    return bodyLogin();
                  }
                },
              )
            ),
          )
        ],
      ),
    );
  }
}


class bodyLogin extends StatelessWidget {
  const bodyLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          formLogin(),
          Center(
            child: Text(
              "-  or  -",
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Register();
                }));
              },
              child: new Text(
                "Register Now ?",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF0082ef),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class formLogin extends StatefulWidget {
  const formLogin({Key? key}) : super(key: key);

  @override
  State<formLogin> createState() => _formLoginState();
}

class _formLoginState extends State<formLogin> {
  final formKey = GlobalKey<FormState>();
  profile myProfile = profile(email: '', password: '');
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

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
                          "Login",
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
                          hintText: "Enter Email",
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: MultiValidator([
                          EmailValidator(errorText: 'Invalid email format'),
                          RequiredValidator(errorText: 'Please enter email'),
                        ]),
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (String? email) {
                          myProfile.email = email!;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintText: "Enter Password",
                          prefixIcon: Icon(Icons.lock),
                        ),
                        validator: RequiredValidator(
                            errorText: 'Please enter password'),
                        obscureText: true,
                        onSaved: (String? password) {
                          myProfile.password = password!;
                        },
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
                              "Login",
                              style: TextStyle(fontSize: 18),
                            ),
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                try {
                                  await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: myProfile.email,
                                          password: myProfile.password)
                                      .then((value) {
                                    formKey.currentState!.reset();
                                  });
                                } on FirebaseAuthException catch (e) {
                                  Fluttertoast.showToast(
                                    msg: e.message.toString(),
                                    gravity: ToastGravity.TOP,
                                  );
                                }
                              }
                            },
                          ),
                        ),
                      )
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
        });
  }
}