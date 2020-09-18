import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yourstory_assignment/bloc/FetchSongsBloc.dart';
import 'package:yourstory_assignment/common/MusicWidget.dart';
import 'package:yourstory_assignment/model/MusicDetailModel.dart';
import 'package:yourstory_assignment/values/Constants.dart';

class MusicScreen extends StatefulWidget {
  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {

  @override
  Widget build(BuildContext context) {
    final _fetchMusicBloc = BlocProvider.of<FetchSongsBloc>(context);
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Colors.black,
      body: Container(
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25), topLeft: Radius.circular(25))),
          child: Column(
            children: [
              //slider(),
              Expanded(child: _getSongList(_fetchMusicBloc)),
            ],
          )),
    );
  }

  //widget for appBar
  Widget _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.black,
      title: Text(
        MUSIC,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  //widget to generate list of songs
  Widget _getSongList(_fetchMusicBloc) {
    _fetchMusicBloc.generateSongList();
    return BlocBuilder<FetchSongsBloc, List<MusicDetailModel>>(
        builder: (context, data) {
      return ListView.builder(
          itemCount: data.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              children: [
                MusicWidget(data[index]),
                Container(
                  height: 0.5,
                  width: double.infinity,
                  color: Color.fromRGBO(218, 0, 0, 0.5),
                  margin: EdgeInsets.only(left: 16, right: 16, bottom: 8),
                )
              ],
            );
          });
    });
  }

}
