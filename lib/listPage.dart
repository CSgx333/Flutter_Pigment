import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pigment/Widget/formProduct.dart';

class listPage extends StatefulWidget {
  const listPage({Key? key}) : super(key: key);

  @override
  State<listPage> createState() => _listPageState();
}

class _listPageState extends State<listPage> {
  int total = 0;

  deletedata(var key) async {
    await FirebaseFirestore.instance.collection("product").doc(key).delete();
  }

  Total() async {
    await FirebaseFirestore.instance
        .collection('product')
        .get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        setState((){
          total += int.parse(doc['Price']);
        });
      });
    });
    return total.toString();
  }

  @override
  initState(){
    super.initState();
    Total();
  }
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("product").snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index){
                  DocumentSnapshot document = snapshot.data!.docs[index];
                  return Card(
                    elevation: 3,
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      leading: Image(
                        image: AssetImage('images/${document["Image"]}.jpg'),
                      ),
                      title: Text(
                        document["Name"],
                        style: TextStyle(
                          color: Color(0xFF1c0a45),
                        ),
                      ),
                      subtitle: Text(
                        '${document["Price"]} ฿',
                        style: TextStyle(
                          color: Color(0xFF726c7f),
                        ),
                      ),
                      trailing: GestureDetector(
                        onTap: () {
                          total = total - int.parse(document["Price"]);
                          deletedata(snapshot.data!.docs[index].id);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return formProduct();
                          }));
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  );
                }),
              ),

            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.07),
                      offset: Offset(0, -3),
                      blurRadius: 12),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 5.0),
                  Text(
                    "Total Price : ${total} ฿",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF1c0a45),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(height: 15),
                      SizedBox(
                        width: 120.0,
                        height: 36.0,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Buy Now",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF39a9ff),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                  SizedBox(width: 5.0),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

