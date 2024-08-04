import 'package:flutter/material.dart';
import 'package:newsly/views/widgets/c_text_form_field.dart';
import '../controller/app_cubit/app_cubit.dart';
import '../model/api_service.dart';
import 'widgets/allLocationDialog.dart';


class Home extends StatelessWidget {
	const Home({ Key? key }) : super(key: key);

	@override
	Widget build(BuildContext context){

		AppCubit cubit = AppCubit.get(context);

    fetchAllArticles(String? allLocation) async {
      cubit.allArticles = await NewsApi().fetchArticles(
        country: allLocation ?? 'us',
        category: 'general',
      );
    }



		
		return SafeArea(
			child: Scaffold(

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
                icon: Icon(  cubit.isDark ? Icons.brightness_6 : Icons.brightness_3_rounded, ),
                onPressed: ()=> cubit.changeAppMode(),
              ),
            ),
            
            const SizedBox(width: 8,),

            CircleAvatar(
              backgroundColor: Colors.amber,
              child: IconButton(
                icon: Icon(Icons.language), 
                onPressed: () => allLocationDialog(context),
              ),
            ),
            
            const SizedBox(width: 8,),
          ],
        ),

         bottomNavigationBar: BottomNavigationBar(
        	items: cubit.NavBarItems,
        	currentIndex: cubit.currentIndex,
        	onTap: (index) => cubit.changeNavBar(index),
        ),
        
        body:  cubit.Screens[cubit.currentIndex],

			),
    );
	}
}