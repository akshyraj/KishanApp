import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kishanapp/services/auth.dart';

class ProductService {
  // ignore: unused_field
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference _productReference =
      FirebaseFirestore.instance.collection('Products');
  CollectionReference _post = FirebaseFirestore.instance.collection('Posts').doc().collection('usersPosts');
  // ignore: unused_field
  Authservice _userService = new Authservice();

  Future<List> featuredItems() async {
    List<Map<String, String>> itemList = new List();
    QuerySnapshot itemsRef = await _productReference.get();
    for (DocumentSnapshot docRef in itemsRef.docs) {
      Map<String, String> items = new Map();
      items['product_id'] = docRef.data()['product_id'].toString();
      items['image'] = docRef.data()['image'];
      items['product_name'] = docRef.data()['product_name'];
      items['price'] = docRef.data()['price'].toString();
      items['desc'] = docRef.data()['desc'];
      items['category'] = docRef.data()['category'];
      items['usage'] = docRef.data()['usage'];
      items['weight'] = docRef.data()['weight'];
      itemList.add(items);
    }
    return itemList;
  }

  Future<Map> particularItem(String productId) async {
    DocumentSnapshot prodRef = await _productReference.doc(productId).get();
    Map<String, dynamic> itemDetail = new Map();
    itemDetail['product_id'] = prodRef.data()['product_id'].toString();
    itemDetail['image'] = prodRef.data()['image'];
    itemDetail['product_name'] = prodRef.data()['product_name'];
    itemDetail['price'] = prodRef.data()['price'].toString();
    itemDetail['desc'] = prodRef.data()['desc'];
    itemDetail['category'] = prodRef.data()['category'];
    itemDetail['usage'] = prodRef.data()['usage'];
    itemDetail['weight'] = prodRef.data()['weight'];
    return itemDetail;
  }
}
