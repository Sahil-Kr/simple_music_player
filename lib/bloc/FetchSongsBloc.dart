import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:yourstory_assignment/model/MusicDetailModel.dart';
import 'package:yourstory_assignment/values/Constants.dart';

class FetchSongsBloc extends Cubit<List<MusicDetailModel>>{
  FetchSongsBloc(List<MusicDetailModel> state) : super(state);
  List<MusicDetailModel> musicList = [];
  var uuid = Uuid();

  //method to generate list of music
  void generateSongList(){
    for(int i=0; i< 25; i++){
      MusicDetailModel model = new MusicDetailModel();
      model.id = uuid.v1();
      String title = urls[i].split('/').last.split('.').first.replaceAll('mixkit', '').replaceAll('-', ' ');
      String titleNum = title.split(' ').last;
      model.title = title.replaceAll(titleNum, '');
      model.url = urls[i];
      musicList.add(model);
    }
    emit(musicList);
  }


}