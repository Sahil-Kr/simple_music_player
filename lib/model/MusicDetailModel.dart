// model for defining different music details
class MusicDetailModel {
  String _title = '';
  String _id = '';

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String _url = '';
  String _subtitle = '';
  bool _playing = false;
  bool _active = false;

  bool get active => _active;

  set active(bool value) {
    _active = value;
  }

  Duration _duration = new Duration();
  Duration _position = new Duration();

  Duration get duration => _duration;

  set duration(Duration value) {
    _duration = value;
  }


  bool _stop = true;

  set title(String value) {
    _title = value;
  }

  String get title => _title;

  String get url => _url;

  bool get playing => _playing;

  String get subtitle => _subtitle;


  set url(String value) {
    _url = value;
  }

  set playing(bool value) {
    _playing = value;
  }

  set subtitle(String value) {
    _subtitle = value;
  }

  bool get stop => _stop;

  set stop(bool value) {
    _stop = value;
  }

  Duration get position => _position;

  set position(Duration value) {
    _position = value;
  }
}
