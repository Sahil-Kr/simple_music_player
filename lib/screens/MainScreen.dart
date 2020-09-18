import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yourstory_assignment/bloc/FetchSongsBloc.dart';
import 'package:yourstory_assignment/bloc/MusicControlBloc.dart';
import 'package:yourstory_assignment/bloc/NavigationBloc.dart';
import 'package:yourstory_assignment/common/MusicBottomSheet.dart';
import 'package:yourstory_assignment/model/MusicDetailModel.dart';
import 'package:yourstory_assignment/screens/HomeScreen.dart';
import 'package:yourstory_assignment/screens/MusicScreen.dart';
import 'package:yourstory_assignment/screens/ProfileScreen.dart';
import 'package:yourstory_assignment/screens/StoryScreen.dart';
import 'package:yourstory_assignment/values/Constants.dart';
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  //list used to navigate to different screens
  List<Widget> screenList = [
    HomeScreen(),
    ProfileScreen(),
    StoryScreen(),
    MusicScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: MultiBlocProvider(
          providers: [
            BlocProvider<FetchSongsBloc>(
              create: (BuildContext context) => FetchSongsBloc(<MusicDetailModel>[]),
            ),
            BlocProvider<MusicControlBloc>(
              create: (BuildContext context) => MusicControlBloc(MusicDetailModel()),
            ),
          ],
          child: Stack(children: [
            BlocBuilder<NavigationBloc, int>(
              builder: (context, index){
                return screenList[index];
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: MusicBottomSheet(),
            )
          ], ),
        ),
        bottomNavigationBar:  BlocBuilder<NavigationBloc, int>(
          builder: (context, index){
            return _bottomNavigationBar(index);
          },
        ),
      ),
    );
  }

  //widget for bottom navigation bar
  Widget _bottomNavigationBar(index) {
    final _navigatorBloc = BlocProvider.of<NavigationBloc>(context);
    return BottomNavigationBar(
      elevation: 0,
      iconSize: 20,
      selectedFontSize: 15,
      unselectedFontSize: 12,
      type: BottomNavigationBarType.fixed,
      currentIndex: index,
      showUnselectedLabels: true,
      backgroundColor: Colors.transparent,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: index == 0
                ?  Color.fromRGBO(218, 0, 0, 1)
                : Colors.white,
          ),
          title: Text(
            HOME,
            style: TextStyle(
              color: index == 0
                  ?  Color.fromRGBO(218, 0, 0, 1)
                  : Colors.white,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_circle,
            color: index == 1
                ?  Color.fromRGBO(218, 0, 0, 1)
                : Colors.white,
          ),
          title: Text(
            PROFILE,
            style: TextStyle(
              color: index == 1
                  ?  Color.fromRGBO(218, 0, 0, 1)
                  : Colors.white,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.storage,
            color: index == 2
                ?  Color.fromRGBO(218, 0, 0, 1)
                : Colors.white,
          ),
          title: Text(
            STORY,
            style: TextStyle(
              color: index == 2
                  ? Color.fromRGBO(246, 126, 125, 1)
                  : Colors.white,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.music_note,
            color: index == 3
                ?  Color.fromRGBO(218, 0, 0, 1)
                : Colors.white,
          ),
          title: Text(
            MUSIC,
            style: TextStyle(
              color: index == 3
                  ?  Color.fromRGBO(218, 0, 0, 1)
                  : Colors.white,
            ),
          ),
        ),
      ],
      onTap: (index) {
        _navigatorBloc.onNavigationBarTab(index);
      },
    );
  }

  //method to handle back button press event
  Future<bool> _onBackPressed() async{
    final _navigatorBloc = BlocProvider.of<NavigationBloc>(context);
    _navigatorBloc.onBackPressed(context);

  }

  // @override
  // void dispose(){
  //   super.dispose();
  // }

}
