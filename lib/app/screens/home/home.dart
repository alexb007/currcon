import 'package:currcon/app/common/constants.dart';
import 'package:currcon/app/screens/home/cubit/rates_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final amountController = TextEditingController(text: '1');
  String currencyFrom = currencies[0];
  String currencyTo = currencies[1];
  final RatesCubit cubit = RatesCubit();

  @override
  void initState() {
    super.initState();
    cubit.loadRates(currencyFrom);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RatesCubit>(
      create: (context) => cubit,
      child: Scaffold(
        body: BlocBuilder<RatesCubit, RatesState>(
          builder: (context, state) {
            if (state is RatesLoaded) {
              return SafeArea(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      Text('Currency Converter'),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: amountController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              textAlign: TextAlign.end,
                              onChanged: (value) {
                                setState(() {});
                              },
                            ),
                          ),
                          const SizedBox(width: 8),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              items: currencies
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      ))
                                  .toList(growable: false),
                              value: currencyFrom,
                              onChanged: (String? value) {
                                setState(() {
                                  currencyFrom = value!;
                                });
                                cubit.loadRates(currencyFrom);
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Icon(Icons.arrow_circle_down),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border:
                                    Border.all(color: Colors.black, width: 1),
                              ),
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.all(16),
                              child: Text(
                                NumberFormat().format(
                                    (double.tryParse(amountController.text) ??
                                            0) *
                                        (state.rates[currencyTo] ?? 0)),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              items: currencies
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      ))
                                  .toList(growable: false),
                              value: currencyTo,
                              onChanged: (String? value) {
                                setState(() {
                                  currencyTo = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
            if (state is RatesLoadError) {
              return Center(
                child: Text(state.error),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
