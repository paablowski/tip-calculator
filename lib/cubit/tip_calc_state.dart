part of 'tip_calc_cubit.dart';

class TipCalcState {
  int? people;
  int? billTotal;
  double? tipPercentage;
  int? totalPerPerson;

  TipCalcState(
      {this.people, this.billTotal, this.tipPercentage, this.totalPerPerson});

  TipCalcState copyWith({people, billTotal, tipPerceptage, totalPerPerson}) {
    return TipCalcState(
        people: people ?? this.people,
        billTotal: billTotal ?? this.billTotal,
        tipPercentage: tipPercentage ?? this.tipPercentage,
        totalPerPerson: totalPerPerson ?? this.totalPerPerson);
  }
}
