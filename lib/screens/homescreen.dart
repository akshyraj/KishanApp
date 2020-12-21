import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kishanapp/screens/cropscreen.dart';
import 'package:kishanapp/screens/productcategory.dart';
import 'package:kishanapp/screens/schemescreen.dart';
import 'package:kishanapp/screens/settingscreen.dart';
import 'package:kishanapp/screens/weatherscreen.dart';
import 'package:kishanapp/screens/uploadImage.dart';
import 'loginscreen.dart';
import 'newsscreen.dart';
import 'datascreen.dart';
import 'package:easy_localization/easy_localization.dart';


// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  String code = 'en';
  String _selectedGender;
  List<DropdownMenuItem<String>> _dropDownItem() {
      List<String> ddl = ["English", "हिन्दी", "मराठी", "ગુજરાતી", "ਪੰਜਾਬੀ"];
      return ddl.map(
              (value) =>
              DropdownMenuItem(
                value: value,
                child: Text(value),
              )
      ).toList();
    }
  // ignore: unused_field
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kishan App").tr(),
        actions: <Widget>[
          Padding(padding: EdgeInsets.all(20.0)),
          DropdownButton(
              icon: Icon(Icons.language, color: Colors.white,),
              value: _selectedGender,
              items: _dropDownItem(),
              onChanged: (value){
                _selectedGender=value;
                switch(value){
                  case "English" :
                    context.locale = Locale('en','US');
                    print(context.locale);
                    break;
                  case "हिन्दी" :
                    context.locale = Locale('hi','IN');
                    print(context.locale);
                    break;
                  case "मराठी" :
                    context.locale = Locale('mr','IN');
                    print(context.locale);
                    break;
                  case "ગુજરાતી" :
                    context.locale = Locale('gu','IN');
                    print(context.locale);
                    break;
                  case "ਪੰਜਾਬੀ" :
                    context.locale = Locale('pa','IN');
                    print(context.locale);
                    break;
                }
              },
            )
        ],
        backgroundColor: Colors.green,
      ),
      body: BottomNavigator(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            UserAccountsDrawerHeader(
              accountEmail: Text("akshayrajsinh324@gmail.com"),
              accountName: Text("Akshayrajsinh Jadeja"),
              currentAccountPicture: CircleAvatar(
                child: Text("AJ"),
              ),
              decoration: BoxDecoration(
                color: Colors.green,
  ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home").tr(),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text("Crop List").tr(),
             onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) {
		          return CropsPage();
	          }))},
            ),
            ListTile(
              leading: Icon(Icons.add_to_photos),
              title: Text("Govt Schemes").tr(),
              onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) {
		          return SchemesPage();
	          }))},
            ),
            ListTile(
              leading: Icon(Icons.wb_sunny),
              title: Text("Weather").tr(),
              onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) {
		          return WeatherPage();
	          }))},
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("About Us").tr(),
              onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) {
		          return UploadingImageToFirebaseStorage();
	          }))},
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("Log Out"),
              onTap: () async => {
                FirebaseAuth.instance.signOut(),
                 if(FirebaseAuth.instance.currentUser == null) {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }))
                }
	          },
            ),
          ],
        ),
      ),
    );
  }
}
class BottomNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return CupertinoTabScaffold(
  tabBar: CupertinoTabBar(
    backgroundColor: Colors.green,
    items: <BottomNavigationBarItem> [
      BottomNavigationBarItem(
          icon: Icon(Icons.home,color: Colors.white,),
          title: Text('Home',style: TextStyle(color: Colors.white),).tr(),
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.new_releases,color:Colors.white,),
          title: Text('News',style: TextStyle(color: Colors.white),).tr(),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings,color:Colors.white,),
          title: Text('Setting',style: TextStyle(color: Colors.white),).tr(),
        ),
    ],
  ),
  tabBuilder: (BuildContext context, int index) {
    switch (index) {
      case 0:
        return ProductCategory();
        break;
      case 1:
        return NewsPage();
        break;
      case 2:
        return SettingScreen();
        break;
      default:
      return Text('Home');
    }
  },
);
  }
}