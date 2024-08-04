import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/api_service.dart';
import 'economyStates.dart';


class EconomyNewsCubit extends Cubit<EconomyNewsState> {
  EconomyNewsCubit() : super(EconomyNewsInitialState());
  static EconomyNewsCubit get(context) => BlocProvider.of(context);

  String? economyLocation;
  List<String> economyLocations = [
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


  List? economyArticles;
  void fetchEconomyArticles(String? economyLocation) async {
    try {
      emit(ShowAllNewsLoadingState());
      economyArticles = await NewsApi().fetchArticles(
        country: economyLocation ?? 'us',
        category: 'business',
      );
      emit(ShowEconomyNewsSuccess());
    } catch (e) {
      debugPrint('$e');
      emit(ShowEconomyNewsFialed(e.toString()));
    }
  }

}
