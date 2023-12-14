// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:practice/cost_list.dart';
import 'package:practice/item.dart';
import 'numeric_entry.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item> costs = [];
  double total_Cost = 0;
  bool taxed = false;
  void add_cost(String val) {
    setState(() {
      costs.add(Item(double.parse(val), taxed));
      total_Cost += costs.last.getPrice();
    });
  }

  void set_taxed() {
    setState(() {
      taxed = !taxed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery'),
        backgroundColor: Colors.green[300],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                            child: Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Icon(Icons.attach_money,
                              color: Colors.green[700]),
                        )),
                        TextSpan(
                          text: 'Total',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[700]),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    total_Cost.toStringAsFixed(2),
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[700]),
                  ),
                ],
              ),
            ),
            Expanded(child: CostList(items: costs)),
            NumberInput(
              add_cost: add_cost,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: set_taxed,
        backgroundColor: taxed ? Colors.green[700] : Colors.green[100],
        child: const Icon(Icons.attach_money),
      ),
    );
  }
}
