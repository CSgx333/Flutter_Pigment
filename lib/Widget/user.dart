import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class user extends StatelessWidget {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 60),
        Center(
          child: Text(
            "Account",
            style: TextStyle(
              fontSize: 25,
              color: Color(0xFF1c0a45),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 30),
        Image(
          image: AssetImage('images/user.png'),
        ),
        SizedBox(height: 20),
        Text(
          auth.currentUser!.email.toString(),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(30),
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 1, //spread radius
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                  left: 40,
                  right: 40,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Photos on account',style: TextStyle(fontSize: 12),),
                    Text('Likeable photos',style: TextStyle(fontSize: 12),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 85,
                  right: 85,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('0',style: TextStyle(fontSize: 12),),
                    Text('0',style: TextStyle(fontSize: 12),),
                  ],
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(15),
            ),
            primary: Color(0xFF39a9ff),
          ),
          child: Text("Logout"),
          onPressed: () {
            auth.signOut().then((value) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return MyApp();
              }));
            });
          },
        ),
      ],
    );
  }
}
