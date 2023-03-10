part of 'calculadora_propina_bloc.dart';

class CalculadoraPropinaState extends Equatable {
  final int? totalCuenta;
  final double? porcentajePropina;
  final double? totalPropina;
  final int? cantidadPersonas;
  final double? totalPorPersona;

  const CalculadoraPropinaState({
    this.totalCuenta = 0,
    this.porcentajePropina = 0,
    this.totalPropina = 0,
    this.cantidadPersonas = 2,
    this.totalPorPersona = 0,
  });

  CalculadoraPropinaState copyWith(
      {int? totalCuenta,
      double? porcentajePropina,
      int? cantidadPersonas,
      double? totalPorPersona}) {
    return CalculadoraPropinaState(
        totalCuenta: totalCuenta ?? this.totalCuenta,
        porcentajePropina: porcentajePropina ?? this.porcentajePropina,
        cantidadPersonas: cantidadPersonas ?? this.cantidadPersonas,
        totalPorPersona: totalPorPersona ?? this.totalPorPersona);
  }

  @override
  List<Object?> get props => [
        totalCuenta,
        porcentajePropina,
        totalPropina,
        cantidadPersonas,
        totalPorPersona
      ];
}
