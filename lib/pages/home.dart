import 'package:flutter/material.dart';
import '../fragments/fragment1.dart';
import '../fragments/fragment2.dart';
import '../fragments/fragment3.dart';
import '../fragments/fragment4.dart';
import '../fragments/fragment5.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
class SigninData{
  final String uid;
  SigninData(this.uid);
}



class DrawerItems{
  String title;
  IconData icon;
  DrawerItems(this.title, this.icon);
}

class Home extends StatefulWidget {
  final SigninData signinData;
  Home({@required this.signinData});
  final drawerItems = [
    DrawerItems("Home", Icons.home),
    DrawerItems("My Bookings", Icons.library_books),
    DrawerItems("Help", Icons.live_help),
    DrawerItems("Profile", Icons.person),
    DrawerItems("About QualityDude", Icons.info),
  ];
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectDrawer = 0;
  _getDrawerItem(int pos){
    switch (pos) {
      case 0:
        return firstFragment(getUIDdetailsinFrag1(widget.signinData.uid));
      break;
      case 1:
        return secondFragment();
      break;
      case 2:
        return thirdFragment();
      break;
      case 3:
        return fourthFragment();
      break;
      case 4:
        return fifthFragment();
      break;
      default:
        return Text("Error");
    }
  }
  _onSelectItem(int index){
    setState(() {
      _selectDrawer =index;
    });
    Navigator.of(context).pop();
  }

  List<ProfileData> Profileinfo = []; 

  
  
   



  @override
  void initState() {
    DatabaseReference ref =FirebaseDatabase.instance.reference();
    ref.child('1/users/'+widget.signinData.uid).once().then((DataSnapshot snap){
      var profileName =snap.value;
      Profileinfo.clear();
      setState(() {
       Profileinfo.add(ProfileData(profileName['name'], profileName['email'])); 
      });
      print(Profileinfo[0].profileName);
    });
    super.initState();
  }
 
  void test(){
    DatabaseReference ref =FirebaseDatabase.instance.reference();
    ref.child('1/users/'+widget.signinData.uid).once().then((DataSnapshot snap){
      var profileName =snap.value;
      Profileinfo.clear();
      setState(() {
       Profileinfo.add(ProfileData(profileName['name'], profileName['email'])); 
      });
      print(Profileinfo[0].profileName);
    });
  }
  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for(var i = 0; i<widget.drawerItems.length; i++){
      var d = widget.drawerItems[i];
      drawerOptions.add(
        ListTile(
          leading: Icon(d.icon),
          title: Text(d.title),
          selected: i ==_selectDrawer,
          onTap: ()=> _onSelectItem(i),
        )
      );
    }
    

    
    
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.drawerItems[_selectDrawer].title),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('./images/starter1.jpg',),fit: BoxFit.cover),
              ),
              currentAccountPicture: CircleAvatar(
                foregroundColor: Colors.amber,
                backgroundColor: Colors.black,
                backgroundImage: AssetImage('./images/starter1.jpg'),
              ),
              accountName: Profileinfo.length == 0 ? Text("Loading...") : Text(Profileinfo[0].profileName),
              accountEmail: RaisedButton(
                onPressed: (){
                  test();
                },
                child: Profileinfo.length == 0 ? Text("Loading...") : Text(Profileinfo[0].profileEmail),
              ),
            ),
            Column(
              children:drawerOptions
            )
          ],
        ),
      ),
      body: _getDrawerItem(_selectDrawer),
    );
  }
}

class ProfileData{
  String profileName, profileEmail;
  ProfileData(this.profileName, this.profileEmail);
}