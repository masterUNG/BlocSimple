import 'package:bloc/bloc.dart';

void main() {
  final counterCubit = CounterCubit(0);
  print('ค่าเริ่มต้น countterCubit ==> ${counterCubit.state}');

  counterCubit.stream.listen((event) {
    print('event from Stream ==> $event');
  });

  counterCubit.increment();
  print('ค่าที่ได้จากการ increment countterCubit ==> ${counterCubit.state}');

  counterCubit.decrement();
  print('ค่าที่ได้จากการ decrement countterCubit ==> ${counterCubit.state}');

  counterCubit.close();
}  

class CounterCubit extends Cubit<int> {
  CounterCubit(int initialState) : super(initialState);
  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
