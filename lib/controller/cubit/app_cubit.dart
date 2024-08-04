import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsly/views/mixed.dart';
import 'package:newsly/views/tech.dart';
import '../../views/economy.dart';
import '../../views/science.dart';
import '../../views/sport.dart';
import '../hive/hive.dart';
import 'app_states.dart';



class AppCubit extends Cubit<AppState> {
  AppCubit() : super( AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);



  bool isDark = true;
  
  void changeAppMode() {
      isDark = !isDark;
      emit(ChangeAppModeState());
      HiveMethods().put('darkMode', isDark);
  }

  List<Color> primaryColors = [
      const Color.fromARGB(255, 251, 188, 93),
      const Color.fromARGB(255, 142, 255, 146),
      const Color.fromARGB(255, 72, 222, 255),
      const Color.fromRGBO(83, 169, 255, 1),
      const Color.fromRGBO(255, 111, 243, 1),
  ];
  
  void changeAppColor(index) {
      HiveMethods().put('appColor', primaryColors[index]);
      emit(ChangeAppColorState());
  }

  

  int currentIndex = 0;

  void changeNavBar(index) {
    currentIndex = index;
    emit(BottomNavBarState());
  }
  
  List<BottomNavigationBarItem> NavBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.apps,
        size: 30,
      ),
      label: 'Mixed',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.memory,
        size: 30,
      ),
      label: 'Tech',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.attach_money_outlined,
        size: 30,
      ),
      label: 'Economy',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science_outlined,
        size: 30,
      ),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports_volleyball_outlined,
        size: 30,
      ),
      label: 'Sport',
    ),
  ];

  List<Widget>  Screens = [
    const Mixed(),
    const Tech(),
    const Economy(),
    const Science(),
    const Sport(),
  ];



  String? mixedLocation;
  String? techLocation;
  String? economyLocation;
  String? scienceLocation;
  String? sportLocation;
  
  List<String> allLocations = [
      'eg',
      'ae',
      'sa',
      'us',
      'ru',
      'cn',
      'jp',
      'kr',
      'tw',
      'in',
      'br',
      'ar',
      'ca',
      'gb',
      'fr',
      'de',
      'it',
      'no',
      'ie',
  ];

  List? mixedArticles;
  List? techArticles;
  List? economyArticles;
  List? scienceArticles;
  List? sportArticles;

}