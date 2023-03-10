import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'calculadora_propina_event.dart';
part 'calculadora_propina_state.dart';

class CalculadoraPropinaBloc
    extends Bloc<CalculadoraPropinaEvent, CalculadoraPropinaState> {
  CalculadoraPropinaBloc() : super(const CalculadoraPropinaState()) {
    on<CalculadoraPropinaTotalCuentaCambiado>((event, emit) {
      emit(state.copyWith(totalCuenta: event.totalCuenta));
    });
    // on<CalculadoraPropinaEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
    on<CalculadoraPropinaPersonaAgregada>((event, emit) {
      int personas = state.cantidadPersonas! + 1;
      emit(state.copyWith(cantidadPersonas: personas));
    });
    on<CalculadoraPropinaPersonaQuitada>((event, emit) {
      int personas = state.cantidadPersonas! - 1;
      if (personas > 0) {
        emit(state.copyWith(cantidadPersonas: personas));
      }
    });
  }
}
