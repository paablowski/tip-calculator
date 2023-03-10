part of 'calculadora_propina_bloc.dart';

abstract class CalculadoraPropinaEvent extends Equatable {
  const CalculadoraPropinaEvent();

  @override
  List<Object> get props => [];
}

class CalculadoraPropinaTotalCuentaCambiado extends CalculadoraPropinaEvent {
  final int totalCuenta;
  const CalculadoraPropinaTotalCuentaCambiado(this.totalCuenta);
}

class CalculadoraPropinaPersonaAgregada extends CalculadoraPropinaEvent {
  const CalculadoraPropinaPersonaAgregada();
}

class CalculadoraPropinaPersonaQuitada extends CalculadoraPropinaEvent {
  const CalculadoraPropinaPersonaQuitada();
}
