import 'package:bloc/bloc.dart';

part 'tip_calc_state.dart';

class TipCalcCubit extends Cubit<TipCalcState> {
  TipCalcCubit()
      : super(TipCalcState(
            people: 2, billTotal: 0, tipPercentage: 0.1, totalPerPerson: 0));

  calculateTip() {
    int finalTotal =
        ((state.billTotal! * (1 - state.tipPercentage!)) ~/ state.people!);
    emit(state.copyWith(totalPerPerson: finalTotal));
  }

  setBillTotal(String total) {
    if (total.isNotEmpty) {
      int totalBill = int.parse(total);

      emit(state.copyWith(billTotal: totalBill));
    } else {
      emit(state.copyWith(billTotal: 0));
    }

    calculateTip();
  }

  addPeople() {
    if (state.people! < 8) {
      emit(state.copyWith(people: state.people! + 1));
      calculateTip();
    }
  }

  removePeople() {
    if (state.people! > 1) {
      emit(state.copyWith(people: state.people! - 1));
      calculateTip();
    }
  }
}
