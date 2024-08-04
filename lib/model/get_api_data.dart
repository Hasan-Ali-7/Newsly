import 'package:newsly/controller/cubit/app_cubit.dart';
import 'api_service.dart';

class GetData 
{

  dynamic context;
  GetData( this.context );


  fetchMixedArticles() async {
    AppCubit.get(context).mixedArticles = await NewsApi().fetchArticles(
      country: AppCubit.get(context).mixedLocation ?? 'us',
      category: 'general',
    );
  }

  fetchTechArticles() async {
    AppCubit.get(context).techArticles = await NewsApi().fetchArticles(
      country: AppCubit.get(context).techLocation ?? 'us',
      category: 'technology',
    );
  }
  
  fetchEconomyArticles() async {
    AppCubit.get(context).economyArticles = await NewsApi().fetchArticles(
      country: AppCubit.get(context).economyLocation ?? 'us',
      category: 'business',
    );
  }
  
  fetchScienceArticles() async {
    AppCubit.get(context).scienceArticles = await NewsApi().fetchArticles(
      country: AppCubit.get(context).scienceLocation ?? 'us',
      category: 'science',
    );
  }
  
  fetchSportArticles() async {
    AppCubit.get(context).sportArticles = await NewsApi().fetchArticles(
      country: AppCubit.get(context).sportLocation ?? 'us',
      category: 'sports',
    );
  }
}