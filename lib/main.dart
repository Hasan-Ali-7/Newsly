import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newsly/controller/app_cubit/app_cubit.dart';
import 'package:newsly/views/home.dart';
import 'controller/app_cubit/app_states.dart';
import 'controller/hive/hive.dart';


void main() async 
{
	WidgetsFlutterBinding.ensureInitialized();
	await Hive.initFlutter();
	await Hive.openBox("NewslyBox");
	runApp(const MyApp());
}


class MyApp extends StatelessWidget 
{
	const MyApp({super.key});

	@override
	Widget build(BuildContext context) {
		
		return BlocProvider(
			create: (context) => AppCubit(),
			child: BlocConsumer<AppCubit, AppState>(
				listener: (context, state) {},
				builder: (context, state) {

					return MaterialApp(
					
						debugShowCheckedModeBanner: false,
						title: 'Newsly',
						
						theme: ThemeData(
							brightness: Brightness.light,
							bottomNavigationBarTheme: BottomNavigationBarThemeData(
								type: BottomNavigationBarType.fixed,
								selectedItemColor: Colors.redAccent,
								elevation: 55,
							),
						),

						darkTheme: ThemeData(
							brightness: Brightness.dark,
							bottomNavigationBarTheme: BottomNavigationBarThemeData(
								backgroundColor: Colors.grey[900],
								type: BottomNavigationBarType.fixed,
								selectedItemColor: Colors.redAccent,
								unselectedItemColor: Colors.white,
								elevation: 55,
							),
						),

						themeMode: ( AppCubit().isDark = HiveMethods().get('darkMode') ?? true )
							? ThemeMode.dark
							: ThemeMode.light,
						home: Home(),
					);
				},
		  	),
		);
	}
}