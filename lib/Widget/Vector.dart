import 'package:flutter/material.dart';
import 'package:pigment/Widget/image1.dart';

class vector extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 10),
      Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: Text(
            "Vector",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xFF1c0a45),
            ),
          ),
        ),
      ),
      SizedBox(height: 5),
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.image,size: 15,),
            SizedBox(width: 5),
            Text(
              "Images 85,614",
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF1c0a45),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 30),
      Row(
        children: [
          SizedBox(width: 25),
          image1("v1","Deer Under the Moonlight",100,'300'),
          SizedBox(width: 25),
          image1("v2","House Vector",100,'200'),
          SizedBox(width: 25),
        ],
      ),
      SizedBox(height: 25),
      Row(
        children: [
          SizedBox(width: 25),
          image1("v3","NPC01",100,'400'),
          SizedBox(width: 25),
          image1("v4","Pink Night",100,'400'),
          SizedBox(width: 25),
        ],
      ),
      SizedBox(height: 25),
      Row(
        children: [
          SizedBox(width: 25),
          image1("v5","Rainbow Forest",100,'400'),
          SizedBox(width: 25),
          image1("v6","Cactus Vector",100,'150'),
          SizedBox(width: 25),
        ],
      ),
      SizedBox(height: 25),
      Row(
        children: [
          SizedBox(width: 25),
          image1("v7","City Vector",100,'200'),
          SizedBox(width: 25),
          image1("v8","Fall Season",100,'300'),
          SizedBox(width: 25),
        ],
      ),
      SizedBox(height: 25),
      ElevatedButton(
        onPressed: () {},
        child: const Text("Next Page"),
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF39a9ff),
        ),
      ),
      SizedBox(height: 15),
    ]);
  }
}
