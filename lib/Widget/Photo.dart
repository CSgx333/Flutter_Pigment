import 'package:flutter/material.dart';
import 'package:pigment/Widget/image1.dart';

class photo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 10),
      Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: Text(
            "Photo",
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
              "Images 119,564",
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
          image1("pt1","Sunset",100,"250"),
          SizedBox(width: 25),
          image1("pt2","Cold Wind Challenge",100,"320"),
          SizedBox(width: 25),
        ],
      ),
      SizedBox(height: 25),
      Row(
        children: [
          SizedBox(width: 25),
          image1("pt3","Bird's Eye View",100,"210"),
          SizedBox(width: 25),
          image1("pt4","Gradient Fruits",100,'400'),
          SizedBox(width: 25),
        ],
      ),
      SizedBox(height: 25),
      Row(
        children: [
          SizedBox(width: 25),
          image1("pt5","City Buildings",100,'500'),
          SizedBox(width: 25),
          image1("pt6","Ice cream",100,'250'),
          SizedBox(width: 25),
        ],
      ),
      SizedBox(height: 25),
      Row(
        children: [
          SizedBox(width: 25),
          image1("pt7","Scout",100,'140'),
          SizedBox(width: 25),
          image1("pt8","Brothers",100,'270'),
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