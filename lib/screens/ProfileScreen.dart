import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yourstory_assignment/common/CommonFields.dart';
import 'package:yourstory_assignment/values/Constants.dart';


class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _appBar(),
      body: _bodyContainer(),
    );
  }

  //method for appBar UI
  Widget _appBar(){
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      title: TextView(
          title:PROFILE,
          fontColor: Colors.white,
          fontSize: 20
      ),
      actions: [
        TextView(
            title: SIGNOUT,
            fontColor:  Color.fromRGBO(218, 0, 0, 1),
            fontSize: 15,
            margin: EdgeInsets.symmetric(vertical: 18, horizontal: 12)
        )
      ],
    );
  }

  //method for body container UI
  Widget _bodyContainer(){
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), topLeft: Radius.circular(25))),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              child: Icon(
                Icons.account_circle,
                size: 130,
                color: Color.fromRGBO(218, 0, 0, 0.9),
              )),
          TextView(
            title: NAME,
            fontSize: 20,
            fontColor: Colors.white,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
          TextView(
              title: EMAIL,
              fontSize: 13,
              fontColor: Colors.white,
              textAlign: TextAlign.center,
              margin: EdgeInsets.only(top: 6)),
          Container(
            height: 2,
            width: double.infinity,
            color: Color.fromRGBO(218, 0, 0, 0.7),
            margin: EdgeInsets.only(left: 0 ,top: 16, bottom: 12),
          ),

          TextView(
              title: SAVED_STORIES,
              fontSize: 17,
              fontColor: Colors.white,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.left
          ),
          SizedBox(
            height: 8,
          ),
          whatsHappeningCard(Colors.blue.withOpacity(0.3), context),
          whatsHappeningCard(Colors.yellow.withOpacity(0.3), context),
          whatsHappeningCard(Colors.cyan.withOpacity(0.3), context),
        ],
      ),
    );
  }
}
