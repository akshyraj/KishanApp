import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kishanapp/screens/profilescreen.dart';
import 'package:kishanapp/screens/settingscreen.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  // ignore: unused_field
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation Drawer"),
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
              title: Text("Home"),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text("Categories"),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.add_to_photos),
              title: Text("Add Items"),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("About Us"),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text("Share with Friends"),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.rate_review),
              title: Text("Rate and Review"),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.flag),
              title: Text("Privacy Policy"),
              onTap: (){},
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
          title: Text('Home',style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person,color:Colors.white,),
          title: Text('Profile',style: TextStyle(color: Colors.white),),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings,color:Colors.white,),
          title: Text('Setting',style: TextStyle(color: Colors.white),),
        ),
    ],
  ),
  tabBuilder: (BuildContext context, int index) {
    switch (index) {
      case 0:
        return Text('Home');
        break;
         case 1:
        return ProfileScreen();
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