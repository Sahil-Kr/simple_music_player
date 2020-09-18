import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yourstory_assignment/bloc/MusicControlBloc.dart';
import 'package:yourstory_assignment/model/MusicDetailModel.dart';
import 'package:yourstory_assignment/values/Constants.dart';

//custom text widget
Widget TextView(
    {EdgeInsetsGeometry margin = const EdgeInsets.all(0),
    EdgeInsetsGeometry padding = const EdgeInsets.all(0),
    String title = '',
    double fontSize = 13,
    int maxLines = 100,
    Color fontColor = Colors.black54,
    FontStyle fontStyle = FontStyle.normal,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign textAlign = TextAlign.left,
    Color containerBg = Colors.transparent,
    double width = null}) {
  return Container(
    margin: margin,
    width: width,
    color: containerBg,
    child: Padding(
      padding: padding,
      child: title != null && title.isNotEmpty
          ? Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: maxLines,
              style: TextStyle(
                fontSize: fontSize,
                fontFamily: 'VarelaRound',
                color: fontColor,
                fontStyle: fontStyle,
                fontWeight: fontWeight,
              ),
              textAlign: textAlign,
            )
          : Container(),
    ),
  );
}

//common widget for creating trending story card UI
Widget trendingStoryCard(Color foregroundColor) {
  return Container(
    foregroundDecoration: BoxDecoration(color: foregroundColor,  borderRadius: BorderRadius.all(Radius.circular(5))),
    child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        child: Image.asset(
          STORY_PLACEHOLDER_PATH,
          height: 200,
          width: 150,
          fit: BoxFit.fitHeight,
        )),
  );
}

//common widget for creating whats happening card UI
Widget whatsHappeningCard(Color foregroundColor, context) {
  return Container(
    foregroundDecoration: BoxDecoration(
      color: foregroundColor,
      borderRadius: BorderRadius.all(Radius.circular(5))

    ),
    margin: EdgeInsets.only(left: 12, right: 12, bottom: 12),
    child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        child: Image.asset(
          STORY_PLACEHOLDER_PATH,
          height: 100,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fitWidth,
        )),
  );
}

//common widget for creating home feed card UI
Widget homeFeedCard() {
  return Card(
    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    child: Container(
      height: 80,
      width: double.infinity,
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              child: Image.asset(STORY_PLACEHOLDER_PATH)),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                    title: HOME_FEED_TITLE,
                    fontColor: Colors.black,
                    maxLines: 1,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    margin: EdgeInsets.only(bottom: 8, left: 12, right: 12)),
                TextView(
                    title: HOME_FEED_SUBTITLE,
                    fontColor: Colors.black,
                    maxLines: 2,
                    fontSize: 13,
                    margin: EdgeInsets.only(left: 12,right: 12))
              ],
            ),
          )
        ],
      ),
    ),
  );
}

//common widget for creating dialogBox UI
Future<bool> showDialogMsg(BuildContext context, String msg, bool exitPage) {
  return  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        content: TextView(
          title: msg,
          fontSize: 16,
        ),
        actions: [
          exitPage?FlatButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: TextView(
              title: 'No',
              fontSize: 16,
              fontColor: Colors.blue,
            ),
          ):Container(),
          FlatButton(
            onPressed: (){
            if(exitPage){
              SystemNavigator.pop();
            }else{
              Navigator.of(context).pop();
            }
            },
            child: TextView(
              title: exitPage?'Yes':'OK',
              fontSize: 16,
              fontColor: Color.fromRGBO(218, 0, 0, 0.9),
            ),
          )
        ],
      );
    },
  );
}
