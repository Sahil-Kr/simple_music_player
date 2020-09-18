import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yourstory_assignment/common/CommonFields.dart';

class NavigationBloc extends Cubit<int>{
  NavigationBloc(int state) : super(0);

  List<int> screenOpenStack = new List<int>();
  int currentSelectedScreen = 0;

  //method to handle navigation bar tap events
  void onNavigationBarTab(int index){

    // if(screenOpenStack.contains(index)){
    //   screenOpenStack.remove(index);
    // }
    if(screenOpenStack.length == 0)
      screenOpenStack.add(currentSelectedScreen);
    screenOpenStack.add(index);
    currentSelectedScreen = index;

    emit(currentSelectedScreen);
  }

  //method to handle back button pressed events
  void onBackPressed(context) {
    if(screenOpenStack.length >0 && (screenOpenStack.last == currentSelectedScreen))
      screenOpenStack.removeLast();

    if(screenOpenStack.length == 0 ){
      print("size zero");
      showDialogMsg(context, 'Are you sure, you want to exit the app ?', true) ;
    }
    else{
      print(screenOpenStack.last);
      currentSelectedScreen = screenOpenStack.last;
      screenOpenStack.removeLast();
      emit(currentSelectedScreen);
      // return false;
    }
  }

}