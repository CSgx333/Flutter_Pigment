import 'package:flutter/material.dart';
import 'package:pigment/Widget/image1.dart';

class icon extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 10),
      Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: Text(
            "Icon",
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
              "Images 8,620",
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
          image1("i1","Icon Set",100,'200'),
          SizedBox(width: 25),
          image1("i2","Emojis Set",100,'300'),
          SizedBox(width: 25),
        ],
      ),
      SizedBox(height: 25),
      Row(
        children: [
          SizedBox(width: 25),
          image1("i3","Easy Icons",100,'125'),
          SizedBox(width: 25),
          image1("i4","3D Icons",100,'350'),
          SizedBox(width: 25),
        ],
      ),
      SizedBox(height: 25),
      Row(
        children: [
          SizedBox(width: 25),
          image1("i5","Icon Chill",100,'230'),
          SizedBox(width: 25),
          image1("i6","Finance Icons",100,'400'),
          SizedBox(width: 25),
        ],
      ),
      SizedBox(height: 25),
      Row(
        children: [
          SizedBox(width: 25),
          image1("i7","Blue Icon Theme",100,'420'),
          SizedBox(width: 25),
          image1("i8","Arrow Icon",100,'300'),
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