import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kishanapp/screens/particularItem.dart';
import 'package:kishanapp/services/productService.dart';

class GridItemList extends StatefulWidget {
  @override
  _GridItemListState createState() => _GridItemListState();
}

class _GridItemListState extends State<GridItemList> {
  ProductService _productService = new ProductService();

  _GridItemListState() {
    listFeaturedItems();
  }

  List featuredItems = new List(0);

  void listFeaturedItems() async {
    List<Map<String, String>> featuredItemList =
        await _productService.featuredItems();
    setState(() {
      featuredItems = featuredItemList;
    });
  }

  openParticularItem(item) async {
    String productId = item['product_id'].toString();
    Map itemDetails = await _productService.particularItem(productId);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ParticularItem(
        itemDetails: itemDetails,
      );
    }));
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    double itemWidth = size.width / 2;
    return Scaffold(
      appBar: AppBar(
            title: Text('Product'),
            backgroundColor: Colors.green,
            elevation: 0,
          ),
      body: CustomScrollView(slivers: [
        SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: (itemWidth / itemHeight),
              crossAxisCount: 2,
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 20.0,
            ),
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              var item = featuredItems[index];
              return featuredItemCard(item, index);
            }, childCount: featuredItems.length))
      ]),
    );
  }

  Widget featuredItemCard(item, index) {
    return Card(
      elevation: 0,
      semanticContainer: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Material(
              child: InkWell(
                onTap: () {
                  openParticularItem(item);
                },
                child: GridTile(
                  child: Image.network(
                    item['image'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "\Rs.${item['price']}.00",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  item['product_name'],
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 15.0, color: Colors.grey),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
