import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business/bloc/calculadora_propina_bloc/calculadora_propina_bloc.dart';
import 'presentation/screens/calculator_screen.dart';

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
        create: (context) => CalculadoraPropinaBloc(),
        child: const CalculatorScreen(),
      ),
    );
  }
}
