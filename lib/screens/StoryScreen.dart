import 'package:flutter/material.dart';
import 'package:yourstory_assignment/common/CommonFields.dart';
import 'package:yourstory_assignment/values/Constants.dart';


class StoryScreen extends StatefulWidget {
  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Stories',
          style: TextStyle(color:Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(25), topLeft: Radius.circular(25))),
        child: _dummyStories(),
      ),
    );
  }

  //method for creating dummy story card
  Widget _dummyStories() {
    return Container(
      //margin: EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          TextView(
              title: TRENDING_STORIES,
              fontColor: Colors.white,
              fontSize: 17,
              margin:EdgeInsets.only(left: 16, bottom: 12, top: 16)),
          _trendingStories(),
          Container(
            height: 2,
            width: double.infinity,
            color: Color.fromRGBO(218, 0, 0, 0.7),
            margin: EdgeInsets.only(left: 0 ,top: 16, bottom: 12),
          ),
          TextView(
              title: WHATS_HAPPENING,
              fontColor: Colors.white,
              fontSize: 17,
              margin: EdgeInsets.only(left: 16,)),
          _whatsHappening(),
          Container(
            height: 2,
            width: double.infinity,
            color: Color.fromRGBO(218, 0, 0, 0.7),
            margin: EdgeInsets.only(left: 0 ,top: 16, bottom: 12),
          ),
          TextView(
              title: LOAD_MORE,
              fontColor: Color.fromRGBO(218, 0, 0, 1),
              textAlign: TextAlign.center,
              fontSize: 17,
              margin: EdgeInsets.only(bottom: 16)),
        ],
      ),
    );
  }

  //method for trending story cards UI
  Widget _trendingStories(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        children: [
          SizedBox(
            width: 12,
          ),
          trendingStoryCard(Colors.white.withOpacity(0)),
          SizedBox(
            width: 12,
          ),
          trendingStoryCard(Colors.blue.withOpacity(0.3)),
          SizedBox(
            width: 12,
          ),
          trendingStoryCard(Colors.red.withOpacity(0.3)),
          SizedBox(
            width: 12,
          ),
          trendingStoryCard(Colors.green.withOpacity(0.3)),
          SizedBox(
            width: 12,
          ),
          trendingStoryCard(Colors.yellow.withOpacity(0.3)),
          SizedBox(
            width: 12,
          ),
        ],
      ),
    );
  }

  //method for whats happening cards UI
  Widget _whatsHappening(){
    return Column(
      children: [
        SizedBox(
          height: 12,
        ),
        whatsHappeningCard(Colors.blue.withOpacity(0.3), context),
        whatsHappeningCard(Colors.brown.withOpacity(0.3), context),
        whatsHappeningCard(Colors.cyan.withOpacity(0.3), context),
        whatsHappeningCard(Colors.pink.withOpacity(0.3), context),
        whatsHappeningCard(Colors.brown.withOpacity(0), context),
      ],
    );
  }





}
