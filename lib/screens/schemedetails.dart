import 'package:flutter/material.dart';
import 'package:kishanapp/model/govtscheme.dart';

// ignore: must_be_immutable
class SchemesDetails extends StatelessWidget {
  Schemes schemes;
  SchemesDetails(this.schemes);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
		    Navigator.pop(context);
	    },
      child: Scaffold(
        backgroundColor: Color(0xfff4f4f4),
      appBar: AppBar(
        title: Text('Schemes'),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child : Text(schemes.schemes_name,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left, 
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Card(
                elevation: 5,
                  child: Container(
                    height: 200,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(schemes.imageUrl)
                          ,
                        ),
                      ),
                    ),
                ),
              ),
               SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child : Text('About',style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child : Text(schemes.content,),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child : Text('Who can Apply',style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child : Text(schemes.whocanapply,),
            ), 
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child : Text('How to Apply',style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child : Text(schemes.howtoapply,),
            ), 
            Container(
              child : Text('For Apply and More Details Click Link'),
            ),
            SizedBox(
              height: 20,
            ),
          ]
        )
      )
      ),
    );
  }
}
