import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class getUIDdetailsinFrag1{
  String uid;
  getUIDdetailsinFrag1(this.uid);
}

class firstFragment extends StatefulWidget {
  getUIDdetailsinFrag1 getuiddetailsfrag1;
  firstFragment(this.getuiddetailsfrag1);
  @override
  _firstFragmentState createState() => _firstFragmentState();
}

class _firstFragmentState extends State<firstFragment> {
 
  @override
  
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
        child: Column(
          children: <Widget>[
            Center(
              child: Text(widget.getuiddetailsfrag1.uid),
            )
          ],
        ),
      ),
      ],
    );
  }
}

