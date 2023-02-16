import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/features/home/bloc/cubit/counter_cubit.dart';

class MyHomePage extends StatefulWidget 
{
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> 
{

  @override
  Widget build(BuildContext context) 
  {
    return SafeArea
    (
      child: Scaffold
      (
        appBar: AppBar
        (
          centerTitle: true,
          title: Text(widget.title),
        ),
        body: Center
        (
          child: Column
          (
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>
            [
              const Text
              (
                'You have pushed the button this many times:',
              ),
              BlocConsumer<CounterCubit, CounterState>
              (
                listener: (context,state)
                {
                  if(state.wasIncremented==true)
                  {
                    ScaffoldMessenger.of(context).showSnackBar
                    (
                      SnackBar(content: Text(state.counterValue.toString()))
                    );
                  }
                  else
                  {
                    ScaffoldMessenger.of(context).showSnackBar
                    (
                      SnackBar(content: Text(state.counterValue.toString()))
                    );
                  }
                },
                builder: (context, state) 
                {
                  return Text
                  (
                    state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Row
        (
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: 
          [
            Flexible
            (
              child: FloatingActionButton.extended
              (
                onPressed: () 
                {
                  BlocProvider.of<CounterCubit>(context).increment();
                  // context.bloc<CounterCubit>().increment;
                },
                label: const Text('Increment'),
                icon: const Icon(Icons.add),
              ),
            ),
            Flexible
            (
              child: FloatingActionButton.extended
              (
                onPressed: () 
                {
                  BlocProvider.of<CounterCubit>(context).decrement();
                },
                label: const Text('Decrement'),
                icon: const Icon(Icons.remove),
              ),
            ),
          ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
