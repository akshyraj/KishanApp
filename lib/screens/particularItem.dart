import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kishanapp/services/productService.dart';
import 'package:kishanapp/services/shoppingBagService.dart';
import 'package:webfeed/domain/media/rights.dart';

class ParticularItem extends StatefulWidget {
  final Map<String, dynamic> itemDetails;
  ParticularItem({var key, this.itemDetails}) : super(key: key);
  @override
  _ParticularItemState createState() => _ParticularItemState();
}

class _ParticularItemState extends State<ParticularItem> {
  int productQuantity = 1;
  Map customWidth = new Map();

  BuildContext buildContext;

  setProductQuantity(String type) {
    setState(() {
      if (type == 'inc') {
        if (productQuantity != 50) {
          productQuantity = productQuantity + 1;
        }
      } else {
        if (productQuantity != 1) {
          productQuantity = productQuantity - 1;
        }
      }
    });
  }

  addToShoppingBag() async {
    ShoppingBagService _shoppingBagService = new ShoppingBagService();
    String msg = await _shoppingBagService.add(
        widget.itemDetails['product_Id'], productQuantity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff4f4f4),
        appBar: AppBar(
          title: Text('Product details'),
          backgroundColor: Colors.green,
          elevation: 0,
        ),
        body: SingleChildScrollView(
            child: Container(
          decoration: BoxDecoration(),
          child: Column(children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              height: 350,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.itemDetails['image']),
                      fit: BoxFit.fill)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.itemDetails['product_name'],
                      style: TextStyle(
                        fontFamily: 'NovaSquare',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                "Rs " + widget.itemDetails['price'],
                style: TextStyle(
                  fontFamily: 'NovaSquare',
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(height : 10),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                "Description : ",
                style: TextStyle(
                  fontFamily: 'NovaSquare',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                widget.itemDetails['desc'],
                style: TextStyle(
                  fontFamily: 'NovaSquare',
                  fontSize: 17,
                ),
              ),
            ),
            SizedBox(height : 10),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                "Category : ",
                style: TextStyle(
                  fontFamily: 'NovaSquare',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                widget.itemDetails['category'],
                style: TextStyle(
                  fontFamily: 'NovaSquare',
                  fontSize: 17,
                ),
              ),
            ),
            SizedBox(height : 10),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                "Usage : ",
                style: TextStyle(
                  fontFamily: 'NovaSquare',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                widget.itemDetails['usage'],
                style: TextStyle(
                  fontFamily: 'NovaSquare',
                  fontSize: 17,
                ),
              ),
            ),
            SizedBox(height : 10),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                "Weight : ",
                style: TextStyle(
                  fontFamily: 'NovaSquare',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                widget.itemDetails['weight'],
                style: TextStyle(
                  fontFamily: 'NovaSquare',
                  fontSize: 17,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Quantity',
                style: TextStyle(
                  fontFamily: 'NovaSquare',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  onPressed: () {
                    setProductQuantity('inc');
                  },
                  color: Colors.white,
                  child: Icon(
                    Icons.add,
                  ),
                  padding: EdgeInsets.all(12.0),
                  shape: CircleBorder(),
                  elevation: 18.0,
                ),
                Text(
                  '$productQuantity',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                MaterialButton(
                  onPressed: () {
                    setProductQuantity('dec');
                  },
                  textColor: Colors.white,
                  color: Colors.black,
                  child: Icon(
                    Icons.remove,
                  ),
                  padding: EdgeInsets.all(12.0),
                  shape: CircleBorder(),
                  elevation: 18.0,
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonTheme(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    minWidth: 20,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        elevation: 16.0,
                        onPressed: () {
                          print(productQuantity);
                        },
                        color: Colors.green,
                        child: Text(
                          'Add to bag',
                          style: TextStyle(
                              fontFamily: 'NovaSquare',
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ))),
                ButtonTheme(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                    minWidth: 20,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        elevation: 16.0,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.white,
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                              fontFamily: 'NovaSquare',
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        )))
              ],
            ),
          ]),
        )));
  }
}
