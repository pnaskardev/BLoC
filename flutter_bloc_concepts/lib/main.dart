import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/features/home/bloc/cubit/counter_cubit.dart';
import 'package:flutter_bloc_concepts/features/home/screens/home_page.dart';

void main() 
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
          visualDensity: VisualDensity.adaptivePlatformDensity
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
