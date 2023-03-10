import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business/bloc/calculadora_propina_bloc/calculadora_propina_bloc.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Total cuenta",
              style: Theme.of(context).textTheme.caption,
            ),
            TextFormField(
              maxLength: 6,
              onChanged: (value) {
                context.read<CalculadoraPropinaBloc>().add(
                    CalculadoraPropinaTotalCuentaCambiado(int.parse(value)));
              },
              style: Theme.of(context).textTheme.bodyText1,
              decoration: const InputDecoration(
                counterText: "",
                border: InputBorder.none,
                hintText: "\$0",
              ),
            ),
            Text(
              "Propina",
              style: Theme.of(context).textTheme.caption,
            ),
            Text(
              "10%",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: const Color.fromRGBO(175, 172, 224, 0.24)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      flex: 1,
                      child: Column(
                        children: [
                          BlocBuilder<CalculadoraPropinaBloc,
                              CalculadoraPropinaState>(
                            builder: (context, state) {
                              return Text(
                                state.cantidadPersonas! == 1
                                    ? "Persona"
                                    : "Personas",
                                style: Theme.of(context).textTheme.caption,
                              );
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 32,
                                width: 32,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.indigo[100],
                                ),
                                child: IconButton(
                                  onPressed: () => context
                                      .read<CalculadoraPropinaBloc>()
                                      .add(
                                          const CalculadoraPropinaPersonaQuitada()),
                                  icon: const Icon(
                                    Icons.remove_outlined,
                                    size: 16,
                                  ),
                                ),
                              ),
                              BlocBuilder<CalculadoraPropinaBloc,
                                  CalculadoraPropinaState>(
                                builder: (context, state) {
                                  return Text(
                                    '${state.cantidadPersonas}',
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  );
                                },
                              ),
                              Container(
                                height: 32,
                                width: 32,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.indigo[100],
                                ),
                                child: IconButton(
                                  onPressed: () => context
                                      .read<CalculadoraPropinaBloc>()
                                      .add(
                                          const CalculadoraPropinaPersonaAgregada()),
                                  icon: const Icon(
                                    Icons.add_outlined,
                                    size: 16,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                  Flexible(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: Theme.of(context).textTheme.caption,
                      ),
                      BlocBuilder<CalculadoraPropinaBloc,
                          CalculadoraPropinaState>(builder: ((context, state) {
                        return Text(
                          "\$${state.totalCuenta}",
                          style: Theme.of(context).textTheme.bodyText2,
                        );
                      }))
                    ],
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
