import 'package:flutter/material.dart';
import 'package:kishanapp/model/productcat.dart';
import 'datascreen.dart';

class ProductCategory extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ProductCategoryState();
  }
}
 
class _ProductCategoryState extends State<ProductCategory> {

  final List<Category> category = CategoryList.getCategory();
  @override
  Widget build(BuildContext context) {
      return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 8.0 / 9.0,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        padding: EdgeInsets.all(10.0),
        shrinkWrap: true, 
        children: List.generate(4, (index)  {
          return Card(
            child : InkWell(
              onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) {
		          return GridItemList();
	          }))},
              child: Column(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 1.2,
                    child: Image.asset(category[index].imageUrl,height: 50, width: 50,),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(category[index].cat_name),
                      ],
                    ),
                  ),
                ],
              )
            )
          );
        }
      ),
    );
  }
}