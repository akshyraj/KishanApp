import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:kishanapp/model/crops.dart';

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
  Widget getCrops(Crops crops) {
    return SingleChildScrollView(
        child: Column(children: <Widget>[
      Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: NetworkImage(crops.imageUrl), fit: BoxFit.fill),
          )),
      Text(crops.Crops_name),
    ]));
  }
}
