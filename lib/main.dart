import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tip_calc/cubit/tip_calc_cubit.dart';
import 'package:tip_calc/views/calculator_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Dongle",
        textTheme: const TextTheme(
          // subtitle1: TextStyle(color: Color.fromRGBO(63, 55, 174, 1)),
          bodyText1: TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.bold,
          ),
          bodyText2: TextStyle(
            fontSize: 64,
            color: Colors.indigo,
            fontWeight: FontWeight.bold,
          ),
          caption: TextStyle(fontSize: 26),
        ),
      ),
      home: BlocProvider(
        create: (context) => TipCalcCubit(),
        child: const CalculatorView(),
      ),
    );
  }
}
