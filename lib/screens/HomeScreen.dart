import 'package:flutter/material.dart';
import 'package:yourstory_assignment/common/CommonFields.dart';
import 'package:yourstory_assignment/values/Constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          HOME,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(25), topLeft: Radius.circular(25))),
        child: _storyFeed(),
      ),
    );
  }

  Widget _storyFeed() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
            title: FEED,
            fontColor: Color.fromRGBO(218, 0, 0, 0.7),
            fontSize: 17,
            margin: EdgeInsets.only(left: 16, bottom: 6, top: 12)),
        _dummyTopCard(),
        Expanded(child: _homeFeedCardList()),
      ],
    );
  }

  //widget to generate top card
  Widget _dummyTopCard() {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Container(
        height: 150,
        foregroundDecoration:
            BoxDecoration(color: Colors.deepOrange.withOpacity(0.2)),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                child: Image.asset(
                  STORY_PLACEHOLDER_PATH,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextView(
                  title:
                      DUMMY_TOP_CARD_TITLE,
                  maxLines: 2,
                  fontColor: Colors.black,
                  margin: EdgeInsets.all(8)),
            )
          ],
        ),
      ),
    );
  }

  //widget to generate list of feed card
  Widget _homeFeedCardList() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return homeFeedCard();
      },
      itemCount: 10,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
    );
  }
}
