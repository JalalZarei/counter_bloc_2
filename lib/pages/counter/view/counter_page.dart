import 'package:counter_using_bloc/pages/counter/bloc/counter_bloc.dart';
import 'package:counter_using_bloc/pages/counter/bloc/counter_event.dart';
import 'package:counter_using_bloc/pages/counter/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) => Column(
        children: [
          _text(),
          Row(
            children: [
              _incrementButton(context: context),
              _decrementButton(context: context),
              _resetButton(context: context),
            ],
          )
        ],
      );

  Widget _text() => BlocBuilder<CounterBloc, CounterState>(
        builder: (BuildContext context, CounterState state) => Text(
          state.count.toString(),
        ),
      );

  Widget _incrementButton({required BuildContext context}) => ElevatedButton(
        onPressed: () => context.read<CounterBloc>().add(Increment()),
        child: const Icon(Icons.add),
      );

  Widget _decrementButton({required BuildContext context}) => ElevatedButton(
        onPressed: () => context.read<CounterBloc>().add(Decrement()),
        child: const Icon(Icons.remove),
      );

  Widget _resetButton({required BuildContext context}) => ElevatedButton(
        onPressed: () => context.read<CounterBloc>().add(ResetCount()),
        child: const Icon(Icons.restore),
      );
}
