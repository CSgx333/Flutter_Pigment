import 'package:flutter/material.dart';
import 'package:pigment/Widget/image1.dart';

class psd extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 10),
      Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: Text(
            "Psd",
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
              "Images 9,880",
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
          image1("p1","Signage Psd",100,'50'),
          SizedBox(width: 25),
          image1("p2","Yellow Scene",100,'120'),
          SizedBox(width: 25),
        ],
      ),
      SizedBox(height: 25),
      Row(
        children: [
          SizedBox(width: 25),
          image1("p3","Pinky Text",100,'200'),
          SizedBox(width: 25),
          image1("p4","Boom Text",100,'200'),
          SizedBox(width: 25),
        ],
      ),
      SizedBox(height: 25),
      Row(
        children: [
          SizedBox(width: 25),
          image1("p5","Graffiti Text",100,'250'),
          SizedBox(width: 25),
          image1("p6","Notebook Psd",100,'90'),
          SizedBox(width: 25),
        ],
      ),
      SizedBox(height: 25),
      Row(
        children: [
          SizedBox(width: 25),
          image1("p7","Card",100,'300'),
          SizedBox(width: 25),
          image1("p8","Nice Game",100,'200'),
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