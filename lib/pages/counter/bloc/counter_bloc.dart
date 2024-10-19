import 'package:bloc/bloc.dart';
import 'package:counter_using_bloc/pages/counter/bloc/counter_event.dart';
import 'package:counter_using_bloc/pages/counter/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(count: 0)) {
    on<Increment>(
      (event, emit) => emit(CounterState(count: state.count + 1)),
    );

    on<Decrement>(
      (event, emit) => emit(CounterState(count: state.count - 1)),
    );

    on<ResetCount>(
      (event, emit) => emit(CounterState(count: 0)),
    );
  }
}
