import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/features/second-screen/screen/second_screen.dart';
import 'package:flutter_bloc_concepts/features/third_screen/screens/third_screen.dart';
import 'package:flutter_bloc_concepts/logic/counter_cubit/counter_cubit.dart';
import 'package:flutter_bloc_concepts/features/home/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget 
{
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) 
  {
    return BlocProvider<CounterCubit>
    (
      create: (context) => CounterCubit(),
      child: MaterialApp
      (
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData
        (
            useMaterial3: true,
            primarySwatch: Colors.deepPurple,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        // home: const HomeScreen
        // (
        //   title: 'Flutter Demo Home Page',
        //   color: Colors.purpleAccent,
        // ),
        routes: 
        {
          HomeScreen.routeName: (context) => const HomeScreen(title: 'Home Screen', color: Colors.purple),
          SecondScreen.routeName: (context) => const SecondScreen(
              title: 'Second Screen', color: Colors.deepPurpleAccent),
          ThirdScreen.routeName: (context) => const ThirdScreen(
              title: 'ThirdScreen', color: Colors.deepOrangeAccent)
        },
      ),
    );
  }
}
