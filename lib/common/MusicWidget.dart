import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yourstory_assignment/bloc/MusicControlBloc.dart';
import 'package:yourstory_assignment/common/CommonFields.dart';
import 'package:yourstory_assignment/model/MusicDetailModel.dart';
import 'package:yourstory_assignment/model/MusicEventModel.dart';
import 'package:yourstory_assignment/values/Constants.dart';

class MusicWidget extends StatefulWidget {
  MusicDetailModel audioDetailModel;
  MusicWidget(this.audioDetailModel);
  @override
  _MusicWidgetState createState() => _MusicWidgetState();
}

class _MusicWidgetState extends State<MusicWidget> {
  bool playing = false;
  bool isStateChanged = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MusicControlBloc, MusicDetailModel>(
        builder:(context, data){
          if(data!=null && widget.audioDetailModel.id == data.id){
            isStateChanged = true; //used to check if song is playing or not
          }
          else{
            //update the state if this song is not playing
            widget.audioDetailModel.playing = false;
            widget.audioDetailModel.stop = true;
            isStateChanged = false;
          }
          return _songCard(isStateChanged?data:widget.audioDetailModel);
        }
    );
  }

  //method for creating song card UI
  Widget _songCard(MusicDetailModel audioDetailModel){
    final _musicBloc = BlocProvider.of<MusicControlBloc>(context);
    return Container(
        padding: EdgeInsets.all(4),
        child: new ListTile(
            leading: new CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Image.asset(MUSIC_PLACEHOLDER_PATH),
            ),
            title:  Row(
              children: [
                new Text(
                  audioDetailModel.title,
                  style: TextStyle(color: (audioDetailModel.playing || audioDetailModel.active)?Color.fromRGBO(218, 0, 0, 0.7):Colors.white),
                  maxLines: 1,
                ),
                Expanded(
                  child: Container(),
                ),
                SizedBox(
                  width: 12,
                ),
                GestureDetector(
                    onTap: () async{
                      bool isInternet = await _musicBloc.checkInternet();
                      if(isInternet){
                        MusicEventModel event = new MusicEventModel();
                        event.audioDetailModel = audioDetailModel;
                        event.audioEvent = (audioDetailModel.playing)? MusicEvent.PAUSE: MusicEvent.PLAY;
                        _musicBloc.playAudio(event);
                      }
                      else{
                        print('check internet');
                        showDialogMsg(context, NO_INTERNET_MSG, false);
                      }
                    },
                    child: Icon(
                      audioDetailModel.playing? Icons.pause : Icons.play_arrow,
                      color: Colors.white,
                    )),
                SizedBox(
                  width: 12,
                ),
                GestureDetector(
                  onTap: (){
                    if(audioDetailModel.playing)
                    _musicBloc.stopPlayer();
                  },
                  child: Icon(
                    Icons.stop,
                    color: audioDetailModel.playing?Colors.white:Colors.white38,
                  ),
                ),
              ],
            )
        ));
  }

}
