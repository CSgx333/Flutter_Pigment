import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pigment/Widget/Photo.dart';
import 'package:pigment/Widget/Vector.dart';
import 'package:pigment/Widget/Psd.dart';
import 'package:pigment/Widget/3D.dart';
import 'package:pigment/Widget/Icon.dart';

class imagesPage extends StatefulWidget {
  @override
  State<imagesPage> createState() => _imagesPageState();
}

class _imagesPageState extends State<imagesPage> {
  List<String> category = ["Vector","Photo", "Psd", "3D", "Icon"];
  List<StatelessWidget> categorys = [
    vector(),
    photo(),
    psd(),
    dd(),
    icon()
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 115),
          SizedBox(
            height: 25,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: category.length,
              itemBuilder: (context, index) => buildCategory(index),
            ),
          ),
          SizedBox(height: 25),
          StreamBuilder(
            stream: FirebaseFirestore.instance
              .collection("${categorys[selectedIndex]}")
              .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }return categorys[selectedIndex];
          }
          )
        ],
      ),
    );
  }

    Widget buildCategory(int index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category[index],
                style: TextStyle(
                  fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                  color: selectedIndex == index ? Colors.black : Colors.black45,
                ),
              ),
            ],
          ),
        ),
      );
  }
}

