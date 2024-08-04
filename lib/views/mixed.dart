import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:newsly/views/widgets/c_article.dart';
import '../controller/cubit/app_cubit.dart';



class Mixed extends StatelessWidget {
  const Mixed({ super.key });

  @override
  Widget build(BuildContext context){

    AppCubit cubit = AppCubit.get(context);

    return Container(
      color: Colors.amber,
      width: double.infinity,

      child: SingleChildScrollView(
        child: Column(
          children: [
            
            Container(
              height: 375,
              padding: const EdgeInsets.all(10),
              color: Colors.green,
              width: double.infinity,
              child: Swiper(
                itemCount: 5,
                itemBuilder: (context, index) =>  CArticle( 
                  article: cubit.mixedArticles![index], 
                ),
                autoplay: true,
                axisDirection: AxisDirection.right,
                indicatorLayout: PageIndicatorLayout.COLOR,
                pagination: const SwiperPagination( 
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(activeColor: Colors.amber, space: 5 ,)
                ),
              ),
            ),
            


            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(10),
              itemCount: 10,
              itemBuilder: (context, index) => CArticle(
                article: cubit.mixedArticles![index], 
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 10,),
            ),
          ],
        ),
      ),
    );
  }
}