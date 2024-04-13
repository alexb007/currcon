import 'package:currcon/app/common/constants.dart';
import 'package:currcon/app/screens/home/bloc/home_bloc.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) =>
          HomeBloc()..add(ChangeCurrencyFrom(currencies.first)),
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoaded) {
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
                              value: state.currencyFrom,
                              onChanged: (String? value) =>
                                  BlocProvider.of<HomeBloc>(context)
                                      .add(ChangeCurrencyFrom(value!)),
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
                                        (state.rates[state.currencyTo] ?? 0)),
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
                              value: state.currencyTo,
                              onChanged: (String? value) =>
                                  BlocProvider.of<HomeBloc>(context)
                                      .add(ChangeCurrencyTo(value!)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
            if (state is HomeLoadError) {
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
