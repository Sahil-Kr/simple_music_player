import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yourstory_assignment/bloc/MusicControlBloc.dart';
import 'package:yourstory_assignment/common/CommonFields.dart';
import 'package:yourstory_assignment/model/MusicDetailModel.dart';
import 'package:yourstory_assignment/model/MusicEventModel.dart';

class MusicBottomSheet extends StatefulWidget {
  @override
  _MusicBottomSheetState createState() => _MusicBottomSheetState();
}

class _MusicBottomSheetState extends State<MusicBottomSheet> {
  Duration _duration = new Duration();
  Duration _position = new Duration();

  @override
  Widget build(BuildContext context) {
    final _musicBloc = BlocProvider.of<MusicControlBloc>(context);
    BlocProvider.of<MusicControlBloc>(context).playingMusicDetails();
    return BlocBuilder<MusicControlBloc, MusicDetailModel>(
      builder: (context, data) {
        if (data == null || data.stop) return Container();
        _position = data.position;
        _duration = data.duration;
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color.fromRGBO(128, 19, 54, 0.9),
                Color.fromRGBO(199, 44, 65, 0.9),
                Color.fromRGBO(238, 69, 64, 0.9),
              ]),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))
          ),
          height: 70,
          width: double.infinity,
          child: Row(
            children: [
              SizedBox(
                width: 12,
              ),
              GestureDetector(
                onTap: (){
                  MusicEventModel event = new MusicEventModel();
                  event.audioDetailModel = data;
                  event.audioEvent = (data.playing)? MusicEvent.PAUSE: MusicEvent.PLAY;
                  _musicBloc.playAudio(event);
                },
                  child: Icon(
                data.playing ? Icons.pause : Icons.play_arrow,
                color: Colors.white,
                size: 30,
              )),
              SizedBox(
                width: 12,
              ),
              GestureDetector(
                onTap: (){
                  _musicBloc.stopPlayer();
                },
                child: Icon(
                  Icons.stop,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  children: [
                    slider(context),
                    TextView(
                        title: data.title,
                        fontSize: 15,
                        maxLines: 1,
                        fontColor: Colors.white,
                        margin: EdgeInsets.only(bottom: 4))
                  ],
                ),
              ),
              SizedBox(
                width: 12,
              ),
            ],
          ),
        );
      },
    );
  }

  //method for creating slider UI
  Widget slider(context) {
    final _musicBloc = BlocProvider.of<MusicControlBloc>(context);
    return Slider.adaptive(
        activeColor: Colors.white,
        inactiveColor: Colors.black.withOpacity(0.5),
        min: 0.0,
        value: _position.inSeconds.toDouble(),
        max: _duration.inSeconds.toDouble(),
        onChanged: (value) {
          _musicBloc.seekMusic(new Duration(seconds: value.toInt()));
        });
  }
}
