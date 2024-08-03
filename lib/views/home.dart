import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/app_cubit/app_cubit.dart';
import '../controller/app_cubit/app_states.dart';

class Home extends StatelessWidget {
	const Home({ Key? key }) : super(key: key);

	@override
	Widget build(BuildContext context){

		AppCubit cubit = AppCubit.get(context);
		
		return  BlocProvider(
			create: (context) => AppCubit(),
			child: BlocConsumer<AppCubit, AppState>(
				listener: (context, state) { },
				builder: (context, state) {
					return SafeArea(
							child: Scaffold(
								bottomNavigationBar: BottomNavigationBar(
									items: cubit.NavBarItems,
									currentIndex: cubit.currentIndex,
									onTap: (index) => cubit.changeNavBar(index),
								),
								body:  cubit.Screens[cubit.currentIndex],
							),
						);
				},
			),
		);
	}
}