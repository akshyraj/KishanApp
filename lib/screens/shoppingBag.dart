import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kishanapp/services/shoppingBagService.dart';

class ShoppingBag extends StatefulWidget {
  @override
  _ShoppingBagState createState() => _ShoppingBagState();
}

class _ShoppingBagState extends State<ShoppingBag> {
 List bagItemList = new List(0);
  String totalPrice;
  ShoppingBagService _shoppingBagService = new ShoppingBagService();

  String route;
 _ShoppingBagState() {
    listBagItems();
  }

  String setTotalPrice(List items){
    int totalPrice = 0;
    items.forEach((item){
      totalPrice = totalPrice + (item['price'] * item['quantity']);
    });
    print(totalPrice);
    return totalPrice.toString();
  }

void listBagItems() async {
    List bagList = await _shoppingBagService.list();
    setState(() {
      bagItemList = bagList;
    });
    totalPrice = setTotalPrice(bagItemList);
  }

  @override
   Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        backgroundColor: Colors.green,
      ),
        backgroundColor: Colors.grey[200],

        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 3.0, 20.0, 0.0),
            child: Container(
              height: 100.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          Text(
                              '\Rs. $totalPrice.00',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600
                            ),
                          )
                        ],
                      ),
                    ),
                    ButtonTheme(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7.0))
                      ),
                      minWidth: MediaQuery.of(context).size.width,
                      height: 50.0,
                      child: RaisedButton(
                        color: Colors.green,
                        onPressed: (){
                          if(bagItemList.length != 0){
                            Map<String,dynamic> args = new Map<String, dynamic>();
                            args['price'] = totalPrice.toString();
                            
                          }
                        },
                        child: Text(
                          'Check Out',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    )
                  ],
              ),
            ),
          ),
        ),
        body: 
          ListView.builder(
      itemCount: bagItemList.length,
      itemBuilder: (BuildContext context, int index) {
        return FeaturedItemCard(item: bagItemList[index]);
      },  
    ),
        
    );
  }
}
// ignore: camel_case_types
// ignore: must_be_immutable
class FeaturedItemCard extends StatelessWidget {
  var item;
  FeaturedItemCard({this.item});

  

  @override
  Widget build(BuildContext context) {
    return Card(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: Image.network(
                              item['image'],
                            ),
                            title: Text((item['product_name']
                                .toString()
                                .toUpperCase())),
                            subtitle: Text("Quantity           :  " +
                                (item['quantity'])
                                    .toStringAsFixed(0) + "\n"
                                    "Price                 :  " +
                                (item['price'] * item['quantity'])
                                    .toStringAsFixed(0)) 
                          ),
                        ],
                      ),
                    );
  }
}
