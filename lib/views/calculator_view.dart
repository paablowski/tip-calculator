import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tip_calc/cubit/tip_calc_cubit.dart';
import 'package:intl/intl.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({Key? key}) : super(key: key);

  @override
  _CalculatorViewState createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TipCalcCubit, TipCalcState>(builder: (context, state) {
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
                  context.read<TipCalcCubit>().setBillTotal(value);
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
                            Text(
                              state.people! == 1 ? "Persona" : "Personas",
                              style: Theme.of(context).textTheme.caption,
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
                                        .read<TipCalcCubit>()
                                        .removePeople(),
                                    icon: const Icon(
                                      Icons.remove_outlined,
                                      size: 16,
                                    ),
                                  ),
                                ),
                                Text(
                                  "${state.people}",
                                  style: Theme.of(context).textTheme.bodyText2,
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
                                        .read<TipCalcCubit>()
                                        .addPeople(),
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
                        Text(
                          "\$${state.totalPerPerson}",
                          style: Theme.of(context).textTheme.bodyText2,
                        )
                      ],
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
