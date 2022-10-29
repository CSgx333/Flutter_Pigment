import 'package:flutter/material.dart';
import 'package:pigment/Widget/image1.dart';

class dd extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 10),
      Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: Text(
            "3D",
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
              "Images 5,203",
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
          image1("3d1","Minecraft",100,'600'),
          SizedBox(width: 25),
          image1("3d2","CG Purple Claws",100,'650'),
          SizedBox(width: 25),
        ],
      ),
      SizedBox(height: 25),
      Row(
        children: [
          SizedBox(width: 25),
          image1("3d3","CG Circular Load",100,'450'),
          SizedBox(width: 25),
          image1("3d4","Cereals",100,'500'),
          SizedBox(width: 25),
        ],
      ),
      SizedBox(height: 25),
      Row(
        children: [
          SizedBox(width: 25),
          image1("3d5","Gems loop",100,'380'),
          SizedBox(width: 25),
          image1("3d6","Diamond",100,'300'),
          SizedBox(width: 25),
        ],
      ),
      SizedBox(height: 25),
      Row(
        children: [
          SizedBox(width: 25),
          image1("3d7","Hole 3D",100,'350'),
          SizedBox(width: 25),
          image1("3d8","Light Trails",100,'300'),
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