import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:kishanapp/model/crops.dart';
import 'package:kishanapp/screens/cropdetailsscreen.dart';

class CropsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CropsPageState();
  }
}

class _CropsPageState extends State<CropsPage> {
  final List<Crops> crops = CropsList.getCrops();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Crops").tr(),
          backgroundColor: Colors.green,
        ),
        body: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 4.0,
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          mainAxisSpacing: 8.0,
          
          children: List.generate(crops.length, (index) {
            return getCrops(crops[index]);
          }),
        ));
  }

  // ignore: missing_return
  Widget getCrops(Crops crop) {
    return SingleChildScrollView(
        child:
         Column(children: <Widget>[
            InkWell(
         onTap: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
		          return CropDetails(crop);
	          })
                      )  },
      child:Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: NetworkImage(crop.imageUrl), fit: BoxFit.fill),
          ))),
      Text(crop.Crops_name),
    ]));
  }
}
