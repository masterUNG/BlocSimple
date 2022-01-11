// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';

void main() {
  final counterBloc = CounterBloc(0);
  counterBloc.stream.listen((CounterState counterState) {
    print(counterState);
  });

  counterBloc.add(CounterEvent.increment);
  counterBloc.add(CounterEvent.increment);
  counterBloc.add(CounterEvent.increment);
  counterBloc.add(CounterEvent.increment);
  counterBloc.add(CounterEvent.decrement);
  counterBloc.add(CounterEvent.decrement);
  counterBloc.close();
}

enum CounterEvent { increment, decrement }

class CounterState {
  final int value;
  CounterState({
    required this.value,
  });

  @override
  String toString() => value.toString();
}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(int initialState) : super(CounterState(value: 0));

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield CounterState(value: state.value + 1);
        break;
      case CounterEvent.decrement:
        yield CounterState(value: state.value - 1);
        break;
      default:
    }
  }
}
