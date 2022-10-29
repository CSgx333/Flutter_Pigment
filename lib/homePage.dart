import 'package:flutter/material.dart';
import 'package:pigment/Widget/image1.dart';
import 'package:pigment/Widget/image2.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:getwidget/getwidget.dart';

import 'Widget/register.dart';

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 825,
            child: Column(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 550.0, 0, 0),
                    child: Text(
                      'Pigment',
                      style: TextStyle(
                          fontSize: 25,
                          color: Color(0xFF1c0a45),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                    child: Text(
                      'Find and download the best high-quality',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF1c0a45),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 8.0, 0, 0),
                    child: Text(
                      'photos, designs and mockups.',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF1c0a45),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 30),
                        GFIconButton(
                          onPressed: (){},
                          icon: Icon(Icons.facebook),
                          size: GFSize.SMALL,
                          shape: GFIconButtonShape.circle,
                        ),
                        GFIconButton(
                          onPressed: (){},
                          icon: Icon(Icons.play_arrow),
                          size: GFSize.SMALL,
                          color: Colors.red,
                          shape: GFIconButtonShape.circle,
                        ),
                        GFIconButton(
                          onPressed: (){},
                          icon: Icon(Icons.mail),
                          size: GFSize.SMALL,
                          color: Colors.black45,
                          shape: GFIconButtonShape.circle,
                        ),
                        SizedBox(width: 30),
                      ],
                    ),

              ],
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/bg4.jpg'), fit: BoxFit.fill),
            ),
          ),
          Container(
            // Carousel
            child: Column(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 35, 0, 20),
                    child: Text(
                      'What do we have ?',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF0082ef),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Text(
                      'Picture Categories',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color(0xFF1c0a45),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 311,
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 70),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      autoPlay: true,
                    ),
                    items: [
                      image2("Vector", "images/1.jpg"),
                      image2("Photo", "images/2.jpg"),
                      image2("Psd", "images/3.jpg"),
                      image2("3D", "images/4.jpg"),
                      image2("Icon", "images/5.jpg"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
                    child: Text(
                      'Featured Pictures',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color(0xFF1c0a45),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 25),
                        image1("6", "Meteor Garden", 125, '300'),
                        SizedBox(width: 10),
                        image1("9", "Doughnut", 125, '200'),
                        SizedBox(width: 25),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 25),
                        image1("11", "Extraterrestrial cities", 180, '460'),
                        SizedBox(width: 25),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 25),
                        image1("12", "Streets in Mobile", 260, '315'),
                        SizedBox(width: 10),
                        image1("13", "Purple City", 260, '250'),
                        SizedBox(width: 25),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 25),
                        image1("7", "Arcade Ahri", 180, '200'),
                        SizedBox(width: 25),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 25),
                        image1("8", "Icon Set", 125, '100'),
                        SizedBox(width: 10),
                        image1("10", "Thai Set Meals", 125, '200'),
                        SizedBox(width: 25),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 25),
                        image1("17", "Leisure desk photo", 180, '200'),
                        SizedBox(width: 25),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 25),
                        image1("14", "Chiba Dog", 260, '320'),
                        SizedBox(width: 10),
                        image1("15", "Yellow flowers", 260, '175'),
                        SizedBox(width: 25),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
          Container(
            // Register
            height: 200,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFFa5e8fa),
                  Color(0xFF425dc6),
                ],
              ),
            ),

            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 35, 0, 15),
                  child: const Text(
                    "Join Pigment",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                  child: const Text(
                    "Register Get premium",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFFe8f3ff),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: const Text(
                    "privileges for a different experience",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFFe8f3ff),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Register();
                    }));
                  },
                  child: const Text("Register"),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF39a9ff),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
