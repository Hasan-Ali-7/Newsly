import 'package:flutter/material.dart';
import 'package:newsly/controller/tech_cubit/techCubit.dart';
import 'package:newsly/views/widgets/c_article.dart';
import '../controller/app_cubit/app_cubit.dart';

class Tech extends StatelessWidget {
  const Tech({ super.key });

  @override
  Widget build(BuildContext context){
    
    TechNewsCubit cubit = TechNewsCubit.get(context);
    // cubit.fetchTechArticles(null);

    return Container(
      color: Colors.amber,
      width: double.infinity,
      child: SingleChildScrollView(
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(10),
          itemCount: 10,
          itemBuilder: (context, index) => CArticle( 
            article: cubit.techArticles![index], 
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 10,),
        ),
      ),
    );
  }
}