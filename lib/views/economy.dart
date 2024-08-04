import 'package:flutter/material.dart';
import 'package:newsly/views/widgets/c_article.dart';
import '../controller/cubit/app_cubit.dart';


class Economy extends StatelessWidget {
const Economy({ super.key });

  @override
  Widget build(BuildContext context) {

    AppCubit cubit = AppCubit.get(context);

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
            article: cubit.economyArticles![index],
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 10,),
        ),
      ),
    );
  }
}