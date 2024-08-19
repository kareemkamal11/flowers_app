

import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  int products = 0;

  addProduct() {
    products++;
    emit(CounterAdded());
  }

  removeProduct() {
    products == 0 ? products = 0 : products--;
    emit(CounterRemoved());
  }
  
}
