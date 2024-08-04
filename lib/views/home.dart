import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:newsly/views/widgets/c_text_form_field.dart';
import '../controller/app_cubit/app_cubit.dart';


class Home extends StatelessWidget {
	const Home({ Key? key }) : super(key: key);

	@override
	Widget build(BuildContext context){

		AppCubit cubit = AppCubit.get(context);
    cubit.fetchAllArticles(null);
		
		return SafeArea(
				child: Scaffold(

					// bottomNavigationBar: BottomNavigationBar(
					// 	items: cubit.NavBarItems,
					// 	currentIndex: cubit.currentIndex,
					// 	onTap: (index) => cubit.changeNavBar(index),
					// ),
					
          // body:  cubit.Screens[cubit.currentIndex],
          appBar: AppBar(
            title: cTextFormField(
              context, 
              hint: "Search", 
              controller: TextEditingController(), 
              keybord: TextInputType.text, 
              prefex:  const Icon(Icons.search),
              myvalidator: (val){}, 
              onChanged: (val){}, 
              onSaved: (val){}, 
              onFieldSubmitted: (val){},
            ),
            actions: [

              CircleAvatar(
                backgroundColor: Colors.amber,
                child: IconButton(
                  icon: Icon(Icons.brightness_3_rounded), 
                  onPressed: ()=> cubit.changeAppMode(),
                ),
              ),
              
              const SizedBox(width: 8,),

              CircleAvatar(
                backgroundColor: Colors.amber,
                child: IconButton(
                  icon: Icon(Icons.settings), 
                  onPressed:  ()=> cubit.changeAppMode(),
                ),
              ),
              
              const SizedBox(width: 8,),
            ],
          ),

          body: Container(
            color: Colors.amber,
            width: double.infinity,

            child: SingleChildScrollView(
              child: Column(
                children: [

                  const SizedBox(height: 10,),
                  
                  Container(
                    height: 250,
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,

                      child: Swiper(
                        itemCount: 5,
                        itemBuilder: (context, index) =>  Image.asset("assets/images/d.jpg", width:( MediaQuery.sizeOf(context).width - 20), fit: BoxFit.cover, ),              
                        autoplay: true,
                        axisDirection: AxisDirection.right,
                        indicatorLayout: PageIndicatorLayout.COLOR,
                        pagination: const SwiperPagination( 
                          alignment: Alignment.bottomCenter,
                          builder: DotSwiperPaginationBuilder(activeColor: Colors.amber, space: 5 ,)
                        ),
                        

                      ),
                    // child: ListView.builder(
                    //   itemCount: 5,
                    //   scrollDirection: Axis.horizontal,
                      // itemBuilder: (context, index) => Row(
                      //   children: [
                      //     Image.asset("lib/assets/images/d.jpg", width:( MediaQuery.sizeOf(context).width - 20), fit: BoxFit.cover, ),              
                      //     const SizedBox(width: 10,),
                      //   ],
                      // )
                    // ),

                  ),
                  

                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(10),
                    itemCount: 10,
                    itemBuilder: (context, index) => Column(
                      children: [
                        Image.asset("assets/images/d.jpg", height: 250, width:( MediaQuery.sizeOf(context).width - 20), fit: BoxFit.cover,)   ,             
                        const SizedBox(height: 10,),
                      ],
                    )
                  ),

                ],
              ),
            ),
          ),

				),
			);
	}
}