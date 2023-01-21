import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_counter_app/logic/cubit/counter_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Counter Value:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
                context.select((CounterCubit cubit) =>
                    cubit.state.counterValue.toString()),
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 10,
            ),
            BlocListener<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(milliseconds: 300),
                      backgroundColor: Colors.green.shade200,
                      content: const Text('Incremented'),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(milliseconds: 300),
                      backgroundColor: Colors.red.shade200,
                      content: const Text('Decremented'),
                    ),
                  );
                }
              },
              child: Container(),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().increment();
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().decrement();
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
