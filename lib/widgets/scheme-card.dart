import 'package:kishanapp/model/govtscheme.dart';
import 'package:flutter/material.dart';
import 'package:kishanapp/screens/schemedetails.dart';
 
class SchemesCard extends StatelessWidget {
  final Schemes scheme;
 
  SchemesCard({this.scheme});
 
  @override
  Widget build(BuildContext context) {
   return Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: InkWell(
           onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) {
		          return SchemesDetails(scheme);
	          }))},
          child: Image.network(
            scheme.imageUrl,
            fit: BoxFit.fill,
          )
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: EdgeInsets.all(10),
        );
  }
}