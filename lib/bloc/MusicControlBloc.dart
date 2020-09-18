import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yourstory_assignment/model/MusicDetailModel.dart';
import 'package:yourstory_assignment/model/MusicEventModel.dart';

class MusicControlBloc extends Cubit<MusicDetailModel> {
  MusicControlBloc(MusicDetailModel initialState) : super(initialState);

  bool playing = false;
  bool songActive = false;
  bool errorOccured = false;
  AudioPlayer _audioPlayer = new AudioPlayer();
  MusicDetailModel _currentMusic = new MusicDetailModel();
  Duration _duration = new Duration();
  Duration _position = new Duration();
  MusicDetailModel audioDetails;

  //method to handle music play pause events
  void playAudio(MusicEventModel event) async {
    //check for identifying events on current song or new song
    if ( playing || songActive ) {
      print('${_currentMusic.id} ------ ${event.audioDetailModel.id}');
      if(_currentMusic.id != event.audioDetailModel.id){
        _audioPlayer.stop();
        audioDetails = updateMusicModel(_currentMusic, false, false, songActive);
        emit(audioDetails);
      }

    }
    var url = event.audioDetailModel.url;
    if (event.audioEvent == MusicEvent.PAUSE) {
      MusicDetailModel audioDetails =
          updateMusicModel(event.audioDetailModel, false, false, songActive);
      var res = await _audioPlayer.pause();
      if (res == 1) {
        playing = false;
        songActive = true;
        _currentMusic = audioDetails;
        emit(audioDetails);
      }

    } else {
      audioDetails = updateMusicModel(event.audioDetailModel, true, false, songActive);
      var res = await _audioPlayer.play(url, isLocal: true);
      if (res == 1) {
        playing = true;
        songActive = true;
        _currentMusic = audioDetails;
        emit(audioDetails);
      }
    }
    //listener for music duration update
    _audioPlayer.onDurationChanged.listen((duration) {
      _duration = duration;
      emit(updateMusicModel(audioDetails, playing, false, songActive));
    });

    //listener for music current position update
    _audioPlayer.onAudioPositionChanged.listen((position) {
      _position = position;
      emit(updateMusicModel(audioDetails, playing, false, songActive));
    });

    //listener for music completion event
    _audioPlayer.onPlayerCompletion.listen((completionEvent) {
      playing = false;
      songActive = false;
      MusicDetailModel audioDetails =
          updateMusicModel(event.audioDetailModel, playing, false, songActive);
      emit(audioDetails);
    });
  }

  //method to seek music to a particular position
  void seekMusic(Duration position) {
    _audioPlayer.seek(position);
    //emit(audioDetails);
  }

  //method to update music model with new data
  MusicDetailModel updateMusicModel(MusicDetailModel model, play, stop, active) {
    MusicDetailModel audioDetails = new MusicDetailModel();
    audioDetails.title = model.title;
    audioDetails.id = model.id;
    audioDetails.subtitle = model.subtitle;
    audioDetails.url = model.url;
    audioDetails.position = _position;
    audioDetails.duration = _duration;
    audioDetails.playing = play;
    audioDetails.active = active;
    audioDetails.stop = stop;
    return audioDetails;
  }

  //method to get currently playing music details
  void playingMusicDetails() {
    if (playing) {
      emit(_currentMusic);
    } else
      emit(null);
  }

  //method to stop music player
  void stopPlayer() {
    _audioPlayer.stop();
    playing = false;
    songActive = false;
    _duration = new Duration();
    _position = new Duration();
    emit(updateMusicModel(audioDetails, playing, true, songActive));
  }

  Future<bool> checkInternet() async{
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        return true;
      }
      else
        return false;
    } on SocketException catch (_) {
      print('not connected');
      return false;

    }
  }

  void disposePlayer(){
    _audioPlayer.dispose();
  }

}
