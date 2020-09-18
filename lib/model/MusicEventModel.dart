import 'package:yourstory_assignment/model/MusicDetailModel.dart';

//enum used to send different music state event
enum MusicEvent{
  PLAY,
  PAUSE,
  STOP,
  SEEK,
  IDLE
}

//Model for Music Events
class MusicEventModel{
  MusicEvent _audioEvent ;
  MusicDetailModel _audioDetailModel;

  set audioEvent(MusicEvent value) {
    _audioEvent = value;
  }

  MusicEvent get audioEvent => _audioEvent;

  MusicDetailModel get audioDetailModel => _audioDetailModel;

  set audioDetailModel(MusicDetailModel value) {
    _audioDetailModel = value;
  }
}