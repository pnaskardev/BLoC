import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/logic/counter_cubit/counter_cubit.dart';

class ThirdScreen extends StatelessWidget 
{
  static const routeName='/thirdScreen';

  const ThirdScreen({super.key, required this.title,required this.color});
  final String title;
  final Color color;
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
          title: Text(title),
          backgroundColor: color,
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
              ),
              Row
              (
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: 
                [
                  Flexible
                  (
                    child: ElevatedButton
                    (
                      onPressed: () 
                      {
                        BlocProvider.of<CounterCubit>(context).increment();
                        // context.bloc<CounterCubit>().increment;
                      },
                      child: const Text('Increment'),
                    ),
                  ),
                  Flexible
                  (
                    child: ElevatedButton
                    (
                      onPressed: () 
                      {
                        BlocProvider.of<CounterCubit>(context).decrement();
                      },
                      child: const Text('Decrement'),
                    ),
                  ),
                ],
              ),
              ElevatedButton
              (
                onPressed: ()
                {
                  Navigator.of(context).pop();
                }, 
                child: const Text('Go back')
              )
            ],
          ),
        ),
      ),
    );
  }
}
